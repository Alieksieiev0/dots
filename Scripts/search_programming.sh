found=$(find ~/Programming ~/.config/nvim -maxdepth 3 -type d -print)
results=$(echo "$found" | fzf)
if [ "$TERM" = "tmux-256color" ]; then
    cd $results
else
    tmux new-session -c $results
fi
