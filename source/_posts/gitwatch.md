title: Automatic Commits with Gitwatch
date: 2014/05/22
---

The final tool I use is a script called gitwatch. It is a handy little script that ties in with the inotify-tools package on Linux machines to automatically commit and push changes every time a specific file or directory is modified. It can be downloaded here, you will also need the inotify-tools package (for Ubuntu and Debian, it may be called something different for other distributions). Once the script is downloaded change the properties to make it executable. It can be run from your Downloads folder (or anywhere really) if you like, but I like to clear out my Downloads folder periodically, so I moved it to /usr/bin. You'll probably need root permissions to write to that directory so move it with the command "sudo mv gitwatch.sh /usr/bin" from the directory where gitwatch.sh is located.

The next step is to have it run when you login. ON Ubuntu click the Ubuntu button in the upper left hand corner and search for startup applications. Click the add button and enter "Gitwatch" for the name field. In the command field enter "/usr/bin/gitwatch.sh -b [branch] -p [remote] [directory]" without quotes and replaceing [branch] with the branch you want to commit, [remote] with the address of your hosted repository (if you followed the original tutorial we called it origin), and [directory] with the full file path of the folder to watch i.e. don't use ~/ as a shortcut or it won't execute correctly on startup. Enter any comments you wish for the comments field and click add. When you restart your computer the script should now run in the background and perform auto-commits whenever files are changed. 

![Gitwatch](images/gitwatch1.png)
