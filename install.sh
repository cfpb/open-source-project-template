#!/usr/bin/env bash

url="https://raw.githubusercontent.com/CFPB/open-source-project-template/master"

root_files=(
  ".gitattributes"
  ".gitignore"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "INSTALL.md"
  "LICENSE"
  "README.md"
  "TERMS.md"
)

gh_files=(
  "ISSUE_TEMPLATE.md"
  "PULL_REQUEST_TEMPLATE.md"
)

echo "creating .github directory"

mkdir -p .github

echo "downloading files"

for file in "${root_files[@]}"; do
  if [ ! -f "./${file}" ]; then
    curl -so "./${file}" "${url}/${file}"
  else
    echo "${file} already exists, skipping"
  fi
done

for file in "${gh_files[@]}"; do
  if [ ! -f "./${file}" ]; then
    curl -so ".github/${file}" "${url}/.github/${file}"
  else
    echo ".github/${file} already exists, skipping"
  fi
done

echo "download complete"
