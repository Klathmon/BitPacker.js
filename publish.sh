#!/usr/bin/env bash
version=V$(node -e "var fs = require('fs'); console.log(JSON.parse(fs.readFileSync('./package.json')).version)")

if git tag | grep -q "${version}"; then
  echo "Forgot to bump version, exiting!"
  exit
fi

npm run build

git add --all
git commit -m "Automated Commit for ${version}"
git tag -s "${version}" -m "${version}"
git push
git push origin "${version}"

npm publish --tag "${version}"
