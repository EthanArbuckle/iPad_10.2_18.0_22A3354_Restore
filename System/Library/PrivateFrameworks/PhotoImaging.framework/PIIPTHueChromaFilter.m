@implementation PIIPTHueChromaFilter

+ (id)hueChromaKernels
{
  if (hueChromaKernels_onceToken != -1)
    dispatch_once(&hueChromaKernels_onceToken, &__block_literal_global_2143);
  return (id)hueChromaKernels_kernels;
}

+ (id)kernelNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  const void **v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_2119();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2119();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        v24 = 2114;
        v25 = v21;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  objc_msgSend(a1, "hueChromaKernels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)scaleHueKernel
{
  return (id)objc_msgSend(a1, "kernelNamed:", CFSTR("ipt_hue_chroma_scale_hue"));
}

+ (id)normalizeHueChromaImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_2119();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2119();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "scaleHueKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v31[0] = v4;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.159154943, 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)denormalizeHueChromaImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_2119();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2119();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "scaleHueKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v31[0] = v4;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 6.28318531, -3.14159265);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)convertRGBImageToIPT:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "kernelNamed:", CFSTR("ipt_from_srgb"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertIPTImageToRGB:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "kernelNamed:", CFSTR("ipt_to_srgb"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertIPTImageToHueChroma:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "kernelNamed:", CFSTR("ipt_to_hue_chroma"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertHueChromaImageToIPT:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "kernelNamed:", CFSTR("ipt_from_hue_chroma"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extent");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "applyWithExtent:arguments:", v13, v6, v8, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)convertRGBImageToHueChroma:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "convertRGBImageToIPT:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convertIPTImageToHueChroma:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)convertHueChromaImageToRGB:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "convertHueChromaImageToIPT:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convertIPTImageToRGB:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__PIIPTHueChromaFilter_hueChromaKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 ipt_from_srgb(__sample im)\n{\nvec3 lms = im.r * vec3(0.3139902162, 0.15537240628, 0.01775238698) +\nim.g * vec3(0.63951293834, 0.75789446163, 0.1094420944) +\nim.b * vec3(0.04649754622, 0.08670141862, 0.87256922462);\nlms = sign(lms)*pow(abs(lms), vec3(0.43));\nvec3 ipt = lms.r * vec3(0.4,  4.455,  0.8056) +\nlms.g * vec3(0.4, -4.851,  0.3572) +\nlms.b * vec3(0.2,  0.396,-1.1628);\nreturn vec4(ipt, im.a);\n}\nkernel vec4 ipt_to_srgb(__sample ipt)\n{\nvec3 lms = ipt.r * vec3(1.0000, 1.0000, 1.0000) +\nipt.g * vec3(0.0976,-0.1139, 0.0326) +\nipt.b * vec3(0.2052, 0.1332,-0.6769);\nlms = sign(lms)*pow(abs(lms), vec3(1.0/.43));\nvec3 im = lms.r * vec3(5.472212058380287, -1.125241895533569, 0.029801651173470) +\nlms.g * vec3(-4.641960098354471, 2.293170938060623, -0.193180728257140) +\nlms.b * vec3(0.169637076827974, -0.167895202223709, 1.163647892783812);\nreturn vec4(im, ipt.a);\n}\nkernel vec4 ipt_to_hue_chroma(__sample im)\n{\nvec4 ihc = im;\nihc.g = atan(im.b, im.g);\nihc.b = sqrt(im.g*im.g+im.b*im.b);\nreturn ihc;\n}\nkernel vec4 ipt_from_hue_chroma(__sample ihc)\n{\nvec4 ipt = ihc;\nipt.g = ihc.b * cos(ihc.g);\nipt.b = ihc.b * sin(ihc.g);\nreturn ipt;\n}\nkernel vec4 ipt_hue_chroma_scale_hue(__sample ihc, vec2 hso) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat hueScale = hso.x;\nfloat hueOffset = hso.y;\nhue = hueScale * hue + hueOffset;\nreturn vec4(luma, hue, chroma, alpha);\n}\nkernel vec4 ipt_hue_chroma_filter_hue(__sample ihc, vec4 hcr) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat hueTarget = hcr.x;\nfloat hueRange = hcr.y;\nfloat hueModulo = hcr.z;\nfloat chromaMin = hcr.w;\nfloat chromaFactor = step(chromaMin, chroma);\nfloat hueDelta = min(abs(hue - hueTarget), min(abs(hue + hueModulo - hueTarget), abs(hue - hueModulo - hueTarget)));\nfloat hueFactor = 1.0 - smoothstep(0.0, hueRange, hueDelta);\nalpha *= hueFactor * chromaFactor;\nreturn vec4(luma, hue, chroma, alpha);\n}\nkernel vec4 ipt_hue_chroma_filter_luma(__sample ihc, vec3 hcr) {\nfloat luma = ihc.r;\nfloat hue = ihc.g;\nfloat chroma = ihc.b;\nfloat alpha = ihc.a;\nfloat lumaTarget = hcr.x;\nfloat lumaRange = hcr.y;\nfloat chromaMax = hcr.z;\nfloat chromaFactor = 1.0 - step(chromaMax, chroma);\nfloat lumaDelta = abs(luma - lumaTarget);\nfloat lumaFactor = 1.0 - smoothstep(0.0, lumaRange, lumaDelta);\nalpha *= lumaFactor * chromaFactor;\nreturn vec4(luma, hue, chroma, alpha);\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hueChromaKernels_kernels;
  hueChromaKernels_kernels = v0;

}

@end
