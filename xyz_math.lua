XVec2 = {}
XVec2_mt = {__index = XVec2}

function XVec2.new(x, y)
    return setmetatable({x = x or 0, y = y or 0}, XVec2_mt)
end

-- Make XVec2 itself callable
setmetatable(XVec2, {
    __call = function(_, x, y)
        return XVec2.new(x, y)
    end
})

function XVec2.__add(a, b)
    return XVec2.new(a.x + b.x, a.y + b.y)
end

function XVec2.__sub(a, b)
    return XVec2.new(a.x - b.x, a.y - b.y)
end

function XVec2.__mul(a, b)
    if type(a) == "number" then
        return XVec2.new(a * b.x, a * b.y)
    elseif type(b) == "number" then
        return XVec2.new(a.x * b, a.y * b)
    else
        return XVec2.new(a.x * b.x, a.y * b.y) -- Component-wise multiplication
    end
end

function XVec2:dot(other)
    return self.x * other.x + self.y * other.y
end

function XVec2:cross(other)
    return self.x * other.y - self.y * other.x -- Returns scalar in 2D
end

function XVec2:normalize()
    local len = math.sqrt(self.x^2 + self.y^2)
    if len > 0 then
        return XVec2.new(self.x / len, self.y / len)
    end
    return XVec2.new(0, 0)
end

function XVec2:length()
    return math.sqrt(self.x^2 + self.y^2)
end

-- Assign metamethods to the metatable
XVec2_mt.__add = XVec2.__add
XVec2_mt.__sub = XVec2.__sub
XVec2_mt.__mul = XVec2.__mul

XVec3 = {}
XVec3_mt = {__index = XVec3}

function XVec3.new(x, y, z)
    return setmetatable({x = x or 0, y = y or 0, z = z or 0}, XVec3_mt)
end

-- Make XVec3 itself callable
setmetatable(XVec3, {
    __call = function(_, x, y, z)
        return XVec3.new(x, y, z)
    end
})

function XVec3.__add(a, b)
    return XVec3.new(a.x + b.x, a.y + b.y, a.z + b.z)
end

function XVec3.__sub(a, b)
    return XVec3.new(a.x - b.x, a.y - b.y, a.z - b.z)
end

function XVec3.__mul(a, b)
    if type(a) == "number" then
        return XVec3.new(a * b.x, a * b.y, a * b.z)
    elseif type(b) == "number" then
        return XVec3.new(a.x * b, a.y * b, a.z * b)
    else
        return XVec3.new(a.x * b.x, a.y * b.y, a.z * b.z)
    end
end

function XVec3:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z
end

function XVec3:cross(other)
    return XVec3.new(
        self.y * other.z - self.z * other.y,
        self.z * other.x - self.x * other.z,
        self.x * other.y - self.y * other.x
    )
end

function XVec3:normalize()
    local len = math.sqrt(self.x^2 + self.y^2 + self.z^2)
    if len > 0 then
        return XVec3.new(self.x / len, self.y / len, self.z / len)
    end
    return XVec3.new(0, 0, 0)
end

function XVec3:length()
    return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2)
end

-- Assign metamethods to the metatable
XVec3_mt.__add = XVec3.__add
XVec3_mt.__sub = XVec3.__sub
XVec3_mt.__mul = XVec3.__mul

XVec4 = {}
XVec4_mt = {__index = XVec4}

function XVec4.new(x, y, z, w)
    return setmetatable({x = x or 0, y = y or 0, z = z or 0, w = w or 0}, XVec4_mt)
end

-- Make XVec4 itself callable
setmetatable(XVec4, {
    __call = function(_, x, y, z, w)
        return XVec4.new(x, y, z, w)
    end
})

function XVec4.__add(a, b)
    return XVec4.new(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w)
end

function XVec4.__sub(a, b)
    return XVec4.new(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w)
end

function XVec4.__mul(a, b)
    if type(a) == "number" then
        return XVec4.new(a * b.x, a * b.y, a * b.z, a * b.w)
    elseif type(b) == "number" then
        return XVec4.new(a.x * b, a.y * b, a.z * b, a.w * b)
    else
        return XVec4.new(a.x * b.x, a.y * b.y, a.z * b.z, a.w * b.w)
    end
end

function XVec4:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w
end

function XVec4:normalize()
    local len = math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
    if len > 0 then
        return XVec4.new(self.x / len, self.y / len, self.z / len, self.w / len)
    end
    return XVec4.new(0, 0, 0, 0)
end

function XVec4:length()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
end

XVec4_mt.__add = XVec4.__add
XVec4_mt.__sub = XVec4.__sub
XVec4_mt.__mul = XVec4.__mul

function XRGB(r, g, b)
    return XVec3.new(r, g, b)
end

function XRGBA(r, g, b, a)
    return XVec4.new(r, g, b, a)
end

XMat3 = {}
XMat3_mt = {__index = XMat3}

function XMat3.new(...)
    local args = {...}
    return setmetatable({
        args[1] or 1, args[2] or 0, args[3] or 0,
        args[4] or 0, args[5] or 1, args[6] or 0,
        args[7] or 0, args[8] or 0, args[9] or 1
    }, XMat3_mt)
end

-- Make XMat3 itself callable
setmetatable(XMat3, {
    __call = function(_, ...)
        return XMat3.new(...)
    end
})

function XMat3.__mul(a, b)
    if getmetatable(b) == XMat3_mt then
        return XMat3.new(
            a[1]*b[1] + a[2]*b[4] + a[3]*b[7],
            a[1]*b[2] + a[2]*b[5] + a[3]*b[8],
            a[1]*b[3] + a[2]*b[6] + a[3]*b[9],
            a[4]*b[1] + a[5]*b[4] + a[6]*b[7],
            a[4]*b[2] + a[5]*b[5] + a[6]*b[8],
            a[4]*b[3] + a[5]*b[6] + a[6]*b[9],
            a[7]*b[1] + a[8]*b[4] + a[9]*b[7],
            a[7]*b[2] + a[8]*b[5] + a[9]*b[8],
            a[7]*b[3] + a[8]*b[6] + a[9]*b[9]
        )
    elseif getmetatable(b) == XVec3_mt then
        return XVec3.new(
            a[1]*b.x + a[2]*b.y + a[3]*b.z,
            a[4]*b.x + a[5]*b.y + a[6]*b.z,
            a[7]*b.x + a[8]*b.y + a[9]*b.z
        )
    else
        error("Invalid multiplication")
    end
end

function XMat3:inverse()
    local a = self
    local det = a[1] * (a[5] * a[9] - a[6] * a[8]) - a[2] * (a[4] * a[9] - a[6] * a[7]) + a[3] * (a[4] * a[8] - a[5] * a[7])
    if det == 0 then
        error("Matrix is not invertible")
    end
    local invdet = 1 / det
    return XMat3.new(
        (a[5] * a[9] - a[6] * a[8]) * invdet,
        (a[3] * a[8] - a[2] * a[9]) * invdet,
        (a[2] * a[6] - a[3] * a[5]) * invdet,
        (a[6] * a[7] - a[4] * a[9]) * invdet,
        (a[1] * a[9] - a[3] * a[7]) * invdet,
        (a[3] * a[4] - a[1] * a[6]) * invdet,
        (a[4] * a[8] - a[5] * a[7]) * invdet,
        (a[2] * a[7] - a[1] * a[8]) * invdet,
        (a[1] * a[5] - a[2] * a[4]) * invdet
    )
end
-- Creates a scale matrix
function XMat3.scale(x, y, z)
	return XMat3.new(
		x or 1, 0, 0,
		0, y or 1, 0,
		0, 0, z or 1
	)
end

-- Creates a translation matrix (note: XMat3 cannot do true translation, use XMat4 for that)
function XMat3.translate(x, y)
	error("Translation not supported in 3x3 matrix, use XMat4 instead")
end

-- Creates a rotation matrix around Z axis (in radians)
function XMat3.rotation_z(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat3.new(
		c, -s, 0,
		s, c, 0,
		0, 0, 1
	)
end

-- Creates a rotation matrix around X axis (in radians) 
function XMat3.rotation_x(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat3.new(
		1, 0, 0,
		0, c, -s,
		0, s, c
	)
end

-- Creates a rotation matrix around Y axis (in radians)
function XMat3.rotation_y(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat3.new(
		c, 0, s,
		0, 1, 0,
		-s, 0, c
	)
end

-- Creates a rotation matrix around an arbitrary axis (in radians)
function XMat3.rotation_around_axis(axis, angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	local t = 1 - c
	local x = axis.x
	local y = axis.y 
	local z = axis.z
	
	-- Normalize axis vector
	local len = math.sqrt(x*x + y*y + z*z)
	if len > 0 then
		x = x/len
		y = y/len 
		z = z/len
	else
		return XMat3.new() -- Return identity if zero vector
	end
	
	return XMat3.new(
		t*x*x + c,   t*x*y - s*z, t*x*z + s*y,
		t*x*y + s*z, t*y*y + c,   t*y*z - s*x,
		t*x*z - s*y, t*y*z + s*x, t*z*z + c
	)
end

-- Creates a rotation matrix from euler angles (in radians)
function XMat3.from_euler(x, y, z)
	-- Apply rotations in order: Z, Y, X
	local rx = XMat3.rotation_x(x)
	local ry = XMat3.rotation_y(y)
	local rz = XMat3.rotation_z(z)
	return rz * ry * rx
end


-- Assign metamethod to the metatable
XMat3_mt.__mul = XMat3.__mul

XMat4 = {}
XMat4_mt = {__index = XMat4}

function XMat4.new(...)
    local args = {...}
    return setmetatable({
        args[1] or 1, args[2] or 0, args[3] or 0, args[4] or 0,
        args[5] or 0, args[6] or 1, args[7] or 0, args[8] or 0,
        args[9] or 0, args[10] or 0, args[11] or 1, args[12] or 0,
        args[13] or 0, args[14] or 0, args[15] or 0, args[16] or 1
    }, XMat4_mt)
end

-- Make XMat4 itself callable
setmetatable(XMat4, {
    __call = function(_, ...)
        return XMat4.new(...)
    end
})

function XMat4.__mul(a, b)
    if getmetatable(b) == XMat4_mt then
        local c = {}
        for i = 1, 4 do
            for j = 1, 4 do
                c[(i-1)*4 + j] = 0
                for k = 1, 4 do
                    c[(i-1)*4 + j] = c[(i-1)*4 + j] + a[(i-1)*4 + k] * b[(k-1)*4 + j]
                end
            end
        end
        return XMat4.new(unpack(c))
    elseif getmetatable(b) == XVec4_mt then
        return XVec4.new(
            a[1]*b.x + a[2]*b.y + a[3]*b.z + a[4]*b.w,
            a[5]*b.x + a[6]*b.y + a[7]*b.z + a[8]*b.w,
            a[9]*b.x + a[10]*b.y + a[11]*b.z + a[12]*b.w,
            a[13]*b.x + a[14]*b.y + a[15]*b.z + a[16]*b.w
        )
    else
        error("Invalid multiplication")
    end
end
XMat4_mt.__mul = XMat4.__mul

-- Creates a scale matrix
function XMat4.scale(x, y, z)
	return XMat4.new(
		x or 1, 0, 0, 0,
		0, y or 1, 0, 0,
		0, 0, z or 1, 0,
		0, 0, 0, 1
	)
end

-- Creates a translation matrix
function XMat4.translate(x, y, z)
	return XMat4.new(
		1, 0, 0, x or 0,
		0, 1, 0, y or 0,
		0, 0, 1, z or 0,
		0, 0, 0, 1
	)
end

-- Creates a rotation matrix around Z axis (in radians)
function XMat4.rotation_z(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat4.new(
		c, -s, 0, 0,
		s, c, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1
	)
end

-- Creates a rotation matrix around X axis (in radians)
function XMat4.rotation_x(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat4.new(
		1, 0, 0, 0,
		0, c, -s, 0,
		0, s, c, 0,
		0, 0, 0, 1
	)
end

-- Creates a rotation matrix around Y axis (in radians)
function XMat4.rotation_y(angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	return XMat4.new(
		c, 0, s, 0,
		0, 1, 0, 0,
		-s, 0, c, 0,
		0, 0, 0, 1
	)
end

-- Creates a rotation matrix around an arbitrary axis (in radians)
function XMat4.rotation_around_axis(axis, angle)
	local c = math.cos(angle)
	local s = math.sin(angle)
	local t = 1 - c
	local x = axis.x
	local y = axis.y 
	local z = axis.z
	
	-- Normalize axis vector
	local len = math.sqrt(x * x + y * y + z * z)
	x = x / len
	y = y / len 
	z = z / len
	
	return XMat4.new(
		t*x*x + c,   t*x*y - s*z, t*x*z + s*y, 0,
		t*x*y + s*z, t*y*y + c,   t*y*z - s*x, 0,
		t*x*z - s*y, t*y*z + s*x, t*z*z + c,   0,
		0,           0,           0,           1
	)
end

-- Creates a rotation matrix from Euler angles (in radians)
function XMat4.from_euler(x, y, z)
	-- Create individual rotation matrices
	local rx = XMat4.rotation_x(x)
	local ry = XMat4.rotation_y(y)
	local rz = XMat4.rotation_z(z)
	
	-- Combine rotations (order: Z * Y * X)
	return rz * ry * rx
end

-- Note: XMat4:inverse() is complex and omitted here for brevity, but can be implemented using cofactor expansion or Gaussian elimination.

XPlane = {}
XPlane_mt = {__index = XPlane}

function XPlane.new(normal, distance)
    return setmetatable({ normal = normal, distance = distance or 0 }, XPlane_mt)
end

-- Make XPlane itself callable
setmetatable(XPlane, {
    __call = function(_, normal, distance)
        return XPlane.new(normal, distance)
    end
})

function XPlane:side(point)
    local d = self.normal:dot(point) + self.distance
    if d > 0 then
        return 1  -- Positive side
    elseif d < 0 then
        return -1 -- Negative side
    else
        return 0  -- On the plane
    end
end

function XPlane:intersectRay(ray)
    local denom = self.normal:dot(ray.direction)
    if math.abs(denom) < 1e-6 then
        return nil  -- Parallel
    end
    local t = -(self.normal:dot(ray.origin) + self.distance) / denom
    if t >= 0 then
        return ray:pointAt(t) -- Returns intersection point
    end
    return nil -- Intersection behind ray origin
end

XRay = {}
XRay_mt = {__index = XRay}

function XRay.new(origin, direction)
    return setmetatable({origin = origin or XVec3.new(), direction = direction or XVec3.new(0, 0, 1)}, XRay_mt)
end

-- Make XRay itself callable
setmetatable(XRay, {
    __call = function(_, origin, direction)
        return XRay.new(origin, direction)
    end
})

function XRay:pointAt(t)
    return self.origin + t * self.direction
end

function XRay:transform(matrix)
    local origin4 = XVec4.new(self.origin.x, self.origin.y, self.origin.z, 1)
    local direction4 = XVec4.new(self.direction.x, self.direction.y, self.direction.z, 0)
    local new_origin4 = matrix * origin4
    local new_direction4 = matrix * direction4
    local new_origin = XVec3.new(new_origin4.x, new_origin4.y, new_origin4.z)
    local new_direction = XVec3.new(new_direction4.x, new_direction4.y, new_direction4.z)
    return XRay.new(new_origin, new_direction)
end

function XMin(a, b)
    if type(a) == "number" and type(b) == "number" then
        return math.min(a, b)
    elseif getmetatable(a) == XVec2_mt and getmetatable(b) == XVec2_mt then
        return XVec2.new(math.min(a.x, b.x), math.min(a.y, b.y))
    elseif getmetatable(a) == XVec3_mt and getmetatable(b) == XVec3_mt then
        return XVec3.new(math.min(a.x, b.x), math.min(a.y, b.y), math.min(a.z, b.z))
    elseif getmetatable(a) == XVec4_mt and getmetatable(b) == XVec4_mt then
        return XVec4.new(math.min(a.x, b.x), math.min(a.y, b.y), math.min(a.z, b.z), math.min(a.w, b.w))
    else
        error("Invalid types for XMin")
    end
end

function XMax(a, b)
    if type(a) == "number" and type(b) == "number" then
        return math.max(a, b)
    elseif getmetatable(a) == XVec2_mt and getmetatable(b) == XVec2_mt then
        return XVec2.new(math.max(a.x, b.x), math.max(a.y, b.y))
    elseif getmetatable(a) == XVec3_mt and getmetatable(b) == XVec3_mt then
        return XVec3.new(math.max(a.x, b.x), math.max(a.y, b.y), math.max(a.z, b.z))
    elseif getmetatable(a) == XVec4_mt and getmetatable(b) == XVec4_mt then
        return XVec4.new(math.max(a.x, b.x), math.max(a.y, b.y), math.max(a.z, b.z), math.max(a.w, b.w))
    else
        error("Invalid types for XMax")
    end
end

function XClamp(val, min_val, max_val)
    if type(val) == "number" and type(min_val) == "number" and type(max_val) == "number" then
        return math.min(math.max(val, min_val), max_val)
    elseif getmetatable(val) == XVec2_mt and getmetatable(min_val) == XVec2_mt and getmetatable(max_val) == XVec2_mt then
        return XVec2.new(
            math.min(math.max(val.x, min_val.x), max_val.x),
            math.min(math.max(val.y, min_val.y), max_val.y)
        )
    elseif getmetatable(val) == XVec3_mt and getmetatable(min_val) == XVec3_mt and getmetatable(max_val) == XVec3_mt then
        return XVec3.new(
            math.min(math.max(val.x, min_val.x), max_val.x),
            math.min(math.max(val.y, min_val.y), max_val.y),
            math.min(math.max(val.z, min_val.z), max_val.z)
        )
    elseif getmetatable(val) == XVec4_mt and getmetatable(min_val) == XVec4_mt and getmetatable(max_val) == XVec4_mt then
        return XVec4.new(
            math.min(math.max(val.x, min_val.x), max_val.x),
            math.min(math.max(val.y, min_val.y), max_val.y),
            math.min(math.max(val.z, min_val.z), max_val.z),
            math.min(math.max(val.w, min_val.w), max_val.w)
        )
    else
        error("Invalid types for XClamp")
    end
end

-- Represents a bounding sphere with center point and radius
XBoundingSphere = {}
XBoundingSphere_mt = {__index = XBoundingSphere}

-- Creates a new bounding sphere with center point and radius
function XBoundingSphere.new(center, radius)
    if not center then center = XVec3.new(0, 0, 0) end
    if not radius then radius = 0 end
    return setmetatable({
        center = center,
        radius = radius
    }, XBoundingSphere_mt)
end

-- Make XBoundingSphere itself callable
setmetatable(XBoundingSphere, {
    __call = function(_, center, radius)
        return XBoundingSphere.new(center, radius)
    end
})

-- Returns true if the point is inside the sphere
function XBoundingSphere:contains_point(point)
	local dist = (point - self.center):length()
	return dist <= self.radius
end

-- Returns true if the other sphere intersects with this one
function XBoundingSphere:intersects_sphere(other)
	local dist = (other.center - self.center):length()
	return dist <= (self.radius + other.radius)
end

-- Expands the sphere to contain the given point
function XBoundingSphere:expand_to_point(point)
	local dist = (point - self.center):length()
	if dist > self.radius then
		self.radius = dist
	end
end

-- Expands the sphere to contain another sphere
function XBoundingSphere:expand_to_sphere(other)
	local dist = (other.center - self.center):length()
	if dist + other.radius > self.radius then
		self.radius = dist + other.radius
	end
end

-- Creates a sphere that contains both input spheres
function XBoundingSphere.merge(a, b)
	local difference = b.center - a.center
	local length = difference:length()
	local radius1 = a.radius
	local radius2 = b.radius
	
	-- If one sphere contains the other, return the larger one
	if radius1 + radius2 >= length then
		if radius1 - radius2 >= length then
			return XBoundingSphere.new(a.center, radius1)
		end
		
		if radius2 - radius1 >= length then
			return XBoundingSphere.new(b.center, radius2)
		end
	end
	
	-- Calculate direction vector
	local vector
	if length > 0 then
		vector = difference * (1.0 / length)
	else
		vector = XVec3(0, 0, 0)
	end
	
	-- Calculate min and max points
	local min = math.min(-radius1, length - radius2)
	local max = (math.max(radius1, length + radius2) - min) * 0.5
	
	-- Calculate center and radius
	local center = a.center + vector * (max + min)
	local radius = max
	
	return XBoundingSphere.new(center, radius)
end

-- Represents an axis-aligned bounding box with min and max points
XAABox = {}
XAABox_mt = {__index = XAABox}

-- Make XAABox itself callable
setmetatable(XAABox, {
    __call = function(_, min, max)
        return XAABox.new(min, max)
    end
})

-- Creates a new axis-aligned bounding box from min/max points
function XAABox.new(min, max)
	if not min then min = XVec3.new(0,0,0) end
	if not max then max = XVec3.new(0,0,0) end
	return setmetatable({
		min = min,
		max = max
	}, XAABox_mt)
end

-- Returns true if the point is inside the box
function XAABox:contains_point(point)
	return point.x >= self.min.x and point.x <= self.max.x
		and point.y >= self.min.y and point.y <= self.max.y 
		and point.z >= self.min.z and point.z <= self.max.z
end

-- Returns true if the other box intersects with this one
function XAABox:intersects_box(other)
	return self.min.x <= other.max.x and self.max.x >= other.min.x
		and self.min.y <= other.max.y and self.max.y >= other.min.y
		and self.min.z <= other.max.z and self.max.z >= other.min.z
end

-- Expands the box to contain the given point
function XAABox:expand_to_point(point)
	self.min.x = math.min(self.min.x, point.x)
	self.min.y = math.min(self.min.y, point.y)
	self.min.z = math.min(self.min.z, point.z)
	self.max.x = math.max(self.max.x, point.x)
	self.max.y = math.max(self.max.y, point.y)
	self.max.z = math.max(self.max.z, point.z)
end

-- Expands the box to contain another box
function XAABox:expand_to_box(other)
	self.min.x = math.min(self.min.x, other.min.x)
	self.min.y = math.min(self.min.y, other.min.y)
	self.min.z = math.min(self.min.z, other.min.z)
	self.max.x = math.max(self.max.x, other.max.x)
	self.max.y = math.max(self.max.y, other.max.y)
	self.max.z = math.max(self.max.z, other.max.z)
end

-- Creates a box that contains both input boxes
function XAABox.merge(a, b)
	local min = XVec3.new(
		math.min(a.min.x, b.min.x),
		math.min(a.min.y, b.min.y),
		math.min(a.min.z, b.min.z)
	)
	local max = XVec3.new(
		math.max(a.max.x, b.max.x),
		math.max(a.max.y, b.max.y),
		math.max(a.max.z, b.max.z)
	)
	return XAABox.new(min, max)
end

-- Gets the center point of the box
function XAABox:get_center()
	return (self.min + self.max) * 0.5
end

-- Gets the size/extents of the box
function XAABox:get_size()
	return self.max - self.min
end
