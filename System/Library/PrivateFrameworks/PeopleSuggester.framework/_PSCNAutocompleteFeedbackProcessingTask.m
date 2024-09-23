@implementation _PSCNAutocompleteFeedbackProcessingTask

+ (id)bundleIDsToProcess
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1A1AFCA24](a1, a2);
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, 0);

  objc_autoreleasePoolPop(v2);
  return v6;
}

+ (id)sourceBundleIDsToIgnore
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1A1AFCA24](a1, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("pstool"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (id)bookmarkFileNameForImplicit:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR(".metadata.archive");
  else
    v3 = CFSTR("-explicit.metadata.archive");
  objc_msgSend(CFSTR("CNA"), "stringByAppendingString:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)persistBookmarkTime:(id)a3 overImplicit:(BOOL)a4 to:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v5 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  if (v10)
  {
    v11 = v10;
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Could not archive bookmark time. %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "bookmarkFileNameForImplicit:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLWithString:relativeToURL:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v9, "writeToURL:options:error:", v15, 0, &v16);
  v11 = v16;

  if (v11)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_PSCNAutocompleteFeedbackProcessingTask persistBookmarkTime:overImplicit:to:].cold.1();
    goto LABEL_7;
  }
LABEL_8:

}

+ (id)loadBookmarkTimeOverImplicit:(BOOL)a3 from:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[16];

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a4;
  objc_msgSend(a1, "bookmarkFileNameForImplicit:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:relativeToURL:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_msgSend(MEMORY[0x1E0C99D68], "classForKeyedUnarchiver"), v11, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v13)
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[_PSCNAutocompleteFeedbackProcessingTask loadBookmarkTimeOverImplicit:from:].cold.1();

      v15 = 0;
    }
    else
    {
      v15 = v12;
    }

  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Could not read archive containing bookmark time (may not exist).", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

+ (void)runWithInferredEnterAndExit:(BOOL)a3 overImplicit:(BOOL)a4 eventFilter:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _PSCNAutocompleteFeedbackInteractionIterator *v36;
  void *v37;
  _PSCNAutocompleteFeedbackInteractionIterator *v38;
  _PSCNAutocompleteFeedbackTracker *v39;
  void *v40;
  id v41;
  _PSCNAutocompleteFeedbackTracker *v42;
  void *v43;
  _PSCNAutocompleteFeedbackTracker *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  const __CFString *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  _PSCNAutocompleteFeedbackTracker *v61;
  _QWORD v62[4];
  id v63;
  _PSCNAutocompleteFeedbackTracker *v64;
  id v65;
  BOOL v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 buf;
  Class (*v72)(uint64_t);
  void *v73;
  uint64_t *v74;
  uint64_t v75;

  v5 = a4;
  v6 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v57 = a5;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v5)
      v8 = CFSTR("YES");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: starting over implicit == %@.", (uint8_t *)&buf, 0xCu);
  }

  v59 = (void *)objc_opt_new();
  objc_msgSend(v59, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss zzz"));
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Feedback"), 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v67 = 0;
    v68 = &v67;
    v69 = 0x2050000000;
    v13 = (void *)getBMStoreConfigClass_softClass_0;
    v70 = getBMStoreConfigClass_softClass_0;
    v14 = MEMORY[0x1E0C809B0];
    if (!getBMStoreConfigClass_softClass_0)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v72 = __getBMStoreConfigClass_block_invoke_0;
      v73 = &unk_1E43FEA00;
      v74 = &v67;
      __getBMStoreConfigClass_block_invoke_0((uint64_t)&buf);
      v13 = (void *)v68[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v67, 8);
    objc_msgSend(v12, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v15, "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v16);

    v67 = 0;
    v68 = &v67;
    v69 = 0x2050000000;
    v17 = (void *)getBMStoreStreamClass_softClass_0;
    v70 = getBMStoreStreamClass_softClass_0;
    if (!getBMStoreStreamClass_softClass_0)
    {
      *(_QWORD *)&buf = v14;
      *((_QWORD *)&buf + 1) = 3221225472;
      v72 = __getBMStoreStreamClass_block_invoke_0;
      v73 = &unk_1E43FEA00;
      v74 = &v67;
      __getBMStoreStreamClass_block_invoke_0((uint64_t)&buf);
      v17 = (void *)v68[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v67, 8);
    v54 = (void *)objc_msgSend([v18 alloc], "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("CNA"), v56);
    objc_msgSend((id)objc_opt_class(), "loadBookmarkTimeOverImplicit:from:", v5, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v19;
    if (v19)
    {
      v58 = v19;
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v59, "stringFromDate:", v58);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: Found bookmark from last time feedback was processed. Starting from %@", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2592000.0);
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v59, "stringFromDate:", v58);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: No bookmark found from last time feedback processed. Starting from 30 days ago: %@", (uint8_t *)&buf, 0xCu);

      }
    }

    objc_msgSend(v58, "timeIntervalSinceReferenceDate");
    objc_msgSend(v54, "publisherFromStartTime:", v32 + 1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0D158E0];
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "storeWithDirectory:readOnly:", v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = [_PSCNAutocompleteFeedbackInteractionIterator alloc];
    objc_msgSend((id)objc_opt_class(), "bundleIDsToProcess");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[_PSCNAutocompleteFeedbackInteractionIterator initWithInteractionStore:bundleIds:startDate:batchSize:](v36, "initWithInteractionStore:bundleIds:startDate:batchSize:", v35, v37, v58, 100);

    LOBYTE(v52) = v5;
    v39 = -[_PSCNAutocompleteFeedbackTracker initWithInteractionIterator:maxSecondsBetweenImpressionAndAction:shouldInferEnterAndExit:impressionLogger:submodelImpressionLogger:actionLogger:defaultForIsImplicit:]([_PSCNAutocompleteFeedbackTracker alloc], "initWithInteractionIterator:maxSecondsBetweenImpressionAndAction:shouldInferEnterAndExit:impressionLogger:submodelImpressionLogger:actionLogger:defaultForIsImplicit:", v38, 60, v6, &__block_literal_global_38, &__block_literal_global_116, &__block_literal_global_118_0, v52);
    objc_msgSend((id)objc_opt_class(), "sourceBundleIDsToIgnore");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v14;
    v62[1] = 3221225472;
    v62[2] = __96___PSCNAutocompleteFeedbackProcessingTask_runWithInferredEnterAndExit_overImplicit_eventFilter___block_invoke_120;
    v62[3] = &unk_1E4401BE8;
    v66 = v5;
    v65 = v57;
    v41 = v40;
    v63 = v41;
    v42 = v39;
    v64 = v42;
    v43 = (void *)MEMORY[0x1A1AFCBF8](v62);
    v60[0] = v14;
    v60[1] = 3221225472;
    v60[2] = __96___PSCNAutocompleteFeedbackProcessingTask_runWithInferredEnterAndExit_overImplicit_eventFilter___block_invoke_129;
    v60[3] = &unk_1E4401C10;
    v44 = v42;
    v61 = v44;
    v45 = (void *)MEMORY[0x1A1AFCBF8](v60);
    v46 = (id)objc_msgSend(v53, "sinkWithCompletion:receiveInput:", v45, v43);
    -[_PSCNAutocompleteFeedbackTracker stopTime](v44, "stopTime");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = (void *)objc_opt_class();
      -[_PSCNAutocompleteFeedbackTracker stopTime](v44, "stopTime");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "persistBookmarkTime:overImplicit:to:", v49, v5, v12);

    }
    objc_msgSend(v35, "closeStorage");
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = CFSTR("NO");
      if (v5)
        v51 = CFSTR("YES");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_1A07F4000, v50, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackProcessingTask: finished over implicit == %@.", (uint8_t *)&buf, 0xCu);
    }

    v23 = (void *)v56;
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      +[_PSCNAutocompleteFeedbackProcessingTask runWithInferredEnterAndExit:overImplicit:eventFilter:].cold.1(v22, v24, v25, v26, v27, v28, v29, v30);
      v23 = v22;
    }
  }

}

+ (void)runOverExplicit
{
  objc_msgSend(a1, "runWithInferredEnterAndExit:overImplicit:eventFilter:", 0, 0, &__block_literal_global_132_0);
}

+ (void)runOverImplicit
{
  objc_msgSend(a1, "runWithInferredEnterAndExit:overImplicit:eventFilter:", 1, 1, &__block_literal_global_133);
}

- (void)execute
{
  objc_msgSend((id)objc_opt_class(), "runOverExplicit");
  objc_msgSend((id)objc_opt_class(), "runOverImplicit");
}

+ (void)persistBookmarkTime:overImplicit:to:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "_PSCNAutocompleteFeedbackProcessingTask: Could not write archive containing bookmark time. %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)loadBookmarkTimeOverImplicit:from:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "_PSCNAutocompleteFeedbackProcessingTask: Could not unarchive bookmark time. %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)runWithInferredEnterAndExit:(uint64_t)a3 overImplicit:(uint64_t)a4 eventFilter:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "_PSCNAutocompleteFeedbackProcessingTask: Error retrieving directory for Biome stream data", a5, a6, a7, a8, 0);
}

@end
