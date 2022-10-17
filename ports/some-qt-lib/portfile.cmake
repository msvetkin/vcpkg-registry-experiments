vcpkg_from_git(
	OUT_SOURCE_PATH SOURCE_PATH
  URL https://github.com/msvetkin/some-qt-lib
	REF 271e9af0531e2d1edcf67b9cbb5cc2425d21fc38
	HEAD_REF main
)

vcpkg_configure_cmake(
	SOURCE_PATH "${SOURCE_PATH}"
	PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(
  CONFIG_PATH "lib/cmake/${PORT}"
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
	INSTALL "${SOURCE_PATH}/LICENSE"
	DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
	RENAME copyright)
