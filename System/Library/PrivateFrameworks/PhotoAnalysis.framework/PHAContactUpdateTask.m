@implementation PHAContactUpdateTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAContactUpdateTask");
}

- (double)period
{
  return 86400.0;
}

- (unint64_t)version
{
  return 615;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (BOOL)supportsIncremental
{
  return 0;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D760A0], "graphConsistencyCheckIsEnabled"))
  {
    v4[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
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
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  v4 = objc_msgSend(v3, "isReadyWithError:", &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "workingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_ERROR, "Returning NO for shouldRunWithGraphManager: Graph is not ready and need a full rebuild: %@", buf, 0xCu);
    }

  }
  return v4;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  __int128 *p_buf;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "graphUpdateForContactsChangesWithProgressReporter:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, "PHAContactUpdateTask: Graph update %@", (uint8_t *)&buf, 0xCu);
  }
  if ((objc_msgSend(v11, "hasAnythingToDo") & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76028]), "initWithGraphManager:", v7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "PHAContactUpdateTask: Run with graphUpdate= %@", (uint8_t *)&buf, 0xCu);
    }
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6942;
    v28 = __Block_byref_object_dispose__6943;
    v29 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__PHAContactUpdateTask_runWithGraphManager_progressReporter_error___block_invoke;
    v17[3] = &unk_1E8521058;
    v19 = &v21;
    p_buf = &buf;
    v14 = v13;
    v18 = v14;
    objc_msgSend(v12, "applyChangesFromGraphUpdate:progressReporter:completionHandler:", v11, v8, v17);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v15 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v15 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "PHAContactUpdateTask: There is nothing to apply from Contacts update", (uint8_t *)&buf, 2u);
    }
  }

  return v15;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAContactUpdateTask timeoutFatal:]", "PHAContactUpdateTask.m", 108, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAContactUpdateTask is stuck", v3, 2u);
  }
}

void __67__PHAContactUpdateTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
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
