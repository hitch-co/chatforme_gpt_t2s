# Voice Assistant Using GPT and ElevenLabs

This repository contains a suite of functions that integrate GPT from OpenAI and the text-to-speech capabilities of ElevenLabs.

## Functions Overview

1. **openai_gpt_chatcompletion**: Fetches responses from OpenAI's GPT-3.5-turbo model based on a provided message dictionary.
2. **generate_t2s_object**: Converts a given text into speech using the ElevenLabs API.
3. **get_voice_ids**: Fetches available voice IDs from the ElevenLabs API.
4. **get_voice_history**: Retrieves the voice generation history from ElevenLabs.
5. **get_user_input**: Captures user input with validation and error-checking.
6. **load_yaml**: Loads configuration parameters from a specified YAML file.
7. **load_env**: Imports environment variables from a .env file.

## Setup

1. Clone the repository.
2. Install the required libraries and packages.
3. Set up your OpenAI API key and ElevenLabs API key in a `.env` file as per the provided format.
4. Run the `voice_t2s.py` script to interact with the system.

## Dependencies

- OpenAI Python Client
- ElevenLabs Python Client
- PyYAML
- dotenv
- argparse
- os

## Usage

Run the `voice_t2s.py` script and follow on-screen prompts to input your text and listen to the generated speech.