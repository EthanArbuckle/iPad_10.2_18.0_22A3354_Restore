@implementation PIParallaxStyleRecipeArchiver

+ (BOOL)writeRecipe:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
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
    NUAssertLogger_8288();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
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
        v31 = v25;
        v32 = 2114;
        v33 = v29;
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
      v31 = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  objc_msgSend(a1, "serializeRecipe:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "open");
    v14 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v11, v13, 100, 0, a5);
    objc_msgSend(v13, "close");
    v15 = v14 > 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to open recipe destination file"), v10);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)serializeRecipe:(id)a3
{
  id v4;
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
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_8288();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
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
        v32 = v24;
        v33 = 2114;
        v34 = v28;
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
      v32 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v30[0] = &unk_1E50513D0;
  v29[0] = CFSTR("version");
  v29[1] = CFSTR("parameters");
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_serializeParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v7;
  v29[2] = CFSTR("foreground");
  objc_msgSend(v5, "foregroundFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_serializeFilters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v9;
  v29[3] = CFSTR("background");
  objc_msgSend(v5, "backgroundFilters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_serializeFilters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v11;
  v29[4] = CFSTR("matte");
  objc_msgSend(v5, "matteFilters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_serializeFilters:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)unarchivedStyleRecipeWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  uint8_t buf[4];
  const void **v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_8288();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
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
        v36 = (const void **)v26;
        v37 = 2114;
        v38 = v29;
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
      v36 = v15;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v23 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!a4)
  {
    NUAssertLogger_8288();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
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
        v36 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_25;
    }
LABEL_23:
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
      v36 = (const void **)v30;
      v37 = 2114;
      v38 = v34;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_25:

    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "open");
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v9, 0, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(a1, "deserializeRecipe:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v9, "close");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to open recipe source file"), v7);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)deserializeRecipe:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v10;
  NSObject *v11;
  void *specific;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  const void **v16;
  void *v17;
  id v18;
  char *v19;
  id v20;
  uint64_t v21;
  PIParallaxStyleRecipe *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  _BOOL4 v29;
  NSObject *v30;
  const void **v31;
  int v32;
  void *v33;
  void *v35;
  void *v36;
  char *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  const void **v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!a4)
  {
    NUAssertLogger_8288();
    v27 = objc_claimAutoreleasedReturnValue();
    v19 = "error != NULL";
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v11 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        specific = dispatch_get_specific(*v16);
        v35 = (void *)MEMORY[0x1E0CB3978];
        a4 = specific;
        objc_msgSend(v35, "callStackSymbols");
        v16 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)specific;
        v48 = 2114;
        v49 = v4;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v16;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = _NUAssertFailHandler();
    goto LABEL_62;
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger_8288();
    v30 = objc_claimAutoreleasedReturnValue();
    v19 = "dictionary != nil";
    a4 = (id *)&unk_1A64D6000;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v11 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v16;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_64:

      v37 = v19;
      _NUAssertFailHandler();
LABEL_65:
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize matte filters"), v4, a1, v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = a1;
      goto LABEL_50;
    }
LABEL_62:
    if (v32)
    {
      specific = dispatch_get_specific(*v16);
      v36 = (void *)MEMORY[0x1E0CB3978];
      a4 = specific;
      objc_msgSend(v36, "callStackSymbols");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)specific;
      v48 = 2114;
      v49 = v4;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_64;
  }
  -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("version"));
  specific = (void *)objc_claimAutoreleasedReturnValue();
  if (specific)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid version info"), specific);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  v13 = objc_msgSend(specific, "unsignedIntegerValue");
  if (v13 < 6)
  {
    v15 = v13;
    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("parameters"));
    v16 = (const void **)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0;
        objc_msgSend(a1, "_deserializeParameters:version:error:", v16, v15, &v45);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v45;
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize recipe parameters"), v16, v18);
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

          goto LABEL_57;
        }
        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("foreground"));
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v41 = v17;
            v44 = 0;
            objc_msgSend(a1, "_deserializeFilterDefinitions:version:error:", v19, v15, &v44);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v44;

            v40 = v5;
            if (!v5)
            {
              objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize foreground filters"), v19, v20);
              v22 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              v5 = 0;
LABEL_54:

              v18 = v20;
              v17 = v41;
              goto LABEL_55;
            }
            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("background"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = 0;
                objc_msgSend(a1, "_deserializeFilterDefinitions:version:error:", v6, v15, &v43);
                v21 = objc_claimAutoreleasedReturnValue();
                v39 = v43;

                v38 = (void *)v21;
                if (!v21)
                {
                  v20 = v39;
                  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize background filters"), v6, v39);
                  v22 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                  v5 = v40;
                  v26 = 0;
LABEL_52:

                  goto LABEL_53;
                }
                if (v15 < 2)
                {
                  v7 = (void *)MEMORY[0x1E0C9AA60];
                  v5 = v40;
                  goto LABEL_36;
                }
                -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("matte"));
                v4 = (void *)objc_claimAutoreleasedReturnValue();
                if (v4)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v42 = 0;
                    objc_msgSend(a1, "_deserializeFilterDefinitions:version:error:", v4, v15, &v42);
                    v7 = (void *)objc_claimAutoreleasedReturnValue();
                    a1 = v42;

                    v5 = v40;
                    if (v7)
                    {

                      v39 = a1;
LABEL_36:
                      v26 = v38;
                      v22 = -[PIParallaxStyleRecipe initWithParameters:foregroundFilters:backgroundFilters:matteFilters:]([PIParallaxStyleRecipe alloc], "initWithParameters:foregroundFilters:backgroundFilters:matteFilters:", v41, v5, v38, v7);
LABEL_51:

                      v20 = v39;
                      goto LABEL_52;
                    }
                    goto LABEL_65;
                  }
                  objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid matte filters dictionary"), v4);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing matte filters"), v11);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v7 = (void *)MEMORY[0x1E0C9AA60];
                v5 = v40;
LABEL_50:
                *a4 = v33;

                v22 = 0;
                v26 = v38;
                goto LABEL_51;
              }
              objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid background filters dictionary"), v6);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing background filters"), v11);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v22 = 0;
            *a4 = v25;
LABEL_53:

            goto LABEL_54;
          }
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid foreground filters dictionary"), v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing foreground filters"), v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v22 = 0;
        *a4 = v24;
LABEL_55:

        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid recipe parameters"), v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing recipe parameters"), v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
    *a4 = v23;
LABEL_57:

    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unsupported version"), specific);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v22 = 0;
  *a4 = v14;
LABEL_58:

  return v22;
}

+ (id)_serializeParameters:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__PIParallaxStyleRecipeArchiver__serializeParameters___block_invoke;
  v13 = &unk_1E5016DA0;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

+ (id)_serializeParameter:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  const void **v34;
  void *specific;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  SEL v46;
  id v47;
  unint64_t v48;
  id *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[5];

  v55[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("number"));

  if (v7)
  {
    v8 = v3;
    objc_msgSend(v8, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("value"));
    goto LABEL_7;
  }
  objc_msgSend(v3, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("color"));

  if (v11)
  {
    v12 = v3;
    objc_msgSend(v12, "redValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    objc_msgSend(v12, "greenValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v13;
    objc_msgSend(v12, "blueValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v14;
    objc_msgSend(v12, "alphaValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v55[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("value"));

LABEL_14:
    return v4;
  }
  objc_msgSend(v3, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("point"));

  if (v18)
  {
    v8 = v3;
    objc_msgSend(v8, "xValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v9;
    objc_msgSend(v8, "yValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("value"));

LABEL_7:
    objc_msgSend(v8, "unit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", CFSTR("none"));

    if ((v22 & 1) == 0)
    {
      objc_msgSend(v8, "unit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("unit"));

    }
    goto LABEL_14;
  }
  objc_msgSend(v3, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("mode"));

  if (v25)
  {
    objc_msgSend(v3, "modeValue");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = (id)v26;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("value"));
    goto LABEL_14;
  }
  objc_msgSend(v3, "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("binding"));

  if (v28)
  {
    objc_msgSend(v3, "variableName");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  NUAssertLogger_8288();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Unknown parameter type: %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v33;
    _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v34 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_8288();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v37)
    {
      v40 = dispatch_get_specific(*v34);
      v41 = (void *)MEMORY[0x1E0CB3978];
      v42 = v40;
      objc_msgSend(v41, "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v40;
      v52 = 2114;
      v53 = v44;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v37)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = v39;
    _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  objc_msgSend(v3, "type");
  objc_claimAutoreleasedReturnValue();
  v45 = (void *)_NUAssertFailHandler();
  return +[PIParallaxStyleRecipeArchiver _deserializeParameters:version:error:](v45, v46, v47, v48, v49);
}

+ (id)_deserializeParameters:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  id v31;
  unint64_t v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_8288();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v9 = v8;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__8353;
  v35 = __Block_byref_object_dispose__8354;
  v36 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __70__PIParallaxStyleRecipeArchiver__deserializeParameters_version_error___block_invoke;
  v28[3] = &unk_1E5016DC8;
  v30 = buf;
  v31 = a1;
  v32 = a4;
  v11 = v10;
  v29 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v28);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v12)
  {
    v13 = 0;
    *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = v11;
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

+ (id)_deserializeParameter:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  PIParallaxStyleNumberParameter *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  PIParallaxStyleColorParameter *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  char isKindOfClass;
  __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  PIParallaxStyleModeParameter *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  PIParallaxStyleColorParameter *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  __CFString *v55;
  PIParallaxStylePointParameter *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  const void **v60;
  const void **v61;
  void *specific;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  NSObject *v66;
  const void **v67;
  void *v68;
  int v69;
  void *v70;
  const void **v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _QWORD v97[8];
  _QWORD v98[8];
  uint8_t buf[4];
  const void **v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    NUAssertLogger_8288();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v60 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v60;
      _os_log_error_impl(&dword_1A6382000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v61 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v64)
      {
        v72 = dispatch_get_specific(*v61);
        v73 = (void *)MEMORY[0x1E0CB3978];
        v74 = v72;
        objc_msgSend(v73, "callStackSymbols");
        v61 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v100 = (const void **)v72;
        v101 = 2114;
        v102 = v75;
        _os_log_error_impl(&dword_1A6382000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v64)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v61;
      _os_log_error_impl(&dword_1A6382000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v69 = _NUAssertFailHandler();
    goto LABEL_116;
  }
  if (!a5)
  {
    NUAssertLogger_8288();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v67 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v67;
      _os_log_error_impl(&dword_1A6382000, v66, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v61 = (const void **)MEMORY[0x1E0D51D48];
    v68 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v63 = objc_claimAutoreleasedReturnValue();
    v69 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (!v68)
    {
      if (v69)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n"));
        v71 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v100 = v71;
        _os_log_error_impl(&dword_1A6382000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_118;
    }
LABEL_116:
    if (v69)
    {
      v76 = dispatch_get_specific(*v61);
      v77 = (void *)MEMORY[0x1E0CB3978];
      v78 = v76;
      objc_msgSend(v77, "callStackSymbols");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "componentsJoinedByString:", CFSTR("\n"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = (const void **)v76;
      v101 = 2114;
      v102 = v80;
      _os_log_error_impl(&dword_1A6382000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_118:

    _NUAssertFailHandler();
  }
  v8 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing parameter type"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v16 = 0;
    *a5 = v17;
    goto LABEL_97;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0D520A0];
    v19 = CFSTR("Invalid parameter type");
LABEL_19:
    objc_msgSend(v18, "invalidError:object:", v19, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("number")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("color")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_msgSend(v10, "count");
          if (a4 < 5)
          {
            if (v20 != 3)
            {
              v39 = (void *)MEMORY[0x1E0D520A0];
              v40 = CFSTR("Expected 3 color values");
              goto LABEL_93;
            }
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v13 = v10;
            v43 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v87;
              while (2)
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v87 != v45)
                    objc_enumerationMutation(v13);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v51 = (void *)MEMORY[0x1E0D520A0];
                    v52 = CFSTR("Expected 3 numbers");
LABEL_89:
                    objc_msgSend(v51, "mismatchError:object:", v52, v8);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_100;
                  }
                }
                v44 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
                if (v44)
                  continue;
                break;
              }
            }

            v47 = [PIParallaxStyleColorParameter alloc];
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[PIParallaxStyleColorParameter initWithRed:green:blue:alpha:](v47, "initWithRed:green:blue:alpha:", v26, v27, v28, &unk_1E5051CF8);
          }
          else
          {
            if (v20 != 4)
            {
              v39 = (void *)MEMORY[0x1E0D520A0];
              v40 = CFSTR("Expected 4 color values");
              goto LABEL_93;
            }
            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            v13 = v10;
            v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v91;
              while (2)
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v91 != v23)
                    objc_enumerationMutation(v13);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v51 = (void *)MEMORY[0x1E0D520A0];
                    v52 = CFSTR("Expected 4 numbers");
                    goto LABEL_89;
                  }
                }
                v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                if (v22)
                  continue;
                break;
              }
            }

            v25 = [PIParallaxStyleColorParameter alloc];
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[PIParallaxStyleColorParameter initWithRed:green:blue:alpha:](v25, "initWithRed:green:blue:alpha:", v26, v27, v28, v29);

          }
          goto LABEL_16;
        }
        v39 = (void *)MEMORY[0x1E0D520A0];
        v40 = CFSTR("Expected color values");
LABEL_93:
        objc_msgSend(v39, "mismatchError:object:", v40, v8);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_94;
      }
      v37 = (void *)MEMORY[0x1E0D520A0];
      v38 = CFSTR("Missing color values");
LABEL_91:
      objc_msgSend(v37, "missingError:object:", v38, v8);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_94:
      *a5 = v53;
LABEL_95:

      goto LABEL_96;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("point")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v30, "count") == 2)
          {
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            obj = v30;
            v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v83;
              while (2)
              {
                for (k = 0; k != v32; ++k)
                {
                  if (*(_QWORD *)v83 != v33)
                    objc_enumerationMutation(obj);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Expected 2 numbers"), v8);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_83;
                  }
                }
                v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
                if (v32)
                  continue;
                break;
              }
            }

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unit"));
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              v36 = v11;
              if ((isKindOfClass & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0D520A0], "mismatchError:object:", CFSTR("Invalid unit value"), v11);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_96:
                v16 = 0;
                goto LABEL_97;
              }
            }
            else
            {
              v36 = CFSTR("none");
            }
            v55 = v36;
            v56 = [PIParallaxStylePointParameter alloc];
            v10 = obj;
            objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectAtIndexedSubscript:", 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[PIParallaxStylePointParameter initWithX:Y:unit:](v56, "initWithX:Y:unit:", v57, v58, v55);

            goto LABEL_15;
          }
          v48 = (void *)MEMORY[0x1E0D520A0];
          v49 = CFSTR("Expected 2 point values");
        }
        else
        {
          v48 = (void *)MEMORY[0x1E0D520A0];
          v49 = CFSTR("Expected point values");
        }
        objc_msgSend(v48, "mismatchError:object:", v49, v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing point values"), v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a5 = v42;
LABEL_83:

      goto LABEL_96;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("mode")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v37 = (void *)MEMORY[0x1E0D520A0];
        v38 = CFSTR("Missing mode value");
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1E0D520A0];
        v40 = CFSTR("Expected mode value");
        goto LABEL_93;
      }
      v41 = -[PIParallaxStyleModeParameter initWithMode:]([PIParallaxStyleModeParameter alloc], "initWithMode:", v10);
LABEL_62:
      v16 = (PIParallaxStyleNumberParameter *)v41;
      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("binding")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v37 = (void *)MEMORY[0x1E0D520A0];
        v38 = CFSTR("Missing binding value");
        goto LABEL_91;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1E0D520A0];
        v40 = CFSTR("Expected binding value");
        goto LABEL_93;
      }
      v41 = -[PIParallaxStyleBindingParameter initWithVariableName:]([PIParallaxStyleBindingParameter alloc], "initWithVariableName:", v10);
      goto LABEL_62;
    }
    v18 = (void *)MEMORY[0x1E0D520A0];
    v19 = CFSTR("Unrecognized parameter type");
    goto LABEL_19;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v37 = (void *)MEMORY[0x1E0D520A0];
    v38 = CFSTR("Missing number value");
    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1E0D520A0];
    v40 = CFSTR("Expected a number value");
    goto LABEL_93;
  }
  v11 = CFSTR("none");
  v12 = CFSTR("none");
  if (a4 >= 3)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unit"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97[0] = CFSTR("none");
      v97[1] = CFSTR("pixels");
      v98[0] = CFSTR("none");
      v98[1] = CFSTR("pixels");
      v97[2] = CFSTR("degrees");
      v97[3] = CFSTR("count");
      v98[2] = CFSTR("degrees");
      v98[3] = CFSTR("count");
      v97[4] = CFSTR("logic");
      v97[5] = &stru_1E501A310;
      v98[4] = CFSTR("logic");
      v98[5] = CFSTR("none");
      v97[6] = CFSTR("px");
      v97[7] = CFSTR("deg");
      v98[6] = CFSTR("pixels");
      v98[7] = CFSTR("degrees");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 8);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKey:](v14, "objectForKey:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15)
      {

        v11 = (__CFString *)v15;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "unknownError:object:", CFSTR("Unknown unit value"), v13);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid unit value"), v13);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("none");
    }
    *a5 = v50;

LABEL_100:
    goto LABEL_95;
  }
LABEL_14:
  v16 = -[PIParallaxStyleNumberParameter initWithNumber:unit:]([PIParallaxStyleNumberParameter alloc], "initWithNumber:unit:", v10, v11);
LABEL_15:

LABEL_16:
LABEL_97:

  return v16;
}

+ (id)_serializeFilters:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PIParallaxStyleRecipeArchiver__serializeFilters___block_invoke;
  v9[3] = &unk_1E5016DF0;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

+ (id)_serializeDefinition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *v21;
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
  void *v34;
  SEL v35;
  id v36;
  unint64_t v37;
  id *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("type"));

  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("filter"));

  if (v8)
  {
    v9 = v4;
    objc_msgSend(v9, "filterName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("filter"));

    objc_msgSend(v9, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_serializeParameters:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("parameters");
LABEL_5:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

    return v5;
  }
  objc_msgSend(v4, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("stack"));

  if (v15)
  {
    v16 = v4;
    objc_msgSend(v16, "stackName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

    objc_msgSend(v16, "filters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_serializeFilters:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("filters");
    goto LABEL_5;
  }
  NUAssertLogger_8288();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Unknown definition type: %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v23 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_8288();
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
      v40 = v29;
      v41 = 2114;
      v42 = v33;
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
    v40 = v28;
    _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  objc_msgSend(v4, "type");
  objc_claimAutoreleasedReturnValue();
  v34 = (void *)_NUAssertFailHandler();
  return +[PIParallaxStyleRecipeArchiver _deserializeFilterDefinitions:version:error:](v34, v35, v36, v37, v38);
}

+ (id)_deserializeFilterDefinitions:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _BYTE *v40;
  id v41;
  unint64_t v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    NUAssertLogger_8288();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "serializedFilters != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
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
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_22:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!a5)
  {
    NUAssertLogger_8288();
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
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (!v25)
        goto LABEL_22;
      goto LABEL_16;
    }
    if (v25)
    {
      v33 = dispatch_get_specific(*v23);
      v34 = (void *)MEMORY[0x1E0CB3978];
      v35 = v33;
      objc_msgSend(v34, "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v37;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_22;
  }
  v9 = v8;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__8353;
  v45 = __Block_byref_object_dispose__8354;
  v46 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __77__PIParallaxStyleRecipeArchiver__deserializeFilterDefinitions_version_error___block_invoke;
  v38[3] = &unk_1E5016E18;
  v40 = buf;
  v41 = a1;
  v42 = a4;
  v11 = v10;
  v39 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v38);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v12)
  {
    v13 = 0;
    *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = v11;
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

+ (id)_deserializeFilterDefinition:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PIParallaxStyleFilterStackDefinition *v18;
  PIParallaxStyleFilterStackDefinition *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  const void **v34;
  const void **v35;
  void *specific;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  const void **v41;
  void *v42;
  int v43;
  void *v44;
  const void **v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint8_t buf[4];
  const void **v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    NUAssertLogger_8288();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v34 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v34;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v46 = dispatch_get_specific(*v35);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v35 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = (const void **)v46;
        v59 = 2114;
        v60 = v49;
        _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v35;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v43 = _NUAssertFailHandler();
    goto LABEL_62;
  }
  if (!a5)
  {
    NUAssertLogger_8288();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v41 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v41;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = (const void **)MEMORY[0x1E0D51D48];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8288();
    v37 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v45;
        _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_64;
    }
LABEL_62:
    if (v43)
    {
      v50 = dispatch_get_specific(*v35);
      v51 = (void *)MEMORY[0x1E0CB3978];
      v52 = v50;
      objc_msgSend(v51, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = (const void **)v50;
      v59 = 2114;
      v60 = v54;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_64:

    _NUAssertFailHandler();
  }
  v9 = v8;
  if (!a4)
  {
    v11 = CFSTR("filter");
    v13 = CFSTR("filter");
    if ((objc_msgSend(CFSTR("filter"), "isEqualToString:", CFSTR("filter")) & 1) != 0)
    {
      v12 = CFSTR("filterName");
      goto LABEL_10;
    }
LABEL_16:
    if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("stack")))
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Unrecognized definition type"), v11);
      v19 = 0;
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("filters"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v55 = 0;
            objc_msgSend(a1, "_deserializeFilterDefinitions:version:error:", v15, a4, &v55);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v55;
            if (v16)
            {
              v18 = -[PIParallaxStyleFilterStackDefinition initWithStackName:filters:]([PIParallaxStyleFilterStackDefinition alloc], "initWithStackName:filters:", v14, v16);
              goto LABEL_23;
            }
            v31 = (void *)MEMORY[0x1E0D520A0];
            v32 = CFSTR("Failed to deserialize stack filters");
LABEL_46:
            objc_msgSend(v31, "errorWithCode:reason:object:underlyingError:", 1, v32, v15, v17);
            v19 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

            if (v16)
            {
              v19 = v19;
              v16 = v19;
            }
            goto LABEL_42;
          }
          v27 = (void *)MEMORY[0x1E0D520A0];
          v28 = CFSTR("Invalid stack filters");
          goto LABEL_39;
        }
        v25 = (void *)MEMORY[0x1E0D520A0];
        v26 = CFSTR("Missing stack filters");
LABEL_37:
        objc_msgSend(v25, "missingError:object:", v26, v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
        *a5 = v29;

        goto LABEL_41;
      }
      v22 = (void *)MEMORY[0x1E0D520A0];
      v23 = CFSTR("Invalid stack name");
      goto LABEL_32;
    }
    v20 = (void *)MEMORY[0x1E0D520A0];
    v21 = CFSTR("Missing stack name");
LABEL_30:
    objc_msgSend(v20, "missingError:object:", v21, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    *a5 = v24;
LABEL_41:

    v19 = 0;
    v16 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (__CFString *)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("filter")))
      {
        v12 = CFSTR("filter");
LABEL_10:
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("parameters"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v56 = 0;
                objc_msgSend(a1, "_deserializeParameters:version:error:", v15, a4, &v56);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v56;
                if (v16)
                {
                  v18 = -[PIParallaxStyleFilterDefinition initWithFilterName:parameters:]([PIParallaxStyleFilterDefinition alloc], "initWithFilterName:parameters:", v14, v16);
LABEL_23:
                  v19 = v18;
                  goto LABEL_47;
                }
                v31 = (void *)MEMORY[0x1E0D520A0];
                v32 = CFSTR("Filed to deserialize filter parameters");
                goto LABEL_46;
              }
              v27 = (void *)MEMORY[0x1E0D520A0];
              v28 = CFSTR("Invalid filter parameters");
LABEL_39:
              objc_msgSend(v27, "invalidError:object:", v28, v15);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            }
            v25 = (void *)MEMORY[0x1E0D520A0];
            v26 = CFSTR("Missing filter parameters");
            goto LABEL_37;
          }
          v22 = (void *)MEMORY[0x1E0D520A0];
          v23 = CFSTR("Invalid filter name");
LABEL_32:
          objc_msgSend(v22, "invalidError:object:", v23, v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
        v20 = (void *)MEMORY[0x1E0D520A0];
        v21 = CFSTR("Missing filter name");
        goto LABEL_30;
      }
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid filter definition type"), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing definition type"), v9);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_43:

  return v16;
}

void __77__PIParallaxStyleRecipeArchiver__deserializeFilterDefinitions_version_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    obj = 0;
    objc_msgSend(v7, "_deserializeFilterDefinition:version:error:", v6, v8, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong(v9, obj);
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    else
      *a4 = 1;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid definition dictionary"), v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

void __51__PIParallaxStyleRecipeArchiver__serializeFilters___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "_serializeDefinition:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __70__PIParallaxStyleRecipeArchiver__deserializeParameters_version_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0D520A0];
    v14 = CFSTR("Invalid parameter name");
    v15 = v7;
LABEL_7:
    objc_msgSend(v13, "invalidError:object:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    *a4 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0D520A0];
    v14 = CFSTR("Invalid parameter dictionary");
    v15 = v8;
    goto LABEL_7;
  }
  v9 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  obj = 0;
  objc_msgSend(v9, "_deserializeParameter:version:error:", v8, v10, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v11, obj);
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v7);
  else
    *a4 = 1;

LABEL_10:
}

void __54__PIParallaxStyleRecipeArchiver__serializeParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_serializeParameter:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

@end
