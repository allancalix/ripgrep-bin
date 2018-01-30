#!/usr/bin/env node

'use strict';
const { spawn } = require('child_process');

var bin = require('./');
var input = process.argv.slice(2);

if (bin !== null) {
    spawn(bin, input, {stdio: 'inherit'})
      .on('exit', process.exit);
} else {
    throw new Error('Platform not supported.');
}
