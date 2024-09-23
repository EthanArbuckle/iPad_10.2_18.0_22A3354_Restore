@implementation _PIParallaxLayerStackJob

- (_PIParallaxLayerStackJob)initWithParallaxLayerStackRequest:(id)a3
{
  _PIParallaxLayerStackJob *v3;
  NSMutableArray *v4;
  NSMutableArray *cachedImageEntries;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PIParallaxLayerStackJob;
  v3 = -[NURenderJob initWithRequest:](&v7, sel_initWithRequest_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cachedImageEntries = v3->_cachedImageEntries;
    v3->_cachedImageEntries = v4;

  }
  return v3;
}

- (_PIParallaxLayerStackJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
  }
}

- (PISegmentationItem)segmentationItem
{
  void *v2;
  void *v3;

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PISegmentationItem *)v3;
}

- (PIParallaxStyle)style
{
  void *v2;
  void *v3;

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PIParallaxStyle *)v3;
}

- (PFPosterOrientedLayout)requestLayout
{
  void *v2;
  void *v3;

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFPosterOrientedLayout *)v3;
}

- (int64_t)mode
{
  void *v2;
  int64_t v3;

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layerStackMode");

  return v3;
}

- (BOOL)isMainRequest
{
  return -[_PIParallaxLayerStackJob mode](self, "mode") == 0;
}

- (BOOL)isBackfillRequest
{
  return -[_PIParallaxLayerStackJob mode](self, "mode") == 2;
}

- (BOOL)isInactiveRequest
{
  return -[_PIParallaxLayerStackJob mode](self, "mode") == 3;
}

- (BOOL)isDebugRequest
{
  return -[_PIParallaxLayerStackJob mode](self, "mode") == 6;
}

- (BOOL)isPreviewRequest
{
  return -[_PIParallaxLayerStackJob mode](self, "mode") == 4 || -[_PIParallaxLayerStackJob mode](self, "mode") == 5;
}

- (id)targetColorSpace
{
  if (-[_PIParallaxLayerStackJob isInactiveRequest](self, "isInactiveRequest"))
    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  else
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldUseVideoFrame
{
  void *v2;
  char v3;

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseVideoFrame");

  return v3;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsCompleteStage
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

- (id)effectiveLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_PIParallaxLayerStackJob requestLayout](self, "requestLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSettlingEffectEnabled") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "settlingEffectLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_6:
    objc_msgSend(v4, "originalLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v4, "originalLayout");
    else
      objc_msgSend(v4, "defaultLayout");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v4, "settlingEffectLayout");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v7;
  if (-[_PIParallaxLayerStackJob mode](self, "mode") == 1 || -[_PIParallaxLayerStackJob mode](self, "mode") == 5)
  {
    objc_msgSend(v9, "landscapeLayout");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "portraitLayout");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v10;

  if (!v3)
  {
    NUAssertLogger_15027();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing parallax layout"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v25, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v20;
        v27 = 2114;
        v28 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v25, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v25, 0xCu);

    }
    _NUAssertFailHandler();
  }
  return v3;
}

- (id)backfillScalePolicy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    NUAssertLogger_15027();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing segmentation item"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v24, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v24, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v24, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v3 = v2;
  objc_msgSend(v2, "segmentationMatte");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "size");
    v8 = v7;
  }
  else
  {
    v8 = 1512;
    v6 = 2016;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", v6 * v8);

  return v9;
}

- (id)deviceScalePolicy
{
  void *v2;
  _PIParallaxLayerStackScalePolicy *v3;

  -[_PIParallaxLayerStackJob effectiveLayout](self, "effectiveLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_PIParallaxLayerStackScalePolicy initWithLayout:]([_PIParallaxLayerStackScalePolicy alloc], "initWithLayout:", v2);

  return v3;
}

- (id)scalePolicy
{
  unint64_t v3;
  void *v4;
  void *v6;
  char v7;

  v3 = -[_PIParallaxLayerStackJob mode](self, "mode");
  if (v3 > 7)
  {
    v4 = 0;
  }
  else if (((1 << v3) & 0x8B) != 0
         || ((1 << v3) & 0x34) == 0
         && (+[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v7 = objc_msgSend(v6, "segmentationDebugPreviewHighQuality"),
             v6,
             (v7 & 1) != 0))
  {
    -[_PIParallaxLayerStackJob deviceScalePolicy](self, "deviceScalePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_PIParallaxLayerStackJob backfillScalePolicy](self, "backfillScalePolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PIParallaxLayerStackJob;
  v3 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v5, sel_newRenderPipelineStateForEvaluationMode_, a3);
  objc_msgSend(v3, "setSampleMode:", 2);
  objc_msgSend(v3, "setDisableIntermediateCaching:", 1);
  return v3;
}

- (BOOL)prepare:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  PIHeadroomFilter *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  const void **v114;
  void *v115;
  NSObject *v116;
  int v117;
  void *v118;
  void *v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  _PIParallaxLayerStackJob *v140;
  uint64_t v141;
  _PIParallaxLayerStackDebugImageCollector *v142;
  _PIParallaxLayerStackJob *v143;
  void *v144;
  void *v145;
  _PIParallaxLayerStackJob *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v154;
  void *v155;
  void *specific;
  _BOOL4 v157;
  void *v158;
  NSObject *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  void *v176;
  int v177;
  BOOL v178;
  void *v179;
  int v180;
  BOOL v181;
  char v182;
  _BOOL4 v183;
  void *v184;
  uint64_t v185;
  id v186;
  _BOOL4 v187;
  void *v188;
  void *v189;
  void *v190;
  objc_super v191;
  uint8_t buf[40];
  uint64_t v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;

  v193 = *MEMORY[0x1E0C80C00];
  v191.receiver = self;
  v191.super_class = (Class)_PIParallaxLayerStackJob;
  LODWORD(v4) = -[NURenderJob prepare:](&v191, sel_prepare_, a3);
  if (!(_DWORD)v4)
    return (char)v4;
  -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NUAssertLogger_15027();
    v154 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing segmentation item"));
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v155;
      _os_log_error_impl(&dword_1A6382000, v154, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v114 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v116 = objc_claimAutoreleasedReturnValue();
    v157 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v157)
      {
        v164 = dispatch_get_specific(*v114);
        v165 = (void *)MEMORY[0x1E0CB3978];
        v166 = v164;
        objc_msgSend(v165, "callStackSymbols");
        v114 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "componentsJoinedByString:", CFSTR("\n"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v164;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v167;
        _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v157)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "componentsJoinedByString:", CFSTR("\n"));
      v114 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v114;
      _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v162 = _NUAssertFailHandler();
    goto LABEL_77;
  }
  v6 = (void *)v5;
  -[_PIParallaxLayerStackJob effectiveLayout](self, "effectiveLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v186 = v8;
  }
  else
  {
    objc_msgSend(v6, "originalStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIParallaxStyle styleWithBakedStyle:](PIParallaxStyle, "styleWithBakedStyle:", v10);
    v186 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(v6, "classification");
  v12 = -[_PIParallaxLayerStackJob isMainRequest](self, "isMainRequest");
  v187 = -[_PIParallaxLayerStackJob isBackfillRequest](self, "isBackfillRequest");
  v183 = -[_PIParallaxLayerStackJob isInactiveRequest](self, "isInactiveRequest");
  v13 = -[_PIParallaxLayerStackJob isDebugRequest](self, "isDebugRequest");
  v178 = -[_PIParallaxLayerStackJob isPreviewRequest](self, "isPreviewRequest");
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "segmentationDebugTintLayers");

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  NUPixelSizeToCGSize();
  v18 = v17;
  v20 = v19;

  objc_msgSend(v7, "layoutByUpdatingImageSize:", v18, v20);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderJob outputImage](self, "outputImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    NUAssertLogger_15027();
    v159 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output image"));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v160;
      _os_log_error_impl(&dword_1A6382000, v159, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v114 = (const void **)MEMORY[0x1E0D51D48];
    v161 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v116 = objc_claimAutoreleasedReturnValue();
    v162 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (!v161)
    {
      if (v162)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "componentsJoinedByString:", CFSTR("\n"));
        v114 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v114;
        _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_79:

      v117 = _NUAssertFailHandler();
      goto LABEL_80;
    }
LABEL_77:
    if (v162)
    {
      v168 = dispatch_get_specific(*v114);
      v169 = (void *)MEMORY[0x1E0CB3978];
      v170 = v168;
      objc_msgSend(v169, "callStackSymbols");
      v114 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "componentsJoinedByString:", CFSTR("\n"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v168;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v171;
      _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_79;
  }
  v180 = v15;
  v181 = v13;
  v182 = (char)v4;
  v22 = v21;
  objc_msgSend(v6, "segmentationMatte");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v22;
  if (v23)
  {
    -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isSettlingEffectEnabled");

    if ((v25 & 1) != 0)
      goto LABEL_14;
    v26 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v6, "segmentationMatte");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithNUImageBuffer:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(v11 - 3) <= 1)
    {
      +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v29;
    }
    if (!v28)
    {
LABEL_14:
      v184 = 0;
      v23 = 0;
    }
    else
    {
      objc_msgSend(v6, "segmentationBackground");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E0C9DDC8];
        objc_msgSend(v6, "segmentationBackground");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "imageWithNUImageBuffer:", v32);
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = v189;
        v184 = (void *)v33;
        +[PISegmentationHelper backgroundForImage:matte:infill:](PISegmentationHelper, "backgroundForImage:matte:infill:", v189, v28, v33);
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v184 = 0;
        v34 = v22;
      }
      +[PISegmentationHelper upsampleMatteImage:guideImage:](PISegmentationHelper, "upsampleMatteImage:guideImage:", v28, v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "cache");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(MEMORY[0x1E0D52220], "R8");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D52068], "linearGrayColorSpace");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PIParallaxLayerStackJob imageByCachingImage:format:colorSpace:key:](self, "imageByCachingImage:format:colorSpace:key:", v23, v37, v38, CFSTR("MatteImage"));
          v39 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v39;
        }
      }
    }
  }
  else
  {
    v184 = 0;
  }
  if (v183)
    objc_msgSend(v186, "inactiveFilter");
  else
    objc_msgSend(v186, "filter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "kind");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) == 0
    && (objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) == 0
    && (objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D755E8]) & 1) == 0)
  {
    v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0D755F0]);
    if (v40)
      goto LABEL_27;
LABEL_49:
    NUAssertLogger_15027();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing style filter"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v113;
      _os_log_error_impl(&dword_1A6382000, v112, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v114 = (const void **)MEMORY[0x1E0D51D48];
    v115 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v116 = objc_claimAutoreleasedReturnValue();
    v117 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (!v115)
    {
      if (v117)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v119;
        _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_82;
    }
LABEL_80:
    if (v117)
    {
      v172 = dispatch_get_specific(*v114);
      v173 = (void *)MEMORY[0x1E0CB3978];
      v174 = v172;
      objc_msgSend(v173, "callStackSymbols");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "componentsJoinedByString:", CFSTR("\n"));
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v172;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v176;
      _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_82:

    _NUAssertFailHandler();
  }
  v42 = 1;
  if (!v40)
    goto LABEL_49;
LABEL_27:
  v177 = v42;
  v179 = v41;
  objc_msgSend(v190, "visibleFrame");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[NURenderJob renderScale](self, "renderScale");
  NUScaleToDouble();
  NUScaleRect();
  v52 = v51;
  objc_msgSend(v40, "setVisibleFrame:");
  objc_msgSend(v190, "deviceResolution");
  objc_msgSend(v40, "setRenderScale:", fmin(v52 / v53, 1.0));
  objc_msgSend(v6, "localLightData");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLocalLightData:", v54);

  objc_msgSend(v40, "setInputGuideImage:", v189);
  objc_msgSend(v40, "setInputBackgroundImage:", v22);
  if (v23)
  {
    objc_msgSend(v40, "setInputMatteImage:", v23);
    objc_msgSend(v40, "setInputForegroundImage:", v189);
  }
  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "cache");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
    objc_msgSend(v40, "setCache:", self);
  objc_msgSend(v40, "outputBackgroundImage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "outputForegroundImage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "outputMatteImage");
  v185 = objc_claimAutoreleasedReturnValue();

  memset(buf, 0, 32);
  NUScaleToDouble();
  NUScaleRect();
  NUPixelRectFromCGRect();
  NUPixelRectToCGRect();
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  objc_msgSend(v57, "extent");
  v204.origin.x = v67;
  v204.origin.y = v68;
  v204.size.width = v69;
  v204.size.height = v70;
  v194.origin.x = v60;
  v194.origin.y = v62;
  v194.size.width = v64;
  v194.size.height = v66;
  v195 = CGRectUnion(v194, v204);
  x = v195.origin.x;
  y = v195.origin.y;
  width = v195.size.width;
  height = v195.size.height;
  objc_msgSend(v57, "extent");
  v205.origin.x = v75;
  v205.origin.y = v76;
  v205.size.width = v77;
  v205.size.height = v78;
  v196.origin.x = x;
  v196.origin.y = y;
  v196.size.width = width;
  v196.size.height = height;
  if ((!CGRectEqualToRect(v196, v205) || v187) && PFPosterEnableHeadroom())
  {
    objc_msgSend(v190, "extendedImageExtent");
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    v79 = objc_alloc_init(PIHeadroomFilter);
    -[PIHeadroomFilter setInputImage:](v79, "setInputImage:", v57);
    NUPixelRectToCGRect();
    -[PIHeadroomFilter setExtendedRect:](v79, "setExtendedRect:");
    objc_msgSend(v190, "configuration");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "screenScale");
    -[PIHeadroomFilter setRenderScale:](v79, "setRenderScale:");

    -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIHeadroomFilter setUseBlur:](v79, "setUseBlur:", objc_msgSend(v81, "headroomBlurEnabled") & (v177 ^ 1));

    -[PIHeadroomFilter setIsInactive:](v79, "setIsInactive:", v183);
    if (objc_msgSend(v186, "hasTonalityMode"))
      -[PIHeadroomFilter setUseHighKeyStyle:](v79, "setUseHighKeyStyle:", objc_msgSend(v186, "tonality") == 3);
    if (objc_msgSend(v186, "hasHeadroomLook"))
      -[PIHeadroomFilter setUseHighKeyStyle:](v79, "setUseHighKeyStyle:", objc_msgSend(v186, "headroomLook") == 2);
    if (objc_msgSend(v186, "hasColorParameter"))
    {
      objc_msgSend(v186, "color");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIHeadroomFilter setPrimaryGradientColor:](v79, "setPrimaryGradientColor:", v82);

    }
    -[PIHeadroomFilter outputImage](v79, "outputImage");
    v83 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v83;
  }
  v84 = v184;
  if (v185 && v58)
  {
    +[PISegmentationHelper foregroundForImage:matte:](PISegmentationHelper, "foregroundForImage:matte:", v58);
    v85 = objc_claimAutoreleasedReturnValue();

    v58 = (void *)v85;
    v84 = v184;
  }
  if (!v187)
  {
    if (!v178)
    {
      objc_msgSend(v190, "parallaxVisibleFrame");
      v206.origin.x = v86;
      v206.origin.y = v87;
      v206.size.width = v88;
      v206.size.height = v89;
      v197.origin.x = v44;
      v197.origin.y = v46;
      v197.size.width = v48;
      v197.size.height = v50;
      v198 = CGRectUnion(v197, v206);
      v90 = v198.origin.x;
      v91 = v198.origin.y;
      v92 = v198.size.width;
      v93 = v198.size.height;
      objc_msgSend(v190, "inactiveFrame");
      v207.origin.x = v94;
      v207.origin.y = v95;
      v207.size.width = v96;
      v207.size.height = v97;
      v199.origin.x = v90;
      v199.origin.y = v91;
      v199.size.width = v92;
      v199.size.height = v93;
      v200 = CGRectUnion(v199, v207);
      v98 = v200.origin.x;
      v99 = v200.origin.y;
      v100 = v200.size.width;
      v101 = v200.size.height;
      objc_msgSend(v190, "parallaxInactiveFrame");
      v208.origin.x = v102;
      v208.origin.y = v103;
      v208.size.width = v104;
      v208.size.height = v105;
      v201.origin.x = v98;
      v201.origin.y = v99;
      v201.size.width = v100;
      v201.size.height = v101;
      v202 = CGRectUnion(v201, v208);
      v106 = v202.origin.x;
      v107 = v202.origin.y;
      v108 = v202.size.width;
      v109 = v202.size.height;
      if (-[_PIParallaxLayerStackJob shouldUseVideoFrame](self, "shouldUseVideoFrame"))
      {
        objc_msgSend(v6, "settlingEffectNormalizedBounds");
        -[NURenderJob outputGeometry](self, "outputGeometry");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v110;
        if (v110)
          objc_msgSend(v110, "extent");
        NUPixelRectToCGRect();
        NURectDenormalize();
        v121 = v120;
        v123 = v122;
        v125 = v124;
        v127 = v126;

        v203.origin.x = v106;
        v203.origin.y = v107;
        v203.size.width = v108;
        v203.size.height = v109;
        v209.origin.x = v121;
        v209.origin.y = v123;
        v209.size.width = v125;
        v209.size.height = v127;
        CGRectIntersection(v203, v209);
        v84 = v184;
      }
    }
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    NUAlignPixelRectToPixelGrid();
    objc_msgSend(v190, "extendedImageExtent");
    NUScaleToDouble();
    NUScaleRect();
    NUPixelRectFromCGRect();
    NUPixelRectIntersection();
    NUPixelRectToCGRect();
    v129 = v128;
    v131 = v130;
    v133 = v132;
    v135 = v134;
    objc_msgSend(v57, "imageByCroppingToRect:");
    v136 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v58, "imageByCroppingToRect:", v129, v131, v133, v135);
    v137 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v136;
    v58 = (void *)v137;
  }
  v138 = v6;
  if (v180)
  {
    -[_PIParallaxLayerStackJob debugTintedImage:isBackfill:](self, "debugTintedImage:isBackfill:", v58, v187);
    v139 = objc_claimAutoreleasedReturnValue();

    v140 = self;
    -[_PIParallaxLayerStackJob debugTintedImage:isBackfill:](self, "debugTintedImage:isBackfill:", v57, v187);
    v141 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v141;
    v58 = (void *)v139;
  }
  else
  {
    v140 = self;
  }
  v188 = v40;
  if (v181)
  {
    v142 = objc_alloc_init(_PIParallaxLayerStackDebugImageCollector);
    v143 = v140;
    -[_PIParallaxLayerStackJob setDebugImageCollector:](v140, "setDebugImageCollector:", v142);

    -[_PIParallaxLayerStackJob debugImageCollector](v140, "debugImageCollector");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v138;
    v146 = v140;
    v147 = v189;
    v148 = v190;
    v149 = v186;
    v4 = v138;
    v150 = (void *)v185;
    objc_msgSend(v144, "prepareImagesForItem:renderer:layout:style:inputImage:matteImage:infillImage:foregroundImage:backgroundImage:", v145, v146, v190, v186, v189, v185, v84, v58, v57);

    v151 = v179;
  }
  else
  {
    v143 = v140;
    -[_PIParallaxLayerStackJob setBackgroundImage:](v140, "setBackgroundImage:", v57);
    -[_PIParallaxLayerStackJob setForegroundImage:](v140, "setForegroundImage:", v58);
    v151 = v179;
    v147 = v189;
    v148 = v190;
    v152 = v138;
    v150 = (void *)v185;
    v149 = v186;
    v4 = v152;
  }
  -[_PIParallaxLayerStackJob setLayout:](v143, "setLayout:", v148);

  LOBYTE(v4) = v182;
  return (char)v4;
}

- (BOOL)render:(id *)a3
{
  BOOL v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[_PIParallaxLayerStackJob mode](self, "mode") == 7)
    return 1;
  -[NURenderJob renderer:](self, "renderer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_cachedImageEntries;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "render:error:", v6, a3, (_QWORD)v20))
          {
            v5 = 0;
            goto LABEL_19;
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }

    -[_PIParallaxLayerStackJob foregroundImage](self, "foregroundImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_PIParallaxLayerStackJob foregroundImage](self, "foregroundImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_PIParallaxLayerStackJob newRenderedPixelBufferFromImage:hasAlpha:error:](self, "newRenderedPixelBufferFromImage:hasAlpha:error:", v13, 1, a3);
      -[_PIParallaxLayerStackJob setForegroundBuffer:](self, "setForegroundBuffer:", v14);

    }
    -[_PIParallaxLayerStackJob backgroundImage](self, "backgroundImage", (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[_PIParallaxLayerStackJob backgroundImage](self, "backgroundImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_PIParallaxLayerStackJob newRenderedPixelBufferFromImage:hasAlpha:error:](self, "newRenderedPixelBufferFromImage:hasAlpha:error:", v16, 0, a3);
      -[_PIParallaxLayerStackJob setBackgroundBuffer:](self, "setBackgroundBuffer:", v17);

    }
    -[_PIParallaxLayerStackJob debugImageCollector](self, "debugImageCollector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[_PIParallaxLayerStackJob debugImageCollector](self, "debugImageCollector");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray renderImagesWithRenderer:](v7, "renderImagesWithRenderer:", self);
      v5 = 1;
LABEL_19:

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)complete:(id *)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double *v13;
  BOOL v14;
  double v15;
  void *v16;
  double *v17;
  double v18;
  id v19;
  int64_t v20;
  int64_t v21;
  double v22;
  id *v23;
  id *v24;
  NSMutableArray *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = self->_cachedImageEntries;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "waitForRender:", a3, (_QWORD)v47))
        {
          v14 = 0;
          goto LABEL_38;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "classification");

  if (v12 == 1)
  {
    v13 = (double *)MEMORY[0x1E0D756F0];
  }
  else
  {
    v13 = (double *)MEMORY[0x1E0D756F8];
    if (v12 != 2)
      v13 = (double *)MEMORY[0x1E0D756E8];
  }
  v15 = *v13;
  -[_PIParallaxLayerStackJob foregroundImage](self, "foregroundImage", (_QWORD)v47);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (double *)MEMORY[0x1E0D756D0];
  if (!v16)
    v17 = (double *)MEMORY[0x1E0D75700];
  v18 = *v17;

  v6 = (NSMutableArray *)(id)*MEMORY[0x1E0D75580];
  v19 = (id)*MEMORY[0x1E0D75570];
  v20 = -[_PIParallaxLayerStackJob mode](self, "mode");
  v21 = v20;
  if (v20 == 3)
  {
    v22 = -20.0;
    v15 = -10.0;
    v23 = (id *)MEMORY[0x1E0D75590];
    v24 = (id *)MEMORY[0x1E0D75598];
    goto LABEL_20;
  }
  if (v20 == 2)
  {
    v22 = v18 + -0.5;
    v15 = v15 + -0.5;
    v23 = (id *)MEMORY[0x1E0D75578];
    v24 = (id *)MEMORY[0x1E0D75588];
LABEL_20:
    v25 = (NSMutableArray *)*v24;

    v26 = *v23;
    v6 = v25;
    v19 = v26;
    goto LABEL_22;
  }
  v22 = v18;
LABEL_22:
  -[_PIParallaxLayerStackJob backgroundBuffer](self, "backgroundBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[_PIParallaxLayerStackJob backgroundBuffer](self, "backgroundBuffer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackJob backgroundImage](self, "backgroundImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackJob layerForBuffer:image:zPosition:identifier:](self, "layerForBuffer:image:zPosition:identifier:", v28, v29, v19, v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v43 = (void *)MEMORY[0x1E0D520A0];
      -[_PIParallaxLayerStackJob backgroundImage](self, "backgroundImage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("Failed to render background layer");
      goto LABEL_36;
    }
    objc_msgSend(v5, "addObject:", v30);

  }
  -[_PIParallaxLayerStackJob foregroundBuffer](self, "foregroundBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
LABEL_28:
    -[_PIParallaxLayerStackJob debugImageCollector](self, "debugImageCollector");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[_PIParallaxLayerStackJob debugImageCollector](self, "debugImageCollector");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "resultLayersWithRenderer:", self);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v37);

    }
    if (v21 == 7)
    {
      -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isSettlingEffectAvailable");

      if (v39)
      {
        -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "settlingEffectVideoData");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[_PIParallaxLayerStackJob layerForVideoData:zPosition:identifier:](self, "layerForVideoData:zPosition:identifier:", v41, *MEMORY[0x1E0D755A0], v18);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v42);

      }
    }
    -[_PIParallaxLayerStackJob setLayers:](self, "setLayers:", v5);
    v14 = 1;
    goto LABEL_37;
  }
  -[_PIParallaxLayerStackJob foregroundBuffer](self, "foregroundBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob foregroundImage](self, "foregroundImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob layerForBuffer:image:zPosition:identifier:](self, "layerForBuffer:image:zPosition:identifier:", v32, v33, v6, v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v5, "addObject:", v34);

    goto LABEL_28;
  }
  v43 = (void *)MEMORY[0x1E0D520A0];
  -[_PIParallaxLayerStackJob backgroundImage](self, "backgroundImage");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = CFSTR("Failed to render foreground layer");
LABEL_36:
  objc_msgSend(v43, "failureError:object:", v45, v44);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v14 = 0;
LABEL_37:

LABEL_38:
  return v14;
}

- (id)result
{
  _PIParallaxLayerStackResult *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(_PIParallaxLayerStackResult);
  -[_PIParallaxLayerStackJob layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clockLayerOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75678]);

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSettlingEffectEnabled");

  v9 = objc_alloc(MEMORY[0x1E0D75190]);
  -[_PIParallaxLayerStackJob layers](self, "layers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v10, v11, v6, 0, v8, *MEMORY[0x1E0D755A8]);

  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v13, "headroomBlurEnabled");

  if ((_DWORD)v8)
    objc_msgSend(v12, "markMayContainBakedHeadroom");
  -[_PIParallaxLayerStackResult setLayerStack:](v3, "setLayerStack:", v12);

  return v3;
}

- (id)layerForBuffer:(id)a3 image:(id)a4 zPosition:(double)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint8_t buf[40];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
  {
    NUAssertLogger_15027();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v44 = dispatch_get_specific(*v28);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  if (!v11)
  {
    NUAssertLogger_15027();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    v35 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v30 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v35)
    {
      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v28;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_29:

      v41 = _NUAssertFailHandler();
      goto LABEL_30;
    }
LABEL_27:
    if (v36)
    {
      v48 = dispatch_get_specific(*v28);
      v49 = (void *)MEMORY[0x1E0CB3978];
      v50 = v48;
      objc_msgSend(v49, "callStackSymbols");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v51;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_29;
  }
  v13 = v12;
  if (!v12)
  {
    NUAssertLogger_15027();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    v40 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v30 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!v40)
    {
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v43;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_32;
    }
LABEL_30:
    if (v41)
    {
      v52 = dispatch_get_specific(*v28);
      v53 = (void *)MEMORY[0x1E0CB3978];
      v54 = v52;
      objc_msgSend(v53, "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v56;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_32:

    _NUAssertFailHandler();
  }
  memset(buf, 0, 32);
  objc_msgSend(v11, "extent");
  NUPixelRectFromCGRect();
  -[NURenderJob renderScale](self, "renderScale");
  NUPixelRectToCGRect();
  NUScaleInvert();
  NUScaleToDouble();
  NUScaleRect();
  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "extent");
  NUPixelRectToCGRect();

  NURectFlipYOrigin();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_msgSend(v10, "CVPixelBuffer");
  if (v24)
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75178]), "initWithImage:frame:zPosition:identifier:", v24, v13, v17, v19, v21, v23, a5);

  return v24;
}

- (id)layerForVideoData:(id)a3 zPosition:(double)a4 identifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v20;
  const void **v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  void *v29;
  int v30;
  void *v31;
  const void **v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const void **v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    NUAssertLogger_15027();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoData != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v33 = dispatch_get_specific(*v22);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v22 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = (const void **)v33;
        v44 = 2114;
        v45 = v36;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_15027();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v24 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_21;
    }
LABEL_19:
    if (v30)
    {
      v37 = dispatch_get_specific(*v22);
      v38 = (void *)MEMORY[0x1E0CB3978];
      v39 = v37;
      objc_msgSend(v38, "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = (const void **)v37;
      v44 = 2114;
      v45 = v41;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_21:

    _NUAssertFailHandler();
  }
  -[_PIParallaxLayerStackJob segmentationItem](self, "segmentationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settlingEffectNormalizedBounds");

  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "extent");
  NUPixelRectToCGRect();

  NURectDenormalize();
  NURectFlipYOrigin();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751D0]), "initWithVideoData:frame:zPosition:identifier:", v8, v10, v14, v15, v16, v17, a4);

  return v18;
}

- (id)newRenderedPixelBufferFromImage:(id)a3 hasAlpha:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _PIParallaxRenderBuffer *v21;
  _QWORD v23[8];

  v6 = a4;
  v8 = a3;
  -[NURenderJob renderer:](self, "renderer:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v6)
      v10 = 1111970369;
    else
      v10 = 875704422;
    v11 = (void *)MEMORY[0x1E0D52348];
    objc_msgSend(v8, "extent");
    NUPixelRectFromCGRect();
    v12 = (void *)objc_msgSend(v11, "newPixelBufferOfSize:format:", v23[6], v23[7], v10);
    if (v12)
    {
      v13 = v12;
      if (v6)
      {
        v14 = (__CVBuffer *)objc_msgSend(v12, "CVPixelBuffer");
        CVBufferSetAttachment(v14, (CFStringRef)*MEMORY[0x1E0CA8CA8], (CFTypeRef)*MEMORY[0x1E0C9AE40], kCVAttachmentMode_ShouldPropagate);
        v15 = (__CVBuffer *)objc_msgSend(v13, "CVPixelBuffer");
        CVBufferSetAttachment(v15, (CFStringRef)*MEMORY[0x1E0CA8CB0], (CFTypeRef)*MEMORY[0x1E0CA8CC0], kCVAttachmentMode_ShouldPropagate);
      }
      -[_PIParallaxLayerStackJob targetColorSpace](self, "targetColorSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applyAttachmentsToCVPixelBuffer:", objc_msgSend(v13, "CVPixelBuffer"));

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", objc_msgSend(v13, "CVPixelBuffer"));
      v18 = v17;
      if (v17)
      {
        if (v6)
          v19 = 2;
        else
          v19 = 0;
        objc_msgSend(v17, "setAlphaMode:", v19);
        objc_msgSend(v8, "extent");
        NUPixelRectFromCGRect();
        objc_msgSend(v9, "renderImage:rect:toDestination:atPoint:error:", v8, v23, v18, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          v21 = -[_PIParallaxRenderBuffer initWithPixelBuffer:renderTask:]([_PIParallaxRenderBuffer alloc], "initWithPixelBuffer:renderTask:", v13, v20);
        else
          v21 = 0;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to create renderDestination"), 0);
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to create pixel buffer"), 0);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)debugTintedImage:(id)a3 isBackfill:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void **v9;
  const __CFString **v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v18 = CFSTR("inputBiasVector");
    v5 = (void *)MEMORY[0x1E0C9DDF8];
    v6 = a3;
    objc_msgSend(v5, "vectorWithX:Y:Z:W:", 0.1, 0.0, -0.1, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (void **)v19;
    v10 = &v18;
  }
  else
  {
    v16 = CFSTR("inputBiasVector");
    v11 = (void *)MEMORY[0x1E0C9DDF8];
    v12 = a3;
    objc_msgSend(v11, "vectorWithX:Y:Z:W:", -0.1, 0.0, 0.1, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)cachedImage:(id)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0D52220];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "RGBAh");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackJob imageByCachingImage:format:colorSpace:key:](self, "imageByCachingImage:format:colorSpace:key:", v8, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageByCachingImage:(id)a3 format:(id)a4 colorSpace:(id)a5 key:(id)a6
{
  void *v7;
  void *v8;

  -[_PIParallaxLayerStackJob cacheImage:key:format:colorSpace:](self, "cacheImage:key:format:colorSpace:", a3, a6, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_cachedImageEntries, "addObject:", v7);
  objc_msgSend(v7, "cachedImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cacheImage:(id)a3 key:(id)a4 format:(id)a5 colorSpace:(id)a6
{
  id v10;
  const void **v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _PIParallaxRenderCacheEntry *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _PIParallaxRenderCacheEntry *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  const void **v28;
  const void **v29;
  void *specific;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  const void **v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  const void **v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  const void **v45;
  void *v46;
  int v47;
  void *v48;
  const void **v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  const void **v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  CGRect v74;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (const void **)a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    NUAssertLogger_15027();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v50 = dispatch_get_specific(*v29);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = (const void **)v50;
        v69 = 2114;
        v70 = (uint64_t)v53;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v29;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v37 = _NUAssertFailHandler();
    goto LABEL_37;
  }
  if (!v12)
  {
    NUAssertLogger_15027();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v35;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    v36 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v31 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v36)
    {
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v29;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_39:

      v42 = _NUAssertFailHandler();
      goto LABEL_40;
    }
LABEL_37:
    if (v37)
    {
      v54 = dispatch_get_specific(*v29);
      v55 = (void *)MEMORY[0x1E0CB3978];
      v56 = v54;
      objc_msgSend(v55, "callStackSymbols");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v54;
      v69 = 2114;
      v70 = (uint64_t)v57;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_39;
  }
  if (!v11)
  {
    NUAssertLogger_15027();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v40 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v40;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    v41 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v31 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v41)
    {
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v29;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_42:

      v47 = _NUAssertFailHandler();
      goto LABEL_43;
    }
LABEL_40:
    if (v42)
    {
      v58 = dispatch_get_specific(*v29);
      v59 = (void *)MEMORY[0x1E0CB3978];
      v60 = v58;
      objc_msgSend(v59, "callStackSymbols");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v58;
      v69 = 2114;
      v70 = (uint64_t)v61;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_42;
  }
  v14 = v13;
  objc_msgSend(v10, "extent");
  if (CGRectIsInfinite(v74))
  {
    NUAssertLogger_15027();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid image extent"));
      v45 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v45;
      _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    v46 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v31 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (!v46)
    {
      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v49;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_45;
    }
LABEL_43:
    if (v47)
    {
      v62 = dispatch_get_specific(*v29);
      v63 = (void *)MEMORY[0x1E0CB3978];
      v64 = v62;
      objc_msgSend(v63, "callStackSymbols");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = (const void **)v62;
      v69 = 2114;
      v70 = (uint64_t)v66;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_45:

    _NUAssertFailHandler();
  }
  -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v11);
  v17 = (_PIParallaxRenderCacheEntry *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (-[_PIParallaxRenderCacheEntry image](v17, "image"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "digest"),
        v20 = objc_msgSend(v10, "digest"),
        v18,
        v19 == v20))
  {
    v21 = v17;
  }
  else
  {
    v21 = -[_PIParallaxRenderCacheEntry initWithImage:format:colorSpace:]([_PIParallaxRenderCacheEntry alloc], "initWithImage:format:colorSpace:", v10, v12, v14);

    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14991);
    v22 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      *(_DWORD *)buf = 138543874;
      v68 = v11;
      v69 = 2048;
      v70 = -[_PIParallaxRenderCacheEntry sizeInBytes](v21, "sizeInBytes");
      v71 = 2048;
      v72 = objc_msgSend(v10, "digest");
      _os_log_impl(&dword_1A6382000, v23, OS_LOG_TYPE_INFO, "Cache miss for image: %{public}@ cost: %lu digest: %llx", buf, 0x20u);

    }
    -[_PIParallaxLayerStackJob layerStackRequest](self, "layerStackRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:cost:", v21, v11, -[_PIParallaxRenderCacheEntry sizeInBytes](v21, "sizeInBytes"));

  }
  return v21;
}

- (PFPosterOrientedLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (CIImage)foregroundImage
{
  return self->_foregroundImage;
}

- (void)setForegroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundImage, a3);
}

- (CIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (NUImageBuffer)foregroundBuffer
{
  return self->_foregroundBuffer;
}

- (void)setForegroundBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundBuffer, a3);
}

- (NUImageBuffer)backgroundBuffer
{
  return self->_backgroundBuffer;
}

- (void)setBackgroundBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBuffer, a3);
}

- (_PIParallaxLayerStackDebugImageCollector)debugImageCollector
{
  return self->_debugImageCollector;
}

- (void)setDebugImageCollector:(id)a3
{
  objc_storeStrong((id *)&self->_debugImageCollector, a3);
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_debugImageCollector, 0);
  objc_storeStrong((id *)&self->_backgroundBuffer, 0);
  objc_storeStrong((id *)&self->_foregroundBuffer, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_foregroundImage, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_cachedImageEntries, 0);
}

@end
