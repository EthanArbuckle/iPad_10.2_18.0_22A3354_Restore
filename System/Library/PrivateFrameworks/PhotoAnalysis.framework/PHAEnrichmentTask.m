@implementation PHAEnrichmentTask

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)period
{
  id v2;

  PHAAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (int)priority
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v5 = objc_msgSend(v4, "isReadyWithError:", &v11);
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v4, "workingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[PHAEnrichmentTask name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_INFO, "[%@] graph is not ready, not running enrichment task.", buf, 0xCu);

    }
  }

  return v5;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0D75F88];
  v10 = a3;
  v11 = [v9 alloc];
  -[PHAEnrichmentTask enrichmentProcessor](self, "enrichmentProcessor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithManager:enrichmentProcessors:", v10, v13);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__PHAEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
  v17[3] = &unk_1E8521438;
  v18 = v8;
  v15 = v8;
  LOBYTE(a5) = objc_msgSend(v14, "enrichDataModelWithError:progressBlock:", a5, v17);

  return (char)a5;
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E0D75F88];
  v12 = a4;
  v13 = a3;
  v14 = [v11 alloc];
  -[PHAEnrichmentTask enrichmentProcessor](self, "enrichmentProcessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithManager:enrichmentProcessors:", v13, v16);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__PHAEnrichmentTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke;
  v20[3] = &unk_1E8521438;
  v21 = v10;
  v18 = v10;
  LOBYTE(a6) = objc_msgSend(v17, "enrichDataModelWithGraphUpdateInventory:error:progressBlock:", v12, a6, v20);

  return (char)a6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAEnrichmentTask timeoutFatal:]", "PHAEnrichmentTask.m", 76, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAEnrichmentTask is stuck", v3, 2u);
  }
}

- (PGGraphDataModelEnrichmentProcessor)enrichmentProcessor
{
  id v2;

  PHAAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

uint64_t __86__PHAEnrichmentTask_runWithGraphManager_withIncrementalChange_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

uint64_t __64__PHAEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

@end
