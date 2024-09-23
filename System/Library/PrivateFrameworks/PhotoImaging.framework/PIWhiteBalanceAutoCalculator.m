@implementation PIWhiteBalanceAutoCalculator

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_5324();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5324();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2114;
        v29 = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", self);
  objc_msgSend(v7, "setName:", CFSTR("PIWhiteBalanceAutoCalculator-imageProperties"));
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke;
  v23[3] = &unk_1E5019368;
  v24 = v6;
  v25 = v5;
  v23[4] = self;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "submit:", v23);

}

- (BOOL)_useTempTint:(id)a3
{
  double v4;
  double v5;
  double v6;
  $7CC5A320EBB83734983E5E759578C212 v7;

  v7 = a3;
  v4 = 0.0;
  v5 = 0.0;
  YIQFromRGB(v7.var0, &v6, &v5, &v4, 0.0, 1.0, 0.0);
  return sqrt(v4 * v4 + v5 * v5) > 0.0399999991;
}

- ($7CC5A320EBB83734983E5E759578C212)_correctedRGBResultFromResult:(id)a3
{
  double v3;
  double v4;
  double v5;
  int8x16_t v6;
  float64x2_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  $7CC5A320EBB83734983E5E759578C212 result;

  v3 = a3.var0[2];
  v4 = a3.var0[1];
  v5 = a3.var0[0];
  a3.var0[0] = a3.var0[1] * -0.0276515931 + a3.var0[0] * 1.02395463 + a3.var0[2] * 0.0029618456;
  v19 = *(int8x16_t *)a3.var0;
  *(double *)v6.i64 = pow(fabs(a3.var0[0]), 0.25);
  v7.f64[0] = NAN;
  v7.f64[1] = NAN;
  v8 = (int8x16_t)vnegq_f64(v7);
  v9 = vbslq_s8(v8, v6, v19);
  v19.i64[0] = v9.i64[0];
  v20 = v8;
  *(double *)v9.i64 = v4 * 0.949478984 + v5 * 0.0207923874 + v3 * 0.0304754861;
  v18 = v9;
  *(double *)v10.i64 = pow(fabs(*(double *)v9.i64), 0.25);
  v11 = vbslq_s8(v20, v10, v18);
  v18.i64[0] = v11.i64[0];
  *(double *)v11.i64 = v4 * -0.00190263637 + v5 * -0.0020549444 + v3 * 1.00394022;
  v17 = v11;
  *(double *)v12.i64 = pow(fabs(*(double *)v11.i64), 0.25);
  *(_QWORD *)&v13 = vbslq_s8(v20, v12, v17).u64[0];
  v14 = 1.0;
  v16 = *(double *)v18.i64;
  v15 = *(double *)v19.i64;
  result.var0[3] = v14;
  result.var0[2] = v13;
  result.var0[1] = v16;
  result.var0[0] = v15;
  return result;
}

- ($7CC5A320EBB83734983E5E759578C212)_chooseNeutralGrayForNonSushi:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  uint8_t v14[16];
  $7CC5A320EBB83734983E5E759578C212 result;

  v3 = a3->var0.var0[0];
  v4 = a3->var0.var0[1];
  v5 = a3->var0.var0[2];
  v6 = a3->var0.var0[3];
  v7 = a3->var1.var0[0];
  v8 = a3->var1.var0[1];
  v9 = a3->var1.var0[2];
  v10 = sqrt((v4 + -1.0) * (v4 + -1.0) + (a3->var0.var0[0] + -1.0) * (a3->var0.var0[0] + -1.0) + (v5 + -1.0)
                                                                                               * (v5 + -1.0));
  v11 = sqrt((v8 + -1.0) * (v8 + -1.0) + (v7 + -1.0) * (v7 + -1.0) + (v9 + -1.0) * (v9 + -1.0));
  if (v11 < v10 && vabdd_f64(v11, v10) > 0.01)
  {
    v6 = a3->var1.var0[3];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v12 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_1A6382000, v12, OS_LOG_TYPE_DEBUG, "Choosing gray world instead of gray edge", v14, 2u);
    }
    v5 = v9;
    v4 = v8;
    v3 = v7;
  }
  v13 = v6;
  result.var0[3] = v13;
  result.var0[2] = v5;
  result.var0[1] = v4;
  result.var0[0] = v3;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_chooseTempTintForSushi:(id *)a3 RAWProperties:(id)a4 brightness:(double)a5
{
  $7CC5A320EBB83734983E5E759578C212 *p_var1;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  double *v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint8_t buf[8];
  double v40;
  double v41;
  double v42;
  double v43;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  p_var1 = &a3->var1;
  v8 = a4;
  objc_msgSend(v8, "inputNeutralXYFromRGB:", p_var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  v43 = v11;

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;
  v42 = v14;

  objc_msgSend(v8, "inputNeutralXYFromRGB:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  v41 = v18;

  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  v40 = v21;

  v23 = angular_error(v19, v22);
  v24 = angular_error(v12, v15);
  if (v24 >= v23 || vabdd_f64(v24, v23) <= 0.01)
  {
    v26 = &v40;
    v27 = &v41;
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    v25 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A6382000, v25, OS_LOG_TYPE_DEBUG, "Choosing gray world instead of gray edge", buf, 2u);
    }
    v26 = &v42;
    v27 = &v43;
    v22 = v15;
    v19 = v12;
  }
  v28 = sqrt((v22 + -0.358500004) * (v22 + -0.358500004) + (v19 + -0.345699996) * (v19 + -0.345699996));
  if (v28 <= 0.0)
    v29 = 1.0;
  else
    v29 = 0.112999998 / v28;
  v30 = fmax(pow(fmin(v29, 1.0), 0.330000013), 0.5);
  v31 = v30 + (1.0 - v30) * 0.125;
  *v27 = (1.0 - v31) * 0.345699996 + v31 * v19;
  *v26 = (1.0 - v31) * 0.358500004 + v31 * v22;
  *(double *)buf = 0.0;
  nu_xy_to_tempTint();
  v32 = 0.0;
  if (a5 + -5.0 >= 0.0)
    v32 = (a5 + -5.0) / 5.0;
  v33 = 1.0 - pow(v32, 0.330000013);
  v34 = 1.0;
  if (v33 < 1.0)
  {
    v34 = 0.0;
    if (v33 >= 0.0)
      v34 = v33;
  }
  v35 = (1.0 - v34) * dbl_1A64DDE50[*(double *)buf > 6500.0] + v34 * *v27;
  v36 = (1.0 - v34) * dbl_1A64DDE60[*(double *)buf > 6500.0] + v34 * *v26;

  v37 = v35;
  v38 = v36;
  result.var1 = v38;
  result.var0 = v37;
  return result;
}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  PIFaceBalanceAutoCalculator *v9;
  dispatch_queue_t v10;
  uint64_t v11;
  NSObject *v12;
  _PIWhiteColorCalculator *v13;
  uint64_t v14;
  NSObject *v15;
  _PIWhiteColorCalculator *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  NSObject *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[6];
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  id v58[2];

  v3 = a2;
  v58[0] = 0;
  objc_msgSend(v3, "result:", v58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v58[0];
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "rawProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__5351;
    v56[4] = __Block_byref_object_dispose__5352;
    v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__5351;
    v54[4] = __Block_byref_object_dispose__5352;
    v55 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__5351;
    v52[4] = __Block_byref_object_dispose__5352;
    v53 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__5351;
    v50[4] = __Block_byref_object_dispose__5352;
    v51 = 0;
    v8 = dispatch_group_create();
    v9 = -[PIFaceBalanceAutoCalculator initWithRequest:isRAW:]([PIFaceBalanceAutoCalculator alloc], "initWithRequest:isRAW:", *(_QWORD *)(a1 + 32), v7 != 0);
    v10 = dispatch_queue_create("PIFaceBalanceAutoCalculator.responseQueue", 0);
    -[NURenderRequest setResponseQueue:](v9, "setResponseQueue:", v10);

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__5351;
    v48[4] = __Block_byref_object_dispose__5352;
    v49 = 0;
    dispatch_group_enter(v8);
    v11 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_2;
    v43[3] = &unk_1E5016558;
    v45 = v54;
    v46 = v56;
    v47 = v48;
    v12 = v8;
    v44 = v12;
    -[PIFaceBalanceAutoCalculator submit:](v9, "submit:", v43);
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x4010000000;
    v40[3] = "";
    v41 = 0u;
    v42 = 0u;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3010000000;
    v39[4] = 0;
    v39[5] = 0;
    v39[3] = "";
    v13 = -[_PIWhiteColorCalculator initWithComposition:useSushi:]([_PIWhiteColorCalculator alloc], "initWithComposition:useSushi:", *(_QWORD *)(a1 + 40), 0);
    dispatch_group_enter(v12);
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_3;
    v35[3] = &unk_1E50162A0;
    v14 = *(_QWORD *)(a1 + 32);
    v37 = v40;
    v35[4] = v14;
    v38 = v52;
    v15 = v12;
    v36 = v15;
    -[_PIWhiteColorCalculator calculateColorWithProperties:completion:](v13, "calculateColorWithProperties:completion:", v6, v35);
    if (v7)
    {
      v16 = -[_PIWhiteColorCalculator initWithComposition:useSushi:]([_PIWhiteColorCalculator alloc], "initWithComposition:useSushi:", *(_QWORD *)(a1 + 40), 1);
      dispatch_group_enter(v15);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_4;
      v30[3] = &unk_1E50162F0;
      v17 = *(_QWORD *)(a1 + 32);
      v33 = v39;
      v30[4] = v17;
      v31 = v6;
      v34 = v50;
      v32 = v15;
      -[_PIWhiteColorCalculator calculateColorWithProperties:completion:](v16, "calculateColorWithProperties:completion:", v31, v30);

      v11 = MEMORY[0x1E0C809B0];
    }
    objc_msgSend(*(id *)(a1 + 32), "responseQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_5;
    block[3] = &unk_1E5016318;
    v22 = v54;
    v19 = *(id *)(a1 + 48);
    v23 = v52;
    v24 = v50;
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v19;
    v25 = v40;
    v26 = v56;
    v29 = v7 != 0;
    v27 = v48;
    v28 = v39;
    dispatch_group_notify(v15, v18, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v50, 8);

    _Block_object_dispose(v52, 8);
    _Block_object_dispose(v54, 8);

    _Block_object_dispose(v56, 8);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = 0;
  objc_msgSend(a2, "result:", &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  if (!v3)
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OrigI"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OrigQ"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    v8 = (void *)v7;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Warmth"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {

      goto LABEL_10;
    }
    v10 = (void *)v9;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Strength"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OrigI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v12, CFSTR("faceI"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OrigQ"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("faceQ"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Warmth"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v14, CFSTR("faceWarmth"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Strength"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v15, CFSTR("faceStrength"));

      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = CFSTR("faceBalance");

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WarmTint"));
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v21, CFSTR("warmTemp"));

          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WarmTint"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v22, CFSTR("warmTint"));

          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v6 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = CFSTR("warmTint");
          goto LABEL_10;
        }
      }
    }
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _OWORD v14[4];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  id v21;

  v21 = 0;
  objc_msgSend(a2, "result:", &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
  if (v3)
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "pi_grayColorResultValue");
    v5 = *(void **)(a1 + 32);
    v14[2] = v18;
    v14[3] = v19;
    v15 = v20;
    v14[0] = v16;
    v14[1] = v17;
    objc_msgSend(v5, "_chooseNeutralGrayForNonSushi:", v14);
    v6 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v6[4] = v7;
    v6[5] = v8;
    v6[6] = v9;
    v6[7] = v10;
  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _OWORD v13[4];
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  id v20;

  v20 = 0;
  objc_msgSend(a2, "result:", &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;
  if (v3)
  {
    v19 = 0.0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "pi_grayColorResultValue");
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "rawProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v17;
    v13[3] = v18;
    v14 = v19;
    v13[0] = v15;
    v13[1] = v16;
    objc_msgSend(v5, "_chooseTempTintForSushi:RAWProperties:brightness:", v13, v6, v19);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 40) = v9;

  }
  else
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __39__PIWhiteBalanceAutoCalculator_submit___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  const __CFString *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "_correctedRGBResultFromResult:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 56));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRGBResult:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("grayColor"));

  nu_rgb_to_tempTint();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (!*(_QWORD *)(v3 + 40))
  {
    if (*(_BYTE *)(a1 + 104))
    {
      nu_xy_to_tempTint();
      v4 = objc_msgSend(*(id *)(a1 + 32), "_useTempTint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 56));
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v5 = *(void **)(v3 + 40);
      if (v4)
      {
        v6 = CFSTR("tempTint");
LABEL_11:
        *(_QWORD *)(v3 + 40) = v6;

        goto LABEL_12;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = CFSTR("neutralGray");
    goto LABEL_11;
  }
LABEL_12:
  v7 = fmin(0.0, 150.0);
  if (v7 < -150.0)
    v7 = -150.0;
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKeyedSubscript:", v8, CFSTR("temperature"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("tint"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("colorType"));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

@end
