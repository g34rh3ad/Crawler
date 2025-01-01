#!/bin/bash

# Banner
echo "  ___ _ __ __ ___      _____ _ __ "
echo " / __| '__/ _\` \ \ /\ / / _ \ '__|"
echo "| (__| | | (_| |\ V  V /  __/ |   "
echo " \___|_|  \__,_| \_/\_/ \___|_|   "
echo "                         @g34rh3ad"

# Display usage information
display_help() {
    echo "crawler.sh: A script to crawl URLs using waybackurls"
    echo "Usage: crawler.sh -u <sitename>"
    echo "       crawler.sh -s config"
    echo "       crawler.sh -s db"
    echo "Options:"
    echo "  -u <sitename>    Specify the site name to crawl URLs"
    echo "  -s <pattern>     Search for a specific pattern in the crawled URLs"
    exit 0
}

# Check for required tools
check_dependencies() {
    if ! command -v waybackurls &> /dev/null; then
        echo "Error: 'waybackurls' is not installed. Install it using: go install github.com/tomnomnom/waybackurls@latest"
        exit 1
    fi

    if ! command -v anew &> /dev/null; then
        echo "Error: 'anew' is not installed. Install it using: go install github.com/tomnomnom/anew@latest"
        exit 1
    fi
}

# Crawl URLs
download_urls() {
    local sitename=$1
    local output_file="url.txt"

    echo "Crawling URLs for: $sitename"
    echo "$sitename" | waybackurls | anew "$output_file"

    if [ -s "$output_file" ]; then
        echo "URLs successfully saved to $output_file."
    else
        echo "No URLs found for $sitename."
    fi
}

# Search URLs
search_urls() {
    local pattern=$1
    local input_file="url.txt"

    if [ ! -f "$input_file" ]; then
        echo "Error: $input_file not found. Run the tool with -u <sitename> first to generate URLs."
        exit 1
    fi

    echo "Searching for pattern: $pattern"
    grep "$pattern" "$input_file" || echo "No matches found for pattern: $pattern"
}

# Main script
if [ $# -eq 0 ]; then
    display_help
fi

while getopts ":u:s:h" opt; do
    case $opt in
        u)
            sitename=$OPTARG
            ;;
        s)
            pattern=$OPTARG
            ;;
        h)
            display_help
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            display_help
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            display_help
            ;;
    esac
done

if [ -n "$sitename" ]; then
    # Check dependencies
    check_dependencies

    # Crawl URLs
    download_urls "$sitename"
elif [ -n "$pattern" ]; then
    # Search URLs
    search_urls "$pattern"
else
    echo "Error: Either a site name (-u) or a search pattern (-s) is required."
    display_help
fi
