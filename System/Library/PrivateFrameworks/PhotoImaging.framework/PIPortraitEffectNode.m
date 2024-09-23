@implementation PIPortraitEffectNode

- (PIPortraitEffectNode)initWithSettings:(id)a3 inputs:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  void *specific;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v9 = (os_log_t *)MEMORY[0x1E0D52380];
    v10 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v17 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
LABEL_7:
        v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E0CB3978];
          v20 = v18;
          objc_msgSend(v19, "callStackSymbols");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v25 = (void *)MEMORY[0x1E0CB3978];
      v26 = specific;
      v20 = v23;
      objc_msgSend(v25, "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
  }
}

- (PIPortraitEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  PIPortraitEffectNode *v17;
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
  objc_super v32;
  const __CFString *v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_12040();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
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
        v38 = v27;
        v39 = 2114;
        v40 = v31;
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
      v38 = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v11 = v10;
  if (v9)
  {
    v35[0] = CFSTR("inputImage");
    v35[1] = CFSTR("inputBlurMap");
    v36[0] = v8;
    v36[1] = v9;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (id *)v36;
    v14 = (const __CFString **)v35;
    v15 = 2;
  }
  else
  {
    v33 = CFSTR("inputImage");
    v34 = v8;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v34;
    v14 = &v33;
    v15 = 1;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)PIPortraitEffectNode;
  v17 = -[NURenderNode initWithSettings:inputs:](&v32, sel_initWithSettings_inputs_, v11, v16);

  return v17;
}

- (int64_t)portraitVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(&unk_1E5058DD0, "containsObject:", v3))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (BOOL)isPortraitMono
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isPortraitMonoEffect:", v5);

  return (char)v3;
}

- (BOOL)isPortraitStage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isPortraitStageEffect:", v5);

  return (char)v3;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIPortraitEffectNode;
  v5 = -[PIPortraitNode canPropagateOriginalAuxiliaryData:](&v7, sel_canPropagateOriginalAuxiliaryData_);
  if (a3 == 7 && v5)
    LOBYTE(v5) = !-[PIPortraitEffectNode isPortraitStage](self, "isPortraitStage");
  return v5;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  const void **v114;
  void *specific;
  NSObject *v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  uint8_t buf[4];
  void *v155;
  __int16 v156;
  void *v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12040();
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v155 = v113;
      _os_log_error_impl(&dword_1A6382000, v112, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v114 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v116 = objc_claimAutoreleasedReturnValue();
    v117 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v117)
      {
        v120 = dispatch_get_specific(*v114);
        v121 = (void *)MEMORY[0x1E0CB3978];
        v122 = v120;
        objc_msgSend(v121, "callStackSymbols");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "componentsJoinedByString:", CFSTR("\n"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v155 = v120;
        v156 = 2114;
        v157 = v124;
        _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v117)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v155 = v119;
      _os_log_error_impl(&dword_1A6382000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1)
  {
    if (objc_msgSend(v10, "auxiliaryImageType") == 1 || objc_msgSend(v10, "auxiliaryImageType") == 7)
    {
      -[PIPortraitNode input](self, "input");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageProperties:", a5);
      v12 = objc_claimAutoreleasedReturnValue();

      v144 = (void *)v12;
      if (!v12)
      {
        v27 = 0;
LABEL_84:

        goto LABEL_85;
      }
      -[PIPortraitNode input](self, "input");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v27 = 0;
LABEL_83:

        goto LABEL_84;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderNode settings](self, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("portraitInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("faceLandmarks"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("inputFaceLandmarkArray"));

      v140 = v17;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("faceLandmarks"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v142 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v141 = v15;
      if (v21)
      {
        v143 = 0;
        if (v20)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 3);
          objc_msgSend(v144, "size");
          objc_msgSend(v21, "size");
          v23 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v23, v24);
          -[PIPortraitNode input](self, "input");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = 0;
          objc_msgSend(v25, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v153);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v153;

          v143 = v26;
          if (!v22)
          {
            v34 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v34;
            v22 = (void *)v35;
            objc_msgSend(v36, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain portrait matte aux image"), v35, v26);
            v27 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v15 = v141;
            goto LABEL_82;
          }
          v15 = v141;
        }
      }
      else
      {
        v143 = 0;
      }
      if (objc_msgSend(v10, "auxiliaryImageType") == 7)
      {
        if (-[PIPortraitEffectNode isPortraitMono](self, "isPortraitMono"))
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Gain map is disabled"), self);
          v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

          goto LABEL_83;
        }
        if (-[PIPortraitEffectNode isPortraitStage](self, "isPortraitStage"))
        {
          objc_msgSend(v144, "flexRangeProperties");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = v22;
          if (v33)
          {

LABEL_49:
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v14, CFSTR("inputGainMap"));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v138, CFSTR("inputMatte"));
            v67 = v15;
            v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", CFSTR("NUGainMapClearFilter"), &unk_1E5059250, v66);
            objc_msgSend(v68, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v66, v8, v10, a5);
            v27 = (id)objc_claimAutoreleasedReturnValue();

            v15 = v67;
            v22 = v138;
            goto LABEL_82;
          }
          objc_msgSend(v144, "meteorPlusGainMapVersion");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "major");

          v65 = v64 < 2;
          v22 = v138;
          if (!v65)
            goto LABEL_49;
        }
        v27 = v14;
        goto LABEL_82;
      }
      v134 = v14;
      -[PIPortraitNode blurMap](self, "blurMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[PIPortraitNode blurMap](self, "blurMap");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = 0;
        objc_msgSend(v30, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, &v152);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v152;

        v135 = (void *)v31;
        if (!v31)
        {
          v61 = (void *)MEMORY[0x1E0D520A0];
          -[PIPortraitNode blurMap](self, "blurMap");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain portrait blur map"));
          v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v143 = v32;
          v14 = v134;
          v15 = v141;

          goto LABEL_82;
        }
        v143 = v32;
      }
      else
      {
        v135 = 0;
      }
      v139 = v22;
      v130 = -[PIPortraitEffectNode portraitVersion](self, "portraitVersion");
      -[NURenderNode settings](self, "settings");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("kind"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v141;
      v132 = v38;
      if (v38)
      {
        objc_msgSend(v142, "setAuxiliaryImageType:", 2);
        objc_msgSend(v144, "size");
        objc_msgSend(v38, "size");
        v39 = NUScaleToFillSizeInSize();
        objc_msgSend(v142, "setScale:", v39, v40);
        -[PIPortraitNode input](self, "input");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = 0;
        objc_msgSend(v41, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v151);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v151;

        v143 = v42;
      }
      else
      {
        v137 = 0;
      }
      v43 = v131;
      if ((objc_msgSend(v131, "isEqualToString:", CFSTR("Black")) & 1) != 0)
        v44 = 1;
      else
        v44 = objc_msgSend(v131, "isEqualToString:", CFSTR("BlackoutMono"));
      if (!v137 && v44)
      {
        v45 = (void *)MEMORY[0x1E0D520A0];
        -[PIPortraitNode input](self, "input");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain disparity aux image"), v46, v143);
        v27 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v47 = v132;
        v14 = v134;
LABEL_81:

        v21 = v47;
        goto LABEL_82;
      }
      if (v130 == 2 && v20)
      {
        objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 4);
          objc_msgSend(v144, "size");
          objc_msgSend(v47, "size");
          v48 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v48, v49);
          -[PIPortraitNode input](self, "input");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = 0;
          objc_msgSend(v50, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v150);
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = v150;

          if (!v51)
          {
            v107 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain skin matte aux image"), v46, v52);
            v27 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v143 = v52;
            v14 = v134;
            goto LABEL_80;
          }
          v143 = v52;
        }
        else
        {
          v51 = 0;
        }
        objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 5);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v129 = (void *)v51;
        v133 = v90;
        if (v90)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 5);
          objc_msgSend(v144, "size");
          objc_msgSend(v90, "size");
          v91 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v91, v92);
          -[PIPortraitNode input](self, "input");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = 0;
          objc_msgSend(v93, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v149);
          v94 = objc_claimAutoreleasedReturnValue();
          v95 = v149;

          v128 = (void *)v94;
          if (!v94)
          {
            v108 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain hair matte aux image"), v109, v95);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            v27 = 0;
            v143 = v95;
            v47 = v90;
            v14 = v134;
            v22 = v139;
            v46 = v129;
            v43 = v131;
            goto LABEL_81;
          }
          v143 = v95;
        }
        else
        {
          v128 = 0;
        }
        v43 = v131;
        objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 6);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 6);
          objc_msgSend(v144, "size");
          objc_msgSend(v47, "size");
          v99 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v99, v100);
          -[PIPortraitNode input](self, "input");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = 0;
          objc_msgSend(v101, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v148);
          v102 = objc_claimAutoreleasedReturnValue();
          v103 = v148;

          v127 = (void *)v102;
          if (!v102)
          {
            v110 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain teeth matte aux image"), v111, v103);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            v27 = 0;
            v143 = v103;
            v14 = v134;
            v22 = v139;
            v46 = v129;
            goto LABEL_81;
          }
          v132 = v47;
          v143 = v103;
        }
        else
        {
          v127 = 0;
          v132 = 0;
        }
      }
      else
      {
        v127 = 0;
        v128 = 0;
        v129 = 0;
      }
      -[NURenderNode settings](self, "settings");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("glassesMatteAllowed"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "BOOLValue");

      if (v55)
      {
        objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 8);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 8);
          objc_msgSend(v144, "size");
          objc_msgSend(v47, "size");
          v56 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v56, v57);
          -[PIPortraitNode input](self, "input");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = 0;
          objc_msgSend(v58, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v147);
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v147;

          if (!v59)
          {
            v96 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain glasses matte aux image"));
            v27 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v143 = v60;
            v14 = v134;
            v46 = v129;
LABEL_79:

LABEL_80:
            v22 = v139;
            goto LABEL_81;
          }
          v143 = v60;
        }
        else
        {
          v59 = 0;
        }
        v126 = (void *)v59;
        objc_msgSend(v144, "auxiliaryImagePropertiesForType:", 7);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69)
        {
          objc_msgSend(v142, "setAuxiliaryImageType:", 7);
          objc_msgSend(v144, "size");
          v132 = v69;
          objc_msgSend(v69, "size");
          v70 = NUScaleToFillSizeInSize();
          objc_msgSend(v142, "setScale:", v70, v71);
          -[PIPortraitNode input](self, "input");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = 0;
          objc_msgSend(v72, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v142, &v146);
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = v146;

          if (!v73)
          {
            v105 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain gain map aux image"), v106, v74);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            v27 = 0;
            v143 = v74;
            v47 = v69;
            v14 = v134;
            v46 = v129;
            v43 = v131;
            goto LABEL_79;
          }
          v125 = (void *)v73;
          v143 = v74;
        }
        else
        {
          v125 = 0;
          v132 = 0;
        }
        v62 = v134;
        v43 = v131;
      }
      else
      {
        v125 = 0;
        v126 = 0;
        v62 = v134;
      }
      v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v75, "setObject:forKeyedSubscript:", v62, CFSTR("inputImage"));
      v76 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "scale");
      NUScaleToDouble();
      objc_msgSend(v76, "numberWithDouble:");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setObject:forKeyedSubscript:", v77, CFSTR("inputScale"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v130);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setObject:forKeyedSubscript:", v78, CFSTR("inputVersion"));

      objc_msgSend(v141, "setObject:forKeyedSubscript:", v43, CFSTR("inputKind"));
      if (v130 == 2)
      {
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v137, CFSTR("inputDisparity"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v135, CFSTR("inputBlurMap"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v139, CFSTR("inputMatte"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v129, CFSTR("inputFaceMask"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v128, CFSTR("inputHairMask"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v127, CFSTR("inputTeethMask"));
        -[NURenderNode settings](self, "settings");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("spillMatteAllowed"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "BOOLValue");

        if (v81)
          objc_msgSend(v141, "setObject:forKeyedSubscript:", &unk_1E5051DA8, CFSTR("inputGenerateSpillMatte"));
        -[NURenderNode settings](self, "settings");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("strength"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v141;
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v83, CFSTR("inputStrength"));

        -[NURenderNode settings](self, "settings");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("disablePortraitMixing"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v85, CFSTR("inputOneShot"));

      }
      else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Black")) & 1) != 0
             || objc_msgSend(v43, "isEqualToString:", CFSTR("BlackoutMono")))
      {
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v137, CFSTR("inputDisparity"));
        v86 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v86, "setScale:", *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8));
        -[PIPortraitNode input](self, "input");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = 0;
        objc_msgSend(v87, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v86, &v145);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v145;

        if (!v88)
        {
          v97 = (void *)MEMORY[0x1E0D520A0];
          -[PIPortraitNode input](self, "input");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain full-size input image"), v98, v89);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v27 = 0;
          v14 = v134;
          v15 = v141;
LABEL_78:

          v46 = v129;
          v47 = v132;
          goto LABEL_79;
        }
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v88, CFSTR("inputFullSizeImage"));
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v139, CFSTR("inputMatte"));

        v15 = v141;
      }
      else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("Light")) & 1) == 0)
      {
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v135, CFSTR("inputBlurMap"));
      }
      v89 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", CFSTR("PIPortraitEffectFilter"), v15, v75);
      objc_msgSend(v89, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v75, v8, v10, a5);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v134;
      goto LABEL_78;
    }
    -[PIPortraitNode input](self, "input");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Portrait Effect only applies to images"), 0);
    v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_85:

  return v27;
}

@end
