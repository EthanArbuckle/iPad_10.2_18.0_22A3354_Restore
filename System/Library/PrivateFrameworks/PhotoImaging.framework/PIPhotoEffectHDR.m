@implementation PIPhotoEffectHDR

+ (id)kernel
{
  if (kernel_onceToken != -1)
    dispatch_once(&kernel_onceToken, &__block_literal_global_245);
  return (id)kernel_kernel;
}

void __26__PIPhotoEffectHDR_kernel__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _hdrOffsetPosBW(sampler image) { vec4 im = sample(image, samplerCoord(image)); float offset = (im.r + im.g + im.b) / 3.0f; offset = max(0.0f, offset - 1.0f); return vec4(offset, offset, offset, 0.0f); }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kernel_kernel;
  kernel_kernel = v0;

  if (!kernel_kernel)
  {
    NUAssertLogger_248();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("s_hdrOffsetPos kernel is nil"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v3;
      _os_log_error_impl(&dword_1A6382000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v4 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_248();
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

- (id)photoEffectName
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PI"), CFSTR("CI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("HDR"), &stru_1E501A310);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  CIImage *inputImage;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_inputImage)
  {
    NUAssertLogger_248();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_248();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v29;
        v37 = 2114;
        v38 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend((id)objc_opt_class(), "kernel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->_inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  inputImage = self->_inputImage;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &inputImage, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyWithExtent:arguments:", v12, v5, v7, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C9DDB8];
  -[PIPhotoEffectHDR photoEffectName](self, "photoEffectName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setValue:forKey:", self->_inputImage, CFSTR("inputImage"));
  objc_msgSend(v16, "outputImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAdditionCompositing"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v17, CFSTR("inputBackgroundImage"));
  objc_msgSend(v18, "setValue:forKey:", v13, CFSTR("inputImage"));
  objc_msgSend(v18, "outputImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
