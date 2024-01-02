languages=$(echo "golang python typescript bash javascript" | tr " " "\n")
core_utils=$(echo "tmux" | tr " " "\n")
selected=$(printf "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -r"
else 
    tmux split-window -h bash -c "curl cht.sh/$selected~$query | less -r"
fi

