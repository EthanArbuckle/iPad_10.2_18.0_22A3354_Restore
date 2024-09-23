@implementation PLPersistentHistoryUtilities

+ (id)fetchTransactionsSinceMarker:(id)a3 withFetchRequest:(id)a4 batchSize:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  id v30;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = v15;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("marker"));

    if (v16)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    goto LABEL_3;
  }
  if (!v15)
    goto LABEL_5;
LABEL_3:
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__PLPersistentHistoryUtilities_fetchTransactionsSinceMarker_withFetchRequest_batchSize_context_error___block_invoke;
  v25[3] = &unk_1E366FF68;
  v26 = v13;
  v27 = v14;
  v29 = a5;
  v30 = a1;
  v28 = v16;
  v17 = v16;
  v18 = v14;
  v19 = v13;
  objc_msgSend(v17, "pl_resultWithError:block:", a7, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "result");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)fetchTransactionCountSinceToken:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__PLPersistentHistoryUtilities_fetchTransactionCountSinceToken_withContext_error___block_invoke;
  v17[3] = &unk_1E366FF90;
  v19 = v10;
  v20 = a1;
  v18 = v9;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v11, "pl_resultWithError:block:", a5, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)oldestTransactionWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(a1, "_fetchSingleTransactionWithContext:sortAscending:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)newestTransactionWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(a1, "_fetchSingleTransactionWithContext:sortAscending:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_fetchSingleTransactionWithContext:(id)a3 sortAscending:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __81__PLPersistentHistoryUtilities__fetchSingleTransactionWithContext_sortAscending___block_invoke;
  v18 = &unk_1E366FFB8;
  v21 = a4;
  v20 = a1;
  v7 = v6;
  v19 = v7;
  objc_msgSend(v7, "pl_resultWithError:block:", &v22, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (!v8)
  {
    PLPersistentHistoryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to fetch single persistent history transaction: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v8, "result", v15, v16, v17, v18);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    PLPersistentHistoryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Fetching single persistent history result is empty", buf, 2u);
    }

    v11 = 0;
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v11 = v10;
  -[NSObject firstObject](v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

+ (BOOL)deleteHistoryBeforeToken:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PLPersistentHistoryUtilities_deleteHistoryBeforeToken_withContext_error___block_invoke;
  v17[3] = &unk_1E366FF90;
  v19 = v10;
  v20 = a1;
  v18 = v9;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v11, "pl_resultWithError:block:", a5, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;

  return v14;
}

+ (BOOL)deleteHistoryBeforeDate:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_withContext_error___block_invoke;
  v19[3] = &unk_1E366FF90;
  v21 = v11;
  v22 = a1;
  v20 = v9;
  v12 = v11;
  v13 = v9;
  objc_msgSend(v12, "pl_resultWithError:block:", a5, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 != 0;

  return v15;
}

+ (BOOL)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4 withContext:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  unint64_t v24;
  id v25;

  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __116__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_whenHistoryPercentageOfStoreIsGreaterThan_withContext_error___block_invoke;
  v21[3] = &unk_1E366FFE0;
  v24 = a4;
  v25 = a1;
  v22 = v11;
  v23 = v13;
  v14 = v13;
  v15 = v11;
  objc_msgSend(v14, "pl_resultWithError:block:", a6, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 != 0;

  return v17;
}

+ (id)_executePersistentHistoryChangeRequest:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0;
  objc_msgSend(v6, "executeRequest:error:", v5, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v8)
    {
      PLChangeHandlingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v6, "persistentStoreCoordinator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v6;
        v18 = 2114;
        v19 = v12;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_FAULT, "Unexepcted nil error when feching persistent history, context: %{public}@, PSC: %{public}@, changeRequest: %{pubic}@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134301, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;

  return v13;
}

+ (int64_t)fetchApproximateHistoryRecordCountInLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentHistoryUtilities.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photosDatabasePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D732C0];
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "openDatabaseAtPath:capabilities:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Failed to load database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45001, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -1;
    if (!a4)
      goto LABEL_12;
LABEL_11:
    *a4 = objc_retainAutorelease(v18);
    goto LABEL_12;
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v17 = MEMORY[0x1E0C809B0];
  v31 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke;
  v27[3] = &unk_1E3670008;
  v27[4] = &v32;
  if (objc_msgSend(v16, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("SELECT min(Z_PK) FROM ACHANGE"), v27)&& (v26[0] = v17, v26[1] = 3221225472, v26[2] = __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke_2, v26[3] = &unk_1E3670008, v26[4] = &v28, objc_msgSend(v16, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("SELECT max(Z_PK) FROM ACHANGE"), v26)))
  {
    v18 = 0;
    v19 = v29[3] - v33[3];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Failed to execute statement");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45001, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -1;
  }
  objc_msgSend(v16, "close");
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  if (a4)
    goto LABEL_11;
LABEL_12:

  return v19;
}

+ (id)archivedDataWithToken:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    pl_result_with_autoreleasepool();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)unarchiveTokenWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    pl_result_with_autoreleasepool();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)transactionNumberFromToken:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "storeTokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLPersistentHistoryGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "unexpected number of stores in token: %@", (uint8_t *)&v10, 0xCu);
      }

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __55__PLPersistentHistoryUtilities_unarchiveTokenWithData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3710];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    PLPersistentHistoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to unarchive token data: %@", buf, 0xCu);
    }

  }
  return v5;
}

id __54__PLPersistentHistoryUtilities_archivedDataWithToken___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
  {
    PLPersistentHistoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unable to archive token: %@", buf, 0xCu);
    }

  }
  return v2;
}

sqlite3_int64 __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

sqlite3_int64 __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __116__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_whenHistoryPercentageOfStoreIsGreaterThan_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97BD8], "deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_executePersistentHistoryChangeRequest:withContext:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97BD8], "deleteHistoryBeforeDate:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_executePersistentHistoryChangeRequest:withContext:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __75__PLPersistentHistoryUtilities_deleteHistoryBeforeToken_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97BD8], "deleteHistoryBeforeToken:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_executePersistentHistoryChangeRequest:withContext:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __81__PLPersistentHistoryUtilities__fetchSingleTransactionWithContext_sortAscending___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97BF0], "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryWithFetchRequest:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 3);
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_executePersistentHistoryChangeRequest:withContext:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__PLPersistentHistoryUtilities_fetchTransactionCountSinceToken_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 48), "_executePersistentHistoryChangeRequest:withContext:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __102__PLPersistentHistoryUtilities_fetchTransactionsSinceMarker_withFetchRequest_batchSize_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "changeRequestForFetching");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 5);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "setFetchRequest:");
  else
    objc_msgSend(v2, "setFetchBatchSize:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "_executePersistentHistoryChangeRequest:withContext:", v2, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
