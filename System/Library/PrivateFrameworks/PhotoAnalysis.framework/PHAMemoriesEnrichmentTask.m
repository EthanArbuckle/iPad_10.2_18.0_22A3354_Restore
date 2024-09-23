@implementation PHAMemoriesEnrichmentTask

- (PHAMemoriesEnrichmentTask)initWithOptions:(id)a3
{
  id v4;
  PHAMemoriesEnrichmentTask *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAMemoriesEnrichmentTask;
  v5 = -[PHAMemoriesEnrichmentTask init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("limit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfMemoriesToEnrich = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAMemoriesEnrichmentTask");
}

- (double)period
{
  return -2.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 0;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return objc_msgSend(a3, "isReadyWithError:", &v4);
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[PHAMemoriesEnrichmentTask memoriesEnrichmentProcessor](self, "memoriesEnrichmentProcessor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "runWithGraphManager:incrementalChange:progressReporter:error:", v9, 0, v8, a5);

  return (char)a5;
}

- (BOOL)runWithGraphManager:(id)a3 withIncrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[PHAMemoriesEnrichmentTask memoriesEnrichmentProcessor](self, "memoriesEnrichmentProcessor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "runWithGraphManager:incrementalChange:progressReporter:error:", v12, v11, v10, a6);

  return (char)a6;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAMemoriesEnrichmentTask timeoutFatal:]", "PHAMemoriesEnrichmentTask.m", 78, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAMemoriesEnrichmentTask is stuck", v3, 2u);
  }
}

- (id)memoriesEnrichmentProcessor
{
  id v2;

  if (self->_numberOfMemoriesToEnrich)
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75FB0]), "initWithNumberOfMemoriesToEnrich:", self->_numberOfMemoriesToEnrich);
  else
    v2 = objc_alloc_init(MEMORY[0x1E0D75FB0]);
  return v2;
}

@end
