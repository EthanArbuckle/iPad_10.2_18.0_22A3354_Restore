@implementation PXPeopleProgressManager

- (PXPeopleProgressManager)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPeopleProgressManager *v5;
  PXPeopleProgressManager *v6;
  PXPeopleProgressDataSource *v7;
  PXPeopleProgressDataSource *dataSource;
  PXPeopleProgressDataSource *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleProgressManager;
  v5 = -[PXPeopleProgressManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_updateInterval = 1.0;
    v5->_processingStatus = 0;
    v7 = -[PXPeopleProgressDataSource initWithPhotoLibrary:]([PXPeopleProgressDataSource alloc], "initWithPhotoLibrary:", v4);
    dataSource = v6->_dataSource;
    v6->_dataSource = v7;
    v9 = v7;

    -[PXPeopleProgressDataSource loadQueryData](v9, "loadQueryData");
    v6->_progressLock._os_unfair_lock_opaque = 0;
    v10 = *MEMORY[0x1E0DC4850];
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__logFaceCounts, v10, 0);

  }
  return v6;
}

- (void)setMonitoringProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  os_unfair_lock_s lock;

  v3 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressManager progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  if (self->_monitoringProgress != v3)
  {
    self->_monitoringProgress = v3;
    if (v3)
    {
      os_unfair_lock_unlock(&lock);
      -[PXPeopleProgressManager updateProgressWithForce:](self, "updateProgressWithForce:", 0);
      return;
    }
    if (self->_statusTimer)
    {
      -[PXPeopleProgressManager statusTimer](self, "statusTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      -[PXPeopleProgressManager setStatusTimer:](self, "setStatusTimer:", 0);
    }
  }
  os_unfair_lock_unlock(&lock);
}

- (void)setUpdateInterval:(double)a3
{
  double v5;
  os_unfair_lock_s lock;

  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressManager progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  if (self->_updateInterval != a3)
  {
    v5 = 1.0;
    if (a3 >= 1.0)
      v5 = a3;
    self->_updateInterval = v5;
  }
  os_unfair_lock_unlock(&lock);
}

- (BOOL)featureUnlocked
{
  void *v2;
  char v3;
  char v4;

  -[PXPeopleProgressManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReadyForAnalysis");
  v4 = v3 & objc_msgSend(v2, "hasHomePeople");

  return v4;
}

- (BOOL)shouldUseInterstitial
{
  return -[PXPeopleProgressManager hasSubstantialProcessingRemainingForThreshold:](self, "hasSubstantialProcessingRemainingForThreshold:", 0);
}

- (int64_t)processingStatus
{
  void *v3;
  int64_t processingStatus;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[PXPeopleProgressManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PXPeopleProgressManager_processingStatus__block_invoke;
  v6[3] = &unk_1E5127828;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "updateProgressIfNeededWithReportBlock:", v6);

  processingStatus = self->_processingStatus;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return processingStatus;
}

- (void)shouldUseProgressFooterWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleProgressManager.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  +[PXPeopleProgressManager _progressFooterQueue](PXPeopleProgressManager, "_progressFooterQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXPeopleProgressManager_shouldUseProgressFooterWithCompletion___block_invoke;
  block[3] = &unk_1E5148CE0;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3
{
  return -[PXPeopleProgressManager _hasSubstantialProcessingRemainingForThreshold:allowMocking:](self, "_hasSubstantialProcessingRemainingForThreshold:allowMocking:", a3, 1);
}

- (void)updateProgressWithForce:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  NSObject *v6;
  _QWORD v7[5];
  os_unfair_lock_s lock;

  v3 = a3;
  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressManager progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  v5 = -[PXPeopleProgressManager monitoringProgress](self, "monitoringProgress");
  os_unfair_lock_unlock(&lock);
  if (v5 || v3)
  {
    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    dispatch_async(v6, v7);

  }
}

- (BOOL)_hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 allowMocking:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v16[4];
  id v17;
  id location;
  __int16 v19;

  v4 = a4;
  v19 = 0;
  +[PXPeopleProgressManager shouldCheckProcessedCounts:hasSubstantialProcessingRemaining:threshold:featureUnlocked:](PXPeopleProgressManager, "shouldCheckProcessedCounts:hasSubstantialProcessingRemaining:threshold:featureUnlocked:", (char *)&v19 + 1, &v19, a3, -[PXPeopleProgressManager featureUnlocked](self, "featureUnlocked"));
  if (HIBYTE(v19))
  {
    -[PXPeopleProgressManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__PXPeopleProgressManager__hasSubstantialProcessingRemainingForThreshold_allowMocking___block_invoke;
    v16[3] = &unk_1E5127828;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v7, "updateProgressIfNeededWithReportBlock:", v16);
    v8 = objc_msgSend(v7, "allowedAssetCount");
    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2)
      {
        v10 = 0;
LABEL_8:
        -[PXPeopleProgressManager dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "photoLibrary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v19) = +[PXPeopleProgressManager hasSubstantialProcessingRemainingForThreshold:pendingAssetCount:allowedAssetCount:photoLibrary:](PXPeopleProgressManager, "hasSubstantialProcessingRemainingForThreshold:pendingAssetCount:allowedAssetCount:photoLibrary:", a3, v10, v8, v12);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        goto LABEL_9;
      }
      v9 = objc_msgSend(v7, "pendingToLatestVersionAssetCount");
    }
    else
    {
      v9 = objc_msgSend(v7, "pendingToAnyVersionAssetCount");
    }
    v10 = v9;
    goto LABEL_8;
  }
LABEL_9:
  if (v4
    && (+[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "mockProcessingUpdates"),
        v13,
        v14))
  {
    return (-[PXPeopleProgressManager mockSubstantialProcessingCount](self, "mockSubstantialProcessingCount") & 0x8000000000000001) == 1;
  }
  else
  {
    return (_BYTE)v19 != 0;
  }
}

- (void)_updateStatusForIsReadyForAnalysis:(BOOL)a3 progress:(double)a4 processCount:(int64_t)a5
{
  void *v8;
  _BOOL4 v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  id v18;
  char v19;
  _QWORD aBlock[4];
  id v21[2];
  BOOL v22;
  char v23;
  BOOL v24;
  id location;

  -[PXPeopleProgressManager dataSource](self, "dataSource", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PXPeopleProgressManager progressComplete:](PXPeopleProgressManager, "progressComplete:", a4);
  v10 = objc_msgSend(v8, "hasHomePeople");
  v11 = v10;
  v12 = v9 & ~v10;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke;
  aBlock[3] = &unk_1E5127850;
  objc_copyWeak(v21, &location);
  v22 = a3;
  v23 = v11;
  v24 = v9;
  v21[1] = *(id *)&a4;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_2;
  block[3] = &unk_1E51427B0;
  v14 = _Block_copy(aBlock);
  v18 = v14;
  v19 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (v12 == 1)
  {
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_3;
    v15[3] = &unk_1E51417E8;
    v16 = v14;
    objc_msgSend(v8, "requestPersonPromoterStatusWithCompletionBlock:", v15);

  }
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)_scheduleNextUpdate
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  os_unfair_lock_s v14;
  id location;
  os_unfair_lock_s lock;

  lock._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressManager progressLock](self, "progressLock");
  os_unfair_lock_lock(&lock);
  -[PXPeopleProgressManager statusTimer](self, "statusTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPeopleProgressManager monitoringProgress](self, "monitoringProgress");
  os_unfair_lock_unlock(&lock);
  if (!v3 && v4)
  {
    objc_initWeak(&location, self);
    v14._os_unfair_lock_opaque = (uint32_t)-[PXPeopleProgressManager progressLock](self, "progressLock");
    os_unfair_lock_lock(&v14);
    v5 = (void *)MEMORY[0x1E0C99E88];
    -[PXPeopleProgressManager updateInterval](self, "updateInterval");
    v7 = v6;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __46__PXPeopleProgressManager__scheduleNextUpdate__block_invoke;
    v12 = &unk_1E5141230;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleProgressManager setStatusTimer:](self, "setStatusTimer:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    os_unfair_lock_unlock(&v14);
    objc_destroyWeak(&location);
  }

}

- (void)_handleAsyncUpdateIsReadyForAnalysis:(BOOL)a3 processedToAnyVersionProgress:(int64_t)a4 processedToAnyVersionCount:(int64_t)a5
{
  _QWORD block[5];

  -[PXPeopleProgressManager _updateStatusForIsReadyForAnalysis:progress:processCount:](self, "_updateStatusForIsReadyForAnalysis:progress:processCount:", a3, a5, (double)a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PXPeopleProgressManager__handleAsyncUpdateIsReadyForAnalysis_processedToAnyVersionProgress_processedToAnyVersionCount___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)debug_ignoreMockingHasSubstantialProcessingRemainingForThreshold:(int64_t)a3
{
  return -[PXPeopleProgressManager _hasSubstantialProcessingRemainingForThreshold:allowMocking:](self, "_hasSubstantialProcessingRemainingForThreshold:allowMocking:", a3, 0);
}

- (void)_logFaceCounts
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXPeopleProgressManager__logFaceCounts__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (PXPeopleProgressDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)monitoringProgress
{
  return self->_monitoringProgress;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void)setProcessingStatus:(int64_t)a3
{
  self->_processingStatus = a3;
}

- (NSTimer)statusTimer
{
  return self->_statusTimer;
}

- (void)setStatusTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusTimer, a3);
}

- (os_unfair_lock_s)progressLock
{
  return self->_progressLock;
}

- (int64_t)mockSubstantialProcessingCount
{
  return self->_mockSubstantialProcessingCount;
}

- (void)setMockSubstantialProcessingCount:(int64_t)a3
{
  self->_mockSubstantialProcessingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __41__PXPeopleProgressManager__logFaceCounts__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  int v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  int v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  os_unfair_lock_s lock;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  double v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  lock._os_unfair_lock_opaque = objc_msgSend(*(id *)(a1 + 32), "progressLock");
  os_unfair_lock_lock(&lock);
  v3 = objc_msgSend(*(id *)(a1 + 32), "monitoringProgress");
  objc_msgSend(*(id *)(a1 + 32), "updateInterval");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v7 = v6;
  v8 = objc_msgSend(*(id *)(a1 + 32), "featureUnlocked");
  v9 = objc_msgSend(*(id *)(a1 + 32), "shouldUseInterstitial");
  v10 = objc_msgSend(*(id *)(a1 + 32), "processingStatus");
  os_unfair_lock_unlock(&lock);
  v11 = +[PXPeopleProgressManager progressComplete:](PXPeopleProgressManager, "progressComplete:", v7);
  v12 = objc_msgSend(v2, "isReadyForAnalysis");
  v13 = objc_msgSend(v2, "hasHomePeople");
  +[PXPeopleProgressManager statusStringForStatus:](PXPeopleProgressManager, "statusStringForStatus:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v37 = v2;
    if (v3)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v17 = v16;
    v33 = v17;
    if (v11)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = v12;
    v20 = v18;
    v32 = v20;
    v36 = v17;
    if (v8)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v22 = v21;
    v35 = v20;
    if (v19)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v24 = v23;
    v34 = v22;
    if (v13)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v26 = v14;
    v27 = v25;
    v28 = v24;
    if (v9)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    v30 = v29;
    v31 = v27;
    *(_DWORD *)buf = 136317442;
    v40 = "-[PXPeopleProgressManager _logFaceCounts]_block_invoke";
    v41 = 2112;
    v42 = v33;
    v43 = 2048;
    v44 = v5;
    v45 = 2048;
    v46 = v7;
    v47 = 2112;
    v48 = v32;
    v49 = 2112;
    v50 = v22;
    v51 = 2112;
    v52 = v24;
    v53 = 2112;
    v54 = v27;
    v14 = v26;
    v55 = 2112;
    v56 = v30;
    v57 = 2112;
    v58 = v26;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_INFO, "%s, monitoringProgress: %@, updateInterval: %f, progress: %f, progressComplete: %@, featureUnlocked: %@ ((isReadyForAnalysis: %@) && (hasHomePeople: %@)), shouldUseInterstitial: %@, statusString: %@", buf, 0x66u);

    v2 = v37;
  }

  objc_msgSend(*(id *)(a1 + 32), "shouldUseProgressFooterWithCompletion:", &__block_literal_global_150_110611);
}

void __41__PXPeopleProgressManager__logFaceCounts__block_invoke_148(uint64_t a1, int a2)
{
  NSObject *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = v4;
    v6 = 136315394;
    v7 = "-[PXPeopleProgressManager _logFaceCounts]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "%s, shouldUseProgressFooter: %@", (uint8_t *)&v6, 0x16u);

  }
}

uint64_t __121__PXPeopleProgressManager__handleAsyncUpdateIsReadyForAnalysis_processedToAnyVersionProgress_processedToAnyVersionCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextUpdate");
}

void __46__PXPeopleProgressManager__scheduleNextUpdate__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMockSubstantialProcessingCount:", objc_msgSend(WeakRetained, "mockSubstantialProcessingCount") + 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "updateProgressWithForce:", 0);

}

void __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke(uint64_t a1, int a2, int a3)
{
  id WeakRetained;
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  os_unfair_lock_s lock;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  lock._os_unfair_lock_opaque = objc_msgSend(WeakRetained, "progressLock");
  os_unfair_lock_lock(&lock);
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mockEmptyContentUpdates");

  if (v8)
  {
    v9 = objc_msgSend(WeakRetained, "processingStatus") == 4;
    v10 = 3;
LABEL_11:
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    goto LABEL_14;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (!*(_BYTE *)(a1 + 49))
    {
      if (*(_BYTE *)(a1 + 50))
        v12 = a2;
      else
        v12 = 1;
      v9 = (v12 | a3 ^ 1) == 0;
      v10 = 2;
      goto LABEL_11;
    }
    v11 = 4;
  }
  else
  {
    v11 = 1;
  }
LABEL_14:
  objc_msgSend(WeakRetained, "setProcessingStatus:", v11);
  if (objc_msgSend(WeakRetained, "monitoringProgress"))
  {
    objc_msgSend(WeakRetained, "setProgress:", *(double *)(a1 + 40));
    os_unfair_lock_unlock(&lock);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("PXPeopleProgressDidChangeNotification"), WeakRetained);

  }
  else
  {
    os_unfair_lock_unlock(&lock);
  }

}

uint64_t __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_4;
  v3[3] = &unk_1E51427B0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __84__PXPeopleProgressManager__updateStatusForIsReadyForAnalysis_progress_processCount___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 40));
}

void __87__PXPeopleProgressManager__hasSubstantialProcessingRemainingForThreshold_allowMocking___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStatusForIsReadyForAnalysis:progress:processCount:", a2, a6, a4);

}

void __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke_2;
  v3[3] = &unk_1E5127828;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "asyncUpdateProgressWithReportBlock:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__PXPeopleProgressManager_updateProgressWithForce___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAsyncUpdateIsReadyForAnalysis:processedToAnyVersionProgress:processedToAnyVersionCount:", a2, (uint64_t)a4, a6);

}

uint64_t __65__PXPeopleProgressManager_shouldUseProgressFooterWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hasSubstantialProcessingRemainingForThreshold:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __43__PXPeopleProgressManager_processingStatus__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStatusForIsReadyForAnalysis:progress:processCount:", a2, a6, a4);

}

+ (BOOL)hasSubstantialProcessingRemainingForThreshold:(int64_t)a3 pendingAssetCount:(int64_t)a4 allowedAssetCount:(int64_t)a5 photoLibrary:(id)a6
{
  id v9;
  double v10;
  int v12;

  v9 = a6;
  v10 = ceil((double)a5 * 0.05);
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      if (!a4)
        goto LABEL_14;
      if (v10 > 150.0)
        v10 = 150.0;
      if (v10 <= (double)a4)
        LOBYTE(v12) = 1;
      else
LABEL_14:
        v12 = objc_msgSend((id)objc_opt_class(), "isFaceProcessingFinishedForPhotoLibrary:", v9) ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = v10 <= (double)a4 && a4 != 0;
  }

  return v12;
}

+ (BOOL)isFaceProcessingFinishedForPhotoLibrary:(id)a3
{
  return objc_msgSend(a3, "isFaceProcessingFinished");
}

+ (BOOL)progressComplete:(double)a3
{
  return 100.0 - a3 < 0.00001;
}

+ (void)shouldCheckProcessedCounts:(BOOL *)a3 hasSubstantialProcessingRemaining:(BOOL *)a4 threshold:(int64_t)a5 featureUnlocked:(BOOL)a6
{
  BOOL v8;
  BOOL v9;

  if (a6)
  {
    v8 = +[PXPeopleProgressManager shouldCheckProcessedCountsForThreshold:](PXPeopleProgressManager, "shouldCheckProcessedCountsForThreshold:", a5);
    v9 = v8;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  *a3 = v8;
  *a4 = v9;
}

+ (BOOL)shouldCheckProcessedCountsForThreshold:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

+ (id)_progressFooterQueue
{
  if (_progressFooterQueue_onceToken != -1)
    dispatch_once(&_progressFooterQueue_onceToken, &__block_literal_global_110654);
  return (id)_progressFooterQueue_footerQueue;
}

+ (id)statusStringForStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("PXPeopleProcessStatusNotAvailable");
  else
    return off_1E51278B0[a3 - 1];
}

void __47__PXPeopleProgressManager__progressFooterQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.people.progressFooter", v2);
  v1 = (void *)_progressFooterQueue_footerQueue;
  _progressFooterQueue_footerQueue = (uint64_t)v0;

}

@end
