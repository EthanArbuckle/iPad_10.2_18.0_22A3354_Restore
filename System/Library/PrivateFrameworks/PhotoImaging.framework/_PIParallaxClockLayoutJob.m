@implementation _PIParallaxClockLayoutJob

- (_PIParallaxClockLayoutJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_718);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_718);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_718);
  }
}

- (_PIParallaxClockLayoutJob)initWithParallaxClockLayoutRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PIParallaxClockLayoutJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (BOOL)wantsRenderStage
{
  void *v2;
  BOOL v3;

  -[_PIParallaxClockLayoutJob matteImage](self, "matteImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 3048192);
}

- (BOOL)prepare:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v23;
  const void **v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  const void **v31;
  void *v32;
  int v33;
  void *v34;
  const void **v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  objc_super v45;
  uint8_t buf[4];
  const void **v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)_PIParallaxClockLayoutJob;
  v4 = -[NURenderJob prepare:](&v45, sel_prepare_, a3);
  if (!v4)
    return v4;
  -[_PIParallaxClockLayoutJob clockLayoutRequest](self, "clockLayoutRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segmentationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    NUAssertLogger_701();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing segmentation item"));
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_701();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v36 = dispatch_get_specific(*v25);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v36;
        v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v33 = _NUAssertFailHandler();
    goto LABEL_31;
  }
  -[_PIParallaxClockLayoutJob clockLayoutRequest](self, "clockLayoutRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_701();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing parallax layout"));
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_701();
    v27 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v35;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_33;
    }
LABEL_31:
    if (v33)
    {
      v40 = dispatch_get_specific(*v25);
      v41 = (void *)MEMORY[0x1E0CB3978];
      v42 = v40;
      objc_msgSend(v41, "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v40;
      v48 = 2114;
      v49 = v44;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_33:

    _NUAssertFailHandler();
  }
  v9 = objc_msgSend(v8, "orientation");
  objc_msgSend(v6, "layoutConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == 2)
  {
    objc_msgSend(v10, "landscapeConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0D751A8];
      v14 = 2;
LABEL_10:
      objc_msgSend(v13, "deviceConfigurationForOrientation:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v10, "portraitConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0D751A8];
      v14 = 1;
      goto LABEL_10;
    }
  }
  v15 = v12;
  v16 = v15;
LABEL_11:

  objc_msgSend(v6, "segmentationMatte");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v6, "segmentationMatte");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithNUImageBuffer:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v6, "classification") - 3) <= 1)
    {
      +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    -[_PIParallaxClockLayoutJob setMatteImage:](self, "setMatteImage:", v20);
    -[_PIParallaxClockLayoutJob setLayout:](self, "setLayout:", v8);
    -[_PIParallaxClockLayoutJob setLayoutConfiguration:](self, "setLayoutConfiguration:", v16);

  }
  else
  {
    -[_PIParallaxClockLayoutJob setClockLayerOrder:](self, "setClockLayerOrder:", *MEMORY[0x1E0D75680]);
    -[_PIParallaxClockLayoutJob setClockIntersection:](self, "setClockIntersection:", 2);
  }

  return v4;
}

- (BOOL)render:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  const void **v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  const void **v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  __int16 v53;
  _BYTE v54[18];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[NURenderJob renderer:](self, "renderer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NUAssertLogger_701();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing renderer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_701();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v36 = dispatch_get_specific(*v20);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = v36;
        v53 = 2114;
        *(_QWORD *)v54 = v40;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);

      }
      goto LABEL_28;
    }
    if (!v23)
      goto LABEL_28;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 138543362;
    v52 = v35;
    _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v51, 0xCu);

    goto LABEL_28;
  }
  -[_PIParallaxClockLayoutJob layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NUAssertLogger_701();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing parallax layout"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v27 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_701();
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v28)
      {
        v41 = dispatch_get_specific(*v26);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = v41;
        v53 = 2114;
        *(_QWORD *)v54 = v45;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);

      }
      goto LABEL_28;
    }
    if (!v28)
      goto LABEL_28;
    goto LABEL_19;
  }
  -[_PIParallaxClockLayoutJob layoutConfiguration](self, "layoutConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxClockLayoutJob matteImage](self, "matteImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NUAssertLogger_701();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing matte image"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v51, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_701();
    v22 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (!v33)
        goto LABEL_28;
      goto LABEL_19;
    }
    if (v33)
    {
      v46 = dispatch_get_specific(*v31);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v48 = v46;
      objc_msgSend(v47, "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543618;
      v52 = v46;
      v53 = 2114;
      *(_QWORD *)v54 = v50;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v51, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
    __break(1u);
  }
  objc_msgSend(v5, "imageSize");
  objc_msgSend(v5, "visibleFrame");
  NURectNormalize();
  objc_msgSend(v7, "extent");
  NURectDenormalize();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(_OWORD *)&v54[2] = 0u;
  objc_msgSend(v4, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v7, v6, v16, 1, v9, v11, v13, v15);

  -[_PIParallaxClockLayoutJob setClockLayerOrder:](self, "setClockLayerOrder:", 0);
  -[_PIParallaxClockLayoutJob setClockIntersection:](self, "setClockIntersection:", 0);

  return 1;
}

- (id)result
{
  _PIParallaxClockLayoutResult *v3;
  void *v4;

  v3 = objc_alloc_init(_PIParallaxClockLayoutResult);
  -[_PIParallaxClockLayoutJob clockLayerOrder](self, "clockLayerOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxClockLayoutResult setClockLayerOrder:](v3, "setClockLayerOrder:", v4);

  -[_PIParallaxClockLayoutResult setClockIntersection:](v3, "setClockIntersection:", -[_PIParallaxClockLayoutJob clockIntersection](self, "clockIntersection"));
  return v3;
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (PFParallaxLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)setMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_matteImage, a3);
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (void)setClockLayerOrder:(id)a3
{
  objc_storeStrong((id *)&self->_clockLayerOrder, a3);
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (void)setClockIntersection:(unint64_t)a3
{
  self->_clockIntersection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockLayerOrder, 0);
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
