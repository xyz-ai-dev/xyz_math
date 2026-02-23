# xyz_math Roadmap

| Release | Theme | Key Features |
|---------|-------|--------------|
| **v1.1** | Core QoL & Foundations | `__tostring`, `__eq`, `__unm`, `XMat4:inverse()`, `lerp`/`XLerp`, fix `unpack` compat |
| **v1.2** | Quaternions | `XQuat` class, Hamilton product, `from_axis_angle`, `to_mat3`/`to_mat4`, `slerp` |
| **v1.3** | Camera & Projection | `look_at`, `perspective`, `orthographic`, `frustum`, `XFrustum` class |
| **v1.4** | Extended Intersections | Ray-sphere, ray-AABB, ray-triangle, sphere-AABB, `distance_to_point` |
| **v1.5** | More Primitives & Polish | `XTriangle`, `XOBB`, `XCapsule`, splines (`XBezier3`, `XCatmullRom`), `XMat4:decompose()`, `XMat3:transpose()`, `XQuat.from_mat3()`, `XRay:distance_to_ray()` |
| **v1.6** ✅ | Convenience & Performance | `length_squared`/`distance_squared` on vectors, `reflect`, `project`, `angle_between`, `is_zero` on vectors, `XMat4:transpose()`, `transform_point`/`transform_direction`, `XMat4.from_trs()`, `XQuat:to_euler()`, `nlerp` |
| **v1.7** ✅ | Color & Interpolation | `XColor` class with HSV/HSL conversion, sRGB gamma/linear, blend modes, easing functions (`ease_in`, `ease_out`, `ease_in_out`), `hermite`, `smoothstep`/`smootherstep` |
| **v1.8** ✅ | 2D Geometry | `XCircle`, `XRect2D`, `XSegment2D`, `XPolygon2D`, 2D intersection tests (circle-circle, rect-rect, segment-segment, point-in-polygon), `XVec2:rotate()`, `XVec2:perpendicular()` |
| **v1.9** | Noise & Procedural | Perlin noise, simplex noise, fractal Brownian motion (`fbm`), Voronoi/Worley noise, `XNoise2D`/`XNoise3D` utilities |
