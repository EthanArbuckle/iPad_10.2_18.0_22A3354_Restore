@implementation PHASyndicationTask

- (NSString)name
{
  return (NSString *)CFSTR("PHASyndicationTask");
}

- (double)period
{
  return 21600.0;
}

- (PHASyndicationTask)init
{
  PHASyndicationTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASyndicationTask;
  result = -[PHASyndicationTask init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_performCurationJob = 257;
  return result;
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
  int v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  __int16 v15;
  __int16 v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PHASyndicationTaskDisabled"));

  if (v5)
  {
    objc_msgSend(v3, "workingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v8 = "Hubble Feature disabled via user defaults, not running syndication processing job";
      v9 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSystemPhotoLibrary");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v3, "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v8 = "Task is running on a non system photo library, not running syndication processing job";
      v9 = (uint8_t *)&v15;
      goto LABEL_8;
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  v12 = objc_msgSend(v3, "isReady");
LABEL_10:

  return v12;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id *v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;
  int v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _BYTE *, double);
  void *v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[4];
  id v31[2];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v10 = objc_alloc(MEMORY[0x1E0D76270]);
  objc_msgSend(v8, "workingContextForEnrichment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithWorkingContext:", v11);

  if (self->_performCurationJob)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke;
    v30[3] = &unk_1E8521AC0;
    v31[1] = &v32;
    v31[0] = v9;
    v13 = objc_msgSend(v12, "processSyndicatedAssetCurationWithError:progressBlock:", a5, v30);
    if (*((_BYTE *)v33 + 24))
    {
      v14 = v31;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v37 = 95;
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        LOBYTE(v16) = 0;
        *a5 = v15;
LABEL_28:

        goto LABEL_29;
      }
      goto LABEL_27;
    }
    v16 = v13;

  }
  else
  {
    v16 = 1;
  }
  if (self->_performGuestInferenceJob && v16)
  {
    v17 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_137;
    v28[3] = &unk_1E8521AC0;
    v29[1] = &v32;
    v18 = v9;
    v29[0] = v18;
    v19 = objc_msgSend(v12, "processSavedSyndicatedAssetsWithError:progressBlock:", a5, v28);
    v14 = (id *)v29;
    if (*((_BYTE *)v33 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v37 = 102;
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else if (v19)
    {
      v22 = v17;
      v23 = 3221225472;
      v24 = __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_138;
      v25 = &unk_1E8521AC0;
      v27 = &v32;
      v26 = v18;
      v20 = objc_msgSend(v12, "processSyndicatedAssetGuestInferenceWithError:progressBlock:", a5, &v22);
      if (!*((_BYTE *)v33 + 24))
      {
        LOBYTE(v16) = v20;

        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v37 = 108;
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storyt"
              "elling/Tasks/PHASyndicationTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a5 && !*a5)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4, v22, v23, v24, v25);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
LABEL_27:
    LOBYTE(v16) = 0;
    goto LABEL_28;
  }
LABEL_29:

  _Block_object_dispose(&v32, 8);
  return v16;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHASyndicationTask timeoutFatal:]", "PHASyndicationTask.m", 117, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHASyndicationTask is stuck", v3, 2u);
  }
}

- (BOOL)performCurationJob
{
  return self->_performCurationJob;
}

- (void)setPerformCurationJob:(BOOL)a3
{
  self->_performCurationJob = a3;
}

- (BOOL)performGuestInferenceJob
{
  return self->_performGuestInferenceJob;
}

- (void)setPerformGuestInferenceJob:(BOOL)a3
{
  self->_performGuestInferenceJob = a3;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.25);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_137(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.25 + 0.25);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __65__PHASyndicationTask_runWithGraphManager_progressReporter_error___block_invoke_138(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", a3 * 0.5 + 0.5);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
