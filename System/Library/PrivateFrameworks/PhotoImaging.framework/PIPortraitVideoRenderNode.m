@implementation PIPortraitVideoRenderNode

- (PIPortraitVideoRenderNode)initWithInput:(id)a3 disparityInput:(id)a4 disparityKeyframes:(id)a5 apertureKeyframes:(id)a6 debugMode:(int64_t)a7
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  PIPortraitVideoRenderNode *v22;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0C9E1E0];
  v25[0] = *MEMORY[0x1E0C9E1F8];
  v12 = v25[0];
  v25[1] = v13;
  v26[0] = a3;
  v26[1] = a4;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, CFSTR("__dominantInputSettingsKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("debugMode"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("disparityKeyframes"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("apertureKeyframes"));

  v24.receiver = self;
  v24.super_class = (Class)PIPortraitVideoRenderNode;
  v22 = -[NURenderNode initWithSettings:inputs:](&v24, sel_initWithSettings_inputs_, v20, v19);

  return v22;
}

- (NSArray)disparityKeyframes
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("disparityKeyframes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)apertureKeyframes
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("apertureKeyframes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)debugMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("debugMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)uniqueInputNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return ((objc_msgSend(a3, "evaluationMode") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_targetScaleForScale:(id)a3
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v23 = *MEMORY[0x1E0C80C00];
  if (!NUScaleIsValid())
  {
    NUAssertLogger_2782();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(scale)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v3 = 1;
  do
  {
    v3 *= 2;
    NUScaleMake();
  }
  while (NUScaleCompare() < 1);
  v4 = NUScaleMake();
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  NSObject *v8;
  id v9;
  void *specific;
  BOOL v11;
  const void **v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v31;
  const void **v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  const char *v36;
  objc_super v37;
  objc_super v38;
  id v39;
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_2782();
    v31 = objc_claimAutoreleasedReturnValue();
    self = (PIPortraitVideoRenderNode *)"error != NULL";
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v8 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        specific = dispatch_get_specific(*v12);
        v34 = (void *)MEMORY[0x1E0CB3978];
        a5 = specific;
        objc_msgSend(v34, "callStackSymbols");
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)specific;
        v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v12;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v36 = "error != NULL";
    _NUAssertFailHandler();
LABEL_24:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_116);
    goto LABEL_4;
  }
  specific = v9;
  v39 = 0;
  v11 = -[PIPortraitVideoRenderNode _prewarmPortraitRendererWithPipelineState:error:](self, "_prewarmPortraitRendererWithPipelineState:error:", v9, &v39);
  v12 = (const void **)v39;
  if (v11)
    goto LABEL_6;
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_24;
LABEL_4:
  v13 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v12;
    _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Failed to prewarm portrait renderer: %{public}@", buf, 0xCu);
  }
LABEL_6:
  if (objc_msgSend(specific, "evaluationMode", v36) == 1 || objc_msgSend(specific, "evaluationMode") == 3)
  {
    v14 = objc_msgSend(specific, "scale");
    v16 = -[PIPortraitVideoRenderNode _targetScaleForScale:](self, "_targetScaleForScale:", v14, v15);
    v18 = v17;
    v19 = (void *)objc_msgSend(specific, "copy");
    objc_msgSend(v19, "setScale:", v16, v18);
    v38.receiver = self;
    v38.super_class = (Class)PIPortraitVideoRenderNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v38, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v19, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(specific, "scale");
      v22 = NUScaleDivide();
      v24 = v23;
      if (NUScaleEqual())
      {
        v25 = v21;
      }
      else
      {
        v26 = objc_alloc(MEMORY[0x1E0D522B8]);
        v27 = objc_msgSend(specific, "scale");
        v29 = (void *)objc_msgSend(v26, "initWithTargetScale:effectiveScale:sampleMode:input:", v27, v28, v22, v24, objc_msgSend(specific, "sampleMode"), v21);
        objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v29, v8);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setEvaluatedForMode:", objc_msgSend(specific, "evaluationMode"));
      }

    }
    else
    {

      v25 = 0;
    }
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)PIPortraitVideoRenderNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v37, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, specific, a5);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (BOOL)_prewarmPortraitRendererWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v35;
  const void **v36;
  const void **v37;
  void *specific;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  NSObject *v42;
  const void **v43;
  void *v44;
  int v45;
  void *v46;
  const void **v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  void *v60;
  char v61[32];
  uint8_t buf[4];
  const void **v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_2782();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "state != nil");
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v40)
      {
        v48 = dispatch_get_specific(*v37);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v37 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = (const void **)v48;
        v64 = 2114;
        v65 = v51;
        _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v37;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v45 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!a4)
  {
    NUAssertLogger_2782();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v43 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v43;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = (const void **)MEMORY[0x1E0D51D48];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v39 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (!v44)
    {
      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v47;
        _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_31;
    }
LABEL_29:
    if (v45)
    {
      v52 = dispatch_get_specific(*v37);
      v53 = (void *)MEMORY[0x1E0CB3978];
      v54 = v52;
      objc_msgSend(v53, "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = (const void **)v52;
      v64 = 2114;
      v65 = v56;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_31:

    _NUAssertFailHandler();
  }
  v7 = v6;
  -[NURenderNode inputs](self, "inputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputImageGeometry:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NURenderNode inputs](self, "inputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputImageGeometry:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_msgSend(v7, "scale");
      v16 = -[PIPortraitVideoRenderNode _targetScaleForScale:](self, "_targetScaleForScale:", v14, v15);
      v18 = v17;
      v19 = objc_alloc(MEMORY[0x1E0D52170]);
      objc_msgSend(v10, "extent");
      v20 = (void *)objc_msgSend(v19, "initWithExtent:renderScale:orientation:", v61, v16, v18, objc_msgSend(v10, "orientation"));
      objc_msgSend(v7, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;

      if (v21)
      {
        v59 = -[PIPortraitVideoRenderNode _portraitQualityForRenderScale:](self, "_portraitQualityForRenderScale:", v16, v18);
        objc_msgSend(v7, "device");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "metalDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "scaledSize");
        v57 = v25;
        v58 = v24;
        v26 = v20;
        v27 = objc_msgSend(v13, "scaledSize");
        v29 = v28;
        v30 = -[PIPortraitVideoRenderNode debugMode](self, "debugMode");
        if ((unint64_t)(v30 - 2) >= 4)
          v31 = 0;
        else
          v31 = v30 - 1;
        -[PIPortraitVideoRenderNode globalMetadata](self, "globalMetadata");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v27;
        v20 = v26;
        +[PIPortraitVideoRenderer prewarmRendererForDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:](PIPortraitVideoRenderer, "prewarmRendererForDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:", v23, v58, v57, v33, v29, v59, v31, v32);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("No device specified for prewarm"), 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  void *v6;
  const void **v11;
  id v12;
  id v13;
  void *specific;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  PIPortraitVideoMetadataSample *v35;
  void *v36;
  PIPortraitVideoMetadataSample *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  CFDictionaryRef v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const void **v52;
  NSObject *v53;
  const void **v54;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  unsigned int v58;
  PIPortraitVideoMetadataSample *v59;
  id v60;
  PIPortraitVideoRenderNode *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;
  CMTime time;
  _QWORD v67[3];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  const void **v74;
  __int16 v75;
  id *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v11 = (const void **)a3;
  v12 = a4;
  v13 = a5;
  if (!a6)
  {
    NUAssertLogger_2782();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v54 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v54;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        specific = dispatch_get_specific(*v11);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v12 = specific;
        objc_msgSend(v57, "callStackSymbols");
        v11 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        a6 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = (const void **)specific;
        v75 = 2114;
        v76 = a6;
        _os_log_error_impl(&dword_1A6382000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v11;
      _os_log_error_impl(&dword_1A6382000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_58:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_116);
    goto LABEL_16;
  }
  specific = v13;
  -[NURenderNode videoProperties:](self, "videoProperties:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v15)
  {
    v61 = self;
    v62 = v12;
    v63 = v15;
    v64 = specific;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v15, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v69;
      v20 = *MEMORY[0x1E0D7F5F8];
LABEL_5:
      v21 = v11;
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v19)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v22);
        objc_msgSend(v23, "key");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqual:", v20);

        if ((v25 & 1) != 0)
          break;
        if (v18 == ++v22)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
          v11 = v21;
          if (v18)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v26 = v23;

      if (!v26)
      {
        v27 = 0;
        v11 = v21;
        goto LABEL_20;
      }
      v28 = (void *)MEMORY[0x1E0D7F560];
      objc_msgSend(v26, "value");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "deserializeMetadataWithType:fromGlobalMetadata:error:", 2, v29, a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v21;
      if (v27)
        goto LABEL_20;
      v30 = 0;
      v12 = v62;
      specific = v64;
      goto LABEL_46;
    }
LABEL_11:

    v26 = 0;
    v27 = 0;
LABEL_20:
    specific = v64;
    objc_msgSend(v64, "videoMetadataSamples");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("portraitVideoMetadata"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
LABEL_21:
      objc_msgSend(v33, "metadataGroup");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v62;
      if (v34)
      {
        v35 = [PIPortraitVideoMetadataSample alloc];
        objc_msgSend(v33, "metadataGroup");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[PIPortraitVideoMetadataSample initWithMetadataGroup:majorVersion:minorVersion:error:](v35, "initWithMetadataGroup:majorVersion:minorVersion:error:", v36, objc_msgSend(v27, "majorVersion"), objc_msgSend(v27, "minorVersion"), a6);

        if (v37)
        {
          v60 = v26;
          v38 = v64;
          objc_msgSend(v64, "scale");
          if (NUScaleEqual()
            && objc_msgSend(v64, "evaluationMode") == 3
            && objc_msgSend(v27, "renderingVersion") >= 2)
          {
            +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "cinematicAllowYUVSourceInput");

            if (v40)
            {
              if (resolvedNodeWithCachedInputs_settings_pipelineState_error__once != -1)
                dispatch_once(&resolvedNodeWithCachedInputs_settings_pipelineState_error__once, &__block_literal_global_2832);
              v58 = 1;
            }
            else
            {
              v58 = 0;
            }
            v38 = v64;
          }
          else
          {
            v58 = 0;
          }
          v42 = (void *)objc_msgSend(v62, "mutableCopy");
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v27, CFSTR("globalMetadata"));
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v37, CFSTR("timedMetadata"));
          v59 = v37;
          if (v38)
            objc_msgSend(v38, "time");
          else
            memset(&time, 0, sizeof(time));
          v43 = CMTimeCopyAsDictionary(&time, 0);
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("renderTime"));

          v44 = (void *)MEMORY[0x1E0CB37E8];
          v45 = objc_msgSend(v38, "scale");
          objc_msgSend(v44, "numberWithInt:", -[PIPortraitVideoRenderNode _portraitQualityForRenderScale:](v61, "_portraitQualityForRenderScale:", v45, v46));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, CFSTR("renderQuality"));

          objc_msgSend(v63, "colorProperties");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AF40]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v49, CFSTR("sourceTransferFunction"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, CFSTR("useSourceBuffersDirectly"));

          v65.receiver = v61;
          v65.super_class = (Class)PIPortraitVideoRenderNode;
          -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v65, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v11, v42, v38, a6);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          specific = v38;
          v37 = v59;
          v26 = v60;
        }
        else
        {
          v30 = 0;
          specific = v64;
        }

        goto LABEL_45;
      }
LABEL_44:
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("PIPortraitVideoRenderNode: expected a valid portraitVideoMetadata sample"), v33);
      v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

LABEL_46:
      v6 = v63;
      goto LABEL_47;
    }
    if (objc_msgSend(v64, "evaluationMode") == 1)
    {
      +[PIPortraitVideoMetadataSample renderingMetadataIdentifier](PIPortraitVideoMetadataSample, "renderingMetadataIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
        objc_msgSend(v64, "time");
      else
        memset(v67, 0, sizeof(v67));
      -[NURenderNode outputTimedMetadataSampleWithIdentifier:atTime:error:](v61, "outputTimedMetadataSampleWithIdentifier:atTime:error:", v41, v67, a6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_21;
    }
    else
    {
      v33 = 0;
    }
    v12 = v62;
    goto LABEL_44;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_58;
LABEL_16:
  v31 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v52 = (const void **)*a6;
    *(_DWORD *)buf = 138543362;
    v74 = v52;
    _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Failed to obtain video properties: %{public}@", buf, 0xCu);
  }
  v30 = 0;
LABEL_47:

  return v30;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  void *v4;
  const __CFDictionary *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("renderTime"));
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    CMTimeMakeFromDictionary(&v7, v5);
    *(CMTime *)retstr = v7;
  }

  return result;
}

- (int)renderQuality
{
  void *v2;
  void *v3;
  int v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("renderQuality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (PTGlobalRenderingMetadata)globalMetadata
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("globalMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PTGlobalRenderingMetadata *)v3;
}

- (PIPortraitVideoMetadataSample)timedMetadata
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timedMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PIPortraitVideoMetadataSample *)v3;
}

- (id)sourceTransferFunction
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sourceTransferFunction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)useSourceBuffersDirectly
{
  void *v2;
  void *v3;
  char v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("useSourceBuffersDirectly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)_portraitQualityForRenderScale:(id)a3
{
  NUScaleMake();
  if (NUScaleCompare() < 1)
    return 24;
  NUScaleMake();
  if (NUScaleCompare() >= 1)
    return 75;
  else
    return 26;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (__CVBuffer)_sourceBufferFromInput:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;

  v5 = a3;
  v6 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v5, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      objc_msgSend(v5, "inputForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "inputForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
    }
    while (v9);
  }
  else
  {
    v8 = v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (__CVBuffer *)objc_msgSend(v8, "pixelBuffer");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Source image isn't backed by a CVPixelBuffer"), v8);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  double *v20;
  double v21;
  void *v22;
  void *v23;
  double *v24;
  double v25;
  PIPortraitVideoFilter *v26;
  void *v27;
  void *v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  __CVBuffer *v32;
  void *v33;
  __CVBuffer *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  const void **v39;
  void *specific;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  uint64_t v56;
  id v57;
  id v58;
  uint8_t buf[24];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2782();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v39 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2782();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v45 = dispatch_get_specific(*v39);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v44;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v5, "outputImage:", &v58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v58;
  if (v6)
  {
    -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1E0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v8, "outputImage:", &v57);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v57;

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the disparityImage"), self, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v6;
LABEL_39:

      goto LABEL_40;
    }
    -[PIPortraitVideoRenderNode globalMetadata](self, "globalMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoRenderNode timedMetadata](self, "timedMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Could not get the timed metadata"), self);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

      goto LABEL_39;
    }
    -[PIPortraitVideoRenderNode sourceTransferFunction](self, "sourceTransferFunction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1E0D520A0];
      v16 = CFSTR("Could not get the source transfer function");
      goto LABEL_12;
    }
    v51 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C8AF48]);
    memset(buf, 0, sizeof(buf));
    -[PIPortraitVideoRenderNode renderTime](self, "renderTime");
    if ((buf[12] & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0D520A0];
      v16 = CFSTR("Could not get the render time");
LABEL_12:
      objc_msgSend(v15, "missingError:object:", v16, self);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      goto LABEL_38;
    }
    v53 = v11;
    -[PIPortraitVideoRenderNode disparityKeyframes](self, "disparityKeyframes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = v14;
    if (v18)
    {
      -[PIPortraitVideoRenderNode disparityKeyframes](self, "disparityKeyframes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *(_OWORD *)buf;
      v56 = *(_QWORD *)&buf[16];
      +[PIScalarKeyframe keyframeInArray:closestToTime:](PIScalarKeyframe, "keyframeInArray:closestToTime:", v19, &v55);
      v20 = (double *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = v20[1];
      else
        v21 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v54;
    }
    else
    {
      v52 = 0;
    }
    -[PIPortraitVideoRenderNode apertureKeyframes](self, "apertureKeyframes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[PIPortraitVideoRenderNode apertureKeyframes](self, "apertureKeyframes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *(_OWORD *)buf;
      v56 = *(_QWORD *)&buf[16];
      +[PIScalarKeyframe keyframeInArray:closestToTime:](PIScalarKeyframe, "keyframeInArray:closestToTime:", v23, &v55);
      v24 = (double *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v25 = v24[1];
      else
        v25 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v54;
    }
    else
    {
      v50 = 0;
    }
    if (-[PIPortraitVideoRenderNode debugMode](self, "debugMode") == 1)
    {
      objc_msgSend(v9, "imageByCompositingOverImage:", v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
      v11 = v53;

      goto LABEL_37;
    }
    v26 = objc_alloc_init(PIPortraitVideoFilter);
    -[PIPortraitVideoFilter setInputGlobalRenderingMetadata:](v26, "setInputGlobalRenderingMetadata:", v53);
    -[PIPortraitVideoFilter setInputTimedRenderingMetadata:](v26, "setInputTimedRenderingMetadata:", v12);
    -[PIPortraitVideoFilter setInputImage:](v26, "setInputImage:", v6);
    -[PIPortraitVideoFilter setInputDisparityImage:](v26, "setInputDisparityImage:", v9);
    -[PIPortraitVideoFilter setInputAperture:](v26, "setInputAperture:", v50);
    -[PIPortraitVideoFilter setInputFocusedDisparity:](v26, "setInputFocusedDisparity:", v52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PIPortraitVideoRenderNode renderQuality](self, "renderQuality"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoFilter setInputRenderQuality:](v26, "setInputRenderQuality:", v27);

    v28 = (void *)MEMORY[0x1E0CB37E8];
    v29 = -[PIPortraitVideoRenderNode debugMode](self, "debugMode");
    if ((unint64_t)(v29 - 2) >= 4)
      v30 = 0;
    else
      v30 = v29 - 1;
    objc_msgSend(v28, "numberWithInteger:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoFilter setInputRenderDebugMode:](v26, "setInputRenderDebugMode:", v31);

    v14 = v54;
    -[PIPortraitVideoFilter setInputIsHDR:](v26, "setInputIsHDR:", v51);
    if (-[PIPortraitVideoRenderNode useSourceBuffersDirectly](self, "useSourceBuffersDirectly"))
    {
      -[PIPortraitVideoFilter setInputImage:](v26, "setInputImage:", 0);
      -[PIPortraitVideoFilter setInputDisparityImage:](v26, "setInputDisparityImage:", 0);
      v32 = -[PIPortraitVideoRenderNode _sourceBufferFromInput:error:](self, "_sourceBufferFromInput:error:", v5, a3);
      if (!v32)
      {
        v17 = 0;
        goto LABEL_35;
      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", v32);
      -[PIPortraitVideoFilter setInputColorPixelBuffer:](v26, "setInputColorPixelBuffer:", v33);

      v34 = -[PIPortraitVideoRenderNode _sourceBufferFromInput:error:](self, "_sourceBufferFromInput:error:", v8, a3);
      if (!v34)
      {
        v17 = 0;
        v14 = v54;
        goto LABEL_35;
      }
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", v34);
      -[PIPortraitVideoFilter setInputDisparityPixelBuffer:](v26, "setInputDisparityPixelBuffer:", v35);

      v14 = v54;
    }
    -[PIPortraitVideoFilter outputImage](v26, "outputImage");
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input image"), self, v7);
  v17 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
LABEL_40:

  return v17;
}

void __87__PIPortraitVideoRenderNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke()
{
  NSLog(CFSTR("PIPortrait: passing YUV source buffers directly to the cinematic renderer"));
}

@end
