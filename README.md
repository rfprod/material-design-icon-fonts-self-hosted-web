# Self-hosted version generator of Google Material Design icon fonts for web apps

This is `NOT` a fork of the [material design icons](https://github.com/google/material-design-icons) by Google, including only the font files for smaller distribution.

This is a generator script which fetches the iconfont from the [original material design icons repo](https://github.com/google/material-design-icons), converts `otf` fonts to `woff`, and makes it possible to use the self-hosted version of the latest material design icons for web.

## Local script usage

Clone the repo, `cd` into the project directory and execute from root

```bash
$ bash src/generate-iconfont.sh
```

Fonts will be generated in the `./iconfont` directory relative to the project root.

## Material design icons

Material design icons are the official [icon set](http://www.google.com/design/spec/style/icons.html#icons-system-icons) from Google that are designed under the [material design guidelines](http://www.google.com/design/spec).

## Developer guide

Read the [developer guide](http://google.github.io/material-design-icons/) on how to use the material design icons in your project.

### Using the font collection (recommended way as per Google)

The `iconfont` folder contains pre-generated font files that can be included in a project. This is especially convenient for the web. However, it is generally better to link to the web font hosted on Google Fonts:

```html
<link
  href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet"
/>
```

### Using the self-hosted version

Install the package. Exexute

```bash
npm i --save-dev material-design-icon-fonts-self-hosted-web
```

or

```bash
yarn add -D material-design-icon-fonts-self-hosted-web
```

#### Angular

Add one of the folowing `css` files to the `styles` array of a corresponding app in `angular.json` depending on which version of the icons are intended to be used in the app.

##### Regular

```json
"styles": [
  "node_modules/material-design-icon-fonts-self-hosted-web/iconfont/material-icons.css"
],
```

##### Outlined

```json
"styles": [
  "node_modules/material-design-icon-fonts-self-hosted-web/iconfont/material-icons-outlined.css"
],
```

##### Round

```json
"styles": [
  "node_modules/material-design-icon-fonts-self-hosted-web/iconfont/material-icons-round.css"
],
```

##### Sharp

```json
"styles": [
  "node_modules/material-design-icon-fonts-self-hosted-web/iconfont/material-icons-sharp.css"
],
```

##### TwoTone

```json
"styles": [
  "node_modules/material-design-icon-fonts-self-hosted-web/iconfont/material-icons-twotone.css"
],
```
