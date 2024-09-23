@implementation PLBackgroundJobService

uint64_t __38__PLBackgroundJobService_serviceState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __105__PLBackgroundJobService__fireWatchdogTimerWithStartTime_startingPushBackTimeInterval_sourceDescription___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

uint64_t __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireWatchdogTimerWithStartTime:startingPushBackTimeInterval:sourceDescription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  uint64_t v6;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  v6 = objc_msgSend(v5, "isCameraRunning");

  -[PLBackgroundJobService _updateCameraForegroundState:](self, "_updateCameraForegroundState:", v6);
}

- (void)_updateCameraForegroundState:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  _BOOL4 cameraForeground;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  _BOOL4 deferringService;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_cameraForeground = v3;
  v5 = -[PLBackgroundJobService serviceState](self, "serviceState");
  cameraForeground = self->_cameraForeground;
  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (cameraForeground)
  {
    if (v8)
    {
      if (v5 - 1 > 9)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E3667C20[v5 - 1];
      v16 = 138543362;
      v17 = v9;
      v11 = "Camera is in foreground (state: %{public}@";
LABEL_12:
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v8)
  {
    if (v5 - 1 > 9)
      v10 = CFSTR("Unknown");
    else
      v10 = off_1E3667C20[v5 - 1];
    v16 = 138543362;
    v17 = v10;
    v11 = "Camera is in background (state: %{public}@";
    goto LABEL_12;
  }

  if (v3 || v5 != 5)
  {
    if (v3 && v5 == 6)
    {
      deferringService = self->_deferringService;
      PLBackgroundJobServiceGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (deferringService)
      {
        if (v15)
        {
          v16 = 138543362;
          v17 = CFSTR("Running");
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Not pausing even though we're in %{public}@ state and Camera came to foreground because _deferringService is set which indicates that we're already in the middle of pausing", (uint8_t *)&v16, 0xCu);
        }

      }
      else
      {
        if (v15)
        {
          v16 = 138543362;
          v17 = CFSTR("Running");
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Pausing since we're in %{public}@ state and Camera came to foreground. Going to defer by calling _stopRunningBackgroundJobs", (uint8_t *)&v16, 0xCu);
        }

        -[PLBackgroundJobService _stopRunningBackgroundJobs](self, "_stopRunningBackgroundJobs");
      }
    }
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Calling register again since we were paused before Camera went to background", (uint8_t *)&v16, 2u);
    }

    -[PLBackgroundJobService _registerActivityWithCriteria:](self, "_registerActivityWithCriteria:", self->_pausedCriteria);
  }
}

- (unint64_t)serviceState
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLRunWithUnfairLock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)_fireWatchdogTimerWithStartTime:(id)a3 startingPushBackTimeInterval:(double)a4 sourceDescription:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29896;
  v19 = __Block_byref_object_dispose__29897;
  v20 = 0;
  v14 = MEMORY[0x1E0C809B0];
  PLSafeRunWithUnfairLock();
  if (objc_msgSend(v8, "isEqual:", v16[5], v14, 3221225472, __105__PLBackgroundJobService__fireWatchdogTimerWithStartTime_startingPushBackTimeInterval_sourceDescription___block_invoke, &unk_1E3677C68, self, &v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v8);
    v12 = v11;

    PLBackgroundJobServiceGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      v22 = v9;
      v23 = 2114;
      v24 = v8;
      v25 = 2048;
      v26 = v12;
      v27 = 2048;
      v28 = a4;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_FAULT, "Background job service has not responded to signal from %{public}@ at %{public}@, %.1f seconds elapsed, push back interval was %.1f seconds", buf, 0x2Au);
    }

  }
  _Block_object_dispose(&v15, 8);

}

- (PLBackgroundJobService)init
{
  PLBackgroundJobStatusCenter *v3;
  PLBackgroundJobLibraryCoordinator *v4;
  PLBackgroundJobService *v5;

  if (MEMORY[0x19AEC04BC](self, a2))
    v3 = objc_alloc_init(PLBackgroundJobStatusCenter);
  else
    v3 = 0;
  v4 = -[PLBackgroundJobLibraryCoordinator initWithStatusCenter:]([PLBackgroundJobLibraryCoordinator alloc], "initWithStatusCenter:", v3);
  v5 = -[PLBackgroundJobService initWithLibraryCoordinator:statusCenter:](self, "initWithLibraryCoordinator:statusCenter:", v4, v3);

  return v5;
}

- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3
{
  return -[PLBackgroundJobService initWithLibraryCoordinator:statusCenter:](self, "initWithLibraryCoordinator:statusCenter:", a3, 0);
}

- (PLBackgroundJobService)initWithLibraryCoordinator:(id)a3 statusCenter:(id)a4
{
  id v8;
  id v9;
  PLBackgroundJobService *v10;
  NSObject *v11;
  NSMutableSet *v12;
  NSMutableSet *registeredXPCActivities;
  uint64_t v14;
  NSPointerArray *observers;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *isolationQueue;
  uint64_t v20;
  NSDictionary *libraryInvalidationCompletionHandlerByLibraryURL;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  void *v26;
  char v27;
  uint64_t v28;
  PFCoalescer *registrationCoalescer;
  uint64_t v30;
  PFStateCaptureHandler *stateCaptureHandler;
  void *v33;
  void *v34;
  uint8_t buf[16];
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PLBackgroundJobService;
  v10 = -[PLBackgroundJobService init](&v36, sel_init);
  if (v10)
  {
    if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PLBackgroundJobService.m"), 116, CFSTR("%@ can only be called from assetsd"), v34);

    }
    PLBackgroundJobServiceGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "BackgroundJobService starting up", buf, 2u);
    }

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredXPCActivities = v10->_registeredXPCActivities;
    v10->_registeredXPCActivities = v12;

    v10->_stateLock._os_unfair_lock_opaque = 0;
    v10->_stateLock_state = 1;
    v10->_needsActivityUnregistrationOnFirstLaunch = 1;
    objc_storeStrong((id *)&v10->_libraryCoordinator, a3);
    -[PLBackgroundJobLibraryCoordinator setDelegate:](v10->_libraryCoordinator, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_statusCenter, a4);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSPointerArray *)v14;

    if (MEMORY[0x19AEC04BC]())
      -[NSPointerArray addPointer:](v10->_observers, "addPointer:", v10->_statusCenter);
    v10->_bundlesToProcessByCriteriaShortCodeLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = dispatch_queue_create("com.apple.photos.backgroundjobservice.isolationqueue", v17);
    isolationQueue = v10->_isolationQueue;
    v10->_isolationQueue = (OS_dispatch_queue *)v18;

    v10->_watchdogTimerLock_registrationCoalescerPushBackTimeInterval = 2.0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    libraryInvalidationCompletionHandlerByLibraryURL = v10->_libraryInvalidationCompletionHandlerByLibraryURL;
    v10->_libraryInvalidationCompletionHandlerByLibraryURL = (NSDictionary *)v20;

    -[PLBackgroundJobService _loadBundleRecordsDictionaryFromUserDefaults](v10, "_loadBundleRecordsDictionaryFromUserDefaults");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
    v23 = objc_msgSend(v22, "BOOLForKey:", CFSTR("AllowBackgroundWorkWithForegroundCamera"));
    if ((v23 & 1) == 0)
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", v10->_isolationQueue, v10);
      cameraWatcher = v10->_cameraWatcher;
      v10->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v24;

      v23 = -[PFCameraViewfinderSessionWatcher startWatching](v10->_cameraWatcher, "startWatching");
    }
    if (!MEMORY[0x19AEC04BC](v23)
      || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("PLDisableBackgroundJobServiceActivityRegistration")),
          v26,
          (v27 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0D71080], "setCoalescerWithLabel:target:queue:action:", CFSTR("com.apple.photos.backgroundjobservice.registrationcoalescer"), v10, v10->_isolationQueue, &__block_literal_global_30046);
      v28 = objc_claimAutoreleasedReturnValue();
      registrationCoalescer = v10->_registrationCoalescer;
      v10->_registrationCoalescer = (PFCoalescer *)v28;

    }
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71088]), "initWithProvider:", v10);
    stateCaptureHandler = v10->_stateCaptureHandler;
    v10->_stateCaptureHandler = (PFStateCaptureHandler *)v30;

    v10->_watchdogTimerLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)_simulateXPCShouldDefer:(BOOL)a3
{
  NSObject *isolationQueue;
  _QWORD v4[5];
  BOOL v5;

  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PLBackgroundJobService__simulateXPCShouldDefer___block_invoke;
  v4[3] = &unk_1E36762F8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(isolationQueue, v4);
}

- (void)_shutdown
{
  NSDictionary *v3;
  NSDictionary *libraryInvalidationCompletionHandlerByLibraryURL;
  uint64_t v5;
  NSObject *v6;
  NSNumber *simulateXpcActivityDeferring;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 8);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  libraryInvalidationCompletionHandlerByLibraryURL = self->_libraryInvalidationCompletionHandlerByLibraryURL;
  self->_libraryInvalidationCompletionHandlerByLibraryURL = v3;

  -[PLBackgroundJobService _stopPollingForActivityStatus](self, "_stopPollingForActivityStatus");
  -[PLBackgroundJobService _unregisterActivityIfNeededShouldConsiderDeferring:](self, "_unregisterActivityIfNeededShouldConsiderDeferring:", 1);
  if (self->_deferringService)
    v5 = 9;
  else
    v5 = 10;
  -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", v5);
  PLBackgroundJobServiceGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Successfully shutdown BackgroundJobService", buf, 2u);
  }

  self->_deferringService = 0;
  simulateXpcActivityDeferring = self->_simulateXpcActivityDeferring;
  self->_simulateXpcActivityDeferring = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_observers;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "backgroundJobServiceDidShutdown", (_QWORD)v14);
      }
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

- (void)invalidateLibraryBundle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Invalidate library called on bundle: %@", buf, 0xCu);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PLBackgroundJobService_invalidateLibraryBundle_completion___block_invoke;
  block[3] = &unk_1E3676290;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(isolationQueue, block);

}

- (NSDictionary)statusCenterDump
{
  return -[PLBackgroundJobStatusCenter statusDumpDictionary](self->_statusCenter, "statusDumpDictionary");
}

- (void)_setRunningCriteria:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLBackgroundJobService__setRunningCriteria___block_invoke;
  block[3] = &unk_1E3677C18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)_setServiceState:(unint64_t)a3
{
  NSObject *isolationQueue;
  _QWORD v4[6];

  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PLBackgroundJobService__setServiceState___block_invoke;
  v4[3] = &unk_1E3674C18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(isolationQueue, v4);
}

- (void)_setServiceStateOnQueue:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  NSPointerArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *(*v25)(_QWORD *);
  void *v26;
  PLBackgroundJobService *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __50__PLBackgroundJobService__setServiceStateOnQueue___block_invoke;
  v26 = &unk_1E3675800;
  v27 = self;
  v28 = &v30;
  v29 = a3;
  v5 = PLRunWithUnfairLock();
  if (MEMORY[0x19AEC04BC](v5)
    && (objc_msgSend((id)objc_opt_class(), "verifyStateTransitionFromState:toState:", v31[3], a3) & 1) == 0)
  {
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = v31[3] - 1;
      if (v7 > 9)
        v8 = CFSTR("Unknown");
      else
        v8 = off_1E3667C20[v7];
      if (a3 - 1 > 9)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E3667C20[a3 - 1];
      *(_DWORD *)buf = 138543618;
      v36 = v8;
      v37 = 2114;
      v38 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_FAULT, "Unexpected state transition detected from %{public}@ to %{public}@", buf, 0x16u);
    }

  }
  PLBackgroundJobServiceGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v31[3] - 1;
    if (v11 > 9)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E3667C20[v11];
    if (a3 - 1 > 9)
      v13 = CFSTR("Unknown");
    else
      v13 = off_1E3667C20[a3 - 1];
    *(_DWORD *)buf = 138543618;
    v36 = v12;
    v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Background Job Service state change from %{public}@ to %{public}@", buf, 0x16u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_observers;
  v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "backgroundJobServiceDidChangeStateFrom:to:", v31[3], a3, (_QWORD)v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
    }
    while (v15);
  }

  _Block_object_dispose(&v30, 8);
}

- (BOOL)_activityIsRegisteredForCriteria:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSMutableSet *registeredXPCActivities;
  void *v7;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  objc_msgSend(v5, "shortCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(registeredXPCActivities) = -[NSMutableSet containsObject:](registeredXPCActivities, "containsObject:", v7);
  return (char)registeredXPCActivities;
}

- (void)_setRegisteredActivityForCriteria:(id)a3
{
  id v4;
  NSMutableSet *registeredXPCActivities;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableSet *v9;
  int v10;
  void *v11;
  __int16 v12;
  NSMutableSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  objc_msgSend(v4, "shortCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](registeredXPCActivities, "addObject:", v6);

  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_registeredXPCActivities;
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Added criteria %{public}@, currently registered criteria short codes: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_removeRegisteredActivityForCriteria:(id)a3
{
  id v4;
  NSMutableSet *registeredXPCActivities;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableSet *v9;
  int v10;
  void *v11;
  __int16 v12;
  NSMutableSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  registeredXPCActivities = self->_registeredXPCActivities;
  objc_msgSend(v4, "shortCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](registeredXPCActivities, "removeObject:", v6);

  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_registeredXPCActivities;
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Removed criteria %{public}@, currently registered criteria short codes: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_noteSignalNeededForCrashRecoveryOnBundle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _noteSignalNeededForCrashRecoveryOnBundle:]", a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "globalValues");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setBackgroundJobServiceNeedsProcessing:](v5, "setBackgroundJobServiceNeedsProcessing:", 1);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PLBackgroundJobService _noteSignalNeededForCrashRecoveryOnBundle:]";
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)_invalidateSignalNeededForCrashRecoveryOnBundle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _invalidateSignalNeededForCrashRecoveryOnBundle:]", a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "globalValues");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setBackgroundJobServiceNeedsProcessing:](v5, "setBackgroundJobServiceNeedsProcessing:", 0);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PLBackgroundJobService _invalidateSignalNeededForCrashRecoveryOnBundle:]";
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (BOOL)_signalNeededOnBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobService _signalNeededOnBundle:]", a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "globalValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "backgroundJobServiceNeedsProcessing");

  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[PLBackgroundJobService _signalNeededOnBundle:]";
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize photolibrary in %s", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (void)performCrashRecoveryIfNeededOnBundle:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PLBackgroundJobService _signalNeededOnBundle:](self, "_signalNeededOnBundle:"))
    -[PLBackgroundJobService signalBackgroundProcessingNeededOnBundle:](self, "signalBackgroundProcessingNeededOnBundle:", v4);

}

- (void)signalBackgroundProcessingNeededOnLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[PLBackgroundJobService signalBackgroundProcessingNeededOnLibrary:]";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%s called by stack %@", (uint8_t *)&v12, 0x16u);

    }
  }
  objc_msgSend(v4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasChanges"))
  {
    objc_msgSend(v4, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordNeedsBackgroundJobProcessing");

    -[PLBackgroundJobService startWatchdogTimerIfNeededWithSourceDescription:](self, "startWatchdogTimerIfNeededWithSourceDescription:", CFSTR("library"));
  }
  else
  {
    objc_msgSend(v4, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundJobService signalBackgroundProcessingNeededOnBundle:](self, "signalBackgroundProcessingNeededOnBundle:", v11);

  }
}

- (void)signalBackgroundProcessingNeededOnBundle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  PFCoalescer *registrationCoalescer;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[PLBackgroundJobService signalBackgroundProcessingNeededOnBundle:]";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%s called by stack %@", buf, 0x16u);

    }
  }
  -[PLBackgroundJobService startWatchdogTimerIfNeededWithSourceDescription:](self, "startWatchdogTimerIfNeededWithSourceDescription:", CFSTR("bundle"));
  registrationCoalescer = self->_registrationCoalescer;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PLBackgroundJobService_signalBackgroundProcessingNeededOnBundle___block_invoke;
  v10[3] = &unk_1E3667BB0;
  v11 = v4;
  v9 = v4;
  -[PFCoalescer update:](registrationCoalescer, "update:", v10);

}

- (void)startWatchdogTimerIfNeededWithSourceDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  NSObject *isolationQueue;
  _QWORD block[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  double (*v17)(uint64_t);
  void *v18;
  PLBackgroundJobService *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke;
  v18 = &unk_1E366F518;
  v19 = self;
  v7 = v5;
  v20 = v7;
  v8 = v4;
  v21 = v8;
  v22 = &v28;
  v23 = &v24;
  PLSafeRunWithUnfairLock();
  if (*((_BYTE *)v29 + 24))
  {
    v9 = dispatch_time(0, (uint64_t)((v25[3] + 600.0) * 1000000000.0));
    isolationQueue = self->_isolationQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke_2;
    block[3] = &unk_1E3676EC8;
    block[4] = self;
    v12 = v7;
    v14 = &v24;
    v13 = v8;
    dispatch_after(v9, isolationQueue, block);

  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

- (void)_registerActivityWithoutCoalescingIfNecessaryOnBundle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *isolationQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PLBackgroundJobService _registerActivityWithoutCoalescingIfNecessaryOnBundle:]";
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%s called", buf, 0xCu);
  }

  isolationQueue = self->_isolationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PLBackgroundJobService__registerActivityWithoutCoalescingIfNecessaryOnBundle___block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(isolationQueue, v8);

}

- (void)_registerActivityIfNecessaryOnBundles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  id v24;
  NSObject *v25;
  char *v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[PLBackgroundJobService _registerActivityIfNecessaryOnBundles:]";
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%s called", buf, 0xCu);
  }

  -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 2);
  -[PLBackgroundJobLibraryCoordinator pendingJobsOnBundles:](self->_libraryCoordinator, "pendingJobsOnBundles:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "shortCode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBackgroundJobService _appendBundleRecordsToProcessingSet:criteriaShortCode:](self, "_appendBundleRecordsToProcessingSet:criteriaShortCode:", v4, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v9);
    }

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  +[PLBackgroundJobCriteria allKnownCriterias](PLBackgroundJobCriteria, "allKnownCriterias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (!v14)
  {

LABEL_32:
    PLBackgroundJobServiceGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "No work to do at any criteria. Removing all bundles from processing set.", buf, 2u);
    }

    -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 3);
    -[PLBackgroundJobService _removeAllBundlesFromProcessingSet](self, "_removeAllBundlesFromProcessingSet");
    goto LABEL_35;
  }
  v15 = v14;
  v34 = v4;
  v35 = v6;
  v16 = 0;
  v17 = *(_QWORD *)v41;
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v41 != v17)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
      objc_msgSend(v19, "shortCode", v34, v35);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBackgroundJobService _getBundleRecordsFromProcessingSetForCriteriaShortCode:](self, "_getBundleRecordsFromProcessingSetForCriteriaShortCode:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count"))
      {
        -[PLBackgroundJobService _registerActivityWithCriteria:](self, "_registerActivityWithCriteria:", v19);
        v16 = 1;
      }
      else if (self->_needsActivityUnregistrationOnFirstLaunch)
      {
        PLBackgroundJobServiceGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "name");
          v23 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = v23;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Unregistering %{public}@ background job since it has no work to do on first launch", buf, 0xCu);

        }
        objc_msgSend(v19, "activityIdentifier");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_activity_unregister((const char *)objc_msgSend(v24, "UTF8String"));

        self->_needsActivityUnregistrationOnFirstLaunch = 0;
      }
      else if (-[PLBackgroundJobService _activityIsRegisteredForCriteria:](self, "_activityIsRegisteredForCriteria:", v19))
      {
        PLBackgroundJobServiceGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "name");
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = v26;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Unregistering %{public}@ background job since it has no work to do and an activity has been registered", buf, 0xCu);

        }
        objc_msgSend(v19, "activityIdentifier");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_activity_unregister((const char *)objc_msgSend(v27, "UTF8String"));

        -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v19);
      }

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  }
  while (v15);

  v4 = v34;
  v6 = v35;
  if ((v16 & 1) == 0)
    goto LABEL_32;
LABEL_35:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = v4;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        -[PLBackgroundJobService _invalidateSignalNeededForCrashRecoveryOnBundle:](self, "_invalidateSignalNeededForCrashRecoveryOnBundle:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v31);
  }

}

- (void)_registerActivityWithCriteria:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  PLBackgroundJobService *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (-[PLBackgroundJobService _activityIsRegisteredForCriteria:](self, "_activityIsRegisteredForCriteria:", v4)
    || MEMORY[0x19AEC0720]())
  {
    if (MEMORY[0x19AEC0720]())
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v5 = self->_observers;
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v26 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v4, "shortCode");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "backgroundJobServiceDidRegisterCriteriaShortCode:", v11);

            }
          }
          v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v7);
      }
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      v5 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v12;
        _os_log_impl(&dword_199541000, &v5->super, OS_LOG_TYPE_DEBUG, "Skip registering %{public}@ criteria since this activity is already registered according to _registeredXPCActivities", buf, 0xCu);

      }
    }

    -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 4);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Registering %{public}@ background job xpc activity", buf, 0xCu);

    }
    objc_msgSend(v4, "activityIdentifier");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");

    v17 = (void *)*MEMORY[0x1E0C80748];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke;
    v22 = &unk_1E3667BD8;
    v23 = self;
    v18 = v4;
    v24 = v18;
    xpc_activity_register(v16, v17, &v19);
    -[PLBackgroundJobStatusCenter recordActivityRegisteredWithCriteria:](self->_statusCenter, "recordActivityRegisteredWithCriteria:", v18, v19, v20, v21, v22, v23);
    -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 4);

  }
}

- (void)_registerBackgroundProcessingNeededForBundles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  double (*v24)(uint64_t);
  void *v25;
  PLBackgroundJobService *v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  PLBackgroundJobService *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  PLBackgroundJobService *v45;
  uint8_t v46[4];
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Registration coalescer action handler called", buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke;
  v44 = &unk_1E3677AA0;
  v45 = self;
  PLSafeRunWithUnfairLock();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        -[PLBackgroundJobService _noteSignalNeededForCrashRecoveryOnBundle:](self, "_noteSignalNeededForCrashRecoveryOnBundle:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v11);
  }

  v14 = -[PLBackgroundJobService serviceState](self, "serviceState");
  if (objc_msgSend((id)objc_opt_class(), "_stateIsReadyForRegistration:", v14))
  {
    v32 = v9;
    v33 = 3221225472;
    v34 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_2;
    v35 = &unk_1E3677AA0;
    v36 = self;
    PLSafeRunWithUnfairLock();
    -[PLBackgroundJobService _registerActivityIfNecessaryOnBundles:](self, "_registerActivityIfNecessaryOnBundles:", v10);
    objc_msgSend(v7, "delayNextInvocationByTimeInterval:", 2.0);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v22 = v9;
    v23 = 3221225472;
    v24 = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_3;
    v25 = &unk_1E3677C68;
    v26 = self;
    v27 = buf;
    PLSafeRunWithUnfairLock();
    if (fabs(*((double *)v29 + 3) + -4096.0) < 2.22044605e-16)
    {
      PLBackgroundJobServiceGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        if (v14 - 1 > 9)
          v16 = CFSTR("Unknown");
        else
          v16 = off_1E3667C20[v14 - 1];
        *(_DWORD *)v46 = 138543362;
        v47 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "Coalescer wants to register but service has been stuck in %{public}@ state for too long", v46, 0xCu);
      }

    }
    PLBackgroundJobServiceGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (v14 - 1 > 9)
        v18 = CFSTR("Unknown");
      else
        v18 = off_1E3667C20[v14 - 1];
      v19 = *((_QWORD *)v29 + 3);
      *(_DWORD *)v46 = 138543618;
      v47 = v18;
      v48 = 2048;
      v49 = v19;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Coalescer told us to register but we're still in %{public}@. Telling Coalescer to push back for %.1f seconds", v46, 0x16u);
    }

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_90;
    v20[3] = &unk_1E3667BB0;
    v21 = v10;
    objc_msgSend(v7, "pushBack:", v20);
    objc_msgSend(v7, "delayNextInvocationByTimeInterval:", *((double *)v29 + 3));
    -[PLBackgroundJobService startWatchdogTimerIfNeededWithSourceDescription:](self, "startWatchdogTimerIfNeededWithSourceDescription:", CFSTR("push back"));

    _Block_object_dispose(buf, 8);
  }

}

- (void)_runActivity:(id)a3 withCriteria:(id)a4
{
  _xpc_activity_s *v7;
  id v8;
  xpc_activity_state_t state;
  xpc_activity_state_t v10;
  NSObject *v11;
  xpc_object_t v12;
  const char *string;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  _BOOL4 cameraForeground;
  int v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = (_xpc_activity_s *)a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  state = xpc_activity_get_state(v7);
  if (state == 2)
  {
    v12 = xpc_activity_copy_criteria(v7);
    string = xpc_dictionary_get_string(v12, (const char *)*MEMORY[0x1E0C80878]);

    PLBackgroundJobServiceGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = (uint64_t)v15;
      v37 = 2082;
      v38 = (void *)string;
      v39 = 2114;
      v40 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Background Job Service asked to run criteria %{public}@ at priority %{public}s, QOS %{public}@", (uint8_t *)&v35, 0x20u);

    }
    v17 = -[PLBackgroundJobService serviceState](self, "serviceState");
    v18 = objc_msgSend((id)objc_opt_class(), "_verifyActivityHandlerInvokedWithCorrectIdentifier:forCriteria:", v7, v8);
    v19 = objc_msgSend((id)objc_opt_class(), "_stateIsReadyToRun:", v17);
    objc_msgSend(v8, "shortCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundJobService _getBundleRecordsFromProcessingSetForCriteriaShortCode:](self, "_getBundleRecordsFromProcessingSetForCriteriaShortCode:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      cameraForeground = self->_cameraForeground;
      if (self->_cameraForeground)
        v23 = 0;
      else
        v23 = v19;
      if (v23 == 1)
      {
        if (objc_msgSend(v21, "count"))
        {
          self->_deferringService = 0;
          if ((MEMORY[0x19AEC0720]() & 1) != 0)
          {
LABEL_50:

            goto LABEL_51;
          }
          if (xpc_activity_set_state(v7, 4))
          {
            -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v8);
            objc_storeStrong((id *)&self->_runningXPCActivity, a3);
            objc_storeStrong((id *)&self->_runningCriteria, a4);
            -[PLBackgroundJobService _startPollingForActivityStatusOnQueue](self, "_startPollingForActivityStatusOnQueue");
            -[PLBackgroundJobService _startRunningBackgroundJobsWithCriteriaOnQueue:](self, "_startRunningBackgroundJobsWithCriteriaOnQueue:", v8);
            goto LABEL_50;
          }
          PLBackgroundJobServiceGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v35) = 0;
            v27 = "Unable to update background job service activity state to continue";
            goto LABEL_30;
          }
LABEL_31:

          goto LABEL_50;
        }
        cameraForeground = self->_cameraForeground;
      }
      if (cameraForeground)
      {
        PLBackgroundJobServiceGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Telling XPC we're done because Camera is active", (uint8_t *)&v35, 2u);
        }

        if (!xpc_activity_set_state(v7, 5))
        {
          -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v8);
          PLBackgroundJobServiceGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v35) = 0;
            _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Unable to update background job service activity state to done", (uint8_t *)&v35, 2u);
          }

        }
        -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 5);
        objc_storeStrong((id *)&self->_pausedCriteria, a4);
      }
      else
      {
        -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v8);
        PLBackgroundJobServiceGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "name");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v17 - 1 > 9)
            v33 = CFSTR("Unknown");
          else
            v33 = off_1E3667C20[v17 - 1];
          v35 = 138543618;
          v36 = v31;
          v37 = 2114;
          v38 = (void *)v33;
          _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Background Job Service is not in a runnable state for criteria %{public}@. It's in %{public}@. Skipping calls to _startRunningBackgroundJobs for this activity. XPC Activity execution ends here for this activity. Removing all bundles from processing set for this criteria", (uint8_t *)&v35, 0x16u);

        }
        if ((MEMORY[0x19AEC0720]() & 1) == 0)
        {
          objc_msgSend(v8, "shortCode");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBackgroundJobService _removeAllBundlesFromProcessingSetForCriteriaShortCode:](self, "_removeAllBundlesFromProcessingSetForCriteriaShortCode:", v34);

        }
      }
      goto LABEL_50;
    }
    if (xpc_activity_set_state(v7, 5))
    {
      -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v8);
      PLBackgroundJobServiceGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      LOWORD(v35) = 0;
      v27 = "Setting activity state to DONE from RUN state because activity is not valid at this time";
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      LOWORD(v35) = 0;
      v27 = "Unable to update background job service activity state to done";
    }
LABEL_30:
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v35, 2u);
    goto LABEL_31;
  }
  v10 = state;
  if (state)
  {
    PLBackgroundJobServiceGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 134218242;
      v36 = v10;
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_FAULT, "Unexpected XPC activity state: %ld for job %{public}@", (uint8_t *)&v35, 0x16u);

    }
    goto LABEL_27;
  }
  -[PLBackgroundJobService _setRegisteredActivityForCriteria:](self, "_setRegisteredActivityForCriteria:", v8);
  if (!objc_msgSend((id)objc_opt_class(), "_verifyActivityHandlerInvokedWithCorrectIdentifier:forCriteria:", v7, v8))
  {
    if (xpc_activity_set_state(v7, 5))
    {
      -[PLBackgroundJobService _removeRegisteredActivityForCriteria:](self, "_removeRegisteredActivityForCriteria:", v8);
      PLBackgroundJobServiceGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      LOWORD(v35) = 0;
      v25 = "Setting activity state to DONE at CHECK_IN because activity is not valid at this time";
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      LOWORD(v35) = 0;
      v25 = "Unable to update background job service activity state to done";
    }
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v35, 2u);
    goto LABEL_27;
  }
  objc_msgSend(v8, "xpcCriteria");
  v11 = objc_claimAutoreleasedReturnValue();
  xpc_activity_set_criteria(v7, v11);
LABEL_27:

LABEL_51:
}

- (void)_unregisterActivityIfNeededShouldConsiderDeferring_enqueue:(BOOL)a3
{
  NSObject *isolationQueue;
  _QWORD v4[5];
  BOOL v5;

  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__PLBackgroundJobService__unregisterActivityIfNeededShouldConsiderDeferring_enqueue___block_invoke;
  v4[3] = &unk_1E36762F8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(isolationQueue, v4);
}

- (void)_unregisterActivityIfNeededShouldConsiderDeferring:(BOOL)a3
{
  _BOOL4 v3;
  OS_xpc_object *runningXPCActivity;
  void *v6;
  NSObject *v7;
  const char *v8;
  OS_xpc_object *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v3 && self->_deferringService)
  {
    runningXPCActivity = self->_runningXPCActivity;
    if (runningXPCActivity && !xpc_activity_set_state(runningXPCActivity, 3))
    {
      v6 = (void *)xpc_activity_copy_identifier();
      PLBackgroundJobServiceGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446210;
        v11 = v6;
        v8 = "Unable to update background job service activity %{public}s state to defer";
LABEL_11:
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v9 = self->_runningXPCActivity;
    if (v9 && !xpc_activity_set_state(v9, 5))
    {
      v6 = (void *)xpc_activity_copy_identifier();
      PLBackgroundJobServiceGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 136446210;
        v11 = v6;
        v8 = "Unable to update background job service activity %{public}s state to done";
        goto LABEL_11;
      }
LABEL_12:

      free(v6);
    }
  }
}

- (void)_startPollingForActivityStatus
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PLBackgroundJobService__startPollingForActivityStatus__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)_startPollingForActivityStatusOnQueue
{
  OS_dispatch_source *v4;
  OS_dispatch_source *runningXPCActivityDeferTimer;
  NSObject *v6;
  OS_xpc_object *runningXPCActivity;
  NSObject *v8;
  void *v9;
  _QWORD handler[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_runningXPCActivityDeferTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobService.m"), 776, CFSTR("timer is not nil"));

  }
  if (self->_simulateXpcActivityDeferring
    || (runningXPCActivity = self->_runningXPCActivity) != 0 && xpc_activity_get_state(runningXPCActivity) == 4)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
    self->_runningXPCActivityDeferTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_runningXPCActivityDeferTimer, 0, 0x77359400uLL, 0x77359400uLL);
    v6 = self->_runningXPCActivityDeferTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__PLBackgroundJobService__startPollingForActivityStatusOnQueue__block_invoke;
    handler[3] = &unk_1E3677AA0;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_runningXPCActivityDeferTimer);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "_startPollingForActivityStatus called with nil _runningXPCActivity or an _xpcActivity is non-Continue state. Ignoring.", buf, 2u);
    }

  }
}

- (void)_stopRunningBackgroundJobs
{
  NSObject *runningXPCActivityDeferTimer;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  self->_deferringService = 1;
  runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
  if (runningXPCActivityDeferTimer)
    dispatch_suspend(runningXPCActivityDeferTimer);
  if ((MEMORY[0x19AEC0720]() & 1) == 0)
    dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLBackgroundJobServiceGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Trying to stop running background jobs on all bundles", v5, 2u);
  }

  -[PLBackgroundJobLibraryCoordinator stopBackgroundJobsOnAllBundles](self->_libraryCoordinator, "stopBackgroundJobsOnAllBundles");
}

- (void)_stopPollingForActivityStatus
{
  NSObject *runningXPCActivityDeferTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
  if (runningXPCActivityDeferTimer)
  {
    if (self->_deferringService)
    {
      dispatch_resume(runningXPCActivityDeferTimer);
      runningXPCActivityDeferTimer = self->_runningXPCActivityDeferTimer;
    }
    dispatch_source_cancel(runningXPCActivityDeferTimer);
    v4 = self->_runningXPCActivityDeferTimer;
    self->_runningXPCActivityDeferTimer = 0;

  }
}

- (void)_startRunningBackgroundJobsWithCriteria:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLBackgroundJobService__startRunningBackgroundJobsWithCriteria___block_invoke;
  block[3] = &unk_1E3677C18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)_startRunningBackgroundJobsWithCriteriaOnQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLBackgroundJobService _setServiceStateOnQueue:](self, "_setServiceStateOnQueue:", 6);
  objc_msgSend(v4, "shortCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobService _getBundleRecordsFromProcessingSetForCriteriaShortCode:](self, "_getBundleRecordsFromProcessingSetForCriteriaShortCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Running criteria %{public}@ background jobs on bundles %@", (uint8_t *)&v9, 0x16u);

  }
  -[PLBackgroundJobLibraryCoordinator startBackgroundJobsOnBundles:withCriteria:](self->_libraryCoordinator, "startBackgroundJobsOnBundles:withCriteria:", v6, v4);

}

- (id)_bundlesToProcessByCriteriaShortCodesAsPathStrings
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  void *v4;

  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  -[PLBackgroundJobService _bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked](self, "_bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  return v4;
}

- (id)_bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_bundlesToProcessByCriteriaShortCodeLock);
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v2)
  {
    v3 = v2;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", v5);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v13, "libraryURL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
              {
                objc_msgSend(v13, "libraryURL");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "path");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v16);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v10);
        }

        v17 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, v5);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v3);
  }

  v18 = (void *)objc_msgSend(v23, "copy");
  return v18;
}

- (void)_persistBundleRecordsDictionaryToUserDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_bundlesToProcessByCriteriaShortCodeLock);
  -[PLBackgroundJobService _bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked](self, "_bundlesToProcessByCriteriaShortCodesAsPathStringsAlreadyLocked");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("PLBackgroundJobServiceBundleRecordsKeyWithShortCode"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_loadBundleRecordsDictionaryFromUserDefaults
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *bundlesToProcessByCriteriaShortCode;
  id v16;
  os_unfair_lock_t lock;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  lock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__PLBackgroundJobService__loadBundleRecordsDictionaryFromUserDefaults__block_invoke;
  v24[3] = &unk_1E3667C00;
  v16 = v2;
  v25 = v16;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v24);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("PLBackgroundJobServiceBundleRecordsKeyWithShortCode"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v4)[2](v4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v10);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v7);
  }

  v14 = (NSDictionary *)objc_msgSend(v5, "copy");
  bundlesToProcessByCriteriaShortCode = self->_bundlesToProcessByCriteriaShortCode;
  self->_bundlesToProcessByCriteriaShortCode = v14;

  os_unfair_lock_unlock(lock);
}

- (void)_appendBundleRecordsToProcessingSet:(id)a3 criteriaShortCode:(id)a4
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v7;
  id v8;
  id v9;

  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionSet:", v8);
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  -[PLBackgroundJobService _persistBundleRecordsDictionaryToUserDefaults](self, "_persistBundleRecordsDictionaryToUserDefaults");
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);

}

- (void)_removeBundleRecordFromProcessingSet:(id)a3 criteriaShortCode:(id)a4
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v7;
  id v8;
  id v9;

  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v8);
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  -[PLBackgroundJobService _persistBundleRecordsDictionaryToUserDefaults](self, "_persistBundleRecordsDictionaryToUserDefaults");
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);

}

- (void)_removeAllBundlesFromProcessingSetForCriteriaShortCode:(id)a3
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v5;
  id v6;

  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  v5 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeAllObjects");
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  -[PLBackgroundJobService _persistBundleRecordsDictionaryToUserDefaults](self, "_persistBundleRecordsDictionaryToUserDefaults");
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);

}

- (void)_removeAllBundlesFromProcessingSet
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *bundlesToProcessByCriteriaShortCode;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (NSDictionary *)objc_msgSend(v4, "copy");
  bundlesToProcessByCriteriaShortCode = self->_bundlesToProcessByCriteriaShortCode;
  self->_bundlesToProcessByCriteriaShortCode = v12;

  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  -[PLBackgroundJobService _persistBundleRecordsDictionaryToUserDefaults](self, "_persistBundleRecordsDictionaryToUserDefaults");
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);

}

- (id)_getBundleRecordsFromProcessingSetForCriteriaShortCode:(id)a3
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v5;
  void *v6;
  void *v7;

  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  v5 = a3;
  os_unfair_lock_lock(p_bundlesToProcessByCriteriaShortCodeLock);
  LogBundlesToProcessByCriteria(self->_bundlesToProcessByCriteriaShortCode, 0);
  -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  return v7;
}

- (id)_getBundleRecordsFromProcessingSetForAllCriterias
{
  os_unfair_lock_s *p_bundlesToProcessByCriteriaShortCodeLock;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_bundlesToProcessByCriteriaShortCodeLock = &self->_bundlesToProcessByCriteriaShortCodeLock;
  os_unfair_lock_lock(&self->_bundlesToProcessByCriteriaShortCodeLock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NSDictionary objectForKeyedSubscript:](self->_bundlesToProcessByCriteriaShortCode, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_bundlesToProcessByCriteriaShortCodeLock);
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (void)libraryCoordinatorFinishedJobsOnSubmittedBundle:(id)a3 withCriteria:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *isolationQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Library coordinator reported all background jobs finished on bundle %@ with criteria %{public}@", buf, 0x16u);

  }
  isolationQueue = self->_isolationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnSubmittedBundle_withCriteria___block_invoke;
  v12[3] = &unk_1E3677C18;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  dispatch_async(isolationQueue, v12);

}

- (void)libraryCoordinatorFinishedJobsOnAllSubmittedBundles
{
  NSObject *v3;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  PLBackgroundJobServiceGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Library coordinator reported all background jobs finished running on all bundles", buf, 2u);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnAllSubmittedBundles__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (id)stateCaptureDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PLBackgroundJobService statusCenterDump](self, "statusCenterDump");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[PLBackgroundJobCriteria allKnownCriterias](PLBackgroundJobCriteria, "allKnownCriterias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v8, "shortCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBackgroundJobService _getBundleRecordsFromProcessingSetForCriteriaShortCode:](self, "_getBundleRecordsFromProcessingSetForCriteriaShortCode:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__29896;
  v28 = __Block_byref_object_dispose__29897;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__29896;
  v22 = __Block_byref_object_dispose__29897;
  v23 = 0;
  PLSafeRunWithUnfairLock();
  v13 = -[PLBackgroundJobService serviceState](self, "serviceState");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("statusCenter"));
  if (v13 - 1 > 9)
    v15 = CFSTR("Unknown");
  else
    v15 = off_1E3667C20[v13 - 1];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("state"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v3, CFSTR("criteria"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v25[5], CFSTR("watchdogTimerStartDate"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19[5], CFSTR("watchdogTimerSource"));
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_watchdogTimerLock_watchdogTimerSourceDescription, 0);
  objc_storeStrong((id *)&self->_watchdogTimerLock_dateOfWatchdogTimerStart, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
  objc_storeStrong((id *)&self->_simulateXpcActivityDeferring, 0);
  objc_storeStrong((id *)&self->_runningXPCActivityDeferTimer, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_bundlesToProcessByCriteriaShortCode, 0);
  objc_storeStrong((id *)&self->_libraryInvalidationCompletionHandlerByLibraryURL, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_registrationCoalescer, 0);
  objc_storeStrong((id *)&self->_pausedCriteria, 0);
  objc_storeStrong((id *)&self->_runningCriteria, 0);
  objc_storeStrong((id *)&self->_libraryCoordinator, 0);
  objc_storeStrong((id *)&self->_statusCenter, 0);
  objc_storeStrong((id *)&self->_runningXPCActivity, 0);
  objc_storeStrong((id *)&self->_registeredXPCActivities, 0);
}

void __48__PLBackgroundJobService_stateCaptureDictionary__block_invoke(_QWORD *a1)
{
  void *v1;

  v1 = *(void **)(a1[4] + 168);
  if (v1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v1);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  }
}

void __77__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnAllSubmittedBundles__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setServiceStateOnQueue:", 7);
  objc_msgSend(*(id *)(a1 + 32), "_getBundleRecordsFromProcessingSetForAllCriterias");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 128))
  {
    v4 = objc_msgSend(*(id *)(v3 + 48), "shouldDeferActivity");
    v3 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend((id)v3, "_stopPollingForActivityStatus");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
      PLBackgroundJobServiceGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "_libraryCoordinator says we should defer but _deferringService flag NOT set! Going to set _deferringService & immediately shutting down...", buf, 2u);
      }

      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_BYTE *)(v3 + 128))
  {
    PLBackgroundJobServiceGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "_deferringService flag set! NOT removing any bundle records & immediately shutting down...", buf, 2u);
    }

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_shutdown");
    goto LABEL_38;
  }
  v7 = objc_msgSend(v2, "count");
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Processing bundle set is empty, shutting down...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_removeAllBundlesFromProcessingSet");
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Checking all bundles if they have more work to do before considering shutdown", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_stopPollingForActivityStatus");
  PLBackgroundJobServiceGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Removing all bundles from processing set", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_removeAllBundlesFromProcessingSet");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pendingJobsOnBundles:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), (_QWORD)v24) & 1) != 0)
          {

            PLBackgroundJobServiceGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v29 = v20;
              _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Bundle has more work to do at the same criteria %{public}@. Calling _startRunningBackgroundJobsWithCriteriaAlreadyLocked right away!", buf, 0xCu);

            }
            objc_msgSend(*(id *)(a1 + 32), "_startPollingForActivityStatusOnQueue");
            v21 = *(id **)(a1 + 32);
            objc_msgSend(v21[7], "shortCode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "_appendBundleRecordsToProcessingSet:criteriaShortCode:", v2, v22);

            objc_msgSend(*(id *)(a1 + 32), "_startRunningBackgroundJobsWithCriteriaOnQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
            goto LABEL_37;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v14)
          continue;
        break;
      }
    }

    PLBackgroundJobServiceGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Bundle has more work to do but we're currently running at %{public}@ criteria and the new work is at another criteria. Unregistering current activity and calling _registerActivityIfNecessaryOnBundles", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_unregisterActivityIfNeededShouldConsiderDeferring:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_removeRegisteredActivityForCriteria:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(a1 + 32), "_registerActivityIfNecessaryOnBundles:", v2);
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "All bundles report no further work to do. Really shutting down...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_shutdown");
  }
LABEL_37:

LABEL_38:
}

void __87__PLBackgroundJobService_libraryCoordinatorFinishedJobsOnSubmittedBundle_withCriteria___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(*(id *)(a1 + 40), "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PLBackgroundJobServiceGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Calling library invalidation completionHandler for bundle %@", (uint8_t *)&v12, 0xCu);
    }

    v4[2](v4);
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

    v9 = objc_msgSend(v7, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = v9;

  }
}

id __70__PLBackgroundJobService__loadBundleRecordsDictionaryFromUserDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), 1, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "bundleForLibraryURL:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __66__PLBackgroundJobService__startRunningBackgroundJobsWithCriteria___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRunningBackgroundJobsWithCriteriaOnQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__PLBackgroundJobService__startPollingForActivityStatusOnQueue__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _xpc_activity_s *v3;
  const __CFString *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 128))
    return result;
  v2 = result;
  v3 = *(_xpc_activity_s **)(v1 + 16);
  if (!v3)
  {
    if ((objc_msgSend(*(id *)(v1 + 136), "BOOLValue") & 1) != 0)
      goto LABEL_4;
LABEL_6:
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 48), "shouldDeferActivity");
    if (!(_DWORD)result)
      return result;
    v4 = CFSTR("Worker");
    goto LABEL_8;
  }
  if (!xpc_activity_should_defer(v3))
    goto LABEL_6;
LABEL_4:
  v4 = CFSTR("DAS");
LABEL_8:
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Calling _stopRunningBackgroundJobs because %{public}@ told us to defer!", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(v2 + 32), "_stopRunningBackgroundJobs");
}

uint64_t __56__PLBackgroundJobService__startPollingForActivityStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPollingForActivityStatusOnQueue");
}

uint64_t __85__PLBackgroundJobService__unregisterActivityIfNeededShouldConsiderDeferring_enqueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterActivityIfNeededShouldConsiderDeferring:", *(unsigned __int8 *)(a1 + 40));
}

void __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 168);
  *(_QWORD *)(v1 + 168) = 0;

}

uint64_t __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 176) = 0x4000000000000000;
  return result;
}

double __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  double result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v1 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v1 + 176);
  if (result < 4096.0)
  {
    result = result + result;
    *(double *)(v1 + 176) = result;
  }
  return result;
}

uint64_t __80__PLBackgroundJobService__registerBackgroundProcessingNeededForBundles_context___block_invoke_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionSet:", *(_QWORD *)(a1 + 32));
}

void __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke_2;
  block[3] = &unk_1E3677530;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_sync(v6, block);

}

uint64_t __56__PLBackgroundJobService__registerActivityWithCriteria___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runActivity:withCriteria:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80__PLBackgroundJobService__registerActivityWithoutCoalescingIfNecessaryOnBundle___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_registerActivityIfNecessaryOnBundles:", v2);

}

double __74__PLBackgroundJobService_startWatchdogTimerIfNeededWithSourceDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 168))
  {
    objc_storeStrong((id *)(v2 + 168), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(double *)(v2 + 176);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __67__PLBackgroundJobService_signalBackgroundProcessingNeededOnBundle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

_QWORD *__50__PLBackgroundJobService__setServiceStateOnQueue___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 32);
  *(_QWORD *)(result[4] + 32) = result[6];
  return result;
}

uint64_t __43__PLBackgroundJobService__setServiceState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setServiceStateOnQueue:", *(_QWORD *)(a1 + 40));
}

void __46__PLBackgroundJobService__setRunningCriteria___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __61__PLBackgroundJobService_invalidateLibraryBundle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  const __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "serviceState");
  if (v2 != 6)
  {
    PLBackgroundJobServiceGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "System is not in running state, no work to invalidate", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_getBundleRecordsFromProcessingSetForAllCriterias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 != 6)
    goto LABEL_25;
  v6 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));
  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      v25 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Bundle %@ is not in processing queue %@, no work to invalidate", buf, 0x16u);
    }

LABEL_25:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_30;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Calling _stopRunningBackgroundJobs in response to library invalidation", buf, 2u);
  }

  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableCopy");
  v10 = (void *)MEMORY[0x19AEC174C](*(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "libraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v11);

  v12 = objc_msgSend(v9, "copy");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 88);
  *(_QWORD *)(v13 + 88) = v12;

  PLBackgroundJobServiceGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v32 = v16;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Removing bundle from processing sets: %@", buf, 0xCu);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(a1 + 32), "_removeBundleRecordFromProcessingSet:criteriaShortCode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

  v22 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128);
  PLBackgroundJobServiceGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("Running");
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Not calling _stopRunningBackgroundJobs even though we're in invalidateLibraryBundle because _deferringService is set which indicates that we're already in the middle of stopping. State: %@", buf, 0xCu);
    }

  }
  else
  {
    if (v24)
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("Running");
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Going to call _stopRunningBackgroundJobs during library invalidation. State: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_stopRunningBackgroundJobs");
  }

LABEL_30:
}

void __50__PLBackgroundJobService__simulateXPCShouldDefer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

uint64_t __66__PLBackgroundJobService_initWithLibraryCoordinator_statusCenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_registerBackgroundProcessingNeededForBundles:context:");
}

+ (BOOL)verifyStateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  BOOL v4;
  BOOL result;
  unint64_t v6;
  BOOL v8;

  switch(a3)
  {
    case 0uLL:
      v4 = a4 == 1;
      goto LABEL_29;
    case 1uLL:
      v4 = (a4 & 0xFFFFFFFFFFFFFFFBLL) == 2;
      goto LABEL_29;
    case 2uLL:
      v6 = a4 - 3;
      goto LABEL_21;
    case 3uLL:
      v4 = a4 == 8 || a4 == 2;
      goto LABEL_29;
    case 4uLL:
      v4 = a4 == 2 || (a4 & 0xFFFFFFFFFFFFFFFDLL) == 4 || a4 == 5;
      goto LABEL_29;
    case 5uLL:
      v4 = a4 == 4;
      goto LABEL_29;
    case 6uLL:
      v4 = a4 == 7;
      goto LABEL_29;
    case 7uLL:
      v4 = a4 == 8 || (a4 & 0xFFFFFFFFFFFFFFFBLL) == 2;
      goto LABEL_29;
    case 8uLL:
      v6 = a4 - 9;
LABEL_21:
      v8 = v6 >= 2;
      goto LABEL_25;
    case 9uLL:
      v8 = a4 != 2 && a4 - 5 >= 2;
LABEL_25:
      result = !v8;
      break;
    case 0xAuLL:
      v4 = a4 == 2;
LABEL_29:
      result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)_stateIsReadyForRegistration:(unint64_t)a3
{
  return (a3 < 0xB) & (0x63Au >> a3);
}

+ (BOOL)_stateIsReadyToRun:(unint64_t)a3
{
  return (a3 > 0xA) | (0x210u >> a3) & 1;
}

+ (BOOL)_verifyActivityHandlerInvokedWithCorrectIdentifier:(id)a3 forCriteria:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = (void *)xpc_activity_copy_identifier();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  free(v5);
  objc_msgSend(v4, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v8 & 1) == 0)
  {
    PLBackgroundJobServiceGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Told to run activity %{public}@ but we were expecting criteria %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  return v8;
}

+ (void)_removeAllBundlesFromUserDefaultsWithoutLocking
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[PLBackgroundJobCriteria allKnownShortCodes](PLBackgroundJobCriteria, "allKnownShortCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("PLBackgroundJobServiceBundleRecordsKeyWithShortCode"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "removeObjectForKey:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
