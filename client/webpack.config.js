module.exports = {
  entry: {
    app: './src/index.js',
  },

  output: {
    path: '../app/assets/javascripts/webpack',
    filename: '[name].js',
  },

  module: {
    loaders: [
      { test: /\.js$/,
        loader: "babel-loader",
        exclude: /node_modules/,
        query: {
          presets: ["es2015"],
        }
      },
    ]
  },
}
