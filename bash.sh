#!/bin/bash
#
# Bash script common template file

set -u

readonly SCRIPT_NAME="$(basename $0)"               # Name of this script file
readonly SCRIPT_DIR="$(cd $(dirname $0) && pwd)"    # Absolute path of a the directory of this script file
readonly SCRIPT_FILE="${SCRIPT_DIR}/${SCRIPT_NAME}" # Absolute path of this script file
readonly HEADER="$(basename $0): "
readonly SPACER="${HEADER//?/ }"
# readonly SPACER="$(echo "${HEADER}" | sed -r "s/./ /g")"

function usage() {
	cat << _EOT_
Usage:
	${SCRIPT_NAME} [options]

Description:
	This is a Bash script template file.

Options:
	-h	Display this information.
_EOT_
	exit 1
}

function error_message() {
	local orig_ifs=$IFS
	IFS=$'\n'

	local line
	read line
	echo "${HEADER}${line}" >&2
	while read line; do 
		echo "${SPACER}${line}" >&2
	done

	IFS=${orig_ifs}
}

echo "Hello, world!"
