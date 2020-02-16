_update_direnv() {
  eval "$(
    direnv export json |
    jq -r 'to_entries | .[] |
    if .value == null then
      @sh "unset \(.key)"
    else
      @sh "export \(.key)=\(.value)"
    end'
  )"
}
_update_direnv
YASH_AFTER_CD=("$YASH_AFTER_CD" '_update_direnv')
