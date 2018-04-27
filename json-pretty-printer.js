#!/usr/bin/env node

'use strict';

const process = require('process');


process.stdin.resume();
process.stdin.setEncoding('utf8');
let _input = '';

process.stdin.on('data', function (input) {
  _input += input;
});

process.stdin.on('end', function () {
  processData(_input);
});

const processData = (input) => {
  console.log(JSON.stringify(JSON.parse(input), null, 2));
};
