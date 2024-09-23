@implementation PXCPLSharedLibraryActivity

- (PXCPLSharedLibraryActivity)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLSharedLibraryActivity.m"), 45, CFSTR("%s is not available as initializer"), "-[PXCPLSharedLibraryActivity init]");

  abort();
}

- (PXCPLSharedLibraryActivity)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXCPLSharedLibraryActivity *v6;
  uint64_t v7;
  OS_dispatch_queue *serialQueue;
  NSObject *v9;
  dispatch_block_t v10;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLSharedLibraryActivity.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXCPLSharedLibraryActivity;
  v6 = -[PXCPLSharedLibraryActivity init](&v17, sel_init);
  if (v6)
  {
    +[PXCPLSharedLibraryActivity sharedQueue](PXCPLSharedLibraryActivity, "sharedQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v6);
    v9 = v6->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXCPLSharedLibraryActivity_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v15, &location);
    v14 = v5;
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(v9, v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setState:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXCPLSharedLibraryActivity signalChange:](self, "signalChange:", 1);
  }
}

- (void)setMovingToShared:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_movingToShared != a3)
  {
    self->_movingToShared = a3;
    -[PXCPLSharedLibraryActivity signalChange:](self, "signalChange:", 2);
  }
}

- (void)setMovingToPersonal:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_movingToPersonal != a3)
  {
    self->_movingToPersonal = a3;
    -[PXCPLSharedLibraryActivity signalChange:](self, "signalChange:", 4);
  }
}

- (void)_queue_fetchLibraryScopeForPhotoLibrary:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *libraryScopeFetchResult;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *Result;
  _QWORD v12[4];
  id v13[2];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  PLUserStatusGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { %{public}@ }", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_photoLibrary, a3);
  -[PHPhotoLibrary registerChangeObserver:](self->_photoLibrary, "registerChangeObserver:", self);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludeExitingShares:", 1);
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v7);
  v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  libraryScopeFetchResult = self->_libraryScopeFetchResult;
  self->_libraryScopeFetchResult = v8;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_scopeStatusCountsDidChange, (CFStringRef)*MEMORY[0x1E0CD1C90], 0, (CFNotificationSuspensionBehavior)1024);
  objc_initWeak((id *)buf, self);
  Result = (void *)_StateForLibraryScopeFetchResult(self->_libraryScopeFetchResult);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PXCPLSharedLibraryActivity__queue_fetchLibraryScopeForPhotoLibrary___block_invoke;
  v12[3] = &unk_1E51447A0;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = Result;
  dispatch_async(MEMORY[0x1E0C80D38], v12);
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);

}

- (void)_setState:(int64_t)a3
{
  int64_t v5;
  _QWORD v6[7];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = -[PXCPLSharedLibraryActivity state](self, "state");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXCPLSharedLibraryActivity__setState___block_invoke;
  v6[3] = &unk_1E51449E0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = v5;
  -[PXCPLSharedLibraryActivity performChanges:](self, "performChanges:", v6);
}

- (void)_setMovingToShared:(unint64_t)a3 movingToPersonal:(unint64_t)a4
{
  int64_t state;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[7];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  state = self->_state;
  v8 = state == 1;
  if (state == 1)
    v9 = a3;
  else
    v9 = 0;
  if (v8)
    v10 = a4;
  else
    v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PXCPLSharedLibraryActivity__setMovingToShared_movingToPersonal___block_invoke;
  v11[3] = &unk_1E51449E0;
  v11[4] = self;
  v11[5] = v9;
  v11[6] = v10;
  -[PXCPLSharedLibraryActivity performChanges:](self, "performChanges:", v11);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  PXCPLSharedLibraryActivity *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke;
  block[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)_queue_handleCloudStatusCounts:(id)a3 error:(id)a4 libraryScope:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  id v22[3];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[PHFetchResult firstObject](self->_libraryScopeFetchResult, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v10)
  {
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "PXCPLSharedLibraryActivity: Library scope changed while fetching scope status counts - bailing out";
LABEL_9:
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v14 = v10;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _IsExiting(PHLibraryScope *__strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXCPLSharedLibraryActivity.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryScope"));

  }
  v15 = objc_msgSend(v14, "exitState");

  if (v15)
  {
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "PXCPLSharedLibraryActivity: Library scope is exiting after fetching scope status counts - bailing out";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v8)
  {
    v16 = (void *)objc_msgSend(v8, "countOfSharingRecords");
    v17 = (void *)objc_msgSend(v8, "countOfUnsharingRecords");
  }
  else
  {
    PLUserStatusGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "PXCPLSharedLibraryActivity: Failed to fetch scope status counts: %@", buf, 0xCu);
    }

    v16 = 0;
    v17 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXCPLSharedLibraryActivity__queue_handleCloudStatusCounts_error_libraryScope___block_invoke;
  block[3] = &unk_1E512E518;
  objc_copyWeak(v22, (id *)buf);
  v22[1] = v16;
  v22[2] = v17;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
LABEL_11:

}

- (void)_queue_updateScopeStatusCounts
{
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[PHFetchResult firstObject](self->_libraryScopeFetchResult, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (!objc_msgSend(v3, "exitState"))
    {
      objc_initWeak(buf, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke;
      v7[3] = &unk_1E512E540;
      v7[4] = self;
      objc_copyWeak(&v9, buf);
      v8 = v4;
      objc_msgSend(v8, "getCloudStatusCountsWithCompletionHandler:", v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    PLUserStatusGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "PXCPLSharedLibraryActivity: Library scope is exiting when fetching scope status counts - bailing out";
LABEL_7:
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    PLUserStatusGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v6 = "PXCPLSharedLibraryActivity: No library scope available for fetching scope status counts - bailing out";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (void)_updateScopeStatusCounts
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PXCPLSharedLibraryActivity__updateScopeStatusCounts__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)movingToShared
{
  return self->_movingToShared;
}

- (unint64_t)movingToPersonal
{
  return self->_movingToPersonal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryScopeFetchResult, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __54__PXCPLSharedLibraryActivity__updateScopeStatusCounts__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_updateScopeStatusCounts");

}

void __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke_2;
  v10[3] = &unk_1E51429B8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __60__PXCPLSharedLibraryActivity__queue_updateScopeStatusCounts__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_queue_handleCloudStatusCounts:error:libraryScope:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __80__PXCPLSharedLibraryActivity__queue_handleCloudStatusCounts_error_libraryScope___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setMovingToShared:movingToPersonal:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *Result;
  _QWORD block[4];
  id v9[2];
  id location;

  objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fetchResultAfterChanges");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

    objc_initWeak(&location, *(id *)(a1 + 40));
    Result = (void *)_StateForLibraryScopeFetchResult(*(void **)(*(_QWORD *)(a1 + 40) + 104));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke_2;
    block[3] = &unk_1E51447A0;
    objc_copyWeak(v9, &location);
    v9[1] = Result;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

void __52__PXCPLSharedLibraryActivity_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setState:", *(_QWORD *)(a1 + 40));

}

void __66__PXCPLSharedLibraryActivity__setMovingToShared_movingToPersonal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setMovingToShared:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setMovingToPersonal:", *(_QWORD *)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentChanges");
  if (v2)
  {
    v3 = v2;
    PLUserStatusGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      _StateDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      if ((v3 & 2) != 0)
        v7 = CFSTR(" (new)");
      else
        v7 = &stru_1E5149688;
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 48);
      if ((v3 & 4) != 0)
        v10 = CFSTR(" (new)");
      else
        v10 = &stru_1E5149688;
      v11 = v10;
      v12 = 138544386;
      v13 = v5;
      v14 = 2048;
      v15 = v6;
      v16 = 2114;
      v17 = v8;
      v18 = 2048;
      v19 = v9;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { state:%{public}@, movingToShared:%lu%{public}@, movingToPersonal:%lu%{public}@ }", (uint8_t *)&v12, 0x34u);

    }
  }
}

void __40__PXCPLSharedLibraryActivity__setState___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "currentChanges"))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = v2[15];
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v2, "setMovingToShared:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setMovingToPersonal:", 0);
      v4 = objc_msgSend(*(id *)(a1 + 32), "currentChanges");
      if ((v4 & 2) != 0)
        v5 = CFSTR(" (new)");
      else
        v5 = &stru_1E5149688;
      if ((v4 & 4) != 0)
        v6 = CFSTR(" (new)");
      else
        v6 = &stru_1E5149688;
    }
    else
    {
      if (v3 == 1 || *(_QWORD *)(a1 + 48) == 0)
        objc_msgSend(v2, "_updateScopeStatusCounts");
      v6 = &stru_1E5149688;
      v5 = &stru_1E5149688;
    }
    PLUserStatusGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _StateDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v11 = v5;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v13 = v6;
      v14 = 138544642;
      v15 = v9;
      v16 = 2114;
      v17 = CFSTR(" (new)");
      v18 = 2048;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      v22 = 2048;
      v23 = v12;
      v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXCPLSharedLibraryActivity { state:%{public}@%{public}@, movingToShared:%lu%{public}@, movingToPersonal:%lu%{public}@ }", (uint8_t *)&v14, 0x3Eu);

    }
  }
}

void __70__PXCPLSharedLibraryActivity__queue_fetchLibraryScopeForPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setState:", *(_QWORD *)(a1 + 40));

}

void __51__PXCPLSharedLibraryActivity_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_fetchLibraryScopeForPhotoLibrary:", *(_QWORD *)(a1 + 32));

}

+ (OS_dispatch_queue)sharedQueue
{
  if (sharedQueue_onceToken_150690 != -1)
    dispatch_once(&sharedQueue_onceToken_150690, &__block_literal_global_150691);
  return (OS_dispatch_queue *)(id)sharedQueue_sharedQueue_150692;
}

void __41__PXCPLSharedLibraryActivity_sharedQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.PXCPLSharedLibraryActivity.sharedQueue", attr);
  v3 = (void *)sharedQueue_sharedQueue_150692;
  sharedQueue_sharedQueue_150692 = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_129_150695);

}

void __41__PXCPLSharedLibraryActivity_sharedQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)sharedQueue_sharedQueue_150692);
}

@end
