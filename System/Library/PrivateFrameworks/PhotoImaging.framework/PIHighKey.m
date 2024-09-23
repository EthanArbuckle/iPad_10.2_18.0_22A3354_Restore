@implementation PIHighKey

+ (id)kernel
{
  if (kernel_onceToken_795 != -1)
    dispatch_once(&kernel_onceToken_795, &__block_literal_global_796);
  return (id)kernel_kernel_797;
}

void __19__PIHighKey_kernel__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 highKey(__sample im, float str)\n{\nvec3 neg = min(im.rgb, 0.0);\nvec3 pos = max(im.rgb, 1.0) - 1.0;\nim = clamp(im, 0.0, 1.0);\nvec4 im2 = 1.0-((im-1.0)*(im-1.0));\nim2 = sqrt(im2);\nfloat y = dot(im.rgb, vec3(.333333));\nfloat y2 = sqrt(1.0-(y-1.0)*(y-1.0));\ny2 = mix(y2, smoothstep(0.0, 1.0, y2), 0.5);\nvec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0);\nim3 = mix(im3, im2, .7*sqrt(y2));\nim3 = mix(im, im3, sqrt(y));\nim.rgb = mix(im.rgb, im3.rgb, str) + pos + neg;\nreturn im;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernel_kernel_797;
  kernel_kernel_797 = v0;

  if (!kernel_kernel_797)
  {
    NUAssertLogger_800();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("high key kernel is nil"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A6382000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v4 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_800();
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

- (id)outputImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSNumber *inputStrength;
  void *v13;
  void *v14;
  NSObject *v16;
  const void **v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  const void **v24;
  void *v25;
  int v26;
  void *v27;
  const void **v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  uint8_t buf[4];
  const void **v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
  {
    NUAssertLogger_800();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_800();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v29 = dispatch_get_specific(*v18);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v18 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = (const void **)v29;
        v41 = 2114;
        v42 = v32;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!self->inputStrength)
  {
    NUAssertLogger_800();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputStrength cannot be nil"));
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_800();
    v20 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v26)
    {
      v33 = dispatch_get_specific(*v18);
      v34 = (void *)MEMORY[0x1E0CB3978];
      v35 = v33;
      objc_msgSend(v34, "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = (const void **)v33;
      v41 = 2114;
      v42 = v37;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  objc_msgSend((id)objc_opt_class(), "kernel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  inputStrength = self->inputStrength;
  v38[0] = self->inputImage;
  v38[1] = inputStrength;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyWithExtent:arguments:", v13, v5, v7, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_storeStrong((id *)&self->inputStrength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
