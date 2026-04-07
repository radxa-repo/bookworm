#!/usr/bin/env sh
# Install signing keyring
keyring="$(mktemp)"
version="$(curl -L https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/VERSION)"
curl -L --output "$keyring" \
    "https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/radxa-archive-keyring_${version}_all.deb"
sudo dpkg -i "$keyring"
rm -f "$keyring"
# Add apt package repo
echo "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/bookworm/ bookworm main" | \
    sudo tee /etc/apt/sources.list.d/70-bookworm.list
sudo apt-get update
