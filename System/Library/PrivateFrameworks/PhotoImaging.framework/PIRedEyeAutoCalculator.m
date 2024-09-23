@implementation PIRedEyeAutoCalculator

- (id)_options
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NURenderRequest composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("orientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 1;
  v10 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_configureRequest:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSampleMode:", 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x100000);
  objc_msgSend(v4, "setScalePolicy:", v3);

}

- (void)submit:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
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
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v25;
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
      v33 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = -[PIRedEyeAutoCalculator force](self, "force");
  -[PIRedEyeAutoCalculator _options](self, "_options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52238]), "initWithRequest:options:", self, v6);
  -[NURenderRequest internalComposition](self, "internalComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("raw"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPipelineFilters:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/ShowOriginalSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPipelineFilters:", v11);
  }

  -[PIRedEyeAutoCalculator _configureRequest:](self, "_configureRequest:", v7);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", self);
  objc_msgSend(v12, "setName:", CFSTR("PIRedEyeAutoCalculator-getLensInfo"));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __33__PIRedEyeAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5019588;
  v13 = v7;
  v27 = v13;
  v29 = v5;
  v14 = v4;
  v28 = v14;
  objc_msgSend(v12, "submit:", v26);

}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

void __33__PIRedEyeAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v23 = 0;
  objc_msgSend(a2, "result:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (!v3)
    goto LABEL_10;
  v20 = v4;
  objc_msgSend(v3, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBD8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBE0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Apple")))
    goto LABEL_5;
  if (objc_msgSend(v10, "containsString:", CFSTR("front")))
    v11 = objc_msgSend(v10, "containsString:", CFSTR("camera"));
  else
LABEL_5:
    v11 = 0;
  v12 = flashFired(v7);
  objc_msgSend(*(id *)(a1 + 32), "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("properties"));
  objc_msgSend(*(id *)(a1 + 32), "setOptions:", v14);

  v15 = *(_BYTE *)(a1 + 48) ? 1 : v12 & (v11 ^ 1);
  v4 = v20;
  if (v15 != 1)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v19 = objc_alloc(MEMORY[0x1E0D522A0]);
    v17 = (void *)objc_msgSend(v19, "initWithResult:", MEMORY[0x1E0C9AA70]);
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
  }
  else
  {
LABEL_10:
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__PIRedEyeAutoCalculator_submit___block_invoke_2;
    v21[3] = &unk_1E5019A68;
    v16 = *(void **)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v16, "submit:", v21);
    v17 = v22;
  }

}

void __33__PIRedEyeAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_alloc(MEMORY[0x1E0D522A0]);
      v8 = v5;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0D522A0]);
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }
    v9 = (void *)objc_msgSend(v7, "initWithResult:", v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
