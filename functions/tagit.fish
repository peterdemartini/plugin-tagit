function tagit -d "Tag a new version of a project" -a message
  if test -f ./package.json;
   set version_cmd "yarn version"
   set is_node ""
  else
    set version_cmd "
read version
"
  end
  if begin; contains -- -h $argv; or contains -- --help $argv; end
  echo "Tag a new version of a project.

What does it do?
git add --all
git commit --message \"$message\"
" + $version_cmd "
git push
git push --tags

Usage:
tagit \"updated packages\"
"
    return
  end

  git add .
  git commit -m "" + $message ""
  yarn version
  git push
  git push --tags
end
