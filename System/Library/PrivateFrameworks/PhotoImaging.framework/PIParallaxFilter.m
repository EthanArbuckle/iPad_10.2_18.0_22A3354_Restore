@implementation PIParallaxFilter

- (CIImage)outputForegroundImage
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
  }
}

- (CIImage)outputBackgroundImage
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
  }
}

- (CIImage)outputMatteImage
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2577);
  }
}

- (CGRect)visibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleFrame.origin.x;
  y = self->_visibleFrame.origin.y;
  width = self->_visibleFrame.size.width;
  height = self->_visibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleFrame:(CGRect)a3
{
  self->_visibleFrame = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setLocalLightData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PIParallaxFilterCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (CIImage)inputForegroundImage
{
  return self->_inputForegroundImage;
}

- (void)setInputForegroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputForegroundImage, a3);
}

- (CIImage)inputBackgroundImage
{
  return self->_inputBackgroundImage;
}

- (void)setInputBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputBackgroundImage, a3);
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatteImage, a3);
}

- (CIImage)inputGuideImage
{
  return self->_inputGuideImage;
}

- (void)setInputGuideImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputGuideImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputGuideImage, 0);
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputForegroundImage, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
}

@end
