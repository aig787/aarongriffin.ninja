title: Git Repository with Dreamhost
date: 2014/05/20
---

Over the weekend I decided to look into setting up something that would handle version control for school projects so I would have something to roll back to if I needed. I liked the idea of a GitHub account, but wanted more control so I settled on a self hosted git repository. Fortunately through Dreamhost I already have access to the git binaries and didn't have to compile it myself.  You can check to see if it is installed by default with the "whereis" command while using SSH to access your server. If it isn't you can download the source here.
  
``` bash
~:$ whereis git
git: /usr/bin/git /usr/share/man/man1/git.1.gz
```

I also decided to create a new sub-domain for the repository to live on. Dreamhost makes this easy through the control panel, you just login with your account and click Add New Domain/Sub-Domain.

I'm planning on having multiple repositories so in the root of my sub-domain folder I created an additional folder to hold them. To create your firste repository on the server enter "mkdir git-repo" replacing git-repo with whatever you want your repository to be called. Enter your new folder with "cd git-repo" and initialize it with "git init --bare".

``` bash
~:$ mkdir git-repo
~:$ mkdir cd git-repo
~:$ git init --bare
Initialized empty Git repository in <repositories>/git-repo/
```

To create the local repository (on your work machine) either create a new directory or cd into an existing one with the files you want to include in the repository. Initialize the repository with "git init". The "touch .gitignore" command creates a file that allows you to specify what types of files in the directory actually get committed to the repository (http://help.github.com/articles/ignoring-files). Enter "git add ." to add all files and folders in the current directory to the list of items to be committed and finally "git commit" to commit the changes.
``` bash
~:~/Documents$ mkdir git-repo
~:~/Documents$ cd git-repo
~:~/Documents/git-repo$ git init
Initialized empty Git repository in ~/Documents/git-repo/.git/
~:~/Documents/git-repo$ touch .gitignore
~:~/Documents/git-repo$ git add .
~:~/Documents/git-repo$ git commit
```

Now that your local and remote repositories are set up independently it's time to link them together. Add your remote repository with "git remote add origin usr@host/path-to-repo" with path-to-repo being the full path to your repository. If you aren't sure where that is you can use the "pwd" command in your server repository to print the current directory.
``` bash
:~/Documents/git-repo$ git remote add origin ssh://user@host/home/username/git-repo
```

After you have the remote destination set, pushing your local repository to the remote one is as easy as "git push origin master" (if you want to push to another branch you can create it with "git checkout branch-name" and replace master with the new branch).

This sets up a basic repository without a web interface or a way to access your files outside of the command line (or client software). In the next tutorial I will go over setting up GitList as a web interface for your repository and configuring the gitwatch script on your local machine to automate commits and pushes. 
