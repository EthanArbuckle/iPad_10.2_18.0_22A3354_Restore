@implementation PICurvesAutoCalculator

+ (id)dictionariesFromPoints:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v22[0] = CFSTR("x");
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "x");
        objc_msgSend(v10, "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v11;
        v22[1] = CFSTR("y");
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "y");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v13;
        v22[2] = CFSTR("editable");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isEditable"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v15);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_defaultCurveArray
{
  if (_defaultCurveArray_onceToken != -1)
    dispatch_once(&_defaultCurveArray_onceToken, &__block_literal_global_21843);
  return (id)_defaultCurveArray_defaultCurveArray;
}

+ (id)autoValuesForBlackPoint:(double)a3 whitePoint:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  PICurveControlPoint *v9;
  double v10;
  PICurveControlPoint *v11;
  void *v12;
  PICurveControlPoint *v13;
  double v14;
  PICurveControlPoint *v15;
  void *v16;

  objc_msgSend(a1, "_defaultCurveArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PICurveControlPoint alloc];
  objc_msgSend(v8, "y");
  v11 = -[PICurveControlPoint initWithX:y:editable:](v9, "initWithX:y:editable:", objc_msgSend(v8, "isEditable"), a3, v10);

  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", 1, v11);
  objc_msgSend(v7, "objectAtIndex:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PICurveControlPoint alloc];
  objc_msgSend(v12, "y");
  v15 = -[PICurveControlPoint initWithX:y:editable:](v13, "initWithX:y:editable:", objc_msgSend(v12, "isEditable"), a4, v14);

  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", 2, v15);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __44__PICurvesAutoCalculator__defaultCurveArray__block_invoke()
{
  PICurveControlPoint *v0;
  PICurveControlPoint *v1;
  PICurveControlPoint *v2;
  PICurveControlPoint *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 0, 0.0, 0.0);
  objc_msgSend(v6, "addObject:", v0);

  v1 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 0, 0.0, 0.0);
  objc_msgSend(v6, "addObject:", v1);

  v2 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 0, 1.0, 1.0);
  objc_msgSend(v6, "addObject:", v2);

  v3 = -[PICurveControlPoint initWithX:y:editable:]([PICurveControlPoint alloc], "initWithX:y:editable:", 0, 2.0, 2.0);
  objc_msgSend(v6, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_defaultCurveArray_defaultCurveArray;
  _defaultCurveArray_defaultCurveArray = v4;

}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  _QWORD v30[5];
  id v31;
  _OWORD v32[4];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_21877();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21877();
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
        v35 = v25;
        v36 = 2114;
        v37 = v29;
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
      v35 = v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52120]), "initWithRequest:", self);
  v7 = objc_alloc_init(MEMORY[0x1E0D52118]);
  v8 = *(_OWORD *)(MEMORY[0x1E0D51D50] + 16);
  v32[0] = *MEMORY[0x1E0D51D50];
  v32[1] = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0D51D50] + 48);
  v32[2] = *(_OWORD *)(MEMORY[0x1E0D51D50] + 32);
  v32[3] = v9;
  objc_msgSend(v7, "setColorMatrix:", v32);
  objc_msgSend(v6, "setParameters:", v7);
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Curves"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  +[PIPipelineFilters histogramOptimizationFilter](PIPipelineFilters, "histogramOptimizationFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPipelineFilters:", v12);

  objc_msgSend(v6, "setSampleMode:", 2);
  objc_msgSend(v6, "histogramCalculationColorSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v13, "isEqual:", v14);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHistogramCalculationColorSpace:", v15);

  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __33__PICurvesAutoCalculator_submit___block_invoke;
  v30[3] = &unk_1E5019E90;
  v30[4] = self;
  v31 = v5;
  v16 = v5;
  objc_msgSend(v6, "submit:", v30);

}

- (id)computeCurvesForImageHistogram:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_96);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_96);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_96);
  }
}

void __33__PICurvesAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_msgSend(v3, "histogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "computeCurvesForImageHistogram:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
