local unpack = unpack or table.unpack

local EPSILON = 1e-9
local function float_eq(a, b)
    return math.abs(a - b) <= EPSILON
end

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

XVec2_mt.__tostring = function(self)
    return string.format("XVec2(%g, %g)", self.x, self.y)
end

XVec2_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return float_eq(a.x, b.x) and float_eq(a.y, b.y)
end

XVec2_mt.__unm = function(self)
    return XVec2.new(-self.x, -self.y)
end

function XVec2:lerp(other, t)
    return XVec2.new(
        self.x + (other.x - self.x) * t,
        self.y + (other.y - self.y) * t
    )
end

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

XVec3_mt.__tostring = function(self)
    return string.format("XVec3(%g, %g, %g)", self.x, self.y, self.z)
end

XVec3_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return float_eq(a.x, b.x) and float_eq(a.y, b.y) and float_eq(a.z, b.z)
end

XVec3_mt.__unm = function(self)
    return XVec3.new(-self.x, -self.y, -self.z)
end

function XVec3:lerp(other, t)
    return XVec3.new(
        self.x + (other.x - self.x) * t,
        self.y + (other.y - self.y) * t,
        self.z + (other.z - self.z) * t
    )
end

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

XVec4_mt.__tostring = function(self)
    return string.format("XVec4(%g, %g, %g, %g)", self.x, self.y, self.z, self.w)
end

XVec4_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return float_eq(a.x, b.x) and float_eq(a.y, b.y) and float_eq(a.z, b.z) and float_eq(a.w, b.w)
end

XVec4_mt.__unm = function(self)
    return XVec4.new(-self.x, -self.y, -self.z, -self.w)
end

function XVec4:lerp(other, t)
    return XVec4.new(
        self.x + (other.x - self.x) * t,
        self.y + (other.y - self.y) * t,
        self.z + (other.z - self.z) * t,
        self.w + (other.w - self.w) * t
    )
end

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


-- Assign metamethods to the metatable
XMat3_mt.__mul = XMat3.__mul

XMat3_mt.__tostring = function(self)
    return string.format("XMat3(%g, %g, %g, %g, %g, %g, %g, %g, %g)",
        self[1], self[2], self[3],
        self[4], self[5], self[6],
        self[7], self[8], self[9])
end

XMat3_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    for i = 1, 9 do
        if not float_eq(a[i], b[i]) then return false end
    end
    return true
end

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

XMat4_mt.__tostring = function(self)
    return string.format("XMat4(%g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g, %g)",
        self[1], self[2], self[3], self[4],
        self[5], self[6], self[7], self[8],
        self[9], self[10], self[11], self[12],
        self[13], self[14], self[15], self[16])
end

XMat4_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    for i = 1, 16 do
        if not float_eq(a[i], b[i]) then return false end
    end
    return true
end

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

function XMat4.look_at(eye, center, up)
    local f = (center - eye):normalize()
    local r = f:cross(up):normalize()
    local u = r:cross(f)
    return XMat4.new(
         r.x,  r.y,  r.z, -r:dot(eye),
         u.x,  u.y,  u.z, -u:dot(eye),
        -f.x, -f.y, -f.z,  f:dot(eye),
         0,    0,    0,    1
    )
end

function XMat4.perspective(fov_y, aspect, near, far)
    local f = 1.0 / math.tan(fov_y * 0.5)
    return XMat4.new(
        f / aspect, 0,  0,                            0,
        0,          f,  0,                            0,
        0,          0, (far + near) / (near - far),  (2 * far * near) / (near - far),
        0,          0, -1,                            0
    )
end

function XMat4.frustum(left, right, bottom, top, near, far)
    return XMat4.new(
        (2*near)/(right-left),  0,                       (right+left)/(right-left),   0,
        0,                      (2*near)/(top-bottom),   (top+bottom)/(top-bottom),   0,
        0,                      0,                       -(far+near)/(far-near),     -(2*far*near)/(far-near),
        0,                      0,                       -1,                          0
    )
end

function XMat4.orthographic(left, right, bottom, top, near, far)
    return XMat4.new(
        2/(right-left),  0,                0,                -(right+left)/(right-left),
        0,                2/(top-bottom),  0,                -(top+bottom)/(top-bottom),
        0,                0,               -2/(far-near),    -(far+near)/(far-near),
        0,                0,                0,                1
    )
end

function XMat4:inverse()
    local a = self
    local s0 = a[1] * a[6]  - a[2] * a[5]
    local s1 = a[1] * a[7]  - a[3] * a[5]
    local s2 = a[1] * a[8]  - a[4] * a[5]
    local s3 = a[2] * a[7]  - a[3] * a[6]
    local s4 = a[2] * a[8]  - a[4] * a[6]
    local s5 = a[3] * a[8]  - a[4] * a[7]

    local c5 = a[11] * a[16] - a[12] * a[15]
    local c4 = a[10] * a[16] - a[12] * a[14]
    local c3 = a[10] * a[15] - a[11] * a[14]
    local c2 = a[9]  * a[16] - a[12] * a[13]
    local c1 = a[9]  * a[15] - a[11] * a[13]
    local c0 = a[9]  * a[14] - a[10] * a[13]

    local det = s0 * c5 - s1 * c4 + s2 * c3 + s3 * c2 - s4 * c1 + s5 * c0
    if math.abs(det) < 1e-12 then
        error("Matrix is not invertible")
    end
    local invdet = 1 / det

    return XMat4.new(
        ( a[6] * c5 - a[7] * c4 + a[8] * c3) * invdet,
        (-a[2] * c5 + a[3] * c4 - a[4] * c3) * invdet,
        ( a[14] * s5 - a[15] * s4 + a[16] * s3) * invdet,
        (-a[10] * s5 + a[11] * s4 - a[12] * s3) * invdet,
        (-a[5] * c5 + a[7] * c2 - a[8] * c1) * invdet,
        ( a[1] * c5 - a[3] * c2 + a[4] * c1) * invdet,
        (-a[13] * s5 + a[15] * s2 - a[16] * s1) * invdet,
        ( a[9]  * s5 - a[11] * s2 + a[12] * s1) * invdet,
        ( a[5] * c4 - a[6] * c2 + a[8] * c0) * invdet,
        (-a[1] * c4 + a[2] * c2 - a[4] * c0) * invdet,
        ( a[13] * s4 - a[14] * s2 + a[16] * s0) * invdet,
        (-a[9]  * s4 + a[10] * s2 - a[12] * s0) * invdet,
        (-a[5] * c3 + a[6] * c1 - a[7] * c0) * invdet,
        ( a[1] * c3 - a[2] * c1 + a[3] * c0) * invdet,
        (-a[13] * s3 + a[14] * s1 - a[15] * s0) * invdet,
        ( a[9]  * s3 - a[10] * s1 + a[11] * s0) * invdet
    )
end

XQuat = {}
XQuat_mt = {__index = XQuat}

function XQuat.new(x, y, z, w)
    return setmetatable({x = x or 0, y = y or 0, z = z or 0, w = w or 1}, XQuat_mt)
end

setmetatable(XQuat, {
    __call = function(_, x, y, z, w)
        return XQuat.new(x, y, z, w)
    end
})

function XQuat.__mul(a, b)
    if getmetatable(b) == XQuat_mt then
        return XQuat.new(
            a.w * b.x + a.x * b.w + a.y * b.z - a.z * b.y,
            a.w * b.y - a.x * b.z + a.y * b.w + a.z * b.x,
            a.w * b.z + a.x * b.y - a.y * b.x + a.z * b.w,
            a.w * b.w - a.x * b.x - a.y * b.y - a.z * b.z
        )
    elseif getmetatable(b) == XVec3_mt then
        local qv = XQuat.new(b.x, b.y, b.z, 0)
        local qc = XQuat.new(-a.x, -a.y, -a.z, a.w)
        local result = a * qv * qc
        return XVec3.new(result.x, result.y, result.z)
    else
        error("Invalid multiplication")
    end
end
XQuat_mt.__mul = XQuat.__mul

XQuat_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return float_eq(a.x, b.x) and float_eq(a.y, b.y) and float_eq(a.z, b.z) and float_eq(a.w, b.w)
end

XQuat_mt.__tostring = function(self)
    return string.format("XQuat(%g, %g, %g, %g)", self.x, self.y, self.z, self.w)
end

XQuat_mt.__unm = function(self)
    return XQuat.new(-self.x, -self.y, -self.z, -self.w)
end

function XQuat:length()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
end

function XQuat:normalize()
    local len = self:length()
    if len > 0 then
        return XQuat.new(self.x / len, self.y / len, self.z / len, self.w / len)
    end
    return XQuat.new(0, 0, 0, 1)
end

function XQuat:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w
end

function XQuat:conjugate()
    return XQuat.new(-self.x, -self.y, -self.z, self.w)
end

function XQuat:inverse()
    local len_sq = self.x^2 + self.y^2 + self.z^2 + self.w^2
    if len_sq > 0 then
        local inv = 1 / len_sq
        return XQuat.new(-self.x * inv, -self.y * inv, -self.z * inv, self.w * inv)
    end
    return XQuat.new(0, 0, 0, 1)
end

function XQuat:slerp(other, t)
    local d = self:dot(other)
    local b = other

    if d < 0 then
        b = XQuat.new(-other.x, -other.y, -other.z, -other.w)
        d = -d
    end

    if d > 1 then d = 1 end

    local theta = math.acos(d)
    local sin_theta = math.sin(theta)

    local s0, s1
    if sin_theta < 1e-6 then
        s0 = 1 - t
        s1 = t
    else
        s0 = math.sin((1 - t) * theta) / sin_theta
        s1 = math.sin(t * theta) / sin_theta
    end

    return XQuat.new(
        s0 * self.x + s1 * b.x,
        s0 * self.y + s1 * b.y,
        s0 * self.z + s1 * b.z,
        s0 * self.w + s1 * b.w
    )
end

function XQuat:to_mat3()
    local x, y, z, w = self.x, self.y, self.z, self.w
    local x2, y2, z2 = x + x, y + y, z + z
    local xx, xy, xz = x * x2, x * y2, x * z2
    local yy, yz, zz = y * y2, y * z2, z * z2
    local wx, wy, wz = w * x2, w * y2, w * z2

    return XMat3.new(
        1 - (yy + zz), xy - wz,       xz + wy,
        xy + wz,       1 - (xx + zz), yz - wx,
        xz - wy,       yz + wx,       1 - (xx + yy)
    )
end

function XQuat:to_mat4()
    local x, y, z, w = self.x, self.y, self.z, self.w
    local x2, y2, z2 = x + x, y + y, z + z
    local xx, xy, xz = x * x2, x * y2, x * z2
    local yy, yz, zz = y * y2, y * z2, z * z2
    local wx, wy, wz = w * x2, w * y2, w * z2

    return XMat4.new(
        1 - (yy + zz), xy - wz,       xz + wy,       0,
        xy + wz,       1 - (xx + zz), yz - wx,       0,
        xz - wy,       yz + wx,       1 - (xx + yy), 0,
        0,             0,             0,             1
    )
end

function XQuat.from_axis_angle(axis, angle)
    local n = axis:normalize()
    local half = angle * 0.5
    local s = math.sin(half)
    return XQuat.new(n.x * s, n.y * s, n.z * s, math.cos(half))
end

function XQuat.from_euler(x, y, z)
    local qx = XQuat.from_axis_angle(XVec3(1, 0, 0), x)
    local qy = XQuat.from_axis_angle(XVec3(0, 1, 0), y)
    local qz = XQuat.from_axis_angle(XVec3(0, 0, 1), z)
    return qz * qy * qx
end

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

XPlane_mt.__tostring = function(self)
    return string.format("XPlane(normal=%s, distance=%g)", tostring(self.normal), self.distance)
end

XPlane_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return a.normal == b.normal and float_eq(a.distance, b.distance)
end

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

function XPlane:distance_to_point(point)
    return self.normal:dot(point) + self.distance
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

XRay_mt.__tostring = function(self)
    return string.format("XRay(origin=%s, direction=%s)", tostring(self.origin), tostring(self.direction))
end

XRay_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return a.origin == b.origin and a.direction == b.direction
end

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

function XRay:intersectTriangle(v0, v1, v2)
    local edge1 = v1 - v0
    local edge2 = v2 - v0
    local h = self.direction:cross(edge2)
    local a = edge1:dot(h)
    if math.abs(a) < 1e-9 then return nil end
    local f = 1.0 / a
    local s = self.origin - v0
    local u = f * s:dot(h)
    if u < 0 or u > 1 then return nil end
    local q = s:cross(edge1)
    local v = f * self.direction:dot(q)
    if v < 0 or u + v > 1 then return nil end
    local t = f * edge2:dot(q)
    if t > 1e-9 then return self:pointAt(t) end
    return nil
end

function XRay:distance_to_point(point)
    local v = point - self.origin
    local t = v:dot(self.direction) / self.direction:dot(self.direction)
    if t < 0 then t = 0 end
    local closest = self:pointAt(t)
    return (point - closest):length()
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

function XLerp(a, b, t)
    if type(a) == "number" and type(b) == "number" then
        return a + (b - a) * t
    elseif getmetatable(a) == XVec2_mt and getmetatable(b) == XVec2_mt then
        return a:lerp(b, t)
    elseif getmetatable(a) == XVec3_mt and getmetatable(b) == XVec3_mt then
        return a:lerp(b, t)
    elseif getmetatable(a) == XVec4_mt and getmetatable(b) == XVec4_mt then
        return a:lerp(b, t)
    elseif getmetatable(a) == XQuat_mt and getmetatable(b) == XQuat_mt then
        return a:slerp(b, t)
    else
        error("Invalid types for XLerp")
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

XBoundingSphere_mt.__tostring = function(self)
    return string.format("XBoundingSphere(center=%s, radius=%g)", tostring(self.center), self.radius)
end

XBoundingSphere_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return a.center == b.center and float_eq(a.radius, b.radius)
end

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

-- Returns true if the sphere intersects with an axis-aligned bounding box
function XBoundingSphere:intersects_box(box)
    local cx = math.max(box.min.x, math.min(self.center.x, box.max.x))
    local cy = math.max(box.min.y, math.min(self.center.y, box.max.y))
    local cz = math.max(box.min.z, math.min(self.center.z, box.max.z))
    local dx = cx - self.center.x
    local dy = cy - self.center.y
    local dz = cz - self.center.z
    return (dx * dx + dy * dy + dz * dz) <= self.radius * self.radius
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

-- Ray-sphere intersection via quadratic formula. Returns nearest intersection point or nil.
function XBoundingSphere:intersectRay(ray)
    local oc = ray.origin - self.center
    local a = ray.direction:dot(ray.direction)
    local b = 2 * oc:dot(ray.direction)
    local c = oc:dot(oc) - self.radius * self.radius
    local discriminant = b * b - 4 * a * c
    if discriminant < 0 then return nil end
    local sqrt_d = math.sqrt(discriminant)
    local t1 = (-b - sqrt_d) / (2 * a)
    if t1 >= 0 then return ray:pointAt(t1) end
    local t2 = (-b + sqrt_d) / (2 * a)
    if t2 >= 0 then return ray:pointAt(t2) end
    return nil
end

-- Distance to surface, negative if inside
function XBoundingSphere:distance_to_point(point)
    return (point - self.center):length() - self.radius
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

XAABox_mt.__tostring = function(self)
    return string.format("XAABox(min=%s, max=%s)", tostring(self.min), tostring(self.max))
end

XAABox_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return a.min == b.min and a.max == b.max
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

-- Returns true if the box intersects with a bounding sphere
function XAABox:intersects_sphere(sphere)
    local cx = math.max(self.min.x, math.min(sphere.center.x, self.max.x))
    local cy = math.max(self.min.y, math.min(sphere.center.y, self.max.y))
    local cz = math.max(self.min.z, math.min(sphere.center.z, self.max.z))
    local dx = cx - sphere.center.x
    local dy = cy - sphere.center.y
    local dz = cz - sphere.center.z
    return (dx * dx + dy * dy + dz * dz) <= sphere.radius * sphere.radius
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

-- Ray-AABB intersection via slab method. Returns nearest intersection point or nil.
function XAABox:intersectRay(ray)
    local tmin = -math.huge
    local tmax = math.huge
    local axes = {"x", "y", "z"}
    for _, axis in ipairs(axes) do
        local origin = ray.origin[axis]
        local dir = ray.direction[axis]
        local bmin = self.min[axis]
        local bmax = self.max[axis]
        if math.abs(dir) < 1e-12 then
            if origin < bmin or origin > bmax then return nil end
        else
            local t1 = (bmin - origin) / dir
            local t2 = (bmax - origin) / dir
            if t1 > t2 then t1, t2 = t2, t1 end
            if t1 > tmin then tmin = t1 end
            if t2 < tmax then tmax = t2 end
            if tmin > tmax then return nil end
        end
    end
    if tmax < 0 then return nil end
    local t = tmin >= 0 and tmin or tmax
    return ray:pointAt(t)
end

-- Distance to surface, 0 if inside
function XAABox:distance_to_point(point)
    local dx = math.max(self.min.x - point.x, 0, point.x - self.max.x)
    local dy = math.max(self.min.y - point.y, 0, point.y - self.max.y)
    local dz = math.max(self.min.z - point.z, 0, point.z - self.max.z)
    return math.sqrt(dx * dx + dy * dy + dz * dz)
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

XFrustum = {}
XFrustum_mt = {__index = XFrustum}

function XFrustum.new(left, right, bottom, top, near, far)
    return setmetatable({
        left = left,
        right = right,
        bottom = bottom,
        top = top,
        near = near,
        far = far
    }, XFrustum_mt)
end

setmetatable(XFrustum, {
    __call = function(_, left, right, bottom, top, near, far)
        return XFrustum.new(left, right, bottom, top, near, far)
    end
})

XFrustum_mt.__tostring = function(self)
    return string.format("XFrustum(left=%s, right=%s, bottom=%s, top=%s, near=%s, far=%s)",
        tostring(self.left), tostring(self.right),
        tostring(self.bottom), tostring(self.top),
        tostring(self.near), tostring(self.far))
end

XFrustum_mt.__eq = function(a, b)
    if getmetatable(a) ~= getmetatable(b) then return false end
    return a.left == b.left and a.right == b.right
        and a.bottom == b.bottom and a.top == b.top
        and a.near == b.near and a.far == b.far
end

function XFrustum.from_matrix(vp)
    local function make_plane(nx, ny, nz, d)
        local len = math.sqrt(nx*nx + ny*ny + nz*nz)
        return XPlane.new(XVec3.new(nx/len, ny/len, nz/len), d/len)
    end

    local left   = make_plane(vp[13]+vp[1],  vp[14]+vp[2],  vp[15]+vp[3],  vp[16]+vp[4])
    local right  = make_plane(vp[13]-vp[1],  vp[14]-vp[2],  vp[15]-vp[3],  vp[16]-vp[4])
    local bottom = make_plane(vp[13]+vp[5],  vp[14]+vp[6],  vp[15]+vp[7],  vp[16]+vp[8])
    local top    = make_plane(vp[13]-vp[5],  vp[14]-vp[6],  vp[15]-vp[7],  vp[16]-vp[8])
    local near   = make_plane(vp[13]+vp[9],  vp[14]+vp[10], vp[15]+vp[11], vp[16]+vp[12])
    local far    = make_plane(vp[13]-vp[9],  vp[14]-vp[10], vp[15]-vp[11], vp[16]-vp[12])

    return XFrustum.new(left, right, bottom, top, near, far)
end

function XFrustum:contains_point(point)
    local planes = {self.left, self.right, self.bottom, self.top, self.near, self.far}
    for _, plane in ipairs(planes) do
        if plane:side(point) < 0 then
            return false
        end
    end
    return true
end

function XFrustum:intersects_sphere(sphere)
    local planes = {self.left, self.right, self.bottom, self.top, self.near, self.far}
    for _, plane in ipairs(planes) do
        local dist = plane.normal:dot(sphere.center) + plane.distance
        if dist < -sphere.radius then
            return false
        end
    end
    return true
end

function XFrustum:intersects_box(box)
    local planes = {self.left, self.right, self.bottom, self.top, self.near, self.far}
    for _, plane in ipairs(planes) do
        -- p-vertex: the corner most aligned with the plane normal
        local px = plane.normal.x >= 0 and box.max.x or box.min.x
        local py = plane.normal.y >= 0 and box.max.y or box.min.y
        local pz = plane.normal.z >= 0 and box.max.z or box.min.z
        if plane.normal:dot(XVec3.new(px, py, pz)) + plane.distance < 0 then
            return false
        end
    end
    return true
end
