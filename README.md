# ripgrep-bin
---
## About
A simple wrapper around [Ripgrep](https://github.com/BurntSushi/ripgrep.) that allows for use in node. This package exists solely to make it convenient to call and bundle Ripgrep with Node applications.

This package can also be used to install the Ripgrep cli through node.
## Installation
```bash
# Installs globally for binary access.
npm i -g ripgrep-bin
# Check version, note the name is different from the canonical version (rg).
ripgrep --version
```
## Use
```javascript
// index.js
const execFile = require('child_process').execFile;
const ripgrep = require('ripgrep-bin');

execFile(ripgrep, ['hello'], (err, stdout) => {
  if (err) throw err;
  console.log(stdout);
});
```