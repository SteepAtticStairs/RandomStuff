# RandomShellFiles

Random stuff I made

<br></br>

# Making this a custom command

If you want to access this script from anywhere by only running the name of the script, e.g. by typing `srccd-dw` in your terminal, do this. This is not neccessary, but only for convenience's sake. This has only been tested on MacOS, but it will likely be similar for another Linux/Unix based system.
```
# assuming you have cloned the RandomStuff repo to your Downloads directory,
# this copies WebsiteSourceCode.sh to /usr/local/bin, which is where executables are
# located

# copies WebsiteSourceCode.sh from the repo folder to the Downloads folder
$    cp ~/Downloads/RandomStuff/WebsiteSourceCode.sh ~/Downloads/WebsiteSourceCode.sh
# copies WebsiteSourceCode.sh to /usr/local/bin
$    sudo cp ~/Downloads/WebsiteSourceCode.sh /usr/local/bin/srccd-dw

# gives ownership to root
$    sudo chown root: /usr/local/bin/srccd-dw

# allows it to be readable and executable for everyone
$    sudo chmod 755 /usr/local/bin/srccd-dw
```

If you want to remove a previous `srccd-dw` in `/usr/local/bin`, run
```
sudo rm -rf /usr/local/bin/srccd-dw
```
However, you must always be careful with `sudo rm -rf`, as this can be easily misused on accident.
