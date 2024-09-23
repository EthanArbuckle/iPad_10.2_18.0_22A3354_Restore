@implementation TPSTargetingValidator

uint64_t __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  dispatch_queue_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  TPSTargetingValidateOperation *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  void (**v34)(void *, uint64_t, _QWORD);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id obj;
  void *v45;
  void *v46;
  __CFString *v48;
  __CFString *v49;
  void (**v50)(void *, uint64_t, _QWORD);
  _QWORD v51[4];
  NSObject *v52;
  __CFString *v53;
  id v54;
  id v55;
  uint64_t *v56;
  int64_t v57;
  _QWORD v58[4];
  NSObject *v59;
  id v60;
  id v61;
  __CFString *v62;
  id v63;
  id v64;
  void (**v65)(void *, uint64_t, _QWORD);
  uint64_t *v66;
  id v67[2];
  id location;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  _QWORD aBlock[4];
  id v75;
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v13 = (__CFString *)a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = CFSTR("unspecified");
  v49 = v13;
  if (v13)
    v17 = v13;
  v48 = v17;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA1DF630;
  v77 = &v78;
  v41 = v15;
  v75 = v41;
  v40 = v16;
  v76 = v40;
  v50 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator") & 1) != 0 || !objc_msgSend(v42, "count"))
  {
    v50[2](v50, 1, 0);
  }
  else
  {
    if (objc_msgSend(v42, "count") == 1)
    {
      objc_msgSend(v42, "firstObject");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_validateCondition:joinType:context:cache:completionQueue:completionHandler:", v18, a4, v13, v14, v41, v50);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v42, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v20, "setMaxConcurrentOperationCount:", -1);
      objc_msgSend(v20, "setSuspended:", 1);
      v46 = v20;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = dispatch_queue_create(0, v21);

      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_3;
      v73[3] = &__block_descriptor_40_e8_B16__0q8l;
      v73[4] = a4;
      v45 = _Block_copy(v73);
      v43 = (void *)objc_opt_new();
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v42;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v70 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            v27 = -[TPSTargetingValidateOperation initWithTargetingCondition:]([TPSTargetingValidateOperation alloc], "initWithTargetingCondition:", v26);
            -[TPSTargetingValidateOperation setContext:](v27, "setContext:", v49);
            objc_msgSend(v26, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v29 = objc_msgSend(v14, "cacheResultForIdentifier:", v28);
              if (v29 != -1)
              {
                -[TPSTargetingValidateOperation setResult:](v27, "setResult:", v29);
                objc_msgSend(v43, "addObject:", v27);
              }
            }
            objc_initWeak(&location, v27);
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_4;
            v58[3] = &unk_1EA1DF6A0;
            objc_copyWeak(v67, &location);
            v59 = v22;
            v60 = v14;
            v30 = v28;
            v61 = v30;
            v64 = v45;
            v66 = &v78;
            v62 = v48;
            v65 = v50;
            v67[1] = (id)a4;
            v63 = v46;
            -[TPSTargetingValidateOperation setCompletionBlock:](v27, "setCompletionBlock:", v58);
            objc_msgSend(v19, "addObject:", v27);

            objc_destroyWeak(v67);
            objc_destroyWeak(&location);

          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        }
        while (v23);
      }

      v31 = v46;
      objc_msgSend(v46, "addOperations:waitUntilFinished:", v19, 0);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_8;
      v51[3] = &unk_1EA1DF6F0;
      v32 = v22;
      v52 = v32;
      v33 = v48;
      v53 = v33;
      v56 = &v78;
      v18 = v19;
      v54 = v18;
      v57 = a4;
      v34 = v50;
      v55 = v34;
      objc_msgSend(v46, "addBarrierBlock:", v51);
      if (objc_msgSend(v43, "count"))
      {
        v35 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 == 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "predicateWithFormat:", CFSTR("(result == %@)"), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "filteredArrayUsingPredicate:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "count"))
        {
          objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:].cold.1((uint64_t)v33, a4 == 1, v39);

          v34[2](v34, a4 == 1, 0);
        }

        v31 = v46;
      }
      if (*((_BYTE *)v79 + 24))
        objc_msgSend(v31, "cancelAllOperations");
      objc_msgSend(v31, "setSuspended:", 0);

    }
  }

  _Block_object_dispose(&v78, 8);
}

+ (void)_validateCondition:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (__CFString *)a5;
  v13 = a6;
  v14 = a8;
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (v16 = objc_msgSend(v13, "cacheResultForIdentifier:", v15), v16 == -1))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __101__TPSTargetingValidator__validateCondition_joinType_context_cache_completionQueue_completionHandler___block_invoke;
    v21[3] = &unk_1EA1DF718;
    v22 = v13;
    v23 = v15;
    v24 = v14;
    objc_msgSend(v11, "validateWithCompletion:", v21);

  }
  else
  {
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = CFSTR("unspecified");
      if (v12)
        v19 = v12;
      v20 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v26 = v19;
      v27 = 2112;
      v28 = v15;
      if (v17 == 1)
        v20 = CFSTR("YES");
      v29 = 2112;
      v30 = v20;
      _os_log_debug_impl(&dword_1DAC2F000, v18, OS_LOG_TYPE_DEBUG, "[%@] - Using cached result for precondition (%@) - Valid: %@", buf, 0x20u);
    }

    (*((void (**)(id, BOOL, _QWORD))v14 + 2))(v14, v17 == 1, 0);
  }

}

void __101__TPSTargetingValidator__validateCondition_joinType_context_cache_completionQueue_completionHandler___block_invoke(_QWORD *a1, unsigned int a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a2;
  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  objc_msgSend(v5, "addCacheResult:forIdentifier:", v4, v6);
  (*(void (**)(void))(a1[6] + 16))();

}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1EA1DF608;
    v12 = *(id *)(a1 + 40);
    v13 = a2;
    v11 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "result") != -1)
    objc_msgSend(*(id *)(a1 + 40), "addCacheResult:forIdentifier:", objc_msgSend(*(id *)(a1 + 32), "result"), *(_QWORD *)(a1 + 48));
  result = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 32), "result"));
  if ((_DWORD)result && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96) == 1, 0);
    result = objc_msgSend(*(id *)(a1 + 64), "operationCount");
    if (result)
      return objc_msgSend(*(id *)(a1 + 64), "cancelAllOperations");
  }
  return result;
}

BOOL __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(_QWORD *)(a1 + 32) == 0) != a2;
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(result == %@)"), &unk_1EA1F08F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v11, "count");
    if (!v12)
      objc_msgSend(*(id *)(a1 + 40), "count");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5;
  block[3] = &unk_1EA1DF678;
  v10 = WeakRetained;
  v3 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 88);
  v15 = v4;
  v17 = v5;
  v13 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 104);
  v16 = v6;
  v18 = v7;
  v14 = *(id *)(a1 + 64);
  v8 = WeakRetained;
  dispatch_async(v3, block);

}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9;
  block[3] = &unk_1EA1DF6C8;
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  v11 = v4;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v9 = v5;
  v12 = v6;
  v10 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

+ (BOOL)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  char v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v17 = dispatch_semaphore_create(0);
  v18 = (void *)objc_opt_class();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_error___block_invoke;
  v23[3] = &unk_1EA1DF5E0;
  v25 = &v33;
  v26 = &v27;
  v19 = v17;
  v24 = v19;
  objc_msgSend(v18, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v13, a4, v14, v15, v16, v23);
  v20 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v20);
  if (a8)
    *a8 = objc_retainAutorelease((id)v28[5]);
  v21 = *((_BYTE *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v21;
}

void __89__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_error___block_invoke(uint64_t a1, char a2, id obj)
{
  char v5;
  id v6;

  if (obj)
    v5 = 0;
  else
    v5 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)validateConditions:(os_log_t)log joinType:context:cache:completionQueue:completionHandler:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  if ((a2 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_DEBUG, "[%@] - Using cached results - Valid: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, a2, a3, "[%@] - EARLY EXITING", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DAC2F000, a2, a3, "[%@] - ALL FINISHED", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
