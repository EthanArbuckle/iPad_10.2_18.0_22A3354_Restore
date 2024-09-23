@implementation PIInverseFakeBoost

+ (id)kernelFB0
{
  if (kernelFB0_onceToken_72 != -1)
    dispatch_once(&kernelFB0_onceToken_72, &__block_literal_global_73);
  return (id)kernelFB0_kernel_71;
}

+ (id)kernelFB3
{
  if (kernelFB3_onceToken_77 != -1)
    dispatch_once(&kernelFB3_onceToken_77, &__block_literal_global_78_10233);
  return (id)kernelFB3_kernel_76;
}

void __31__PIInverseFakeBoost_kernelFB3__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  void *v3;
  const void **v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 inverseBoost3(__sample im, float boost, vec4 abcd, vec3 p0, vec3 p1) {\nfloat a = abcd.x;\nfloat b = abcd.y;\nfloat c = abcd.z;\nfloat d = abcd.w;\nvec3 y = im.rgb;\nvec3 g = (d * y - b) / (a - c * y);\nfloat x0 = p0.x;\nfloat y0 = p0.y;\nfloat s0 = p0.z;\nfloat a0 = x0*x0;\nfloat c0 = x0 - y0/s0;\nfloat d0 = y0*y0/s0;\nvec3 g0 = (a0 * y) / (c0 * y + d0);\nvec3 l0 = (a0 / d0) * y;\ng0 = compare(y, l0, g0);\nfloat x1 = p1.x;\nfloat y1 = p1.y;\nfloat s1 = p1.z;\nfloat a1 = (1.f-x1)*(1.f-x1);\nfloat c1 = (1.f-x1) - (1.f-y1)/s1;\nfloat d1 = (1.f-y1)*(1.f-y1)/s1;\nvec3 g1 = 1.f - (a1 * (1.f - y)) / (c1 * (1.f - y) + d1);\nvec3 l1 = 1.f - (a1 / d1) * (1.f - y);\ng1 = compare(1.f - y, l1, g1);\ng = compare(y - p0.y, g0, compare(y - p1.y, g, g1));\nim.rgb = mix(im.rgb, g, boost);\nreturn im;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernelFB3_kernel_76;
  kernelFB3_kernel_76 = v0;

  if (!kernelFB3_kernel_76)
  {
    NUAssertLogger_10137();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inverse boost kernel is nil"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A6382000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v4 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific(*v4);
        v11 = (void *)MEMORY[0x1E0CB3978];
        v12 = v10;
        objc_msgSend(v11, "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v14;
        _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v15, 0xCu);

    }
    _NUAssertFailHandler();
  }
}

void __31__PIInverseFakeBoost_kernelFB0__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  void *v3;
  const void **v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 inverseBoostWithBoost(sampler image, float boost){\nvec4 im = sample(image, samplerCoord(image));\nvec4 orig = im;\nfloat n = 1.8;\nfloat kinv = 0.91803;\nvec3 pos = max(im.rgb, kinv);\nvec3 neg = min(im.rgb, 0.0);\nim.rgb = clamp(im.rgb, 0.0, kinv);\nneg *= .35714286;\nim.rgb = im.rgb/(n+1.0-(im.rgb*n)) + neg;\nim.r = pos.r > kinv ? 0.8 + 2.126286*(pos.r-kinv) : im.r;\nim.g = pos.g > kinv ? 0.8 + 2.126286*(pos.g-kinv) : im.g;\nim.b = pos.b > kinv ? 0.8 + 2.126286*(pos.b-kinv) : im.b;\nim.rgb = mix(orig.rgb, im.rgb, boost);\nreturn im;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernelFB0_kernel_71;
  kernelFB0_kernel_71 = v0;

  if (!kernelFB0_kernel_71)
  {
    NUAssertLogger_10137();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inverse boost kernel is nil"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A6382000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v4 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific(*v4);
        v11 = (void *)MEMORY[0x1E0CB3978];
        v12 = v10;
        objc_msgSend(v11, "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v14;
        _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v15, 0xCu);

    }
    _NUAssertFailHandler();
  }
}

@end
