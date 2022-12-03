# Jump to a directory using only keywords.
export def-env __zoxide_z [...rest:string] {
	# `z -` does not work yet, see https://github.com/nushell/nushell/issues/4769
	let arg0 = ($rest | append '~').0
	let path = if ($arg0 | path expand | path type) == dir {
		$arg0
	} else {
		(zoxide query --exclude $env.PWD -- $rest | str trim -r -c "\n")
	}
	cd $path  # avoid potential `alias` issues
}

# Jump to a directory using interactive search.
export def-env __zoxide_zi  [...rest:string] {
	# TODO: fix `unknown option: --keep-right` issue for debian
	cd $'(zoxide query -i -- $rest | str trim -r -c "\n")'
}


export alias z = __zoxide_z
export alias zi = __zoxide_zi
