package = "xyz_math"
version = "1.9-1"
source = {
	url = "git://github.com/xyz-ai-dev/xyz_math",
	tag = "v1.9"
}
description = {
	summary = "A 3D math library for Lua",
	detailed = [[XYZ Math is a 3D mathematics library for Lua. It provides vector, matrix, quaternion, and geometry primitives with a clean, object-oriented API. Includes 2D, 3D, and 4D vectors, 3x3 and 4x4 matrices, quaternions with slerp, rays, planes, bounding volumes, frustum culling, and utility functions. v1.9 adds noise and procedural generation: Perlin noise, simplex noise, fractal Brownian motion (FBM), Voronoi/Worley noise via XNoise2D and XNoise3D utility tables.]],
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
