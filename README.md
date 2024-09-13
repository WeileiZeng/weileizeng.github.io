# Personal website
Author:  Weilei Zeng
Dated: Sept 13th, 2024
First date: May 4th, 2024


Phylosophy of the website project:
To share experience and knowledge everywhere. In order to make the project neat and clean, keep those questions in mind.

- Is the website easy to visit anywhere on earth, smooth and free?
- Is the website easy to build, that even after 10 years, one can get it up in seconds?

project structure
```
Makefile            #
README.md           #
docs                #target folder, root folder for GitHub Pages
env                 #python environment, ignored by git
requirements.txt    #python package dependancy
web                 #source file
web/content         #blog files
web/output          #static files
zurb-F5-basic       #pelican theme
```

# tools
- Python
- Pelican
- Optional:
  - bibtex2html

# procedure to produce the repo
set up environment
```
python3 -m venv env
source env/bin/activate
pip install pelican[markdown] pelican-render-math
#see also requirements.txt for freeze package versions with Python 3.12.3 tested on Mac OS
```
initialize the repo
```
-> % pelican-quickstart
Welcome to pelican-quickstart v4.9.1.

This script will help you create a new Pelican-based website.

Please answer the following questions so this script can generate the files
needed by Pelican.

> Where do you want to create your new web site? [.]
> What will be the title of this web site? minimal web
> Who will be the author of this web site? ZWL
> What will be the default language of this web site? [zh] en
> Do you want to specify a URL prefix? e.g., https://example.com   (Y/n) Y
> What is your URL prefix? (see above example; no trailing slash) https://weileizeng.github.io
> Do you want to enable article pagination? (Y/n) y
> How many articles per page do you want? [10]
> What is your time zone? [Europe/Rome] Asia/Shanghai
> Do you want to generate a tasks.py/Makefile to automate generation and publishing? (Y/n) Y
> Do you want to upload your website using FTP? (y/N) n
> Do you want to upload your website using SSH? (y/N) n
> Do you want to upload your website using Dropbox? (y/N) n
> Do you want to upload your website using S3? (y/N) n
> Do you want to upload your website using Rackspace Cloud Files? (y/N) n
> Do you want to upload your website using GitHub Pages? (y/N) y
> Is this your personal page (username.github.io)? (y/N) y
Done. Your new project is available at /Users/weileizeng/Documents/GitHub/min-web-template/web
```


## Q&A
*How to add blog*

- add a new file in `web/content`. Any subfolder will be seen as a catergory. One can start by duplicating the [template.md](web/content/template.md)

*How to add statics files*

- There are two folders for static files: `content/images` and `output/static`. Static files will stay as it is and not be built. It is good for images, pdf, or html files. use `![](images/my-image.png)` in the markdown file

*How to build and publish*

- First develop  it locally, follow command in [`web/Makefile`](web/Makefile). Try `make devserver` in `web` folder.
- When things get ready, update the built page into [`docs`](docs), following cmd in [`Makefile`](Makefile). Then push the changes to GitHub. One can verify status by visiting the online page, or check out [GitHub Actions](https://github.com/WeileiZeng/weileizeng.github.io/actions). Try `make` in this folder, which do all this automatically.

*How to add formulas*

- see [template](web/about/template-for-post-on-this-website.md)

# Additional modification to the original theme
- add faricon
- add logo
- add author in article bottom
- change link of page header

# Potential issue
- currently the page lives in the root folder. If put in a subfolder, some links may broke.

# TODO:
- show the page using github pages
- update readme
  - theme



