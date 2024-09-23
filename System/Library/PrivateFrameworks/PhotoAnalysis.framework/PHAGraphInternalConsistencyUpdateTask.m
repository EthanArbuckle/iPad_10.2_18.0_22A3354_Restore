@implementation PHAGraphInternalConsistencyUpdateTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAGraphInternalConsistencyUpdateTask");
}

- (double)period
{
  return -1.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  __CFString *v2;

  v2 = CFSTR("PHAGraphRebuildTaskIncrementalKey");
  return CFSTR("PHAGraphRebuildTaskIncrementalKey");
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D760A0], "graphConsistencyCheckIsEnabled", a3);
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  BOOL v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v8 = objc_msgSend(v6, "isReadyWithError:", &v18);
  v9 = v18;
  if ((v8 & 1) != 0)
  {
    if (!objc_msgSend(v6, "mePersonContactIdentifierDidChangeWithGraphUpdate:", v7))
    {
      v16 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v6, "workingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "PHAGraphInternalConsistencyUpdateTask: Returning NO for shouldRunIncrementally: IncrementalChange contains a"
            " contactIdentifier update of Me person";
      v13 = v11;
      v14 = 2;
LABEL_7:
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    objc_msgSend(v6, "workingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      v12 = "PHAGraphInternalConsistencyUpdateTask: Returning NO for shouldRunIncrementally: Graph is not ready and need "
            "a full rebuild: %@";
      v13 = v11;
      v14 = 12;
      goto LABEL_7;
    }
  }

  v16 = 0;
LABEL_10:

  return v16;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 14, CFSTR("The task does not support graph full rebuild which is handled by PHAGraphRebuildTask"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  dispatch_block_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint8_t buf[8];
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v10, "hasAnythingToDo") & 1) != 0)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D76028]), "initWithGraphManager:", v9);
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1910;
    v34 = __Block_byref_object_dispose__1911;
    v35 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_161;
    v21[3] = &unk_1E8521058;
    v23 = &v36;
    v24 = &v30;
    v14 = v13;
    v22 = v14;
    -[NSObject applyChangesFromGraphUpdate:progressReporter:completionHandler:](v12, "applyChangesFromGraphUpdate:progressReporter:completionHandler:", v10, v11, v21);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (a6)
      *a6 = objc_retainAutorelease((id)v31[5]);
    v15 = *((unsigned __int8 *)v37 + 24);
    v16 = v22;
  }
  else
  {
    v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_1908);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1910;
    v34 = __Block_byref_object_dispose__1911;
    v35 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_158;
    v26[3] = &unk_1E851FE38;
    v28 = &v36;
    v29 = &v30;
    v12 = v17;
    v27 = v12;
    objc_msgSend(v9, "setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate:completionBlock:", v14, v26);
    dispatch_block_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v9, "workingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "PHAGraphInternalConsistencyUpdateTask: IncrementalChange has nothing to do", buf, 2u);
    }

    if (a6)
      *a6 = objc_retainAutorelease((id)v31[5]);
    v15 = *((unsigned __int8 *)v37 + 24);
    v16 = v27;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v15 != 0;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAGraphInternalConsistencyUpdateTask timeoutFatal:]", "PHAGraphInternalConsistencyUpdateTask.m", 125, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAGraphInternalConsistencyUpdateTask is stuck", v3, 2u);
  }
}

void __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_158(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __106__PHAGraphInternalConsistencyUpdateTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_161(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
