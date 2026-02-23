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
  * `length_squared()`: Returns squared length (no sqrt, faster for comparisons)
  * `distance_squared(other)`: Returns squared distance to another vector
  * `reflect(normal)`: Returns reflection of vector across a normal
  * `project(onto)`: Returns projection of vector onto another vector
  * `angle_between(other)`: Returns angle in radians between two vectors
  * `is_zero()`: Returns true if all components are within epsilon of zero
  * `rotate(angle)`: Returns vector rotated by angle (radians) counter-clockwise
  * `perpendicular()`: Returns perpendicular vector (-y, x)

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
  * `length_squared()`: Returns squared length (no sqrt, faster for comparisons)
  * `distance_squared(other)`: Returns squared distance to another vector
  * `reflect(normal)`: Returns reflection of vector across a normal
  * `project(onto)`: Returns projection of vector onto another vector
  * `angle_between(other)`: Returns angle in radians between two vectors
  * `is_zero()`: Returns true if all components are within epsilon of zero

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
  * `length_squared()`: Returns squared length (no sqrt, faster for comparisons)
  * `distance_squared(other)`: Returns squared distance to another vector
  * `reflect(normal)`: Returns reflection of vector across a normal
  * `project(onto)`: Returns projection of vector onto another vector
  * `angle_between(other)`: Returns angle in radians between two vectors
  * `is_zero()`: Returns true if all components are within epsilon of zero

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
  * `transpose()`: Returns transposed matrix
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
  * `decompose()`: Decomposes TRS matrix into translation (XVec3), rotation (XQuat), scale (XVec3)
  * `transpose()`: Returns transposed matrix
  * `transform_point(p)`: Transforms XVec3 point (w=1 implied), returns XVec3
  * `transform_direction(v)`: Transforms XVec3 direction (w=0 implied, ignores translation), returns XVec3
- Static methods:
  * `scale()`: Creates scaling matrix
  * `translate()`: Creates translation matrix
  * `rotation_x()`: Creates rotation matrix around X axis
  * `rotation_y()`: Creates rotation matrix around Y axis
  * `rotation_z()`: Creates rotation matrix around Z axis
  * `rotation_around_axis()`: Creates rotation matrix around arbitrary axis
  * `from_euler()`: Creates rotation matrix from Euler angles
  * `from_trs(translation, rotation, scale)`: Creates TRS matrix from XVec3 translation, XQuat rotation, XVec3 scale
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
  * `nlerp(other, t)`: Normalized linear interpolation (faster than slerp, shortest path)
  * `to_mat3()`: Convert to XMat3 rotation matrix
  * `to_mat4()`: Convert to XMat4 rotation matrix
  * `to_euler()`: Convert to Euler angles (x, y, z radians, Z*Y*X convention)
- Static methods:
  * `from_axis_angle(axis, angle)`: Create from axis (XVec3) and angle (radians)
  * `from_euler(x, y, z)`: Create from Euler angles (Z*Y*X convention, radians)
  * `from_mat3(mat3)`: Create from rotation XMat3 (Shepperd's method)

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
  * `distance_to_ray(other)`: Closest distance between two rays (clamped to t >= 0 for both)

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

#### XTriangle
Triangle defined by three XVec3 vertices.

- `XTriangle.new(v0, v1, v2)` or `XTriangle(v0, v1, v2)`: Create a new triangle
- Operations:
  * Equality (`t1 == t2`): Floating-point tolerant comparison
  * `tostring(t)`: Readable string representation
- Methods:
  * `normal()`: Returns unit face normal
  * `area()`: Returns triangle area
  * `centroid()`: Returns centroid `(v0+v1+v2) * (1/3)`
  * `get_barycentric(p)`: Returns barycentric coordinates u, v, w
  * `contains_point(p)`: Tests if point lies on triangle (via barycentric)
  * `intersectRay(ray)`: Returns intersection point (XVec3) or nil
  * `distance_to_point(p)`: Closest distance from point to triangle

#### XCapsule
Line segment with radius (Minkowski sum of segment and sphere).

- `XCapsule.new(start, end_point, radius)` or `XCapsule(start, end_point, radius)`: Create a new capsule
- Operations:
  * Equality (`c1 == c2`): Floating-point tolerant comparison
  * `tostring(c)`: Readable string representation
- Methods:
  * `get_center()`: Returns midpoint of segment
  * `get_length()`: Returns segment length
  * `contains_point(p)`: Tests if point is within capsule (distance to segment <= radius)
  * `distance_to_point(p)`: Signed distance to capsule surface
  * `intersectRay(ray)`: Returns nearest intersection point (XVec3) or nil (cylinder body + hemisphere caps)
  * `intersects_sphere(sphere)`: Tests for intersection with XBoundingSphere
  * `intersects_capsule(other)`: Tests for intersection with another XCapsule

#### XOBB
Oriented bounding box with center, half-extents, and orientation (XMat3).

- `XOBB.new(center, half_extents, orientation)` or `XOBB(center, half_extents, orientation)`: Create a new OBB
- Operations:
  * Equality (`o1 == o2`): Floating-point tolerant comparison
  * `tostring(o)`: Readable string representation
- Methods:
  * `contains_point(p)`: Tests if point is inside OBB
  * `get_corners()`: Returns table of 8 corner XVec3 positions
  * `intersectRay(ray)`: Returns nearest intersection point (XVec3) or nil (slab method in local space)
  * `intersects_aabb(aabb)`: Tests for intersection with XAABox (SAT, 15 axes)
  * `intersects_box(other)`: Tests for OBB-OBB intersection (SAT, 15 axes)
  * `distance_to_point(p)`: Distance from point to OBB surface (0 if inside)
- Static methods:
  * `from_quat(center, half_extents, quat)`: Create from XQuat orientation

### Splines

#### XBezier3
Cubic Bézier curve defined by 4 XVec3 control points.

- `XBezier3.new(p0, p1, p2, p3)` or `XBezier3(p0, p1, p2, p3)`: Create a new cubic Bézier
- Operations:
  * Equality (`b1 == b2`): Floating-point tolerant comparison
  * `tostring(b)`: Readable string representation
- Methods:
  * `evaluate(t)`: Returns point on curve at parameter t
  * `tangent(t)`: Returns tangent vector at parameter t
  * `split(t)`: Returns two XBezier3 curves from De Casteljau subdivision
  * `length(subdivisions)`: Approximate arc length (default 64 subdivisions)

#### XCatmullRom
Catmull-Rom spline defined by 4 XVec3 control points. Passes through p1 at t=0 and p2 at t=1.

- `XCatmullRom.new(p0, p1, p2, p3)` or `XCatmullRom(p0, p1, p2, p3)`: Create a new Catmull-Rom spline
- Operations:
  * Equality (`c1 == c2`): Floating-point tolerant comparison
  * `tostring(c)`: Readable string representation
- Methods:
  * `evaluate(t)`: Returns point on curve at parameter t
  * `tangent(t)`: Returns tangent vector at parameter t
  * `length(subdivisions)`: Approximate arc length (default 64 subdivisions)

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

### Color

#### XColor
RGBA color with HDR support (no clamping), color-space conversions, and blend modes.

- `XColor.new(r, g, b, a)` or `XColor(r, g, b, a)`: Create a new color (alpha defaults to 1)
- Operations:
  * Addition (`c1 + c2`): Component-wise addition
  * Subtraction (`c1 - c2`): Component-wise subtraction
  * Multiplication (`c * scalar`, `scalar * c`, or `c1 * c2`): Scalar or component-wise multiplication
  * Unary minus (`-c`): Negation
  * Equality (`c1 == c2`): Floating-point tolerant comparison
  * `tostring(c)`: Readable string representation
- Methods:
  * `lerp(other, t)`: Component-wise linear interpolation
  * `clamp()`: Clamp all 4 components to [0,1], returns new XColor
  * `to_hsv()`: Returns h (0-360), s (0-1), v (0-1)
  * `to_hsl()`: Returns h (0-360), s (0-1), l (0-1)
  * `to_linear()`: Returns new XColor with sRGB gamma removed (alpha unchanged)
  * `to_srgb()`: Returns new XColor with sRGB gamma applied (alpha unchanged)
  * `blend_multiply(other)`: Multiply blend mode, preserves self.a
  * `blend_screen(other)`: Screen blend mode, preserves self.a
  * `blend_overlay(other)`: Overlay blend mode, preserves self.a
  * `blend_add(other)`: Additive blend mode (no clamp), preserves self.a
- Static methods:
  * `XColor.from_hsv(h, s, v, a)`: Create from HSV (a defaults to 1, h normalized via %360)
  * `XColor.from_hsl(h, s, l, a)`: Create from HSL (a defaults to 1, h normalized via %360)

### 2D Geometry

#### XCircle
Circle defined by center (XVec2) and radius.

- `XCircle.new(center, radius)` or `XCircle(center, radius)`: Create a new circle (defaults: center=origin, radius=0)
- Operations:
  * Equality (`c1 == c2`): Floating-point tolerant comparison
  * `tostring(c)`: Readable string representation
- Methods:
  * `contains_point(point)`: Tests if XVec2 point is inside circle
  * `intersects_circle(other)`: Tests for intersection with another XCircle
  * `distance_to_point(point)`: Signed distance to circle perimeter (negative if inside)
  * `closest_point(point)`: Returns closest XVec2 on perimeter; if point is at center, returns `(center.x + radius, center.y)`

#### XRect2D
Axis-aligned 2D rectangle defined by min and max XVec2 points.

- `XRect2D.new(min, max)` or `XRect2D(min, max)`: Create a new rectangle (defaults: both origin)
- Operations:
  * Equality (`r1 == r2`): Floating-point tolerant comparison
  * `tostring(r)`: Readable string representation
- Methods:
  * `contains_point(point)`: Tests if XVec2 point is inside rectangle
  * `intersects_rect(other)`: Tests for intersection with another XRect2D
  * `intersects_circle(circle)`: Tests for intersection with an XCircle
  * `distance_to_point(point)`: Distance to rectangle boundary (0 if inside)
  * `get_center()`: Returns center XVec2
  * `get_size()`: Returns size XVec2 (max - min)
  * `expand_to_point(point)`: Mutates min/max to contain point

#### XSegment2D
2D line segment defined by start and end_point (XVec2).

- `XSegment2D.new(start, end_point)` or `XSegment2D(start, end_point)`: Create a new segment
- Operations:
  * Equality (`s1 == s2`): Floating-point tolerant comparison
  * `tostring(s)`: Readable string representation
- Methods:
  * `length()`: Returns segment length
  * `closest_point(point)`: Returns closest XVec2 on segment
  * `distance_to_point(point)`: Distance from point to nearest point on segment
  * `intersects_segment(other)`: Returns intersection XVec2 or nil (nil for parallel/collinear)
  * `side(point)`: Returns 1 (left/CCW), -1 (right/CW), or 0 (on line)

#### XPolygon2D
2D polygon defined by a table of XVec2 vertices (minimum 3).

- `XPolygon2D.new(vertices)` or `XPolygon2D(vertices)`: Create a new polygon (asserts >= 3 vertices)
- Operations:
  * Equality (`p1 == p2`): Vertex-by-vertex comparison
  * `tostring(p)`: Comma-joined vertex representation
- Methods:
  * `contains_point(point)`: Ray-casting point-in-polygon test (works for convex and concave)
  * `area()`: Signed area via shoelace formula (positive = CCW, negative = CW)
  * `centroid()`: Returns centroid XVec2 via shoelace-weighted formula
  * `vertex_count()`: Returns number of vertices
  * `get_edge(i)`: Returns `vertices[i], vertices[i % n + 1]` (wraps around)

### Utility Functions

- `XRGB(r, g, b)`: Create an RGB color as XVec3
- `XRGBA(r, g, b, a)`: Create an RGBA color as XVec4
- `XMin(a, b)`: Component-wise minimum of vectors or minimum of scalars
- `XMax(a, b)`: Component-wise maximum of vectors or maximum of scalars
- `XClamp(val, min_val, max_val)`: Clamp value(s) between min and max
- `XLerp(a, b, t)`: Linear interpolation between scalars, vectors, or XColor (extrapolation supported); dispatches to `slerp` for XQuat
- `XEaseIn(t)`: Quadratic ease-in (t^2)
- `XEaseOut(t)`: Quadratic ease-out
- `XEaseInOut(t)`: Quadratic ease-in-out
- `XHermite(p0, m0, p1, m1, t)`: Cubic Hermite interpolation
- `XSmoothstep(edge0, edge1, x)`: Smoothstep interpolation (3t^2 - 2t^3)
- `XSmootherstep(edge0, edge1, x)`: Ken Perlin's smootherstep (6t^5 - 15t^4 + 10t^3)

## License

This library is released under the MIT License.