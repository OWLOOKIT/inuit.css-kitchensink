# INUIT.CSS KITCHEN SINK

[Inuit.css](http://inuitcss.com/) component examples cobbled together from the css documention and inuit.css's [JsFiddle](http://jsfiddle.net/user/inuitcss/fiddles/) examples. The page contains minimal styling so components are appearing as is from the Inuit.css framework. Code from the [v5.1.0](https://github.com/csswizardry/inuit.css/tree/v5.1.0) branch used.

## How to install and run

1. Windows folks, make sure you have [Ruby](http://rubyinstaller.org/) installed
2. Install [Sass](http://sass-lang.com/download.html)
3. Install [Node](http://nodejs.org/)
4. Install [Docpad](http://docpad.org/docs/install)
5. From the root directory run
    1. `npm install` to install the required plugins
    2. `docpad run` to start the server
    3. `sass --watch src/files/css/style.scss:src/files/css/style.css --style expanded` or run `sass-watch.bat` on Windows. I've had issues getting the [Docpad Sass plugin](https://github.com/docpad/docpad-plugin-sass) to work hence why I'm using a separate command.
6. Go to [http://localhost:9778](http://localhost:9778)

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

Created by [Pat O'Callaghan](https://github.com/patocallaghan) at [Terabyte Interactive](http://www.terabyte.co.nz), Auckland, New Zealand
