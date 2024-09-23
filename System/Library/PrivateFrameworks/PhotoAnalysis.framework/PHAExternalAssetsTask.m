@implementation PHAExternalAssetsTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAExternalAssetsTask");
}

- (double)period
{
  return 21600.0;
}

- (PHAExternalAssetsTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAExternalAssetsTask;
  return -[PHAExternalAssetsTask init](&v3, sel_init);
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
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  if (!_os_feature_enabled_impl())
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemPhotoLibrary");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "workingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_DEFAULT, "Task is running on a non system photo library, not running external asset processing job", v10, 2u);
    }

    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "isReady");
LABEL_8:

  return v6;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0D75D10];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  objc_msgSend(v9, "workingContextForExternalRelevance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithWorkingContext:", v11);
  LOBYTE(a5) = objc_msgSend(v12, "processExternalAssetRelevanceInferenceWithError:progressReporter:", a5, v8);

  return (char)a5;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAExternalAssetsTask timeoutFatal:]", "PHAExternalAssetsTask.m", 84, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAExternalAssetsTask is stuck", v3, 2u);
  }
}

@end
