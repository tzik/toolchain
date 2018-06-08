shopt -s nullglob
for i in "${base_dir}/patches"/*.patch; do
  if ! patch -d "${src_dir}" -R -f -s -p1 --dry-run -i "$i" > /dev/null 2>&1; then
    patch -d "${src_dir}" -N -f -s -p1 -i "$i"
  fi
done
