@implementation _PIParallaxColorAnalysisJob

- (_PIParallaxColorAnalysisJob)initWithParallaxColorAnalysisRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PIParallaxColorAnalysisJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (_PIParallaxColorAnalysisJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_293);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_293);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_293);
  }
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x80000);
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  _QWORD v34[4];
  objc_super v35;
  _BYTE buf[24];
  uint64_t v37;
  uint64_t v38;
  CGRect v39;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_3899();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
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
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
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
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v35.receiver = self;
  v35.super_class = (Class)_PIParallaxColorAnalysisJob;
  if (!-[NURenderJob prepare:](&v35, sel_prepare_))
    return 0;
  -[NURenderJob outputImage](self, "outputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxColorAnalysisJob colorAnalysisRequest](self, "colorAnalysisRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "segmentationMatte");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "analyzeBackground"))
      +[PISegmentationHelper backgroundForImage:matte:](PISegmentationHelper, "backgroundForImage:matte:", v5, v8);
    else
      +[PISegmentationHelper foregroundForImage:matte:](PISegmentationHelper, "foregroundForImage:matte:", v5, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  v11 = -[NURenderJob imageSize](self, "imageSize");
  v13 = v12;
  objc_msgSend(v6, "normalizedClipRect");
  if (CGRectIsEmpty(v39))
  {
    v14 = 0;
    v15 = 0;
  }
  else
  {
    objc_msgSend(v5, "extent");
    NURectDenormalize();
    NUPixelRectFromCGRect();
    v14 = *(_QWORD *)buf;
    v15 = *(_QWORD *)&buf[8];
    v11 = *(_QWORD *)&buf[16];
    v13 = v37;
    NUPixelRectToCGRect();
    objc_msgSend(v5, "imageByCroppingToRect:");
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v16;
  }
  v34[0] = v14;
  v34[1] = v15;
  v34[2] = v11;
  v34[3] = v13;
  -[_PIParallaxColorAnalysisJob setImageRect:](self, "setImageRect:", v34);
  objc_msgSend(v5, "imageByUnpremultiplyingAlpha");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIIPTHueChromaFilter convertRGBImageToHueChroma:](PIIPTHueChromaFilter, "convertRGBImageToHueChroma:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v18 != 0;
  if (v18)
  {
    +[PIIPTHueChromaFilter normalizeHueChromaImage:](PIIPTHueChromaFilter, "normalizeHueChromaImage:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxColorAnalysisJob setHueChromaImage:](self, "setHueChromaImage:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Hue/chroma conversion failed"), v5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)render:(id *)a3
{
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v28;
  double v29;
  void *v30;
  NSObject *v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  unint64_t v80;
  BOOL v81;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  unint64_t v107;
  NSObject *v108;
  double v109;
  _BOOL4 v110;
  NSObject *v111;
  double v112;
  int v113;
  void *v114;
  void *v115;
  const char *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint8_t buf[4];
  double v123;
  __int16 v124;
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_3899();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v109 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v123 = v109;
      _os_log_error_impl(&dword_1A6382000, v108, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    *(double *)&v13 = MEMORY[0x1E0D51D48];
    v29 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]));
    NUAssertLogger_3899();
    v28 = objc_claimAutoreleasedReturnValue();
    v110 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v29 == 0.0)
    {
      if (v110)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)&v29, "componentsJoinedByString:", CFSTR("\n"));
        *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543362;
        v123 = *(double *)&v13;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }
    else if (v110)
    {
      v29 = COERCE_DOUBLE(dispatch_get_specific(*(const void **)v13));
      v114 = (void *)MEMORY[0x1E0CB3978];
      v3 = (id *)*(id *)&v29;
      objc_msgSend(v114, "callStackSymbols");
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend((id)v13, "componentsJoinedByString:", CFSTR("\n"));
      v4 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v123 = v29;
      v124 = 2114;
      v125 = v4;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    v116 = "error != NULL";
    v113 = _NUAssertFailHandler();
    goto LABEL_55;
  }
  v3 = a3;
  v4 = (uint64_t)self;
  -[_PIParallaxColorAnalysisJob colorAnalysisRequest](self, "colorAnalysisRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "surfaceStoragePool");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v4 + 232);
  *(_QWORD *)(v4 + 232) = v10;

  if (!*(_QWORD *)(v4 + 232))
  {
    NUAssertLogger_3899();
    v111 = objc_claimAutoreleasedReturnValue();
    v3 = (id *)&unk_1A64D6000;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage pool"));
      v112 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v123 = v112;
      _os_log_error_impl(&dword_1A6382000, v111, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    *(double *)&v13 = MEMORY[0x1E0D51D48];
    v29 = COERCE_DOUBLE(dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]));
    NUAssertLogger_3899();
    v28 = objc_claimAutoreleasedReturnValue();
    v113 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v29 == 0.0)
    {
      if (v113)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)&v29, "componentsJoinedByString:", CFSTR("\n"));
        *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543362;
        v123 = *(double *)&v13;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_57:

      _NUAssertFailHandler();
LABEL_58:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_294);
LABEL_7:
      v121 = v7;
      v30 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        objc_msgSend((id)v4, "medianLuminance");
        *(_DWORD *)buf = 134217984;
        v123 = v32;
        _os_log_impl(&dword_1A6382000, v31, OS_LOG_TYPE_DEFAULT, "Median luminance: %f", buf, 0xCu);

      }
      v33 = objc_msgSend(v5, "maxDominantColors", v116);
      objc_msgSend(v6, "imageHistogram");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "blue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v118 = v35;
      objc_msgSend(v35, "threshold:");
      v37 = v36;
      if (**(_QWORD **)&v29 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_294);
      v38 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v123 = v37 * 100.0;
        v124 = 2048;
        v125 = v33;
        _os_log_impl(&dword_1A6382000, v38, OS_LOG_TYPE_DEFAULT, "Percent above chroma min: %0.0f%%, max hues: %ld", buf, 0x16u);
      }
      v120 = v5;
      if (v37 >= 0.25 && v33 >= 1)
      {
        objc_msgSend(v6, "imageHistogram");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "luminance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "mutableCopy");

        objc_msgSend(v41, "smoothWithFunction:windowSize:sampleMode:", 1, 11, 3);
        objc_msgSend(v41, "modalityAnalysisWithLimit:sampleMode:", v33, 3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "setDominantHues:", v42);

        if (**(_QWORD **)&v29 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_294);
        v43 = (void *)*MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
        {
          v44 = v43;
          objc_msgSend((id)v4, "dominantHues");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          *(double *)&v45 = COERCE_DOUBLE(objc_msgSend(v117, "count"));
          objc_msgSend((id)v4, "dominantHues");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v123 = *(double *)&v45;
          v124 = 2112;
          v125 = (uint64_t)v46;
          v47 = v44;
          v29 = MEMORY[0x1E0D52390];
          _os_log_impl(&dword_1A6382000, v47, OS_LOG_TYPE_DEFAULT, "Found %ld dominant hues: %@", buf, 0x16u);

        }
      }
      if (v37 <= 0.75 && v33 >= 1)
      {
        v48 = -[NSObject mutableCopy](v28, "mutableCopy");
        objc_msgSend(v48, "smoothWithFunction:windowSize:sampleMode:", 1, 13, 1);
        objc_msgSend(v48, "modalityAnalysisWithLimit:sampleMode:", v33, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "setDominantGrays:", v49);

        if (**(_QWORD **)&v29 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_294);
        v50 = (void *)*MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          objc_msgSend((id)v4, "dominantGrays");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(double *)&v53 = COERCE_DOUBLE(objc_msgSend(v52, "count"));
          objc_msgSend((id)v4, "dominantGrays");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v123 = *(double *)&v53;
          v124 = 2112;
          v125 = (uint64_t)v54;
          _os_log_impl(&dword_1A6382000, v51, OS_LOG_TYPE_DEFAULT, "Found %ld dominant grays: %@", buf, 0x16u);

        }
      }
      objc_msgSend((id)v4, "_purgeRenderResources");
      objc_msgSend((id)v4, "dominantHues");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");

      if (v56)
      {
        v57 = 0;
        v58 = *MEMORY[0x1E0D51FA8];
        v59 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 4);
        v60 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 8);
        v61 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 12);
        v62 = *MEMORY[0x1E0D51FD8];
        v63 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 4);
        v65 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 8);
        v64 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 12);
        while (1)
        {
          objc_msgSend((id)v4, "dominantHues");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectAtIndexedSubscript:", v57);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v4, "hueChromaImage");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          objc_msgSend((id)v4, "_beginRenderNormalizedHueChromaImage:targetHue:hueRange:chromaMin:error:", v68, v3);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v69)
            break;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hue-%ld"), ++v57);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setIdentifier:", v70);

          LODWORD(v71) = v58;
          LODWORD(v72) = v59;
          LODWORD(v73) = v60;
          LODWORD(v74) = v61;
          objc_msgSend(v69, "setLuminanceWeights:", v71, v72, v73, v74);
          LODWORD(v75) = v62;
          LODWORD(v76) = v63;
          LODWORD(v77) = v65;
          LODWORD(v78) = v64;
          objc_msgSend(v69, "setLuminanceThresholds:", v75, v76, v77, v78);
          objc_msgSend(*(id *)(v4 + v13), "addObject:", v69);

          objc_msgSend((id)v4, "dominantHues");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "count");

          v6 = v69;
          if (v57 >= v80)
            goto LABEL_35;
        }
      }
      else
      {
        v69 = v6;
LABEL_35:
        objc_msgSend((id)v4, "dominantGrays");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "count");

        if (!v84)
        {
LABEL_39:
          v81 = 1;
LABEL_41:
          v8 = v119;
          v5 = v120;

          v6 = v69;
          v7 = v121;
          goto LABEL_33;
        }
        v85 = 0;
        v86 = *MEMORY[0x1E0D51FA8];
        v87 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 4);
        v88 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 8);
        v89 = *(_DWORD *)(MEMORY[0x1E0D51FA8] + 12);
        v90 = *MEMORY[0x1E0D51FD8];
        v91 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 4);
        v92 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 8);
        v93 = *(_DWORD *)(MEMORY[0x1E0D51FD8] + 12);
        while (1)
        {
          v94 = v69;
          objc_msgSend((id)v4, "dominantGrays");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "objectAtIndexedSubscript:", v85);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v4, "hueChromaImage");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          objc_msgSend((id)v4, "_beginRenderNormalizedHueChromaImage:targetGray:grayRange:chromaMax:error:", v96, v3);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v69)
            break;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gray-%ld"), ++v85);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setIdentifier:", v97);

          LODWORD(v98) = v86;
          LODWORD(v99) = v87;
          LODWORD(v100) = v88;
          LODWORD(v101) = v89;
          objc_msgSend(v69, "setLuminanceWeights:", v98, v99, v100, v101);
          LODWORD(v102) = v90;
          LODWORD(v103) = v91;
          LODWORD(v104) = v92;
          LODWORD(v105) = v93;
          objc_msgSend(v69, "setLuminanceThresholds:", v102, v103, v104, v105);
          objc_msgSend(*(id *)(v4 + v13), "addObject:", v69);

          objc_msgSend((id)v4, "dominantGrays");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "count");

          if (v85 >= v107)
            goto LABEL_39;
        }
      }

      v69 = 0;
      v81 = 0;
      goto LABEL_41;
    }
LABEL_55:
    if (v113)
    {
      v29 = COERCE_DOUBLE(dispatch_get_specific(*(const void **)v13));
      v115 = (void *)MEMORY[0x1E0CB3978];
      v3 = (id *)*(id *)&v29;
      objc_msgSend(v115, "callStackSymbols");
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend((id)v13, "componentsJoinedByString:", CFSTR("\n"));
      v4 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v123 = v29;
      v124 = 2114;
      v125 = v4;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_57;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 240;
  v14 = *(void **)(v4 + 240);
  *(_QWORD *)(v4 + 240) = v12;

  objc_msgSend(v5, "chromaThreshold");
  v16 = v15;
  objc_msgSend((id)v4, "hueChromaImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "_beginRenderingImage:colorSpace:format:error:", v17, v7, v8, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v22 = v16;
    LODWORD(v18) = 0;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = 0;
    LODWORD(v21) = 0;
    objc_msgSend(v6, "setLuminanceWeights:", v18, v19, v20, v21);
    LODWORD(v23) = 0;
    LODWORD(v24) = 0;
    LODWORD(v25) = 0;
    *(float *)&v26 = v22;
    objc_msgSend(v6, "setLuminanceThresholds:", v23, v24, v26, v25);
    objc_msgSend(*(id *)(v4 + 240), "addObject:", v6);
    if (objc_msgSend((id)v4, "_waitForRenderResources:", v3))
    {
      if (objc_msgSend((id)v4, "_computeAllHistograms:", v3))
      {
        v119 = v8;
        objc_msgSend(v6, "imageHistogram");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "red");
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v4, "setAlphaCount:", -[NSObject sampleCount](v28, "sampleCount"));
        -[NSObject median](v28, "median");
        objc_msgSend((id)v4, "setMedianLuminance:");
        v29 = MEMORY[0x1E0D52390];
        if (*MEMORY[0x1E0D52390] == -1)
          goto LABEL_7;
        goto LABEL_58;
      }
    }
  }
  v81 = 0;
LABEL_33:

  return v81;
}

- (id)_beginRenderingImage:(id)a3 colorSpace:(id)a4 format:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _PIParallaxRenderResource *v22;
  NSObject *v24;
  void *v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _BYTE v47[32];
  uint8_t buf[40];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_3899();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v37 = dispatch_get_specific(*v26);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v34 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  v13 = v12;
  memset(buf, 0, 32);
  -[_PIParallaxColorAnalysisJob imageRect](self, "imageRect");
  v46[1] = 0;
  v46[2] = 0;
  v46[3] = -[NURenderJob imageSize](self, "imageSize");
  v46[4] = v14;
  NUPixelRectFlipYOrigin();
  v15 = -[NUPurgeableStoragePool newStorageWithSize:format:](self->_storagePool, "newStorageWithSize:format:", (unsigned __int128)0, v13);
  if (!v15)
  {
    NUAssertLogger_3899();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage allocated"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138543362;
      *(_QWORD *)&v47[4] = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v47, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v28 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v47 = 138543362;
        *(_QWORD *)&v47[4] = v36;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v47, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v34)
    {
      v41 = dispatch_get_specific(*v26);
      v42 = (void *)MEMORY[0x1E0CB3978];
      v43 = v41;
      objc_msgSend(v42, "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v47 = 138543618;
      *(_QWORD *)&v47[4] = v41;
      *(_WORD *)&v47[12] = 2114;
      *(_QWORD *)&v47[14] = v45;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v47, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v16 = (void *)v15;
  objc_msgSend(v10, "imageByPremultiplyingAlpha");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = 2;
  *(_OWORD *)v47 = *(_OWORD *)buf;
  *(_OWORD *)&v47[16] = *(_OWORD *)&buf[16];
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v47);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NURenderJob imageSize](self, "imageSize");
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:alpha:error:](self, "renderImage:into:colorSpace:roi:imageSize:alpha:error:", v17, v16, v11, v18, v19, v20, v46, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc_init(_PIParallaxRenderResource);
    -[_PIParallaxRenderResource setDestination:](v22, "setDestination:", v16);
    -[_PIParallaxRenderResource setTask:](v22, "setTask:", v21);
    -[_PIParallaxRenderResource setImage:](v22, "setImage:", v10);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetHue:(double)a4 hueRange:(double)a5 chromaMin:(double)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  const void **v26;
  const void **v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  const void **v33;
  void *v34;
  int v35;
  void *v36;
  const void **v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  _QWORD v48[4];
  uint8_t buf[4];
  const void **v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    NUAssertLogger_3899();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "hueChromaImage != nil");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v38 = dispatch_get_specific(*v27);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v38;
        v51 = 2114;
        v52 = v41;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v27;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v35 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a7)
  {
    NUAssertLogger_3899();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v34 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v35)
    {
      v42 = dispatch_get_specific(*v27);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v42;
      v51 = 2114;
      v52 = v46;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v13 = v12;
  v47[0] = CFSTR("inputHueTarget");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v14;
  v47[1] = CFSTR("inputHueRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v15;
  v47[2] = CFSTR("inputChromaMin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = CFSTR("inputHueIsNormalized");
  v48[2] = v16;
  v48[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("PIIPTHueChromaColorFilter"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    +[PIIPTHueChromaFilter denormalizeHueChromaImage:](PIIPTHueChromaFilter, "denormalizeHueChromaImage:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[PIIPTHueChromaFilter convertHueChromaImageToRGB:](PIIPTHueChromaFilter, "convertHueChromaImageToRGB:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxColorAnalysisJob _beginRenderingImage:colorSpace:format:error:](self, "_beginRenderingImage:colorSpace:format:error:", v20, v21, v22, a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to produce filtered Hue/Chroma image"), 0);
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)_beginRenderNormalizedHueChromaImage:(id)a3 targetGray:(double)a4 grayRange:(double)a5 chromaMax:(double)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  const void **v26;
  const void **v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  const void **v33;
  void *v34;
  int v35;
  void *v36;
  const void **v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  const void **v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    NUAssertLogger_3899();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "hueChromaImage != nil");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v38 = dispatch_get_specific(*v27);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = (const void **)v38;
        v51 = 2114;
        v52 = v41;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v27;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v35 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a7)
  {
    NUAssertLogger_3899();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v34 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v37;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v35)
    {
      v42 = dispatch_get_specific(*v27);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = (const void **)v42;
      v51 = 2114;
      v52 = v46;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v13 = v12;
  v47[0] = CFSTR("inputLumaTarget");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v14;
  v47[1] = CFSTR("inputLumaRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v15;
  v47[2] = CFSTR("inputChromaMax");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("PIIPTHueChromaGrayFilter"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    +[PIIPTHueChromaFilter denormalizeHueChromaImage:](PIIPTHueChromaFilter, "denormalizeHueChromaImage:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[PIIPTHueChromaFilter convertHueChromaImageToRGB:](PIIPTHueChromaFilter, "convertHueChromaImageToRGB:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxColorAnalysisJob _beginRenderingImage:colorSpace:format:error:](self, "_beginRenderingImage:colorSpace:format:error:", v20, v21, v22, a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to produce filtered Hue/Chroma image"), 0);
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (BOOL)_waitForRenderResources:(id *)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_3899();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2114;
        v39 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_renderResources;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "task");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(v10, "nu_waitUntilCompletedAndReturnError:", &v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v30;

        if (!v11)
        {
          v14 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render image"), v15, v12);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v13 = 0;
          goto LABEL_12;
        }

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)_computeAllHistograms:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  NSMutableArray *obj;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3912;
  v40 = __Block_byref_object_dispose__3913;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3912;
  v34 = __Block_byref_object_dispose__3913;
  v35 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_renderResources;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v8 = objc_alloc_init(MEMORY[0x1E0D51FE8]);
        objc_msgSend(v7, "luminanceWeights");
        objc_msgSend(v8, "setLuminanceWeights:");
        objc_msgSend(v7, "luminanceThresholds");
        objc_msgSend(v8, "setLuminanceThresholds:");
        objc_msgSend(v7, "destination");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "size");
        v12 = v11;

        objc_msgSend(v7, "destination");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = 0;
        v25[1] = 0;
        v25[2] = v10;
        v25[3] = v12;
        objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __53___PIParallaxColorAnalysisJob__computeAllHistograms___block_invoke;
        v21[3] = &unk_1E5017C78;
        v23 = &v30;
        v15 = v8;
        v22 = v15;
        v24 = &v36;
        objc_msgSend(v13, "readBufferInRegion:block:", v14, v21);

        if (!v31[5])
        {
          v17 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v7, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to compute histogram"), v18, v37[5]);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v16 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "setImageHistogram:");

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
      if (v4)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v16;
}

- (BOOL)complete:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
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
  void *v35;
  NSMutableArray *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_3899();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3899();
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
        v43 = v29;
        v44 = 2114;
        v45 = v33;
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
      v43 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = -[_PIParallaxColorAnalysisJob _waitForRenderResources:](self, "_waitForRenderResources:");
  if (v5)
  {
    v5 = -[_PIParallaxColorAnalysisJob _computeAllHistograms:](self, "_computeAllHistograms:", a3);
    if (v5)
    {
      -[_PIParallaxColorAnalysisJob colorAnalysisRequest](self, "colorAnalysisRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray sortUsingComparator:](self->_renderResources, "sortUsingComparator:", &__block_literal_global_3908);
      v7 = objc_msgSend(v6, "maxDominantColors");
      v8 = -[_PIParallaxColorAnalysisJob alphaCount](self, "alphaCount");
      v35 = v6;
      objc_msgSend(v6, "dominanceThreshold");
      v10 = v9;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = self->_renderResources;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = (uint64_t)(v10 * (double)v8);
        v15 = *(_QWORD *)v38;
LABEL_6:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
          objc_msgSend(v17, "imageHistogram");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "sampleCount");

          if (v19 < v14)
            break;
          objc_msgSend(v17, "medianColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          if (objc_msgSend(v11, "count") == v7)
            break;
          if (v13 == ++v16)
          {
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v13)
              goto LABEL_6;
            break;
          }
        }
      }

      -[_PIParallaxColorAnalysisJob setDominantColors:](self, "setDominantColors:", v11);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)result
{
  _PIParallaxColorAnalysisResult *v3;
  void *v4;

  v3 = objc_alloc_init(_PIParallaxColorAnalysisResult);
  -[_PIParallaxColorAnalysisJob medianLuminance](self, "medianLuminance");
  -[_PIParallaxColorAnalysisResult setMedianLuminance:](v3, "setMedianLuminance:");
  -[_PIParallaxColorAnalysisJob dominantColors](self, "dominantColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxColorAnalysisResult setDominantColors:](v3, "setDominantColors:", v4);

  return v3;
}

- (void)_purgeRenderResources
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NUPurgeableStoragePool *storagePool;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_renderResources;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "destination", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          storagePool = self->_storagePool;
          objc_msgSend(v8, "destination");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUPurgeableStoragePool returnStorage:](storagePool, "returnStorage:", v11);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_renderResources, "removeAllObjects");
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)imageRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setImageRect:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_imageRect.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_imageRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (CIImage)hueChromaImage
{
  return self->_hueChromaImage;
}

- (void)setHueChromaImage:(id)a3
{
  objc_storeStrong((id *)&self->_hueChromaImage, a3);
}

- (int64_t)alphaCount
{
  return self->_alphaCount;
}

- (void)setAlphaCount:(int64_t)a3
{
  self->_alphaCount = a3;
}

- (double)medianLuminance
{
  return self->_medianLuminance;
}

- (void)setMedianLuminance:(double)a3
{
  self->_medianLuminance = a3;
}

- (NSArray)dominantHues
{
  return self->_dominantHues;
}

- (void)setDominantHues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)dominantGrays
{
  return self->_dominantGrays;
}

- (void)setDominantGrays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)dominantColors
{
  return self->_dominantColors;
}

- (void)setDominantColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColors, 0);
  objc_storeStrong((id *)&self->_dominantGrays, 0);
  objc_storeStrong((id *)&self->_dominantHues, 0);
  objc_storeStrong((id *)&self->_hueChromaImage, 0);
  objc_storeStrong((id *)&self->_renderResources, 0);
  objc_storeStrong((id *)&self->_storagePool, 0);
}

@end
