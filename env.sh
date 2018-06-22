toolchain_dir="$(dirname "${BASH_SOURCE:-$0}")"
path=("${toolchain_dir}/pkg/depot_tools"(N) "${path[@]}")
path=("${toolchain_dir}/out/usr/bin"(N) "${path[@]}")

if [ "${#toolchain_dir}" -ne 0 ]; then
  path_map[${toolchain_dir}]="tc"
  path_map[${toolchain_dir}/pkg/llvm/src/llvm]="llvm"
  path_map[${toolchain_dir}/pkg/llvm/src/clang]="clang"
fi

# TODO: Build gn by ourselves.
export CHROMIUM_BUILDTOOLS_PATH="${toolchain_dir}/pkg/v8/v8/buildtools"
