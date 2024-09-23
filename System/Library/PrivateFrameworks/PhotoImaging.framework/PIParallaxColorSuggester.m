@implementation PIParallaxColorSuggester

- (PIParallaxColorSuggester)init
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_42);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_42);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_42);
  }
}

- (PIParallaxColorSuggester)initWithColorAnalysis:(id)a3
{
  id v4;
  void *v5;
  PIParallaxColorSuggester *v6;
  NURuleSystem *v7;
  NURuleSystem *system;
  NURuleSystem *v9;
  void *v10;
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
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_3661();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "analysis != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3661();
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
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)PIParallaxColorSuggester;
  v6 = -[PIParallaxColorSuggester init](&v25, sel_init);
  v7 = (NURuleSystem *)objc_alloc_init(MEMORY[0x1E0D522B0]);
  system = v6->_system;
  v6->_system = v7;

  v9 = v6->_system;
  v26 = CFSTR("colorAnalysis");
  v27 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURuleSystem setConstants:](v9, "setConstants:", v10);

  return v6;
}

- (id)suggestedColorForColor:(id)a3
{
  id v4;
  void *v5;
  NURuleSystem *system;
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
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_3661();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "color != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3661();
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
        v27 = v19;
        v28 = 2114;
        v29 = v23;
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
      v27 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  system = self->_system;
  v24[0] = CFSTR("inputColor");
  v24[1] = CFSTR("outputColor");
  v25[0] = v4;
  v25[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURuleSystem resetAndEvaluateWithInitialState:](system, "resetAndEvaluateWithInitialState:", v7);

  -[NURuleSystem state](self->_system, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outputColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addRuleWithHueMin:(double)a3 hueMax:(double)a4 suggestion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
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
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3 > a4)
  {
    NUAssertLogger_3661();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "hueMin <= hueMax");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3661();
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
  v9 = (void *)MEMORY[0x1E0D522A8];
  v26 = v8;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke;
  v27[3] = &__block_descriptor_48_e22_B16__0__NURuleSystem_8l;
  *(double *)&v27[4] = a3;
  *(double *)&v27[5] = a4;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke_2;
  v25[3] = &unk_1E5015DA8;
  v10 = v8;
  objc_msgSend(v9, "ruleWithBlockPredicate:action:", v27, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURuleSystem addRule:](self->_system, "addRule:", v11);

}

- (id)suggestedColorsForColors:(id)a3 fromColorPalette:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_3661();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colors != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3661();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific(*v25);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2114;
        v44 = v35;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v30;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        -[PIParallaxColorSuggester suggestedColorForColor:](self, "suggestedColorForColor:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "suggestionForColor:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "primaryColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v17) & 1) == 0)
          objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  if ((PFExists() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D75170], "warmColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paletteColorForColor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v19);
  }
  if ((PFExists() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D75170], "coolColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paletteColorForColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v21);
  }

  return v9;
}

- (NURuleSystem)system
{
  return self->_system;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
}

uint64_t __70__PIParallaxColorSuggester_suggestedColorsForColors_fromColorPalette___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCool");
}

uint64_t __70__PIParallaxColorSuggester_suggestedColorsForColors_fromColorPalette___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWarm");
}

BOOL __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  objc_msgSend(a2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hue");
  v5 = *(double *)(a1 + 32);
  v6 = *(double *)(a1 + 40);
  v8 = fmod(v7 - v5, 360.0);
  if (v8 < 0.0)
    v8 = v8 + 360.0;
  v9 = v8 < v6 - v5;

  return v9;
}

void __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputColor"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("colorAnalysis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateObject:forKey:", v7, CFSTR("outputColor"));

}

@end
