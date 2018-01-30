# Ripgrep-bin

## About
This is a simple wrapper around ripgrep that allows for use in node. All credit for the tool goes to: https://github.com/BurntSushi/ripgrep.

## Use
```
const execFile = require('child_process').execFile;
const ripgrep = require('ripgrep-bin');

execFile(ripgrep, ['hello'], (err, stdout) => {
  if (err) throw err;
  console.log(stdout);
});
```


