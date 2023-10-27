__git_fmt_diff_options="
    --cached
    --staged
    --color
    --no-color
    --config
    --warn-risky-stderr
"

_git_fmt_diff () {
    __git_has_doubledash && return

    # shellcheck disable=SC2154
    case "$cur" in
        --*)
            __gitcomp "$__git_fmt_diff_options"
            return
            ;;
    esac

    __git_complete_revlist_file
}
