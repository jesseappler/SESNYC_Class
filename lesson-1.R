## Configure git

system("git config --global user.name 'Jesse Appler'")
system("git config --global user.email 'jessica.appler@hhs.gov'")

## Set a new origin URL

system('git remote set-url origin https://github.com/jesseappler/SESNYC_Class.git')

## Pushing updates just to update if things go wonky trying to make Rstudio work
## Go to Tools --> shell and type git push