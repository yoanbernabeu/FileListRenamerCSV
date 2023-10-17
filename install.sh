#!/usr/bin/env bash

echo "Installing FileListRenamerCSV..."
echo "------------------------"

# Determining the Linux distribution and architecture
distro=$(lsb_release -i -s)
arch=$(uname -m)

echo "Distribution: $distro"
echo "Architecture: $arch"

# FileListRenamerCSV version
version="0.1.0"

echo "Version: $version"
echo "------------------------"

# URL for downloading the archive based on the distribution and architecture
url=""

case "$distro" in
  "Darwin")
    case "$arch" in
      "x86_64")
        url="https://github.com/yoanbernabeu/FileListRenamerCSV/releases/download/${version}/FileListRenamerCSV_${version}_darwin_amd64.tar.gz"
        ;;
      "arm64")
        url="https://github.com/yoanbernabeu/FileListRenamerCSV/releases/download/${version}/FileListRenamerCSV_${version}_darwin_arm64.tar.gz"
        ;;
      *)
        echo "Unsupported architecture"
        exit 1
        ;;
    esac
    ;;
  "Ubuntu"|"Debian"|"Raspbian")
  echo "Downloading FileListRenamerCSV..."
    case "$arch" in
      "i686")
        url="https://github.com/yoanbernabeu/FileListRenamerCSV/releases/download/${version}/FileListRenamerCSV_${version}_linux_386.tar.gz"
        ;;
      "x86_64")
        url="https://github.com/yoanbernabeu/FileListRenamerCSV/releases/download/${version}/FileListRenamerCSV_${version}_linux_amd64.tar.gz"
        echo $url
        ;;
      "arm64")
        url="https://github.com/yoanbernabeu/FileListRenamerCSV/releases/download/${version}/FileListRenamerCSV_${version}_linux_arm64.tar.gz"
        ;;
      *)
        echo "Unsupported architecture"
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unsupported distribution"
    exit 1
    ;;
esac

# Downloading the archive to home directory (and check if url is not 404)
echo "Downloading FileListRenamerCSV..."
wget -q --spider $url
if [ $? -eq 0 ]; then
  wget -O ~/FileListRenamerCSV.tar.gz $url -q --show-progress
else
  echo "------------------------"
  echo "FileListRenamerCSV archive not found"
  echo "------------------------"
  exit 1
fi

# Extracting the archive (if it exists)
echo "Extracting FileListRenamerCSV..."
if [ -f ~/FileListRenamerCSV.tar.gz ]; then
  tar -xzf ~/FileListRenamerCSV.tar.gz -C ~/
else
  echo "FileListRenamerCSV archive not found"
  exit 1
fi

# Removing the archive
echo "Removing archive..."
rm ~/FileListRenamerCSV.tar.gz

# Moving the binary to /usr/local/bin
echo "Moving FileListRenamerCSV to /usr/local/bin..."
sudo mv ~/FileListRenamerCSV /usr/local/bin/

# Making the binary executable
echo "Making FileListRenamerCSV executable..."
sudo chmod +x /usr/local/bin/FileListRenamerCSV

# Sending a message to the user
echo "-----------------------------------------"
echo "FileListRenamerCSV successfully installed"
echo "-----------------------------------------"