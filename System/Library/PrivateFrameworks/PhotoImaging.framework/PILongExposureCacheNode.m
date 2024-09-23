@implementation PILongExposureCacheNode

- (PILongExposureCacheNode)initWithAutoLoopCacheNode:(id)a3 urlKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PILongExposureCacheNode *v11;
  NSObject *v13;
  const void **v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  const void **v21;
  void *v22;
  int v23;
  void *v24;
  const void **v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  objc_super v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_6392();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cacheNode != nil");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v26 = dispatch_get_specific(*v15);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v15 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v26;
        v42 = 2114;
        v43 = v29;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v15;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v23 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_6392();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "key != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v23)
    {
      v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E0CB3978];
      v32 = v30;
      objc_msgSend(v31, "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v30;
      v42 = 2114;
      v43 = v34;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v38 = *MEMORY[0x1E0D51D40];
  v39 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = CFSTR("key");
  v37 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)PILongExposureCacheNode;
  v11 = -[NUCacheNode initWithInputs:settings:subsampleFactor:](&v35, sel_initWithInputs_settings_subsampleFactor_, v9, v10, 1);

  return v11;
}

- (id)persistentURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PILongExposureCacheNode autoLoopCacheNode](self, "autoLoopCacheNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;

  v6 = (objc_class *)MEMORY[0x1E0D52028];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithURL:UTI:identifier:", v7, v9, CFSTR("cache"));

  v11 = objc_msgSend(v10, "load:", a4);
  if (v11)
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v10, 0);

  return v11;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_6392();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        v32 = 2114;
        v33 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v12, "setMediaComponentType:", 2);
    objc_msgSend(v12, "setScale:", *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8));
    v29.receiver = self;
    v29.super_class = (Class)PILongExposureCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v29, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v13)
      v14 = v13;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Cannot evaluate cache node"), self);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PILongExposureCacheNode autoLoopCacheNode](self, "autoLoopCacheNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateRenderDependenciesWithRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resolvedSourceNode:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  objc_super v9;

  if (-[NUCacheNode isResolved](self, "isResolved")
    || (-[PILongExposureCacheNode persistentURL](self, "persistentURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[PILongExposureCacheNode tryLoadPersistentURL:error:](self, "tryLoadPersistentURL:error:", v5, a3),
        v5,
        v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)PILongExposureCacheNode;
    -[NUCacheNode resolvedSourceNode:](&v9, sel_resolvedSourceNode_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  void *v5;

  -[PILongExposureCacheNode autoLoopCacheNode](self, "autoLoopCacheNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImageGeometry:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
