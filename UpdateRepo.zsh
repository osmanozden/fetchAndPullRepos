#!/bin/zsh
cd /Users/{{dir}} || exit

for dir in */; do
    if [[ -d "$dir/.git" ]]; then
        echo "<---UPDATING -->: $dir"
        cd "$dir" || continue

        git fetch

        if git show-ref --quiet refs/heads/main; then
            echo "main branch UPDATING!!"
            git pull origin main
        elif git show-ref --quiet refs/heads/dev; then
            echo "dev  branch UPDATING!!"
            git pull origin dev
        else
            echo "<--CAN NOT FOUND MAIN OR DEV BRANCH!!-->"
        fi

        cd ..
    fi
done