title: GitList on Dreamhost
date: 2014/05/21
categories:
- Tutorials
---

Having a git repository is extremely convenient for version control, and to keep your work in a single location if you're working from multiple machines. If you have a web server hosting your files already you may want to maximize it by adding a web interface to your repository. That's where GitList comes in. It's a nice front end for your repository written in PHP by Klaus Silveira and can be downloaded here. It allows you to display multiple branches, multiple repositories, and supports syntax highlighting for many languages.

Installation is also extremely easy, just download the archive and extract it to the directory where you want to place GitList. Then, rename the config.ini-example file to config.ini and open it to configure your installation. The only major changes that need to be made are to change "repositories[]" to point to the location of your repositories (mine are located in a folder called repositories on my git sub-domain so the line reads "repositories[] = '~/git.aaronscottgriffin.com/repositories'"). You can also change the default branch line if you want something other than master to be displayed when the repository is first opened. The finished product should look something like this: 

![Gitlist](/images/gitlist1.png)
