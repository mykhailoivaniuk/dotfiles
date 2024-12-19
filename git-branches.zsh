# Function to checkout a recent Git branch using fzf
gco_recent() {
  # List all local branches sorted by most recent commit date
  local branches
  branches=$(git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | head -n 20)

  if [[ -z "$branches" ]]; then
    echo "No branches found."
    return 1
  fi

  # Use fzf to select a branch
  local selected_branch
  selected_branch=$(echo "$branches" | fzf --prompt="Select a branch to checkout: ")

  # If a branch was selected, attempt to checkout
  if [[ -n "$selected_branch" ]]; then
    # Verify the branch exists
    if git show-ref --verify --quiet "refs/heads/$selected_branch"; then
      git checkout "$selected_branch"
      if [[ $? -eq 0 ]]; then
        echo "Checked out to branch '$selected_branch'."
      else
        echo "Failed to checkout to branch '$selected_branch'."
      fi
    else
      echo "Branch '$selected_branch' does not exist."
    fi
  else
    echo "No branch selected."
  fi
}

alias gj="gco_recent"
