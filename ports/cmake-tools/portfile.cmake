vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO daaguirre/cmake_tools
    REF "refs/tags/0.2.0"
    SHA512 c7734bb93391662091eb2bdfd3cc3cda985f8ceae8dfe511cb644b3ffc628978483234dd8e692019b84b21eea4c13f47fc3ef5c15d45f613b84e26394fa50c74
    HEAD_REF main
)

file(GLOB FILES "${SOURCE_PATH}/cmake/*")
file(COPY ${FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/cmake")
file(INSTALL "${SOURCE_PATH}/CMakeLists.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME cmake-tools-config.cmake)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
