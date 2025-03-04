# Bash script to initalize a new mac with my usual go-to defaults

# Install OMZSH
echo "Installing OMZSH:"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Homebrew:"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Setup xcode for git etc"
xcode-select --install

# Extract work email from command line arg if provided
if [ ! -z "$1" ]; then
    if [[ "$1" =~ ^work= ]]; then
        work=$(echo "$1" | cut -d'=' -f2)
        if [ -z "${work}" ]; then
            echo "Error: work email cannot be empty (format: work=email@domain.com)"
            exit 1
        fi
    else
        echo "Error: Invalid argument format (expected: work=email@domain.com)"
        exit 1
    fi
fi

BASE_URL="https://raw.githubusercontent.com/hamlim/dotfiles/refs/heads/main"

echo "Downloading config files from GitHub..."

echo "Downloading aliases..."
curl -fsSL "${BASE_URL}/aliases" -o ~/.aliases

echo "Downloading gitconfig..."
curl -fsSL "${BASE_URL}/gitconfig" -o ~/.gitconfig

echo "Downloading zshrc..."
curl -fsSL "${BASE_URL}/zshrc" -o ~/.zshrc

echo "Setting up Git configs"
if [ ! -z "${work}" ]; then
  echo "Downloading gitconfig-work..."
  curl -fsSL "${BASE_URL}/gitconfig-work" -o ~/.gitconfig-work
  sed -i '' "s/TODO/${work}/" ~/.gitconfig-work
fi
echo "Downloading gitconfig-personal..."
curl -fsSL "${BASE_URL}/gitconfig-personal" -o ~/.gitconfig-personal

# Warp
echo "Installing Warp themes"
mkdir -p ~/.warp
cd ~/.warp
git clone https://github.com/warpdotdev/themes.git
cd ~/

# Install common homebrew flasks
echo "Installing common homebrew flasks"
brew install \
  git-filter-repo \
  git-lfs \
  hey \
  bat \
  htop \
  tree \
  eza \
  hyperfine \
  fnm \
  ripgrep \
  gh \
  nushell \
  spr \
  fzf \
  git-branchless \
  jq \
  delta \
  git-delta \
  lazygit \
  mergestat \
  mkcert

  
echo "Setting up working directories"
mkdir -p ~/dev
mkdir -p ~/dev/work
mkdir -p ~/dev/personal

echo "Setting up GitHub CLI"
gh auth login

echo "Setting up better screenshots"
mkdir -p ~/bin
curl -fsSL "${BASE_URL}/better-screenshot.sh" -o ~/bin/better-screenshot
chmod +x ~/bin/better-screenshot