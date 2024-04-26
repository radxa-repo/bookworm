# bookworm

[![Update packages](https://github.com/radxa-repo/bookworm/actions/workflows/update.yaml/badge.svg)](https://github.com/radxa-repo/bookworm/actions/workflows/update.yaml)

## Usage

```bash
temp="$(mktemp)"
version="$(curl -L https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/VERSION)"
curl -L --output "$temp" "https://github.com/radxa-pkg/radxa-archive-keyring/releases/latest/download/radxa-archive-keyring_${version}_all.deb"
sudo dpkg -i "$temp"
rm -f "$temp"
source /etc/os-release
sudo tee /etc/apt/sources.list.d/20-radxa.list <<< "deb [signed-by=/usr/share/keyrings/radxa-archive-keyring.gpg] https://radxa-repo.github.io/bookworm/ $VERSION_CODENAME main"
sudo apt-get update
```
