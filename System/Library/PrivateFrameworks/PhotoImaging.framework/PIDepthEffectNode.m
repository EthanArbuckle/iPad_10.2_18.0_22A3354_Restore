@implementation PIDepthEffectNode

- (PIDepthEffectNode)initWithSettings:(id)a3 inputs:(id)a4
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

- (PIDepthEffectNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PIDepthEffectNode *v13;
  NSObject *v15;
  const void **v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  const void **v23;
  void *v24;
  int v25;
  void *v26;
  const void **v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_12040();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v28 = dispatch_get_specific(*v17);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v28;
        v42 = 2114;
        v43 = v31;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v17;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    NUAssertLogger_12040();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "blurMap != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v25)
    {
      v32 = dispatch_get_specific(*v17);
      v33 = (void *)MEMORY[0x1E0CB3978];
      v34 = v32;
      objc_msgSend(v33, "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v32;
      v42 = 2114;
      v43 = v36;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v11 = v10;
  v38[0] = CFSTR("inputImage");
  v38[1] = CFSTR("inputBlurMap");
  v39[0] = v8;
  v39[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)PIDepthEffectNode;
  v13 = -[NURenderNode initWithSettings:inputs:](&v37, sel_initWithSettings_inputs_, v11, v12);

  return v13;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  BOOL result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PIDepthEffectNode;
  result = -[PIPortraitNode canPropagateOriginalAuxiliaryData:](&v5, sel_canPropagateOriginalAuxiliaryData_);
  if (a3 == 7)
    return 0;
  return result;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v62;
  void *v63;
  const void **v64;
  void *specific;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12040();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v89 = v63;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v64 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v67)
      {
        v70 = dispatch_get_specific(*v64);
        v71 = (void *)MEMORY[0x1E0CB3978];
        v72 = v70;
        objc_msgSend(v71, "callStackSymbols");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v70;
        v90 = 2114;
        v91 = v74;
        _os_log_error_impl(&dword_1A6382000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v89 = v69;
      _os_log_error_impl(&dword_1A6382000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1)
  {
    -[PIPortraitNode input](self, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProperties:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "flexRangeProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = 1;
      }
      else
      {
        objc_msgSend(v12, "meteorPlusGainMapVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v16, "major") > 1;

      }
      if (objc_msgSend(v10, "auxiliaryImageType") == 1
        || (objc_msgSend(v10, "auxiliaryImageType") == 7 ? (v17 = v14) : (v17 = 0), v17))
      {
        -[PIPortraitNode input](self, "input");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v15 = 0;
LABEL_41:

          goto LABEL_42;
        }
        v81 = v14;
        v20 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v20, "setAuxiliaryImageType:", 1);
        -[PIPortraitNode blurMap](self, "blurMap");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0;
        objc_msgSend(v21, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v20, &v87);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v87;

        if (!v22)
        {
          v32 = (void *)MEMORY[0x1E0D520A0];
          -[PIPortraitNode blurMap](self, "blurMap");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v32;
          v35 = (void *)v33;
          objc_msgSend(v34, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate blur map"), v33, v23);
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

          goto LABEL_41;
        }
        v83 = v22;
        v84 = v23;
        objc_msgSend(v12, "auxiliaryImagePropertiesForType:", 7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v20;
        if (v24)
        {
          objc_msgSend(v20, "setAuxiliaryImageType:", 7);
          objc_msgSend(v12, "size");
          objc_msgSend(v24, "size");
          v25 = NUScaleToFillSizeInSize();
          objc_msgSend(v20, "setScale:", v25, v26);
          -[PIPortraitNode input](self, "input");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = 0;
          objc_msgSend(v27, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v20, &v86);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v86;

          if (!v28)
          {
            v57 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate gain map"), v58, v29);
            v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v59 = v24;
            v23 = v29;
            v35 = v59;
            v22 = v83;
LABEL_39:

            v20 = v82;
            goto LABEL_40;
          }
          v84 = v29;
          v30 = v28;
        }
        else
        {
          v30 = 0;
        }
        v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v19, CFSTR("inputImage"));
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v83, CFSTR("inputBlurMap"));
        v79 = (void *)v30;
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, CFSTR("inputGainMap"));
        objc_msgSend(v12, "auxiliaryImagePropertiesForType:", 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = v37;
        if (v37)
        {
          objc_msgSend(v82, "setAuxiliaryImageType:", 3);
          objc_msgSend(v12, "size");
          objc_msgSend(v37, "size");
          v38 = NUScaleToFillSizeInSize();
          objc_msgSend(v82, "setScale:", v38, v39);
          -[PIPortraitNode input](self, "input");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = 0;
          objc_msgSend(v40, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v82, &v85);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v85;

          if (!v37)
          {
            v60 = (void *)MEMORY[0x1E0D520A0];
            -[PIPortraitNode input](self, "input");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate portrait effect matte"), v56, v41);
            v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v23 = v41;
LABEL_38:

            v22 = v83;
            v35 = v78;
            v58 = v79;
            goto LABEL_39;
          }
          v77 = v19;
          v84 = v41;
        }
        else
        {
          v77 = v19;
        }
        v76 = v37;
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("inputMatte"));
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NURenderNode settings](self, "settings");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("depthInfo"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = v44;
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("lumaNoiseScale"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("inputLumaNoiseScale"));

        v46 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "scale");
        NUScaleToDouble();
        objc_msgSend(v46, "numberWithDouble:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, CFSTR("inputScale"));

        objc_msgSend(v12, "auxiliaryImagePropertiesForType:", 2);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v75, "auxiliaryDataInfoMetadata"), CFSTR("inputDepthMetadata"));
        objc_msgSend(v12, "auxiliaryImagePropertiesForType:", 7);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v48, "auxiliaryDataInfoMetadata"), CFSTR("inputGainMapMetadata"));
        objc_msgSend(v48, "auxiliaryImageTypeCGIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0CBC718]);

        if ((_DWORD)v44)
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("inputGainMapIsLinear"));
          objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(v48, "compatibilityMetadata"), CFSTR("inputGainMapMetadata"));
        }
        objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("shape"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, CFSTR("inputShape"));

        -[NURenderNode settings](self, "settings");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("aperture"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v52, CFSTR("inputAperture"));

        -[NURenderNode settings](self, "settings");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54 && (objc_msgSend((id)objc_opt_class(), "isPortraitStageEffect:", v54) & 1) != 0
          || objc_msgSend(v10, "auxiliaryImageType") == 7)
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("inputBestHairQuality"));
        }
        if (v81)
          objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E5051490, CFSTR("__gainMapMode"));
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", CFSTR("PIDepthEffectFilter"), v42, v36);
        objc_msgSend(v55, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v36, v8, v10, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v76;
        v19 = v77;
        v23 = v84;
        goto LABEL_38;
      }
      -[PIPortraitNode input](self, "input");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Depth Effect only applies to images"), 0);
  v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v15;
}

@end
