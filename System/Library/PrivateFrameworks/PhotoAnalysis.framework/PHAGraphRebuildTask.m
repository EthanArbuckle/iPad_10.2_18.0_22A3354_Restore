@implementation PHAGraphRebuildTask

- (PHAGraphRebuildTask)initWithMode:(unint64_t)a3
{
  PHAGraphRebuildTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAGraphRebuildTask;
  result = -[PHAGraphRebuildTask init](&v5, sel_init);
  if (result)
    result->_rebuildTaskMode = a3;
  return result;
}

- (PHAGraphRebuildTask)init
{
  return -[PHAGraphRebuildTask initWithMode:](self, "initWithMode:", 0);
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAGraphRebuildTask");
}

- (double)period
{
  return 21600.0;
}

- (double)incrementalWindow
{
  return 604800.0;
}

- (unint64_t)version
{
  return 615;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return CFSTR("PHAGraphRebuildTaskIncrementalKey");
}

- (id)taskClassDependencies
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D760A0], "graphConsistencyCheckIsEnabled"))
  {
    v4[0] = objc_opt_class();
    v4[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "libraryAnalysisState");
  if (v4 == 1)
  {
    objc_msgSend(v3, "workingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: Graph is already rebuilding, skipping rebuild tasks", v8, 2u);
    }

  }
  return v4 != 1;
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  char v12;
  void *v13;
  NSObject *v14;
  unint64_t rebuildTaskMode;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_rebuildTaskMode != 1)
  {
    v22 = 0;
    v12 = objc_msgSend(v7, "isReadyWithError:", &v22);
    v10 = v22;
    if ((v12 & 1) != 0)
    {
      if (self->_rebuildTaskMode == 2)
      {
        objc_msgSend(v7, "workingContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "loggingConnection");
        v14 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          rebuildTaskMode = self->_rebuildTaskMode;
          *(_DWORD *)buf = 134217984;
          v24 = rebuildTaskMode;
          _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "Returning YES for shouldRunIncrementally: Current mode is IncrementalUpdate, %lu", buf, 0xCu);
        }
        v11 = 1;
        goto LABEL_17;
      }
      if (!objc_msgSend(v7, "mePersonContactIdentifierDidChangeWithGraphUpdate:", v8))
      {
        v11 = 1;
        goto LABEL_18;
      }
      objc_msgSend(v7, "workingContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "Returning NO for shouldRunIncrementally: IncrementalChange contains a contactIdentifier update of Me person";
        v18 = v14;
        v19 = 2;
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v7, "workingContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (unint64_t)v10;
        v17 = "Returning NO for shouldRunIncrementally: Graph is not ready and need a full rebuild: %@";
        v18 = v14;
        v19 = 12;
LABEL_15:
        _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v7, "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, "Returning NO for shouldRunIncrementally: Current mode is ForceRebuild", buf, 2u);
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  dispatch_block_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint8_t *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v9 = a4;
  if (self->_rebuildTaskMode == 2)
  {
    objc_msgSend(v8, "workingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v11, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: Returning NO for full rebuild run: Current mode is ForceIncrementalUpdate", buf, 2u);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 14, CFSTR("Current mode is ForceIncrementalUpdate, the task does not support graph full rebuild"));
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__530;
    v30 = __Block_byref_object_dispose__531;
    v31 = 0;
    v13 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_538);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76020]), "initWithGraphManager:", v8);
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_2;
    v24[3] = &unk_1E8521438;
    v25 = v9;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_3;
    v18[3] = &unk_1E851F638;
    v19 = v8;
    v20 = v25;
    v22 = &v32;
    v23 = buf;
    v16 = v13;
    v21 = v16;
    objc_msgSend(v14, "performFullRebuildWithProgressBlock:completionBlock:", v24, v18);
    dispatch_block_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v27 + 5));
    v12 = *((_BYTE *)v33 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
  }

  return v12;
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
    v33 = __Block_byref_object_copy__530;
    v34 = __Block_byref_object_dispose__531;
    v35 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_168;
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
    v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_165);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__530;
    v34 = __Block_byref_object_dispose__531;
    v35 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_2;
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
      _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "PHAGraphRebuildTask: IncrementalChange has nothing to do", buf, 2u);
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
    __assert_rtn("-[PHAGraphRebuildTask timeoutFatal:]", "PHAGraphRebuildTask.m", 209, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAGraphRebuildTask is stuck", v3, 2u);
  }
}

- (unint64_t)rebuildTaskMode
{
  return self->_rebuildTaskMode;
}

void __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_2(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void __88__PHAGraphRebuildTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke_168(uint64_t a1, void *a2)
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

uint64_t __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.7);
  *a2 = result;
  return result;
}

void __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_4;
    v10[3] = &unk_1E8521438;
    v6 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "validateGraphConsistencyIfNeededWithProgressBlock:", v10);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __66__PHAGraphRebuildTask_runWithGraphManager_progressReporter_error___block_invoke_4(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.3 + 0.7);
  *a2 = result;
  return result;
}

@end
