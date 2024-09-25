#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GENERATE_NUMBER() {
  SECRET_NUMBER=$((RANDOM % 1000 + 1))
}

MAIN_MENU() {
  echo "Enter your username:"
  read USERNAME

  # Check if username exists
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

  # If it doesn't exist, create a new user
  if [[ -z $USER_ID ]]; then
    # Insert new user into DB
    NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

    echo "Welcome, $USERNAME! It looks like this is your first time here."
    
    # Generate the secret number
    GENERATE_NUMBER
  else
    # Get games played
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID';")

    # Get best game (fewest guesses)
    BEST_GUESS=$($PSQL "SELECT COALESCE(MIN(number_of_guesses), 0) FROM games WHERE user_id='$USER_ID';")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
    
    # Generate the secret number
    GENERATE_NUMBER
  fi

  # Prompt user to guess the secret number
  echo "Guess the secret number between 1 and 1000:"
  read NUMBER

  # Verify if the number is an integer
  while ! [[ $NUMBER =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    read NUMBER
  done

  NUMBER_OF_GUESSES=1

  while [[ $NUMBER -ne $SECRET_NUMBER ]]; do
    if [[ $NUMBER -lt $SECRET_NUMBER ]]; then
      echo "It's higher than that, guess again:"
    elif [[ $NUMBER -gt $SECRET_NUMBER ]]; then
      echo "It's lower than that, guess again:"
    fi
    ((NUMBER_OF_GUESSES++))
    read NUMBER

    # Verify if the number is an integer again after each guess
    while ! [[ $NUMBER =~ ^[0-9]+$ ]]; do
      echo "That is not an integer, guess again:"
      read NUMBER
    done
  done

  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  # Insert game result into DB
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES('$USER_ID', '$NUMBER_OF_GUESSES');")
}

# Start the game
MAIN_MENU
