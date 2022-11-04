#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

USER_CHECKER () {
  USER_PRESENCE=$($PSQL "SELECT username FROM user_details WHERE username='$USERNAME'")
  if [[ -z $USER_PRESENCE ]]
  then
    ADDING_USER=$($PSQL "INSERT INTO user_details(username,games_played,best_game) VALUES('$USERNAME',0,0);")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$( echo $($PSQL "SELECT games_played FROM user_details WHERE username='$USERNAME';") | sed 's/ +//' )
    BEST_GAME=$( echo $($PSQL "SELECT best_game FROM user_details WHERE username='$USERNAME';") | sed 's/ +//' )
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

GAME_WINING (){
  echo "You guessed it in $GUESSINGS tries. The secret number was $RANDOM_NUM. Nice job!"
  NUMBER_OF_GUESSES=$($PSQL "SELECT best_game FROM user_details WHERE username='$USERNAME';")

  if [[ $NUMBER_OF_GUESSES < 1 ]]
  then
    ADD_BEST_GAME=$($PSQL "UPDATE user_details SET best_game=$GUESSINGS WHERE username='$USERNAME';")
  else
    if [[ $NUMBER_OF_GUESSES > $GUESSINGS ]]
    then
      ADD_BEST_GAME=$($PSQL "UPDATE user_details SET best_game=$GUESSINGS WHERE username='$USERNAME';")
    fi
  fi
  
}

GUESS_GAME() {
  read GUESS
  GUESSINGS=$(( $GUESSINGS + 1 ))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS_GAME 
  else
    if [[ $GUESS != $RANDOM_NUM ]]
    then
      if [[ $GUESS > $RANDOM_NUM ]]
      then
        echo "It's lower than that, guess again:"
        GUESS_GAME
      else
        echo "It's higher than that, guess again:"
        GUESS_GAME
      fi
    else
      GAME_WINING $GUESSINGS $RANDOM_NUM $USERNAME
    fi
  fi
}

RANDOM_NUM=$(( 1 + $RANDOM % 1000 ))

echo "Enter your username:"
read USERNAME

USER_CHECKER $USERNAME
USER_GM_PLAYED=$($PSQL "SELECT games_played FROM user_details WHERE username='$USERNAME';")
GM_PLAYED=$($PSQL "UPDATE user_details SET games_played=$(( $USER_GM_PLAYED+ 1)) WHERE username='$USERNAME';")

echo "Guess the secret number between 1 and 1000:"
GUESS_GAME $USERNAME $RANDOM_NUM