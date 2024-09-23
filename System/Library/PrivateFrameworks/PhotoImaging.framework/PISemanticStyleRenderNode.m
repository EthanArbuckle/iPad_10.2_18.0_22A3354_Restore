@implementation PISemanticStyleRenderNode

- (PISemanticStyleRenderNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
  }
}

- (PISemanticStyleRenderNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PISemanticStyleRenderNode *v10;
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
  objc_super v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_7964();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
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
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v26 = *MEMORY[0x1E0C9E1F8];
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)PISemanticStyleRenderNode;
  v10 = -[NURenderNode initWithSettings:inputs:](&v25, sel_initWithSettings_inputs_, v8, v9);

  return v10;
}

- (NURenderNode)input
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNode *)v3;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  PISemanticStyleRenderNode *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  objc_super v84;
  objc_super v85;
  uint8_t buf[4];
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "evaluationMode"))
  {
    v85.receiver = self;
    v85.super_class = (Class)PISemanticStyleRenderNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v85, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "auxiliaryImageType") != 1)
  {
    -[PISemanticStyleRenderNode input](self, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

    goto LABEL_44;
  }
  if (objc_msgSend(v9, "evaluationMode") != 2)
  {
    -[PISemanticStyleRenderNode input](self, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PISemanticStyleRenderNode input](self, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageProperties:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "auxiliaryImagePropertiesForType:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v15;
    if (v15)
    {
      v16 = objc_msgSend(v15, "size");
      v18 = v17;
    }
    else
    {
      v18 = 96;
      v16 = 128;
    }
    v19 = objc_alloc(MEMORY[0x1E0D52218]);
    v20 = v18 <= 192 || v16 <= 256;
    v21 = v16 * v18;
    if (v20)
      v22 = 49152;
    else
      v22 = v21;
    v23 = (void *)objc_msgSend(v19, "initWithTargetPixelCount:", v22);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", v21);
    -[PISemanticStyleRenderNode input](self, "input");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputImageGeometry:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v26;
    if (!v26)
    {
      v10 = 0;
      v11 = v12;
LABEL_42:

      goto LABEL_43;
    }
    v76 = v14;
    v27 = objc_msgSend(v26, "size");
    v75 = v23;
    v29 = objc_msgSend(v23, "scaleForImageSize:", v27, v28);
    v31 = v30;
    v32 = objc_msgSend(v26, "size");
    v74 = v24;
    v34 = objc_msgSend(v24, "scaleForImageSize:", v32, v33);
    v72 = v35;
    v36 = (void *)objc_msgSend(v9, "copy");
    v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v10 = 0;
      v23 = v75;
      v14 = v76;
      v24 = v74;
      v63 = v79;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v36, "setScale:", v29, v31);
    objc_msgSend(v36, "setSampleMode:", 2);
    v71 = v11;
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9E1F8]);
    -[NURenderNode settings](self, "settings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("isFallback"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");

    if ((v39 & 1) == 0)
    {
      v70 = v36;
      v40 = (id)objc_msgSend(v9, "copy");
      objc_msgSend(v40, "setAuxiliaryImageType:", 11);
      objc_msgSend(v40, "setScale:", v34, v72);
      -[PISemanticStyleRenderNode input](self, "input");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      objc_msgSend(v41, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v40, &v83);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v83;

      if (!v42)
      {
        v66 = (void *)MEMORY[0x1E0D520A0];
        -[PISemanticStyleRenderNode input](self, "input");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate linear thumbnail"), v67, v43);
        v68 = (id)objc_claimAutoreleasedReturnValue();

        *a5 = v68;
        v10 = 0;
        v23 = v75;
        v14 = v76;
        v24 = v74;
        v36 = v70;
        v63 = v79;
LABEL_40:

        v11 = v71;
        goto LABEL_41;
      }
      v73 = (void *)v42;
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v42, CFSTR("linearThumbnail"));
      v44 = v70;
      objc_msgSend(v70, "setAuxiliaryImageType:", 3);
      -[PISemanticStyleRenderNode input](self, "input");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      objc_msgSend(v45, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v70, &v82);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v82;

      if (!v46)
      {
        NULogger_8008();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v87 = v47;
          _os_log_impl(&dword_1A6382000, v48, OS_LOG_TYPE_INFO, "Missing subject matte image: %{public}@", buf, 0xCu);
        }

        v44 = v70;
      }
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v46, CFSTR("subjectMatte"));
      objc_msgSend(v44, "setAuxiliaryImageType:", 4);
      -[PISemanticStyleRenderNode input](self, "input");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      objc_msgSend(v49, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v44, &v81);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v81;
      v52 = v47;
      v53 = v51;

      v54 = (void *)v50;
      if (!v50)
      {
        v55 = v53;
        NULogger_8008();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v87 = v55;
          _os_log_impl(&dword_1A6382000, v56, OS_LOG_TYPE_INFO, "Missing skin matte image: %{public}@", buf, 0xCu);
        }

        v44 = v70;
        v53 = v55;
      }
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v54, CFSTR("skinMatte"), v46);
      objc_msgSend(v44, "setAuxiliaryImageType:", 9);
      -[PISemanticStyleRenderNode input](self, "input");
      v57 = v54;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0;
      objc_msgSend(v58, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v44, &v80);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v80;

      if (!v59)
      {
        NULogger_8008();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v87 = v60;
          _os_log_impl(&dword_1A6382000, v61, OS_LOG_TYPE_INFO, "Missing sky matte image: %{public}@", buf, 0xCu);
        }

      }
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v59, CFSTR("skyMatte"));

      v36 = v70;
    }
    objc_msgSend(v36, "setAuxiliaryImageType:", 1);
    v62 = self;
    v63 = v79;
    -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](v62, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v79, v8, v36, a5);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v40 = v64;
      v10 = v40;
    }
    else
    {
      v40 = 0;
      v10 = 0;
    }
    v23 = v75;
    v14 = v76;
    v24 = v74;
    goto LABEL_40;
  }
  v84.receiver = self;
  v84.super_class = (Class)PISemanticStyleRenderNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v84, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:

  return v10;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "evaluationMode") < 4;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideo:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PISemanticStyleRenderNode;
  -[NURenderNode _evaluateVideo:](&v4, sel__evaluateVideo_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int32_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  NSObject *v47;
  void *v48;
  const void **v49;
  void *specific;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  CMTime v76;
  CMTime time;
  CMTime v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  CMTime buf;
  _QWORD v85[4];

  v85[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_7964();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v48;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v49 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v55 = dispatch_get_specific(*v49);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v55;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v59;
        _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v52)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v54;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PISemanticStyleRenderNode input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputVideoComposition:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "instructions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 == 1)
      {
        objc_msgSend(v7, "instructions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PISemanticStyleRenderNode input](self, "input");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "videoProperties:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v13, "auxiliaryVideoTrackProperties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __55__PISemanticStyleRenderNode__evaluateVideoComposition___block_invoke;
          v79[3] = &unk_1E5016C18;
          v63 = v11;
          v80 = v11;
          v16 = v14;
          v81 = v16;
          objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v79);

          objc_msgSend(MEMORY[0x1E0D52348], "metadataTrackWithIdenfifier:forAsset:", *MEMORY[0x1E0D523A8], v5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v19 = *MEMORY[0x1E0D51FA0];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setSourceIdentifier:forMetadataTrackID:", v19, v20);

          }
          v60 = v18;
          v21 = (void *)objc_msgSend(v7, "mutableCopy");
          v85[0] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setInstructions:", v22);

          objc_msgSend(v16, "requiredSourceSampleDataTrackIDs");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setSourceSampleDataTrackIDs:", v23);

          objc_msgSend(v16, "setRequestedWindowOfSamples:", 1);
          objc_msgSend(v16, "setMainTrackSourceIdentifier:", CFSTR("video"));
          memset(&buf, 0, sizeof(buf));
          objc_msgSend(v7, "frameDuration");
          v24 = objc_msgSend(MEMORY[0x1E0D52108], "semanticStyleTemporalWindowSize");
          memset(&v78, 0, sizeof(v78));
          time = buf;
          CMTimeMultiply(&v78, &time, v24);
          v25 = objc_alloc(MEMORY[0x1E0C8B3D0]);
          NSSelectorFromString(CFSTR("initWithDurationBefore:durationAfter:durationBeforeWhenSeeking:durationAfterWhenSeeking:"));
          v62 = v13;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v26 = v25;
            time = v78;
            v76 = v78;
            v74 = *MEMORY[0x1E0CA2E68];
            v75 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            v72 = v74;
            v73 = v75;
            v25 = (id)objc_msgSend(v26, "initWithDurationBefore:durationAfter:durationBeforeWhenSeeking:durationAfterWhenSeeking:", &time, &v76, &v74, &v72);
          }
          else
          {
            v29 = objc_alloc(MEMORY[0x1E0C8B3D0]);
            time = v78;
            v76 = v78;
            v26 = (id)objc_msgSend(v29, "initWithDurationBefore:durationAfter:", &time, &v76);
          }

          v30 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v16, "requiredSourceTrackIDs");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v16, "requiredSourceTrackIDs");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v69;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v69 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v26, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
            }
            while (v35);
          }

          objc_msgSend(v21, "setSourceVideoTrackWindowsForTrackIDs:", v32);
          v38 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v16, "requiredSourceSampleDataTrackIDs");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v61 = v16;
          objc_msgSend(v16, "requiredSourceSampleDataTrackIDs");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v43; ++j)
              {
                if (*(_QWORD *)v65 != v44)
                  objc_enumerationMutation(v41);
                objc_msgSend(v40, "setObject:forKeyedSubscript:", v26, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
            }
            while (v43);
          }

          objc_msgSend(v21, "setSourceSampleDataTrackWindowsForTrackIDs:", v40);
          v13 = v62;
          v11 = v63;
        }
        else
        {
          v21 = 0;
        }

        goto LABEL_31;
      }
      v27 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v7, "instructions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v28);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v21 = 0;
LABEL_32:

  return v21;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  NSObject *v50;
  void *v51;
  const void **v52;
  void *specific;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  objc_super v64;
  id v65;
  id v66;
  objc_super v67;
  _BYTE buf[24];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_7964();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v51;
      _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v52 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7964();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v58 = dispatch_get_specific(*v52);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v57;
      _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  if (objc_msgSend(v12, "evaluationMode") != 2 && objc_msgSend(v13, "evaluationMode"))
  {
    if (objc_msgSend(v13, "evaluationMode") == 3)
    {
      objc_msgSend(v13, "videoMetadataSamples");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D51FA0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 3, CFSTR("Unable to find video metadata sample"), 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        goto LABEL_19;
      }
      v16 = (void *)MEMORY[0x1E0D52348];
      objc_msgSend(v15, "metadataGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      objc_msgSend(v16, "semanticStylePropertiesFromMetadataGroup:keyTime:error:", v17, buf, &v66);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v66;

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 3, CFSTR("Unable to obtain semantic style metadata"), v15, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v21 = 0;
        *a6 = v20;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      if (objc_msgSend(v13, "evaluationMode") != 1)
      {
        v63 = 0;
        v15 = 0;
LABEL_14:
        v24 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v15, "subjectRelightingValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("srlCurveParameter"));

        objc_msgSend(v15, "globalToneCurveData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("globalToneCurve"));

        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v15, "baselineExposure");
        objc_msgSend(v27, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("baselineExposure"));

        objc_msgSend(v15, "sceneType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("sceneType"));

        objc_msgSend(v15, "tuningType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("tuningType"));

        objc_msgSend(v15, "brightness");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("brightness"));

        objc_msgSend(v15, "stats");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, CFSTR("stats"));

        objc_msgSend(v15, "lightMapData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("lightMap"));

        objc_msgSend(v15, "linearLightMapData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, CFSTR("linearLightMap"));

        objc_msgSend(v15, "lightMapWidth");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, CFSTR("lightMapWidth"));

        objc_msgSend(v15, "lightMapHeight");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v36, CFSTR("lightMapHeight"));

        objc_msgSend(v15, "baseGain");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v37, CFSTR("baseGain"));

        objc_msgSend(v15, "faceBasedGlobalExposureBoostRatio");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v38, CFSTR("faceBasedGlobalExposureBoostRatio"));

        objc_msgSend(v15, "linearGain");
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v40 = (void *)v39;
          objc_msgSend(v15, "linearRangeMin");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v15, "linearRangeMax");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              objc_msgSend(v15, "linearGain");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v44, CFSTR("linearGain"));

              objc_msgSend(v15, "linearRangeMin");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v45, CFSTR("linearRangeMin"));

              objc_msgSend(v15, "linearRangeMax");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v46, CFSTR("linearRangeMax"));
              v47 = 1;
              goto LABEL_23;
            }
          }
          else
          {

          }
        }
        if (objc_msgSend(v13, "mediaComponentType") != 2)
        {
          v47 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v15, "version");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "minor") > 9;
LABEL_23:

LABEL_25:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v48, CFSTR("applyInverseCurveToLinearThumbnail"));

        v64.receiver = self;
        v64.super_class = (Class)PISemanticStyleRenderNode;
        -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v64, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v24, v13, a6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v63;
        goto LABEL_26;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inputImage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      objc_msgSend(v15, "imageProperties:", &v65);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v65;
      objc_msgSend(v22, "semanticStyleProperties");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 3, CFSTR("Unable to obtain styles properties"), 0, v19);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v21 = 0;
        goto LABEL_26;
      }
      v18 = v23;

    }
    v63 = v19;

    v15 = (void *)v18;
    goto LABEL_14;
  }
  v67.receiver = self;
  v67.super_class = (Class)PISemanticStyleRenderNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v67, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v11, v13, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v21;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImageGeometry:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  PISemanticStyleFilter *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  PISemanticStyleFilter *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  PISemanticStyleFilter *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  uint8_t buf[16];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("subjectMatte"));
    v123 = 0;
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "outputImage:", &v123);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v123;
    v119 = (void *)v7;
    if (!v7)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_214_7884);
      v9 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v10 = (void *)MEMORY[0x1E0C9DDC8];
      objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithColor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extent");
      objc_msgSend(v12, "imageByCroppingToRect:");
      v119 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("skinMatte"));
    v122 = 0;
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "outputImage:", &v122);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v122;

    if (!v13)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_214_7884);
      v15 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v16 = (void *)MEMORY[0x1E0C9DDC8];
      objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extent");
      objc_msgSend(v18, "imageByCroppingToRect:");
      v13 = objc_claimAutoreleasedReturnValue();

    }
    -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("skyMatte"));
    v121 = 0;
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "outputImage:", &v121);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v121;

    v118 = (void *)v19;
    if (!v19)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_214_7884);
      v21 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_1A6382000, v21, OS_LOG_TYPE_INFO, "Failed to obtain matte image: %{public}@", buf, 0xCu);
      }
      v22 = (void *)MEMORY[0x1E0C9DDC8];
      objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageWithColor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extent");
      objc_msgSend(v24, "imageByCroppingToRect:");
      v118 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v117 = (void *)v13;
    -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("linearThumbnail"));
    v120 = 0;
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "outputImage:", &v120);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v120;

    -[NURenderNode settings](self, "settings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("applyInverseCurveToLinearThumbnail"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    v107 = v5;
    if (v28)
    {
      objc_msgSend(v25, "imageByApplyingFilter:", CFSTR("CIAppleLogToLinear"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = v29;

        v25 = v31;
      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_214_7884);
        v33 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = CFSTR("CIAppleLogToLinear");
          _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Failed to convert linear thumbnail from Log to Linear: missing filter (%@)", buf, 0xCu);
        }
      }
      -[NURenderNode settings](self, "settings");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("linearRangeMin"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[NURenderNode settings](self, "settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("linearRangeMax"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[NURenderNode settings](self, "settings");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("linearGain"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35 && v37 && v39)
      {
        objc_msgSend(v39, "floatValue");
        LODWORD(v40) = 0;
        *((float *)&v40 + 1) = 1.0 / v41;
        objc_msgSend(v25, "_imageByApplyingColorMatrixRed:green:blue:bias:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0 / v41)), v40, 0.0, 0.0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "floatValue");
        v44 = v43;
        objc_msgSend(v37, "floatValue");
        v46 = v45;
        objc_msgSend(MEMORY[0x1E0C9DDB8], "colorClampFilter");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setInputImage:", v42);
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v44, v44, v44, 0.0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setMinComponents:", v48);

        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v46, v46, v46, 1.0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setMaxComponents:", v49);

        objc_msgSend(v47, "outputImage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3LinearColorSpace");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v50, "CGColorSpace"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("globalToneCurve"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
      *(_QWORD *)buf = 0x3F80000000000000;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 8);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NURenderNode settings](self, "settings");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("baselineExposure"));
    v54 = objc_claimAutoreleasedReturnValue();

    v55 = &unk_1E5051CE8;
    if (v54)
      v55 = (void *)v54;
    v115 = v55;
    -[NURenderNode settings](self, "settings");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("sceneType"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("inputSRLCurveParameter"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("stats"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("lightMap"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("linearLightMap"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("lightMapWidth"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("lightMapHeight"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("tuningType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("brightness"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("baseGain"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("faceBasedGlobalExposureBoostRatio"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("tone"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    v74 = v73;

    -[NURenderNode settings](self, "settings");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("color"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "doubleValue");
    v78 = v77;

    -[NURenderNode settings](self, "settings");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("cast"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("intensity"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "doubleValue");
    v84 = v83;

    -[NURenderNode settings](self, "settings");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("debugMode"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v6;
    if (objc_msgSend(v86, "isEqualToString:", CFSTR("showSubjectMatte")))
    {
      v87 = v119;
    }
    else if (objc_msgSend(v86, "isEqualToString:", CFSTR("showSkinMatte")))
    {
      v87 = v117;
    }
    else if (objc_msgSend(v86, "isEqualToString:", CFSTR("showSkyMatte")))
    {
      v87 = v118;
    }
    else
    {
      if ((objc_msgSend(v86, "isEqualToString:", CFSTR("originalThumb")) & 1) != 0)
        goto LABEL_45;
      if (!objc_msgSend(v86, "isEqualToString:", CFSTR("linearThumb")))
      {
        if ((objc_msgSend(v80, "isEqualToString:", CFSTR("None")) & 1) != 0)
          goto LABEL_45;
        -[NURenderNode settings](self, "settings");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("isFallback"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v92, "BOOLValue");

        if (v95)
        {
          v90 = (void *)MEMORY[0x1E0C9DDC8];
          objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.76, 0.69, 0.88);
          v101 = (PISemanticStyleFilter *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "imageWithColor:", v101);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[PISemanticStyleFilter extent](v32, "extent");
          objc_msgSend(v96, "imageByCroppingToRect:");
          v88 = (PISemanticStyleFilter *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v101 = objc_alloc_init(PISemanticStyleFilter);
          -[PISemanticStyleFilter setInputImage:](v101, "setInputImage:", v32);
          -[PISemanticStyleFilter setInputSubjectMatteImage:](v101, "setInputSubjectMatteImage:", v119);
          -[PISemanticStyleFilter setInputSkinMatteImage:](v101, "setInputSkinMatteImage:", v117);
          -[PISemanticStyleFilter setInputSkyMatteImage:](v101, "setInputSkyMatteImage:", v118);
          -[PISemanticStyleFilter setInputLinearThumbnailImage:](v101, "setInputLinearThumbnailImage:", v116);
          v97 = (void *)MEMORY[0x1E0C9DDC8];
          objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "imageWithColor:", v93);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[PISemanticStyleFilter extent](v32, "extent");
          objc_msgSend(v98, "imageByCroppingToRect:");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[PISemanticStyleFilter setInputGainMapImage:](v101, "setInputGainMapImage:", v91);

          -[PISemanticStyleFilter setInputToneBias:](v101, "setInputToneBias:", v74);
          -[PISemanticStyleFilter setInputColorBias:](v101, "setInputColorBias:", v78);
          -[PISemanticStyleFilter setInputCast:](v101, "setInputCast:", v80);
          -[PISemanticStyleFilter setInputIntensity:](v101, "setInputIntensity:", v84);
          -[PISemanticStyleFilter setInputSceneType:](v101, "setInputSceneType:", v114);
          -[PISemanticStyleFilter setInputTRCData:](v101, "setInputTRCData:", v52);
          objc_msgSend(v115, "doubleValue");
          -[PISemanticStyleFilter setInputBaselineExposure:](v101, "setInputBaselineExposure:");
          -[PISemanticStyleFilter setInputSRLCurveParameter:](v101, "setInputSRLCurveParameter:", v113);
          -[PISemanticStyleFilter setInputStatistics:](v101, "setInputStatistics:", v112);
          -[PISemanticStyleFilter setInputLightMapData:](v101, "setInputLightMapData:", v111);
          -[PISemanticStyleFilter setInputLinearLightMapData:](v101, "setInputLinearLightMapData:", v110);
          -[PISemanticStyleFilter setInputLightMapWidth:](v101, "setInputLightMapWidth:", v109);
          -[PISemanticStyleFilter setInputLightMapHeight:](v101, "setInputLightMapHeight:", v108);
          -[PISemanticStyleFilter setBrightnessValue:](v101, "setBrightnessValue:", v66);
          -[PISemanticStyleFilter setTuningType:](v101, "setTuningType:", v64);
          -[PISemanticStyleFilter setBaseGain:](v101, "setBaseGain:", v68);
          -[PISemanticStyleFilter setFaceBasedGlobalExposureBoostRatio:](v101, "setFaceBasedGlobalExposureBoostRatio:", v70);
          -[NURenderNode settings](self, "settings");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("useStyleEngine"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          -[PISemanticStyleFilter setUseStyleEngine:](v101, "setUseStyleEngine:", objc_msgSend(v94, "BOOLValue"));

          -[PISemanticStyleFilter outputImage](v101, "outputImage");
          v88 = (PISemanticStyleFilter *)objc_claimAutoreleasedReturnValue();

        }
        v32 = v101;
        goto LABEL_44;
      }
      v87 = v116;
    }
    v88 = v87;
LABEL_44:

    v32 = v88;
LABEL_45:

    v5 = v107;
    goto LABEL_46;
  }
  v32 = 0;
LABEL_46:

  return v32;
}

void __55__PISemanticStyleRenderNode__evaluateVideoComposition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "requiredSourceTrackIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "trackID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "requiredSourceTrackIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "trackID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setRequiredSourceTrackIDs:", v12);

  }
  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "trackID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceIdentifier:forTrackID:", v6, v14);

}

@end
