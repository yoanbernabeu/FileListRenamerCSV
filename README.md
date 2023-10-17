# FileListRenamerCSV

FileListRenamerCSV is a command-line tool that allows you to list the files in a directory and save them to a CSV file. It can also rename files based on mappings provided in a CSV.

## Features

- List all the files in a given directory and save them to a CSV file with an additional empty column (for renaming).
- Rename files in a directory using a CSV file as a mapping source.

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