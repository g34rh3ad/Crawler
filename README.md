# Crawler

## Description
**Crawler** is a lightweight Bash script for crawling and filtering URLs from the Wayback Machine. It leverages tools like `waybackurls` and `anew` to provide an efficient way to collect historical URLs for a given domain and filter them based on specific patterns. The tool is ideal for penetration testers, OSINT practitioners, and web application security researchers.

## Features
- Crawl URLs from a specified site using `waybackurls`.
- Filter and search for specific patterns in the crawled URLs.
- Easy-to-use command-line interface.
- Displays helpful usage information when needed.

## Prerequisites
Before using this tool, ensure the following dependencies are installed on your system:

1. [waybackurls](https://github.com/tomnomnom/waybackurls)
   ```bash
   go install github.com/tomnomnom/waybackurls@latest
   ```

2. [anew](https://github.com/tomnomnom/anew)
   ```bash
   go install github.com/tomnomnom/anew@latest
   ```

## Installation
Clone the repository and navigate to the folder:
```bash
git clone <repository_url>
cd <repository_name>
chmod +x crawler
```

## Usage
### Basic Commands
#### Crawl URLs
```bash
./crawler -u <sitename>
```
This command crawls URLs for the specified site and saves them into `url.txt`.

#### Search for a Pattern
```bash
./crawler -s <pattern>
```
Searches for the specified pattern in the `url.txt` file.

### Example
#### Crawling URLs
```bash
./crawler -u example.com
```
#### Searching for Patterns
```bash
./crawler -s config
./crawler -s db
```

## File Structure
- `crawler`: The main script.
- `url.txt`: The file where crawled URLs are saved.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Author
@g34rh3ad

