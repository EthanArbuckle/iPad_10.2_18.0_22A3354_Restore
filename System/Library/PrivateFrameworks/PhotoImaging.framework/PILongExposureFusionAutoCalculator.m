@implementation PILongExposureFusionAutoCalculator

- (void)_computeCleanAperture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52330]), "initWithRequest:", self);
  objc_msgSend(v5, "setName:", CFSTR("PILongExposureFusionAutoCalculator-videoProperties"));
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("pre-AutoLoop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPipelineFilters:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PILongExposureFusionAutoCalculator__computeCleanAperture___block_invoke;
  v9[3] = &unk_1E5019A68;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "submit:", v9);

}

- (void)submit:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id specific;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  const void **v34;
  id v35;
  uint8_t buf[4];
  const void **v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4240();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4240();
    v5 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v30 = dispatch_get_specific(*v15);
        v31 = (void *)MEMORY[0x1E0CB3978];
        specific = v30;
        objc_msgSend(v31, "callStackSymbols");
        v15 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = (const void **)v30;
        v38 = 2114;
        v39 = v32;
        _os_log_error_impl(&dword_1A6382000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v15;
      _os_log_error_impl(&dword_1A6382000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_25;
  }
  v5 = (uint64_t)v4;
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mediaType");

  if (v7 == 3)
  {
    -[NURenderRequest composition](self, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("autoLoop"));
    specific = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(specific, "objectForKeyedSubscript:", CFSTR("enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(specific, "objectForKeyedSubscript:", CFSTR("flavor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = PIAutoLoopFlavorFromString(v12);

    objc_msgSend(specific, "objectForKeyedSubscript:", CFSTR("recipe"));
    v14 = (const void **)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!specific || !v11 || v13 != 3 || !v14)
    {
      v20 = (void *)MEMORY[0x1E0D520A0];
      v21 = (void *)-[PILongExposureFusionAutoCalculator copy](self, "copy");
      objc_msgSend(v20, "invalidError:object:", CFSTR("PILongExposureFusionAutoCalculator requires a long-exposure adjustment"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v22);
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v23);

      goto LABEL_11;
    }
    if (PIAutoLoopRecipeHasGoodStabilization(v14))
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __45__PILongExposureFusionAutoCalculator_submit___block_invoke;
      v33[3] = &unk_1E5015F50;
      v35 = (id)v5;
      v33[4] = self;
      v34 = v15;
      -[PILongExposureFusionAutoCalculator _computeCleanAperture:](self, "_computeCleanAperture:", v33);

LABEL_11:
      goto LABEL_12;
    }
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_14:
      v24 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_INFO, "AL stabilization failure: not running fusion registration", buf, 2u);
      }
      v25 = objc_alloc(MEMORY[0x1E0D522A0]);
      v26 = (void *)objc_msgSend(v25, "initWithResult:", MEMORY[0x1E0C9AA70]);
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v26);

      goto LABEL_11;
    }
LABEL_25:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_43);
    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x1E0D520A0];
  v17 = (void *)-[PILongExposureFusionAutoCalculator copy](self, "copy");
  objc_msgSend(v16, "invalidError:object:", CFSTR("PILongExposureFusionAutoCalculator requires a live-photo composition"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v18);
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v19);

LABEL_12:
}

void __45__PILongExposureFusionAutoCalculator_submit___block_invoke(uint64_t a1, _OWORD *a2, void *a3)
{
  id v5;
  __int128 v6;
  PILongExposureRegistrationRequest *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  _OWORD v13[4];

  v5 = a3;
  v6 = a2[1];
  v13[2] = *a2;
  v13[3] = v6;
  if (NUPixelRectIsNull())
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Failed to get clean aperture values"), 0, v5);
    v7 = (PILongExposureRegistrationRequest *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    v7 = -[NURenderRequest initWithRequest:]([PILongExposureRegistrationRequest alloc], "initWithRequest:", *(_QWORD *)(a1 + 32));
    -[PILongExposureRegistrationRequest setRecipe:](v7, "setRecipe:", *(_QWORD *)(a1 + 40));
    v10 = a2[1];
    v13[0] = *a2;
    v13[1] = v10;
    -[PILongExposureRegistrationRequest setCleanAperture:](v7, "setCleanAperture:", v13);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__PILongExposureFusionAutoCalculator_submit___block_invoke_2;
    v11[3] = &unk_1E5019A68;
    v12 = *(id *)(a1 + 48);
    -[PILongExposureRegistrationRequest submit:](v7, "submit:", v11);
    v9 = v12;
  }

}

void __45__PILongExposureFusionAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int i;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[6];
  simd_float3x3 v30;
  simd_float3x3 v31;

  v29[4] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  objc_msgSend(a2, "result:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  if (v3)
  {
    objc_msgSend(v3, "observation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
      objc_msgSend(v5, "warpTransform");
      v31 = __invert_f3(v30);
      DWORD2(v23) = v31.columns[0].i32[2];
      DWORD2(v24) = v31.columns[1].i32[2];
      *(_QWORD *)&v23 = v31.columns[0].i64[0];
      *(_QWORD *)&v24 = v31.columns[1].i64[0];
      DWORD2(v25) = v31.columns[2].i32[2];
      *(_QWORD *)&v25 = v31.columns[2].i64[0];
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9);
      for (i = 0; i != 3; ++i)
      {
        for (j = 0; j != 48; j += 16)
        {
          LODWORD(v8) = *(_DWORD *)((char *)&v23 + 4 * (i & 3) + j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v11);

        }
      }
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v3, "extent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v21 + 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v22 + 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0D522A0]);
      v27[0] = CFSTR("transform");
      v27[1] = CFSTR("extent");
      v28[0] = v7;
      v28[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithResult:", v18);

    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0D522A0]);
      v19 = (void *)objc_msgSend(v20, "initWithResult:", MEMORY[0x1E0C9AA70]);
    }

  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__PILongExposureFusionAutoCalculator__computeCleanAperture___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, __int128 *, id, uint64_t);
  __int128 v11;
  __int128 v12;
  id v13;
  __int128 v14;
  __int128 v15;

  v3 = *(_OWORD *)(MEMORY[0x1E0D51EA0] + 16);
  v14 = *MEMORY[0x1E0D51EA0];
  v15 = v3;
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v4)
  {
    objc_msgSend(v4, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "cleanAperture");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    v14 = v11;
    v15 = v12;

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void (**)(uint64_t, __int128 *, id, uint64_t))(v9 + 16);
  v11 = v14;
  v12 = v15;
  v10(v9, &v11, v6, v5);

}

@end
