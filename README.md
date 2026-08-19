# colorpicker

A small tool for X11 that writes the color value on your screen at the cursor
position to stdout, in RGB.

NOTICE: This fork contains changes in the Makefile to make it more portable across systems and 3 patches from other forks that enhance functionality.

### Usage

Left click to print the pixel color, any other mouse click to quit the program.

#### One Shot

In order to just select one pixel run colorpicker with the `--one-shot` option.
The program will then quit after the first click and copy selection to clipboard (via patch from @i5o).

#### Output Format

By default the program prints out the color in RGA format and in hexadecimal.
Here is an example:
```
R:  44, G: 190, B:  78 | Hex: #2CBE4E
```

With the help of the `--short` option you can force colorpicker to just
print out the hexadecimal value. Then you just get: `#2CBE4E`.

#### Color Preview

colorpicker allows you to show a preview of the color the currently hovered
pixel in a rectangle. This rectangle is located at the bottom left of your
screen by default. This comes in handy in combination with the `--one-shot` option so you don't pick blindly a color. Just add the `--preview` option for this feature.
If you want to actually change size or where the rectangle window is displayed add `=WxH+X+Y` after `--preview`.

#### Examples

```sh
# Pick a color and put the hexadecimal value in your clipboard
$ colorpicker --short --one-shot | xsel -b

# Pick a color with preview and put the hexadecimal value in your clipboard
$ colorpicker --short --one-shot --preview | xsel -b

# Pick a color and put the hexadecimal value in your clipboard (using @i5o's patch)
$ colorpicker --one-shot

# Pick a color with a 100x100 preview window at top left (using @vimist's patch)
$ colorpicker --short --one-shot --preview=100x100+50+900
```

### Dependencies

* GTK/GDK 2.0
* X11
* Xcomposite
* Xfixes

In Ports-based systems (Some BSDs) it would be:
`pkg install gtk2 gdk-pixbuf2 gdk-pixbuf-xlib libX11 libXcomposite libXfixes`

### License

MIT

### Patches/Credits

This fork contains 3 main patches to improve it, being them:

- #4 [Fix GTK callback error](https://github.com/Jack12816/colorpicker/pull/4) by @vinnydiehl
It fixes code logic, avoiding errors and preventing leaks
- #3 [Added user definable position for preview window](https://github.com/Jack12816/colorpicker/pull/3) by @vimist
It adds support for setting window geometry for the `--preview` flag window (can generate artifacts apparently)
- #2 [Copy color to clipboard on selection](https://github.com/Jack12816/colorpicker/pull/2) by @i5o
It allows to the program to copy hex values to clipboard without having to use `xsel` when using flag `--one-shot` and not `--short`

Both functionalities from patches #3 and #2 can be used together!
Thanks to everyone who made changes to the code/patches, my only patch is to change the Makefile.