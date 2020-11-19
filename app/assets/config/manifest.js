//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css

const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    jQuery: 'jquery',
  })
)

module.exports = environment