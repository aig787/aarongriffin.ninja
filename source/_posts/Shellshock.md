title: Shellshock
date: 2014-11-05 20:27:54
tags: Exploits
categories: Security
---

It's been a little while since the ShellShock vulnerability (CVE-2014-6271, CVE-2014-6277, CVE-2014-6278, CVE-2014-7169, CVE-2014-7186, CVE-2014-7187) was released, but I want to share the proof of concept app I wrote shortly after it was released to show a coworker why it was relavent. The example app can be found on GitHub [here](https://github.com/aig787/Personal/tree/master/Examples/CVE-2014-6271) so you can check out the (albeit short and simple) source code if you want.

The example I read and heard most often when talking about the vulnerability was that if people were using bash scripts for their CGI (which means they're basically asking for it) but that isn't particularly interesting and doesn't feel relevant to me. Because the exploit affects everything that uses bash, it makes other applications and languages vulnerable simply because they use a foundational tool of sysadmins and programmers.

Python is a widely used language for many things, including web development because of frameworks like Django and Bottle/Flask. It turns out all you need to get arbitrary code execution with a Bottle web application is a lazy programmer, a questionable choice by the operating system, and ShellShock. Many (most) Linux distributions have sh symlinked to bash. Ordinarily this wouldn't be a problem, but in this instance it exposed many thing to the vulnerability than should have been. 

The web app I used for the proof of concept is a simple utility to check for running processes on the server. It seems a little bit convoluted, but it really isn't, I've seen sites like this all over the real world including recently at my university. Now, why was the developer lazy?

```python
out = subprocess.check_output('ps -ef | grep ' + process, shell=True)
```

The mistake in this line should be glaringly obvious. The best practice for using the subprocess module in Python includes two fixes: not running it in a shell, and splitting the parameters up in a list before passing them in. This takes more work, especially in this example because it would require a few more calls to subprocess to handle the piping, and the user input would need to be validated. Fixing this alone would result in the application doing what you expected it to.

The other bit that would stop this exploit from working is not symlinking sh to bash. Arch Linux, Fedora, and every other distribution I looked at except surprisingly enough Ubuntu had that. By default, even with the shell=True option set, Python will try to bring open sh shell (principle of least privilege) and because sh isn't affected by this particular vulnerability everything would have been fine.

Now on to the exploit itelf.
```
 "123456789"; env x='() { :;}; echo $(<your command here>) ' bash -c "echo this is a test"  
```
If this string is entered into the input box whatever is entered in for <your command here> will be executed in the context of the user running the webserver. Since we know our programmer is lazy it isn't hard to believe the user will be running with more privilege than it needs. 

And there we have arbitrary code execution. If they have the app running as root, it's game over. Password hashes can be catted to the screen and broken. Even if it's running as an unprivileged user there's a lot you can get away with.
