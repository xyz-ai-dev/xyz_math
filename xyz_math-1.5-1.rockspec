package = "xyz_math"
version = "1.5-1"
source = {
	url = "git://github.com/xyz-ai-dev/xyz_math",
	tag = "v1.5"
}
description = {
	summary = "A 3D math library for Lua",
	detailed = [[XYZ Math is a 3D mathematics library for Lua. It provides vector, matrix, quaternion, and geometry primitives with a clean, object-oriented API. Includes 2D, 3D, and 4D vectors, 3x3 and 4x4 matrices, quaternions with slerp, rays, planes, bounding volumes, frustum culling, and utility functions. v1.5 adds XTriangle, XCapsule, XOBB (oriented bounding box), splines (XBezier3, XCatmullRom), XMat4:decompose(), XMat3:transpose(), XQuat.from_mat3(), and XRay:distance_to_ray().]],
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
