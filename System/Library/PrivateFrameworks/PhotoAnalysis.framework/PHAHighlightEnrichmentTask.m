@implementation PHAHighlightEnrichmentTask

- (double)period
{
  return 10800.0;
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
  return 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0D75FF8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithHighlightTailorOptions:", -[PHAHighlightEnrichmentTask tailorOptions](self, "tailorOptions"));
  v12 = objc_alloc(MEMORY[0x1E0D75F88]);
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithManager:enrichmentProcessors:", v10, v13);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__PHAHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
  v19[3] = &unk_1E8521438;
  v20 = v8;
  v15 = v8;
  LOBYTE(a5) = objc_msgSend(v14, "enrichDataModelWithError:progressBlock:", a5, v19);
  self->_featureAvailable = objc_msgSend(v11, "curatedLibraryFTEIsReady");
  v16 = (void *)MEMORY[0x1E0D75FF8];
  objc_msgSend(v10, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  self->_featureComplete = objc_msgSend(v16, "hasCompletedEnrichmentForLibrary:", v17);
  return (char)a5;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAHighlightEnrichmentTask timeoutFatal:]", "PHAHighlightEnrichmentTask.m", 60, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAHighlightEnrichmentTask is stuck", v3, 2u);
  }
}

- (unint64_t)tailorOptions
{
  if (self->_tailorOptions)
    return self->_tailorOptions;
  else
    return 255;
}

- (unint64_t)featureCode
{
  return 102;
}

- (void)setTailorOptions:(unint64_t)a3
{
  self->_tailorOptions = a3;
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (BOOL)featureComplete
{
  return self->_featureComplete;
}

uint64_t __73__PHAHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

@end
