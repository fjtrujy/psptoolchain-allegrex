#!/bin/bash

PSPTOOLCHAIN_ALLEGREX_BINUTILS_REPO_URL="https://github.com/pspdev/binutils-gdb.git"
PSPTOOLCHAIN_ALLEGREX_BINUTILS_DEFAULT_REPO_REF="allegrex-v2.44"
PSPTOOLCHAIN_ALLEGREX_GCC_REPO_URL="https://github.com/pspdev/gcc.git"
PSPTOOLCHAIN_ALLEGREX_GCC_DEFAULT_REPO_REF="allegrex-v15.2.0"
PSPTOOLCHAIN_ALLEGREX_NEWLIB_REPO_URL="https://github.com/pspdev/newlib.git"
PSPTOOLCHAIN_ALLEGREX_NEWLIB_DEFAULT_REPO_REF="allegrex-v4.5.0"
PSPTOOLCHAIN_ALLEGREX_PTHREAD_EMBEDDED_REPO_URL="https://github.com/pspdev/pthread-embedded.git"
PSPTOOLCHAIN_ALLEGREX_PTHREAD_EMBEDDED_DEFAULT_REPO_REF="platform_agnostic"

## Portable helper: remove lines matching a pattern from a file.
# Usage: remove_line '<pattern>' /path/to/file
remove_line()
{
  local pattern="$1"
  local file="$2"
  if [[ -f "$file" ]]; then
    grep -v -- "$pattern" "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
  fi
}

if test -f "$PSPDEV_CONFIG_OVERRIDE"; then
  source "$PSPDEV_CONFIG_OVERRIDE"
fi