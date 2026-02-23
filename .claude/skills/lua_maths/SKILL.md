---
name: lua_maths
description: "xyz_math Lua library API reference. Use when writing Lua code that uses xyz_math types (XVec2, XVec3, XVec4, XMat3, XMat4, XQuat, XRay, XPlane, XBoundingSphere, XAABox, XTriangle, XCapsule, XOBB, XBezier3, XCatmullRom, XFrustum, XColor, XCircle, XRect2D, XSegment2D, XPolygon2D, XNoise2D, XNoise3D) or utility functions (XLerp, XClamp, XMin, XMax, XSmoothstep, etc.)."
---

# xyz_math API Reference

xyz_math is a single-file Lua math library (`xyz_math.lua`). After `require("xyz_math")`, all types are available as globals.

## Vectors

### XVec2(x, y)
2D vector. Fields: `x`, `y`.

Operators: `+`, `-`, `*` (scalar or component-wise), unary `-`, `==` (epsilon-tolerant), `tostring`.

Methods:
- `dot(other)` — Dot product
- `cross(other)` — 2D cross product (returns scalar)
- `normalize()` — Returns unit vector
- `length()` / `length_squared()` — Length / squared length
- `lerp(other, t)` — Linear interpolation
- `distance_squared(other)` — Squared distance
- `reflect(normal)` — Reflection across normal
- `project(onto)` — Projection onto another vector
- `angle_between(other)` — Angle in radians
- `is_zero()` — True if near zero
- `rotate(angle)` — Rotate by angle (radians, CCW)
- `perpendicular()` — Returns (-y, x)

### XVec3(x, y, z)
3D vector. Fields: `x`, `y`, `z`.

Same operators as XVec2. Methods: `dot`, `cross` (returns vector), `normalize`, `length`, `length_squared`, `lerp`, `distance_squared`, `reflect`, `project`, `angle_between`, `is_zero`.

### XVec4(x, y, z, w)
4D vector. Fields: `x`, `y`, `z`, `w`.

Same operators as XVec2. Methods: `dot`, `normalize`, `length`, `length_squared`, `lerp`, `distance_squared`, `reflect`, `project`, `angle_between`, `is_zero`.

## Matrices

### XMat3(...)
3x3 matrix, column-major (9 values). Identity: `XMat3.new()`.

Operators: `*` (matrix-matrix, matrix-XVec3), `==`, `tostring`.

Methods: `inverse()`, `transpose()`.

Static: `scale(sx,sy,sz)`, `rotation_x(angle)`, `rotation_y(angle)`, `rotation_z(angle)`, `rotation_around_axis(axis, angle)`, `from_euler(x,y,z)`.

### XMat4(...)
4x4 matrix, column-major (16 values). Identity: `XMat4.new()`.

Operators: `*` (matrix-matrix, matrix-XVec4), `==`, `tostring`.

Methods:
- `inverse()` — Cofactor expansion
- `decompose()` — Returns translation (XVec3), rotation (XQuat), scale (XVec3)
- `transpose()`
- `transform_point(p)` — Transform XVec3 (w=1 implied)
- `transform_direction(v)` — Transform XVec3 (w=0, ignores translation)

Static: `scale(sx,sy,sz)`, `translate(tx,ty,tz)`, `rotation_x/y/z(angle)`, `rotation_around_axis(axis, angle)`, `from_euler(x,y,z)`, `from_trs(translation, rotation, scale)`, `look_at(eye, center, up)`, `perspective(fov_y, aspect, near, far)`, `frustum(l,r,b,t,n,f)`, `orthographic(l,r,b,t,n,f)`.

## Quaternions

### XQuat(x, y, z, w)
Identity: `XQuat()` = (0, 0, 0, 1). Euler convention: Z*Y*X, radians.

Operators: `*` (quat-quat Hamilton product, quat-XVec3 rotation), unary `-`, `==`, `tostring`.

Methods: `length()`, `normalize()`, `dot(other)`, `conjugate()`, `inverse()`, `slerp(other, t)`, `nlerp(other, t)`, `to_mat3()`, `to_mat4()`, `to_euler()`.

Static: `from_axis_angle(axis, angle)`, `from_euler(x, y, z)`, `from_mat3(mat3)`.

## Geometric Primitives

### XRay(origin, direction)
Methods: `pointAt(t)`, `transform(mat4)`, `intersectTriangle(v0, v1, v2)`, `distance_to_point(p)`, `distance_to_ray(other)`.

### XPlane(normal, distance)
Methods: `side(point)`, `intersectRay(ray)`, `distance_to_point(point)`.

### XTriangle(v0, v1, v2)
Methods: `normal()`, `area()`, `centroid()`, `get_barycentric(p)`, `contains_point(p)`, `intersectRay(ray)`, `distance_to_point(p)`.

### XCapsule(start, end_point, radius)
Methods: `get_center()`, `get_length()`, `contains_point(p)`, `distance_to_point(p)`, `intersectRay(ray)`, `intersects_sphere(sphere)`, `intersects_capsule(other)`.

### XOBB(center, half_extents, orientation)
`orientation` is XMat3. Methods: `contains_point(p)`, `get_corners()`, `intersectRay(ray)`, `intersects_aabb(aabb)`, `intersects_box(other)`, `distance_to_point(p)`.

Static: `from_quat(center, half_extents, quat)`.

## Bounding Volumes

### XBoundingSphere(center, radius)
Methods: `contains_point(p)`, `intersects_sphere(other)`, `intersects_box(box)`, `intersectRay(ray)`, `distance_to_point(p)`, `expand_to_point(p)`, `expand_to_sphere(other)`.

Static: `merge(s1, s2)`.

### XAABox(min, max)
Methods: `contains_point(p)`, `intersects_box(other)`, `intersects_sphere(sphere)`, `intersectRay(ray)`, `distance_to_point(p)`, `expand_to_point(p)`, `expand_to_box(other)`, `get_center()`, `get_size()`.

Static: `merge(b1, b2)`.

## Splines

### XBezier3(p0, p1, p2, p3)
Cubic Bezier (XVec3 control points). Methods: `evaluate(t)`, `tangent(t)`, `split(t)`, `length(subdivisions)`.

### XCatmullRom(p0, p1, p2, p3)
Catmull-Rom spline. Passes through p1 at t=0, p2 at t=1. Methods: `evaluate(t)`, `tangent(t)`, `length(subdivisions)`.

## Frustum

### XFrustum(left, right, bottom, top, near, far)
6 XPlane objects, inward-facing normals. Methods: `contains_point(point)`, `intersects_sphere(sphere)`, `intersects_box(box)`.

Static: `from_matrix(view_projection_mat4)`.

## Color

### XColor(r, g, b, a)
RGBA, HDR (no clamping). Alpha defaults to 1.

Operators: `+`, `-`, `*` (scalar or component-wise), unary `-`, `==`, `tostring`.

Methods: `lerp(other, t)`, `clamp()`, `to_hsv()`, `to_hsl()`, `to_linear()`, `to_srgb()`, `blend_multiply(other)`, `blend_screen(other)`, `blend_overlay(other)`, `blend_add(other)`.

Static: `from_hsv(h, s, v, a)`, `from_hsl(h, s, l, a)`.

## 2D Geometry

### XCircle(center, radius)
XVec2 center. Methods: `contains_point(p)`, `intersects_circle(other)`, `distance_to_point(p)`, `closest_point(p)`.

### XRect2D(min, max)
XVec2 corners. Methods: `contains_point(p)`, `intersects_rect(other)`, `intersects_circle(circle)`, `distance_to_point(p)`, `get_center()`, `get_size()`, `expand_to_point(p)`.

### XSegment2D(start, end_point)
Methods: `length()`, `closest_point(p)`, `distance_to_point(p)`, `intersects_segment(other)`, `side(p)`.

### XPolygon2D(vertices)
Table of XVec2 (min 3). Methods: `contains_point(p)`, `area()`, `centroid()`, `vertex_count()`, `get_edge(i)`.

## Noise & Procedural

### XNoise2D
- `perlin(x, y)` — Perlin noise, ~[-1, 1]. Returns 0 at integer coordinates.
- `simplex(x, y)` — Simplex noise, ~[-1, 1].
- `fbm(x, y, octaves?, persistence?, lacunarity?, noise_func?)` — FBM. Defaults: 6, 0.5, 2.0, perlin.
- `worley(x, y)` — Worley/Voronoi noise. Returns distance >= 0.

### XNoise3D
- `perlin(x, y, z)` — 3D Perlin noise, ~[-1, 1]. Returns 0 at integer coordinates.
- `simplex(x, y, z)` — 3D simplex noise, ~[-1, 1].
- `fbm(x, y, z, octaves?, persistence?, lacunarity?, noise_func?)` — FBM. Defaults: 6, 0.5, 2.0, perlin.
- `worley(x, y, z)` — 3D Worley/Voronoi noise. Returns distance >= 0.

## Utility Functions

- `XRGB(r, g, b)` — RGB as XVec3
- `XRGBA(r, g, b, a)` — RGBA as XVec4
- `XMin(a, b)` / `XMax(a, b)` — Component-wise min/max
- `XClamp(val, min, max)` — Clamp
- `XLerp(a, b, t)` — Lerp (scalars, vectors, XColor; slerp for XQuat)
- `XEaseIn(t)` / `XEaseOut(t)` / `XEaseInOut(t)` — Quadratic easing
- `XHermite(p0, m0, p1, m1, t)` — Cubic Hermite interpolation
- `XSmoothstep(edge0, edge1, x)` — Smoothstep
- `XSmootherstep(edge0, edge1, x)` — Perlin's smootherstep

## Key Conventions

- Constructors: `Type.new(...)` or `Type(...)` (callable)
- Matrices: column-major flat arrays
- Quaternions: (x, y, z, w), identity = (0, 0, 0, 1)
- Euler angles: Z*Y*X convention, radians
- Equality: epsilon-tolerant (1e-9)
- Intersections: return hit point or nil
- Tests use busted framework: `busted --lpath="./?.lua" xyz_math_spec.lua`
