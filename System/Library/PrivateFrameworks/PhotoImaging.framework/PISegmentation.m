@implementation PISegmentation

+ (unint64_t)currentVersion
{
  return 50;
}

+ (void)freeResources
{
  +[PISegmentationLoader freeResources](PISegmentationLoader, "freeResources");
}

+ (void)ensureResources
{
  +[PISegmentationLoader ensureResources](PISegmentationLoader, "ensureResources");
}

+ (void)warmUpResources
{
  +[PISegmentationLoader warmUpResources](PISegmentationLoader, "warmUpResources");
}

+ (void)computeSegmentationScoresForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
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
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  const void **v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_20035();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
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
        v43 = (const void **)v30;
        v44 = 2114;
        v45 = v33;
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
      v43 = v19;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v9)
  {
    NUAssertLogger_20035();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "options != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
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
        v43 = v29;
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
      v43 = (const void **)v34;
      v44 = 2114;
      v45 = v38;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v11 = v10;
  objc_msgSend(v9, "objectForKeyedSubscript:", PISegmentationOptionEnableSettlingEffect);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13 ^ 1u);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, PISegmentationOptionLowResolution);

  objc_msgSend(a1, "ensureResources");
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__PISegmentation_computeSegmentationScoresForAsset_options_completion___block_invoke;
  v39[3] = &unk_1E50196D8;
  v40 = v11;
  v41 = a1;
  v16 = v11;
  objc_msgSend(a1, "loadSegmentationItemForAsset:options:completion:", v8, v14, v39);

}

+ (void)loadSegmentationItemForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  id v10;
  id specific;
  id v12;
  void *v13;
  PISegmentationLoader *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
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
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  specific = a4;
  v12 = a5;
  if (!v10)
  {
    NUAssertLogger_20035();
    v40 = objc_claimAutoreleasedReturnValue();
    v15 = "asset != nil";
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = (uint64_t)v41;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (PISegmentationLoader *)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v16 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        specific = dispatch_get_specific(v14->super.isa);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v10 = specific;
        objc_msgSend(v46, "callStackSymbols");
        v14 = (PISegmentationLoader *)objc_claimAutoreleasedReturnValue();
        -[PISegmentationLoader componentsJoinedByString:](v14, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = (uint64_t)specific;
        v66 = 2114;
        v67 = v47;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (PISegmentationLoader *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = (uint64_t)v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v45 = _NUAssertFailHandler();
    goto LABEL_46;
  }
  v13 = v12;
  v14 = -[PISegmentationLoader initWithParallaxAsset:]([PISegmentationLoader alloc], "initWithParallaxAsset:", v10);
  -[PISegmentationLoader setSourceMode:](v14, "setSourceMode:", 1);
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionClassification);
  v15 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_20035();
    v43 = objc_claimAutoreleasedReturnValue();
    v10 = &unk_1A64D6000;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid classification option: %@"), v15);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = (uint64_t)v44;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (PISegmentationLoader *)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v16 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v45)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (PISegmentationLoader *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = (uint64_t)v14;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_48:

      v50 = v15;
      _NUAssertFailHandler();
LABEL_49:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
LABEL_9:
      v17 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v65 = v6;
        v66 = 2114;
        v67 = v10;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
      }
      goto LABEL_11;
    }
LABEL_46:
    if (v45)
    {
      specific = dispatch_get_specific(v14->super.isa);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v10 = specific;
      objc_msgSend(v48, "callStackSymbols");
      v14 = (PISegmentationLoader *)objc_claimAutoreleasedReturnValue();
      -[PISegmentationLoader componentsJoinedByString:](v14, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = (uint64_t)specific;
      v66 = 2114;
      v67 = v49;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_48;
  }
  -[PISegmentationLoader setClassification:](v14, "setClassification:", objc_msgSend(v15, "unsignedIntegerValue"));
LABEL_5:
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionLayoutConfiguration);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_12;
  v7 = v13;
  v5 = v10;
  v63 = 0;
  objc_msgSend(MEMORY[0x1E0D75340], "compoundDeviceConfigurationFromDictionary:error:", v6, &v63);
  v16 = objc_claimAutoreleasedReturnValue();
  v10 = v63;
  if (!v16)
  {
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_9;
    goto LABEL_49;
  }
  -[PISegmentationLoader setLayoutConfiguration:](v14, "setLayoutConfiguration:", v16);
LABEL_11:

  v10 = v5;
  v13 = v7;
LABEL_12:
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionLowResolution, v50);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    -[PISegmentationLoader setProxyOnly:](v14, "setProxyOnly:", objc_msgSend(v18, "BOOLValue"));
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionDisableDownload);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    -[PISegmentationLoader setDisableDownload:](v14, "setDisableDownload:", objc_msgSend(v20, "BOOLValue"));
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionPriority);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    -[PISegmentationLoader setPriority:](v14, "setPriority:", objc_msgSend(v22, "integerValue"));
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionDisableSegmentation);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    -[PISegmentationLoader setDisableSegmentation:](v14, "setDisableSegmentation:", objc_msgSend(v24, "BOOLValue"));
  v52 = v25;
  v54 = v21;
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionDisableRendering);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    -[PISegmentationLoader setDisableRendering:](v14, "setDisableRendering:", objc_msgSend(v26, "BOOLValue"));
  v51 = v27;
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionEnableSettlingEffect);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v57 = v15;
  if (v28)
    v30 = objc_msgSend(v28, "BOOLValue") ^ 1;
  else
    v30 = 1;
  -[PISegmentationLoader setDisableSettlingEffect:](v14, "setDisableSettlingEffect:", v30);
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionSettlingEffectGatingLevel);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v56 = (void *)v6;
  if (v31)
    v33 = objc_msgSend(v31, "integerValue");
  else
    v33 = 2;
  v53 = v23;
  v55 = v19;
  -[PISegmentationLoader setSettlingEffectGatingLevel:](v14, "setSettlingEffectGatingLevel:", v33);
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionOutOfProcess);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
    -[PISegmentationLoader setPerformMediaAnalysisInProcess:](v14, "setPerformMediaAnalysisInProcess:", objc_msgSend(v34, "BOOLValue") ^ 1);
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionPetsRegions);
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(specific, "objectForKeyedSubscript:", PISegmentationOptionPetsFaceRegions);
  v37 = objc_claimAutoreleasedReturnValue();
  if (v36 | v37)
  {
    -[PISegmentationLoader setPetsRegions:](v14, "setPetsRegions:", v36);
    -[PISegmentationLoader setPetsFaceRegions:](v14, "setPetsFaceRegions:", v37);
  }
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __66__PISegmentation_loadSegmentationItemForAsset_options_completion___block_invoke;
  v59[3] = &unk_1E5019700;
  v61 = v13;
  v62 = a1;
  v60 = v10;
  v38 = v10;
  v39 = v13;
  -[PISegmentationLoader loadSegmentationItemWithCompletion:](v14, "loadSegmentationItemWithCompletion:", v59);
  objc_msgSend(a1, "setSegmentationLoader:forAsset:", v14, v38);

}

+ (void)cancelSegmentationForAsset:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_20035();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2114;
        v23 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v19 = v4;
  objc_msgSend(a1, "segmentationLoaderForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

}

+ (BOOL)curatedSegmentationGatingDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 1) & 1;
}

+ (BOOL)manualSegmentationGatingDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 2) & 1;
}

+ (BOOL)layoutGatingDecisionForSegmentationScores:(id)a3
{
  return +[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) & 1;
}

+ (BOOL)currentDeviceSupportsSettlingEffect
{
  return +[PISegmentationLoader currentDeviceSupportsSettlingEffect](PISegmentationLoader, "currentDeviceSupportsSettlingEffect");
}

+ (BOOL)settlingEffectStabilizationDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 3) & 1;
}

+ (BOOL)settlingEffectVideoDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 4) & 1;
}

+ (BOOL)settlingEffectLayoutDecisionForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 5) & 1;
}

+ (BOOL)settlingEffectLayoutContainsHeadroomForSegmentationScores:(id)a3
{
  return (+[PISegmentationGating gatingResultForSegmentationScores:](PISegmentationGating, "gatingResultForSegmentationScores:", a3) >> 6) & 1;
}

+ (unint64_t)settlingEffectGatingFailuresFromScores:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D75820]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

+ ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatisticsFromScores:(SEL)a3
{
  id v6;
  __int16 v7;
  BOOL v8;
  BOOL v9;
  $2753767B6D5E71768FC0A26EE39D5FB2 *result;

  v6 = a4;
  v7 = objc_msgSend(a2, "settlingEffectGatingFailuresFromScores:", v6);
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var12 = 0;
  v8 = +[PISegmentation settlingEffectVideoDecisionForSegmentationScores:](PISegmentation, "settlingEffectVideoDecisionForSegmentationScores:", v6);
  v9 = +[PISegmentation settlingEffectLayoutDecisionForSegmentationScores:](PISegmentation, "settlingEffectLayoutDecisionForSegmentationScores:", v6);

  if ((v7 & 0x40) == 0)
  {
    if ((v7 & 0x800) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 4);
    }
    else if ((v7 & 0x80) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 8);
    }
    else if ((v7 & 0x100) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 12);
    }
    else if ((v7 & 0x200) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 16);
    }
    else if ((v7 & 1) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 20);
    }
    else if ((v7 & 2) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 24);
    }
    else if ((v7 & 4) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 28);
    }
    else if ((v7 & 8) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 32);
    }
    else if ((v7 & 0x10) != 0)
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 36);
    }
    else if (v8)
    {
      if (v9)
      {
        if ((v7 & 0x20) == 0)
          return result;
        retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 48);
      }
      else
      {
        retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 44);
      }
    }
    else
    {
      retstr = ($2753767B6D5E71768FC0A26EE39D5FB2 *)((char *)retstr + 40);
    }
  }
  retstr->var0 = 1;
  return result;
}

+ (BOOL)tryLoadSegmentationForColdAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v30[0] = PISegmentationOptionDisableDownload;
  v30[1] = PISegmentationOptionDisableRendering;
  v31[0] = MEMORY[0x1E0C9AAB0];
  v31[1] = MEMORY[0x1E0C9AAB0];
  v30[2] = PISegmentationOptionLowResolution;
  v31[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __50__PISegmentation_tryLoadSegmentationForColdAsset___block_invoke;
  v19 = &unk_1E5019728;
  v21 = &v22;
  v7 = v5;
  v20 = v7;
  objc_msgSend(a1, "loadSegmentationItemForAsset:options:completion:", v4, v6, &v16);
  v8 = dispatch_time(0, 10000000000);
  v9 = dispatch_group_wait(v7, v8);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v10 = (id)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "localIdentifier", v16, v17, v18, v19);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
    {
      v13 = CFSTR("NO (timeout)");
    }
    else if (*((_BYTE *)v23 + 24))
    {
      v13 = CFSTR("YES");
    }
    else
    {
      v13 = CFSTR("NO");
    }
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_INFO, "Can load cold asset? %{public}@ => %{public}@", buf, 0x16u);

  }
  if (v9)
    v14 = 0;
  else
    v14 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v14;
}

+ (void)setSegmentationLoader:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = a1;
  objc_sync_enter(v7);
  v8 = (void *)s_segmentationLoaderMap;
  if (!s_segmentationLoaderMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)s_segmentationLoaderMap;
    s_segmentationLoaderMap = v10;

    v8 = (void *)s_segmentationLoaderMap;
    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v6, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);
    goto LABEL_6;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, v9);
LABEL_6:

  objc_sync_exit(v7);
}

+ (id)segmentationLoaderForAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)s_segmentationLoaderMap;
  objc_msgSend(v4, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

+ (void)exportWallpaperForAsset:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  const void **v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  const void **v29;
  void *v30;
  int v31;
  void *v32;
  const void **v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t buf[4];
  const void **v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    NUAssertLogger_20035();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v34 = dispatch_get_specific(*v23);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = (const void **)v34;
        v54 = 2114;
        v55 = v37;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v23;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if (!v11)
  {
    NUAssertLogger_20035();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "wallpaperURL != nil");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v25 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v31)
    {
      v38 = dispatch_get_specific(*v23);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v40 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = (const void **)v38;
      v54 = 2114;
      v55 = v42;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v14 = v13;
  objc_msgSend(a1, "ensureResources");
  v15 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke;
  v49[3] = &unk_1E5019750;
  v50 = v14;
  v51 = a1;
  v16 = v14;
  v43[0] = v15;
  v43[1] = 3221225472;
  v43[2] = __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke_2;
  v43[3] = &unk_1E5019778;
  v47 = (id)MEMORY[0x1A85C0174](v49);
  v48 = a1;
  v44 = v12;
  v45 = v11;
  v46 = v10;
  v17 = v10;
  v18 = v47;
  v19 = v11;
  v20 = v12;
  objc_msgSend(a1, "loadSegmentationItemForAsset:options:completion:", v17, v20, v43);

}

+ (unint64_t)_layerStackOptionsFromOptions:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
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
  objc_msgSend(v3, "objectForKeyedSubscript:", PISegmentationOptionLayerStackOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NUAssertLogger_20035();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid additionalLayerOptions: %@"), v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v9 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_20035();
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
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)_styleFromOptions:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", PISegmentationOptionStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v6, "availableStyles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = (id)MEMORY[0x1E0C809B0];
    v18[2] = (id)3221225472;
    v18[3] = __41__PISegmentation__styleFromOptions_item___block_invoke;
    v18[4] = &unk_1E50197A0;
    v19 = v8;
    v10 = v8;
    PFFind();
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v14 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Unknown style option, ignored: %{public}@", buf, 0xCu);
    }
LABEL_19:
    objc_msgSend(v5, "objectForKeyedSubscript:", PISegmentationOptionStyleCategory);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "suggestedStyleForCategory:", v15);
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

        goto LABEL_28;
      }
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v16 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Unknown style category option, ignored: %{public}@", buf, 0xCu);
      }
    }
    v11 = 0;
    goto LABEL_27;
  }
  v18[0] = 0;
  objc_msgSend(MEMORY[0x1E0D751A0], "styleWithDictionary:error:", v7, v18);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v18[0];
  if (!v11)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v13 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Failed to deserialize style from dictionary: %{public}@, error: %{public}@", buf, 0x16u);
    }
  }

LABEL_4:
  if (!v11)
    goto LABEL_19;
LABEL_28:

  return v11;
}

+ (void)upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  const void **v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE buf[24];
  void *v62;
  uint64_t *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    NUAssertLogger_20035();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sourceURL != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v42 = dispatch_get_specific(*v31);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v46;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
LABEL_27:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_33:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!v11)
  {
    NUAssertLogger_20035();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destinationURL != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = (const void **)MEMORY[0x1E0D51D48];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v33 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (!v39)
        goto LABEL_33;
      goto LABEL_27;
    }
    if (v39)
    {
      v47 = dispatch_get_specific(*v37);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v49 = v47;
      objc_msgSend(v48, "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v51;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  v14 = v13;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v15 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v10, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    v62 = v12;
    _os_log_impl(&dword_1A6382000, v16, OS_LOG_TYPE_DEFAULT, "Upgrading wallpaper at %{public}@ to %{public}@, options: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", PISegmentationOptionOutOfProcess);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
  {
    v21 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, PISegmentationOptionOutOfProcess);
    v57 = 0;
    v58 = &v57;
    v59 = 0x2050000000;
    v22 = (void *)getVCPMediaAnalysisServiceClass_softClass_20126;
    v60 = getVCPMediaAnalysisServiceClass_softClass_20126;
    if (!getVCPMediaAnalysisServiceClass_softClass_20126)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getVCPMediaAnalysisServiceClass_block_invoke_20127;
      v62 = &unk_1E5019948;
      v63 = &v57;
      __getVCPMediaAnalysisServiceClass_block_invoke_20127((uint64_t)buf);
      v22 = (void *)v58[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v57, 8);
    objc_msgSend(v23, "sharedAnalysisService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke;
    v55[3] = &unk_1E50197C8;
    v56 = v14;
    objc_msgSend(v24, "requestWallpaperUpgradeAtURL:toDestinationURL:withOptions:andCompletionHandler:", v10, v11, v21, v55);

  }
  else
  {
    objc_msgSend(a1, "ensureResources");
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke_2;
    v52[3] = &unk_1E50197F0;
    v53 = v14;
    v54 = a1;
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85C0174](v52);
    objc_msgSend(v12, "objectForKeyedSubscript:", PISegmentationOptionWallpaperUpgradeMode);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    switch(v27)
    {
      case 0:
        objc_msgSend(a1, "_upgradeWallpaperAtURL:exportToURL:options:completion:", v10, v11, v12, v25);
        break;
      case 1:
        objc_msgSend(a1, "_upgradeFullPosterAtURL:exportToURL:options:completion:", v10, v11, v12, v25);
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Not implemented yet"), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v28);

        break;
      case 3:
        objc_msgSend(a1, "_createReadOnlyCopyOfPosterAtURL:exportToURL:options:completion:", v10, v11, v12, v25);
        break;
      default:
        break;
    }

    v21 = v53;
  }

}

+ (void)_upgradeWallpaperAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v57 = 0;
  +[PISegmentationLoader loadSegmentationItemFromWallpaperURL:error:](PISegmentationLoader, "loadSegmentationItemFromWallpaperURL:error:", v10, &v57);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v57;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", PISegmentationOptionLayoutConfiguration);
    v17 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v17;
    v49 = v11;
    if (v17)
    {
      v45 = a1;
      v18 = v12;
      v56 = 0;
      objc_msgSend(MEMORY[0x1E0D75340], "compoundDeviceConfigurationFromDictionary:error:", v17, &v56);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v56;
      if (v19)
      {
        v21 = v19;
        v22 = v16;
        v16 = v21;

      }
      else
      {
        v24 = v16;
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
        v25 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v59 = v48;
          v60 = 2114;
          v61 = v20;
          _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
        }
        v16 = v24;
      }

      v12 = v18;
      a1 = v45;
    }
    v55 = v15;
    +[PISegmentationLoader loadCompoundLayerStackFromWallpaperURL:options:error:](PISegmentationLoader, "loadCompoundLayerStackFromWallpaperURL:options:error:", v10, 0, &v55);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v55;

    if (v26)
    {
      v44 = v23;
      objc_msgSend(v26, "layout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v16;
      objc_msgSend(v27, "layoutByUpgradingToConfiguration:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_alloc_init(MEMORY[0x1E0D75200]);
      objc_msgSend(v28, "portraitLayout");
      v30 = a1;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "normalizedVisibleFrame");
      NURectFlipYOrigin();
      objc_msgSend(v29, "setNormalizedVisibleFrame:");

      objc_msgSend(v28, "landscapeLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "normalizedVisibleFrame");
      NURectFlipYOrigin();
      objc_msgSend(v29, "setNormalizedLandscapeVisibleFrame:");

      objc_msgSend(v26, "portraitLayerStack");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setIsDepthEnabled:", objc_msgSend(v33, "depthEnabled"));

      objc_msgSend(v26, "portraitLayerStack");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setIsPerspectiveZoomEnabled:", objc_msgSend(v34, "parallaxDisabled") ^ 1);

      objc_msgSend(v26, "portraitLayerStack");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setIsSettlingEffectEnabled:", objc_msgSend(v35, "settlingEffectEnabled"));

      v36 = v30;
      v37 = objc_msgSend(v30, "_layerStackOptionsFromOptions:", v12);
      v38 = v12;
      v39 = v37 | 1;
      v47 = v38;
      if (objc_msgSend(v29, "isSettlingEffectEnabled"))
      {
        +[PIParallaxStyle defaultOriginalStyle](PIParallaxOriginalStyle, "defaultOriginalStyle");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bakedStyle");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v36, "_styleFromOptions:item:", v38, v14);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "setStyle:", v41);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __72__PISegmentation__upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke;
      v50[3] = &unk_1E5019818;
      v51 = v10;
      v52 = v49;
      v53 = v29;
      v54 = v13;
      v42 = v29;
      v43 = +[PISegmentationLoader saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:](PISegmentationLoader, "saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:", v14, v39, v42, v41, v28, v52, v50);

      v16 = v46;
      v12 = v47;
      v23 = v44;
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v23);
    }

    v11 = v49;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v15);
    v23 = v15;
  }

}

+ (void)_upgradeFullPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0D751F0], "loadFromURL:error:", v10, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  if (v14)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__PISegmentation__upgradeFullPosterAtURL_exportToURL_options_completion___block_invoke;
    v20[3] = &unk_1E5019840;
    v21 = v10;
    v22 = v11;
    v23 = v13;
    objc_msgSend(a1, "upgradePosterConfiguration:atURL:exportTo:options:completion:", v14, v21, v22, v12, v20);

    v16 = v21;
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v17 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      objc_msgSend(v10, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2114;
      v28 = v15;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from: '%{public}@', error: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load poster configuration from source URL"), v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v16);
  }

}

+ (void)_createReadOnlyCopyOfPosterAtURL:(id)a3 exportToURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __objc2_class **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __objc2_class *v29;
  void *v30;
  __objc2_class **v31;
  __objc2_class *v32;
  char v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void (**v56)(id, _QWORD);
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0D751F0], "loadFromURL:error:", v8, &v70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v70;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

    if ((v15 & 1) == 0)
    {
      v69 = v12;
      v16 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v69);
      v17 = v69;

      if ((v16 & 1) == 0)
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
        v38 = (void *)*MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
        {
          v47 = v38;
          objc_msgSend(v9, "path");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v73 = v48;
          v74 = 2114;
          v75 = v17;
          _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Failed to create destination: '%{public}@', error: %{public}@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create destination"), v9, v17);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0);
LABEL_43:

        v12 = v17;
        goto LABEL_44;
      }
      v12 = v17;
    }
    v56 = v10;
    v57 = v13;
    objc_msgSend(v11, "media");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    v58 = v11;
    if (v19)
    {
      v20 = v19;
      v60 = *(_QWORD *)v66;
      v61 = v9;
      v21 = off_1E5013000;
LABEL_7:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v66 != v60)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v22);
        objc_msgSend(v23, "subpath", v55);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v8;
        objc_msgSend(v8, "URLByAppendingPathComponent:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "subpath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "URLByAppendingPathComponent:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v21[70];
        v64 = v12;
        -[__objc2_class loadCompoundLayerStackFromWallpaperURL:options:error:](v29, "loadCompoundLayerStackFromWallpaperURL:options:error:", v26, 1, &v64);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v64;

        if (!v30)
          break;
        v31 = v21;
        v32 = v21[70];
        v63 = v17;
        v33 = -[__objc2_class saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:](v32, "saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:", 0, v30, 0, v28, &v63);
        v12 = v63;

        if ((v33 & 1) == 0)
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
          v9 = v61;
          v41 = (void *)*MEMORY[0x1E0D52398];
          v10 = v56;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
          {
            v51 = v41;
            objc_msgSend(v26, "path");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v73 = v52;
            v74 = 2114;
            v75 = v12;
            _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Failed to save layer stack: '%{public}@', error: %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to save layer stack"), v26, v12);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v12;
LABEL_36:
          ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v10[2])(v10, 0, v40);

          v34 = obj;
          v35 = (void *)v55;
          goto LABEL_42;
        }

        ++v22;
        v8 = v25;
        v21 = v31;
        if (v20 == v22)
        {
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          v9 = v61;
          v11 = v58;
          if (v20)
            goto LABEL_7;
          goto LABEL_14;
        }
      }
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v9 = v61;
      v39 = (void *)*MEMORY[0x1E0D52398];
      v10 = v56;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v49 = v39;
        objc_msgSend(v26, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v50;
        v74 = 2114;
        v75 = v17;
        _os_log_error_impl(&dword_1A6382000, v49, OS_LOG_TYPE_ERROR, "Failed to load layer stack: '%{public}@', error: %{public}@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load layer stack"), v26, v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      goto LABEL_36;
    }
LABEL_14:

    v34 = (void *)objc_msgSend(v11, "copy");
    v35 = (void *)v55;
    objc_msgSend(v34, "setMedia:", v55);
    v62 = v12;
    v36 = objc_msgSend(v34, "saveToURL:error:", v9, &v62);
    v17 = v62;

    if (v36)
    {
      v25 = v8;
      objc_msgSend(v34, "editConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v56;
      ((void (*)(void (**)(id, _QWORD), void *, _QWORD))v56[2])(v56, v26, 0);
    }
    else
    {
      v10 = v56;
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v25 = v8;
      v42 = (void *)*MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v53 = v42;
        objc_msgSend(v9, "path");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v54;
        v74 = 2114;
        v75 = v17;
        _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Failed to save poster configuration to '%{public}@', error: %{public}@", buf, 0x16u);

      }
      v43 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v9, "path", v55);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to save poster configuration"), v26, v17);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v56[2])(v56, 0, v44);

    }
LABEL_42:

    v8 = v25;
    v13 = v57;
    v11 = v58;
    goto LABEL_43;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v37 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v45 = v37;
    objc_msgSend(v8, "path");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v46;
    v74 = 2114;
    v75 = v12;
    _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from: '%{public}@', error: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load poster configuration from source URL"), v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v10[2])(v10, 0, v13);
LABEL_44:

}

+ (void)upgradePosterConfiguration:(id)a3 atURL:(id)a4 exportTo:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  _QWORD block[4];
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  NSObject *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t v89[128];
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v67 = a4;
  v65 = a5;
  v12 = a6;
  v58 = a7;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v70 = v11;
  objc_msgSend(v11, "editConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D751A0], "dictionaryWithStyle:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, PISegmentationOptionStyle);

  }
  v69 = v13;
  objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", PISegmentationOptionLayoutConfiguration);
  v18 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v18;
  if (v18)
  {
    v19 = v18;
    v88 = 0;
    objc_msgSend(MEMORY[0x1E0D75340], "compoundDeviceConfigurationFromDictionary:error:", v18, &v88);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v88;
    if (v20)
    {
      v22 = v20;

      v17 = v22;
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v23 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v91 = v19;
        v92 = 2114;
        v93 = v21;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Failed to deserialize layout configuration: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }

  }
  v24 = dispatch_group_create();
  v25 = (void *)objc_msgSend(v70, "copy");
  objc_msgSend(v70, "media");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
  objc_msgSend(v12, "objectForKeyedSubscript:", PISegmentationOptionLayerStackOptions);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((objc_msgSend(v27, "unsignedIntegerValue") & 4) != 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v31 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v31, OS_LOG_TYPE_INFO, "Upgrading poster media: SETTING .hasInactiveContent", buf, 2u);
      }
      v30 = objc_msgSend(v25, "options") | 4;
    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
      v29 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v29, OS_LOG_TYPE_INFO, "Upgrading poster media: CLEARING .hasInactiveContent", buf, 2u);
      }
      v30 = objc_msgSend(v25, "options") & 0xFFFFFFFFFFFFFFFBLL;
    }
    objc_msgSend(v25, "setOptions:", v30);
  }
  v57 = v17;
  v60 = v12;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v26;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  v56 = v28;
  if (v32)
  {
    v33 = v32;
    v62 = *(_QWORD *)v85;
    do
    {
      v34 = 0;
      v35 = v15;
      do
      {
        v36 = v25;
        if (*(_QWORD *)v85 != v62)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v34);
        dispatch_group_enter(v24);
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
        v38 = (void *)*MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
        {
          v39 = v38;
          objc_msgSend(v37, "assetUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v91 = (uint64_t)v40;
          _os_log_impl(&dword_1A6382000, v39, OS_LOG_TYPE_INFO, "Upgrading poster media: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v37, "subpath");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "URLByAppendingPathComponent:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "subpath");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "URLByAppendingPathComponent:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "editConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "style");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0D751A0], "dictionaryWithStyle:", v15);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v46, PISegmentationOptionStyle);

        }
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke;
        v79[3] = &unk_1E5019868;
        v79[4] = v37;
        v80 = v70;
        v25 = v36;
        v81 = v36;
        v82 = v64;
        v47 = v24;
        v83 = v47;
        objc_msgSend(a1, "_upgradeWallpaperAtURL:exportToURL:options:completion:", v42, v44, v69, v79);
        dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);

        ++v34;
        v35 = v15;
      }
      while (v33 != v34);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    }
    while (v33);
  }

  v48 = dispatch_queue_create("PISegmentation.upgrade", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke_133;
  block[3] = &unk_1E5019890;
  v72 = v64;
  v73 = obj;
  v74 = v25;
  v75 = v57;
  v76 = v65;
  v77 = v67;
  v78 = v58;
  v68 = v67;
  v66 = v65;
  v49 = v57;
  v50 = v25;
  v51 = v49;
  v52 = v50;
  v53 = v58;
  v54 = obj;
  v55 = v64;
  dispatch_group_notify(v24, v48, block);

}

+ (CGImage)createFullExtentPreviewImageForWallpaperAtURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGImage *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PISegmentation.m"), 767, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceURL != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PISegmentation.m"), 768, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != nil"));

LABEL_3:
  +[PISegmentationLoader loadCompoundLayerStackFromWallpaperURL:options:error:](PISegmentationLoader, "loadCompoundLayerStackFromWallpaperURL:options:error:", v7, 2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "portraitLayerStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundBackfillLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0C9DD90]);
      v13 = (void *)objc_msgSend(v12, "initWithOptions:", MEMORY[0x1E0C9AA70]);
      +[PISegmentationHelper imageFromImageLayer:](PISegmentationHelper, "imageFromImageLayer:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "foregroundBackfillLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[PISegmentationHelper imageFromImageLayer:](PISegmentationHelper, "imageFromImageLayer:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "imageByCompositingOverImage:", v14);
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v17;
      }
      objc_msgSend(v10, "layout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageSize");
      v21 = v19;
      v22 = v20;
      if (v19 == 0.0 || v20 == 0.0 || v19 == *MEMORY[0x1E0D71130] && v20 == *(double *)(MEMORY[0x1E0D71130] + 8))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          v34 = v21;
          v35 = 2048;
          v36 = v22;
          v37 = 2048;
          v38 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A6382000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      else
      {
        v23 = v19 / v20;
      }
      objc_msgSend(v11, "pixelSize", v23);
      PFSizeWithAspectRatioFittingSize();
      v26 = v25;
      v28 = v27;

      objc_msgSend(v14, "imageByCroppingToRect:", 0.0, 0.0, v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "extent");
      v24 = (CGImage *)objc_msgSend(v13, "createCGImage:fromRect:", v29);
      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to render image"), v7);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing required layer in layer stack"), v7);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (void)loadSegmentationDataForAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  PISegmentationLoader *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const void **v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  _QWORD v36[4];
  void (**v37)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    NUAssertLogger_20035();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v22 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20035();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific(*v22);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v27;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  objc_msgSend(v8, "objectForKeyedSubscript:", PISegmentationOptionLayoutConfiguration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", PISegmentationOptionLayoutProvider);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", PISegmentationOptionSegmentationData);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0D520A0];
      v18 = CFSTR("Invalid layout configuration option: %@");
      v19 = v11;
LABEL_15:
      objc_msgSend(v17, "invalidError:object:", v18, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v15);
      goto LABEL_18;
    }
  }
  if (v12 && (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE8798E8) & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0D520A0];
    v18 = CFSTR("Invalid layout provider option: %@");
    v19 = v12;
    goto LABEL_15;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0D520A0];
      v18 = CFSTR("Invalid segmentationData option: %@");
      v19 = v13;
      goto LABEL_15;
    }
  }
  v14 = -[PISegmentationLoader initWithParallaxAsset:]([PISegmentationLoader alloc], "initWithParallaxAsset:", v7);
  v15 = v14;
  if (v11)
    -[PISegmentationLoader setLayoutConfiguration:](v14, "setLayoutConfiguration:", v11);
  objc_msgSend(v15, "setLayoutProvider:", v12);
  objc_msgSend(v15, "setDisableSettlingEffect:", 1);
  objc_msgSend(v15, "setDisableHeadroomLayout:", 1);
  objc_msgSend(v15, "setPerformMediaAnalysisInProcess:", 1);
  if (v13)
  {
    objc_msgSend(v13, "item");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke;
    v36[3] = &unk_1E50198B8;
    v37 = v10;
    objc_msgSend(v15, "refreshSegmentationItem:completion:", v16, v36);

  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_2;
    v33[3] = &unk_1E50198E0;
    v34 = v15;
    v35 = v10;
    objc_msgSend(v34, "loadSegmentationItemWithCompletion:", v33);

    v16 = v34;
  }

LABEL_18:
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PISegmentationData *v4;

  v3 = a2;
  v4 = -[PISegmentationData initWithSegmentationItem:]([PISegmentationData alloc], "initWithSegmentationItem:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_3;
    v4[3] = &unk_1E50198B8;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "refreshSegmentationItem:completion:", a2, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __66__PISegmentation_loadSegmentationDataForAsset_options_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PISegmentationData *v4;

  v3 = a2;
  v4 = -[PISegmentationData initWithSegmentationItem:]([PISegmentationData alloc], "initWithSegmentationItem:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v7 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "assetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v10;
      _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_INFO, "Successfully upgraded poster media: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v11 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v12 = objc_msgSend(*(id *)(a1 + 40), "configurationType");
    v13 = v11;
    if (v12 != 2)
      v13 = *(NSObject **)(a1 + 48);
    -[NSObject setEditConfiguration:](v13, "setEditConfiguration:", v5);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    goto LABEL_9;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v14 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v15 = *(void **)(a1 + 32);
    v11 = v14;
    objc_msgSend(v15, "assetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2114;
    v20 = v6;
    _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Failed to upgraded poster media: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x16u);

LABEL_9:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __79__PISegmentation_upgradePosterConfiguration_atURL_exportTo_options_completion___block_invoke_133(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  os_log_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  os_log_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  v5 = *MEMORY[0x1E0D52390];
  if (v2 != v3)
  {
    if (v5 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v19 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v27 = *(void **)(a1 + 40);
      v28 = v19;
      v29 = objc_msgSend(v27, "count");
      v30 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v36 = v29 - v30;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Failed to upgrade %lu poster media", buf, 0xCu);

    }
    v20 = *(_QWORD *)(a1 + 80);
    v21 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") - objc_msgSend(*(id *)(a1 + 32), "count"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "failureError:object:", CFSTR("Failed to upgrade some poster media"), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v22);
    goto LABEL_22;
  }
  if (v5 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v6 = (os_log_t *)MEMORY[0x1E0D52398];
  v7 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    *(_DWORD *)buf = 134217984;
    v36 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_INFO, "Successfully upgraded %lu poster media", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 48), "setMedia:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "setLayoutConfiguration:", *(_QWORD *)(a1 + 56));
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v34 = 0;
  v12 = objc_msgSend(v10, "saveToURL:error:", v11, &v34);
  v13 = v34;
  if (!v12)
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v23 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v31 = *(void **)(a1 + 64);
      v32 = v23;
      objc_msgSend(v31, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = (uint64_t)v33;
      v37 = 2114;
      v38 = v13;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Failed to save poster configuration to '%{public}@', error: %{public}@", buf, 0x16u);

    }
    v24 = *(_QWORD *)(a1 + 80);
    v25 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(*(id *)(a1 + 64), "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to save poster configuration"), v22, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v26);

LABEL_22:
    goto LABEL_23;
  }
  if (*v4 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
  v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(void **)(a1 + 72);
    v16 = v14;
    objc_msgSend(v15, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = (uint64_t)v17;
    v37 = 2114;
    v38 = v18;
    _os_log_impl(&dword_1A6382000, v16, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration from '%{public}@' to '%{public}@'", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_23:

}

void __73__PISegmentation__upgradeFullPosterAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v7 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration from: '%{public}@' to: '%{public}@'", (uint8_t *)&v20, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "editConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v14 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      v17 = v14;
      objc_msgSend(v16, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v18;
      v22 = 2114;
      v23 = v19;
      v24 = 2114;
      v25 = v6;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration from: '%{public}@' to: '%{public}@', error: %{public}@", (uint8_t *)&v20, 0x20u);

    }
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to upgrade poster configuration from source URL"), *(_QWORD *)(a1 + 32), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v13);
  }

}

void __72__PISegmentation__upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v4 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v4;
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v3;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Failed to export refreshed wallpaper at %{public}@ to %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_245_20069);
    v6 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A6382000, v8, OS_LOG_TYPE_DEFAULT, "Successfully exported refreshed wallpaper at %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);

    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v5();

}

void __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("WallpaperPosterConfigDataResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v8;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __71__PISegmentation_upgradeWallpaperAtURL_exportToURL_options_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "freeResources");
}

uint64_t __41__PISegmentation__styleFromOptions_item___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "freeResources");
}

void __67__PISegmentation_exportWallpaperForAsset_toURL_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", PISegmentationOptionDisableRendering);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(*(id *)(a1 + 64), "_layerStackOptionsFromOptions:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 64), "_styleFromOptions:item:", *(_QWORD *)(a1 + 32), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[PISegmentationLoader saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:](PISegmentationLoader, "saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:", v13, v8, 0, v11, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(*(id *)(a1 + 48), "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Segmentation failure"), v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __50__PISegmentation_tryLoadSegmentationForColdAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__PISegmentation_loadSegmentationItemForAsset_options_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "setSegmentationLoader:forAsset:", 0, *(_QWORD *)(a1 + 32));
}

uint64_t __71__PISegmentation_computeSegmentationScoresForAsset_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "scores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  return objc_msgSend(*(id *)(a1 + 40), "freeResources");
}

@end
