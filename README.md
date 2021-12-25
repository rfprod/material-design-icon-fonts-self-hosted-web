# Self-hosted version generator of Google Material Design icon fonts for web apps

This is `NOT` a fork of the [material design icons](https://github.com/google/material-design-icons) by Google, including only the font files for smaller distribution.

This is a generator script which fetches iconfont from the [original material design icons repo](https://github.com/google/material-design-icons), converts `otf` fonts to `woff`, and makes it possible to use self-hosted version of the latest material design icons for web.

Fonts can be generated locally if this repo is cloned.

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

### Using a font collection (recommended way as per Google)

The `iconfont` folder contains pre-generated font files that can be included in a project. This is especially convenient for the web; however, it is generally better to link to the web font hosted on Google Fonts:

```html
<link
  href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet"
/>
```

### Using self-hosted version

Install package.

```bash
npm i --save-dev material-design-icon-fonts-self-hosted-web
```

```bash
yarn add -D material-design-icon-fonts-self-hosted-web
```

#### Angular

Add to the `styles` array of a corresponding app in `angular.json`

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
