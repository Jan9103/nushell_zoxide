export-env {
	nuconfig hook append pre_prompt {
		^zoxide add -- $env.PWD
	}
}
