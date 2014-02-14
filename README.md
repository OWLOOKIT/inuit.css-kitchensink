# INUIT.CSS KITCHEN SINK

A list of [Inuit.css](http://inuitcss.com/) component examples cobbled together from the css documention and inuit.css's [JsFiddle](http://jsfiddle.net/user/inuitcss/fiddles/) examples. The page contains minimal styling so components are pretty much as is from the Inuit.css framework. Code is from the [v5.1.0](https://github.com/csswizardry/inuit.css/tree/v5.1.0) branch used. View it online at [http://terabytenz.github.io/inuit.css-kitchensink/](http://terabytenz.github.io/inuit.css-kitchensink/).

## How to install and run

1. Clone the project and Inuit.css v5.1.0 submodule. Run `git clone --recursive https://github.com/terabytenz/inuit.css-kitchensink.git`
2. Windows folks, make sure you have [Ruby](http://rubyinstaller.org/) installed
3. Install [Bundler](http://bundler.io/)
4. Install [Node](http://nodejs.org/)
5. Install [Docpad](http://docpad.org/docs/install)
6. From the project root
    1. Run `bundle install` to install the Sass and Compass gems
    2. Run `npm install` to install the Node dependencies
    3. Run `docpad run` to start the server
7. Go to [http://localhost:9778](http://localhost:9778)
8. If you want to use LiveReload during development just activate your [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)/[Firefox](https://addons.mozilla.org/en-US/firefox/addon/livereload/) LiveReload extension and the Docpad server will pick it up.
9. Profit!

## Setup
The layout follows Docpad conventions.

* **out** - generated static site
* **src** - working files
    * **documents**
		* `index.html.eco` is the page's main content
        * **css**
            * **inuit.css** - inuit.css v5.1.0 submodule
            * **ui**
                * **_demo.scss** - demo specific styles
                * **_vars.scss** - inuit.css overrides
    * **files** - static assets for the site
    * **layouts** - `default.html.eco` is the master template
    * **partials** - html segments  inuit.css components.

## Partials
New inuit.css partials require the following at the top of the file:
```
---
title: Object Name
is(Object|Base|Generic): true
---
```

Created by [Pat O'Callaghan](https://github.com/patocallaghan) at [Terabyte Interactive](http://www.terabyte.co.nz), Auckland, New Zealand.

Site generated using [Docpad](http://www.docpad.org), [Sass](http://www.sass-lang.com) and [Inuit.css](http://www.inuitcss.com) (obviously!).
