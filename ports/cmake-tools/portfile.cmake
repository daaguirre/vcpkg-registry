vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO daaguirre/cmake_tools
    REF "refs/tags/0.1.0"
    SHA512 96747dcf95c4fce41996c523041b1971173146708c5bb2e2524c80ddaa09403ce4c36baa128c0eac0803174ed0c20dd663aed1cb383a77511e3c29fd6cbcaa68
    HEAD_REF master
)

file(GLOB FILES "${SOURCE_PATH}/cmake/*")
file(COPY ${FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/cmake")
file(INSTALL "${SOURCE_PATH}/CMakeLists.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME cmake-tools-config.cmake)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
