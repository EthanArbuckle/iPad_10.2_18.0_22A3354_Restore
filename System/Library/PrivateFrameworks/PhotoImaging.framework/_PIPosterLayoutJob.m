@implementation _PIPosterLayoutJob

- (_PIPosterLayoutJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
  }
}

- (_PIPosterLayoutJob)initWithPosterLayoutRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PIPosterLayoutJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 0;
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
  return (id)objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  const __CFString *v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  const __CFString *v21;
  NSObject *v23;
  void *v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)_PIPosterLayoutJob;
  if (-[NURenderJob prepare:](&v36, sel_prepare_))
  {
    -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldConstrainLayoutToBounds"))
    {
      objc_msgSend(v5, "normalizedLayoutBounds");
      if (CGRectIsNull(v42))
      {
        NUAssertLogger_10874();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot constrain layout to a null rect"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v24;
          _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v25 = (const void **)MEMORY[0x1E0D51D48];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        NUAssertLogger_10874();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v28)
          {
            v31 = dispatch_get_specific(*v25);
            v32 = (void *)MEMORY[0x1E0CB3978];
            v33 = v31;
            objc_msgSend(v32, "callStackSymbols");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v31;
            v39 = 2114;
            v40 = v35;
            _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v30;
          _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler();
      }
    }
    objc_msgSend(v5, "layoutConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIPosterLayoutJob setLayoutConfiguration:](self, "setLayoutConfiguration:", v6);

    -[_PIPosterLayoutJob layoutConfiguration](self, "layoutConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "layoutRegions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob setLayoutRegions:](self, "setLayoutRegions:", v8);

      -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_PIPosterLayoutJob setSegmentationClassification:](self, "setSegmentationClassification:", objc_msgSend(v5, "segmentationClassification"));
        objc_msgSend(v5, "segmentationMatte");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "extent");
          v13 = CFSTR("Invalid segmentation matte size");
          if (v14 >= 1.0 && v12 >= 1.0)
          {
            if (-[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification", CFSTR("Invalid segmentation matte size")))
            {
              if (-[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification") == 3
                || -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification") == 4)
              {
                +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v11);
                v15 = objc_claimAutoreleasedReturnValue();

                v11 = (void *)v15;
              }
              -[_PIPosterLayoutJob setSegmentationMatteImage:](self, "setSegmentationMatteImage:", v11);

              goto LABEL_14;
            }
            v13 = CFSTR("Invalid segmentation classification");
          }
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", v13, v5);
          LOBYTE(v19) = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
LABEL_14:
        objc_msgSend(v5, "segmentationConfidenceMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "extent");
          v19 = v18 >= 1.0 && v17 >= 1.0;
          if (v19)
          {
            -[_PIPosterLayoutJob setSegmentationConfidenceMapImage:](self, "setSegmentationConfidenceMapImage:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid segmentation confidence map size"), v5);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          LOBYTE(v19) = 1;
        }
        goto LABEL_29;
      }
      v20 = (void *)MEMORY[0x1E0D520A0];
      v21 = CFSTR("Missing layout regions");
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0D520A0];
      v21 = CFSTR("Missing layout configuration");
    }
    objc_msgSend(v20, "missingError:object:", v21, v5);
    LOBYTE(v19) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

    return v19;
  }
  LOBYTE(v19) = 0;
  return v19;
}

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  uint64_t *v8;
  unint64_t v9;
  double v10;
  double v11;
  double height;
  double width;
  double y;
  double x;
  NSObject *v21;
  id specific;
  id v23;
  char *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  unint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  unint64_t v83;
  unint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  BOOL IsEmpty;
  double v95;
  double v96;
  double v97;
  os_log_t *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  const void **v102;
  uint64_t v103;
  os_log_t v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  _PIPosterLayoutJob *v109;
  os_log_t v110;
  double v111;
  double v112;
  void *v113;
  char v114;
  uint64_t v115;
  double v116;
  void *v117;
  uint64_t v118;
  void *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  _BOOL4 v139;
  id v140;
  double v141;
  uint64_t v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  uint64_t v153;
  PIPosterLayoutHelper *v154;
  PIPosterLayoutHelper *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v160;
  void *v161;
  const void **v162;
  NSObject *v163;
  const void **v164;
  const void **v165;
  _BOOL4 v166;
  NSObject *v167;
  const void **v168;
  int v169;
  const void **v170;
  void *v171;
  void *v172;
  void *v173;
  const char *v174;
  CGFloat v175;
  double v176;
  id v177;
  double v178;
  double v179;
  double v180;
  double v181;
  NSObject *v182;
  void *v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  CGAffineTransform v210;
  uint8_t buf[4];
  const void **v212;
  __int16 v213;
  _PIPosterLayoutJob *v214;
  uint64_t v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v215 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  specific = a5;
  v23 = a6;
  v216.origin.x = x;
  v216.origin.y = y;
  v216.size.width = width;
  v216.size.height = height;
  if (CGRectIsEmpty(v216))
  {
    NUAssertLogger_10874();
    v163 = objc_claimAutoreleasedReturnValue();
    v24 = "CGRectIsEmpty(fullExtent) == false";
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CGRectIsEmpty(fullExtent) == false");
      v164 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v212 = v164;
      _os_log_error_impl(&dword_1A6382000, v163, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v165 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v21 = objc_claimAutoreleasedReturnValue();
    v166 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v166)
      {
        specific = dispatch_get_specific(*v165);
        v171 = (void *)MEMORY[0x1E0CB3978];
        v23 = specific;
        objc_msgSend(v171, "callStackSymbols");
        v165 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "componentsJoinedByString:", CFSTR("\n"));
        self = (_PIPosterLayoutJob *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v212 = (const void **)specific;
        v213 = 2114;
        v214 = self;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v166)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v165 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v212 = v165;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v174 = "CGRectIsEmpty(fullExtent) == false";
    v169 = _NUAssertFailHandler();
    goto LABEL_82;
  }
  -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
  v24 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "normalizedLayoutBounds");
  v26 = v25;
  v28 = v27;
  v10 = v29;
  v11 = v30;

  -[NSObject screenSize](v21, "screenSize");
  if (v31 <= 0.0)
  {
    NUAssertLogger_10874();
    v167 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid layout configuration"));
      v168 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v212 = v168;
      _os_log_error_impl(&dword_1A6382000, v167, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v165 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v21 = objc_claimAutoreleasedReturnValue();
    v169 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v169)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v170 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v212 = v170;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_84;
    }
LABEL_82:
    if (v169)
    {
      specific = dispatch_get_specific(*v165);
      v172 = (void *)MEMORY[0x1E0CB3978];
      v23 = specific;
      objc_msgSend(v172, "callStackSymbols");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "componentsJoinedByString:", CFSTR("\n"));
      self = (_PIPosterLayoutJob *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v212 = (const void **)specific;
      v213 = 2114;
      v214 = self;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_84:

    _NUAssertFailHandler();
LABEL_85:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
LABEL_35:
    v98 = (os_log_t *)MEMORY[0x1E0D52380];
    v99 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
    {
      v100 = (void *)MEMORY[0x1E0CB3940];
      v101 = v99;
      objc_msgSend(v100, "stringWithFormat:", CFSTR("Invalid new initial rect"));
      v102 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v212 = v102;
      _os_log_impl(&dword_1A6382000, v101, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v103 = *v8;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v103 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
        goto LABEL_40;
      }
      if (v103 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
LABEL_40:
      v104 = *v98;
      if (!os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v105 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v106 = (void *)MEMORY[0x1E0CB3978];
      v177 = v105;
      v107 = v104;
      objc_msgSend(v106, "callStackSymbols");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "componentsJoinedByString:", CFSTR("\n"));
      v109 = (_PIPosterLayoutJob *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v212 = (const void **)v105;
      v213 = 2114;
      v214 = v109;
      _os_log_error_impl(&dword_1A6382000, v107, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_68;
    }
    v110 = *v98;
    if (!os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v160 = (void *)MEMORY[0x1E0CB3978];
    v107 = v110;
    objc_msgSend(v160, "callStackSymbols");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "componentsJoinedByString:", CFSTR("\n"));
    v162 = (const void **)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v212 = v162;
    _os_log_error_impl(&dword_1A6382000, v107, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_68:
LABEL_45:
    _NUAssertContinueHandler();
    v58 = v9;
LABEL_46:
    if (v209 / v11 >= v208 / x)
    {
      v112 = (v181 - v11) * 0.5;
      if (v112 >= v209 - v11)
        v112 = v209 - v11;
      v10 = v10 + v112;
    }
    else
    {
      v111 = (y - x) * 0.5;
      if (v111 >= v208 - x)
        v111 = v208 - x;
      height = height + v111;
    }
LABEL_53:
    -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest", v174);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "shouldConstrainLayoutToBounds");

    if ((v114 & 1) != 0)
      v115 = 2;
    else
      v115 = objc_msgSend(*(id *)(v58 + 448), "layoutTypeFromLayoutConfiguration:", v21);
    v116 = v178 + v10 * width;
    -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v117, "shouldConsiderHeadroom");

    if (v23)
    {
      v179 = width * v11;
      v182 = v21;
      v119 = *(void **)(v58 + 448);
      v120 = -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification");
      objc_msgSend(v23, "extent");
      objc_msgSend(v119, "effectiveMatteInspectionRectForClassification:havePetFaces:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourcePreferredRectNormalized:originalMatteRectDenormalized:", v120, v24 != 0, v188, v187, v186, v185, v203, v205, v204, v206, *(_QWORD *)&v191, *(_QWORD *)&v190, *(_QWORD *)&v189, *(_QWORD *)&v184, v121, v122,
        v123,
        v124);
      v126 = v125;
      v128 = v127;
      v130 = v129;
      v132 = v131;
      v133 = objc_alloc(MEMORY[0x1E0C9DDC8]);
      objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = (void *)objc_msgSend(v133, "initWithColor:", v134);

      objc_msgSend(v23, "imageByCompositingOverImage:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "imageByCroppingToRect:", v126, v128, v130, v132);
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DD90], "context");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = +[PISegmentationHelper topEdgeHasNoContactWithInspectionMatte:context:](PISegmentationHelper, "topEdgeHasNoContactWithInspectionMatte:context:", v137, v138);

      -[_PIPosterLayoutJob setHeadroomIsFeasible:](self, "setHeadroomIsFeasible:", v118 & v139);
      v140 = specific;
      if (PFPosterEnableHeadroom())
      {
        v141 = v180 + height * v200;
        if (-[_PIPosterLayoutJob headroomIsFeasible](self, "headroomIsFeasible"))
        {
          v142 = v115;
          if (v115 != 2)
          {
            objc_msgSend(v23, "extent");
            v144 = v143;
            v146 = v145;
            v148 = v147;
            v150 = *MEMORY[0x1E0D75770] * v149;
            objc_msgSend(v23, "imageByCompositingOverImage:", v135);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = v144;
            v141 = v180 + height * v200;
            objc_msgSend(v151, "imageByCroppingToRect:", v152, v146, v148, v150);
            v153 = objc_claimAutoreleasedReturnValue();

            v23 = (id)v153;
          }
        }
        else
        {
          v142 = v115;
        }
      }
      else
      {
        v142 = v115;
        v141 = v180 + height * v200;
      }
      v155 = [PIPosterLayoutHelper alloc];
      objc_msgSend(v183, "context");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = -[PIPosterLayoutHelper initWithCIContext:matte:posterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:](v155, "initWithCIContext:matte:posterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", v156, v23, -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"), -[_PIPosterLayoutJob headroomIsFeasible](self, "headroomIsFeasible"), !v139, v142, v116, v141, v179, v200 * x, v207, v200, *(_QWORD *)&v199, *(_QWORD *)&v198, *(_QWORD *)&v197, *(_QWORD *)&v196,
               v195,
               v194,
               v193,
               v192,
               *(_QWORD *)&v202,
               *(_QWORD *)&v201,
               *(_QWORD *)&v209,
               *(_QWORD *)&v208,
               v182);

      v58 = 0x1E0D75000uLL;
      specific = v140;
      v21 = v182;
    }
    else
    {
      v154 = (PIPosterLayoutHelper *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751B0]), "initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"), v118, 0, v115, v21, v116, v180 + height * v200, width * v11, v200 * x, width, v200, *(_QWORD *)&v199, *(_QWORD *)&v198,
                                       *(_QWORD *)&v197,
                                       *(_QWORD *)&v196,
                                       v195,
                                       v194,
                                       v193,
                                       v192,
                                       *(_QWORD *)&v202,
                                       *(_QWORD *)&v201,
                                       *(_QWORD *)&v209,
                                       *(_QWORD *)&v208);
      v23 = 0;
    }
    objc_msgSend(*(id *)(v58 + 448), "computeLayoutsWithHelper:", v154);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFParallaxLayoutHelper bestLayout:](v154, "bestLayout:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "arrayByAddingObject:", v158);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v183;
    goto LABEL_65;
  }
  -[NURenderJob renderer:](self, "renderer:", a8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33 || v32)
  {
    objc_msgSend(specific, "petRegions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (char *)objc_msgSend(v35, "count");

    v201 = v28;
    v202 = v26;
    v208 = v11;
    v209 = v10;
    v183 = v32;
    v178 = x;
    v180 = y;
    if (v23)
    {
      objc_msgSend(v23, "extent");
      v37 = width / v36;
      objc_msgSend(v23, "extent");
      CGAffineTransformMakeScale(&v210, v37, height / v38);
      objc_msgSend(v23, "imageByApplyingTransform:", &v210);
      v39 = objc_claimAutoreleasedReturnValue();

      v23 = (id)v39;
    }
    v40 = height;
    v41 = width;
    v207 = width;
    objc_msgSend(specific, "preferredCropRect");
    v190 = v43;
    v191 = v42;
    v189 = v44;
    v184 = v45;
    objc_msgSend(specific, "acceptableCropRect");
    v187 = v47;
    v188 = v46;
    v185 = v49;
    v186 = v48;
    objc_msgSend(specific, "gazeAreaRect");
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v58 = 0x1E0D75000uLL;
    v59 = (void *)MEMORY[0x1E0D751C0];
    -[NSObject screenSize](v21, "screenSize");
    v61 = v60;
    v63 = v62;
    objc_msgSend(specific, "faceRegions");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = v40;
    objc_msgSend(v59, "bestFaceRectWithImageSize:deviceSize:faceRegions:", v64, v41, v40, v61, v63);
    v66 = v65;
    v203 = v65;
    v204 = v67;
    v69 = v68;
    v205 = v68;
    v206 = v70;
    v71 = v67;
    v72 = v70;

    v175 = v53;
    v176 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24);
    objc_msgSend(MEMORY[0x1E0D751C0], "effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:", a7, v24 != 0, v191, v190, v189, v184, v188, v187, v186, v185, *(_QWORD *)&v66, *(_QWORD *)&v69, *(_QWORD *)&v71, *(_QWORD *)&v72, *(_QWORD *)&v51, *(_QWORD *)&v53,
      *(_QWORD *)&v55,
      *(_QWORD *)&v57);
    v198 = v74;
    v199 = v73;
    v196 = v76;
    v197 = v75;
    objc_msgSend(MEMORY[0x1E0D751C0], "effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a7, v24 != 0, v191, v190, v189, v184, v188, v187, v186, v185, *(_QWORD *)&v203, *(_QWORD *)&v205, *(_QWORD *)&v204, *(_QWORD *)&v206);
    v194 = v78;
    v195 = v77;
    v192 = v80;
    v193 = v79;
    -[NSObject screenSize](v21, "screenSize");
    v82 = v81;
    -[NSObject screenSize](v21, "screenSize");
    v83 = (unint64_t)v207;
    v84 = (unint64_t)v200;
    v85 = v176;
    v87 = v82 / v86;
    switch(-[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"))
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", (unint64_t)v207, (unint64_t)v200, 0, v87, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v195, v194, v193, v192, *(_QWORD *)&v199, *(_QWORD *)&v198, *(_QWORD *)&v197, *(_QWORD *)&v196,
          *(_QWORD *)&v203,
          v176 - (v205 + v206),
          *(_QWORD *)&v204,
          *(_QWORD *)&v206);
        goto LABEL_17;
      case 1uLL:
        if (!objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
          goto LABEL_16;
        +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v93, "posterDisableCropVariant"))
        {

        }
        else
        {
          v217.origin.x = v51;
          v217.size.width = v55;
          v217.origin.y = v175;
          v217.size.height = v57;
          IsEmpty = CGRectIsEmpty(v217);

          if (!IsEmpty)
          {
            +[PIPNCropUtilitiesWrapper bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:](PIPNCropUtilitiesWrapper, "bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:", v83, v84, v87, v188, v187, v186, v185, *(_QWORD *)&v191, *(_QWORD *)&v190, *(_QWORD *)&v189, *(_QWORD *)&v184, *(_QWORD *)&v203, v176 - (v205 + v206), *(_QWORD *)&v204, *(_QWORD *)&v206, *(_QWORD *)&v51,
              *(_QWORD *)&v175,
              *(_QWORD *)&v55,
              *(_QWORD *)&v57);
            v92 = v218.origin.y;
            y = v218.size.height;
            v10 = v218.origin.x;
            v181 = v218.size.width;
            if (!CGRectIsEmpty(v218))
              goto LABEL_18;
          }
        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", v83, v84, 0, v87, v199, v198, v197, v196, v195, v194, v193, v192);
LABEL_17:
        v10 = v88;
        v92 = v89;
        v181 = v90;
        y = v91;
LABEL_18:
        height = v85 - (v92 + y);
        v219.origin.x = v202;
        v219.origin.y = v201;
        v219.size.width = v209;
        v219.size.height = v208;
        if (CGRectIsNull(v219))
        {
          v11 = v181;
          x = y;
          width = v207;
          goto LABEL_53;
        }
        if (v10 + v181 <= v202 + v209)
          v95 = v10;
        else
          v95 = v202 + v209 - v181;
        if (v95 >= v202)
          v10 = v95;
        else
          v10 = v202;
        if (y + height <= v201 + v208)
          v96 = v85 - (v92 + y);
        else
          v96 = v201 + v208 - y;
        if (v96 >= v201)
          height = v96;
        else
          height = v201;
        v97 = fmin(fmin(v209 / v181, v208 / y), 1.0);
        v11 = v181 * v97;
        x = y * v97;
        width = v207;
        if (v181 * v97 > 0.0 && x > 0.0)
          goto LABEL_46;
        v8 = (uint64_t *)MEMORY[0x1E0D52390];
        v9 = 0x1E0D75000uLL;
        if (*MEMORY[0x1E0D52390] == -1)
          goto LABEL_35;
        goto LABEL_85;
      case 2uLL:
        goto LABEL_16;
      default:
        v10 = *MEMORY[0x1E0C9D648];
        v92 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        y = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v181 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v85 = v176;
        goto LABEL_18;
    }
  }
  v34 = 0;
LABEL_65:

  return v34;
}

- (id)_layoutFromIntermediateLayouts:(id)a3 layoutConfiguration:(id)a4 fullExtent:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  NSObject *v58;
  void *v59;
  const void **v60;
  void *specific;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  uint8_t buf[40];
  uint64_t v87;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v87 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!objc_msgSend(v11, "count"))
  {
    NUAssertLogger_10874();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "intermediateLayouts.count > 0");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        v66 = dispatch_get_specific(*v60);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v70;
        _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v65;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(v11, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visibleRect");
  v15 = v14;
  v83 = v17;
  v84 = v16;
  v82 = v18;
  objc_msgSend(v12, "parallaxPaddingPct");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v12, "timeRect");
  v24 = v23;
  v78 = v26;
  v79 = v25;
  v77 = v27;
  v28 = (id)*MEMORY[0x1E0D75680];
  -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = width;
  if (v29)
  {
    v73 = v24;
    v74 = v22;
    v76 = v20;
    v85 = 0;
    -[NURenderJob renderer:](self, "renderer:", &v85);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v15 - x;
    v32 = 0.0;
    v33 = 0.0;
    if (width != 0.0)
    {
      v31 = v31 / width;
      v33 = v83 / width;
    }
    v34 = v84 - y;
    if (height != 0.0)
    {
      v34 = v34 / height;
      v32 = v82 / height;
    }
    v35 = v85;
    objc_msgSend(v29, "extent");
    v38 = v36 + v31 * v37;
    v41 = v39 + v34 * v40;
    v42 = v33 * v37;
    v43 = v32 * v40;
    memset(buf, 0, 32);
    objc_msgSend(v30, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v29, v12, v44, 0, v38, v41, v42, v43);

    v45 = *(id *)buf;
    v46 = *(_QWORD *)&buf[8];

    v28 = v45;
    v22 = v74;
    v20 = v76;
    v24 = v73;
  }
  else
  {
    v46 = 2;
  }
  v75 = v84 + v79 * v82;
  v80 = v82 * v22;
  objc_msgSend(v13, "inactiveRect");
  v71 = v48;
  v72 = v47;
  v50 = v49;
  v52 = v51;
  v53 = objc_alloc(MEMORY[0x1E0D75228]);
  objc_msgSend(v12, "screenSize");
  v56 = (void *)objc_msgSend(v53, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v28, v46, objc_msgSend(v13, "hasTopEdgeContact"), v11, v81, height, v54, v55, v83 * v20, v80, *(_QWORD *)&v15, *(_QWORD *)&v84, *(_QWORD *)&v83, *(_QWORD *)&v82, v72, v71,
                  v50,
                  v52,
                  v15 + v24 * v83,
                  *(_QWORD *)&v75,
                  v83 * v78,
                  v82 * v77);

  return v56;
}

- (float)_headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5
{
  double height;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float result;
  double v21;

  height = a4.size.height;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "visibleRect");
  v10 = v9;
  objc_msgSend(v8, "visibleRect");
  v12 = v11;

  v13 = v10 + v12 - height;
  objc_msgSend(v7, "screenSize");
  v15 = v14;
  objc_msgSend(v7, "screenScale");
  v17 = v16;
  objc_msgSend(v7, "screenScale");
  v19 = v18;

  result = 1.0;
  if (v13 <= 0.0)
  {
    v21 = v15 / v17 * (v13 / v19);
    if (v21 < 0.0)
      v21 = 0.0;
    return v21 / ((*MEMORY[0x1E0D75770] + -1.0) * 1398784.0) * 5.0;
  }
  return result;
}

- (BOOL)render:(id *)a3
{
  const void **v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _PIPosterLayoutJob *v23;
  _PIPosterLayoutJob *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  unint64_t v43;
  void *v44;
  void *v45;
  float v46;
  float v47;
  float v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  float v53;
  float v54;
  float v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  float v62;
  float v63;
  float v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  float v69;
  float v70;
  float v71;
  double v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  float v77;
  void *v78;
  void *v79;
  float v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  BOOL v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  uint64_t v117;
  double v121;
  double x;
  double y;
  double width;
  double height;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  CGFloat v136;
  double v137;
  double v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  void *v155;
  int v156;
  void *v157;
  int v158;
  void *v159;
  int v160;
  void *v161;
  void *v162;
  void *v163;
  double v164;
  CGFloat v165;
  double v166;
  CGFloat v167;
  double v168;
  CGFloat v169;
  double v170;
  CGFloat v171;
  void *v172;
  double v173;
  void *v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  CGFloat *v180;
  float v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  double v191;
  CGFloat v192;
  double v193;
  CGFloat v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t i;
  double v200;
  CGFloat v201;
  double v202;
  CGFloat v203;
  double v204;
  CGFloat v205;
  double v206;
  CGFloat v207;
  double v208;
  void *v209;
  unint64_t v210;
  void *v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  NSObject *v235;
  const void **v236;
  const void **v237;
  void *specific;
  NSObject *v239;
  _BOOL4 v240;
  void *v241;
  NSObject *v242;
  const void **v243;
  void *v244;
  int v245;
  void *v246;
  NSObject *v247;
  const void **v248;
  void *v249;
  int v250;
  void *v251;
  const void **v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  unsigned int v265;
  int v266;
  int v267;
  int v268;
  int v269;
  int v270;
  double v271;
  int v272;
  CGFloat r2;
  int r2a;
  double r2_8;
  int r2_8a;
  double r2_16;
  int r2_16a;
  BOOL r2_28;
  double v280;
  void *v281;
  void *v282;
  double v283;
  double v284;
  void *v285;
  double v286;
  void *v287;
  void *v288;
  double v289;
  float v290;
  id v291;
  _PIPosterLayoutJob *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  uint8_t v302[128];
  uint8_t buf[4];
  const void **v304;
  __int16 v305;
  double v306;
  __int16 v307;
  uint64_t v308;
  uint64_t v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;

  v309 = *MEMORY[0x1E0C80C00];
  -[_PIPosterLayoutJob layoutConfiguration](self, "layoutConfiguration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_10874();
    v235 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing layout configuration"));
      v236 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v304 = v236;
      _os_log_error_impl(&dword_1A6382000, v235, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v237 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v239 = objc_claimAutoreleasedReturnValue();
    v240 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v240)
      {
        v253 = dispatch_get_specific(*v237);
        v254 = (void *)MEMORY[0x1E0CB3978];
        v3 = v253;
        objc_msgSend(v254, "callStackSymbols");
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v255, "componentsJoinedByString:", CFSTR("\n"));
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v304 = (const void **)v253;
        v305 = 2114;
        v306 = *(double *)&v256;
        _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        goto LABEL_87;
      }
    }
    else if (v240)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "componentsJoinedByString:", CFSTR("\n"));
      v3 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v304 = v3;
      _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_87:
    }

    v245 = _NUAssertFailHandler();
    goto LABEL_89;
  }
  v7 = (void *)v6;
  -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    NUAssertLogger_10874();
    v242 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing layout regions"));
      v243 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v304 = v243;
      _os_log_error_impl(&dword_1A6382000, v242, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v237 = (const void **)MEMORY[0x1E0D51D48];
    v244 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v239 = objc_claimAutoreleasedReturnValue();
    v245 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (!v244)
    {
      if (v245)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v246, "componentsJoinedByString:", CFSTR("\n"));
        v3 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v304 = v3;
        _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_91:
        goto LABEL_92;
      }
      goto LABEL_92;
    }
LABEL_89:
    if (v245)
    {
      v257 = dispatch_get_specific(*v237);
      v258 = (void *)MEMORY[0x1E0CB3978];
      v3 = v257;
      objc_msgSend(v258, "callStackSymbols");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "componentsJoinedByString:", CFSTR("\n"));
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v304 = (const void **)v257;
      v305 = 2114;
      v306 = *(double *)&v260;
      _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_91;
    }
LABEL_92:

    v250 = _NUAssertFailHandler();
    goto LABEL_93;
  }
  v9 = (void *)v8;
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    NUAssertLogger_10874();
    v247 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output geometry"));
      v248 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v304 = v248;
      _os_log_error_impl(&dword_1A6382000, v247, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v3 = (const void **)MEMORY[0x1E0D51D48];
    v249 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v239 = objc_claimAutoreleasedReturnValue();
    v250 = os_log_type_enabled(v239, OS_LOG_TYPE_ERROR);
    if (!v249)
    {
      if (!v250)
        goto LABEL_96;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "componentsJoinedByString:", CFSTR("\n"));
      v252 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v304 = v252;
      _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_95;
    }
LABEL_93:
    if (!v250)
      goto LABEL_96;
    v261 = dispatch_get_specific(*v3);
    v262 = (void *)MEMORY[0x1E0CB3978];
    v252 = v261;
    objc_msgSend(v262, "callStackSymbols");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "componentsJoinedByString:", CFSTR("\n"));
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v304 = (const void **)v261;
    v305 = 2114;
    v306 = *(double *)&v264;
    _os_log_error_impl(&dword_1A6382000, v239, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_95:
LABEL_96:

    _NUAssertFailHandler();
  }
  v11 = v10;
  objc_msgSend(v10, "extent");
  NUPixelRectToCGRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutProvider");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (_PIPosterLayoutJob *)v21;
  else
    v23 = self;
  v24 = v23;

  objc_msgSend(v7, "portraitConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PIPosterLayoutJob generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:](v24, "generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:", v25, v26, v27, -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"), a3, v13, v15, v17, v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v7, "portraitConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIPosterLayoutJob _layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:](self, "_layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:", v28, v29, v13, v15, v17, v19);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "landscapeConfiguration");
    v31 = objc_claimAutoreleasedReturnValue();
    v292 = v24;
    v293 = v11;
    if (v31
      && (v32 = (void *)v31,
          v33 = objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"),
          v32,
          v33))
    {
      objc_msgSend(v7, "landscapeConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
      v36 = v30;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:](v24, "generateOrientedLayoutsForFullExtent:layoutConfiguration:layoutRegions:segmentationMatteImage:segmentationClassification:error:", v34, v35, v37, -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"), a3, v13, v15, v17, v19);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v36;
      objc_msgSend(v7, "landscapeConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob _layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:](self, "_layoutFromIntermediateLayouts:layoutConfiguration:fullExtent:", v38, v39, v13, v15, v17, v19);
      v40 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = 0;
      v38 = 0;
    }
    v296 = (void *)v30;
    v294 = (void *)v40;
    v297 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75208]), "initWithPortraitLayout:landscapeLayout:", v30, v40);
    -[_PIPosterLayoutJob setLayout:](self, "setLayout:");
    objc_msgSend(v28, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutScore");
    *(float *)&v42 = v42;
    -[_PIPosterLayoutJob setLayoutScore:](self, "setLayoutScore:", v42);
    v43 = 0x1E0D75000uLL;
    v44 = (void *)MEMORY[0x1E0D751C0];
    objc_msgSend(v7, "portraitConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v45, v13, v15, v17, v19);
    v47 = v46;
    -[_PIPosterLayoutJob layoutScore](self, "layoutScore");
    *(float *)&v49 = v48 - v47;
    -[_PIPosterLayoutJob setLayoutScore:](self, "setLayoutScore:", v49);

    objc_msgSend(v41, "cropScore");
    *(float *)&v50 = v50;
    -[_PIPosterLayoutJob setCropScore:](self, "setCropScore:", v50);
    v51 = (void *)MEMORY[0x1E0D751C0];
    objc_msgSend(v7, "portraitConfiguration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v52, v13, v15, v17, v19);
    v54 = v53;
    -[_PIPosterLayoutJob cropScore](self, "cropScore");
    *(float *)&v56 = v55 - v54;
    -[_PIPosterLayoutJob setCropScore:](self, "setCropScore:", v56);

    v295 = v38;
    objc_msgSend(v38, "lastObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      objc_msgSend(v57, "layoutScore");
      *(float *)&v59 = v59;
      -[_PIPosterLayoutJob setLandscapeLayoutScore:](self, "setLandscapeLayoutScore:", v59);
      v60 = (void *)MEMORY[0x1E0D751C0];
      objc_msgSend(v7, "landscapeConfiguration");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v61, v13, v15, v17, v19);
      v63 = v62;
      -[_PIPosterLayoutJob landscapeLayoutScore](self, "landscapeLayoutScore");
      *(float *)&v65 = v64 - v63;
      -[_PIPosterLayoutJob setLandscapeLayoutScore:](self, "setLandscapeLayoutScore:", v65);

      objc_msgSend(v58, "cropScore");
      *(float *)&v66 = v66;
      -[_PIPosterLayoutJob setLandscapeCropScore:](self, "setLandscapeCropScore:", v66);
      v67 = (void *)MEMORY[0x1E0D751C0];
      objc_msgSend(v7, "landscapeConfiguration");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v68, v13, v15, v17, v19);
      v70 = v69;
      -[_PIPosterLayoutJob landscapeCropScore](self, "landscapeCropScore");
      *(float *)&v72 = v71 - v70;
      -[_PIPosterLayoutJob setLandscapeCropScore:](self, "setLandscapeCropScore:", v72);

    }
    -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "shouldConstrainLayoutToBounds");

    if ((v74 & 1) == 0)
    {
      v75 = (void *)MEMORY[0x1E0D751C0];
      objc_msgSend(v7, "portraitConfiguration");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v41, v76, v13, v15, v17, v19);
      -[_PIPosterLayoutJob setUsingHeadroom:](self, "setUsingHeadroom:", v77 > 0.0);

      if (v58)
      {
        v78 = (void *)MEMORY[0x1E0D751C0];
        objc_msgSend(v7, "landscapeConfiguration");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v58, v79, v13, v15, v17, v19);
        -[_PIPosterLayoutJob setUsingLandscapeHeadroom:](self, "setUsingLandscapeHeadroom:", v80 > 0.0);

      }
    }
    -[_PIPosterLayoutJob layoutRequest](self, "layoutRequest");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "shouldComputeAllScores");

    if (v82)
    {
      objc_msgSend(v7, "portraitConfiguration");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob setClockOverlapAcceptable:](self, "setClockOverlapAcceptable:", objc_msgSend(v41, "clockOverlapAcceptableForLayoutConfiguration:", v83));

      -[NURenderJob renderer:](self, "renderer:", a3);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
        v86 = v84 == 0;
      else
        v86 = 0;
      v87 = !v86;
      if (!v86)
      {
        v281 = v28;
        v282 = v84;
        r2_28 = v87;
        v291 = objc_alloc_init(MEMORY[0x1E0D52110]);
        objc_msgSend(v9, "faceRegions");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v288 = v9;
        v283 = v17;
        if (objc_msgSend(v88, "count"))
        {
          objc_msgSend(v9, "faceRegions");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "firstObject");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "rectValue");
          v92 = v91;
          v94 = v93;
          v96 = v95;
          v289 = v97;

        }
        else
        {
          v92 = *MEMORY[0x1E0C9D628];
          v94 = *(double *)(MEMORY[0x1E0C9D628] + 8);
          v96 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          v289 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        }

        v98 = v297;
        objc_msgSend(v297, "imageSize");
        v100 = v99;
        objc_msgSend(v297, "imageSize");
        v102 = v101;
        -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        v280 = v19;
        if (v103)
        {
          v104 = v96;
          v105 = v92 * v100 + 0.0;
          r2_8 = v104;
          r2_16 = v94;
          v284 = v92;
          v286 = 0.0;
          v271 = v104 * v100;
          -[_PIPosterLayoutJob segmentationMatteImage](self, "segmentationMatteImage");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "portraitLayout");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "visibleFrame");
          NURectNormalize();
          objc_msgSend(v106, "extent");
          NURectDenormalize();
          v109 = v108;
          v111 = v110;
          v113 = v112;
          v115 = v114;

          r2 = v109;
          v310.origin.x = v109;
          v310.origin.y = v111;
          v310.size.width = v113;
          v310.size.height = v115;
          v311 = CGRectIntegral(v310);
          objc_msgSend(v106, "imageByCroppingToRect:", v311.origin.x, v311.origin.y, v311.size.width, v311.size.height);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D751B0], "inflatePersonFaceRect:", v105, v94 * v102 + 0.0, v271, v289 * v102);
          if (v113 >= v115)
            v121 = v115;
          else
            v121 = v113;
          v312 = CGRectInset(*(CGRect *)&v117, v121 * -0.05, v121 * -0.05);
          x = v312.origin.x;
          y = v312.origin.y;
          width = v312.size.width;
          height = v312.size.height;
          objc_msgSend(v297, "portraitLayout");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "visibleFrame");
          v131 = x - v130;
          v132 = 0.0;
          if (v128 != 0.0)
          {
            v131 = v131 / v128;
            v132 = width / v128;
          }
          v133 = y - v127;
          if (v129 != 0.0)
          {
            v133 = v133 / v129;
            v286 = height / v129;
          }
          objc_msgSend(v106, "extent");
          v136 = v134 + v131 * v135;
          v139 = v137 + v133 * v138;
          v140 = v132 * v135;
          v141 = v286 * v138;

          v313.origin.x = v136;
          v313.origin.y = v139;
          v313.size.width = v140;
          v313.size.height = v141;
          v320.origin.x = r2;
          v320.origin.y = v111;
          v320.size.width = v113;
          v320.size.height = v115;
          v314 = CGRectIntersection(v313, v320);
          v142 = v314.origin.x;
          v143 = v314.origin.y;
          v144 = v314.size.width;
          v145 = v314.size.height;
          objc_msgSend(v291, "computeHistogramFromMatte:", v116);
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          +[PISegmentationHelper localConfidenceImage:](PISegmentationHelper, "localConfidenceImage:", v116);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "extent");
          v148 = v147;
          v150 = v149;
          v152 = v151;
          v154 = v153;
          objc_msgSend(v282, "context");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          +[PISegmentationHelper localConfidenceScoreForLocalConfidenceImage:extent:context:](PISegmentationHelper, "localConfidenceScoreForLocalConfidenceImage:extent:context:", v146, v155, v148, v150, v152, v154);
          v267 = v156;

          objc_msgSend(v282, "context");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          +[PISegmentationHelper localConfidenceScoreForLocalConfidenceImage:extent:context:](PISegmentationHelper, "localConfidenceScoreForLocalConfidenceImage:extent:context:", v146, v157, v142, v143, v144, v145);
          v268 = v158;

          objc_msgSend(v282, "context");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          +[PISegmentationHelper groundedScoreForSegmentationMatte:context:](PISegmentationHelper, "groundedScoreForSegmentationMatte:context:", v116, v159);
          v266 = v160;

          v98 = v297;
          v92 = v284;
          v96 = r2_8;
          v94 = r2_16;
          v43 = 0x1E0D75000;
        }
        else
        {
          v287 = 0;
          v266 = 0;
          v267 = 0;
          v268 = 0;
        }
        -[_PIPosterLayoutJob segmentationConfidenceMapImage](self, "segmentationConfidenceMapImage");
        v161 = (void *)objc_claimAutoreleasedReturnValue();

        if (v161)
        {
          -[_PIPosterLayoutJob segmentationConfidenceMapImage](self, "segmentationConfidenceMapImage");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "imageSize");
          objc_msgSend(v98, "imageSize");
          objc_msgSend(v98, "portraitLayout");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "visibleFrame");
          NURectNormalize();
          objc_msgSend(v162, "extent");
          NURectDenormalize();
          v165 = v164;
          v167 = v166;
          v169 = v168;
          v171 = v170;

          v315.origin.x = v165;
          v315.origin.y = v167;
          v315.size.width = v169;
          v315.size.height = v171;
          v316 = CGRectIntegral(v315);
          objc_msgSend(v162, "imageByCroppingToRect:", v316.origin.x, v316.origin.y, v316.size.width, v316.size.height);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v291, "computeHistogramFromMatte:", v172);
          v285 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v285 = 0;
        }
        if (v96 <= v289)
          v173 = v289;
        else
          v173 = v96;
        if (-[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification") == 1)
        {
          v174 = *(void **)(v43 + 448);
          objc_msgSend(v98, "imageSize");
          v177 = v175;
          v178 = v176;
          if (v175 == 0.0
            || v176 == 0.0
            || v175 == *MEMORY[0x1E0D71130] && v176 == *(double *)(MEMORY[0x1E0D71130] + 8))
          {
            v179 = 1.0;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134218496;
              v304 = *(const void ***)&v177;
              v305 = 2048;
              v306 = v178;
              v307 = 2048;
              v308 = 0x3FF0000000000000;
              _os_log_fault_impl(&dword_1A6382000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
            }
          }
          else
          {
            v179 = fabs(v175 / v176);
          }
          v180 = (CGFloat *)MEMORY[0x1E0C9D628];
          v265 = objc_msgSend(v174, "facePositionAcceptable:imageAspect:", v92, v94, v96, v289, v179);
        }
        else
        {
          v265 = 1;
          v180 = (CGFloat *)MEMORY[0x1E0C9D628];
        }
        v181 = v173;
        +[PISegmentationHelper bimodalScoreForHistogram:](PISegmentationHelper, "bimodalScoreForHistogram:", v287);
        v269 = v182;
        v184 = v183;
        v186 = v185;
        +[PISegmentationHelper bimodalScoreForHistogram:](PISegmentationHelper, "bimodalScoreForHistogram:", v285);
        v270 = v187;
        v272 = v188;
        v190 = v189;
        v192 = *v180;
        v191 = v180[1];
        v194 = v180[2];
        v193 = v180[3];
        v298 = 0u;
        v299 = 0u;
        v300 = 0u;
        v301 = 0u;
        objc_msgSend(v9, "faceRegions");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v298, v302, 16);
        v290 = v181;
        r2_16a = v186;
        r2_8a = v190;
        r2a = v184;
        if (v196)
        {
          v197 = v196;
          v198 = *(_QWORD *)v299;
          do
          {
            for (i = 0; i != v197; ++i)
            {
              if (*(_QWORD *)v299 != v198)
                objc_enumerationMutation(v195);
              objc_msgSend(*(id *)(*((_QWORD *)&v298 + 1) + 8 * i), "rectValue");
              v201 = v200;
              v203 = v202;
              v205 = v204;
              v207 = v206;
              v317.origin.x = v192;
              v317.origin.y = v191;
              v317.size.width = v194;
              v317.size.height = v193;
              if (CGRectIsNull(v317))
              {
                v192 = v201;
                v191 = v203;
                v194 = v205;
                v193 = v207;
              }
              else
              {
                v318.origin.x = v192;
                v318.origin.y = v191;
                v318.size.width = v194;
                v318.size.height = v193;
                v321.origin.x = v201;
                v321.origin.y = v203;
                v321.size.width = v205;
                v321.size.height = v207;
                v319 = CGRectUnion(v318, v321);
                v192 = v319.origin.x;
                v191 = v319.origin.y;
                v194 = v319.size.width;
                v193 = v319.size.height;
              }
            }
            v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v298, v302, 16);
          }
          while (v197);
        }

        v208 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24) - (v191 + v193);
        buf[0] = 0;
        v209 = (void *)MEMORY[0x1E0D750F0];
        v210 = -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification");
        objc_msgSend(v7, "portraitConfiguration");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v288;
        objc_msgSend(v288, "preferredCropRect");
        v213 = v212;
        v215 = v214;
        v217 = v216;
        v219 = v218;
        objc_msgSend(v288, "acceptableCropRect");
        objc_msgSend(v209, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", v210, v211, (unint64_t)v283, (unint64_t)v280, 0, 0, v213, v215, v217, v219, v220, v221, v222, v223, *(_QWORD *)&v192,
          *(_QWORD *)&v208,
          *(_QWORD *)&v194,
          *(_QWORD *)&v193,
          buf);

        -[_PIPosterLayoutJob setMetadataClockOverlapAcceptable:](self, "setMetadataClockOverlapAcceptable:", buf[0]);
        LODWORD(v224) = v269;
        -[_PIPosterLayoutJob setSegmentationScore:](self, "setSegmentationScore:", v224);
        LODWORD(v225) = v267;
        -[_PIPosterLayoutJob setLocalConfidenceScore:](self, "setLocalConfidenceScore:", v225);
        LODWORD(v226) = v266;
        -[_PIPosterLayoutJob setGroundedScore:](self, "setGroundedScore:", v226);
        LODWORD(v227) = v270;
        -[_PIPosterLayoutJob setConfidenceMapScore:](self, "setConfidenceMapScore:", v227);
        LODWORD(v228) = r2a;
        -[_PIPosterLayoutJob setMattePureBackground:](self, "setMattePureBackground:", v228);
        LODWORD(v229) = r2_16a;
        -[_PIPosterLayoutJob setMattePureForeground:](self, "setMattePureForeground:", v229);
        LODWORD(v230) = v272;
        -[_PIPosterLayoutJob setConfidencePureBackground:](self, "setConfidencePureBackground:", v230);
        LODWORD(v231) = r2_8a;
        -[_PIPosterLayoutJob setConfidencePureForeground:](self, "setConfidencePureForeground:", v231);
        *(float *)&v232 = v290;
        -[_PIPosterLayoutJob setFaceSize:](self, "setFaceSize:", v232);
        LODWORD(v233) = v268;
        -[_PIPosterLayoutJob setFaceLocalConfidence:](self, "setFaceLocalConfidence:", v233);
        -[_PIPosterLayoutJob setFacePositionAcceptable:](self, "setFacePositionAcceptable:", v265);

        v28 = v281;
        v84 = v282;
        v87 = r2_28;
      }

    }
    else
    {
      v87 = 1;
    }
    v24 = v292;
    v11 = v293;

  }
  else
  {
    v87 = 0;
  }

  return v87;
}

- (BOOL)complete:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  float v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  double v25;
  NSObject *v27;
  void *v28;
  const void **v29;
  void *specific;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NUAssertLogger_10874();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing layout regions"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v40, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10874();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific(*v29);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138543618;
        v41 = v35;
        v42 = 2114;
        v43 = v39;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v40, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138543362;
      v41 = v34;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v40, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void *)v4;
  if (-[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification") == 1)
  {
    objc_msgSend(v5, "faceRegions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification");
    LODWORD(v8) = 0;
    if (v7 != 2)
      goto LABEL_8;
    objc_msgSend(v5, "petRegions", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = objc_msgSend(v6, "count");

  LODWORD(v8) = 0;
  if (v10 == 1)
    *(float *)&v8 = 0.5;
LABEL_8:
  -[_PIPosterLayoutJob setParallaxScore:](self, "setParallaxScore:", v8);
  -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "faceRegions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((float)((float)(unint64_t)objc_msgSend(v12, "count") / 10.0) > 1.0)
  {
    LODWORD(v13) = 1.0;
    -[_PIPosterLayoutJob setNFaces:](self, "setNFaces:", v13);
  }
  else
  {
    -[_PIPosterLayoutJob layoutRegions](self, "layoutRegions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "faceRegions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v16 = (float)(unint64_t)objc_msgSend(v15, "count") / 10.0;
    -[_PIPosterLayoutJob setNFaces:](self, "setNFaces:", v16);

  }
  -[_PIPosterLayoutJob layout](self, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "portraitLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "visibleFrame");
  v20 = v19;

  -[_PIPosterLayoutJob layoutConfiguration](self, "layoutConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "portraitConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "screenSize");
  v24 = v23;

  *(float *)&v25 = fminf(v20 / v24, 1.0);
  -[_PIPosterLayoutJob setResolutionRatio:](self, "setResolutionRatio:", v25);

  return 1;
}

- (id)result
{
  _PIPosterLayoutResult *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _PIPosterLayoutResult *v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[21];
  _QWORD v57[23];

  v57[21] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_PIPosterLayoutResult);
  -[_PIPosterLayoutJob layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v3;
  -[_PIPosterLayoutResult setLayout:](v3, "setLayout:", v4);

  v48 = objc_alloc(MEMORY[0x1E0C99E08]);
  v56[0] = *MEMORY[0x1E0D75858];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v52;
  v56[1] = *MEMORY[0x1E0D757A0];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob cropScore](self, "cropScore");
  objc_msgSend(v5, "numberWithFloat:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v51;
  v56[2] = *MEMORY[0x1E0D757D8];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob layoutScore](self, "layoutScore");
  objc_msgSend(v6, "numberWithFloat:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v50;
  v56[3] = *MEMORY[0x1E0D75800];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob nFaces](self, "nFaces");
  objc_msgSend(v7, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v49;
  v56[4] = *MEMORY[0x1E0D75818];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob segmentationScore](self, "segmentationScore");
  objc_msgSend(v8, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v47;
  v56[5] = *MEMORY[0x1E0D757E0];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob localConfidenceScore](self, "localConfidenceScore");
  objc_msgSend(v9, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v46;
  v56[6] = *MEMORY[0x1E0D757C0];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob groundedScore](self, "groundedScore");
  objc_msgSend(v10, "numberWithFloat:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v45;
  v56[7] = *MEMORY[0x1E0D75788];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob confidenceMapScore](self, "confidenceMapScore");
  objc_msgSend(v11, "numberWithFloat:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v57[7] = v44;
  v56[8] = *MEMORY[0x1E0D75808];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob parallaxScore](self, "parallaxScore");
  objc_msgSend(v12, "numberWithFloat:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[8] = v43;
  v56[9] = *MEMORY[0x1E0D757E8];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob mattePureBackground](self, "mattePureBackground");
  objc_msgSend(v13, "numberWithFloat:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[9] = v42;
  v56[10] = *MEMORY[0x1E0D757F0];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob mattePureForeground](self, "mattePureForeground");
  objc_msgSend(v14, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[10] = v41;
  v56[11] = *MEMORY[0x1E0D75790];
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob confidencePureBackground](self, "confidencePureBackground");
  objc_msgSend(v15, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v57[11] = v40;
  v56[12] = *MEMORY[0x1E0D75798];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob confidencePureForeground](self, "confidencePureForeground");
  objc_msgSend(v16, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v57[12] = v39;
  v56[13] = *MEMORY[0x1E0D75780];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PIPosterLayoutJob clockOverlapAcceptable](self, "clockOverlapAcceptable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v57[13] = v38;
  v56[14] = *MEMORY[0x1E0D75810];
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob resolutionRatio](self, "resolutionRatio");
  objc_msgSend(v17, "numberWithFloat:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v57[14] = v37;
  v56[15] = *MEMORY[0x1E0D757B8];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob faceSize](self, "faceSize");
  objc_msgSend(v18, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57[15] = v19;
  v56[16] = *MEMORY[0x1E0D757A8];
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[_PIPosterLayoutJob faceLocalConfidence](self, "faceLocalConfidence");
  objc_msgSend(v20, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57[16] = v21;
  v56[17] = *MEMORY[0x1E0D757B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PIPosterLayoutJob facePositionAcceptable](self, "facePositionAcceptable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57[17] = v22;
  v56[18] = *MEMORY[0x1E0D75778];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PIPosterLayoutJob segmentationClassification](self, "segmentationClassification"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v57[18] = v23;
  v56[19] = *MEMORY[0x1E0D757F8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PIPosterLayoutJob metadataClockOverlapAcceptable](self, "metadataClockOverlapAcceptable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v57[19] = v24;
  v56[20] = *MEMORY[0x1E0D75848];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PIPosterLayoutJob usingHeadroom](self, "usingHeadroom"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[20] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v48, "initWithDictionary:", v26);

  -[_PIPosterLayoutJob layout](self, "layout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "landscapeLayout");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v54[0] = *MEMORY[0x1E0D757C8];
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[_PIPosterLayoutJob landscapeCropScore](self, "landscapeCropScore");
    objc_msgSend(v30, "numberWithFloat:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v31;
    v54[1] = *MEMORY[0x1E0D757D0];
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[_PIPosterLayoutJob landscapeLayoutScore](self, "landscapeLayoutScore");
    objc_msgSend(v32, "numberWithFloat:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v33;
    v54[2] = *MEMORY[0x1E0D75850];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PIPosterLayoutJob usingLandscapeHeadroom](self, "usingLandscapeHeadroom"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addEntriesFromDictionary:", v35);

  }
  -[_PIPosterLayoutResult setScores:](v53, "setScores:", v27);

  return v53;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (PFParallaxAssetRegions)layoutRegions
{
  return self->_layoutRegions;
}

- (void)setLayoutRegions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRegions, a3);
}

- (CIImage)segmentationMatteImage
{
  return self->_segmentationMatteImage;
}

- (void)setSegmentationMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationMatteImage, a3);
}

- (CIImage)segmentationConfidenceMapImage
{
  return self->_segmentationConfidenceMapImage;
}

- (void)setSegmentationConfidenceMapImage:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationConfidenceMapImage, a3);
}

- (unint64_t)segmentationClassification
{
  return self->_segmentationClassification;
}

- (void)setSegmentationClassification:(unint64_t)a3
{
  self->_segmentationClassification = a3;
}

- (PFPosterLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (float)cropScore
{
  return self->_cropScore;
}

- (void)setCropScore:(float)a3
{
  self->_cropScore = a3;
}

- (float)landscapeCropScore
{
  return self->_landscapeCropScore;
}

- (void)setLandscapeCropScore:(float)a3
{
  self->_landscapeCropScore = a3;
}

- (float)layoutScore
{
  return self->_layoutScore;
}

- (void)setLayoutScore:(float)a3
{
  self->_layoutScore = a3;
}

- (float)landscapeLayoutScore
{
  return self->_landscapeLayoutScore;
}

- (void)setLandscapeLayoutScore:(float)a3
{
  self->_landscapeLayoutScore = a3;
}

- (float)nFaces
{
  return self->_nFaces;
}

- (void)setNFaces:(float)a3
{
  self->_nFaces = a3;
}

- (float)segmentationScore
{
  return self->_segmentationScore;
}

- (void)setSegmentationScore:(float)a3
{
  self->_segmentationScore = a3;
}

- (float)localConfidenceScore
{
  return self->_localConfidenceScore;
}

- (void)setLocalConfidenceScore:(float)a3
{
  self->_localConfidenceScore = a3;
}

- (float)groundedScore
{
  return self->_groundedScore;
}

- (void)setGroundedScore:(float)a3
{
  self->_groundedScore = a3;
}

- (float)confidenceMapScore
{
  return self->_confidenceMapScore;
}

- (void)setConfidenceMapScore:(float)a3
{
  self->_confidenceMapScore = a3;
}

- (float)parallaxScore
{
  return self->_parallaxScore;
}

- (void)setParallaxScore:(float)a3
{
  self->_parallaxScore = a3;
}

- (float)mattePureBackground
{
  return self->_mattePureBackground;
}

- (void)setMattePureBackground:(float)a3
{
  self->_mattePureBackground = a3;
}

- (float)mattePureForeground
{
  return self->_mattePureForeground;
}

- (void)setMattePureForeground:(float)a3
{
  self->_mattePureForeground = a3;
}

- (float)confidencePureBackground
{
  return self->_confidencePureBackground;
}

- (void)setConfidencePureBackground:(float)a3
{
  self->_confidencePureBackground = a3;
}

- (float)confidencePureForeground
{
  return self->_confidencePureForeground;
}

- (void)setConfidencePureForeground:(float)a3
{
  self->_confidencePureForeground = a3;
}

- (BOOL)clockOverlapAcceptable
{
  return self->_clockOverlapAcceptable;
}

- (void)setClockOverlapAcceptable:(BOOL)a3
{
  self->_clockOverlapAcceptable = a3;
}

- (float)resolutionRatio
{
  return self->_resolutionRatio;
}

- (void)setResolutionRatio:(float)a3
{
  self->_resolutionRatio = a3;
}

- (float)faceSize
{
  return self->_faceSize;
}

- (void)setFaceSize:(float)a3
{
  self->_faceSize = a3;
}

- (float)faceLocalConfidence
{
  return self->_faceLocalConfidence;
}

- (void)setFaceLocalConfidence:(float)a3
{
  self->_faceLocalConfidence = a3;
}

- (BOOL)facePositionAcceptable
{
  return self->_facePositionAcceptable;
}

- (void)setFacePositionAcceptable:(BOOL)a3
{
  self->_facePositionAcceptable = a3;
}

- (BOOL)metadataClockOverlapAcceptable
{
  return self->_metadataClockOverlapAcceptable;
}

- (void)setMetadataClockOverlapAcceptable:(BOOL)a3
{
  self->_metadataClockOverlapAcceptable = a3;
}

- (BOOL)headroomIsFeasible
{
  return self->_headroomIsFeasible;
}

- (void)setHeadroomIsFeasible:(BOOL)a3
{
  self->_headroomIsFeasible = a3;
}

- (BOOL)usingHeadroom
{
  return self->_usingHeadroom;
}

- (void)setUsingHeadroom:(BOOL)a3
{
  self->_usingHeadroom = a3;
}

- (BOOL)usingLandscapeHeadroom
{
  return self->_usingLandscapeHeadroom;
}

- (void)setUsingLandscapeHeadroom:(BOOL)a3
{
  self->_usingLandscapeHeadroom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMapImage, 0);
  objc_storeStrong((id *)&self->_segmentationMatteImage, 0);
  objc_storeStrong((id *)&self->_layoutRegions, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
}

@end
