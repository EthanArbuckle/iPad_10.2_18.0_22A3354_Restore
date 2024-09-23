@implementation PIDepthEffectApertureAutoCalculator

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  _QWORD v26[4];
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_20449();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
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
        v30 = v21;
        v31 = 2114;
        v32 = v25;
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
      v30 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0D52180]);
  -[NURenderRequest composition](self, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComposition:", v7);

  -[NURenderRequest responseQueue](self, "responseQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponseQueue:", v9);

  objc_msgSend(v8, "setName:", CFSTR("PIDepthEffectApertureAutoCalculator-getValuesAtCapture-imageProperties"));
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("pre-Adjustments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v11);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46__PIDepthEffectApertureAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5019A68;
  v27 = v5;
  v12 = v5;
  objc_msgSend(v8, "submit:", v26);

}

void __46__PIDepthEffectApertureAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  objc_msgSend(a2, "result:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[PIValuesAtCapture valuesAtCaptureFromImageProperties:error:](PIValuesAtCapture, "valuesAtCaptureFromImageProperties:error:", v5, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (v6)
    {
      v18 = CFSTR("aperture");
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "aperture");
      objc_msgSend(v8, "numberWithFloat:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(_QWORD *)(a1 + 32);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v10);
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
    else
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = objc_alloc(MEMORY[0x1E0D522A0]);
      v10 = (void *)objc_msgSend(v15, "initWithResult:", MEMORY[0x1E0C9AA70]);
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v10);
    }

    v4 = v7;
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }

}

@end
