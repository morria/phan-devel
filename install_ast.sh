#!/usr/bin/env bash

cd /tmp
git clone --depth 1 https://github.com/nikic/php-ast.git ast

pushd ast
  phpize
  ./configure
  make
  make install
  echo "extension=ast.so" >> /usr/local/etc/php/conf.d/ast.ini
popd
