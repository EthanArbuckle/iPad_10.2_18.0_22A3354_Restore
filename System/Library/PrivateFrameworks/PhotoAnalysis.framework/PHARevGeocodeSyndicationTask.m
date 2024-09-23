@implementation PHARevGeocodeSyndicationTask

- (NSString)name
{
  return (NSString *)CFSTR("PHARevGeocodeSyndicationTask");
}

- (double)period
{
  return 86400.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
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

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  NSObject *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  uint8_t v9[16];

  v3 = a3;
  -[NSObject photoLibrary](v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemPhotoLibrary");

  if ((v5 & 1) != 0)
  {
    v6 = -[NSObject isReady](v3, "isReady");
  }
  else
  {
    -[NSObject workingContext](v3, "workingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "loggingConnection");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CAC16000, v3, OS_LOG_TYPE_DEFAULT, "Task is running on a non system photo library, not running syndication processing job", v9, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0D76270];
  v9 = a3;
  v10 = [v8 alloc];
  objc_msgSend(v9, "workingContextForEnrichment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithWorkingContext:", v11);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PHARevGeocodeSyndicationTask_runWithGraphManager_progressReporter_error___block_invoke;
  v15[3] = &unk_1E8521438;
  v16 = v7;
  v13 = v7;
  LOBYTE(a5) = objc_msgSend(v12, "processSyndicatedAssetRevGeoCodingWithError:progressBlock:", a5, v15);

  return (char)a5;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHARevGeocodeSyndicationTask timeoutFatal:]", "PHARevGeocodeSyndicationTask.m", 73, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHARevGeocodeSyndicationTask is stuck", v3, 2u);
  }
}

uint64_t __75__PHARevGeocodeSyndicationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

@end
