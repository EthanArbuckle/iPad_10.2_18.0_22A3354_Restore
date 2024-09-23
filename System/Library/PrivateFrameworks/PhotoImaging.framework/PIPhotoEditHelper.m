@implementation PIPhotoEditHelper

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)s_effectNames;
    s_effectNames = (uint64_t)&unk_1E5059070;

    v3 = (void *)s_3DEffectNames;
    s_3DEffectNames = (uint64_t)&unk_1E5059098;

    v4 = (void *)s_PortraitStageEffectNames;
    s_PortraitStageEffectNames = (uint64_t)&unk_1E50590C0;

    v7 = (id)objc_msgSend(&unk_1E50590E8, "mutableCopy");
    objc_msgSend(v7, "addEntriesFromDictionary:", &unk_1E50590C0);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)s_PortraitEffectNames;
    s_PortraitEffectNames = v5;

  }
}

+ (id)assetIdentifierForURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v19 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v19, *MEMORY[0x1E0C998D8], 0);
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v10 = v9;
  if (!v8
    || ((objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v8),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC5B8]),
         v11,
         v12)
      ? (v13 = !v5)
      : (v13 = 1),
        v13))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %a"), v16, v10);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (preview) %a"), v16, v10);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)imageSourceWithURL:(id)a3 type:(id)a4 useEmbeddedPreview:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_9919();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v11 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend(a1, "assetIdentifierForURL:type:useEmbeddedPreview:", v8, v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssetIdentifier:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520B8]), "initWithURL:UTI:", v8, v10);
  objc_msgSend(v13, "setUseEmbeddedPreview:", v5);
  v14 = objc_alloc(MEMORY[0x1E0D521C0]);
  v31 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithSourceDefinitions:", v15);
  objc_msgSend(v11, "setDefinition:", v16);

  return v11;
}

+ (id)imageSourceWithURL:(id)a3 type:(id)a4 proxyImage:(id)a5 orientation:(int64_t)a6 useEmbeddedPreview:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v24;
  const void **v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  const void **v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  const void **v37;
  void *v38;
  int v39;
  void *v40;
  const void **v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD v55[2];
  uint8_t buf[4];
  const void **v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v7 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    NUAssertLogger_9919();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v42 = dispatch_get_specific(*v26);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = (const void **)v42;
        v58 = 2114;
        v59 = v45;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v26;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v34 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v15 = v14;
  if (!v14)
  {
    NUAssertLogger_9919();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v28 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v26;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v39 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v34)
    {
      v46 = dispatch_get_specific(*v26);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v48 = v46;
      objc_msgSend(v47, "callStackSymbols");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v46;
      v58 = 2114;
      v59 = v49;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if ((NUOrientationIsValid() & 1) == 0)
  {
    NUAssertLogger_9919();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v28 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v41;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v39)
    {
      v50 = dispatch_get_specific(*v26);
      v51 = (void *)MEMORY[0x1E0CB3978];
      v52 = v50;
      objc_msgSend(v51, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (const void **)v50;
      v58 = 2114;
      v59 = v54;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v16 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend(a1, "assetIdentifierForURL:type:useEmbeddedPreview:", v12, v13, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAssetIdentifier:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520B8]), "initWithURL:UTI:", v12, v13);
  objc_msgSend(v18, "setUseEmbeddedPreview:", v7);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52030]), "initWithCIImage:orientation:", v15, a6);
  v20 = objc_alloc(MEMORY[0x1E0D521C0]);
  v55[0] = v18;
  v55[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithSourceDefinitions:", v21);
  objc_msgSend(v16, "setDefinition:", v22);

  return v16;
}

+ (id)imageSourceWithCIImage:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
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
  void *v37;
  uint8_t buf[4];
  const void **v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_9919();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        v39 = (const void **)v28;
        v40 = 2114;
        v41 = v31;
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
      v39 = v17;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  v6 = v5;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    NUAssertLogger_9919();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        v39 = v27;
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
      v39 = (const void **)v32;
      v40 = 2114;
      v41 = v36;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetIdentifier:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52030]), "initWithCIImage:orientation:", v6, a4);
  v11 = objc_alloc(MEMORY[0x1E0D521C0]);
  v37 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithSourceDefinitions:", v12);
  objc_msgSend(v7, "setDefinition:", v13);

  return v7;
}

+ (id)videoSourceWithURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_9919();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2114;
        v29 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v6 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend((id)*MEMORY[0x1E0CEC640], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assetIdentifierForURL:type:useEmbeddedPreview:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssetIdentifier:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D520B8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithURL:UTI:", v5, v10);

  objc_msgSend(v6, "setDefinition:", v11);
  return v6;
}

+ (id)videoSourceWithVideoData:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
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
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoData != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  objc_msgSend(v6, "nu_digest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetIdentifier:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52318]), "initWithVideoData:orientation:", v6, a4);
  objc_msgSend(v7, "setDefinition:", v9);

  return v7;
}

+ (id)livePhotoSourceWithPhotoSource:(id)a3 videoSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  const void **v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  const void **v25;
  void *v26;
  int v27;
  void *v28;
  const void **v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  const void **v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    NUAssertLogger_9919();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "photoSource != nil");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v19 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = (const void **)v30;
        v41 = 2114;
        v42 = v33;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  v7 = v6;
  if (!v6)
  {
    NUAssertLogger_9919();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoSource != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v21 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E0CB3978];
      v36 = v34;
      objc_msgSend(v35, "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = (const void **)v34;
      v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0D522E0]);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "assetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@+%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAssetIdentifier:", v12);

  objc_msgSend(v5, "definition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "definition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D521A8]), "initWithImageSourceDefinition:videoSourceDefinition:", v13, v14);
  objc_msgSend(v8, "setDefinition:", v15);

  return v8;
}

+ (id)photosSchema
{
  return +[PICompositionController photosSchema](PICompositionController, "photosSchema");
}

+ (id)newComposition
{
  void *v2;
  void *v3;

  +[PISchema registeredPhotosSchemaIdentifier](PISchema, "registeredPhotosSchemaIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520F8]), "initWithIdentifier:", v2);

  return v3;
}

+ (id)compositionByRemovingVideoAndLivePhotoAdjustments:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("slomo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("trim"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("livePhotoKeyFrame"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("videoPosterFrame"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("highResFusion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("mute"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("autoLoop"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("videoStabilize"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("videoCrossfadeLoop"));
  return v3;
}

+ (id)newAdjustmentWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_9919();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v20;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52128]), "initWithName:", v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520F0]), "initWithIdentifier:", v5);

  return v6;
}

+ (id)newAdjustmentWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_9919();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v19;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520F0]), "initWithIdentifier:", v3);

  return v5;
}

+ (id)geometryRequestWithComposition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_9919();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v19;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52100]), "initWithComposition:", v3);

  return v5;
}

+ (id)imagePropertiesRequestWithComposition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_9919();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v19;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithComposition:", v3);

  return v5;
}

+ (id)videoPropertiesRequestWithComposition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_9919();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v19;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52330]), "initWithComposition:", v3);

  return v5;
}

+ (id)imageRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4 wideGamut:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (width <= 0.0 || height <= 0.0)
  {
    NUAssertLogger_9919();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "targetSize.width > 0 && targetSize.height > 0");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  objc_msgSend(a1, "_imageRenderRequestWithComposition:wideGamut:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520D0]), "initWithTargetSize:", width, height);
  objc_msgSend(v11, "setScalePolicy:", v12);

  objc_msgSend(v11, "setName:", CFSTR("PIPhotoEditHelper-targetSize-image"));
  return v11;
}

+ (id)imageRenderRequestWithComposition:(id)a3 fillInSize:(CGSize)a4 wideGamut:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
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
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (width <= 0.0 || height <= 0.0)
  {
    NUAssertLogger_9919();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "targetSize.width > 0 && targetSize.height > 0");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        v29 = v23;
        v30 = 2114;
        v31 = v27;
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
      v29 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  objc_msgSend(a1, "_imageRenderRequestWithComposition:wideGamut:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C0]), "initWithTargetSize:", width, height);
  objc_msgSend(v11, "setScalePolicy:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0D522E8]);
  objc_msgSend(v11, "setExtentPolicy:", v13);

  objc_msgSend(v11, "setName:", CFSTR("PIPhotoEditHelper-fillSquare-image"));
  return v11;
}

+ (id)_imageRenderRequestWithComposition:(id)a3 wideGamut:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52130]), "initWithComposition:", v5);
  v8 = objc_alloc_init(MEMORY[0x1E0D520E8]);
  objc_msgSend(v7, "setRegionPolicy:", v8);

  if (a4)
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
  else
    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorSpace:", v9);
  objc_msgSend(v7, "setSampleMode:", 2);
  objc_msgSend(v7, "setName:", CFSTR("PIPhotoEditHelper-basic-image"));

  return v7;
}

+ (CGImage)newCGImageFromImageBuffer:(id)a3
{
  return (CGImage *)objc_msgSend(MEMORY[0x1E0D52168], "newCGImageFromImageBuffer:", a3);
}

+ (id)priorityWithLevel:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", a3);
}

+ (id)videoRenderRequestWithComposition:(id)a3 fitInSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
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
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  height = a4.height;
  width = a4.width;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_9919();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9919();
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
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52338]), "initWithComposition:", v6);
  objc_msgSend(v8, "setColorSpace:", 0);
  objc_msgSend(v8, "setSampleMode:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520D0]), "initWithTargetSize:", width, height);
  objc_msgSend(v8, "setScalePolicy:", v9);

  return v8;
}

+ (BOOL)is3DEffect:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)s_3DEffectNames, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)s_3DEffectNames, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v3);

  }
  return v5;
}

+ (BOOL)isPortraitEffect:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)s_PortraitEffectNames, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)s_PortraitEffectNames, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v3);

  }
  return v5;
}

+ (BOOL)isPortraitStageEffect:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)s_PortraitStageEffectNames, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)s_PortraitStageEffectNames, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v3);

  }
  return v5;
}

+ (BOOL)compositionHasAnyStageEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("depthEffect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (!objc_msgSend(v7, "BOOLValue") || !v6)
    goto LABEL_6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v10)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "isPortraitStageEffect:", v7);
LABEL_6:

LABEL_8:
  return v8;
}

+ (BOOL)areCPVAssetsEditable
{
  void *v2;
  char v3;
  NSObject *v4;
  BOOL result;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[2];
  __int16 v13;

  if (areCPVAssetsEditable_onceToken != -1)
    dispatch_once(&areCPVAssetsEditable_onceToken, &__block_literal_global_9905);
  if ((areCPVAssetsEditable_hasMetalDeviceForPortrait & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "supportsANE");

    if ((v3 & 1) != 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v4 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A6382000, v4, OS_LOG_TYPE_DEFAULT, "CPV assets are editable", v11, 2u);
      }
      return 1;
    }
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
    v6 = *MEMORY[0x1E0D52398];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v10)
    {
      *(_WORD *)buf = 0;
      v8 = "CPV assets aren't editable because the device has no ANE";
      v9 = buf;
      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
    v6 = *MEMORY[0x1E0D52398];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v7)
    {
      v13 = 0;
      v8 = "CPV assets aren't editable because there is no metal device with support for portrait rendering";
      v9 = (uint8_t *)&v13;
LABEL_18:
      _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      return 0;
    }
  }
  return result;
}

+ (BOOL)isAVAssetEditable:(id)a3 reason:(int64_t *)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[8];
  _QWORD v29[5];

  v6 = a3;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__PIPhotoEditHelper_isAVAssetEditable_reason___block_invoke;
  v29[3] = &__block_descriptor_40_e8_v16__0q8l;
  v29[4] = a4;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85C0174](v29);
  if ((objc_msgSend(v6, "isReadable") & 1) != 0)
  {
    if ((objc_msgSend(v6, "isPlayable") & 1) != 0)
    {
      if ((objc_msgSend(v6, "isExportable") & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v6, 0);
        if (!objc_msgSend(v8, "isHDR"))
          goto LABEL_7;
        if ((objc_msgSend(MEMORY[0x1E0D52348], "deviceSupportsHardware10BitHEVCEncoding") & 1) != 0)
        {
          if ((objc_msgSend(MEMORY[0x1E0D52348], "deviceSupportsHighDynamicRangeVideo") & 1) != 0)
          {
LABEL_7:
            v27 = 0;
            v9 = objc_msgSend(MEMORY[0x1E0D52348], "isAVAssetDolbyProfile5:error:", v6, &v27);
            v10 = v27;
            if (v9)
            {
              if (*MEMORY[0x1E0D52390] != -1)
                dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
              v11 = *MEMORY[0x1E0D52398];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A6382000, v11, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because editing not supported on DolbyVision 5", buf, 2u);
              }
              v7[2](v7, 6);
              goto LABEL_35;
            }
            if (+[PICinematicVideoUtilities assetIsCinematicVideo:](PICinematicVideoUtilities, "assetIsCinematicVideo:", v6))
            {
              if (*MEMORY[0x1E0D52390] != -1)
                dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
              v14 = *MEMORY[0x1E0D52398];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A6382000, v14, OS_LOG_TYPE_DEFAULT, "CPV asset checking for editability", buf, 2u);
              }
              if (objc_msgSend(MEMORY[0x1E0D52348], "isAssetUnsupportedLegacyPortraitVideo:", v6))
              {
                NULogger_9891();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because it's in a legacy, unsupported format", buf, 2u);
                }

                v7[2](v7, 7);
                goto LABEL_35;
              }
              +[PIGlobalSettings editSettings](PIGlobalSettings, "editSettings");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKey:", CFSTR("overrideVideoEditability"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v19, "BOOLValue");

              if (v12)
              {
                NULogger_9891();
                v20 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
LABEL_41:

LABEL_56:
                  goto LABEL_36;
                }
                *(_WORD *)buf = 0;
                v21 = "CPV asset editable due to override";
LABEL_40:
                _os_log_impl(&dword_1A6382000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
                goto LABEL_41;
              }
              if ((objc_msgSend(a1, "areCPVAssetsEditable") & 1) == 0)
              {
                NULogger_9891();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A6382000, v25, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because CPV assets are not editable on this device", buf, 2u);
                }

                v7[2](v7, 8);
                goto LABEL_56;
              }
              objc_msgSend(MEMORY[0x1E0D75128], "capabilitiesForCurrentDevice");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "decodingSupportForAVAsset:", v6);

              if (v23 != 2)
              {
                NULogger_9891();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A6382000, v26, OS_LOG_TYPE_DEFAULT, "CPV asset not editable because this asset is not playable on this device", buf, 2u);
                }

                v7[2](v7, 9);
                goto LABEL_56;
              }
              if (!objc_msgSend(MEMORY[0x1E0D52348], "deviceSupportsHardware10BitHEVCEncoding")
                || (objc_msgSend(MEMORY[0x1E0D52348], "deviceSupportsHighDynamicRangeVideo") & 1) == 0)
              {
                NULogger_9891();
                v20 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_41;
                *(_WORD *)buf = 0;
                v21 = "CPV asset not editable because this device doesn't support HDR";
                goto LABEL_40;
              }
              NULogger_9891();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_DEFAULT, "CPV asset is editable", buf, 2u);
              }

            }
            LOBYTE(v12) = 1;
            goto LABEL_36;
          }
          NULogger_9891();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6382000, v17, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because this device doesn't support HDR", buf, 2u);
          }

        }
        else
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
          v16 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6382000, v16, OS_LOG_TYPE_DEFAULT, "HDR asset not editable because this device doesn't support 10-bit HEVC encoding", buf, 2u);
          }
        }
        v7[2](v7, 5);
        v10 = 0;
LABEL_35:
        LOBYTE(v12) = 0;
LABEL_36:

        goto LABEL_17;
      }
      v7[2](v7, 4);
    }
    else
    {
      v7[2](v7, 3);
    }
  }
  else
  {
    v7[2](v7, 2);
  }
  LOBYTE(v12) = 0;
LABEL_17:

  return v12;
}

+ (id)effectNameForFilterName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  char v11;
  void *v12;

  v4 = a3;
  objc_msgSend((id)s_3DEffectNames, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
    goto LABEL_4;
  objc_msgSend((id)s_PortraitEffectNames, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
  {

LABEL_4:
LABEL_5:
    v7 = v4;
    goto LABEL_6;
  }
  objc_msgSend((id)s_effectNames, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v4);

  if ((v11 & 1) != 0)
    goto LABEL_5;
  if (objc_msgSend(a1, "is3DEffect:", v4))
  {
    v12 = (void *)s_3DEffectNames;
  }
  else if (objc_msgSend(a1, "isPortraitEffect:", v4))
  {
    v12 = (void *)s_PortraitEffectNames;
  }
  else
  {
    v12 = (void *)s_effectNames;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v7;

  return v8;
}

+ (id)filterNameForEffectName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9886;
  v30 = __Block_byref_object_dispose__9887;
  v31 = 0;
  objc_msgSend((id)s_3DEffectNames, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
    goto LABEL_4;
  objc_msgSend((id)s_PortraitEffectNames, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
  {

LABEL_4:
LABEL_5:
    v7 = v27;
    v8 = v4;
    v9 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
    goto LABEL_6;
  }
  objc_msgSend((id)s_effectNames, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  if ((v13 & 1) != 0)
    goto LABEL_5;
  if (objc_msgSend(a1, "is3DEffect:", v4))
  {
    v14 = (void *)s_3DEffectNames;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke;
    v23[3] = &unk_1E50172A8;
    v24 = v4;
    v25 = &v26;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);
    v9 = v24;
  }
  else if (objc_msgSend(a1, "isPortraitEffect:", v4))
  {
    v15 = (void *)s_PortraitEffectNames;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_2;
    v20[3] = &unk_1E50172A8;
    v21 = v4;
    v22 = &v26;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
    v9 = v21;
  }
  else
  {
    v16 = (void *)s_effectNames;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_3;
    v17[3] = &unk_1E50172A8;
    v18 = v4;
    v19 = &v26;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v17);
    v9 = v18;
  }
LABEL_6:

  v10 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v10;
}

+ (id)pipelineFiltersForCropping
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[PIPipelineFilters iosCropToolFilter](PIPipelineFilters, "iosCropToolFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pipelineFiltersForOriginalGeometry
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[PIPipelineFilters noGeometryFilter](PIPipelineFilters, "noGeometryFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pipelineFiltersForShowingOriginal
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "pipelineFiltersForShowingOriginalWithGeometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[PIPipelineFilters noCropFilter](PIPipelineFilters, "noCropFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

+ (id)pipelineFiltersForShowingOriginalWithGeometry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_220);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_225);
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/ShowOriginalSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = v3;
  v7[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pipelineFiltersForRAWShowingOriginalWithGeometry
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_232);
  +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)newCompositionControllerWithComposition:(id)a3
{
  id v3;
  PICompositionController *v4;

  v3 = a3;
  v4 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v3);

  return v4;
}

+ (id)adjustmentConstants
{
  if (adjustmentConstants_once != -1)
    dispatch_once(&adjustmentConstants_once, &__block_literal_global_233);
  return (id)adjustmentConstants_adjustmentConstants;
}

+ (void)handlePIGlobalSettings:(id)a3
{
  PIDepthAdjustmentController *v3;
  void *v4;
  void *v5;
  PIDepthAdjustmentController *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PIPortraitAdjustmentController *v11;
  void *v12;
  PIPortraitAdjustmentController *v13;
  uint64_t v14;
  void *v15;
  int v16;
  PIPortraitAdjustmentController *v17;
  void *v18;
  id v19;

  v19 = a3;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v3 = (PIDepthAdjustmentController *)objc_claimAutoreleasedReturnValue();
  if (-[PIDepthAdjustmentController forceGlassesMatteOff](v3, "forceGlassesMatteOff"))
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("depthEffect"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v19;
    if (!v4)
      goto LABEL_5;
    v6 = [PIDepthAdjustmentController alloc];
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("depthEffect"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PIDepthAdjustmentController initWithAdjustment:](v6, "initWithAdjustment:", v7);

    -[PIDepthAdjustmentController setGlassesMatteAllowed:](v3, "setGlassesMatteAllowed:", MEMORY[0x1E0C9AAA0]);
  }

  v5 = v19;
LABEL_5:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "forceSpillMatteOff");

    if (v10)
    {
      v11 = [PIPortraitAdjustmentController alloc];
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PIPortraitAdjustmentController initWithAdjustment:](v11, "initWithAdjustment:", v12);

      v14 = MEMORY[0x1E0C9AAA0];
LABEL_10:
      -[PIPortraitAdjustmentController setSpillMatteAllowed:](v13, "setSpillMatteAllowed:", v14);

      goto LABEL_11;
    }
    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "allowSpillMatteOnOlderPortraitV2Captures");

    if (v16)
    {
      v17 = [PIPortraitAdjustmentController alloc];
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PIPortraitAdjustmentController initWithAdjustment:](v17, "initWithAdjustment:", v18);

      v14 = MEMORY[0x1E0C9AAB0];
      goto LABEL_10;
    }
  }
LABEL_11:

}

+ (id)validatedCompositionCopyForComposition:(id)a3 mediaType:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v63;
  id v64;
  id v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CMTime v71;
  CMTime buf;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PIPhotoEditHelper.m"), 719, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition"));

  }
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(a1, "adjustmentConstants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PIAutoLoopAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("recipe"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v13 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6382000, v13, OS_LOG_TYPE_INFO, "validation issue: recipe is blank on the autoloop adjustment", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v9, "PIAutoLoopAdjustmentKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v14);

      v11 = 0;
    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flavor"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v11 && !v15)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
    v17 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1A6382000, v17, OS_LOG_TYPE_INFO, "validation issue: no flavor specified on the autoloop adjustment", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(v9, "PIAutoLoopAdjustmentKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v18);

    v11 = 0;
LABEL_17:
    v66 = 1;
    if (!a4)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (a4 != 3 || !v11)
    goto LABEL_17;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("enabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  v21 = CFSTR("AutoLoop");
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AutoLoop")) & 1) == 0)
  {
    v22 = CFSTR("Mirror");
    v23 = objc_msgSend(v16, "isEqualToString:", CFSTR("Mirror"));

    if ((v23 & v20 & 1) == 0)
      goto LABEL_23;
LABEL_26:
    v66 = 0;
    a4 = 2;
    goto LABEL_27;
  }

  if ((v20 & 1) != 0)
    goto LABEL_26;
LABEL_23:
  if (objc_msgSend(v8, "mediaType") != 2)
  {
    v66 = 1;
    goto LABEL_28;
  }
  v66 = 1;
  a4 = 3;
LABEL_27:
  objc_msgSend(v8, "setMediaType:", a4);
LABEL_28:
  objc_msgSend(v9, "PIRedEyeAdjustmentKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v27 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6382000, v27, OS_LOG_TYPE_INFO, "validation issue: Missing inputCorrectionInfo on a redeye adjustment", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v9, "PIRedEyeAdjustmentKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v28);

    }
  }
  objc_msgSend(v9, "PIDepthAdjustmentKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v30;
  if (v30)
  {
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("depthInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v37 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6382000, v37, OS_LOG_TYPE_INFO, "validation issue: Missing depthInfo on a depth adjustment", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v9, "PIDepthAdjustmentKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v33);
      goto LABEL_47;
    }
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("aperture"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("depthInfo"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("aperture"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = &unk_1E5051D58;
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, CFSTR("aperture"));

LABEL_47:
    }
  }
  v67 = v25;
  v69 = v11;
  objc_msgSend(v9, "PIPortraitAdjustmentKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("portraitInfo"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v41 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6382000, v41, OS_LOG_TYPE_INFO, "validation issue: Missing portraitInfo on a portrait adjustment", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v9, "PIPortraitAdjustmentKey");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v42);

    }
  }
  v68 = v16;
  objc_msgSend(v9, "PITrimAdjustmentKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v64 = a1;
    v65 = v7;
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("start"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("end"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("startScale"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("endScale"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("enabled"));
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v49;
    if (!v45
      || !v46
      || !v47
      || !v48
      || !v49
      || (memset(&buf, 0, sizeof(buf)),
          CMTimeMake(&buf, objc_msgSend(v45, "longLongValue"), objc_msgSend(v47, "intValue")),
          memset(&v71, 0, sizeof(v71)),
          CMTimeMake(&v71, objc_msgSend(v46, "longLongValue"), objc_msgSend(v48, "intValue")),
          (buf.flags & 1) == 0)
      || (v71.flags & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
      v51 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6382000, v51, OS_LOG_TYPE_INFO, "validation issue: invalid trim startTime or endTime", (uint8_t *)&buf, 2u);
      }
      objc_msgSend(v9, "PITrimAdjustmentKey");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v52);

    }
    a1 = v64;
    v7 = v65;
  }
  objc_msgSend(v9, "PIMuteAdjustmentKey");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v53);
  v54 = (id)objc_claimAutoreleasedReturnValue();

  if (v54)
    v55 = 1;
  else
    v55 = v66;
  if ((v55 & 1) == 0)
  {
    objc_msgSend(a1, "photosSchema");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "contents");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "PIMuteAdjustmentKey");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKeyedSubscript:", v58);
    v59 = a1;
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = +[PIPhotoEditHelper newAdjustmentWithIdentifier:](PIPhotoEditHelper, "newAdjustmentWithIdentifier:", v60);
    objc_msgSend(v54, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
    objc_msgSend(v9, "PIMuteAdjustmentKey");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, v61);

    a1 = v59;
  }
  objc_msgSend(a1, "handlePIGlobalSettings:", v8);

  return v8;
}

+ (id)geometryBasedAdjustmentIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  +[PIPhotoEditHelper adjustmentConstants](PIPhotoEditHelper, "adjustmentConstants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PICropAdjustmentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PIOrientationAdjustmentKey", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(v2, "PIRetouchAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(v2, "PIRedEyeAdjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(v2, "PIHighResFusionAdjustmentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)knownFormatsVersionsMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v20 = (void *)MEMORY[0x1E0C99E60];
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 0, 1, 0, CFSTR("iOS"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 0, 2, 0, CFSTR("iOS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 0, 1, 0, CFSTR("OSX"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 0, 2, 0, CFSTR("OSX"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 2, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 3, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 4, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 5, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 5, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 6, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 7, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 8, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 9, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 9, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 10, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 11, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 12, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithObjects:", v19, v27, v26, v25, v24, v18, v23, v22, v16, v17, v15, v14, v2, v3, v4, v5, v6,
    v7,
    0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditAdjustmentsVersion versionWithMajor:minor:subMinor:platform:](PIPhotoEditAdjustmentsVersion, "versionWithMajor:minor:subMinor:platform:", 1, 1, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObjects:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = CFSTR("com.apple.photo");
  v28[1] = CFSTR("com.apple.livephoto");
  v29[0] = v21;
  v29[1] = v21;
  v28[2] = CFSTR("com.apple.video");
  v28[3] = CFSTR("com.apple.video.slomo");
  v29[2] = v11;
  v29[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)canInterpretDataWithFormatIdentifier:(id)a3 formatVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  int v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "knownFormatsVersionsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v7 && v9)
  {
    +[PIPhotoEditAdjustmentsVersion versionFromString:](PIPhotoEditAdjustmentsVersion, "versionFromString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v11);

  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
  v12 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("No");
    v16 = 138544130;
    v17 = v6;
    if (v9)
      v14 = CFSTR("Yes");
    else
      v14 = CFSTR("No");
    v19 = v14;
    v18 = 2112;
    if (v10)
      v13 = CFSTR("Yes");
    v20 = 2114;
    v21 = v7;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_INFO, "Can PLPhotoEditPFDataConverter interpret identifier %{public}@? %@. Version %{public}@? %@", (uint8_t *)&v16, 0x2Au);
  }
  if (!v9)
    LOBYTE(v10) = 0;

  return v10;
}

+ (BOOL)updateCropAdjustmentControllerFor:(id)a3 beforeCompositionController:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PICompositionController *v11;

  v7 = a3;
  objc_msgSend(a4, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PICropAutoCalculator updateCropAdjustment:after:error:](PICropAutoCalculator, "updateCropAdjustment:after:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v10);
    -[PICompositionController setImageOrientation:](v11, "setImageOrientation:", objc_msgSend(v7, "imageOrientation"));
    objc_msgSend(v7, "applyChangesFromCompositionController:", v11);

  }
  return v10 != 0;
}

+ (void)preheatEditDependencies
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SkipShaderPrewarm"));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visionSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForPerformingRequests:error:", v7, 0);

  }
}

+ (id)rawAdjustmentWithRawImageProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52128]), "initWithName:", CFSTR("RAW"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520F0]), "initWithIdentifier:", v4);
  objc_msgSend(v3, "availableDecoderVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("inputDecoderVersion"));

  +[PIFakeBoost boostParametersFromRawProperties:](PIFakeBoost, "boostParametersFromRawProperties:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PIFakeBoost currentVersion](PIFakeBoost, "currentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("boostVersion"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("boostParams"));
  }
  +[PIGainMap gainMapParametersFromRawProperties:](PIGainMap, "gainMapParametersFromRawProperties:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[PIGainMap currentVersion](PIGainMap, "currentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("gainMapVersion"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("gainMapParameters"));
  }

  return v5;
}

+ (id)stringForAutoLoopFlavor:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("AutoLoop");
  else
    return off_1E5019E30[a3];
}

void __40__PIPhotoEditHelper_adjustmentConstants__block_invoke()
{
  PIAdjustmentConstants *v0;
  void *v1;

  v0 = objc_alloc_init(PIAdjustmentConstants);
  v1 = (void *)adjustmentConstants_adjustmentConstants;
  adjustmentConstants_adjustmentConstants = (uint64_t)v0;

}

id __69__PIPhotoEditHelper_pipelineFiltersForRAWShowingOriginalWithGeometry__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;

  v7 = a2;
  objc_msgSend(v7, "resetTag:input:", CFSTR("/pre-Geometry"), a4);
  objc_msgSend(v7, "getTagWithPath:error:", CFSTR("/post-Geometry"), a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __66__PIPhotoEditHelper_pipelineFiltersForShowingOriginalWithGeometry__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "resetTag:input:", CFSTR("/pre-Trim"), v7);
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/Trim"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __66__PIPhotoEditHelper_pipelineFiltersForShowingOriginalWithGeometry__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a2;
  objc_msgSend(v8, "resetTag:input:", CFSTR("/pre-Geometry"), v7);
  objc_msgSend(v8, "getTagWithPath:error:", CFSTR("/post-Geometry"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __45__PIPhotoEditHelper_filterNameForEffectName___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __46__PIPhotoEditHelper_isAVAssetEditable_reason___block_invoke(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

void __41__PIPhotoEditHelper_areCPVAssetsEditable__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  const char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  _BYTE v20[128];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v0 = MTLCreateSystemDefaultDevice();
  v1 = v0;
  if (v0)
  {
    v21[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(MEMORY[0x1E0D7F580], "isMetalDeviceSupported:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10))
        {
          areCPVAssetsEditable_hasMetalDeviceForPortrait = 1;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
  v8 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    if (areCPVAssetsEditable_hasMetalDeviceForPortrait)
      v9 = "Yes";
    else
      v9 = "No";
    v15 = "No";
    v16 = 2080;
    v17 = v9;
    v18 = 2080;
    v19 = "Yes";
    _os_log_impl(&dword_1A6382000, v8, OS_LOG_TYPE_DEFAULT, "CPV asset editability: onAppleSilicon: %s, hasMetalDeviceForPortrait: %s, oniOS: %s", buf, 0x20u);
  }

}

@end
