@implementation PISmartToneAutoCalculator

- (id)submitSynchronous:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  os_log_t *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D52070];
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isHDRComposition:", v6);

  v8 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v9 = (os_log_t *)MEMORY[0x1E0D52398];
  v10 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v7)
      v11 = "Yes";
    *(_DWORD *)buf = 136315138;
    v34 = v11;
    _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator submitSynchronous isHDRComposition: %s", buf, 0xCu);
  }
  v12 = dispatch_queue_create("PISmartToneAutoCalculator", 0);
  -[NURenderRequest responseQueue](self, "responseQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v12, v13);

  if (v7)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CISmartTone"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("CISmartTone");
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, v14, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v15, "setScalePolicy:", v16);

  objc_msgSend(v15, "setSampleMode:", 1);
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Adjustments"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPipelineFilters:", v18);

  if (*v8 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v19 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = (const char *)v15;
    _os_log_impl(&dword_1A6382000, v19, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone request submitting: %{public}@", buf, 0xCu);
  }
  objc_msgSend(v15, "submitGenericSynchronous:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "data");
  v21 = (char *)objc_claimAutoreleasedReturnValue();

  if (*v8 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl(&dword_1A6382000, v22, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone result: %{public}@", buf, 0xCu);
  }
  if (v21)
  {

    if (v7)
    {
      +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CILocalLight"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("CILocalLight");
    }
    objc_msgSend(v15, "setDataExtractor:", v14);
    objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("pre-Adjustments"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPipelineFilters:", v25);

    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
    v26 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = (const char *)v15;
      _os_log_impl(&dword_1A6382000, v26, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight request submitting: %{public}@", buf, 0xCu);
    }
    objc_msgSend(v15, "submitGenericSynchronous:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "data");
    v28 = (char *)objc_claimAutoreleasedReturnValue();

    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
    v29 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      _os_log_impl(&dword_1A6382000, v29, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight result: %{public}@", buf, 0xCu);
    }
    if (v28)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v23, "addEntriesFromDictionary:", v21);
      objc_msgSend(v23, "addEntriesFromDictionary:", v28);
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)submit:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  const void **v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE *v40;
  _QWORD *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  uint8_t v46[4];
  void *v47;
  void *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v4 = (void *)MEMORY[0x1E0D52070];
  -[NURenderRequest composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isHDRComposition:", v5);

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v7 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v8 = "No";
    if (v6)
      v8 = "Yes";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator submit isHDRComposition: %s", buf, 0xCu);
  }
  if (!v37)
  {
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific(*v27);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v36 = dispatch_queue_create("PISmartToneAutoCalculator", 0);
  -[NURenderRequest responseQueue](self, "responseQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v36, v9);

  if (v6)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CISmartTone"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("CISmartTone");
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, v10, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x40000);
  objc_msgSend(v11, "setScalePolicy:", v12);

  objc_msgSend(v11, "setSampleMode:", 1);
  +[PIPipelineFilters stopAtTagIncludeGeometryFilter:](PIPipelineFilters, "stopAtTagIncludeGeometryFilter:", CFSTR("pre-Adjustments"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPipelineFilters:", v14);

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v15 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone request submitting: %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__19674;
  v51 = __Block_byref_object_dispose__19675;
  v16 = MEMORY[0x1E0C809B0];
  v52 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __36__PISmartToneAutoCalculator_submit___block_invoke;
  v45[3] = &unk_1E5019538;
  v45[4] = buf;
  objc_msgSend(v11, "submit:", v45);

  if (v6)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", CFSTR("CILocalLight"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("CILocalLight");
  }
  objc_msgSend(v11, "setDataExtractor:", v17);
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("pre-Adjustments"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPipelineFilters:", v19);

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__19674;
  v43[4] = __Block_byref_object_dispose__19675;
  v44 = 0;
  v20 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v21 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v46 = 138543362;
    v47 = v11;
    _os_log_impl(&dword_1A6382000, v21, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight request submitting: %{public}@", v46, 0xCu);
  }
  v42[0] = v16;
  v42[1] = 3221225472;
  v42[2] = __36__PISmartToneAutoCalculator_submit___block_invoke_25;
  v42[3] = &unk_1E5019538;
  v42[4] = v43;
  objc_msgSend(v11, "submit:", v42);
  if (*v20 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v22 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_1A6382000, v22, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator going to commit and wait", v46, 2u);
  }
  v23 = (void *)MEMORY[0x1E0D52290];
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __36__PISmartToneAutoCalculator_submit___block_invoke_26;
  v38[3] = &unk_1E5019560;
  v40 = buf;
  v41 = v43;
  v24 = v37;
  v39 = v24;
  objc_msgSend(v23, "commitAndNotifyOnQueue:withBlock:", v36, v38);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);

}

void __36__PISmartToneAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v5 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A6382000, v5, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator global result: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __36__PISmartToneAutoCalculator_submit___block_invoke_25(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v5 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A6382000, v5, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight result: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __36__PISmartToneAutoCalculator_submit___block_invoke_26(_QWORD *a1)
{
  _QWORD *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
  v3 = (os_log_t *)MEMORY[0x1E0D52398];
  v4 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6382000, v4, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator committed", buf, 2u);
  }
  v5 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v21 = 0;
  objc_msgSend(v5, "result:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v20 = v7;
  objc_msgSend(v9, "result:", &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (v11)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v11);
      (*(void (**)(void))(a1[4] + 16))();
      if (*v2 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
      v15 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_impl(&dword_1A6382000, v15, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator error: %{public}@", buf, 0xCu);
      }

    }
    else
    {
      if (*v2 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
      v19 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v19, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator coalesced", buf, 2u);
      }
    }
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "addEntriesFromDictionary:", v8);
    objc_msgSend(v16, "addEntriesFromDictionary:", v12);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v16);
    (*(void (**)(void))(a1[4] + 16))();
    if (*v2 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19650);
    v18 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6382000, v18, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator completed", buf, 2u);
    }

  }
}

@end
