#!/bin/bash

# Session 1: to-do
SESSION1="to-do"
DIR1="$HOME"

# tmux new-session -d -s $SESSION1 -c $DIR1 -n todo
tmux new-session -d -s $SESSION1 -c $DIR1
tmux send-keys -t $SESSION1:0 "todo" C-m
tmux new-window -t $SESSION1:1 -c $DIR1 -n terminal

# Session 2: atlas-fe
SESSION2="atlas-fe"
DIR2="$HOME/Repositories/molonc/atlas-fe"

# Start a new tmux session with the first window
tmux new-session -d -s $SESSION2 -c $DIR2 -n editor
tmux send-keys -t $SESSION2:0 "nvim" C-m

# Create the second window in the same directory
tmux new-window -t $SESSION2:1 -c $DIR2 -n server 
tmux send-keys -t $SESSION2:1 "npm run dev" C-m


# Session 3: atlas-api
SESSION3="atlas-api"
DIR3="$HOME/Repositories/molonc/at1as/"

# Start a new tmux session with the first window
tmux new-session -d -s $SESSION3 -c $DIR3 -n editor
tmux send-keys -t $SESSION3:0 "nvim" C-m

# Create the second window in the same directory
tmux new-window -t $SESSION3:1 -c $DIR3 -n server


# Session 3: atlas api scripts
SESSION4="atlas-scripts"
DIR4="$HOME/Repositories/molonc/atlas-storager/"

# Start a new tmux session with the first window
tmux new-session -d -s $SESSION4 -c $DIR4 -n editor
tmux send-keys -t $SESSION4:0 "nvim" C-m

# Create the second window in the same directory
tmux new-window -t $SESSION4:1 -c $DIR4 -n server

# # Session 4: aparicio-website
# SESSION5="aparicio-website"
# DIR5="$HOME/Repositories/molonc/aparicio_website_src/"

# Session 4: consentDB
SESSION5="consentdb"
DIR5="$HOME/Repositories/molonc/consentdb_fe/"

# Start a new tmux session with the first window
tmux new-session -d -s $SESSION5 -c $DIR5 -n editor
tmux send-keys -t $SESSION5:0 "nvim" C-m

# Create the second window in the same directory
tmux new-window -t $SESSION5:1 -c $DIR5 -n server

# Attach to the TODO session
tmux attach -t $SESSION2:0

