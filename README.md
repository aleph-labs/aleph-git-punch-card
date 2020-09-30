# Git Punch Card

# Prerequisites

- macOS (other operating systems probably work, but has never been tested).
- Python 3. If you're still on Python 2 carefully read and upgrade: https://opensource.com/article/19/5/python-3-default-mac#what-to-do
- Requires git-punchcard. Read: https://pypi.org/project/git-punchcard/

# How to Use

- Clone and cd into repo.
- `chmod +x generate-punch-card.sh`
- `./generate-punch-card.sh <directory e.g ~/Desktop/repos/*/.git> -prefix <project_name> -since <start_date> -until <end_date> -timezone <timezone e.g. UTC+08:00> -interval <interval e.g. 1w>`

That will generate png files for each interval between `since` and `until`.
