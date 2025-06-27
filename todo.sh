#!/bin/bash

TODO_FILE=~/todo.txt

# Create file if it doesn't exist
touch "$TODO_FILE"

while true; do
    echo ""
    echo "===== To-Do List Manager ====="
    echo "1. View all tasks"
    echo "2. Add a new task"
    echo "3. Delete a task"
    echo "4. Exit"
    echo -n "Choose an option: "
    read option

    case $option in
        1)
            echo ""
            echo "Your To-Do List:"
            nl "$TODO_FILE"
            ;;
        2)
            echo -n "Enter the new task: "
            read task
            echo "$task" >> "$TODO_FILE"
            echo "Task added!"
            ;;
        3)
            echo "Enter the task number to delete:"
            nl "$TODO_FILE"
            read tasknum
            sed -i "${tasknum}d" "$TODO_FILE"
            echo "Task deleted!"
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
done
