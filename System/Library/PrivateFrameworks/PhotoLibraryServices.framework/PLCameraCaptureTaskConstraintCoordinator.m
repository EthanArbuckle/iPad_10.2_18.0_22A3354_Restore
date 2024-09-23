@implementation PLCameraCaptureTaskConstraintCoordinator

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t role;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  int64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v14;
  objc_super v15;
  objc_super v16;

  if (self->_failsafeTimerEnabled)
  {
    v16.receiver = self;
    v16.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
    -[PLCameraCaptureTaskConstraintCoordinator description](&v16, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    role = self->_role;
    v6 = CFSTR("AutomaticCameraViewfinderSession");
    if (role != 2)
      v6 = 0;
    if (role == 1)
      v7 = CFSTR("CameraAppKeepAlive");
    else
      v7 = v6;
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%@, %@, %@, %@)"), v7, self->_name, self->_creationDateString, self->_failsafeTimer);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
    -[PLCameraCaptureTaskConstraintCoordinator description](&v15, sel_description);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    v9 = self->_role;
    v10 = CFSTR("AutomaticCameraViewfinderSession");
    if (v9 != 2)
      v10 = 0;
    if (v9 == 1)
      v11 = CFSTR("CameraAppKeepAlive");
    else
      v11 = v10;
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" (%@, %@, %@)"), v11, self->_name, self->_creationDateString, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

uint64_t __80__PLCameraCaptureTaskConstraintCoordinator_activateCameraSessionTaskConstraints__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    PLCameraTaskConstraintsGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_FAULT, "%{public}@: activate camera session already has an active transaction", (uint8_t *)&v7, 0xCu);
    }

  }
  PLCameraTaskConstraintsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: activating camera session task constraints", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_activateCameraSessionTaskConstraints");
}

- (void)_activateCameraSessionTaskConstraints
{
  PLXPCTransaction *v3;
  PLXPCTransaction *transaction;
  NSObject *v5;
  void *v6;
  int v7;
  PLCameraCaptureTaskConstraintCoordinator *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "PLCameraCaptureTaskConstraintCoordinator");
  v3 = (PLXPCTransaction *)objc_claimAutoreleasedReturnValue();
  transaction = self->_transaction;
  self->_transaction = v3;

  if (self->_delayedDeactivationInProgress)
  {
    PLCameraTaskConstraintsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: cancelling delayed deactivation", (uint8_t *)&v7, 0xCu);
    }

    self->_delayedDeactivationInProgress = 0;
  }
  if (-[PLDelayedActionTimer isRunning](self->_failsafeTimer, "isRunning"))
    -[PLCameraCaptureTaskConstraintCoordinator _cancelSessionFailsafeTimer](self, "_cancelSessionFailsafeTimer");
  +[PLCameraCaptureTaskConstraints sharedTaskConstraints](PLCameraCaptureTaskConstraints, "sharedTaskConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startConstrainingTasksWithCoordinator:", self);

  if (self->_failsafeTimerEnabled)
    -[PLCameraCaptureTaskConstraintCoordinator _startSessionFailsafeTimer](self, "_startSessionFailsafeTimer");
}

- (void)activateCameraSessionTaskConstraints
{
  NSObject *activationQueue;
  _QWORD block[5];

  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PLCameraCaptureTaskConstraintCoordinator_activateCameraSessionTaskConstraints__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(activationQueue, block);
}

- (PLCameraCaptureTaskConstraintCoordinator)initWithTaskContstraintRole:(int64_t)a3 name:(id)a4
{
  id v6;
  PLCameraCaptureTaskConstraintCoordinator *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  uint64_t v11;
  NSString *creationDateString;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *activationQueue;
  uint64_t v16;
  PLDelayedActionTimer *failsafeTimer;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  PLCameraCaptureTaskConstraintCoordinator *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
  v7 = -[PLCameraCaptureTaskConstraintCoordinator init](&v20, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLDateToISO8160StringWithLocalTimeZone(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    creationDateString = v7->_creationDateString;
    v7->_creationDateString = (NSString *)v11;

    v7->_role = a3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v14 = objc_claimAutoreleasedReturnValue();
    activationQueue = v7->_activationQueue;
    v7->_activationQueue = (OS_dispatch_queue *)v14;

    if (+[PLCameraCaptureTaskConstraintCoordinator _shouldWatchCameraViewfinderForRole:](PLCameraCaptureTaskConstraintCoordinator, "_shouldWatchCameraViewfinderForRole:", a3))
    {
      -[PLCameraCaptureTaskConstraintCoordinator _startWatchingCameraActivity](v7, "_startWatchingCameraActivity");
    }
    if (+[PLCameraCaptureTaskConstraintCoordinator _shouldUseFailsafeTimerForRole:](PLCameraCaptureTaskConstraintCoordinator, "_shouldUseFailsafeTimerForRole:", a3))
    {
      v7->_failsafeTimerEnabled = 1;
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D731C8]), "initWithTargetQueue:", v7->_activationQueue);
      failsafeTimer = v7->_failsafeTimer;
      v7->_failsafeTimer = (PLDelayedActionTimer *)v16;

    }
    PLCameraTaskConstraintsGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: initialized", buf, 0xCu);
    }

  }
  return v7;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  PLCameraCaptureTaskConstraintCoordinator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLCameraTaskConstraintsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: invalidate", (uint8_t *)&v5, 0xCu);
  }

  +[PLCameraCaptureTaskConstraints sharedTaskConstraints](PLCameraCaptureTaskConstraints, "sharedTaskConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopConstrainingTasksWithCoordinator:", self);

}

- (id)sessionStatusDescription
{
  NSObject *activationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__47051;
  v10 = __Block_byref_object_dispose__47052;
  v11 = CFSTR("inactive");
  activationQueue = self->_activationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PLCameraCaptureTaskConstraintCoordinator_sessionStatusDescription__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)deactivateCameraSessionTaskConstraints
{
  NSObject *activationQueue;
  _QWORD block[5];

  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PLCameraCaptureTaskConstraintCoordinator_deactivateCameraSessionTaskConstraints__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(activationQueue, block);
}

- (void)_deactivateCameraSessionTaskConstraintsAfterDelay:(double)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *activationQueue;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  PLCameraCaptureTaskConstraintCoordinator *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  if (self->_delayedDeactivationInProgress)
  {
    PLCameraTaskConstraintsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: task constraint deactivation already in progress", buf, 0xCu);
    }

  }
  else
  {
    if (-[PLDelayedActionTimer isRunning](self->_failsafeTimer, "isRunning"))
      -[PLCameraCaptureTaskConstraintCoordinator _cancelSessionFailsafeTimer](self, "_cancelSessionFailsafeTimer");
    if (a3 == 0.0)
    {
      -[PLCameraCaptureTaskConstraintCoordinator _invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:](self, "_invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:", 0);
    }
    else
    {
      self->_delayedDeactivationInProgress = 1;
      objc_initWeak((id *)buf, self);
      v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      activationQueue = self->_activationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__PLCameraCaptureTaskConstraintCoordinator__deactivateCameraSessionTaskConstraintsAfterDelay___block_invoke;
      block[3] = &unk_1E3677D48;
      objc_copyWeak(&v9, (id *)buf);
      dispatch_after(v6, activationQueue, block);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:(BOOL)a3
{
  void *v4;
  PLXPCTransaction *transaction;
  NSObject *v6;
  const char *v7;
  void *v8;
  PLXPCTransaction *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  PLCameraCaptureTaskConstraintCoordinator *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!self->_delayedDeactivationInProgress)
    {
      PLCameraTaskConstraintsGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v12 = 138543362;
      v13 = self;
      v7 = "%{public}@: delayed task constraint deactivation cancelled by re-activation";
      v10 = v6;
      v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
    +[PLCameraCaptureTaskConstraints sharedTaskConstraints](PLCameraCaptureTaskConstraints, "sharedTaskConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopConstrainingTasksWithCoordinator:", self);

    transaction = self->_transaction;
    self->_transaction = 0;

    self->_delayedDeactivationInProgress = 0;
    PLCameraTaskConstraintsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138543362;
      v13 = self;
      v7 = "%{public}@: task constraints deactivated after delay";
LABEL_7:
      v10 = v6;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_199541000, v10, v11, v7, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    +[PLCameraCaptureTaskConstraints sharedTaskConstraints](PLCameraCaptureTaskConstraints, "sharedTaskConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopConstrainingTasksWithCoordinator:", self);

    v9 = self->_transaction;
    self->_transaction = 0;

    PLCameraTaskConstraintsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138543362;
      v13 = self;
      v7 = "%{public}@: task constraints deactivated";
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)_startSessionFailsafeTimer
{
  NSObject *v3;
  PLDelayedActionTimer *failsafeTimer;
  PLDelayedActionTimer *v5;
  NSObject *v6;
  PLDelayedActionTimer *v7;
  _QWORD v8[5];
  id v9;
  id location;
  uint8_t buf[4];
  PLCameraCaptureTaskConstraintCoordinator *v12;
  __int16 v13;
  PLDelayedActionTimer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  if (-[PLDelayedActionTimer isRunning](self->_failsafeTimer, "isRunning"))
  {
    PLCameraTaskConstraintsGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      failsafeTimer = self->_failsafeTimer;
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = failsafeTimer;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request to start active task constraint failsafe timer %{public}@", buf, 0x16u);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    v5 = self->_failsafeTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__PLCameraCaptureTaskConstraintCoordinator__startSessionFailsafeTimer__block_invoke;
    v8[3] = &unk_1E3677B80;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    -[PLDelayedActionTimer afterDelay:performBlock:](v5, "afterDelay:performBlock:", v8, 600.0);
    PLCameraTaskConstraintsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = self->_failsafeTimer;
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: started task constraint failsafe timer %{public}@", buf, 0x16u);
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelSessionFailsafeTimer
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  PLDelayedActionTimer *failsafeTimer;
  int v7;
  PLCameraCaptureTaskConstraintCoordinator *v8;
  __int16 v9;
  PLDelayedActionTimer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  v3 = -[PLDelayedActionTimer isRunning](self->_failsafeTimer, "isRunning");
  PLCameraTaskConstraintsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      failsafeTimer = self->_failsafeTimer;
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = failsafeTimer;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: PLCameraCaptureTaskConstraintCoordinator cancelling failsafe timer %{public}@", (uint8_t *)&v7, 0x16u);
    }

    -[PLDelayedActionTimer cancel](self->_failsafeTimer, "cancel");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: PLCameraCaptureTaskConstraintCoordinator ignoring request to cancel NULL failsafe timer", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_startWatchingCameraActivity
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *cameraWatcherQueue;
  PFCameraViewfinderSessionWatcher *v8;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  int v10;
  PLCameraCaptureTaskConstraintCoordinator *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLCameraTaskConstraintsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: starting camera viewfinder monitor", (uint8_t *)&v10, 0xCu);
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.backgroundjobservice.isolationqueue", v5);
  cameraWatcherQueue = self->_cameraWatcherQueue;
  self->_cameraWatcherQueue = v6;

  v8 = (PFCameraViewfinderSessionWatcher *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", self->_cameraWatcherQueue, self);
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v8;

  -[PFCameraViewfinderSessionWatcher startWatching](self->_cameraWatcher, "startWatching");
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  NSObject *cameraWatcherQueue;
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  PLCameraCaptureTaskConstraintCoordinator *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  cameraWatcherQueue = self->_cameraWatcherQueue;
  v5 = a3;
  dispatch_assert_queue_V2(cameraWatcherQueue);
  v6 = objc_msgSend(v5, "isCameraRunning");

  PLCameraTaskConstraintsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: activating camera session task constraints automatically", (uint8_t *)&v9, 0xCu);
    }

    -[PLCameraCaptureTaskConstraintCoordinator activateCameraSessionTaskConstraints](self, "activateCameraSessionTaskConstraints");
  }
  else
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: deactivating camera session task constraints automatically", (uint8_t *)&v9, 0xCu);
    }

    -[PLCameraCaptureTaskConstraintCoordinator deactivateCameraSessionTaskConstraints](self, "deactivateCameraSessionTaskConstraints");
  }
}

- (int64_t)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraWatcherQueue, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_failsafeTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activationQueue, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __70__PLCameraCaptureTaskConstraintCoordinator__startSessionFailsafeTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLCameraTaskConstraintsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 48);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: task constraint failsafe timer fired %{public}@, deactivating task constraints", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deactivateCameraSessionTaskConstraintsAfterDelay:", 0.0);

}

void __94__PLCameraCaptureTaskConstraintCoordinator__deactivateCameraSessionTaskConstraintsAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:", 1);

}

uint64_t __82__PLCameraCaptureTaskConstraintCoordinator_deactivateCameraSessionTaskConstraints__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 32))
  {
    PLCameraTaskConstraintsGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_FAULT, "%{public}@: deactivate camera session with no active transaction", (uint8_t *)&v15, 0xCu);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(v2 + 80);
  PLCameraTaskConstraintsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 2)
  {
    v8 = 2.0;
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v9;
      v17 = 2048;
      v18 = 0x4000000000000000;
      v10 = "%{public}@: deactivating camera session task constraints after %1.1f delay";
      v11 = v6;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    v8 = 0.0;
    if (v7)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v13;
      v10 = "%{public}@: deactivating camera session task constraints";
      v11 = v6;
      v12 = 12;
      goto LABEL_10;
    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "_deactivateCameraSessionTaskConstraintsAfterDelay:", v8);
}

void __68__PLCameraCaptureTaskConstraintCoordinator_sessionStatusDescription__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v2 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = CFSTR("active");

  }
}

+ (BOOL)_shouldUseFailsafeTimerForRole:(int64_t)a3
{
  return a3 == 2;
}

+ (BOOL)_shouldWatchCameraViewfinderForRole:(int64_t)a3
{
  return a3 == 2;
}

+ (id)taskConstraintStatus
{
  void *v2;
  void *v3;

  +[PLCameraCaptureTaskConstraints sharedTaskConstraints](PLCameraCaptureTaskConstraints, "sharedTaskConstraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskConstraintStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
