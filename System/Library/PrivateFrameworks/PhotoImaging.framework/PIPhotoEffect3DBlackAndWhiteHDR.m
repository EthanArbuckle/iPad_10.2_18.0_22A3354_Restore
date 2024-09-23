@implementation PIPhotoEffect3DBlackAndWhiteHDR

+ (id)kernelBlackAndWhite
{
  if (kernelBlackAndWhite_onceToken_79 != -1)
    dispatch_once(&kernelBlackAndWhite_onceToken_79, &__block_literal_global_80);
  return (id)kernelBlackAndWhite_kernel_78;
}

void __54__PIPhotoEffect3DBlackAndWhiteHDR_kernelBlackAndWhite__block_invoke()
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
  v1 = (void *)kernelBlackAndWhite_kernel_78;
  kernelBlackAndWhite_kernel_78 = v0;

  if (!kernelBlackAndWhite_kernel_78)
  {
    NUAssertLogger_248();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("s_hdrOffsetPosBlackAndWhite kernel is nil"));
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
  double v17;
  void *v18;
  CIImage *inputDepthMap;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CIImage *inputImage;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_inputImage)
  {
    NUAssertLogger_248();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_248();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific(*v26);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        v40 = 2114;
        v41 = v36;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend((id)objc_opt_class(), "kernelBlackAndWhite");
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
  -[PIPhotoEffect3DBlackAndWhiteHDR photoEffectName](self, "photoEffectName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setValue:forKey:", self->_inputImage, CFSTR("inputImage"));
  *(float *)&v17 = self->_inputThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("inputThreshold"));

  inputDepthMap = self->_inputDepthMap;
  if (inputDepthMap)
    objc_msgSend(v16, "setValue:forKey:", inputDepthMap, CFSTR("inputDepthMap"));
  objc_msgSend(v16, "outputImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAdditionCompositing"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forKey:", v20, CFSTR("inputBackgroundImage"));
  objc_msgSend(v21, "setValue:forKey:", v13, CFSTR("inputImage"));
  objc_msgSend(v21, "outputImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputDepthMap
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputDepthMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (float)inputThreshold
{
  return self->_inputThreshold;
}

- (void)setInputThreshold:(float)a3
{
  self->_inputThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDepthMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
