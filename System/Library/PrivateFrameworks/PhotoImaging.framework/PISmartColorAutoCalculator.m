@implementation PISmartColorAutoCalculator

- (id)submitSynchronous:(id *)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D52070];
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isHDRComposition:", v6);

  if ((_DWORD)v5)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CISmartColor"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("CISmartColor");
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, v7, 0);
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Adjustments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v8, "setScalePolicy:", v11);

  objc_msgSend(v8, "setSampleMode:", 1);
  objc_msgSend(v8, "submitGenericSynchronous:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
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
  void *v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        v29 = 2114;
        v30 = v23;
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
      v28 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = (void *)MEMORY[0x1E0D52070];
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isHDRComposition:", v6);

  if ((_DWORD)v5)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CISmartColor"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("CISmartColor");
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, v7, 0);
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Adjustments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v8, "setScalePolicy:", v11);

  objc_msgSend(v8, "setSampleMode:", 1);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __37__PISmartColorAutoCalculator_submit___block_invoke;
  v24[3] = &unk_1E5019A68;
  v12 = v4;
  v25 = v12;
  objc_msgSend(v8, "submit:", v24);

}

void __37__PISmartColorAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
  else
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
