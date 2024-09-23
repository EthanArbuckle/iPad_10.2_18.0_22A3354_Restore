@implementation PIPhotoEffect3DNode

- (PIPhotoEffect3DNode)initWithSettings:(id)a3 inputs:(id)a4
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

- (PIPhotoEffect3DNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
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
  PIPhotoEffect3DNode *v17;
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
  v32.super_class = (Class)PIPhotoEffect3DNode;
  v17 = -[NURenderNode initWithSettings:inputs:](&v32, sel_initWithSettings_inputs_, v11, v16);

  return v17;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
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
  uint64_t v25;
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
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12040();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
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
        *(_DWORD *)buf = 138543618;
        v42 = v35;
        v43 = 2114;
        v44 = v39;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v34;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "auxiliaryImageType");
  -[PIPortraitNode input](self, "input");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == 1)
  {
    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("inputImage"));
      -[PIPortraitNode blurMap](self, "blurMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v15, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, &v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("inputBlurMap"));
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderNode settings](self, "settings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kind"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("inputKind"));

      -[NURenderNode settings](self, "settings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("intensity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("inputIntensity"));

      -[NURenderNode settings](self, "settings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isHDR"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("inputIsHDR"));

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", CFSTR("PIPhotoEffect3DFilter"), v17, v14);
      objc_msgSend(v24, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v14, v8, v10, a5);
      v25 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

    v13 = (void *)v25;
  }

  return v13;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

@end
