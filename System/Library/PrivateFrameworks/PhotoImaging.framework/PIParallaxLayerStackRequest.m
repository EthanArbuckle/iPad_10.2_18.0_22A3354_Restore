@implementation PIParallaxLayerStackRequest

- (PIParallaxLayerStackRequest)initWithSegmentationItem:(id)a3
{
  PISegmentationItem *v4;
  PISegmentationItem *v5;
  void *v6;
  PIParallaxLayerStackRequest *v7;
  PISegmentationItem *segmentationItem;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (PISegmentationItem *)a3;
  if (!v4)
  {
    NUAssertLogger_15027();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "segmentationItem != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  -[PISegmentationItem composition](v4, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxLayerStackRequest;
  v7 = -[NURenderRequest initWithComposition:](&v23, sel_initWithComposition_, v6);

  segmentationItem = v7->_segmentationItem;
  v7->_segmentationItem = v5;

  v7->_layerStackMode = 0;
  v7->_headroomBlurEnabled = 1;
  return v7;
}

- (PIParallaxLayerStackRequest)initWithComposition:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PIParallaxLayerStackRequest;
  v4 = -[NURenderRequest copyWithZone:](&v14, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIParallaxLayerStackRequest segmentationItem](self, "segmentationItem");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[20];
    v4[20] = v5;

    -[PIParallaxLayerStackRequest layout](self, "layout");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[22];
    v4[22] = v7;

    -[PIParallaxLayerStackRequest style](self, "style");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[21];
    v4[21] = v9;

    v4[23] = -[PIParallaxLayerStackRequest layerStackMode](self, "layerStackMode");
    -[PIParallaxLayerStackRequest cache](self, "cache");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v4[24];
    v4[24] = v11;

    *((_BYTE *)v4 + 153) = -[PIParallaxLayerStackRequest isSettlingEffectEnabled](self, "isSettlingEffectEnabled");
    *((_BYTE *)v4 + 152) = -[PIParallaxLayerStackRequest headroomBlurEnabled](self, "headroomBlurEnabled");
  }
  return v4;
}

- (id)newRenderJob
{
  return -[_PIParallaxLayerStackJob initWithParallaxLayerStackRequest:]([_PIParallaxLayerStackJob alloc], "initWithParallaxLayerStackRequest:", self);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v6;
  objc_super v7;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PIParallaxLayerStackRequest shouldUseVideoFrame](self, "shouldUseVideoFrame");
  if ((_DWORD)result)
  {
    v6 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E68];
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PIParallaxLayerStackRequest;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE time](&v7, sel_time);
  }
  return result;
}

- (int64_t)mediaComponentType
{
  if (-[PIParallaxLayerStackRequest shouldUseVideoFrame](self, "shouldUseVideoFrame"))
    return 2;
  else
    return 1;
}

- (BOOL)shouldUseVideoFrame
{
  return -[PIParallaxLayerStackRequest layerStackMode](self, "layerStackMode") == 3
      && -[PIParallaxLayerStackRequest isSettlingEffectEnabled](self, "isSettlingEffectEnabled");
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (int64_t)layerStackMode
{
  return self->_layerStackMode;
}

- (void)setLayerStackMode:(int64_t)a3
{
  self->_layerStackMode = a3;
}

- (BOOL)headroomBlurEnabled
{
  return self->_headroomBlurEnabled;
}

- (void)setHeadroomBlurEnabled:(BOOL)a3
{
  self->_headroomBlurEnabled = a3;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  self->_settlingEffectEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

@end
