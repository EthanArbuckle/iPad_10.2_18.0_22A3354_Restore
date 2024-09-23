@implementation _PIParallaxLayerStackScalePolicy

- (_PIParallaxLayerStackScalePolicy)initWithLayout:(id)a3
{
  PFPosterOrientedLayout *v4;
  PFPosterOrientedLayout *v5;
  _PIParallaxLayerStackScalePolicy *v6;
  PFPosterOrientedLayout *layout;
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
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (PFPosterOrientedLayout *)a3;
  if (!v4)
  {
    NUAssertLogger_15027();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "layout != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
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
        v24 = v17;
        v25 = 2114;
        v26 = v21;
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
      v24 = v16;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v22.receiver = self;
  v22.super_class = (Class)_PIParallaxLayerStackScalePolicy;
  v6 = -[_PIParallaxLayerStackScalePolicy init](&v22, sel_init);
  layout = v6->_layout;
  v6->_layout = v5;

  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleForImageSize:(id)a3
{
  int64_t v4;
  int64_t v5;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[PFPosterOrientedLayout imageSize](self->_layout, "imageSize");
  -[PFPosterOrientedLayout visibleFrame](self->_layout, "visibleFrame");
  -[PFPosterOrientedLayout deviceResolution](self->_layout, "deviceResolution");
  NUPixelSizeToCGSize();
  NURectNormalize();
  NURectDenormalize();
  v4 = NUScaleFromDouble();
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
