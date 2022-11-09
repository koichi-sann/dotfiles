/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;
static int fuzzy = 1;       /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;    /* -c option; centers dmenu on screen */
static int min_width = 700; /* minimum width when centered */

/* -fn option overrides fonts[0]; default X11 font or font set */

static const char *fonts[] = {
  "'VictorMono Nerd Font':size=16"
};
static const char *prompt = NULL;
static const char *colors[SchemeLast][2] = {
    /*                  fg         bg       */
    [SchemeNorm] = {"#FFFFFF", "#222222"},
    [SchemeSel] = {"#000000", "#FFFFFF"},
    [SchemeSelHighlight] = {"#ffaaff", "#000000"},
    [SchemeNormHighlight] = {"#ffffff", "#000000"},
    [SchemeOut] = {"#000000", "#00ffff"},
    [SchemeMid] = {"#000000", "#ffaaff"}
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */

static unsigned int lines = 20;
static unsigned int lineheight = 30;
static unsigned int min_lineheight = 25;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */

static const char worddelimiters[] = " ";

/* Size of the window border */

static unsigned int border_width = 3;
