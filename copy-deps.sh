#!/bin/sh

mkdir -p priv/static/vendor/bootstrap/{js,css,fonts}
cp -r node_modules/bootstrap/dist/js/bootstrap.* priv/static/vendor/bootstrap/js
cp -r node_modules/bootstrap/dist/css/bootstrap.* priv/static/vendor/bootstrap/css
cp -r node_modules/bootstrap/dist/fonts/* priv/static/vendor/bootstrap/fonts

mkdir -p priv/static/vendor/font-awesome/{css,fonts}
cp -r node_modules/font-awesome/css/font-awesome.* priv/static/vendor/font-awesome/css
cp -r node_modules/font-awesome/fonts/* priv/static/vendor/font-awesome/fonts

mkdir -p priv/static/vendor/simplemde/{js,css}
cp -r node_modules/simplemde/dist/simplemde.min.js priv/static/vendor/simplemde/js
cp -r node_modules/simplemde/dist/simplemde.min.css priv/static/vendor/simplemde/css

mkdir -p priv/static/vendor/jquery
cp -r node_modules/jquery/dist/jquery.* priv/static/vendor/jquery
