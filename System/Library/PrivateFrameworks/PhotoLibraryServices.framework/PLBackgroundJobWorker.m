@implementation PLBackgroundJobWorker

- (PLBackgroundJobWorker)init
{

  return 0;
}

- (PLBackgroundJobWorker)initWithLibraryBundle:(id)a3
{
  id v5;
  PLBackgroundJobWorker *v6;
  PLBackgroundJobWorker *v7;
  objc_class *v8;
  uint64_t v9;
  NSString *workerName;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *workerDetailedName;
  NSMutableArray *v18;
  NSMutableArray *pendingJobs;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLBackgroundJobWorker;
  v6 = -[PLBackgroundJobWorker init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    workerName = v7->_workerName;
    v7->_workerName = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v7->_workerName;
    -[PLPhotoLibraryBundle pathManager](v7->_libraryBundle, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "libraryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-@-%@"), v12, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    workerDetailedName = v7->_workerDetailedName;
    v7->_workerDetailedName = (NSString *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingJobs = v7->_pendingJobs;
    v7->_pendingJobs = v18;

    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_shouldStop = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %tu"), self->_workerDetailedName, -[NSMutableArray count](self->_pendingJobs, "count"));
}

- (id)redactedDescription
{
  void *v3;
  NSString *workerName;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  workerName = self->_workerName;
  -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier");
  PLStringFromWellKnownPhotoLibraryIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@ - %tu"), workerName, v6, -[NSMutableArray count](self->_pendingJobs, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldDeferActivity
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldDeferActivity);
  return v2 & 1;
}

- (void)_processNextManagedObjectInLibrary:(id)a3 continueRunning:(BOOL)a4 allowOutsideLimiter:(BOOL)a5
{
  id v9;
  void *v10;
  void *v11;
  _BOOL4 shouldStop;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  NSString *v18;
  unint64_t totalJobsCount;
  id v20;
  id v21;
  void *v22;
  id currentManagedObjectCompletionHandler;
  int64_t *p_workerAtomicCounter;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  PLPhotoLibraryBundle *libraryBundle;
  NSObject *v29;
  NSString *workerName;
  NSObject *v31;
  NSString *v32;
  uint64_t v33;
  id WeakRetained;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42[2];
  _QWORD v43[5];
  id v44;
  BOOL v45;
  uint8_t buf[4];
  PLPhotoLibraryBundle *v47;
  __int16 v48;
  _BYTE v49[14];
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a5
    && !+[PLConcurrencyLimiter isRunningUnderLimiter](PLConcurrencyLimiter, "isRunningUnderLimiter"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobWorker.m"), 116, CFSTR("expected to already be on the limiter"));

  }
  os_unfair_lock_lock(&self->_lock);
  v10 = (void *)-[NSMutableArray count](self->_pendingJobs, "count");
  -[NSMutableArray firstObject](self->_pendingJobs, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  shouldStop = self->_shouldStop;
  v13 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke;
  v43[3] = &unk_1E3675C80;
  v45 = a5;
  v43[4] = self;
  v14 = v9;
  v44 = v14;
  v15 = MEMORY[0x19AEC174C](v43);
  v16 = (void (**)(_QWORD))v15;
  if (!v14)
  {
    PLBackgroundJobServiceGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      libraryBundle = self->_libraryBundle;
      *(_DWORD *)buf = 138412290;
      v47 = libraryBundle;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "_photoLibrary is nil when processing next object, setting shouldStop to YES to initiate job completion. Bundle %@", buf, 0xCu);
    }

    if (a4)
      goto LABEL_19;
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    PLBackgroundJobServiceGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      workerName = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v47 = (PLPhotoLibraryBundle *)workerName;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ continueRunning set to NO. Setting shouldStop to YES to initiate job completion", buf, 0xCu);
    }

    goto LABEL_19;
  }
  if (!shouldStop)
  {
    if (v10)
    {
      PLBackgroundJobServiceGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_workerName;
        totalJobsCount = self->_totalJobsCount;
        *(_DWORD *)buf = 138544130;
        v47 = (PLPhotoLibraryBundle *)v18;
        v48 = 1024;
        *(_DWORD *)v49 = totalJobsCount - (_DWORD)v10 + 1;
        *(_WORD *)&v49[4] = 2048;
        *(_QWORD *)&v49[6] = totalJobsCount;
        v50 = 2114;
        v51 = v11;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ worker processing object %d of %tu: %{public}@", buf, 0x26u);
      }

      objc_initWeak((id *)buf, self);
      v39[0] = v13;
      v39[1] = 3221225472;
      v39[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_38;
      v39[3] = &unk_1E3674D78;
      objc_copyWeak(v42, (id *)buf);
      v20 = v14;
      v40 = v20;
      v42[1] = v10;
      v21 = v11;
      v41 = v21;
      v22 = (void *)MEMORY[0x19AEC174C](v39);
      currentManagedObjectCompletionHandler = self->_currentManagedObjectCompletionHandler;
      self->_currentManagedObjectCompletionHandler = v22;

      p_workerAtomicCounter = &self->_workerAtomicCounter;
      do
        v25 = __ldaxr((unint64_t *)p_workerAtomicCounter);
      while (__stlxr(v25 + 1, (unint64_t *)p_workerAtomicCounter));
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v13;
      v36[1] = 3221225472;
      v36[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3_44;
      v36[3] = &unk_1E3677530;
      v36[4] = self;
      v37 = v21;
      v38 = v20;
      objc_msgSend(v26, "async:identifyingBlock:library:", v36, 0, v38);

      objc_destroyWeak(v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }
    goto LABEL_22;
  }
LABEL_19:
  PLBackgroundJobServiceGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = self->_workerName;
    v33 = -[NSMutableArray count](self->_pendingJobs, "count");
    *(_DWORD *)buf = 138543618;
    v47 = (PLPhotoLibraryBundle *)v32;
    v48 = 2048;
    *(_QWORD *)v49 = v33;
    _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ told to stop halfway! Clearing %tu jobs from _pendingJobs queue", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(WeakRetained, "recordStoppingWorker:withRemainingJobCount:", self, -[NSMutableArray count](self->_pendingJobs, "count"));

  -[NSMutableArray removeAllObjects](self->_pendingJobs, "removeAllObjects");
  v16[2](v16);
LABEL_22:
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_handleAllJobsCompleteInLibrary:(id)a3 allowOutsideLimiter:(BOOL)a4
{
  id v7;
  NSObject *v8;
  NSString *workerName;
  id WeakRetained;
  void *v11;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4
    && !+[PLConcurrencyLimiter isRunningUnderLimiter](PLConcurrencyLimiter, "isRunningUnderLimiter"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobWorker.m"), 245, CFSTR("expected to already be on the limiter"));

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    v12 = 138543362;
    v13 = workerName;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ worker finished processing all jobs", (uint8_t *)&v12, 0xCu);
  }

  (*((void (**)(void))self->_workerCompleteCompletionHandler + 2))();
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(WeakRetained, "recordFinishingWorker:", self);

}

- (id)pendingJobsInLibrary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__92559;
  v20 = __Block_byref_object_dispose__92560;
  v21 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke;
  v13[3] = &unk_1E3676EA0;
  v15 = &v16;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = (void *)MEMORY[0x19AEC174C](v13);
  if (objc_msgSend((id)objc_opt_class(), "usesMultipleLibrariesConcurrently"))
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke_2;
    v11[3] = &unk_1E3676CD8;
    v12 = v7;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v11);
    v8 = v12;
  }
  else
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sync:identifyingBlock:library:", v7, 0, v6);
  }

  v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)startWorkInLibrary:(id)a3 withWorkItemsNeedingProcessing:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id workerCompleteCompletionHandler;
  NSObject *v12;
  NSString *workerName;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a5, "copy");
  workerCompleteCompletionHandler = self->_workerCompleteCompletionHandler;
  self->_workerCompleteCompletionHandler = v10;

  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend(v9, "count"))
    -[NSMutableArray addObjectsFromArray:](self->_pendingJobs, "addObjectsFromArray:", v9);
  self->_totalJobsCount = -[NSMutableArray count](self->_pendingJobs, "count");
  os_unfair_lock_unlock(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    v14 = -[NSMutableArray count](self->_pendingJobs, "count");
    *(_DWORD *)buf = 138543618;
    v21 = workerName;
    v22 = 2048;
    v23 = v14;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ worker has %tu pending jobs. Starting on first one", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(WeakRetained, "recordStartingWorker:withJobCount:", self, -[NSMutableArray count](self->_pendingJobs, "count"));

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__PLBackgroundJobWorker_startWorkInLibrary_withWorkItemsNeedingProcessing_withCompletion___block_invoke;
  v18[3] = &unk_1E3677C18;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  objc_msgSend(v16, "async:identifyingBlock:library:", v18, 0, v17);

}

- (void)stopAllWork
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  NSString *workerName;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSString *v10;
  qos_class_t v11;
  NSObject *v12;
  NSString *v13;
  dispatch_block_t v14;
  id workerForcefullyStopHandler;
  dispatch_time_t v16;
  qos_class_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    workerName = self->_workerName;
    *(_DWORD *)buf = 138543362;
    v23 = workerName;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ worker told to stop all work. Setting _shouldStop flag", buf, 0xCu);
  }

  self->_shouldStop = 1;
  v6 = -[PLBackgroundJobWorker isInterruptible](self, "isInterruptible");
  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  v9 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (v8)
    {
      v10 = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ IS interruptible, asking it to stop working async", buf, 0xCu);
    }

    v11 = qos_class_self();
    dispatch_get_global_queue(v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke;
    block[3] = &unk_1E3677AA0;
    block[4] = self;
    dispatch_async(v12, block);

  }
  else
  {
    if (v8)
    {
      v13 = self->_workerName;
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is not interruptible", buf, 0xCu);
    }

  }
  objc_initWeak((id *)buf, self);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_45;
  v19[3] = &unk_1E3677D48;
  objc_copyWeak(&v20, (id *)buf);
  v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  workerForcefullyStopHandler = self->_workerForcefullyStopHandler;
  self->_workerForcefullyStopHandler = v14;

  v16 = dispatch_time(0, 10000000000);
  v17 = qos_class_self();
  dispatch_get_global_queue(v17, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v16, v18, self->_workerForcefullyStopHandler);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)hasEnoughDiskSpaceToContinue:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_opt_class();
  -[PLPhotoLibraryBundle pathManager](self->_libraryBundle, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "availableDiskSpaceForVolumeURL:", v7);

  if (v8 <= 2)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = CFSTR("stopping due to low available disk space");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 46516, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12);

  }
  return v8 > 2;
}

- (id)photoLibraryWithDatabaseContext:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[PLBackgroundJobWorker workerName](self, "workerName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", objc_msgSend(v5, "UTF8String"));

  return v6;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  PLBackgroundJobWorker *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLBackgroundJobWorker *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  PLAbstractMethodException();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (void)stopWorkingOnItem:(id)a3
{
  id v4;
  PLBackgroundJobWorker *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSString)workerName
{
  return self->_workerName;
}

- (NSString)workerDetailedName
{
  return self->_workerDetailedName;
}

- (PLBackgroundJobStatusCenter)statusCenter
{
  return (PLBackgroundJobStatusCenter *)objc_loadWeakRetained((id *)&self->_statusCenter);
}

- (void)setStatusCenter:(id)a3
{
  objc_storeWeak((id *)&self->_statusCenter, a3);
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return self->_libraryBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
  objc_storeStrong((id *)&self->_workerDetailedName, 0);
  objc_storeStrong((id *)&self->_workerName, 0);
  objc_storeStrong((id *)&self->_pendingJobs, 0);
  objc_storeStrong(&self->_workerForcefullyStopHandler, 0);
  objc_storeStrong(&self->_currentManagedObjectCompletionHandler, 0);
  objc_storeStrong(&self->_workerCompleteCompletionHandler, 0);
}

uint64_t __36__PLBackgroundJobWorker_stopAllWork__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2;
  v2[3] = &unk_1E3677AA0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v2);
}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_45(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2_46;
  v1[3] = &unk_1E3677D48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v1);
  objc_destroyWeak(&v2);
}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2_46(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0D74498];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Worker taking too long to stop, completionHandler forcefully called"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 50001, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    PLBackgroundJobServiceGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = WeakRetained[9];
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Worker %{public}@ taking too long to stop, about to forcefully call its completionHandler", (uint8_t *)&v10, 0xCu);
    }

    v9 = WeakRetained[2];
    if (v9)
      (*(void (**)(uint64_t, NSObject *))(v9 + 16))(v9, v6);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Worker already nil-ed out in _workerForcefullyStopHandler, returning", (uint8_t *)&v10, 2u);
    }
  }

}

void __36__PLBackgroundJobWorker_stopAllWork__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLBackgroundJobServiceGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Going to interrupt %{public}@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "stopWorkingOnItem:", v5);
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ interrupted!", (uint8_t *)&v8, 0xCu);
    }

  }
}

uint64_t __90__PLBackgroundJobWorker_startWorkInLibrary_withWorkItemsNeedingProcessing_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextManagedObjectInLibrary:continueRunning:allowOutsideLimiter:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "workItemsNeedingProcessingInLibrary:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __46__PLBackgroundJobWorker_pendingJobsInLibrary___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke(uint64_t a1)
{
  qos_class_t v2;
  NSObject *v3;
  void *v4;
  id *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[5];
  id v10;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = qos_class_self();
    dispatch_get_global_queue(v2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2;
    block[3] = &unk_1E3677C18;
    v4 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = &v10;
    v10 = v4;
    dispatch_async(v3, block);
  }
  else
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v3 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_4;
    v7[3] = &unk_1E3677C18;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v5 = &v8;
    v8 = v6;
    -[NSObject async:identifyingBlock:library:](v3, "async:identifyingBlock:library:", v7, 0, *(_QWORD *)(a1 + 40));
  }

}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  const os_unfair_lock *WeakRetained;
  os_unfair_lock *v5;
  unint64_t *p_os_unfair_lock_opaque;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  _QWORD v40[5];
  id v41;
  char v42;
  _QWORD v43[5];
  id v44;
  char v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  _BYTE v51[28];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (const os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (os_unfair_lock *)WeakRetained;
  if (!WeakRetained)
  {
    PLBackgroundJobServiceGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Worker already nil-ed out in _currentManagedObjectCompletionHandler, returning";
      v17 = v15;
      v18 = 2;
LABEL_12:
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_13:

    goto LABEL_38;
  }
  os_unfair_lock_assert_not_owner(WeakRetained + 16);
  p_os_unfair_lock_opaque = (unint64_t *)&v5[8]._os_unfair_lock_opaque;
  do
    v7 = __ldaxr(p_os_unfair_lock_opaque);
  while (__stlxr(v7 + 1, p_os_unfair_lock_opaque));
  v8 = atomic_load((unint64_t *)&v5[8]._os_unfair_lock_opaque);
  v9 = atomic_load((unint64_t *)&v5[6]._os_unfair_lock_opaque);
  if (v8 != v9)
  {
    PLBackgroundJobServiceGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)&v5[18]._os_unfair_lock_opaque;
      v20 = atomic_load((unint64_t *)&v5[8]._os_unfair_lock_opaque);
      v21 = atomic_load((unint64_t *)&v5[6]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 138544130;
      v49 = v19;
      v50 = 2048;
      *(_QWORD *)v51 = v20;
      *(_WORD *)&v51[8] = 2048;
      *(_QWORD *)&v51[10] = v21;
      *(_WORD *)&v51[18] = 2114;
      *(_QWORD *)&v51[20] = v3;
      v16 = "Worker %{public}@ completionHandler called more than once, dropping subsequent call. completionHandlerAtomic"
            "Counter: %lld. workerAtomicCounter: %lld. Error: %{public}@";
      v17 = v15;
      v18 = 42;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = PLIsErrorEqualToCode();
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v39 = v10;
    v13 = *(id *)&v5[20]._os_unfair_lock_opaque;
    os_unfair_lock_lock((os_unfair_lock_t)&_background_job_worker_crashtracer_lock);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Worker at fault: %@, wait time: %0.1f seconds"), v13, 0x4024000000000000);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "UTF8String");
      __strlcpy_chk();
      qword_1EE36DAE0 = (uint64_t)&_background_job_worker_crashtracer_msg_buffer;
      qword_1EE36DB10 = objc_msgSend(v13, "hash");

      v12 = MEMORY[0x1E0C809B0];
    }
    else
    {
      qword_1EE36DAE0 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_background_job_worker_crashtracer_lock);

    PLBackgroundJobServiceGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = *(void **)&v5[18]._os_unfair_lock_opaque;
      *(_DWORD *)buf = 138543362;
      v49 = v24;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_FAULT, "Worker %{public}@ had to be forcefully stopped by manually calling its completion handler. See Application Specific Information in generated crash report for more info.", buf, 0xCu);
    }

    v11 = v39;
  }
  else
  {
    v22 = *(void **)(a1 + 32);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_39;
    v46[3] = &unk_1E3677AA0;
    v47 = v22;
    objc_msgSend(v47, "performBlockAndWait:", v46);

  }
  PLBackgroundJobServiceGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(void **)&v5[18]._os_unfair_lock_opaque;
    v27 = *(_QWORD *)&v5[14]._os_unfair_lock_opaque;
    v28 = v27 - *(_DWORD *)(a1 + 56) + 1;
    v29 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v49 = v26;
    v50 = 1024;
    *(_DWORD *)v51 = v28;
    *(_WORD *)&v51[4] = 2048;
    *(_QWORD *)&v51[6] = v27;
    *(_WORD *)&v51[14] = 2114;
    *(_QWORD *)&v51[16] = v29;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ worker processed object %d of %tu: %{public}@", buf, 0x26u);
  }

  if (!v3)
    goto LABEL_31;
  PLBackgroundJobServiceGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = *(void **)&v5[18]._os_unfair_lock_opaque;
    v32 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v49 = v31;
    v50 = 2114;
    *(_QWORD *)v51 = v32;
    *(_WORD *)&v51[8] = 2114;
    *(_QWORD *)&v51[10] = v3;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "%{public}@ worker reports error after processing object %{public}@, error: %{public}@", buf, 0x20u);
  }

  if ((PLIsErrorEqualToCode() & 1) != 0)
    goto LABEL_30;
  if ((PLIsErrorEqualToCode() & 1) == 0 && !PLIsErrorEqualToCode())
  {
LABEL_31:
    v35 = 0;
    goto LABEL_32;
  }
  atomic_store(1u, (unsigned __int8 *)&v5[17]._os_unfair_lock_opaque + 1);
  PLBackgroundJobServiceGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    -[os_unfair_lock workerDetailedName](v5, "workerDetailedName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v34;
    _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "%@ setting _shouldDeferActivity to YES", buf, 0xCu);

  }
LABEL_30:
  v35 = 1;
LABEL_32:
  os_unfair_lock_lock(v5 + 16);
  objc_msgSend(*(id *)&v5[12]._os_unfair_lock_opaque, "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock(v5 + 16);
  v36 = *(void **)&v5[10]._os_unfair_lock_opaque;
  if (v36)
    dispatch_block_cancel(v36);
  if (v11)
  {
    v43[0] = v12;
    v43[1] = 3221225472;
    v43[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_41;
    v43[3] = &unk_1E3675C80;
    v43[4] = v5;
    v44 = *(id *)(a1 + 32);
    v45 = v35;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v43);
    v37 = v44;
  }
  else
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v12;
    v40[1] = 3221225472;
    v40[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2_42;
    v40[3] = &unk_1E3675C80;
    v40[4] = v5;
    v41 = *(id *)(a1 + 32);
    v42 = v35;
    objc_msgSend(v38, "async:identifyingBlock:library:", v40, 0, *(_QWORD *)(a1 + 32));

    v37 = v41;
  }

LABEL_38:
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWorkOnItem:inLibrary:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_39(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reset");
  objc_msgSend(v1, "queryGenerationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C97C18], "currentQueryGenerationToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v4 = objc_msgSend(v1, "setQueryGenerationFromToken:error:", v3, &v7);
    v5 = v7;

    if ((v4 & 1) == 0)
    {
      PLBackgroundJobServiceGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to reset query generation from PLBackgroundJobWorker, error: %{public}@", buf, 0xCu);
      }

    }
  }

}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextManagedObjectInLibrary:continueRunning:allowOutsideLimiter:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0, 1);
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processNextManagedObjectInLibrary:continueRunning:allowOutsideLimiter:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0, 0);
}

void __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3;
  v2[3] = &unk_1E3677C18;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v2);

}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAllJobsCompleteInLibrary:allowOutsideLimiter:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __96__PLBackgroundJobWorker__processNextManagedObjectInLibrary_continueRunning_allowOutsideLimiter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAllJobsCompleteInLibrary:allowOutsideLimiter:", *(_QWORD *)(a1 + 40), 1);
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 0;
}

+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork
{
  return 0;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 0;
}

+ (int64_t)availableDiskSpaceForVolumeURL:(id)a3
{
  int v3;
  id v4;
  void *v5;
  unint64_t v6;
  int64_t v7;
  id v9;

  v9 = 0;
  v3 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v9, *MEMORY[0x1E0C99BB8], 0);
  v4 = v9;
  v5 = v4;
  if (!v3 || ((v6 = objc_msgSend(v4, "unsignedLongLongValue"), !(v6 >> 29)) ? (v7 = 1) : (v7 = 2), v6 >> 30))
    v7 = 3;

  return v7;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  id v3;
  id v4;

  v3 = a1;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end
