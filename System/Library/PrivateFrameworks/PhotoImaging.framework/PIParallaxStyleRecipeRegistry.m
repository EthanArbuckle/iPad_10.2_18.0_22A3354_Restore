@implementation PIParallaxStyleRecipeRegistry

+ (NSArray)supportedIdentifiers
{
  return (NSArray *)&unk_1E5058D40;
}

+ (id)recipeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PIParallaxStyleRecipeRegistry_recipeForIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recipeForIdentifier__onceToken != -1)
    dispatch_once(&recipeForIdentifier__onceToken, block);
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useStyleRecipeConfigDirectory");

  if (!v6
    || (objc_msgSend((id)recipeForIdentifier__sUserRegistry, "objectForKeyedSubscript:", v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend((id)recipeForIdentifier__sBundleRegistry, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_recipesForIdentifiers:(id)a3 withURLProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  id v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v9 = 138412546;
    v23 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        objc_msgSend(v6, "urlForIdentifier:", v13, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v7, "isReadableFileAtPath:", v15);

        if (v16)
        {
          v26 = 0;
          +[PIParallaxStyleRecipeArchiver unarchivedStyleRecipeWithURL:error:](PIParallaxStyleRecipeArchiver, "unarchivedStyleRecipeWithURL:error:", v14, &v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v26;
          if (v17)
          {
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, v13);
          }
          else
          {
            if (*MEMORY[0x1E0D52390] != -1)
              dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_101);
            v20 = *MEMORY[0x1E0D52398];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v32 = v13;
              v33 = 2112;
              v34 = v18;
              _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Failed to load style recipe for identifier '%@', error: %@", buf, 0x16u);
            }
          }

        }
        else
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_101);
          v19 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v32 = v14;
            _os_log_impl(&dword_1A6382000, v19, OS_LOG_TYPE_INFO, "Missing configuration file '%{private}@'", buf, 0xCu);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v10);
  }

  v21 = (void *)objc_msgSend(v24, "copy");
  return v21;
}

void __53__PIParallaxStyleRecipeRegistry_recipeForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  PIParallaxStyleBundleURLProvider *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PIParallaxStyleUserURLProvider *v11;
  uint64_t v12;
  void *v13;
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
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "supportedIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PIParallaxStyleBundleURLProvider);
  objc_msgSend(*(id *)(a1 + 32), "_recipesForIdentifiers:withURLProvider:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)recipeForIdentifier__sBundleRegistry;
  recipeForIdentifier__sBundleRegistry = v4;

  v6 = objc_msgSend((id)recipeForIdentifier__sBundleRegistry, "count");
  if (v6 != objc_msgSend(v2, "count"))
  {
    NUAssertLogger_2965();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The bundle should contain recipes for all known identifiers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v27, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2965();
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
        v27 = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v27, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v27, 0xCu);

    }
    _NUAssertFailHandler();
  }
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleRecipeConfigDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_101);
    v9 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v27 = 138543362;
      v28 = v8;
      _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_INFO, "Using recipe directory at '%{public}@'", (uint8_t *)&v27, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PIParallaxStyleUserURLProvider initWithBaseURL:]([PIParallaxStyleUserURLProvider alloc], "initWithBaseURL:", v10);
    objc_msgSend(*(id *)(a1 + 32), "_recipesForIdentifiers:withURLProvider:", v2, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)recipeForIdentifier__sUserRegistry;
    recipeForIdentifier__sUserRegistry = v12;

  }
}

@end
