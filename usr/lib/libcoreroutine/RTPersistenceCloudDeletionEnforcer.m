@implementation RTPersistenceCloudDeletionEnforcer

- (BOOL)processRequestsSinceReferenceDate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  RTPersistenceCloudDeletionEnforcer *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "options") & 2) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This opertion requires a context with RTPersistenceContextOptionsAllowTombstones."), 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__104;
    v24 = __Block_byref_object_dispose__104;
    v25 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke;
    v16[3] = &unk_1E92A1840;
    v17 = v8;
    v19 = self;
    p_buf = &buf;
    v18 = v9;
    objc_msgSend(v18, "performBlockAndWait:", v16);
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("A managed object context is required.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("A managed object context is required.");
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v12);

    v10 = 0;
  }

  return v10;
}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int8x16_t *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  void *v42;
  int8x16_t v43;
  id v44;
  _QWORD v45[7];
  _QWORD v46[7];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  +[RTEntityDeletionRequestMO fetchRequest](RTEntityDeletionRequestMO, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("creationDate"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v6);

  if (!v4)
  objc_msgSend(v2, "setFetchLimit:", 10);
  v7 = 0;
  v38 = v2;
  while (1)
  {
    v8 = *(void **)(a1 + 40);
    v51 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v2, &v51);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v51;

    if (v10)
      break;
    v11 = objc_msgSend(v9, "count");
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (!v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "no entity deletion requests to process", buf, 2u);
      }
      goto LABEL_31;
    }
    if (v13)
    {
      v14 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v54 = v14;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "processing %lu entity deletion requests", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "transactionAuthor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setTransactionAuthor:", CFSTR("CloudDeletion"));
    v42 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = v9;
    v7 = v9;
    v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v48;
      obj = v7;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v19, "recordIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "targetDeviceIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = a1;
          objc_msgSend(*(id *)(a1 + 40), "currentDevice");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v22, "isEqual:", v25);

          if (v26)
          {
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v27 = (int8x16_t *)v46;
            v46[2] = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_16;
          }
          else
          {
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v27 = (int8x16_t *)v45;
            v45[2] = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_2;
          }
          v27[1].i64[1] = (uint64_t)&unk_1E92A1818;
          a1 = v23;
          v43 = *(int8x16_t *)(v23 + 40);
          v28 = (id)v43.i64[0];
          v27[2] = vextq_s8(v43, v43, 8uLL);
          v27[3].i64[0] = (uint64_t)v42;
          objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v27);

          objc_autoreleasePoolPop(v20);
        }
        v7 = obj;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v16);
    }

    v2 = v38;
    v9 = v40;
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v29 = *(void **)(a1 + 40);
      v44 = 0;
      objc_msgSend(v29, "save:", &v44);
      v30 = v44;
      if (v30)
        objc_msgSend(v42, "addObject:", v30);

    }
    _RTSafeArray();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    objc_msgSend(*(id *)(a1 + 40), "setTransactionAuthor:", v39, 1);
    objc_msgSend(v38, "setFetchOffset:", objc_msgSend(v38, "fetchOffset") + objc_msgSend(v7, "count"));
    objc_msgSend(*(id *)(a1 + 40), "reset");

    if (!objc_msgSend(v7, "count"))
      goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v54 = (uint64_t)v10;
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "error while fetching entity deletion requests to process, %@", buf, 0xCu);
  }

  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v10;
  v12 = v10;

LABEL_31:
LABEL_32:

}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  objc_msgSend(v4, "performBatchDeleteOfEntityWithName:identifiers:context:error:", a2, a3, v5, &v7);
  v6 = v7;
  if (v6)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  objc_msgSend(v4, "applyTombstonesToEntityWithName:identifiers:context:error:", a2, a3, v5, &v7);
  v6 = v7;
  if (v6)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

- (BOOL)performBatchDeleteOfEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t *v23;
  SEL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("entityName");
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("context");
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v11, "count"))
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__104;
    v29 = __Block_byref_object_dispose__104;
    v30 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__RTPersistenceCloudDeletionEnforcer_performBatchDeleteOfEntityWithName_identifiers_context_error___block_invoke;
    v19[3] = &unk_1E929DA50;
    v20 = v10;
    v21 = v11;
    v23 = buf;
    v24 = a2;
    v22 = v13;
    objc_msgSend(v22, "performBlockAndWait:", v19);
    if (a6)
      *a6 = objc_retainAutorelease(*((id *)v26 + 5));
    v14 = *((_QWORD *)v26 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = 1;
  }
LABEL_18:

  return v14;
}

void __99__RTPersistenceCloudDeletionEnforcer_performBatchDeleteOfEntityWithName_identifiers_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v2);
  objc_msgSend(v4, "setResultType:", 2);
  v5 = *(void **)(a1 + 48);
  v13 = 0;
  objc_msgSend(v5, "executeRequest:error:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v7;

}

- (BOOL)applyTombstonesToEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t *v23;
  SEL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("entityName");
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("context");
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v11, "count"))
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__104;
    v29 = __Block_byref_object_dispose__104;
    v30 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __96__RTPersistenceCloudDeletionEnforcer_applyTombstonesToEntityWithName_identifiers_context_error___block_invoke;
    v19[3] = &unk_1E929DA50;
    v20 = v10;
    v21 = v11;
    v23 = buf;
    v24 = a2;
    v22 = v13;
    objc_msgSend(v22, "performBlockAndWait:", v19);
    if (a6)
      *a6 = objc_retainAutorelease(*((id *)v26 + 5));
    v14 = *((_QWORD *)v26 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = 1;
  }
LABEL_18:

  return v14;
}

void __96__RTPersistenceCloudDeletionEnforcer_applyTombstonesToEntityWithName_identifiers_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AB0]), "initWithEntityName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in (%@)"), CFSTR("identifier"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("bitwiseOr:with:(%@, %lu)"), CFSTR("flags"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFSTR("flags");
  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToUpdate:", v5);

  objc_msgSend(v2, "setResultType:", 2);
  v6 = *(void **)(a1 + 48);
  v14 = 0;
  objc_msgSend(v6, "executeRequest:error:", v2, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v10;
    v17 = 2112;
    v18 = v2;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, request, %@, updated count, %@, error, %@", buf, 0x2Au);

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;

}

@end
