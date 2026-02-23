# XYZ Math Library

A 3D mathematics library for Lua with a clean easy to use API.

## Installation

### Using LuaRocks

```bash
luarocks install xyz_math
```

### Manual Installation

Simply copy the `xyz_math.lua` file to your project or somewhere in your Lua path.

## Usage

```lua
local xyz_math = require("xyz_math")

-- Create vectors
local v1 = XVec3(1, 2, 3)
local v2 = XVec3(4, 5, 6)

-- Vector operations
local sum = v1 + v2
local diff = v1 - v2
local scaled = v1 * 2
local dot = v1:dot(v2)
local cross = v1:cross(v2)
local length = v1:length()
local normalized = v1:normalize()

-- Create and use matrices
local rotation = XMat4.rotation_y(math.pi/2)
local translation = XMat4.translate(10, 0, 0)
local transform = rotation * translation

-- Transform a point
local point = XVec4(1, 1, 1, 1)
local transformed = transform * point

-- Create and use geometric primitives
local ray = XRay(XVec3(0, 0, 0), XVec3(0, 0, 1))
local plane = XPlane(XVec3(0, 1, 0), -5)
local intersection = plane:intersectRay(ray)

-- Bounding volumes
local sphere = XBoundingSphere(XVec3(0, 0, 0), 5)
local box = XAABox(XVec3(-1, -1, -1), XVec3(1, 1, 1))
```

## API Reference

### Vector Types

#### XVec2
2D vector with x, y components.

- `XVec2.new(x, y)` or `XVec2(x, y)`: Create a new 2D vector
- Operations:
  * Addition (`v1 + v2`): Vector addition
  * Subtraction (`v1 - v2`): Vector subtraction
  * Multiplication (`v1 * scalar` or `v1 * v2`): Scalar or component-wise multiplication
  * Unary minus (`-v`): Negation
  * Equality (`v1 == v2`): Floating-point tolerant comparison
  * `tostring(v)`: Readable string representation
- Methods:
  * `dot()`: Dot product
  * `cross()`: 2D cross product (returns scalar)
  * `normalize()`: Returns normalized vector
  * `length()`: Returns vector length
  * `lerp(other, t)`: Linear interpolation

#### XVec3
3D vector with x, y, z components.

- `XVec3.new(x, y, z)` or `XVec3(x, y, z)`: Create a new 3D vector
- Operations:
  * Addition (`v1 + v2`): Vector addition
  * Subtraction (`v1 - v2`): Vector subtraction
  * Multiplication (`v1 * scalar` or `v1 * v2`): Scalar or component-wise multiplication
  * Unary minus (`-v`): Negation
  * Equality (`v1 == v2`): Floating-point tolerant comparison
  * `tostring(v)`: Readable string representation
- Methods:
  * `dot()`: Dot product
  * `cross()`: 3D cross product (returns vector)
  * `normalize()`: Returns normalized vector
  * `length()`: Returns vector length
  * `lerp(other, t)`: Linear interpolation

#### XVec4
4D vector with x, y, z, w components.

- `XVec4.new(x, y, z, w)` or `XVec4(x, y, z, w)`: Create a new 4D vector
- Operations:
  * Addition (`v1 + v2`): Vector addition
  * Subtraction (`v1 - v2`): Vector subtraction
  * Multiplication (`v1 * scalar` or `v1 * v2`): Scalar or component-wise multiplication
  * Unary minus (`-v`): Negation
  * Equality (`v1 == v2`): Floating-point tolerant comparison
  * `tostring(v)`: Readable string representation
- Methods:
  * `dot()`: Dot product
  * `normalize()`: Returns normalized vector
  * `length()`: Returns vector length
  * `lerp(other, t)`: Linear interpolation

### Matrix Types

#### XMat3
3x3 matrix for 3D transformations.

- `XMat3.new(...)` or `XMat3(...)`: Create a new 3x3 matrix
- Operations:
  * Multiplication (`m1 * m2` or `m * v`): Matrix-matrix and matrix-vector multiplication
  * Equality (`m1 == m2`): Floating-point tolerant comparison
  * `tostring(m)`: Readable string representation
- Methods:
  * `inverse()`: Returns inverse matrix
- Static methods:
  * `scale()`: Creates scaling matrix
  * `rotation_x()`: Creates rotation matrix around X axis
  * `rotation_y()`: Creates rotation matrix around Y axis
  * `rotation_z()`: Creates rotation matrix around Z axis
  * `rotation_around_axis()`: Creates rotation matrix around arbitrary axis
  * `from_euler()`: Creates rotation matrix from Euler angles

#### XMat4
4x4 matrix for 3D transformations with translation.

- `XMat4.new(...)` or `XMat4(...)`: Create a new 4x4 matrix
- Operations:
  * Multiplication (`m1 * m2` or `m * v`): Matrix-matrix and matrix-vector multiplication
  * Equality (`m1 == m2`): Floating-point tolerant comparison
  * `tostring(m)`: Readable string representation
- Methods:
  * `inverse()`: Returns inverse matrix (cofactor expansion, errors on singular)
- Static methods:
  * `scale()`: Creates scaling matrix
  * `translate()`: Creates translation matrix
  * `rotation_x()`: Creates rotation matrix around X axis
  * `rotation_y()`: Creates rotation matrix around Y axis
  * `rotation_z()`: Creates rotation matrix around Z axis
  * `rotation_around_axis()`: Creates rotation matrix around arbitrary axis
  * `from_euler()`: Creates rotation matrix from Euler angles
  * `look_at(eye, center, up)`: Creates a view matrix (world to camera space)
  * `perspective(fov_y, aspect, near, far)`: Creates a perspective projection matrix from vertical FOV (radians)
  * `frustum(left, right, bottom, top, near, far)`: Creates a perspective projection matrix from explicit frustum bounds
  * `orthographic(left, right, bottom, top, near, far)`: Creates an orthographic projection matrix

#### XQuat
Quaternion with x, y, z, w components (`w=1` identity). Avoids gimbal lock and interpolates smoothly via slerp.

- `XQuat.new(x, y, z, w)` or `XQuat(x, y, z, w)`: Create a new quaternion (defaults to identity `0, 0, 0, 1`)
- Operations:
  * Multiplication (`q1 * q2`): Hamilton product (compose rotations)
  * Multiplication (`q * vec3`): Rotate an XVec3 by the quaternion
  * Unary minus (`-q`): Negate all components (antipodal quaternion)
  * Equality (`q1 == q2`): Floating-point tolerant comparison
  * `tostring(q)`: Readable string representation
- Methods:
  * `length()`: Quaternion magnitude
  * `normalize()`: Returns unit quaternion
  * `dot(other)`: 4D dot product
  * `conjugate()`: Returns `(-x, -y, -z, w)`
  * `inverse()`: Returns inverse quaternion (`conjugate / length²`)
  * `slerp(other, t)`: Spherical linear interpolation (shortest path)
  * `to_mat3()`: Convert to XMat3 rotation matrix
  * `to_mat4()`: Convert to XMat4 rotation matrix
- Static methods:
  * `from_axis_angle(axis, angle)`: Create from axis (XVec3) and angle (radians)
  * `from_euler(x, y, z)`: Create from Euler angles (Z*Y*X convention, radians)

### Geometric Primitives

#### XRay
Ray with origin and direction.

- `XRay.new(origin, direction)` or `XRay(origin, direction)`: Create a new ray
- Operations:
  * Equality (`r1 == r2`): Floating-point tolerant comparison
  * `tostring(r)`: Readable string representation
- Methods:
  * `pointAt(t)`: Returns point along ray at distance t
  * `transform(matrix)`: Returns transformed ray
  * `intersectTriangle(v0, v1, v2)`: Möller-Trumbore ray-triangle intersection; returns nearest intersection point (XVec3) or nil
  * `distance_to_point(point)`: Shortest distance from ray to point (clamped to ray origin)

#### XPlane
Plane defined by normal and distance.

- `XPlane.new(normal, distance)` or `XPlane(normal, distance)`: Create a new plane
- Operations:
  * Equality (`p1 == p2`): Floating-point tolerant comparison
  * `tostring(p)`: Readable string representation
- Methods:
  * `side(point)`: Returns which side of plane a point is on
  * `intersectRay(ray)`: Returns intersection point with ray
  * `distance_to_point(point)`: Signed distance from plane to point (positive = normal side)

### Bounding Volumes

#### XBoundingSphere
Sphere defined by center and radius.

- `XBoundingSphere.new(center, radius)` or `XBoundingSphere(center, radius)`: Create a new bounding sphere
- Operations:
  * Equality (`s1 == s2`): Floating-point tolerant comparison
  * `tostring(s)`: Readable string representation
- Methods:
  * `contains_point()`: Tests if point is inside sphere
  * `intersects_sphere()`: Tests for intersection with another sphere
  * `intersects_box(box)`: Tests for intersection with an XAABox
  * `intersectRay(ray)`: Returns nearest intersection point (XVec3) or nil
  * `distance_to_point(point)`: Distance to sphere surface (negative if inside)
  * `expand_to_point()`: Expands sphere to contain point
  * `expand_to_sphere()`: Expands sphere to contain another sphere
- Static methods:
  * `merge(sphere1, sphere2)`: Creates sphere containing both input spheres

#### XAABox
Axis-aligned bounding box defined by min and max points.

- `XAABox.new(min, max)` or `XAABox(min, max)`: Create a new axis-aligned bounding box
- Operations:
  * Equality (`b1 == b2`): Floating-point tolerant comparison
  * `tostring(b)`: Readable string representation
- Methods:
  * `contains_point()`: Tests if point is inside box
  * `intersects_box()`: Tests for intersection with another box
  * `intersects_sphere(sphere)`: Tests for intersection with an XBoundingSphere
  * `intersectRay(ray)`: Returns nearest intersection point (XVec3) or nil (slab method)
  * `distance_to_point(point)`: Distance to box surface (0 if inside)
  * `expand_to_point()`: Expands box to contain point
  * `expand_to_box()`: Expands box to contain another box
  * `get_center()`: Returns center point of box
  * `get_size()`: Returns size of box
- Static methods:
  * `merge(box1, box2)`: Creates box containing both input boxes

#### XFrustum
View frustum defined by 6 XPlane objects (left, right, bottom, top, near, far) with inward-facing normals.

- `XFrustum.new(left, right, bottom, top, near, far)` or `XFrustum(left, right, bottom, top, near, far)`: Create from 6 XPlane objects
- Operations:
  * Equality (`f1 == f2`): Floating-point tolerant comparison
  * `tostring(f)`: Readable string representation
- Methods:
  * `contains_point(point)`: Tests if XVec3 is inside frustum (on positive side of all 6 planes)
  * `intersects_sphere(sphere)`: Tests if XBoundingSphere intersects frustum
  * `intersects_box(box)`: Tests if XAABox intersects frustum (p-vertex test)
- Static methods:
  * `from_matrix(vp)`: Extracts 6 normalized planes from a view-projection matrix (Gribb-Hartmann method)

### Utility Functions

- `XRGB(r, g, b)`: Create an RGB color as XVec3
- `XRGBA(r, g, b, a)`: Create an RGBA color as XVec4
- `XMin(a, b)`: Component-wise minimum of vectors or minimum of scalars
- `XMax(a, b)`: Component-wise maximum of vectors or maximum of scalars
- `XClamp(val, min_val, max_val)`: Clamp value(s) between min and max
- `XLerp(a, b, t)`: Linear interpolation between scalars or vectors (extrapolation supported); dispatches to `slerp` for XQuat

## License

This library is released under the MIT License.