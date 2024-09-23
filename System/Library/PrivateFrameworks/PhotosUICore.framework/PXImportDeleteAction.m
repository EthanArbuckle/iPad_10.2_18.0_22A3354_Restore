@implementation PXImportDeleteAction

- (PXImportDeleteAction)initWithAssets:(id)a3
{
  id v4;
  PXImportDeleteAction *v5;
  uint64_t v6;
  NSArray *assets;
  void *v8;
  uint64_t v9;
  NSString *sessionUuid;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXImportDeleteAction;
  v5 = -[PXImportDeleteAction init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    sessionUuid = v5->_sessionUuid;
    v5->_sessionUuid = (NSString *)v9;

  }
  return v5;
}

- (PXImportDeleteAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportDeleteAction.m"), 45, CFSTR("%s is not available as initializer"), "-[PXImportDeleteAction init]");

  abort();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXImportDeleteAction dealloc]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "[%s]", buf, 0xCu);
  }

  -[PXImportDeleteAction setProgress:](self, "setProgress:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  -[PXImportDeleteAction dealloc](&v4, sel_dealloc);
}

- (void)setProgress:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue_sync();

}

- (void)start
{
  NSObject *v3;
  NSUInteger v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NSUInteger v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSArray count](self->_assets, "count");
    *(_DWORD *)buf = 136315394;
    v7 = "-[PXImportDeleteAction start]";
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Starting delete action with %tu assets", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PXImportDeleteAction;
  -[PXImportConcurrentAction start](&v5, sel_start);
}

- (void)finish
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXImportDeleteAction finish]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Finish delete action", buf, 0xCu);
  }

  -[PXImportDeleteAction setProgress:](self, "setProgress:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  -[PXImportConcurrentAction finish](&v4, sel_finish);
}

- (id)performAction
{
  NSObject *v3;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXImportDeleteAction performAction]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Performing delete action", buf, 0xCu);
  }

  px_dispatch_on_main_queue_sync();
  if (-[PXImportDeleteAction canDeleteAssets](self, "canDeleteAssets"))
    -[PXImportDeleteAction _performRealAction](self, "_performRealAction");
  else
    -[PXImportDeleteAction _performMockAction](self, "_performMockAction");
  return 0;
}

- (void)cancel
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXImportDeleteAction cancel]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%s] Cancel delete action", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PXImportDeleteAction;
  -[PXImportDeleteAction cancel](&v4, sel_cancel);
}

- (BOOL)canDeleteAssets
{
  void *v2;
  char v3;

  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAssetDeletion") ^ 1;

  return v3;
}

- (void)_preAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXImportDeleteAction sessionUuid](self, "sessionUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportDeleteAction importController](self, "importController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_assets;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "itemForImportAssetUuid:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __34__PXImportDeleteAction__preAction__block_invoke;
        v15[3] = &unk_1E5137FD8;
        v16 = v3;
        objc_msgSend(v13, "performChanges:", v15);

        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)_performRealAction
{
  NSObject *v3;
  NSUInteger v4;
  void *v5;
  void *v6;
  NSArray *assets;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  NSUInteger v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSArray count](self->_assets, "count");
    *(_DWORD *)buf = 136446466;
    v12 = "-[PXImportDeleteAction _performRealAction]";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s] will delete %lu", buf, 0x16u);
  }

  if (-[NSArray count](self->_assets, "count"))
  {
    -[PXImportDeleteAction importController](self, "importController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "importSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      _PFAssertContinueHandler();
    objc_initWeak((id *)buf, self);
    assets = self->_assets;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__PXImportDeleteAction__performRealAction__block_invoke;
    v9[3] = &unk_1E5145588;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v6, "deleteImportAssets:isConfirmed:atEnd:", assets, 1, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportDeleteAction setProgress:](self, "setProgress:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_handleDeletionFinished:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PXImportDeleteAction _handleDeletionFinished:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[%s] did delete completed", (uint8_t *)&v6, 0xCu);
  }

  -[PXImportDeleteAction setProgress:](self, "setProgress:", 0);
  -[PXImportDeleteAction setDidSucceed:](self, "setDidSucceed:", v4 == 0);
  -[PXImportDeleteAction setError:](self, "setError:", v4);

}

- (void)_performMockAction
{
  NSObject *v3;
  NSUInteger v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_time_t when;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  PXImportDeleteAction *v29;
  _BYTE *v30;
  BOOL v31;
  _BYTE buf[24];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSArray count](self->_assets, "count");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[PXImportDeleteAction _performMockAction]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s] will (mock) delete %lu", buf, 0x16u);
  }

  -[PXImportDeleteAction importController](self, "importController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    _PFAssertContinueHandler();

  -[PXImportDeleteAction importController](self, "importController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    _PFAssertContinueHandler();
  -[PXImportDeleteAction importController](self, "importController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EEA5F230) & 1) == 0)
    _PFAssertContinueHandler();

  -[PXImportDeleteAction importController](self, "importController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSArray count](self->_assets, "count");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v33 = 0;
  -[PXImportDeleteAction progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSArray count](self->_assets, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportDeleteAction setProgress:](self, "setProgress:", v11);

  }
  v12 = 0;
  v24 = 0;
  v13 = 0;
  v14 = (uint64_t)fmin((double)(v8 / 5), 50.0);
  do
  {
    if (!v12)
      v12 = (void *)objc_opt_new();
    -[NSArray objectAtIndex:](self->_assets, "objectAtIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);
    -[NSArray lastObject](self->_assets, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count") >= v14 || v15 == v16)
    {
      if (objc_msgSend(v12, "count"))
      {
        v17 = (void *)objc_msgSend(v12, "copy");
        ++v24;
        when = dispatch_time(0, 1000000000 * v24);
        dispatch_get_global_queue(0, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__PXImportDeleteAction__performMockAction__block_invoke;
        block[3] = &unk_1E5117728;
        v26 = v17;
        v31 = v15 == v16;
        v27 = v21;
        v19 = v22;
        v29 = self;
        v30 = buf;
        v28 = v19;
        v20 = v17;
        dispatch_after(when, v18, block);

        v12 = 0;
      }
    }

    ++v13;
  }
  while (v15 != v16);

  _Block_object_dispose(buf, 8);
}

- (void)didRemoveAssets:(id)a3
{
  id v4;
  NSMutableArray *removedAssets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSUInteger v8;
  NSObject *v9;
  NSUInteger v10;
  int v11;
  const char *v12;
  __int16 v13;
  NSUInteger v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  removedAssets = self->_removedAssets;
  if (!removedAssets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_removedAssets;
    self->_removedAssets = v6;

    removedAssets = self->_removedAssets;
  }
  -[NSMutableArray addObjectsFromArray:](removedAssets, "addObjectsFromArray:", v4);
  v8 = -[NSArray count](self->_assets, "count");
  if (v8 == -[NSMutableArray count](self->_removedAssets, "count"))
  {
    _importDataLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[NSArray count](self->_assets, "count");
      v11 = 136446466;
      v12 = "-[PXImportDeleteAction didRemoveAssets:]";
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}s] All %tu assets removed. Finishing delete action.", (uint8_t *)&v11, 0x16u);
    }

    -[PXImportDeleteAction finish](self, "finish");
  }

}

- (void)_startObservingDeleteProgress
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
  -[PXImportDeleteAction sendActionProgress:](self, "sendActionProgress:");
  -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, &PXImportDeleteObserverFractionCompletedContext);
}

- (void)_stopObservingDeleteProgress
{
  NSProgress *progress;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  progress = self->_progress;
  if (progress)
  {
    -[NSProgress removeObserver:forKeyPath:context:](progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &PXImportDeleteObserverFractionCompletedContext);
    -[PXImportDeleteAction sendActionProgress:](self, "sendActionProgress:", 0.0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v14 = a5;
  v13 = v9;
  v10 = v14;
  v11 = v9;
  v12 = v8;
  px_dispatch_on_main_queue_sync();

}

- (void)sendActionProgress:(double)a3
{
  void *v4;
  void *v5;
  NSProgress *progress;
  uint64_t v7;
  void *v8;
  void *v9;
  NSProgress *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("PXImportControllerFractionCompleted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("PXImportControllerCompletedItemCount");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  progress = self->_progress;
  if (progress)
    v7 = -[NSProgress completedUnitCount](progress, "completedUnitCount");
  else
    v7 = 0;
  objc_msgSend(v5, "numberWithLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("PXImportControllerTotalItemCount");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = self->_progress;
  if (v10)
    v11 = -[NSProgress totalUnitCount](v10, "totalUnitCount");
  else
    v11 = 0;
  objc_msgSend(v9, "numberWithLongLong:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("PXImportControllerProgressNotification"), self, v13);

}

- (NSString)sessionUuid
{
  return self->_sessionUuid;
}

- (PXImportController)importController
{
  return (PXImportController *)objc_loadWeakRetained((id *)&self->_importController);
}

- (void)setImportController:(id)a3
{
  objc_storeWeak((id *)&self->_importController, a3);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_importController);
  objc_storeStrong((id *)&self->_sessionUuid, 0);
  objc_storeStrong((id *)&self->_removedAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

id __71__PXImportDeleteAction_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  _UNKNOWN **v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_UNKNOWN ***)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  if (v2 == &PXImportDeleteObserverFractionCompletedContext)
  {
    objc_msgSend(v3, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fractionCompleted");
    v10 = v9;

    _importDataLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v10 * 100.0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Delete action: Progress %.1f%%", buf, 0xCu);
    }

    return (id)objc_msgSend(*(id *)(a1 + 32), "sendActionProgress:", v10);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v12.receiver = v3;
    v12.super_class = (Class)PXImportDeleteAction;
    return objc_msgSendSuper2(&v12, sel_observeValueForKeyPath_ofObject_change_context_, v4, v5, v6);
  }
}

uint64_t __42__PXImportDeleteAction__performMockAction__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 134218240;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Fake delete of %lu items (done=%d)", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "importSource:didRemoveAssets:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "count");
  return px_dispatch_on_main_queue_sync();
}

void __42__PXImportDeleteAction__performMockAction__block_invoke_39(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", v1);

}

void __42__PXImportDeleteAction__performRealAction__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDeletionFinished:", v3);

}

uint64_t __34__PXImportDeleteAction__preAction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeleteSession:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__PXImportDeleteAction_performAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preAction");
}

_QWORD *__36__PXImportDeleteAction_setProgress___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[38] != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(result, "_stopObservingDeleteProgress");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), *(id *)(a1 + 40));
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_startObservingDeleteProgress");
  }
  return result;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImportDeleteAction.m"), 49, CFSTR("%s is not available as initializer"), "+[PXImportDeleteAction new]");

  abort();
}

@end
