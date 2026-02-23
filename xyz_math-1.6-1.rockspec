package = "xyz_math"
version = "1.6-1"
source = {
	url = "git://github.com/xyz-ai-dev/xyz_math",
	tag = "v1.6"
}
description = {
	summary = "A 3D math library for Lua",
	detailed = [[XYZ Math is a 3D mathematics library for Lua. It provides vector, matrix, quaternion, and geometry primitives with a clean, object-oriented API. Includes 2D, 3D, and 4D vectors, 3x3 and 4x4 matrices, quaternions with slerp, rays, planes, bounding volumes, frustum culling, and utility functions. v1.6 adds length_squared, distance_squared, reflect, project, angle_between, is_zero on vectors, XMat4:transpose(), transform_point/transform_direction, XMat4.from_trs(), XQuat:to_euler(), and nlerp.]],
	homepage = "https://github.com/xyz-ai-dev/xyz_math",
	license = "MIT"
}
dependencies = {
	"lua >= 5.1"
}
build = {
	type = "builtin",
	modules = {
		["xyz_math"] = "xyz_math.lua"
	}
}
