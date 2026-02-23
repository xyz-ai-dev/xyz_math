package = "xyz_math"
version = "1.4-1"
source = {
	url = "git://github.com/xyz-ai-dev/xyz_math",
	tag = "v1.4"
}
description = {
	summary = "A 3D math library for Lua",
	detailed = [[XYZ Math is a 3D mathematics library for Lua. It provides vector, matrix, quaternion, and geometry primitives with a clean, object-oriented API. Includes 2D, 3D, and 4D vectors, 3x3 and 4x4 matrices, quaternions with slerp, rays, planes, bounding volumes, frustum culling, and utility functions. v1.4 adds extended intersections: ray-sphere, ray-AABB, ray-triangle (Möller-Trumbore), sphere-AABB overlap, and distance_to_point for planes, rays, spheres, and boxes.]],
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
