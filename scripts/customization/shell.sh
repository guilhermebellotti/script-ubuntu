echo "------ Installing plugins terminal..."

mkdir -p ~/.config/fish
cp ~/setup-ubuntu/scripts/customization/config.fish ~/.config/fish
chsh -s /usr/bin/fish

echo_green "Configuration plugins in fish..."
fish ~/setup-ubuntu/scripts/customization/configure-fish.fish

# Starship
curl -sS https://starship.rs/install.sh | sh
curl -fsSL https://bun.sh/install | bash

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin