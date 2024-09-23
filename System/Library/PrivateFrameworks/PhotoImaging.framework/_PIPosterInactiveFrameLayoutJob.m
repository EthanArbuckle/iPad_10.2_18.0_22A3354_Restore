@implementation _PIPosterInactiveFrameLayoutJob

- (_PIPosterInactiveFrameLayoutJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_18323);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_18323);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_18323);
  }
}

- (_PIPosterInactiveFrameLayoutJob)initWithInactiveFrameLayoutRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PIPosterInactiveFrameLayoutJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (BOOL)wantsRenderStage
{
  void *v2;
  BOOL v3;

  -[_PIPosterInactiveFrameLayoutJob matteImage](self, "matteImage");
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
  void *v2;
  BOOL v3;

  -[_PIPosterInactiveFrameLayoutJob matteImage](self, "matteImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v22;
  const void **v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  const void **v30;
  void *v31;
  int v32;
  void *v33;
  const void **v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  const void **v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)_PIPosterInactiveFrameLayoutJob;
  v4 = -[NURenderJob prepare:](&v44, sel_prepare_, a3);
  if (!v4)
    return v4;
  -[_PIPosterInactiveFrameLayoutJob layoutInactiveFrameRequest](self, "layoutInactiveFrameRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "segmentationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    NUAssertLogger_18311();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing segmentation item"));
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v35 = dispatch_get_specific(*v24);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v35;
        v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  -[_PIPosterInactiveFrameLayoutJob layoutInactiveFrameRequest](self, "layoutInactiveFrameRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layout");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "originalLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "portraitLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_6;
    NUAssertLogger_18311();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing poster layout"));
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    v31 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v26 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v46 = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_31;
    }
LABEL_29:
    if (v32)
    {
      v39 = dispatch_get_specific(*v24);
      v40 = (void *)MEMORY[0x1E0CB3978];
      v41 = v39;
      objc_msgSend(v40, "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v39;
      v47 = 2114;
      v48 = v43;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_31:

    _NUAssertFailHandler();
  }
  v9 = (void *)v8;

LABEL_6:
  objc_msgSend(v6, "layoutConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "portraitConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "portraitConfiguration");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "segmentationMatte");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v6, "segmentationMatte");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageWithNUImageBuffer:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v6, "classification") - 3) <= 1)
    {
      +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    -[_PIPosterInactiveFrameLayoutJob setMatteImage:](self, "setMatteImage:", v19);

  }
  else
  {
    -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }
  -[_PIPosterInactiveFrameLayoutJob setLayout:](self, "setLayout:", v9);
  -[_PIPosterInactiveFrameLayoutJob setLayoutConfiguration:](self, "setLayoutConfiguration:", v14);

  return v4;
}

- (BOOL)render:(id *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  _BOOL8 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  NSObject *v46;
  const void **v47;
  const void **v48;
  void *specific;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  NSObject *v53;
  const void **v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  const void **v59;
  void *v60;
  int v61;
  void *v62;
  const void **v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  int v77;
  const void **v78;
  __int16 v79;
  void *v80;
  uint64_t v81;
  CGRect v82;
  CGRect v83;

  v81 = *MEMORY[0x1E0C80C00];
  -[NURenderJob renderer:](self, "renderer:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NUAssertLogger_18311();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing renderer"));
      v47 = (const void **)objc_claimAutoreleasedReturnValue();
      v77 = 138543362;
      v78 = v47;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);

    }
    v48 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v64 = dispatch_get_specific(*v48);
        v65 = (void *)MEMORY[0x1E0CB3978];
        v66 = v64;
        objc_msgSend(v65, "callStackSymbols");
        v48 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 138543618;
        v78 = (const void **)v64;
        v79 = 2114;
        v80 = v67;
        _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);

      }
    }
    else if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (const void **)objc_claimAutoreleasedReturnValue();
      v77 = 138543362;
      v78 = v48;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);

    }
    v56 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v5 = (void *)v4;
  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_18311();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing poster layout"));
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      v77 = 138543362;
      v78 = v54;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);

    }
    v48 = (const void **)MEMORY[0x1E0D51D48];
    v55 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v50 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (!v55)
    {
      if (v56)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (const void **)objc_claimAutoreleasedReturnValue();
        v77 = 138543362;
        v78 = v48;
        _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);

      }
LABEL_25:

      v61 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v56)
    {
      v68 = dispatch_get_specific(*v48);
      v69 = (void *)MEMORY[0x1E0CB3978];
      v70 = v68;
      objc_msgSend(v69, "callStackSymbols");
      v48 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 138543618;
      v78 = (const void **)v68;
      v79 = 2114;
      v80 = v71;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);

    }
    goto LABEL_25;
  }
  v7 = (void *)v6;
  -[_PIPosterInactiveFrameLayoutJob matteImage](self, "matteImage");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    NUAssertLogger_18311();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing matte image"));
      v59 = (const void **)objc_claimAutoreleasedReturnValue();
      v77 = 138543362;
      v78 = v59;
      _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v77, 0xCu);

    }
    v48 = (const void **)MEMORY[0x1E0D51D48];
    v60 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v50 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (!v60)
    {
      if (v61)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (const void **)objc_claimAutoreleasedReturnValue();
        v77 = 138543362;
        v78 = v63;
        _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v77, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v61)
    {
      v72 = dispatch_get_specific(*v48);
      v73 = (void *)MEMORY[0x1E0CB3978];
      v74 = v72;
      objc_msgSend(v73, "callStackSymbols");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 138543618;
      v78 = (const void **)v72;
      v79 = 2114;
      v80 = v76;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v77, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v9 = (void *)v8;
  v10 = objc_alloc(MEMORY[0x1E0D520D0]);
  objc_msgSend(v9, "extent");
  v11 = NUPixelSizeFromCGSize();
  v13 = (void *)objc_msgSend(v10, "initWithTargetPixelSize:", v11, v12);
  objc_msgSend(v7, "imageSize");
  v14 = NUPixelSizeFromCGSize();
  objc_msgSend(v13, "scaleForImageSize:", v14, v15);
  NUScaleToDouble();
  v17 = v16;
  v18 = 1.0 / v16;
  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "visibleFrame");
  v21 = v17 * v20;
  v23 = v17 * v22;
  v25 = v17 * v24;
  v27 = v17 * v26;

  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageSize");
  v30 = v29;
  v32 = v31;

  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "visibleFrame");
  v83.origin.x = v34;
  v83.origin.y = v35;
  v83.size.width = v36;
  v83.size.height = v37;
  v82.origin.x = 0.0;
  v82.origin.y = 0.0;
  v82.size.width = v30;
  v82.size.height = v32;
  v38 = !CGRectContainsRect(v82, v83);

  objc_msgSend(v9, "extent", 0, 0, 0, 0);
  v40 = v39;
  v42 = v41;
  -[_PIPosterInactiveFrameLayoutJob layoutConfiguration](self, "layoutConfiguration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:", 0, v38, v9, v43, v44, v21, v23, v25, v27, v40, v42);

  -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", v18 * 0.0, v18 * 0.0, v18 * 0.0, v18 * 0.0);
  return 1;
}

- (BOOL)complete:(id *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v42;
  void *v43;
  const void **v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_18311();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v43;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v44 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18311();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v44);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v50;
        v61 = 2114;
        v62 = v54;
        _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v49;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = (void *)MEMORY[0x1E0D751C0];
  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleFrame");
  v57 = v7;
  v58 = v6;
  v55 = v9;
  v56 = v8;
  -[_PIPosterInactiveFrameLayoutJob layoutInactiveFrameRequest](self, "layoutInactiveFrameRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "segmentationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "regions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acceptableCropRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[_PIPosterInactiveFrameLayoutJob layoutConfiguration](self, "layoutConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unsafeRect");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[_PIPosterInactiveFrameLayoutJob layout](self, "layout");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageSize");
  objc_msgSend(v4, "computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:", 1, 0, v58, v57, v56, v55, v14, v16, v18, v20, v23, v25, v27, v29, v31, v32);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  -[_PIPosterInactiveFrameLayoutJob setInactiveRect:](self, "setInactiveRect:", v34, v36, v38, v40);
  return 1;
}

- (id)result
{
  _PIPosterInactiveFrameLayoutResult *v3;

  v3 = objc_alloc_init(_PIPosterInactiveFrameLayoutResult);
  -[_PIPosterInactiveFrameLayoutJob inactiveRect](self, "inactiveRect");
  -[_PIPosterInactiveFrameLayoutResult setInactiveRect:](v3, "setInactiveRect:");
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

- (CGRect)inactiveRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inactiveRect.origin.x;
  y = self->_inactiveRect.origin.y;
  width = self->_inactiveRect.size.width;
  height = self->_inactiveRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInactiveRect:(CGRect)a3
{
  self->_inactiveRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
