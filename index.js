'use strict';
var path = require('path');
var VERSION = require('./package.json').version;

module.exports =
  process.platform === 'darwin'
  ? path.join(__dirname, `ripgrep-${VERSION}-x86_64-apple-darwin`, 'rg') :
  process.platform === 'linux' && process.arch === 'x64'
  ? path.join(__dirname, `ripgrep-${VERSION}-x86_64-unknown-linux-musl`, 'rg') :
  null;
