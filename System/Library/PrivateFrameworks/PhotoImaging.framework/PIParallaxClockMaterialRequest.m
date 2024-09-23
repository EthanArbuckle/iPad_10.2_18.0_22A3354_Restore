@implementation PIParallaxClockMaterialRequest

- (PIParallaxClockMaterialRequest)initWithLayerStack:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PIParallaxClockMaterialRequest *v11;
  PIParallaxClockMaterialRequest *v12;
  objc_super v14;

  v5 = a3;
  v6 = +[PIPhotoEditHelper newComposition](PIPhotoEditHelper, "newComposition");
  v7 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditHelper imageSourceWithCIImage:orientation:](PIPhotoEditHelper, "imageSourceWithCIImage:orientation:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("source"));
  objc_msgSend(v6, "setMediaType:", 1);
  v14.receiver = self;
  v14.super_class = (Class)PIParallaxClockMaterialRequest;
  v11 = -[NURenderRequest initWithComposition:](&v14, sel_initWithComposition_, v6);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_layerStack, a3);

  return v12;
}

- (PIParallaxClockMaterialRequest)initWithComposition:(id)a3
{
  id v4;
  uint64_t *v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  void *specific;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E0D52380];
    v7 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v14 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2658);
LABEL_7:
        v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = v15;
          objc_msgSend(v16, "callStackSymbols");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2658);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v22 = (void *)MEMORY[0x1E0CB3978];
      v23 = specific;
      v17 = v20;
      objc_msgSend(v22, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = specific;
      v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2658);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PIParallaxClockMaterialRequest;
  v4 = -[NURenderRequest copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIParallaxClockMaterialRequest layerStack](self, "layerStack");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[19];
    v4[19] = v5;

    -[PIParallaxClockMaterialRequest style](self, "style");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[20];
    v4[20] = v7;

  }
  return v4;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([_PIParallaxClockMaterialJob alloc], "initWithRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (PFParallaxLayerStack)layerStack
{
  return self->_layerStack;
}

- (void)setLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_layerStack, a3);
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
}

@end
