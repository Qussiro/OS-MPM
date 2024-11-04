#!/bin/bash

QUERY=$(echo "$@")

for arxiv_id in $QUERY; do
    arxiv_url="https://arxiv.org/abs/${arxiv_id}"
    response=$(curl -s "$arxiv_url")

    if [[ -z "$response" || "$response" == *"not recognized"* || "$response" == *"Invalid article identifier"* ]]; then
        echo "ArXiv ID $arxiv_id is wrong format or couldn't find by this ID."
        continue
    fi

    title=$(echo "$response" | grep -oP '(?<=<meta name="citation_title" content=")[^"]+')
    authors=$(echo "$response" | grep -oP '(?<=<meta name="citation_author" content=")[^"]+' | paste -sd ", " -)
    date=$(echo "$response" | grep -oP '(?<=<meta name="citation_date" content=")[^"]+')
    online_date=$(echo "$response" | grep -oP '(?<=<meta name="citation_online_date" content=")[^"]+' || echo "$date")
    pdf_url=$(echo "$response" | grep -oP '(?<=<meta name="citation_pdf_url" content=")[^"]+')

    # Print the bibliographic information in the specified format
    echo "---"
    echo "title=\"$title\""
    echo "author=\"$authors\""
    echo "date=\"$date\""
    echo "online_date=\"$online_date\""
    echo "pdf_url=\"$pdf_url\""
    echo "arxiv_id=\"$arxiv_id\""
    echo "---"
done
