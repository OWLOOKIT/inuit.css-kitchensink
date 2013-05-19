# INUIT.CSS KITCHEN SINK

A list of [Inuit.css](http://inuitcss.com/) component examples cobbled together from the css documention and inuit.css's [JsFiddle](http://jsfiddle.net/user/inuitcss/fiddles/) examples. The page contains minimal styling so components are pretty much as is from the Inuit.css framework. Code is from the [v5.1.0](https://github.com/csswizardry/inuit.css/tree/v5.1.0) branch used. View it online at [http://terabytenz.github.io/inuit.css-kitchensink/](http://terabytenz.github.io/inuit.css-kitchensink/).

## How to install and run

1. Run `git clone --recursive https://github.com/terabytenz/inuit.css-kitchensink.git dir-name` to check out the project and the Inuit.css submodule
2. Windows folks, make sure you have [Ruby](http://rubyinstaller.org/) installed
3. Install [Sass](http://sass-lang.com/download.html)
4. Install [Node](http://nodejs.org/)
5. Install [Docpad](http://docpad.org/docs/install)
6. From the root directory
    1. Run `npm install` to install the required plugins
    2. Run `docpad run` to start the server
    3. If you need to edit the CSS run `sass --watch src/files/css/style.scss:src/files/css/style.css --style expanded` or run `sass-watch.bat` on Windows. I've had issues getting the [Docpad Sass plugin](https://github.com/docpad/docpad-plugin-sass) to work hence why I'm using a separate command.
7. Go to [http://localhost:9778](http://localhost:9778)

## Setup
The layout follows Docpad conventions.

* **out** - generated static site
* **src** - working files
    * **documents** - `index.html.eco` is the page's main content
    * **files** - static assets for the site
        * **css**
            * **inuit.css** - inuit.css submodule
            * **ui**
                * **_demo.scss** - demo specific styles
                * **_vars.scss** - inuit.css overrides
    * **layouts** - `default.html.eco` is the master template
    * **partials** - html segments  inuit.css components.

## Partials
New inuit.css partials require the following at the top of the file:
```
---
title: Object Name
isPartial: true
---
```

Created by [Pat O'Callaghan](https://github.com/patocallaghan) at [Terabyte Interactive](http://www.terabyte.co.nz), Auckland, New Zealand.

Site generated using [Docpad](http://www.docpad.org), [Sass](http://www.sass-lang.com) and [Inuit.css](http://www.inuitcss.com) (obviously!).
