package = "xyz_math"
version = "1.2-1"
source = {
	url = "git://github.com/xyz-ai-dev/xyz_math",
	tag = "v1.2"
}
description = {
	summary = "A 3D math library for Lua",
	detailed = [[XYZ Math is a 3D mathematics library for Lua. It provides vector, matrix, quaternion, and geometry primitives with a clean, object-oriented API. Includes 2D, 3D, and 4D vectors, 3x3 and 4x4 matrices, quaternions with slerp, rays, planes, bounding volumes, and utility functions. v1.2 adds the XQuat quaternion class with Hamilton product, from_axis_angle, from_euler, slerp, and matrix conversion.]],
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
