vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO isl-org/Open3D
    REF "refs/tags/v0.17.0"
    SHA512 d33e6275039a904a8660117f915083248acd14559e387330fc98842b272d99dd894c0e2a70bc35fe4a5166bf663108397912e654bfc8ff1f0eb7863aec5e9a86
    HEAD_REF master
)

execute_process(
    COMMAND bash "-c" "${SOURCE_PATH}/util/install_deps_ubuntu.sh" 
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    GENERATOR "Unix Makefiles"
    OPTIONS
        -DFETCHCONTENT_FULLY_DISCONNECTED=OFF
        -DBUILD_PYTHON_MODULE=OFF
        -DBUILD_CUDA_MODULE=OFF
        -DBUILD_GUI=ON
        -DBUILD_WEBRTC=ON
        -DBUILD_EXAMPLES=OFF
        -DBUILD_BENCHMARKS=OFF
        -DBUILD_AZURE_KINECT=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/Open3D)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/t/io/file_format")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/ml/tensorflow/tf_neighbors")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/ml/tensorflow/tf_subsampling")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/visualization/gui/Resources")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/visualization/gui/Materials")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/visualization/shader/glsl")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/visualization/webrtc_server/html")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/io/file_format")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/open3d/data/dataset")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")