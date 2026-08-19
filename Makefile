.PHONY: clean all

# Using backticks for command substitution (POSIX/BSD Make compatibility)
CFLAGS = `pkg-config --cflags gtk+-2.0 gdk-2.0 x11 xcomposite xfixes`
LDFLAGS = `pkg-config --libs gtk+-2.0 gdk-2.0 x11 xcomposite xfixes`

all: colorpicker

colorpicker: main.c
	cc -o colorpicker main.c $(CFLAGS) $(LDFLAGS)

clean:
	rm -f colorpicker
