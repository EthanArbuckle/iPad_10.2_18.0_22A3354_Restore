@implementation PIFakeBoost

+ (id)kernelFB0
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
  }
}

+ (id)kernelFB3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
  }
}

+ (NSString)currentVersion
{
  return (NSString *)CFSTR("FB3");
}

+ (id)boostParametersFromRawProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  int v11;
  int v12;
  double v13;
  int v14;
  int v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
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
  _QWORD v37[3];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_10137();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "properties != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
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
  v4 = v3;
  objc_msgSend(v3, "rawToneCurveProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1045220557;
    objc_msgSend(v5, "boostCurveValueAt:", v6);
    v9 = v8;
    LODWORD(v10) = 0.5;
    objc_msgSend(v7, "boostCurveValueAt:", v10);
    v12 = v11;
    LODWORD(v13) = 1061997773;
    objc_msgSend(v7, "boostCurveValueAt:", v13);
    v15 = v14;
    LODWORD(v16) = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v17;
    LODWORD(v18) = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v19;
    LODWORD(v20) = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)outputImage
{
  if (-[NSString isEqualToString:](self->_inputVersion, "isEqualToString:", CFSTR("FB3")))
    -[PIFakeBoost outputImageFB3](self, "outputImageFB3");
  else
    -[PIFakeBoost outputImageFB0](self, "outputImageFB0");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputImageFB0
{
  CIImage *inputImage;
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
  void *v17;
  NSObject *v19;
  void *v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    NUAssertLogger_10137();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v31;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "kernelFB0");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->_inputImage, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inputBoost, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "imageByPremultiplyingAlpha");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)outputImageFB3
{
  CIImage *inputImage;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v41;
  const void **v42;
  const void **v43;
  void *specific;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  NSObject *v48;
  const void **v49;
  void *v50;
  int v51;
  void *v52;
  NSObject *v53;
  const void **v55;
  void *v56;
  int v57;
  void *v58;
  const void **v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  uint8_t buf[4];
  const void **v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    NUAssertLogger_10137();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v42;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v60 = dispatch_get_specific(*v43);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v43 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = (const void **)v60;
        v76 = 2114;
        v77 = v63;
        _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v43;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v51 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_inputParams, "count") != 3)
  {
    NUAssertLogger_10137();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid boost parameters"));
      v49 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v49;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = (const void **)MEMORY[0x1E0D51D48];
    v50 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v45 = objc_claimAutoreleasedReturnValue();
    v51 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (!v50)
    {
      if (v51)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v43;
        _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_29:

      v57 = _NUAssertFailHandler();
      goto LABEL_30;
    }
LABEL_27:
    if (v51)
    {
      v64 = dispatch_get_specific(*v43);
      v65 = (void *)MEMORY[0x1E0CB3978];
      v66 = v64;
      objc_msgSend(v65, "callStackSymbols");
      v43 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = (const void **)v64;
      v76 = 2114;
      v77 = v67;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_29;
  }
  -[NSArray objectAtIndexedSubscript:](self->_inputParams, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[NSArray objectAtIndexedSubscript:](self->_inputParams, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  -[NSArray objectAtIndexedSubscript:](self->_inputParams, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (v7 >= v10 || v10 >= v13)
  {
    NUAssertLogger_10137();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid points parameters"));
      v55 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v75 = v55;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = (const void **)MEMORY[0x1E0D51D48];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10137();
    v45 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v59;
        _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_32;
    }
LABEL_30:
    if (v57)
    {
      v68 = dispatch_get_specific(*v43);
      v69 = (void *)MEMORY[0x1E0CB3978];
      v70 = v68;
      objc_msgSend(v69, "callStackSymbols");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = (const void **)v68;
      v76 = 2114;
      v77 = v72;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_32:

    _NUAssertFailHandler();
  }
  v15 = (float)(v7 * -0.2) + (float)(v13 * 0.8);
  v16 = (float)(v7 * -0.2) + (float)(v10 * 0.5);
  v17 = (float)((float)(v10 - v7) * v15) - (float)((float)(v13 - v7) * v16);
  v18 = (float)((float)(v13 - v7) * -0.3) + (float)((float)(v10 - v7) * 0.6);
  v19 = (float)(v16 * -0.6) + (float)(v15 * 0.3);
  v20 = (float)((float)(v7 * (float)(v18 * 0.2)) + (float)(v19 * v7)) + (float)(v17 * -0.2);
  v21 = (float)(v17 * v19) - (float)(v20 * v18);
  v22 = v21 / (float)((float)(v19 + (float)(v18 * 0.2)) * (float)(v19 + (float)(v18 * 0.2)));
  v23 = v21 / (float)((float)(v19 + (float)(v18 * 0.8)) * (float)(v19 + (float)(v18 * 0.8)));
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v17, v20, v18, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", 0.200000003, v7, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:", 0.800000012, v13, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "kernelFB3");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->_inputImage, "extent");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v73[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inputBoost);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v36;
  v73[2] = v24;
  v73[3] = v25;
  v73[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applyWithExtent:arguments:", v37, v29, v31, v33, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "imageByPremultiplyingAlpha");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (double)inputBoost
{
  return self->_inputBoost;
}

- (void)setInputBoost:(double)a3
{
  self->_inputBoost = a3;
}

- (NSString)inputVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSArray)inputParams
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputParams:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputParams, 0);
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
