# Fav

Fav is a teleporter.

I use this because typing cd followed by six levels of directories every time I want to edit a config file makes me want to throw my laptop into the sea.

Fav lets me save a few of my favourite directory paths for easy access aka ✨ teleportation ✨.

## What ?
Let's say you're working on a project in some deep, annoying path like ~/Documents/web/projects/client-site/assets/img.

1. Tag it

Once you are in that folder, you just type:
fav --add site

2. Move away

Go do something else, like editing your nvim config:
cd ~/.config/nvim

3. Teleport back

Now, instead of typing that whole long path again, you just hit:
f site
And you're back in the assets/img folder.

4. Forgot the name?

If you can't remember if you named the tag "site" or "web", just type:
f
It’ll spit out your list so you can see your options.

## Why not use x y z ? This already exists in A B C !!
I'm glad. I didnt know. So i built this because I want and can and I think it's cool.

## Technicalities
**fav.sh** handles a text file databse. 
The shell function **f handles** the actual moving

## Setup
1. Put fav.sh somewhere and make it executable: chmod +x fav.sh
2. Link it so you can run it from anywhere: sudo ln -s $(pwd)/fav.sh /usr/local/bin/fav
3. Paste this into your .zshrc or .bashrc:
```bash
f() {
    if [ -z "$1" ]; then
        fav --list
    else
        res=$(fav "$1")
        if [ -d "$res" ]; then
            cd "$res"
        else
            echo "$res"
        fi
    fi
}

```
## Usage
- fav --add name - saves your current spot as "name"

- f name - teleports you there

- f - shows your list

- fav --remove name - deletes the bookmark

That's it. It’s light, it works, and it stays out of the way.
