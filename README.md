# FileListRenamerCSV

FileListRenamerCSV is a command-line tool that allows you to list the files in a directory and save them to a CSV file. It can also rename files based on mappings provided in a CSV.

## Table of Contents

- [FileListRenamerCSV](#filelistrenamercsv)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Quick Start](#quick-start)
  - [Usage](#usage)
    - [Listing Files](#listing-files)
    - [Renaming Files](#renaming-files)
  - [Installation](#installation)
    - [From binary](#from-binary)
    - [From source](#from-source)
  - [License](#license)

## Features

- List all the files in a given directory and save them to a CSV file with an additional empty column (for renaming).
- Rename files in a directory using a CSV file as a mapping source.

## Quick Start

Let's walk through a simple example to demonstrate how `FileListRenamerCSV` can be used:

1. Listing Files in a Directory

Imagine you have a directory named `sample-dir` with the following files:

```bash
doc1.txt
pic.jpg
notes.md
```

To list these files and save them to a CSV:

```bash
FileListRenamerCSV list sample-dir -o output.csv
```

Your output.csv would look something like:

```bash
doc1.txt,
pic.jpg,
notes.md,
```

> Note that there's an additional empty column for potential renaming targets or other annotations.

1. Renaming Files using a CSV

Suppose you have a CSV file (`output.csv`) with the following content:

```bash
doc1.txt,newdoc.txt
pic.jpg,photo.jpg
notes.md,
```

To rename files in `sample-dir` using `output.csv` as a mapping source:

```bash
FileListRenamerCSV rename rename.csv sample-dir
```

After running the above command, the files in `sample-dir` will be renamed as follows:

```bash
newdoc.txt
photo.jpg
notes.md
```

Remember, the first column in the CSV should have the original filename, and the second column should contain the new name.

## Usage

### Listing Files

To list all files in a directory and save them to a CSV:

```bash
FileListRenamerCSV list /path/to/directory -o output.csv
```

This will generate a output.csv file with the filename in the first column and an empty column in the second.

### Renaming Files

To rename files in a directory using a CSV file as a mapping source:

```bash
FileListRenamerCSV rename /path/to/csv.csv /path/to/directory
```

Make sure the CSV file has the original filename in the first column and the new name in the second column.

## Installation

### From binary

* Linux/Darwin

_Using cURL_

```bash
wget -qO- https://raw.githubusercontent.com/yoanbernabeu/FileListRenamerCSV/main/install.sh | bash
```

_Using wget_

```bash
curl -sL https://raw.githubusercontent.com/yoanbernabeu/FileListRenamerCSV/main/install.sh | bash
```

* Windows (Not tested): Download the [latest release](https://github.com/yoanbernabeu/FileListRenamerCSV/releases)

### From source

> FileListRenamerCSV is written in Go, so you need to install it first.

```bash
git clone git@github.com:yoanbernabeu/FileListRenamerCSV.git
cd FileListRenamerCSV
go build -o FileListRenamerCSV
```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

![Logo FileListRenamerCSV](logo.png)
