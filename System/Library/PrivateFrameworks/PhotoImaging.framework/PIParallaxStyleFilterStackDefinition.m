@implementation PIParallaxStyleFilterStackDefinition

- (PIParallaxStyleFilterStackDefinition)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  }
}

- (PIParallaxStyleFilterStackDefinition)initWithStackName:(id)a3 filters:(id)a4
{
  id v5;
  id v6;
  PIParallaxStyleFilterStackDefinition *v7;
  uint64_t v8;
  NSString *stackName;
  uint64_t v10;
  NSArray *filters;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleFilterStackDefinition;
  v5 = a4;
  v6 = a3;
  v7 = -[PIParallaxStyleFilterStackDefinition init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  stackName = v7->_stackName;
  v7->_stackName = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  filters = v7->_filters;
  v7->_filters = (NSArray *)v10;

  return v7;
}

- (id)type
{
  return CFSTR("stack");
}

- (BOOL)isEqualToParallaxStyleDefinition:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("stack"));

  if (v6)
    v7 = -[PIParallaxStyleFilterStackDefinition isEqualToParallaxStyleFilterStackDefinition:](self, "isEqualToParallaxStyleFilterStackDefinition:", v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToParallaxStyleFilterStackDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PIParallaxStyleFilterStackDefinition stackName](self, "stackName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stackName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PIParallaxStyleFilterStackDefinition filters](self, "filters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  dispatch_once_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v30;
  const void **v31;
  const void **v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  const void **v38;
  void *v39;
  int v40;
  void *v41;
  const void **v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const void **v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_11199();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11199();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v43 = dispatch_get_specific(*v32);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v43;
        v61 = 2114;
        v62 = v46;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v32;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v40 = _NUAssertFailHandler();
    goto LABEL_30;
  }
  if (!a4)
  {
    NUAssertLogger_11199();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v38 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11199();
    v34 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v42;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_32;
    }
LABEL_30:
    if (v40)
    {
      v47 = dispatch_get_specific(*v32);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v49 = v47;
      objc_msgSend(v48, "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v47;
      v61 = 2114;
      v62 = v51;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_32:

    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v6, "inputImage");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "outputImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageByCroppingToRect:", v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInputImage:", v17);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[PIParallaxStyleFilterStackDefinition filters](self, "filters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = (dispatch_once_t *)MEMORY[0x1E0D52390];
    v22 = *(_QWORD *)v55;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v23);
        v53 = 0;
        objc_msgSend(v24, "evaluateWithContext:error:", v7, &v53);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v53;
        if (v25)
        {
          objc_msgSend(v7, "setOutputImage:", v25);
        }
        else
        {
          if (*v21 != -1)
            dispatch_once(v21, &__block_literal_global_334);
          v27 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v60 = (const void **)v24;
            v61 = 2112;
            v62 = v26;
            _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Error evaluating filter definition: %@, error: %@", buf, 0x16u);
          }
        }

        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v20);
  }

  objc_msgSend(v7, "setInputImage:", v52);
  objc_msgSend(v7, "outputImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxStyleFilterStackDefinition stackName](self, "stackName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleFilterStackDefinition filters](self, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p stack:%@ filters:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)stackName
{
  return self->_stackName;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_stackName, 0);
}

@end
