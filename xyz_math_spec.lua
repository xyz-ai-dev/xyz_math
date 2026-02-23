-- XYZ Math Library Tests
-- Using Busted testing framework

local xyz_math = require("xyz_math")
describe("XVec2", function()
	-- Test constructor
	it("should create a new vector with default values", function()
		local v = XVec2.new()
		assert.are.equal(0, v.x)
		assert.are.equal(0, v.y)
	end)
	
	it("should create a new vector with specified values", function()
		local v = XVec2.new(3, 4)
		assert.are.equal(3, v.x)
		assert.are.equal(4, v.y)
	end)
	
	it("should create a new vector using callable syntax", function()
		local v = XVec2(3, 4)
		assert.are.equal(3, v.x)
		assert.are.equal(4, v.y)
	end)
	
	-- Test operations
	it("should add vectors correctly", function()
		local v1 = XVec2(1, 2)
		local v2 = XVec2(3, 4)
		local result = v1 + v2
		assert.are.equal(4, result.x)
		assert.are.equal(6, result.y)
	end)
	
	it("should subtract vectors correctly", function()
		local v1 = XVec2(5, 7)
		local v2 = XVec2(2, 3)
		local result = v1 - v2
		assert.are.equal(3, result.x)
		assert.are.equal(4, result.y)
	end)
	
	it("should multiply vector by scalar correctly", function()
		local v = XVec2(2, 3)
		local result = v * 2
		assert.are.equal(4, result.x)
		assert.are.equal(6, result.y)
		
		-- Test scalar on left side
		result = 3 * v
		assert.are.equal(6, result.x)
		assert.are.equal(9, result.y)
	end)
	
	it("should multiply vectors component-wise", function()
		local v1 = XVec2(2, 3)
		local v2 = XVec2(3, 4)
		local result = v1 * v2
		assert.are.equal(6, result.x)
		assert.are.equal(12, result.y)
	end)
	
	-- Test methods
	it("should calculate dot product correctly", function()
		local v1 = XVec2(2, 3)
		local v2 = XVec2(4, 5)
		local dot = v1:dot(v2)
		assert.are.equal(2*4 + 3*5, dot)
	end)
	
	it("should calculate cross product correctly", function()
		local v1 = XVec2(2, 3)
		local v2 = XVec2(4, 5)
		local cross = v1:cross(v2)
		assert.are.equal(2*5 - 3*4, cross)
	end)
	
	it("should calculate length correctly", function()
		local v = XVec2(3, 4)
		assert.are.equal(5, v:length())
	end)
	
	it("should normalize vector correctly", function()
		local v = XVec2(3, 4)
		local normalized = v:normalize()
		assert.are_equal(0.6, normalized.x)
		assert.are_equal(0.8, normalized.y)
	end)
	
	it("should handle zero vector normalization", function()
		local v = XVec2(0, 0)
		local normalized = v:normalize()
		assert.are.equal(0, normalized.x)
		assert.are.equal(0, normalized.y)
	end)
end)

describe("XVec3", function()
	-- Test constructor
	it("should create a new vector with default values", function()
		local v = XVec3.new()
		assert.are.equal(0, v.x)
		assert.are.equal(0, v.y)
		assert.are.equal(0, v.z)
	end)
	
	it("should create a new vector with specified values", function()
		local v = XVec3.new(3, 4, 5)
		assert.are.equal(3, v.x)
		assert.are.equal(4, v.y)
		assert.are.equal(5, v.z)
	end)
	
	it("should create a new vector using callable syntax", function()
		local v = XVec3(3, 4, 5)
		assert.are.equal(3, v.x)
		assert.are.equal(4, v.y)
		assert.are.equal(5, v.z)
	end)
	
	-- Test operations
	it("should add vectors correctly", function()
		local v1 = XVec3(1, 2, 3)
		local v2 = XVec3(4, 5, 6)
		local result = v1 + v2
		assert.are.equal(5, result.x)
		assert.are.equal(7, result.y)
		assert.are.equal(9, result.z)
	end)
	
	it("should subtract vectors correctly", function()
		local v1 = XVec3(5, 7, 9)
		local v2 = XVec3(2, 3, 4)
		local result = v1 - v2
		assert.are.equal(3, result.x)
		assert.are.equal(4, result.y)
		assert.are.equal(5, result.z)
	end)
	
	it("should multiply vector by scalar correctly", function()
		local v = XVec3(2, 3, 4)
		local result = v * 2
		assert.are.equal(4, result.x)
		assert.are.equal(6, result.y)
		assert.are.equal(8, result.z)
		
		-- Test scalar on left side
		result = 3 * v
		assert.are.equal(6, result.x)
		assert.are.equal(9, result.y)
		assert.are.equal(12, result.z)
	end)
	
	-- Test methods
	it("should calculate dot product correctly", function()
		local v1 = XVec3(2, 3, 4)
		local v2 = XVec3(5, 6, 7)
		local dot = v1:dot(v2)
		assert.are.equal(2*5 + 3*6 + 4*7, dot)
	end)
	
	it("should calculate cross product correctly", function()
		local v1 = XVec3(2, 3, 4)
		local v2 = XVec3(5, 6, 7)
		local cross = v1:cross(v2)
		assert.are.equal(3*7 - 4*6, cross.x)
		assert.are.equal(4*5 - 2*7, cross.y)
		assert.are.equal(2*6 - 3*5, cross.z)
	end)
	
	it("should calculate length correctly", function()
		local v = XVec3(3, 4, 12)
		assert.are.equal(13, v:length())
	end)
	
	it("should normalize vector correctly", function()
		local v = XVec3(3, 0, 4)
		local normalized = v:normalize()
		assert.are.near(0.6, normalized.x, 0.001)
		assert.are.equal(0, normalized.y)
		assert.are.near(0.8, normalized.z, 0.001)
	end)
end)

describe("XVec4", function()
	-- Test constructor
	it("should create a new vector with default values", function()
		local v = XVec4.new()
		assert.are.equal(0, v.x)
		assert.are.equal(0, v.y)
		assert.are.equal(0, v.z)
		assert.are.equal(0, v.w)
	end)
	
	it("should create a new vector with specified values", function()
		local v = XVec4.new(3, 4, 5, 6)
		assert.are.equal(3, v.x)
		assert.are.equal(4, v.y)
		assert.are.equal(5, v.z)
		assert.are.equal(6, v.w)
	end)
	
	-- Test operations
	it("should add vectors correctly", function()
		local v1 = XVec4(1, 2, 3, 4)
		local v2 = XVec4(5, 6, 7, 8)
		local result = v1 + v2
		assert.are.equal(6, result.x)
		assert.are.equal(8, result.y)
		assert.are.equal(10, result.z)
		assert.are.equal(12, result.w)
	end)
	
	it("should calculate dot product correctly", function()
		local v1 = XVec4(2, 3, 4, 5)
		local v2 = XVec4(6, 7, 8, 9)
		local dot = v1:dot(v2)
		assert.are.equal(2*6 + 3*7 + 4*8 + 5*9, dot)
	end)
end)

describe("XMat3", function()
	it("should create identity matrix by default", function()
		local m = XMat3.new()
		assert.are.equal(1, m[1])
		assert.are.equal(0, m[2])
		assert.are.equal(0, m[3])
		assert.are.equal(0, m[4])
		assert.are.equal(1, m[5])
		assert.are.equal(0, m[6])
		assert.are.equal(0, m[7])
		assert.are.equal(0, m[8])
		assert.are.equal(1, m[9])
	end)
	
	it("should multiply matrices correctly", function()
		local m1 = XMat3.new(
			1, 2, 3,
			4, 5, 6,
			7, 8, 9
		)
		local m2 = XMat3.new(
			9, 8, 7,
			6, 5, 4,
			3, 2, 1
		)
		local result = m1 * m2
		assert.are.equal(30, result[1])
		assert.are.equal(24, result[2])
		assert.are.equal(18, result[3])
		assert.are.equal(84, result[4])
		assert.are.equal(69, result[5])
		assert.are.equal(54, result[6])
		assert.are.equal(138, result[7])
		assert.are.equal(114, result[8])
		assert.are.equal(90, result[9])
	end)
	
	it("should transform a vector correctly", function()
		local m = XMat3.new(
			1, 2, 3,
			4, 5, 6,
			7, 8, 9
		)
		local v = XVec3(2, 3, 4)
		local result = m * v
		assert.are.equal(1*2 + 2*3 + 3*4, result.x)
		assert.are.equal(4*2 + 5*3 + 6*4, result.y)
		assert.are.equal(7*2 + 8*3 + 9*4, result.z)
	end)
	
	it("should create rotation matrices correctly", function()
		-- Test rotation around Z axis with 90 degrees
		local rot_z = XMat3.rotation_z(math.pi/2)
		local v = XVec3(1, 0, 0)
		local result = rot_z * v
		assert.are.near(0, result.x, 0.001)
		assert.are.near(1, result.y, 0.001)
		assert.are.near(0, result.z, 0.001)
	end)
end)

describe("XMat4", function()
	it("should create identity matrix by default", function()
		local m = XMat4.new()
		assert.are.equal(1, m[1])
		assert.are.equal(0, m[2])
		assert.are.equal(0, m[3])
		assert.are.equal(0, m[4])
		assert.are.equal(0, m[5])
		assert.are.equal(1, m[6])
		assert.are.equal(0, m[7])
		assert.are.equal(0, m[8])
		assert.are.equal(0, m[9])
		assert.are.equal(0, m[10])
		assert.are.equal(1, m[11])
		assert.are.equal(0, m[12])
		assert.are.equal(0, m[13])
		assert.are.equal(0, m[14])
		assert.are.equal(0, m[15])
		assert.are.equal(1, m[16])
	end)
	
	it("should create translation matrix correctly", function()
		local m = XMat4.translate(2, 3, 4)
		assert.are.equal(1, m[1])
		assert.are.equal(0, m[2])
		assert.are.equal(0, m[3])
		assert.are.equal(2, m[4])
		assert.are.equal(0, m[5])
		assert.are.equal(1, m[6])
		assert.are.equal(0, m[7])
		assert.are.equal(3, m[8])
		assert.are.equal(0, m[9])
		assert.are.equal(0, m[10])
		assert.are.equal(1, m[11])
		assert.are.equal(4, m[12])
	end)
	
	it("should transform a vector correctly", function()
		local m = XMat4.translate(2, 3, 4)
		local v = XVec4(1, 1, 1, 1)
		local result = m * v
		assert.are.equal(3, result.x)
		assert.are.equal(4, result.y)
		assert.are.equal(5, result.z)
		assert.are.equal(1, result.w)
	end)
end)

describe("XRay", function()
	it("should create a ray with default values", function()
		local ray = XRay.new()
		assert.are.equal(0, ray.origin.x)
		assert.are.equal(0, ray.origin.y)
		assert.are.equal(0, ray.origin.z)
		assert.are.equal(0, ray.direction.x)
		assert.are.equal(0, ray.direction.y)
		assert.are.equal(1, ray.direction.z)
	end)
	
	it("should calculate point along ray", function()
		local ray = XRay.new(XVec3(1, 2, 3), XVec3(0, 0, 1))
		local point = ray:pointAt(5)
		assert.are.equal(1, point.x)
		assert.are.equal(2, point.y)
		assert.are.equal(8, point.z)
	end)
	
	it("should transform ray correctly", function()
		local ray = XRay.new(XVec3(0, 0, 0), XVec3(0, 0, 1))
		local matrix = XMat4.translate(1, 2, 3)
		local transformed = ray:transform(matrix)
		assert.are.equal(1, transformed.origin.x)
		assert.are.equal(2, transformed.origin.y)
		assert.are.equal(3, transformed.origin.z)
		assert.are.equal(0, transformed.direction.x)
		assert.are.equal(0, transformed.direction.y)
		assert.are.equal(1, transformed.direction.z)
	end)
end)

describe("XPlane", function()
	it("should determine point side correctly", function()
		local plane = XPlane.new(XVec3(0, 1, 0), -5) -- y = 5 plane
		assert.are.equal(1, plane:side(XVec3(0, 10, 0)))  -- Above
		assert.are.equal(-1, plane:side(XVec3(0, 2, 0)))  -- Below
		assert.are.equal(0, plane:side(XVec3(0, 5, 0)))   -- On plane
	end)
	
	it("should calculate ray intersection correctly", function()
		local plane = XPlane.new(XVec3(0, 1, 0), -5) -- y = 5 plane
		local ray = XRay.new(XVec3(0, 0, 0), XVec3(0, 1, 0))
		local intersection = plane:intersectRay(ray)
		assert.are.equal(0, intersection.x)
		assert.are.equal(5, intersection.y)
		assert.are.equal(0, intersection.z)
	end)
	
	it("should return nil for parallel rays", function()
		local plane = XPlane.new(XVec3(0, 1, 0), 0)
		local ray = XRay.new(XVec3(0, 1, 0), XVec3(1, 0, 0))
		local intersection = plane:intersectRay(ray)
		assert.is_nil(intersection)
	end)
end)

describe("XBoundingSphere", function()
	it("should detect point containment correctly", function()
		local sphere = XBoundingSphere.new(XVec3(0, 0, 0), 5)
		assert.is_true(sphere:contains_point(XVec3(3, 0, 0)))
		assert.is_true(sphere:contains_point(XVec3(0, -4, 0)))
		assert.is_false(sphere:contains_point(XVec3(0, 0, 6)))
	end)
	
	it("should detect sphere intersection correctly", function()
		local sphere1 = XBoundingSphere.new(XVec3(0, 0, 0), 5)
		local sphere2 = XBoundingSphere.new(XVec3(8, 0, 0), 4)
		local sphere3 = XBoundingSphere.new(XVec3(10, 0, 0), 2)
		
		assert.is_true(sphere1:intersects_sphere(sphere2))
		assert.is_false(sphere1:intersects_sphere(sphere3))
	end)
	
	it("should expand to contain point correctly", function()
		local sphere = XBoundingSphere.new(XVec3(0, 0, 0), 5)
		sphere:expand_to_point(XVec3(10, 0, 0))
		assert.are.equal(10, sphere.radius)
	end)
	
	it("should merge spheres correctly", function()
		local sphere1 = XBoundingSphere.new(XVec3(0, 0, 0), 5)
		local sphere2 = XBoundingSphere.new(XVec3(10, 0, 0), 3)
		local merged = XBoundingSphere.merge(sphere1, sphere2)
		
		-- For this specific case:
		-- difference = (10,0,0)
		-- length = 10
		-- min = math.min(-5, 10-3) = -5
		-- max = (math.max(5, 10+3) - (-5)) * 0.5 = (13 + 5) * 0.5 = 9
		-- center = (0,0,0) + (1,0,0) * (9 + (-5)) = (0,0,0) + (1,0,0) * 4 = (4,0,0)
		-- radius = 9
		
		assert.are.equal(4, merged.center.x)
		assert.are.equal(0, merged.center.y)
		assert.are.equal(0, merged.center.z)
		assert.are.equal(9, merged.radius)
	end)
end)

describe("XAABox", function()
	it("should detect point containment correctly", function()
		local box = XAABox.new(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		assert.is_true(box:contains_point(XVec3(0, 0, 0)))
		assert.is_true(box:contains_point(XVec3(-5, -5, -5)))
		assert.is_true(box:contains_point(XVec3(5, 5, 5)))
		assert.is_false(box:contains_point(XVec3(6, 0, 0)))
	end)
	
	it("should detect box intersection correctly", function()
		local box1 = XAABox.new(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		local box2 = XAABox.new(XVec3(0, 0, 0), XVec3(10, 10, 10))
		local box3 = XAABox.new(XVec3(6, 6, 6), XVec3(10, 10, 10))
		
		assert.is_true(box1:intersects_box(box2))
		assert.is_false(box1:intersects_box(box3))
	end)
	
	it("should expand to contain point correctly", function()
		local box = XAABox.new(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		box:expand_to_point(XVec3(10, 2, 3))
		
		assert.are.equal(-5, box.min.x)
		assert.are.equal(-5, box.min.y)
		assert.are.equal(-5, box.min.z)
		assert.are.equal(10, box.max.x)
		assert.are.equal(5, box.max.y)
		assert.are.equal(5, box.max.z)
	end)
	
	it("should calculate center correctly", function()
		local box = XAABox.new(XVec3(-5, -10, -15), XVec3(5, 10, 15))
		local center = box:get_center()
		
		assert.are.equal(0, center.x)
		assert.are.equal(0, center.y)
		assert.are.equal(0, center.z)
	end)
	
	it("should calculate size correctly", function()
		local box = XAABox.new(XVec3(-5, -10, -15), XVec3(5, 10, 15))
		local size = box:get_size()
		
		assert.are.equal(10, size.x)
		assert.are.equal(20, size.y)
		assert.are.equal(30, size.z)
	end)
	
	it("should merge boxes correctly", function()
		local box1 = XAABox.new(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		local box2 = XAABox.new(XVec3(0, 0, 0), XVec3(10, 10, 10))
		local merged = XAABox.merge(box1, box2)
		
		assert.are.equal(-5, merged.min.x)
		assert.are.equal(-5, merged.min.y)
		assert.are.equal(-5, merged.min.z)
		assert.are.equal(10, merged.max.x)
		assert.are.equal(10, merged.max.y)
		assert.are.equal(10, merged.max.z)
	end)
end)

describe("Utility Functions", function()
	it("should calculate min correctly for vectors", function()
		local v1 = XVec3(1, 5, 3)
		local v2 = XVec3(2, 3, 4)
		local result = XMin(v1, v2)
		
		assert.are.equal(1, result.x)
		assert.are.equal(3, result.y)
		assert.are.equal(3, result.z)
	end)
	
	it("should calculate max correctly for vectors", function()
		local v1 = XVec3(1, 5, 3)
		local v2 = XVec3(2, 3, 4)
		local result = XMax(v1, v2)
		
		assert.are.equal(2, result.x)
		assert.are.equal(5, result.y)
		assert.are.equal(4, result.z)
	end)
	
	it("should clamp vectors correctly", function()
		local v = XVec3(1, 10, -5)
		local min = XVec3(2, 3, -10)
		local max = XVec3(5, 8, 0)
		local result = XClamp(v, min, max)

		assert.are.equal(2, result.x)
		assert.are.equal(8, result.y)
		assert.are.equal(-5, result.z)
	end)
end)

describe("__tostring", function()
	it("should format XVec2", function()
		assert.are.equal("XVec2(1, 2)", tostring(XVec2(1, 2)))
	end)

	it("should format XVec3", function()
		assert.are.equal("XVec3(1, 2, 3)", tostring(XVec3(1, 2, 3)))
	end)

	it("should format XVec4", function()
		assert.are.equal("XVec4(1, 2, 3, 4)", tostring(XVec4(1, 2, 3, 4)))
	end)

	it("should format XMat3 identity", function()
		assert.are.equal("XMat3(1, 0, 0, 0, 1, 0, 0, 0, 1)", tostring(XMat3.new()))
	end)

	it("should format XMat4 identity", function()
		assert.are.equal("XMat4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)", tostring(XMat4.new()))
	end)

	it("should format XRay", function()
		local ray = XRay(XVec3(0, 0, 0), XVec3(0, 0, 1))
		assert.are.equal("XRay(origin=XVec3(0, 0, 0), direction=XVec3(0, 0, 1))", tostring(ray))
	end)

	it("should format XPlane", function()
		local plane = XPlane(XVec3(0, 1, 0), -5)
		assert.are.equal("XPlane(normal=XVec3(0, 1, 0), distance=-5)", tostring(plane))
	end)

	it("should format XBoundingSphere", function()
		local sphere = XBoundingSphere(XVec3(1, 2, 3), 5)
		assert.are.equal("XBoundingSphere(center=XVec3(1, 2, 3), radius=5)", tostring(sphere))
	end)

	it("should format XAABox", function()
		local box = XAABox(XVec3(-1, -2, -3), XVec3(1, 2, 3))
		assert.are.equal("XAABox(min=XVec3(-1, -2, -3), max=XVec3(1, 2, 3))", tostring(box))
	end)

	it("should suppress trailing zeros with %g", function()
		assert.are.equal("XVec3(1.5, 2.25, 3)", tostring(XVec3(1.5, 2.25, 3.0)))
	end)

	it("should handle negative values", function()
		assert.are.equal("XVec2(-1, -2.5)", tostring(XVec2(-1, -2.5)))
	end)
end)

describe("__eq", function()
	it("should compare XVec2", function()
		assert.is_true(XVec2(1, 2) == XVec2(1, 2))
		assert.is_false(XVec2(1, 2) == XVec2(1, 3))
	end)

	it("should compare XVec3", function()
		assert.is_true(XVec3(1, 2, 3) == XVec3(1, 2, 3))
		assert.is_false(XVec3(1, 2, 3) == XVec3(1, 2, 4))
	end)

	it("should compare XVec4", function()
		assert.is_true(XVec4(1, 2, 3, 4) == XVec4(1, 2, 3, 4))
		assert.is_false(XVec4(1, 2, 3, 4) == XVec4(1, 2, 3, 5))
	end)

	it("should compare XMat3", function()
		assert.is_true(XMat3.new() == XMat3.new())
		assert.is_false(XMat3.new() == XMat3.scale(2, 2, 2))
	end)

	it("should compare XMat4", function()
		assert.is_true(XMat4.new() == XMat4.new())
		assert.is_false(XMat4.new() == XMat4.translate(1, 0, 0))
	end)

	it("should compare XRay", function()
		local r1 = XRay(XVec3(0, 0, 0), XVec3(0, 0, 1))
		local r2 = XRay(XVec3(0, 0, 0), XVec3(0, 0, 1))
		local r3 = XRay(XVec3(1, 0, 0), XVec3(0, 0, 1))
		assert.is_true(r1 == r2)
		assert.is_false(r1 == r3)
	end)

	it("should compare XPlane", function()
		assert.is_true(XPlane(XVec3(0, 1, 0), 5) == XPlane(XVec3(0, 1, 0), 5))
		assert.is_false(XPlane(XVec3(0, 1, 0), 5) == XPlane(XVec3(0, 1, 0), 6))
	end)

	it("should compare XBoundingSphere", function()
		local s1 = XBoundingSphere(XVec3(0, 0, 0), 5)
		local s2 = XBoundingSphere(XVec3(0, 0, 0), 5)
		local s3 = XBoundingSphere(XVec3(0, 0, 0), 6)
		assert.is_true(s1 == s2)
		assert.is_false(s1 == s3)
	end)

	it("should compare XAABox", function()
		local b1 = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local b2 = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local b3 = XAABox(XVec3(-1, -1, -1), XVec3(2, 2, 2))
		assert.is_true(b1 == b2)
		assert.is_false(b1 == b3)
	end)

	it("should tolerate floating-point error after rotation", function()
		local v = XVec3(1, 0, 0)
		local rot = XMat3.rotation_z(math.pi / 2)
		local rotated = rot * v
		local back = XMat3.rotation_z(-math.pi / 2) * rotated
		assert.is_true(back == XVec3(1, 0, 0))
	end)
end)

describe("__unm", function()
	it("should negate XVec2", function()
		local v = XVec2(1, -2)
		local neg = -v
		assert.are.equal(-1, neg.x)
		assert.are.equal(2, neg.y)
	end)

	it("should negate XVec3", function()
		local v = XVec3(1, -2, 3)
		local neg = -v
		assert.are.equal(-1, neg.x)
		assert.are.equal(2, neg.y)
		assert.are.equal(-3, neg.z)
	end)

	it("should negate XVec4", function()
		local v = XVec4(1, -2, 3, -4)
		local neg = -v
		assert.are.equal(-1, neg.x)
		assert.are.equal(2, neg.y)
		assert.are.equal(-3, neg.z)
		assert.are.equal(4, neg.w)
	end)

	it("should satisfy v + (-v) == zero", function()
		local v = XVec3(3, 4, 5)
		assert.is_true(v + (-v) == XVec3(0, 0, 0))
	end)

	it("should not mutate the original vector", function()
		local v = XVec3(1, 2, 3)
		local _ = -v
		assert.are.equal(1, v.x)
		assert.are.equal(2, v.y)
		assert.are.equal(3, v.z)
	end)
end)

describe("XMat4:inverse", function()
	it("should invert identity matrix", function()
		local inv = XMat4.new():inverse()
		assert.is_true(inv == XMat4.new())
	end)

	it("should invert translation matrix", function()
		local m = XMat4.translate(3, 4, 5)
		local inv = m:inverse()
		assert.is_true(inv == XMat4.translate(-3, -4, -5))
	end)

	it("should invert scale matrix", function()
		local m = XMat4.scale(2, 3, 4)
		local inv = m:inverse()
		local expected = XMat4.scale(0.5, 1/3, 0.25)
		assert.is_true(inv == expected)
	end)

	it("should invert rotation matrix", function()
		local m = XMat4.rotation_y(math.pi / 3)
		local inv = m:inverse()
		local product = m * inv
		assert.is_true(product == XMat4.new())
	end)

	it("should invert compound TRS matrix", function()
		local t = XMat4.translate(1, 2, 3)
		local r = XMat4.rotation_z(math.pi / 4)
		local s = XMat4.scale(2, 2, 2)
		local trs = t * r * s
		local inv = trs:inverse()
		local product = trs * inv
		assert.is_true(product == XMat4.new())
	end)

	it("should error on singular matrix", function()
		local m = XMat4.new(
			1, 0, 0, 0,
			0, 0, 0, 0,
			0, 0, 0, 0,
			0, 0, 0, 0
		)
		assert.has_error(function() m:inverse() end, "Matrix is not invertible")
	end)

	it("should roundtrip M * M_inv * v == v", function()
		local m = XMat4.translate(5, 10, 15) * XMat4.rotation_x(1.0) * XMat4.scale(3, 3, 3)
		local inv = m:inverse()
		local v = XVec4(1, 2, 3, 1)
		local result = inv * (m * v)
		assert.is_true(result == v)
	end)
end)

describe("lerp / XLerp", function()
	it("should lerp XVec2 at t=0, 0.5, 1", function()
		local a = XVec2(0, 0)
		local b = XVec2(10, 20)
		assert.is_true(a:lerp(b, 0) == XVec2(0, 0))
		assert.is_true(a:lerp(b, 0.5) == XVec2(5, 10))
		assert.is_true(a:lerp(b, 1) == XVec2(10, 20))
	end)

	it("should lerp XVec3 at t=0, 0.5, 1", function()
		local a = XVec3(0, 0, 0)
		local b = XVec3(10, 20, 30)
		assert.is_true(a:lerp(b, 0) == XVec3(0, 0, 0))
		assert.is_true(a:lerp(b, 0.5) == XVec3(5, 10, 15))
		assert.is_true(a:lerp(b, 1) == XVec3(10, 20, 30))
	end)

	it("should lerp XVec4 at t=0, 0.5, 1", function()
		local a = XVec4(0, 0, 0, 0)
		local b = XVec4(10, 20, 30, 40)
		assert.is_true(a:lerp(b, 0) == XVec4(0, 0, 0, 0))
		assert.is_true(a:lerp(b, 0.5) == XVec4(5, 10, 15, 20))
		assert.is_true(a:lerp(b, 1) == XVec4(10, 20, 30, 40))
	end)

	it("should lerp scalars via XLerp", function()
		assert.are.equal(0, XLerp(0, 10, 0))
		assert.are.equal(5, XLerp(0, 10, 0.5))
		assert.are.equal(10, XLerp(0, 10, 1))
	end)

	it("should dispatch XLerp to vector lerp", function()
		local a = XVec3(0, 0, 0)
		local b = XVec3(10, 20, 30)
		assert.is_true(XLerp(a, b, 0.5) == XVec3(5, 10, 15))
	end)

	it("should support extrapolation (t outside [0,1])", function()
		local a = XVec3(0, 0, 0)
		local b = XVec3(10, 0, 0)
		assert.is_true(a:lerp(b, 2) == XVec3(20, 0, 0))
		assert.is_true(a:lerp(b, -1) == XVec3(-10, 0, 0))
	end)

	it("should lerp colors (RGBA)", function()
		local red = XRGBA(1, 0, 0, 1)
		local blue = XRGBA(0, 0, 1, 1)
		local mid = red:lerp(blue, 0.5)
		assert.is_true(mid == XRGBA(0.5, 0, 0.5, 1))
	end)

	it("should error on invalid types", function()
		assert.has_error(function() XLerp("a", "b", 0.5) end, "Invalid types for XLerp")
	end)

	it("should lerp XVec2 via XLerp", function()
		local a = XVec2(0, 0)
		local b = XVec2(10, 20)
		assert.is_true(XLerp(a, b, 0.5) == XVec2(5, 10))
	end)
end)

describe("XQuat", function()
	-- Constructor
	it("should create identity quaternion by default", function()
		local q = XQuat.new()
		assert.are.equal(0, q.x)
		assert.are.equal(0, q.y)
		assert.are.equal(0, q.z)
		assert.are.equal(1, q.w)
	end)

	it("should create quaternion with specified values", function()
		local q = XQuat.new(1, 2, 3, 4)
		assert.are.equal(1, q.x)
		assert.are.equal(2, q.y)
		assert.are.equal(3, q.z)
		assert.are.equal(4, q.w)
	end)

	it("should create quaternion using callable syntax", function()
		local q = XQuat(1, 2, 3, 4)
		assert.are.equal(1, q.x)
		assert.are.equal(2, q.y)
		assert.are.equal(3, q.z)
		assert.are.equal(4, q.w)
	end)

	-- Metamethods
	it("should format __tostring", function()
		assert.are.equal("XQuat(0, 0, 0, 1)", tostring(XQuat()))
		assert.are.equal("XQuat(1, 2, 3, 4)", tostring(XQuat(1, 2, 3, 4)))
	end)

	it("should compare equal quaternions", function()
		assert.is_true(XQuat(1, 2, 3, 4) == XQuat(1, 2, 3, 4))
	end)

	it("should compare unequal quaternions", function()
		assert.is_false(XQuat(1, 2, 3, 4) == XQuat(1, 2, 3, 5))
	end)

	it("should negate all components with __unm", function()
		local q = XQuat(1, -2, 3, -4)
		local neg = -q
		assert.are.equal(-1, neg.x)
		assert.are.equal(2, neg.y)
		assert.are.equal(-3, neg.z)
		assert.are.equal(4, neg.w)
	end)

	it("should compute Hamilton product", function()
		-- 90° around Y then 90° around X
		local qy = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local qx = XQuat.from_axis_angle(XVec3(1, 0, 0), math.pi / 2)
		local combined = qx * qy
		-- Apply combined rotation to (0, 0, -1)
		local v = combined * XVec3(0, 0, -1)
		-- 90° Y takes (0,0,-1) -> (-1,0,0), then 90° X leaves x untouched
		assert.are.near(-1, v.x, 1e-6)
		assert.are.near(0, v.y, 1e-6)
		assert.are.near(0, v.z, 1e-6)
	end)

	-- Instance methods
	it("should return length 1 for identity quaternion", function()
		assert.are.near(1, XQuat():length(), 1e-9)
	end)

	it("should normalize non-unit quaternion", function()
		local q = XQuat(0, 0, 0, 2)
		local n = q:normalize()
		assert.are.near(1, n:length(), 1e-9)
		assert.are.near(0, n.x, 1e-9)
		assert.are.near(0, n.y, 1e-9)
		assert.are.near(0, n.z, 1e-9)
		assert.are.near(1, n.w, 1e-9)
	end)

	it("should compute dot product", function()
		local a = XQuat(1, 2, 3, 4)
		local b = XQuat(5, 6, 7, 8)
		assert.are.equal(1*5 + 2*6 + 3*7 + 4*8, a:dot(b))
	end)

	it("should compute conjugate", function()
		local q = XQuat(1, 2, 3, 4)
		local c = q:conjugate()
		assert.are.equal(-1, c.x)
		assert.are.equal(-2, c.y)
		assert.are.equal(-3, c.z)
		assert.are.equal(4, c.w)
	end)

	it("should have inverse == conjugate for unit quaternion", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 3)
		local inv = q:inverse()
		local conj = q:conjugate()
		assert.is_true(inv == conj)
	end)

	it("should convert to_mat3 matching XMat3.rotation_around_axis", function()
		local axis = XVec3(1, 1, 0):normalize()
		local angle = math.pi / 3
		local q = XQuat.from_axis_angle(axis, angle)
		local m_quat = q:to_mat3()
		local m_ref = XMat3.rotation_around_axis(axis, angle)
		assert.is_true(m_quat == m_ref)
	end)

	it("should convert to_mat4 matching XMat4.rotation_around_axis", function()
		local axis = XVec3(0, 1, 0)
		local angle = math.pi / 4
		local q = XQuat.from_axis_angle(axis, angle)
		local m_quat = q:to_mat4()
		local m_ref = XMat4.rotation_around_axis(axis, angle)
		assert.is_true(m_quat == m_ref)
	end)

	-- Static constructors
	it("should create from_axis_angle (90° around Y)", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local s = math.sin(math.pi / 4)
		local c = math.cos(math.pi / 4)
		assert.are.near(0, q.x, 1e-9)
		assert.are.near(s, q.y, 1e-9)
		assert.are.near(0, q.z, 1e-9)
		assert.are.near(c, q.w, 1e-9)
	end)

	it("should create identity from_axis_angle with 0 angle", function()
		local q = XQuat.from_axis_angle(XVec3(1, 0, 0), 0)
		assert.is_true(q == XQuat())
	end)

	it("should create from_euler matching XMat4.from_euler via to_mat4", function()
		local x, y, z = 0.3, 0.5, 0.7
		local q = XQuat.from_euler(x, y, z)
		local m_quat = q:to_mat4()
		local m_ref = XMat4.from_euler(x, y, z)
		assert.is_true(m_quat == m_ref)
	end)

	it("should create identity from_euler with (0, 0, 0)", function()
		local q = XQuat.from_euler(0, 0, 0)
		assert.is_true(q == XQuat())
	end)

	-- slerp
	it("should return start at slerp t=0", function()
		local a = XQuat.from_axis_angle(XVec3(0, 1, 0), 0)
		local b = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi)
		assert.is_true(a:slerp(b, 0) == a)
	end)

	it("should return end at slerp t=1", function()
		local a = XQuat.from_axis_angle(XVec3(0, 1, 0), 0)
		local b = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		assert.is_true(a:slerp(b, 1) == b)
	end)

	it("should compute slerp midpoint at t=0.5", function()
		local a = XQuat.from_axis_angle(XVec3(0, 1, 0), 0)
		local b = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local mid = a:slerp(b, 0.5)
		local expected = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 4)
		assert.is_true(mid == expected)
	end)

	it("should take shortest path when dot < 0", function()
		local a = XQuat.from_axis_angle(XVec3(0, 1, 0), 0)
		-- -a represents same rotation but antipodal
		local b = XQuat.new(-a.x, -a.y, -a.z, -a.w)
		local result = a:slerp(b, 0.5)
		-- Should stay at identity (shortest path between q and -q is no rotation)
		assert.are.near(0, result.x, 1e-6)
		assert.are.near(0, result.y, 1e-6)
		assert.are.near(0, result.z, 1e-6)
		assert.are.near(1, math.abs(result.w), 1e-6)
	end)

	it("should handle nearly-parallel slerp fallback", function()
		local a = XQuat()
		-- Nearly identical quaternion
		local b = XQuat(1e-8, 0, 0, 1)
		b = b:normalize()
		local result = a:slerp(b, 0.5)
		assert.are.near(1, result:length(), 1e-6)
	end)

	-- Rotation of vectors
	it("should rotate vector 90° around Y: (1,0,0) -> (0,0,-1)", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local v = q * XVec3(1, 0, 0)
		assert.are.near(0, v.x, 1e-6)
		assert.are.near(0, v.y, 1e-6)
		assert.are.near(-1, v.z, 1e-6)
	end)

	it("should leave vector unchanged with identity quat", function()
		local q = XQuat()
		local v = q * XVec3(1, 2, 3)
		assert.are.near(1, v.x, 1e-6)
		assert.are.near(2, v.y, 1e-6)
		assert.are.near(3, v.z, 1e-6)
	end)

	it("should match mat4 * vec4 vs quat * vec3 roundtrip", function()
		local axis = XVec3(1, 1, 1):normalize()
		local angle = 1.23
		local q = XQuat.from_axis_angle(axis, angle)
		local m = q:to_mat4()
		local v = XVec3(3, 4, 5)
		local v_quat = q * v
		local v_mat = m * XVec4(v.x, v.y, v.z, 1)
		assert.are.near(v_quat.x, v_mat.x, 1e-6)
		assert.are.near(v_quat.y, v_mat.y, 1e-6)
		assert.are.near(v_quat.z, v_mat.z, 1e-6)
	end)

	-- XLerp integration
	it("should dispatch XLerp to slerp for XQuat", function()
		local a = XQuat.from_axis_angle(XVec3(0, 1, 0), 0)
		local b = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local result = XLerp(a, b, 0.5)
		local expected = a:slerp(b, 0.5)
		assert.is_true(result == expected)
	end)

	it("should match XLerp at t=0.5 with slerp at t=0.5", function()
		local a = XQuat.from_euler(0.1, 0.2, 0.3)
		local b = XQuat.from_euler(1.0, 0.5, 0.8)
		local via_xlerp = XLerp(a, b, 0.5)
		local via_slerp = a:slerp(b, 0.5)
		assert.is_true(via_xlerp == via_slerp)
	end)
end)

describe("unpack compatibility", function()
	it("should multiply XMat4 * XMat4 correctly", function()
		local t = XMat4.translate(1, 2, 3)
		local s = XMat4.scale(2, 2, 2)
		local result = t * s
		-- Verify a few key elements of T * S
		assert.are.equal(2, result[1])   -- scale x
		assert.are.equal(1, result[4])   -- translate x
		assert.are.equal(2, result[6])   -- scale y
		assert.are.equal(2, result[8])   -- translate y
		assert.are.equal(2, result[11])  -- scale z
		assert.are.equal(3, result[12])  -- translate z
		assert.are.equal(1, result[16])  -- homogeneous
	end)
end)

describe("XMat4.look_at", function()
	it("should produce identity-like view for camera at origin looking down -Z", function()
		local V = XMat4.look_at(XVec3(0,0,0), XVec3(0,0,-1), XVec3(0,1,0))
		assert.is_true(V == XMat4.new())
	end)

	it("should translate correctly for offset eye", function()
		local eye = XVec3(0, 0, 5)
		local V = XMat4.look_at(eye, XVec3(0,0,0), XVec3(0,1,0))
		-- Translation column should move eye to origin
		assert.are.near(0, V[4], 1e-6)
		assert.are.near(0, V[8], 1e-6)
		assert.are.near(-5, V[12], 1e-6)
	end)

	it("should transform center to -Z axis in view space", function()
		local eye = XVec3(0, 0, 5)
		local center = XVec3(0, 0, 0)
		local V = XMat4.look_at(eye, center, XVec3(0,1,0))
		local center_view = V * XVec4(center.x, center.y, center.z, 1)
		-- center should be at (0, 0, -distance) in view space
		assert.are.near(0, center_view.x, 1e-6)
		assert.are.near(0, center_view.y, 1e-6)
		assert.is_true(center_view.z < 0)
	end)

	it("should transform eye to origin", function()
		local eye = XVec3(3, 4, 5)
		local V = XMat4.look_at(eye, XVec3(0,0,0), XVec3(0,1,0))
		local eye_view = V * XVec4(eye.x, eye.y, eye.z, 1)
		assert.are.near(0, eye_view.x, 1e-6)
		assert.are.near(0, eye_view.y, 1e-6)
		assert.are.near(0, eye_view.z, 1e-6)
	end)

	it("should produce invertible matrix", function()
		local V = XMat4.look_at(XVec3(1,2,3), XVec3(0,0,0), XVec3(0,1,0))
		local product = V * V:inverse()
		assert.is_true(product == XMat4.new())
	end)
end)

describe("XMat4.perspective", function()
	it("should map near plane center to NDC z=-1", function()
		local near, far = 0.1, 100
		local P = XMat4.perspective(math.pi/2, 1, near, far)
		-- Point on near plane: (0, 0, -near, 1)
		local clip = P * XVec4(0, 0, -near, 1)
		local ndc_z = clip.z / clip.w
		assert.are.near(-1, ndc_z, 1e-5)
	end)

	it("should map far plane center to NDC z=1", function()
		local near, far = 0.1, 100
		local P = XMat4.perspective(math.pi/2, 1, near, far)
		local clip = P * XVec4(0, 0, -far, 1)
		local ndc_z = clip.z / clip.w
		assert.are.near(1, ndc_z, 1e-5)
	end)

	it("should set w_clip == -z_eye", function()
		local P = XMat4.perspective(math.pi/3, 16/9, 1, 1000)
		local clip = P * XVec4(5, 3, -50, 1)
		assert.are.near(50, clip.w, 1e-6)
	end)

	it("should respect aspect ratio", function()
		local P = XMat4.perspective(math.pi/2, 2, 1, 100)
		-- f = 1/tan(pi/4) = 1; P[1] = f/aspect = 0.5, P[6] = f = 1
		assert.are.near(0.5, P[1], 1e-6)
		assert.are.near(1, P[6], 1e-6)
	end)

	it("should produce invertible matrix", function()
		local P = XMat4.perspective(math.pi/2, 1.5, 0.1, 100)
		local product = P * P:inverse()
		assert.is_true(product == XMat4.new())
	end)
end)

describe("XMat4.frustum", function()
	it("should match perspective for symmetric frustum", function()
		local near, far = 0.1, 100
		local fov_y = math.pi / 3
		local aspect = 16 / 9
		local f = 1.0 / math.tan(fov_y * 0.5)
		local top = near / f
		local bottom = -top
		local right = top * aspect
		local left = -right

		local P = XMat4.perspective(fov_y, aspect, near, far)
		local F = XMat4.frustum(left, right, bottom, top, near, far)
		assert.is_true(P == F)
	end)

	it("should map near plane corners to NDC corners", function()
		local near, far = 1, 100
		local left, right, bottom, top = -1, 1, -1, 1
		local F = XMat4.frustum(left, right, bottom, top, near, far)
		-- Bottom-left of near plane: (left, bottom, -near)
		local clip = F * XVec4(left, bottom, -near, 1)
		local ndc_x = clip.x / clip.w
		local ndc_y = clip.y / clip.w
		assert.are.near(-1, ndc_x, 1e-5)
		assert.are.near(-1, ndc_y, 1e-5)
	end)

	it("should support asymmetric frustum", function()
		local F = XMat4.frustum(-2, 1, -1, 2, 1, 100)
		-- Just verify it's a valid, non-identity matrix
		assert.is_false(F == XMat4.new())
		-- And it still has -1 at [15] (perspective row)
		assert.are.near(-1, F[15], 1e-6)
	end)
end)

describe("XMat4.orthographic", function()
	it("should map right-top-near corner to (1, 1, -1)", function()
		local O = XMat4.orthographic(-10, 10, -5, 5, 1, 100)
		local clip = O * XVec4(10, 5, -1, 1)
		assert.are.near(1, clip.x, 1e-5)
		assert.are.near(1, clip.y, 1e-5)
		assert.are.near(-1, clip.z, 1e-5)
	end)

	it("should map left-bottom-far corner to (-1, -1, 1)", function()
		local O = XMat4.orthographic(-10, 10, -5, 5, 1, 100)
		local clip = O * XVec4(-10, -5, -100, 1)
		assert.are.near(-1, clip.x, 1e-5)
		assert.are.near(-1, clip.y, 1e-5)
		assert.are.near(1, clip.z, 1e-5)
	end)

	it("should keep w == 1 (no perspective divide)", function()
		local O = XMat4.orthographic(-1, 1, -1, 1, 0.1, 10)
		local clip = O * XVec4(0.5, 0.5, -5, 1)
		assert.are.equal(1, clip.w)
	end)

	it("should map center of volume to origin", function()
		local O = XMat4.orthographic(-10, 10, -5, 5, 1, 100)
		-- Center is at (0, 0, -50.5) in view space
		local clip = O * XVec4(0, 0, -50.5, 1)
		assert.are.near(0, clip.x, 1e-5)
		assert.are.near(0, clip.y, 1e-5)
		assert.are.near(0, clip.z, 1e-5)
	end)

	it("should produce invertible matrix", function()
		local O = XMat4.orthographic(-10, 10, -5, 5, 1, 100)
		local product = O * O:inverse()
		assert.is_true(product == XMat4.new())
	end)
end)

describe("XFrustum", function()
	it("should create from 6 planes directly", function()
		local planes = {}
		for i = 1, 6 do
			planes[i] = XPlane(XVec3(0, 1, 0), -i)
		end
		local f = XFrustum.new(planes[1], planes[2], planes[3], planes[4], planes[5], planes[6])
		assert.is_true(f.left == planes[1])
		assert.is_true(f.right == planes[2])
		assert.is_true(f.bottom == planes[3])
		assert.is_true(f.top == planes[4])
		assert.is_true(f.near == planes[5])
		assert.is_true(f.far == planes[6])
	end)

	it("should support callable syntax", function()
		local p = XPlane(XVec3(1,0,0), 0)
		local f = XFrustum(p, p, p, p, p, p)
		assert.is_true(f.left == p)
	end)

	it("should format __tostring", function()
		local p = XPlane(XVec3(0,1,0), 5)
		local f = XFrustum(p, p, p, p, p, p)
		local s = tostring(f)
		assert.is_truthy(string.find(s, "XFrustum"))
		assert.is_truthy(string.find(s, "XPlane"))
	end)

	it("should compare equal frustums", function()
		local p = XPlane(XVec3(0,1,0), 5)
		local f1 = XFrustum(p, p, p, p, p, p)
		local f2 = XFrustum(p, p, p, p, p, p)
		assert.is_true(f1 == f2)
	end)
end)

describe("XFrustum.from_matrix", function()
	it("should extract 6 planes from VP matrix", function()
		local V = XMat4.look_at(XVec3(0,0,5), XVec3(0,0,0), XVec3(0,1,0))
		local P = XMat4.perspective(math.pi/2, 1, 1, 100)
		local VP = P * V
		local f = XFrustum.from_matrix(VP)
		-- All 6 planes should be valid XPlane objects
		assert.is_truthy(f.left)
		assert.is_truthy(f.right)
		assert.is_truthy(f.bottom)
		assert.is_truthy(f.top)
		assert.is_truthy(f.near)
		assert.is_truthy(f.far)
	end)

	it("should have normalized plane normals", function()
		local V = XMat4.look_at(XVec3(0,0,5), XVec3(0,0,0), XVec3(0,1,0))
		local P = XMat4.perspective(math.pi/2, 1, 1, 100)
		local VP = P * V
		local f = XFrustum.from_matrix(VP)
		local planes = {f.left, f.right, f.bottom, f.top, f.near, f.far}
		for _, plane in ipairs(planes) do
			assert.are.near(1, plane.normal:length(), 1e-6)
		end
	end)
end)

describe("XFrustum:contains_point", function()
	local frustum
	setup(function()
		local V = XMat4.look_at(XVec3(0,0,5), XVec3(0,0,0), XVec3(0,1,0))
		local P = XMat4.perspective(math.pi/2, 1, 1, 100)
		local VP = P * V
		frustum = XFrustum.from_matrix(VP)
	end)

	it("should accept point in center of frustum", function()
		assert.is_true(frustum:contains_point(XVec3(0, 0, 0)))
	end)

	it("should reject point behind camera", function()
		assert.is_false(frustum:contains_point(XVec3(0, 0, 10)))
	end)

	it("should reject point beyond far plane", function()
		assert.is_false(frustum:contains_point(XVec3(0, 0, -200)))
	end)

	it("should reject point outside side plane", function()
		assert.is_false(frustum:contains_point(XVec3(500, 0, 0)))
	end)

	it("should accept point just inside near plane", function()
		-- Camera at z=5, near=1, so near plane is at z=4 in world space
		assert.is_true(frustum:contains_point(XVec3(0, 0, 3.9)))
	end)
end)

describe("XFrustum:intersects_sphere", function()
	local frustum
	setup(function()
		local V = XMat4.look_at(XVec3(0,0,5), XVec3(0,0,0), XVec3(0,1,0))
		local P = XMat4.perspective(math.pi/2, 1, 1, 100)
		local VP = P * V
		frustum = XFrustum.from_matrix(VP)
	end)

	it("should accept sphere inside frustum", function()
		local s = XBoundingSphere(XVec3(0, 0, 0), 1)
		assert.is_true(frustum:intersects_sphere(s))
	end)

	it("should reject sphere fully behind camera", function()
		local s = XBoundingSphere(XVec3(0, 0, 20), 1)
		assert.is_false(frustum:intersects_sphere(s))
	end)

	it("should accept sphere straddling near plane", function()
		-- Near plane at z=4 in world space; sphere centered at z=4.5 with radius 1 straddles it
		local s = XBoundingSphere(XVec3(0, 0, 4.5), 1)
		assert.is_true(frustum:intersects_sphere(s))
	end)

	it("should reject sphere fully beyond far plane", function()
		local s = XBoundingSphere(XVec3(0, 0, -200), 1)
		assert.is_false(frustum:intersects_sphere(s))
	end)

	it("should accept sphere straddling side plane", function()
		-- Large sphere at the edge should still intersect
		local s = XBoundingSphere(XVec3(50, 0, -40), 60)
		assert.is_true(frustum:intersects_sphere(s))
	end)
end)

describe("XFrustum:intersects_box", function()
	local frustum
	setup(function()
		local V = XMat4.look_at(XVec3(0,0,5), XVec3(0,0,0), XVec3(0,1,0))
		local P = XMat4.perspective(math.pi/2, 1, 1, 100)
		local VP = P * V
		frustum = XFrustum.from_matrix(VP)
	end)

	it("should accept box inside frustum", function()
		local b = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		assert.is_true(frustum:intersects_box(b))
	end)

	it("should reject box fully behind camera", function()
		local b = XAABox(XVec3(-1, -1, 15), XVec3(1, 1, 20))
		assert.is_false(frustum:intersects_box(b))
	end)

	it("should accept box straddling near plane", function()
		-- Near plane at z=4; box from z=3.5 to z=4.5 straddles it
		local b = XAABox(XVec3(-0.5, -0.5, 3.5), XVec3(0.5, 0.5, 4.5))
		assert.is_true(frustum:intersects_box(b))
	end)

	it("should reject box fully beyond far plane", function()
		local b = XAABox(XVec3(-1, -1, -200), XVec3(1, 1, -150))
		assert.is_false(frustum:intersects_box(b))
	end)

	it("should reject box fully outside side plane", function()
		local b = XAABox(XVec3(500, 500, -10), XVec3(510, 510, -5))
		assert.is_false(frustum:intersects_box(b))
	end)
end)

describe("XBoundingSphere:intersectRay", function()
	it("hit sphere returns nearest point on surface", function()
		local sphere = XBoundingSphere(XVec3(0, 0, -10), 2)
		local ray = XRay(XVec3(0, 0, 0), XVec3(0, 0, -1))
		local hit = sphere:intersectRay(ray)
		assert.is_not_nil(hit)
		-- Nearest intersection at z = -8
		assert.are.near(0, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(-8, hit.z, 1e-6)
		-- Verify point lies on sphere surface
		local dist = (hit - sphere.center):length()
		assert.are.near(sphere.radius, dist, 1e-6)
	end)

	it("miss returns nil", function()
		local sphere = XBoundingSphere(XVec3(0, 0, -10), 2)
		local ray = XRay(XVec3(0, 5, 0), XVec3(0, 0, -1))
		assert.is_nil(sphere:intersectRay(ray))
	end)

	it("ray origin inside sphere returns exit point", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 5)
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local hit = sphere:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(5, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(0, hit.z, 1e-6)
	end)

	it("tangent ray returns point", function()
		local sphere = XBoundingSphere(XVec3(0, 1, 0), 1)
		local ray = XRay(XVec3(-5, 0, 0), XVec3(1, 0, 0))
		local hit = sphere:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(0, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(0, hit.z, 1e-6)
	end)

	it("ray pointing away returns nil", function()
		local sphere = XBoundingSphere(XVec3(0, 0, -10), 2)
		local ray = XRay(XVec3(0, 0, 0), XVec3(0, 0, 1))
		assert.is_nil(sphere:intersectRay(ray))
	end)
end)

describe("XAABox:intersectRay", function()
	it("hit box returns nearest point on surface", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local ray = XRay(XVec3(-5, 0, 0), XVec3(1, 0, 0))
		local hit = box:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(-1, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(0, hit.z, 1e-6)
	end)

	it("miss returns nil", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local ray = XRay(XVec3(-5, 5, 0), XVec3(1, 0, 0))
		assert.is_nil(box:intersectRay(ray))
	end)

	it("ray origin inside box returns exit point", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local hit = box:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(1, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(0, hit.z, 1e-6)
	end)

	it("ray parallel to face but outside returns nil", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local ray = XRay(XVec3(0, 5, 0), XVec3(1, 0, 0))
		assert.is_nil(box:intersectRay(ray))
	end)

	it("ray along edge hits", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local ray = XRay(XVec3(-5, 1, 1), XVec3(1, 0, 0))
		local hit = box:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(-1, hit.x, 1e-6)
	end)
end)

describe("XRay:intersectTriangle", function()
	it("ray through triangle center returns point", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(3, 0, -5)
		local v2 = XVec3(0, 3, -5)
		local ray = XRay(XVec3(0.5, 0.5, 0), XVec3(0, 0, -1))
		local hit = ray:intersectTriangle(v0, v1, v2)
		assert.is_not_nil(hit)
		assert.are.near(0.5, hit.x, 1e-6)
		assert.are.near(0.5, hit.y, 1e-6)
		assert.are.near(-5, hit.z, 1e-6)
	end)

	it("ray missing triangle returns nil", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(3, 0, -5)
		local v2 = XVec3(0, 3, -5)
		local ray = XRay(XVec3(10, 10, 0), XVec3(0, 0, -1))
		assert.is_nil(ray:intersectTriangle(v0, v1, v2))
	end)

	it("ray parallel to triangle returns nil", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(3, 0, -5)
		local v2 = XVec3(0, 3, -5)
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		assert.is_nil(ray:intersectTriangle(v0, v1, v2))
	end)

	it("ray hitting edge returns point", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(2, 0, -5)
		local v2 = XVec3(0, 2, -5)
		-- Point on edge v0-v1 at (1, 0, -5)
		local ray = XRay(XVec3(1, 0, 0), XVec3(0, 0, -1))
		local hit = ray:intersectTriangle(v0, v1, v2)
		assert.is_not_nil(hit)
		assert.are.near(1, hit.x, 1e-6)
		assert.are.near(0, hit.y, 1e-6)
		assert.are.near(-5, hit.z, 1e-6)
	end)

	it("ray pointing away returns nil", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(3, 0, -5)
		local v2 = XVec3(0, 3, -5)
		local ray = XRay(XVec3(0.5, 0.5, 0), XVec3(0, 0, 1))
		assert.is_nil(ray:intersectTriangle(v0, v1, v2))
	end)

	it("backface hit returns point (no culling)", function()
		local v0 = XVec3(0, 0, -5)
		local v1 = XVec3(3, 0, -5)
		local v2 = XVec3(0, 3, -5)
		-- Reverse winding by swapping v1 and v2
		local ray = XRay(XVec3(0.5, 0.5, 0), XVec3(0, 0, -1))
		local hit = ray:intersectTriangle(v0, v2, v1)
		assert.is_not_nil(hit)
		assert.are.near(-5, hit.z, 1e-6)
	end)
end)

describe("XBoundingSphere:intersects_box / XAABox:intersects_sphere", function()
	it("sphere inside box", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 1)
		local box = XAABox(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		assert.is_true(sphere:intersects_box(box))
	end)

	it("sphere outside box", function()
		local sphere = XBoundingSphere(XVec3(20, 20, 20), 1)
		local box = XAABox(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		assert.is_false(sphere:intersects_box(box))
	end)

	it("sphere touching box corner", function()
		local box = XAABox(XVec3(0, 0, 0), XVec3(1, 1, 1))
		-- Distance from sphere center to corner (1,1,1) is sqrt(3) ~= 1.732
		local sphere = XBoundingSphere(XVec3(1 + math.sqrt(3), 1, 1), math.sqrt(3))
		assert.is_true(sphere:intersects_box(box))
	end)

	it("sphere overlapping box face", function()
		local sphere = XBoundingSphere(XVec3(6, 0, 0), 2)
		local box = XAABox(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		assert.is_true(sphere:intersects_box(box))
	end)

	it("box fully inside sphere", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 100)
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		assert.is_true(sphere:intersects_box(box))
	end)

	it("symmetry: sphere:intersects_box == box:intersects_sphere", function()
		local sphere = XBoundingSphere(XVec3(4, 0, 0), 2)
		local box = XAABox(XVec3(-5, -5, -5), XVec3(5, 5, 5))
		assert.are.equal(sphere:intersects_box(box), box:intersects_sphere(sphere))

		local sphere2 = XBoundingSphere(XVec3(20, 20, 20), 1)
		assert.are.equal(sphere2:intersects_box(box), box:intersects_sphere(sphere2))
	end)
end)

describe("XPlane:distance_to_point", function()
	it("positive side returns positive distance", function()
		local plane = XPlane(XVec3(0, 1, 0), -5) -- y = 5 plane
		local d = plane:distance_to_point(XVec3(0, 8, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("negative side returns negative distance", function()
		local plane = XPlane(XVec3(0, 1, 0), -5)
		local d = plane:distance_to_point(XVec3(0, 2, 0))
		assert.are.near(-3, d, 1e-6)
	end)

	it("point on plane returns 0", function()
		local plane = XPlane(XVec3(0, 1, 0), -5)
		local d = plane:distance_to_point(XVec3(0, 5, 0))
		assert.are.near(0, d, 1e-6)
	end)
end)

describe("XRay:distance_to_point", function()
	it("point on ray returns 0", function()
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local d = ray:distance_to_point(XVec3(5, 0, 0))
		assert.are.near(0, d, 1e-6)
	end)

	it("point perpendicular to ray", function()
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local d = ray:distance_to_point(XVec3(5, 3, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("point behind ray origin returns distance to origin", function()
		local ray = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local d = ray:distance_to_point(XVec3(-3, 4, 0))
		-- Closest point is clamped to origin, distance = sqrt(9+16) = 5
		assert.are.near(5, d, 1e-6)
	end)
end)

describe("XBoundingSphere:distance_to_point", function()
	it("point outside returns positive distance", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 5)
		local d = sphere:distance_to_point(XVec3(8, 0, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("point inside returns negative distance", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 5)
		local d = sphere:distance_to_point(XVec3(2, 0, 0))
		assert.are.near(-3, d, 1e-6)
	end)

	it("point on surface returns 0", function()
		local sphere = XBoundingSphere(XVec3(0, 0, 0), 5)
		local d = sphere:distance_to_point(XVec3(5, 0, 0))
		assert.are.near(0, d, 1e-6)
	end)
end)

describe("XAABox:distance_to_point", function()
	it("point outside returns distance to nearest face", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local d = box:distance_to_point(XVec3(4, 0, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("point inside returns 0", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local d = box:distance_to_point(XVec3(0, 0, 0))
		assert.are.near(0, d, 1e-6)
	end)

	it("point on surface returns 0", function()
		local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
		local d = box:distance_to_point(XVec3(1, 0, 0))
		assert.are.near(0, d, 1e-6)
	end)

	it("point at corner", function()
		local box = XAABox(XVec3(0, 0, 0), XVec3(1, 1, 1))
		-- Point at (2, 2, 2), distance to corner (1,1,1) = sqrt(3)
		local d = box:distance_to_point(XVec3(2, 2, 2))
		assert.are.near(math.sqrt(3), d, 1e-6)
	end)
end)

describe("XMat3:transpose", function()
	it("should transpose identity to identity", function()
		local m = XMat3.new()
		assert.is_true(m:transpose() == XMat3.new())
	end)

	it("should swap off-diagonal elements", function()
		local m = XMat3.new(1, 2, 3, 4, 5, 6, 7, 8, 9)
		local t = m:transpose()
		assert.is_true(t == XMat3.new(1, 4, 7, 2, 5, 8, 3, 6, 9))
	end)

	it("should satisfy M * M^T = I for orthonormal rotation", function()
		local m = XMat3.rotation_y(math.pi / 3)
		local product = m * m:transpose()
		assert.is_true(product == XMat3.new())
	end)
end)

describe("XQuat.from_mat3", function()
	it("should roundtrip identity", function()
		local q = XQuat()
		local m = q:to_mat3()
		local q2 = XQuat.from_mat3(m)
		assert.is_true(q == q2)
	end)

	it("should roundtrip 90 deg Y rotation", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 2)
		local m = q:to_mat3()
		local q2 = XQuat.from_mat3(m)
		assert.is_true(q == q2)
	end)

	it("should roundtrip 180 deg Z rotation", function()
		local q = XQuat.from_axis_angle(XVec3(0, 0, 1), math.pi)
		local m = q:to_mat3()
		local q2 = XQuat.from_mat3(m)
		-- q and -q represent same rotation
		local same = (q == q2) or (-q == q2)
		assert.is_true(same)
	end)

	it("should roundtrip arbitrary rotation", function()
		local axis = XVec3(1, 2, 3):normalize()
		local q = XQuat.from_axis_angle(axis, 1.23)
		local m = q:to_mat3()
		local q2 = XQuat.from_mat3(m)
		assert.is_true(q == q2)
	end)

	it("should produce unit quaternion", function()
		local m = XMat3.rotation_x(0.7)
		local q = XQuat.from_mat3(m)
		assert.are.near(1, q:length(), 1e-9)
	end)
end)

describe("XMat4:decompose", function()
	it("should decompose identity matrix", function()
		local t, r, s = XMat4.new():decompose()
		assert.is_true(t == XVec3(0, 0, 0))
		assert.is_true(s == XVec3(1, 1, 1))
		assert.is_true(r == XQuat())
	end)

	it("should decompose pure translation", function()
		local m = XMat4.translate(3, 4, 5)
		local t, r, s = m:decompose()
		assert.is_true(t == XVec3(3, 4, 5))
		assert.is_true(s == XVec3(1, 1, 1))
		assert.is_true(r == XQuat())
	end)

	it("should decompose pure scale", function()
		local m = XMat4.scale(2, 3, 4)
		local t, r, s = m:decompose()
		assert.is_true(t == XVec3(0, 0, 0))
		assert.is_true(s == XVec3(2, 3, 4))
	end)

	it("should decompose pure rotation", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 4)
		local m = q:to_mat4()
		local t, r, s = m:decompose()
		assert.is_true(t == XVec3(0, 0, 0))
		assert.is_true(s == XVec3(1, 1, 1))
		assert.is_true(r == q)
	end)

	it("should decompose TRS and roundtrip", function()
		local T = XMat4.translate(1, 2, 3)
		local q = XQuat.from_euler(0.3, 0.5, 0.7)
		local R = q:to_mat4()
		local S = XMat4.scale(2, 3, 4)
		local original = T * R * S
		local t, r, s = original:decompose()
		-- Recompose
		local recomposed = XMat4.translate(t.x, t.y, t.z) * r:to_mat4() * XMat4.scale(s.x, s.y, s.z)
		assert.is_true(original == recomposed)
	end)

	it("should decompose uniform scale TRS", function()
		local T = XMat4.translate(5, 10, 15)
		local q = XQuat.from_axis_angle(XVec3(1, 0, 0), 1.0)
		local R = q:to_mat4()
		local S = XMat4.scale(3, 3, 3)
		local original = T * R * S
		local t, r, s = original:decompose()
		assert.is_true(t == XVec3(5, 10, 15))
		assert.is_true(s == XVec3(3, 3, 3))
		assert.is_true(r == q)
	end)

	it("should handle negative determinant (reflection)", function()
		local m = XMat4.scale(-2, 3, 4)
		local t, r, s = m:decompose()
		assert.is_true(t == XVec3(0, 0, 0))
		assert.are.near(-2, s.x, 1e-6)
		assert.are.near(3, s.y, 1e-6)
		assert.are.near(4, s.z, 1e-6)
	end)

	it("should decompose rotation matching quat roundtrip", function()
		local q = XQuat.from_euler(0.1, 0.2, 0.3)
		local m = q:to_mat4()
		local _, r, _ = m:decompose()
		-- Verify rotation matches by applying to a test vector
		local v = XVec3(1, 2, 3)
		local v1 = q * v
		local v2 = r * v
		assert.are.near(v1.x, v2.x, 1e-6)
		assert.are.near(v1.y, v2.y, 1e-6)
		assert.are.near(v1.z, v2.z, 1e-6)
	end)
end)

describe("XTriangle", function()
	local tri
	setup(function()
		tri = XTriangle(XVec3(0, 0, 0), XVec3(4, 0, 0), XVec3(0, 4, 0))
	end)

	it("should create with callable syntax", function()
		assert.is_truthy(tri)
		assert.is_true(tri.v0 == XVec3(0, 0, 0))
	end)

	it("should format __tostring", function()
		local s = tostring(tri)
		assert.is_truthy(string.find(s, "XTriangle"))
	end)

	it("should compare equal triangles", function()
		local tri2 = XTriangle(XVec3(0, 0, 0), XVec3(4, 0, 0), XVec3(0, 4, 0))
		assert.is_true(tri == tri2)
	end)

	it("should compute normal", function()
		local n = tri:normal()
		assert.are.near(0, n.x, 1e-6)
		assert.are.near(0, n.y, 1e-6)
		assert.are.near(1, n.z, 1e-6)
	end)

	it("should compute area", function()
		assert.are.near(8, tri:area(), 1e-6)
	end)

	it("should compute centroid", function()
		local c = tri:centroid()
		assert.are.near(4/3, c.x, 1e-6)
		assert.are.near(4/3, c.y, 1e-6)
		assert.are.near(0, c.z, 1e-6)
	end)

	it("should compute barycentric coordinates", function()
		local u, v, w = tri:get_barycentric(XVec3(0, 0, 0))
		assert.are.near(1, u, 1e-6)
		assert.are.near(0, v, 1e-6)
		assert.are.near(0, w, 1e-6)
	end)

	it("should detect point containment (inside)", function()
		assert.is_true(tri:contains_point(XVec3(1, 1, 0)))
	end)

	it("should detect point containment (outside)", function()
		assert.is_false(tri:contains_point(XVec3(3, 3, 0)))
	end)

	it("should detect point on vertex", function()
		assert.is_true(tri:contains_point(XVec3(0, 0, 0)))
	end)

	it("should detect point on edge", function()
		assert.is_true(tri:contains_point(XVec3(2, 0, 0)))
	end)

	it("should intersect ray through center", function()
		local ray = XRay(XVec3(1, 1, 5), XVec3(0, 0, -1))
		local hit = tri:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(0, hit.z, 1e-6)
	end)

	it("should miss ray outside triangle", function()
		local ray = XRay(XVec3(10, 10, 5), XVec3(0, 0, -1))
		assert.is_nil(tri:intersectRay(ray))
	end)

	it("should compute distance_to_point above center", function()
		local d = tri:distance_to_point(XVec3(1, 1, 3))
		assert.are.near(3, d, 1e-6)
	end)

	it("should compute distance_to_point outside (nearest edge)", function()
		local d = tri:distance_to_point(XVec3(-1, 0, 0))
		assert.are.near(1, d, 1e-6)
	end)
end)

describe("XCapsule", function()
	local cap
	setup(function()
		cap = XCapsule(XVec3(0, 0, 0), XVec3(0, 10, 0), 2)
	end)

	it("should create with callable syntax", function()
		assert.is_truthy(cap)
		assert.are.near(2, cap.radius, 1e-9)
	end)

	it("should format __tostring", function()
		local s = tostring(cap)
		assert.is_truthy(string.find(s, "XCapsule"))
	end)

	it("should compare equal capsules", function()
		local cap2 = XCapsule(XVec3(0, 0, 0), XVec3(0, 10, 0), 2)
		assert.is_true(cap == cap2)
	end)

	it("should compute center", function()
		local c = cap:get_center()
		assert.is_true(c == XVec3(0, 5, 0))
	end)

	it("should compute length", function()
		assert.are.near(10, cap:get_length(), 1e-6)
	end)

	it("should detect point containment (on axis)", function()
		assert.is_true(cap:contains_point(XVec3(0, 5, 0)))
	end)

	it("should detect point containment (at radius)", function()
		assert.is_true(cap:contains_point(XVec3(2, 5, 0)))
	end)

	it("should reject point outside", function()
		assert.is_false(cap:contains_point(XVec3(5, 5, 0)))
	end)

	it("should compute distance_to_point outside", function()
		local d = cap:distance_to_point(XVec3(5, 5, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("should compute distance_to_point inside (negative)", function()
		local d = cap:distance_to_point(XVec3(0, 5, 0))
		assert.are.near(-2, d, 1e-6)
	end)

	it("should intersect ray hitting cylinder body", function()
		local ray = XRay(XVec3(10, 5, 0), XVec3(-1, 0, 0))
		local hit = cap:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(2, hit.x, 1e-6)
		assert.are.near(5, hit.y, 1e-6)
	end)

	it("should return nil for ray missing capsule", function()
		local ray = XRay(XVec3(10, 5, 0), XVec3(0, 1, 0))
		assert.is_nil(cap:intersectRay(ray))
	end)

	it("should detect sphere intersection", function()
		local sphere = XBoundingSphere(XVec3(4, 5, 0), 3)
		assert.is_true(cap:intersects_sphere(sphere))
	end)

	it("should detect capsule-capsule intersection", function()
		local other = XCapsule(XVec3(3, 0, 0), XVec3(3, 10, 0), 2)
		assert.is_true(cap:intersects_capsule(other))
	end)

	it("should reject non-intersecting capsules", function()
		local other = XCapsule(XVec3(10, 0, 0), XVec3(10, 10, 0), 1)
		assert.is_false(cap:intersects_capsule(other))
	end)

	it("should handle degenerate case (start == end_point) as sphere", function()
		local degen = XCapsule(XVec3(0, 0, 0), XVec3(0, 0, 0), 5)
		assert.is_true(degen:contains_point(XVec3(3, 0, 0)))
		assert.is_false(degen:contains_point(XVec3(6, 0, 0)))
	end)
end)

describe("XOBB", function()
	it("should create with identity orientation", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		assert.is_truthy(obb)
		assert.is_true(obb.orientation == XMat3.new())
	end)

	it("should create from quaternion", function()
		local q = XQuat.from_axis_angle(XVec3(0, 1, 0), math.pi / 4)
		local obb = XOBB.from_quat(XVec3(0, 0, 0), XVec3(1, 1, 1), q)
		assert.is_true(obb.orientation == q:to_mat3())
	end)

	it("should format __tostring", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		assert.is_truthy(string.find(tostring(obb), "XOBB"))
	end)

	it("should compare equal OBBs", function()
		local a = XOBB(XVec3(0, 0, 0), XVec3(1, 2, 3))
		local b = XOBB(XVec3(0, 0, 0), XVec3(1, 2, 3))
		assert.is_true(a == b)
	end)

	it("should detect point containment (axis-aligned)", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(2, 2, 2))
		assert.is_true(obb:contains_point(XVec3(1, 1, 1)))
		assert.is_false(obb:contains_point(XVec3(3, 0, 0)))
	end)

	it("should detect point containment (rotated)", function()
		local q = XQuat.from_axis_angle(XVec3(0, 0, 1), math.pi / 4)
		local obb = XOBB.from_quat(XVec3(0, 0, 0), XVec3(2, 1, 1), q)
		-- Point along the rotated x-axis at 45 degrees
		local p = XVec3(1, 1, 0) -- this is along the rotated x-axis direction
		assert.is_true(obb:contains_point(p))
	end)

	it("should return 8 corners", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local corners = obb:get_corners()
		assert.are.equal(8, #corners)
	end)

	it("axis-aligned OBB corners should match AABB corners", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local corners = obb:get_corners()
		-- All corners should have absolute values of 1 on each axis
		for _, c in ipairs(corners) do
			assert.are.near(1, math.abs(c.x), 1e-6)
			assert.are.near(1, math.abs(c.y), 1e-6)
			assert.are.near(1, math.abs(c.z), 1e-6)
		end
	end)

	it("should intersect ray (axis-aligned)", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local ray = XRay(XVec3(-5, 0, 0), XVec3(1, 0, 0))
		local hit = obb:intersectRay(ray)
		assert.is_not_nil(hit)
		assert.are.near(-1, hit.x, 1e-6)
	end)

	it("should miss ray", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local ray = XRay(XVec3(-5, 5, 0), XVec3(1, 0, 0))
		assert.is_nil(obb:intersectRay(ray))
	end)

	it("should intersect ray (rotated OBB)", function()
		local q = XQuat.from_axis_angle(XVec3(0, 0, 1), math.pi / 4)
		local obb = XOBB.from_quat(XVec3(0, 0, 0), XVec3(2, 0.5, 1), q)
		-- Ray along x-axis should hit the rotated box
		local ray = XRay(XVec3(-5, 0, 0), XVec3(1, 0, 0))
		local hit = obb:intersectRay(ray)
		assert.is_not_nil(hit)
	end)

	it("should intersect AABB", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local aabb = XAABox(XVec3(-0.5, -0.5, -0.5), XVec3(0.5, 0.5, 0.5))
		assert.is_true(obb:intersects_aabb(aabb))
	end)

	it("should not intersect distant AABB", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local aabb = XAABox(XVec3(5, 5, 5), XVec3(6, 6, 6))
		assert.is_false(obb:intersects_aabb(aabb))
	end)

	it("should intersect OBB-OBB (overlapping)", function()
		local a = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local b = XOBB(XVec3(1.5, 0, 0), XVec3(1, 1, 1))
		assert.is_true(a:intersects_box(b))
	end)

	it("should not intersect OBB-OBB (separated)", function()
		local a = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local b = XOBB(XVec3(5, 0, 0), XVec3(1, 1, 1))
		assert.is_false(a:intersects_box(b))
	end)

	it("should compute distance_to_point (outside)", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local d = obb:distance_to_point(XVec3(4, 0, 0))
		assert.are.near(3, d, 1e-6)
	end)

	it("should compute distance_to_point (inside = 0)", function()
		local obb = XOBB(XVec3(0, 0, 0), XVec3(1, 1, 1))
		local d = obb:distance_to_point(XVec3(0, 0, 0))
		assert.are.near(0, d, 1e-6)
	end)
end)

describe("XBezier3", function()
	local bez
	setup(function()
		bez = XBezier3(XVec3(0, 0, 0), XVec3(1, 2, 0), XVec3(3, 2, 0), XVec3(4, 0, 0))
	end)

	it("should evaluate at t=0 to p0", function()
		assert.is_true(bez:evaluate(0) == XVec3(0, 0, 0))
	end)

	it("should evaluate at t=1 to p3", function()
		assert.is_true(bez:evaluate(1) == XVec3(4, 0, 0))
	end)

	it("should evaluate at t=0.5 (midpoint)", function()
		local mid = bez:evaluate(0.5)
		assert.is_truthy(mid)
		-- For this curve, midpoint should be somewhere reasonable
		assert.is_true(mid.x > 0 and mid.x < 4)
	end)

	it("should compute tangent at t=0 pointing toward p1", function()
		local tan = bez:tangent(0)
		-- Tangent at t=0 = 3*(p1 - p0) = 3*(1,2,0) = (3,6,0)
		assert.are.near(3, tan.x, 1e-6)
		assert.are.near(6, tan.y, 1e-6)
	end)

	it("should split into two curves", function()
		local left, right = bez:split(0.5)
		assert.is_true(left:evaluate(0) == bez:evaluate(0))
		assert.is_true(right:evaluate(1) == bez:evaluate(1))
		-- Split point should match
		assert.is_true(left:evaluate(1) == bez:evaluate(0.5))
	end)

	it("should compute positive arc length", function()
		local len = bez:length()
		assert.is_true(len > 0)
		-- Straight line from p0 to p3 would be 4, curve should be longer
		assert.is_true(len > 4)
	end)

	it("should format __tostring", function()
		assert.is_truthy(string.find(tostring(bez), "XBezier3"))
	end)

	it("should compare equal curves", function()
		local bez2 = XBezier3(XVec3(0, 0, 0), XVec3(1, 2, 0), XVec3(3, 2, 0), XVec3(4, 0, 0))
		assert.is_true(bez == bez2)
	end)
end)

describe("XCatmullRom", function()
	local cr
	setup(function()
		cr = XCatmullRom(XVec3(-1, 0, 0), XVec3(0, 0, 0), XVec3(1, 0, 0), XVec3(2, 0, 0))
	end)

	it("should evaluate at t=0 to p1", function()
		assert.is_true(cr:evaluate(0) == XVec3(0, 0, 0))
	end)

	it("should evaluate at t=1 to p2", function()
		assert.is_true(cr:evaluate(1) == XVec3(1, 0, 0))
	end)

	it("should evaluate at t=0.5 to midpoint of p1-p2 for collinear points", function()
		local mid = cr:evaluate(0.5)
		assert.are.near(0.5, mid.x, 1e-6)
		assert.are.near(0, mid.y, 1e-6)
	end)

	it("should compute tangent", function()
		local tan = cr:tangent(0)
		-- For evenly spaced collinear points, tangent at t=0 should point in +x
		assert.is_true(tan.x > 0)
	end)

	it("should compute positive arc length", function()
		local len = cr:length()
		assert.is_true(len > 0)
		-- Collinear points: length should be ~1 (distance from p1 to p2)
		assert.are.near(1, len, 1e-3)
	end)

	it("should format __tostring", function()
		assert.is_truthy(string.find(tostring(cr), "XCatmullRom"))
	end)

	it("should compare equal splines", function()
		local cr2 = XCatmullRom(XVec3(-1, 0, 0), XVec3(0, 0, 0), XVec3(1, 0, 0), XVec3(2, 0, 0))
		assert.is_true(cr == cr2)
	end)
end)

describe("XRay:distance_to_ray", function()
	it("should return 0 for identical rays", function()
		local r = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		assert.are.near(0, r:distance_to_ray(r), 1e-6)
	end)

	it("should compute distance for parallel offset rays", function()
		local r1 = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local r2 = XRay(XVec3(0, 3, 0), XVec3(1, 0, 0))
		assert.are.near(3, r1:distance_to_ray(r2), 1e-6)
	end)

	it("should compute distance for perpendicular skew rays", function()
		local r1 = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local r2 = XRay(XVec3(0, 0, 5), XVec3(0, 1, 0))
		assert.are.near(5, r1:distance_to_ray(r2), 1e-6)
	end)

	it("should compute distance for intersecting rays (=0)", function()
		local r1 = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local r2 = XRay(XVec3(5, 0, 0), XVec3(0, 1, 0))
		assert.are.near(0, r1:distance_to_ray(r2), 1e-6)
	end)

	it("should handle opposing rays", function()
		local r1 = XRay(XVec3(0, 0, 0), XVec3(1, 0, 0))
		local r2 = XRay(XVec3(5, 3, 0), XVec3(-1, 0, 0))
		-- Rays travel toward each other, closest point at origins projected
		-- r1 at t=5 reaches (5,0,0), r2 at t=0 is at (5,3,0), distance=3
		assert.are.near(3, r1:distance_to_ray(r2), 1e-6)
	end)
end)