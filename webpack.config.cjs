const path = require("path");

module.exports = {
  entry: "./src/game.coffee",
  output: {
    filename: "bundle.js",
    path: path.resolve(__dirname, "dist"),
  },
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: "coffee-loader",
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: [".coffee", ".js"],
  },
};
