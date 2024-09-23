@implementation PILevelsAutoCalculator

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  _QWORD v27[5];
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_15623();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15623();
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
        v31 = v22;
        v32 = 2114;
        v33 = v26;
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
      v31 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52120]), "initWithRequest:", self);
  objc_msgSend(v6, "setName:", CFSTR("PILevelsAutoCalculator-histogram"));
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Levels"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  +[PIPipelineFilters histogramOptimizationFilter](PIPipelineFilters, "histogramOptimizationFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPipelineFilters:", v9);

  objc_msgSend(v6, "setSampleMode:", 2);
  objc_msgSend(v6, "histogramCalculationColorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v11);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHistogramCalculationColorSpace:", v12);

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __33__PILevelsAutoCalculator_submit___block_invoke;
  v27[3] = &unk_1E5019E90;
  v27[4] = self;
  v28 = v5;
  v13 = v5;
  objc_msgSend(v6, "submit:", v27);

}

- (id)calculateSettingsForImageHistogram:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
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
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_15611);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_15611);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_15611);
  }
}

- (id)calculateSettingsForSingleChannelHistogram:(id)a3 suffix:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[10];
  _QWORD v30[12];

  v30[10] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "percentile:", 0.001);
  v8 = v7;
  objc_msgSend(v6, "percentile:", 0.999);
  v10 = v9;

  v11 = (v8 + v10) * 0.5;
  objc_msgSend(CFSTR("blackSrc"), "stringByAppendingString:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  objc_msgSend(CFSTR("blackDst"), "stringByAppendingString:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v26;
  v30[1] = &unk_1E5051F18;
  objc_msgSend(CFSTR("shadowSrc"), "stringByAppendingString:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v8 + v11) * 0.5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  objc_msgSend(CFSTR("shadowDst"), "stringByAppendingString:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v23;
  v30[3] = &unk_1E5051F28;
  objc_msgSend(CFSTR("midSrc"), "stringByAppendingString:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v13;
  objc_msgSend(CFSTR("midDst"), "stringByAppendingString:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v14;
  v30[5] = &unk_1E5051F38;
  objc_msgSend(CFSTR("hilightSrc"), "stringByAppendingString:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v10 + v11) * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v16;
  objc_msgSend(CFSTR("hilightDst"), "stringByAppendingString:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v17;
  v30[7] = &unk_1E5051F48;
  objc_msgSend(CFSTR("whiteSrc"), "stringByAppendingString:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v19;
  objc_msgSend(CFSTR("whiteDst"), "stringByAppendingString:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v29[9] = v20;
  v30[9] = &unk_1E5051F58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __33__PILevelsAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(v3, "histogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D522A0]);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "calculateSettingsForImageHistogram:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithResult:", v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
