set -eu
cd "$(dirname "${BASH_SOURCE}")/.."

base_dir="${PWD}"
toolchain_dir="$(realpath -s "${base_dir}/../..")"

src_dir="${base_dir}/src"

: "${debug:=}"
if [ -n "${debug}" ]; then
  build_dir="${src_dir}/out/Debug"
else
  build_dir="${src_dir}/out/Release"
fi
image_dir="${base_dir}/image"
prefix="${toolchain_dir}/out/usr"

package_name="$(basename "${base_dir}")"
package_file="${base_dir}/${package_name}.tar"
metadata_file="${prefix}/packages/${package_name}"

mkdir -p "${build_dir}" "${image_dir}"
