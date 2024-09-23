@implementation PISemanticStyleAutoCalculator

- (void)submit:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const void **v11;
  void *specific;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_1092();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v10;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1092();
    v5 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v11);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2114;
        v26 = v20;
        _os_log_error_impl(&dword_1A6382000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v15;
      _os_log_error_impl(&dword_1A6382000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_17:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_26);
    goto LABEL_5;
  }
  v5 = (uint64_t)v4;
  if ((PISemanticStyleIsRenderSupported() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __40__PISemanticStyleAutoCalculator_submit___block_invoke;
    v21[3] = &unk_1E5019E90;
    v21[4] = self;
    v22 = (id)v5;
    objc_msgSend(v6, "submit:", v21);

    goto LABEL_8;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_17;
LABEL_5:
  v7 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_INFO, "PISemanticStyleAutoCalculator Styles not supported on the current platform", buf, 2u);
  }
  v8 = objc_alloc(MEMORY[0x1E0D522A0]);
  v6 = (void *)objc_msgSend(v8, "initWithResult:", MEMORY[0x1E0C9AA70]);
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_8:

}

- (id)_resultFromImageProperties:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *specific;
  const void **v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  const void **v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  const void **v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_1092();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "properties != nil");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1092();
    v4 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        specific = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = specific;
        objc_msgSend(v14, "callStackSymbols");
        v7 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = (const void **)specific;
        v19 = 2114;
        v20 = v16;
        _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v7 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_21;
  }
  v4 = v3;
  if (objc_msgSend((id)objc_opt_class(), "isStylableFromImageProperties:", v3))
  {
    -[NSObject metadata](v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    specific = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(specific, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D10]);
    v7 = (const void **)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        PISemanticStyleSettingsFromMakerNoteProperties(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
    }
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_8:
      v9 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v7;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Invalid MakerNote SmartStyle dictionary: %{public}@, ignored", buf, 0xCu);
      }
      v8 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_11;
    }
LABEL_21:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_26);
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x1E0C9AA70];
LABEL_12:

  return v8;
}

- (id)submitSynchronous:(id *)a3
{
  void *v5;
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
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1092();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1092();
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
        v26 = v19;
        v27 = 2114;
        v28 = v23;
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
      v26 = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", self);
  v24 = 0;
  objc_msgSend(v5, "submitSynchronous:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  objc_msgSend(v6, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PISemanticStyleAutoCalculator _resultFromImageProperties:](self, "_resultFromImageProperties:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 9, CFSTR("Properties request failed"), 0, v7);
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __40__PISemanticStyleAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  objc_msgSend(v3, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_resultFromImageProperties:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v6);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 9, CFSTR("Properties request failed"), 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v6);
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8);
  }

}

+ (BOOL)isStylableFromImageProperties:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D52108], "shouldEnableStylesForProRaw")
    && (objc_msgSend(v3, "rawProperties"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "semanticStyleProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

+ (BOOL)canRenderStylesOnComposition:(id)a3
{
  PISemanticStyleAutoCalculator *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  PISemanticStyleAutoCalculator *specific;
  const void **v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v12;
  PISemanticStyleAutoCalculator *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  PISemanticStyleAutoCalculator *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_1092();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v13 = (PISemanticStyleAutoCalculator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = (PISemanticStyleAutoCalculator *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_1092();
    v6 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        specific = (PISemanticStyleAutoCalculator *)dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v3 = specific;
        objc_msgSend(v15, "callStackSymbols");
        v8 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = specific;
        v19 = 2114;
        v20 = v4;
        _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (PISemanticStyleAutoCalculator *)objc_claimAutoreleasedReturnValue();
      -[PISemanticStyleAutoCalculator componentsJoinedByString:](specific, "componentsJoinedByString:", CFSTR("\n"));
      v8 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = (PISemanticStyleAutoCalculator *)v8;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_18:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_26);
LABEL_7:
    v10 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = (PISemanticStyleAutoCalculator *)v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "PISemanticStyleAutoCalculator - error: %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v6 = v5;
  specific = -[NURenderRequest initWithComposition:]([PISemanticStyleAutoCalculator alloc], "initWithComposition:", v5);
  v16 = 0;
  -[PISemanticStyleAutoCalculator submitSynchronous:](specific, "submitSynchronous:", &v16);
  v3 = (PISemanticStyleAutoCalculator *)objc_claimAutoreleasedReturnValue();
  v8 = (const void **)v16;
  v4 = (void *)-[PISemanticStyleAutoCalculator count](v3, "count");
  if (v4)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_9:

  return v4 != 0;
}

@end
