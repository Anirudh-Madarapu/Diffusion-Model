#!/bin/bash
# should just be plug and play given dockerfile and this start-script
##	but we'll see

export USER="$(whoami)"
export PATH=$PATH:"/home/$USER/.local/bin"

# might need to run twice, test on an actual GPU, best I can tell it takes one
##	round through to create the torch module so that it can actually run
##	Conda might actually be a fix for this if I can make it work, not tonight though

./webui.sh --listen --xformers --precision full --no-half
./webui.sh --listen --xformers --precision full --no-half --always-batch-cond-uncond --opt-split-attention
