mkdir -p "${image_dir}${prefix}" "$(dirname "${image_dir}${metadata_file}")"
cd "${image_dir}${prefix}"
find . -depth -print0 > "${image_dir}${metadata_file}"

rpath_fix() {
  local target="$1"
  local value="$2"
  if [ ! -d "${target}" ]; then
    return 0
  fi

  find "${target}" -type f -print0 | \
    while read -d $'\0' i; do
      if [ -z "$(patchelf --print-rpath "$i" 2> /dev/null)" ]; then
        continue
      fi

      patchelf --force-rpath --set-rpath "${value}" "$i"
    done
}

if [ -z "${no_rpath_fix:-}" ] && which patchelf > /dev/null 2>&1; then
  rpath_fix "${image_dir}${prefix}/bin" '$ORIGIN/../lib'
  rpath_fix "${image_dir}${prefix}/libexec" '$ORIGIN/../lib'
  rpath_fix "${image_dir}${prefix}/lib" '$ORIGIN'
fi

rm -f "${package_file}"
tar caf "${package_file}" -C "${image_dir}${prefix}" \
  --no-recursion --null -T "${image_dir}${metadata_file}"
