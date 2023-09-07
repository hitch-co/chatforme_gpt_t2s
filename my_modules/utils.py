#########################################
def get_user_input(predefined_text=None):
    """
    Get user input with basic error-checking.

    Parameters:
    - predefined_text (str): A predefined text that can be used in lieu of user input.

    Returns:
    str: Validated user input or the predefined text.
    """
    while True:
        # Check predefined text
        if predefined_text:
            user_text = predefined_text
            predefined_text = None  # Clear it after using once to ensure next iterations use input
        else:
            user_text = input("Please enter the gpt prompt text here: ")

        # 1. Check for empty input
        if not user_text.strip():
            print("Error: Text input cannot be empty. Please provide valid text.")
            continue

        # 2. Check for maximum length
        max_length = 100
        if len(user_text) > max_length:
            print(f"Error: Your input exceeds the maximum length of {max_length} characters. Please enter a shorter text.")
            continue

        # 3. Check for prohibited characters
        prohibited_chars = ["@", "#", "$", "%", "&", "*", "!"]
        if any(char in user_text for char in prohibited_chars):
            print(f"Error: Your input contains prohibited characters. Please remove them and try again.")
            continue

        # 4. Check if string contains only numbers
        if user_text.isdigit():
            print("Error: Text input should not be only numbers. Please provide a valid text.")
            continue

        # 5. Check for profanities
        profanities = ["idiot", "loser", "asshole"]
        if any(word in user_text.lower() for word in profanities):
            print("Error: Please avoid using inappropriate language.")
            continue
            
        return user_text
    

#Load parameters from config.yaml
def load_yaml(yaml_filename='config.yaml', yaml_dirname='config', is_testing=False):
    import yaml
    import os
    import logging
    """
    Load parameters from a YAML file.

    Parameters:
    - yaml_filename (str): Name of the YAML file to be loaded.
    - yaml_dirname (str): Directory path containing the YAML file.
    - is_testing (bool): Flag to indicate if the function is being run for testing purposes.

    Returns:
    dict: Dictionary containing parameters loaded from the YAML file.
    """

    #is_testing = True
    if is_testing == True:
        yaml_dirname='C:\_repos\chatforme_bots\config'
        yaml_filename='config.yaml'

    print(yaml_dirname)
    # use the argument instead of hardcoding the path
    yaml_filepath = os.path.join(os.getcwd(), yaml_dirname, yaml_filename)
    print(yaml_filepath)
    with open(yaml_filepath, 'r') as file:
        yaml_config = yaml.safe_load(file)
        logging.info('YAML contents loaded successfully.')
    return yaml_config


#Loads environment variables from config.env
def load_env(env_filename='config.env', env_dirname='config', is_testing=False):
    import dotenv
    import os
    import logging
    """
    Load environment variables from a .env file.

    Parameters:
    - env_filename (str): Name of the .env file.
    - env_dirname (str): Directory path containing the .env file.
    - is_testing (bool): Flag to indicate if the function is being run for testing purposes.
    """
    
    #is_testing = True
    if is_testing ==True:
        env_filename='config.env' 
        env_dirname='C:\_repos\chatforme_bots\config'

    env_filepath = os.path.join(os.getcwd(), env_dirname, env_filename)
    print(env_filepath)
    if dotenv.load_dotenv(env_filepath):
        logging.info('Environment file loaded successfully.')
    else:
        logging.error('Failed to load environment file.')


def join_paths(dirname, filename, endfile='users.txt'):
    print("did something")


