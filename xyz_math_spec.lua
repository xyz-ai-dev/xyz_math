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