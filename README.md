# xbps-fzf


A script using fzf on void, to search the available packages in your enabled repositories
and install them. Or search for installed packages to remove

I still need to change this read me to be fully accurate. I'm basing this off my efinder project.
But it's adapted to work on void. It should be mostly screenshots that need to be changed currently.

### Launced in install mode:  

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/982969ba-e7e5-4b9f-85a3-6407a25bd4fe" />

### With the preview on the right:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/84e9f1fb-69eb-4e01-91c7-0ff54e98f52d" />

### Launched in remove mode:

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b2bfbddd-ee1b-4f35-87dd-a64b2b0f9b8f" />

## Usage

When launched by default with no options it will install packages, with -r it will remove them.  

Usage:
To search through the packages available in your enabled repos.
```bash
$ xbps-fzf
```
To search through the packages available in your enabled repos, searching by description.
```bash
$ xbps-fzf -d
    or
$ xbps-fzf --description
```
To look through your manually installed packages for packages to remove packages
(or just search your installed packages if you press escape it exits)
```bash
$ xbps-fzf -r
    or
$ xbps-fzf --remove
```
for a help message with the extra keybinds
```bash
$ xbps-fzf -h
    or
$ xbps-fzf --help
```

<br>

### Keybinds:

You can use tab to select multiple packages, then press enter.
To exit without selecting anything to install, or remove press Escape.

Toggle the preview window with alt-p. 

Toggle the preview window position with alt-space.

Change the preview window to show dependencies with alt-d

Change it to show use flags with alt-u.

If the package is installed, you can use alt-f to show a tree view of all the 
files installed by that package.

<br>
   
## fzf tips.

When you have xbps-fzf open to change the way fzf searches you can use a few different methods.

By quoting a string you will enable exact-match mode.
Meaning if you quote your search it will search for that exact string instead of fuzzy searching.
like so 
```
$ 'dwm
```
Adding the single quote can be especially useful for short strings like this. 
Because otherwise it might not narrow the results down enough.

In this case it instead of getting results like these.

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0f446081-da60-4e6d-b883-edab44694fb0" />

<br>

You narrow down the results to just those directly matching like so:

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e962194a-509f-467d-95cc-e473d96c9cc3" />

<br>

To add another example of how to modify search results. You can use an exclamation mark to exclude results matching what comes after it.
So if you were to add this, to the search in the above example.


```
$ !sec
```

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/86526c05-7353-41a0-bf45-35fa3c94b537" />


<br>

You can see now that line is no longer showing up as a result.

Something else that can be useful is the "or" opperator. Which is this pipe symbol "|"

To show an example we can take the same search as before for dwm. And add this after.F

```
$ 'dwm | i3lock
```
And it will search for i3lock along with our first search like so:

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0916da65-e08e-42ea-ae56-431baf1fd105" />

<br>

Here are some useful keybinds built into fzf.

If you like using vim like motions you can move up and down with

* control-j : to move down

* control-k : to move up

If you want to scroll up and down in the preview window you can press.

* control-up : To scroll up

* control-down : To scroll down

As mentioned above you can select multiple Items by hitting the tab key. To deselect those  you just move back up and hit tab again.

You can press Escape to exit the script without taking any action.

Or to select something to either install or remove, you can press enter while that item is selected.

Of if you have chosen multiple them pressing enter after you have selected those with tab.

<br>

There is a lot more useful information in the man page for fzf. And even more useful information on FZF's github page. And even more
information scattered across the web. I highly recommend at least checking out fzf's repo if not the manpage also.

[The fzf project](https://github.com/junegunn/fzf)

<br>

## Installation

Dependencies:

- fzf (it is a fzf script after all)

<br>

### Using the install.sh for installation.

<br>

First git clone the repo wherever you would like to my suggestion is ~/.local/src
```
$ git clone https://github.com/blankyblank/xbps-fzf.git
```
```
$ cd xbps-fzf
```
If you want to use a stable release instead of the main branch.
```
$ git checkout v0.1beta
```
to install it as a normal user.
```
$ ./install.sh -i
```
then add .local/bin to your path, in your shell config file like so
~/.bashrc
```
PATH=$PATH:"$HOME"/.local/bin
```
To install it system wide you just need to use sudo and it will be placed in /usr/local/bin
```
$ sudo ./install.sh -i
```
To uninstall 
```
$ ./install.sh -u
```
or systemwide
```
$ sudo ./install.sh -u
```
<br>

### Manual installation

<br>

To install it either git clone the repo
```
$ git clone https://github.com/blankyblank/xbps-fzf.git
```

Or download the xbps-fzf file.

If you cloned it, change directories to where you cloned it with

```
$ cd xbps-fzf
```
Make it executable with
```
$ chmod +x xbps-fzf
```
Then add it somewhere on your path. My recommendation is:

If it doesn't already exist
```
$ mkdir ~/.local/bin
```
Add to your .bash_profile, or .bashrc (or whatever shell you use.)

```
PATH=$PATH:"$HOME"/.local/bin
```

Then move xbps-fzf to that directory.
```
$ mv xbps-fzf ~/.local/bin
```
If you git cloned it you can make a symlink to it.
You will use the full path to the xbps-fzf script. So if it's currently in
your home direcory in the cloned git repo
```
$ ln -s ~/xbps-fzf/xbps-fzf ~/.local/bin/
```
