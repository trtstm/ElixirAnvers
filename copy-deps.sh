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

mkdir -p priv/static/vendor/phoenix
cp -r node_modules/phoenix_html/priv/static/phoenix_html.js priv/static/vendor/phoenix

mkdir -p priv/static/vendor/metismenu
cp -r node_modules/metismenu/dist/* priv/static/vendor/metismenu

mkdir -p priv/static/vendor/morrisjs
cp -r node_modules/morris.js/morris.* priv/static/vendor/morrisjs

mkdir -p priv/static/vendor/raphael
cp -r node_modules/raphael/raphael.* priv/static/vendor/raphael

mkdir -p priv/static/vendor/datatables
cp -r node_modules/datatables.net/js/*.js priv/static/vendor/datatables
cp -r node_modules/datatables.net-bs/js/*.js priv/static/vendor/datatables
cp -r node_modules/datatables.net-bs/css/*.css priv/static/vendor/datatables

cp -r node_modules/datatables.net-responsive/js/*.js priv/static/vendor/datatables
cp -r node_modules/datatables.net-responsive-bs/js/*.js priv/static/vendor/datatables
cp -r node_modules/datatables.net-responsive-bs/css/*.css priv/static/vendor/datatables
