@implementation PLReadyForAnalysis

- (PLReadyForAnalysis)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLReadyForAnalysis *v6;
  PLReadyForAnalysis *v7;
  id v8;
  id v9;
  uint64_t v10;
  PLLazyObject *lazyAppPrivateData;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLReadyForAnalysis;
  v6 = -[PLReadyForAnalysis init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_readyState = 0;
    objc_storeStrong((id *)&v6->_lsm, a3);
    v8 = objc_initWeak(&location, v7);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__PLReadyForAnalysis_initWithLibraryServicesManager___block_invoke;
    v13[3] = &unk_1E3670E50;
    objc_copyWeak(&v15, &location);
    v14 = v5;
    v10 = objc_msgSend(v9, "initWithBlock:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    lazyAppPrivateData = v7->_lazyAppPrivateData;
    v7->_lazyAppPrivateData = (PLLazyObject *)v10;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PLLazyObject invalidate](self->_lazyAppPrivateData, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLReadyForAnalysis;
  -[PLReadyForAnalysis dealloc](&v3, sel_dealloc);
}

- (id)appPrivateData
{
  return (id)-[PLLazyObject objectValue](self->_lazyAppPrivateData, "objectValue");
}

- (BOOL)isReadyForAnalysis
{
  int v3;
  BOOL v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v3 = PLBoolResultWithUnfairLock();
  v4 = v3;
  if (*((_BYTE *)v16 + 24))
    v5 = v3;
  else
    v5 = 0;
  if (v5 == 1)
  {
    -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext", v13, 3221225472, __40__PLReadyForAnalysis_isReadyForAnalysis__block_invoke, &unk_1E3670E78, self, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLReadyForAnalysis isReadyForAnalysis]");
    objc_msgSend(v7, "globalValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "libraryReadyForAnalysisDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = v9 == 0;

    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLibraryReadyForAnalysisDate:", v10);
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v10;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "libraryReadyForAnalysisDate set to %{public}@", buf, 0xCu);
      }

    }
  }
  _Block_object_dispose(&v15, 8);
  return v4;
}

- (BOOL)isReadyForAnalysisQuickCheck
{
  return PLBoolResultWithUnfairLock();
}

- (BOOL)isReadyForAnalysisInitialDownloadCompleted
{
  return PLBoolResultWithUnfairLock();
}

- (void)resetReadyForAnalysisState
{
  PLRunWithUnfairLock();
}

- (BOOL)_lock_isReadyForAnalysisState:(unsigned __int16)a3
{
  int v3;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  return (v3 & ~self->_readyState) == 0;
}

- (void)_lock_checkIsReadyForAnalysisForState:(unsigned __int16)a3
{
  uint64_t v3;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((~self->_readyState & 7) != 0)
  {
    -[PLReadyForAnalysis _lock_checkReadyForCPLStatusForState:](self, "_lock_checkReadyForCPLStatusForState:", v3);
    v5 = -[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 1);
    if ((v3 & 1) == 0 || v5)
    {
      v6 = -[PLLibraryServicesManager isCloudPhotoLibraryEnabled](self->_lsm, "isCloudPhotoLibraryEnabled");
      v7 = (_DWORD)v3 == 6 && v6;
      if (v6)
      {
        if ((_DWORD)v3 != 6)
        {
          v8 = 0;
          goto LABEL_15;
        }
        if (!-[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 6))
        {
          -[PLReadyForAnalysis appPrivateData](self, "appPrivateData");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v10 = v8;
          if (objc_msgSend(v8, "getCachedIsReadyForAnalysisFromSavedState"))
          {
            self->_readyState |= 6u;
          }
          else
          {
            -[PLReadyForAnalysis _lock_checkCPLInitialDownloadStatusForState:](self, "_lock_checkCPLInitialDownloadStatusForState:", v3);
            -[PLReadyForAnalysis _lock_checkComputeCacheStatusForState:](self, "_lock_checkComputeCacheStatusForState:", v3);
            if (v7)
              objc_msgSend(v10, "saveCachedIsReadyForAnalysis:", -[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 6));
          }
          v9 = v10;
          goto LABEL_20;
        }
      }
      else
      {
        self->_readyState |= 2u;
        -[PLReadyForAnalysis _lock_checkComputeCacheStatusForState:](self, "_lock_checkComputeCacheStatusForState:", v3);
      }
      v9 = 0;
LABEL_20:

    }
  }
}

- (void)_lock_checkReadyForCPLStatusForState:(unsigned __int16)a3
{
  char v3;
  void *v5;
  int v6;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 1) != 0
    && !-[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 1))
  {
    -[PLLibraryServicesManager cplReadiness](self->_lsm, "cplReadiness");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReadyForCloudPhotoLibraryWithStatus:", 0);

    if (v6)
      self->_readyState |= 1u;
  }
}

- (void)_lock_checkCPLInitialDownloadStatusForState:(unsigned __int16)a3
{
  char v3;
  void *v5;
  int v6;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 2) != 0
    && !-[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 2))
  {
    -[PLLibraryServicesManager cloudPhotoLibraryManager](self->_lsm, "cloudPhotoLibraryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReadyForAnalysis");

    if (v6)
      self->_readyState |= 2u;
  }
}

- (void)_lock_checkComputeCacheStatusForState:(unsigned __int16)a3
{
  char v3;
  void *v5;
  int v6;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((v3 & 4) != 0
    && -[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 2)
    && !-[PLReadyForAnalysis _lock_isReadyForAnalysisState:](self, "_lock_isReadyForAnalysisState:", 4))
  {
    -[PLLibraryServicesManager computeCacheManager](self->_lsm, "computeCacheManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReadyForAnalysis");

    if (v6)
      self->_readyState |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

void __48__PLReadyForAnalysis_resetReadyForAnalysisState__block_invoke(uint64_t a1)
{
  id v1;

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "appPrivateData");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "saveCachedIsReadyForAnalysis:", 0);

}

uint64_t __64__PLReadyForAnalysis_isReadyForAnalysisInitialDownloadCompleted__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 2);
}

uint64_t __50__PLReadyForAnalysis_isReadyForAnalysisQuickCheck__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 6);
  return objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 6);
}

uint64_t __40__PLReadyForAnalysis_isReadyForAnalysis__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_lock_checkIsReadyForAnalysisForState:", 7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_lock_isReadyForAnalysisState:", 7);
}

id __53__PLReadyForAnalysis_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appPrivateDataForLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
