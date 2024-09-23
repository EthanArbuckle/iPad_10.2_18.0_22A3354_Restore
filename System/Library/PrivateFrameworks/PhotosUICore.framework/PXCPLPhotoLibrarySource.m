@implementation PXCPLPhotoLibrarySource

- (BOOL)isCloudPhotosEnabled
{
  return self->_isCloudPhotosEnabled;
}

- (PXCPLPhotoLibrarySource)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXCPLPhotoLibrarySource *v7;
  PXCPLPhotoLibrarySource *v8;
  void **p_photoLibrary;
  id v10;
  void *v11;
  uint64_t v12;
  PLCPLSettingsObserver *cplSettingsObserver;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v16;
  OS_dispatch_queue *serialQueue;
  NSObject *v18;
  dispatch_block_t v19;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id location;
  objc_super v26;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLPhotoLibrarySource.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v26.receiver = self;
  v26.super_class = (Class)PXCPLPhotoLibrarySource;
  v7 = -[PXCPLPhotoLibrarySource init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    p_photoLibrary = (void **)&v7->_photoLibrary;
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v10 = objc_alloc(MEMORY[0x1E0D715C8]);
    objc_msgSend(v6, "photoLibraryBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithLibraryBundle:", v11);
    cplSettingsObserver = v8->_cplSettingsObserver;
    v8->_cplSettingsObserver = (PLCPLSettingsObserver *)v12;

    -[PLCPLSettingsObserver setDelegate:](v8->_cplSettingsObserver, "setDelegate:", v8);
    v8->_isCloudPhotosEnabled = -[PLCPLSettingsObserver isCloudPhotoLibraryEnabled](v8->_cplSettingsObserver, "isCloudPhotoLibraryEnabled");
    v8->_isLocalModeEnabled = _IsLocalModeEnabled(*p_photoLibrary);
    v8->_percentCompletedForRebuild = -1;
    objc_msgSend(*p_photoLibrary, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isRebuildingThumbnails = objc_msgSend(MEMORY[0x1E0D71B80], "hasRebuildingThumbnailsIndicatorAndRebuildingWithPathManager:", v14);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_systemPhotoLibraryURLDidChange, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURLChangeNotificationName")), 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_localModeEnabledDidChange, (CFStringRef)*MEMORY[0x1E0D71D30], 0, (CFNotificationSuspensionBehavior)1024);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)_thumbnailRebuildDidStop, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0D72EA8]), 0, (CFNotificationSuspensionBehavior)1024);
    +[PXCPLPhotoLibrarySource sharedQueue](PXCPLPhotoLibrarySource, "sharedQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v16;

    objc_initWeak(&location, v8);
    v18 = v8->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXCPLPhotoLibrarySource_initWithPhotoLibrary___block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v24, &location);
    v23 = v6;
    v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(v18, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __48__PXCPLPhotoLibrarySource_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_subscribeToPostOpenProgressForPhotoLibrary:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_queue_resolveSettings");

}

void __77__PXCPLPhotoLibrarySource__queue_subscribeToPostOpenProgressForPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFractionCompletedForRebuild");

}

void __74__PXCPLPhotoLibrarySource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFractionCompletedForRebuild");

}

- (void)_queue_subscribeToPostOpenProgressForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  PXCPLPhotoLibrarySource *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLPhotoLibrarySource.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v5, "postOpenProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    PLUserStatusGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      v11 = "%{public}@ No post-open progress - bailing out";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  v8 = objc_msgSend(v6, "isFinished");
  PLUserStatusGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      v11 = "%{public}@ Post-open progress already finished - bailing out";
LABEL_9:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribing to post-open progress", buf, 0xCu);
  }

  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, _PostOpenProgressObservationContext);
  -[PXCPLPhotoLibrarySource setPostOpenProgress:](self, "setPostOpenProgress:", v7);
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXCPLPhotoLibrarySource__queue_subscribeToPostOpenProgressForPhotoLibrary___block_invoke;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_14:

}

- (void)setPostOpenProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)_updateFractionCompletedForRebuild
{
  void *v3;
  double v4;
  BOOL v5;
  float v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, double);
  void *v11;
  PXCPLPhotoLibrarySource *v12;
  float v13;
  uint8_t buf[4];
  PXCPLPhotoLibrarySource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PXCPLPhotoLibrarySource postOpenProgress](self, "postOpenProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  v5 = v4 >= 1.0 || v4 <= 0.0;
  v6 = v4;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__PXCPLPhotoLibrarySource__updateFractionCompletedForRebuild__block_invoke;
  v11 = &unk_1E51400E0;
  if (v5)
    v6 = -1.0;
  v12 = self;
  v13 = v6;
  -[PXCPLPhotoLibrarySource performChanges:](self, "performChanges:", &v8);
  if (objc_msgSend(v3, "isFinished", v8, v9, v10, v11))
  {
    PLUserStatusGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Post-open progress finished", buf, 0xCu);
    }

    -[PXCPLPhotoLibrarySource _removePostOpenProgressObserverIfNeeded](self, "_removePostOpenProgressObserverIfNeeded");
  }

}

- (NSProgress)postOpenProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 144, 1);
}

- (void)_removePostOpenProgressObserverIfNeeded
{
  void *v3;
  NSObject *v4;
  int v5;
  PXCPLPhotoLibrarySource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXCPLPhotoLibrarySource postOpenProgress](self, "postOpenProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLPhotoLibrarySource setPostOpenProgress:](self, "setPostOpenProgress:", 0);
  if (v3)
  {
    PLUserStatusGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribing from post-open progress", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), _PostOpenProgressObservationContext);
  }

}

uint64_t __61__PXCPLPhotoLibrarySource__updateFractionCompletedForRebuild__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setFractionCompletedForRebuild:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_logChanges");
}

- (void)setFractionCompletedForRebuild:(float)a3
{
  NSObject *v7;
  int64_t v8;
  uint64_t v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Fraction completed must be in the range of 0.0 through 1.0, or PXCPLProgressUnavailable - but is: %f", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = -1;
  v9 = vcvtps_s32_f32(a3 * 100.0);
  if (v9 >= 100)
    v9 = 100;
  if (a3 >= 0.0)
    v8 = v9;
  if (self->_percentCompletedForRebuild != v8)
  {
    self->_percentCompletedForRebuild = v8;
    -[PXCPLPhotoLibrarySource signalChange:](self, "signalChange:", 4);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[4];
  id v8;
  id location;

  if ((void *)_PostOpenProgressObservationContext == a6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXCPLPhotoLibrarySource_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLPhotoLibrarySource;
    -[PXCPLPhotoLibrarySource observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (PXCPLPhotoLibrarySource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLPhotoLibrarySource.m"), 68, CFSTR("%s is not available as initializer"), "-[PXCPLPhotoLibrarySource init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PXCPLPhotoLibrarySource _removePostOpenProgressObserverIfNeeded](self, "_removePostOpenProgressObserverIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PXCPLPhotoLibrarySource;
  -[PXCPLPhotoLibrarySource dealloc](&v3, sel_dealloc);
}

- (float)fractionCompletedForRebuild
{
  int64_t percentCompletedForRebuild;
  float result;

  percentCompletedForRebuild = self->_percentCompletedForRebuild;
  if (percentCompletedForRebuild < 0)
    return -1.0;
  result = (double)percentCompletedForRebuild / 100.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (void)setIsCloudPhotosEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isCloudPhotosEnabled != v3)
  {
    self->_isCloudPhotosEnabled = v3;
    -[PXCPLPhotoLibrarySource signalChange:](self, "signalChange:", 1);
  }
}

- (void)setIsLocalModeEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isLocalModeEnabled != v3)
  {
    self->_isLocalModeEnabled = v3;
    -[PXCPLPhotoLibrarySource signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsKeepOriginalsEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isKeepOriginalsEnabled != v3)
  {
    self->_isKeepOriginalsEnabled = v3;
    -[PXCPLPhotoLibrarySource signalChange:](self, "signalChange:", 16);
  }
}

- (void)setIsRebuildingThumbnails:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isRebuildingThumbnails != v3)
  {
    self->_isRebuildingThumbnails = v3;
    -[PXCPLPhotoLibrarySource signalChange:](self, "signalChange:", 8);
  }
}

- (void)_queue_resolveSettings
{
  void *v3;
  char v4;
  _QWORD block[4];
  id v6;
  char v7;
  id location;

  -[PLCPLSettingsObserver settings](self->_cplSettingsObserver, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isKeepOriginalsEnabled");

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PXCPLPhotoLibrarySource__queue_resolveSettings__block_invoke;
  block[3] = &unk_1E5145760;
  objc_copyWeak(&v6, &location);
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateIsCloudPhotosEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PXCPLPhotoLibrarySource__updateIsCloudPhotosEnabled___block_invoke;
  v5[3] = &unk_1E5142B28;
  v5[4] = self;
  v6 = a3;
  -[PXCPLPhotoLibrarySource performChanges:](self, "performChanges:", v5);
}

- (void)_updateIsLocalModeEnabled
{
  char IsLocalModeEnabled;
  _QWORD v4[5];
  char v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  IsLocalModeEnabled = _IsLocalModeEnabled(self->_photoLibrary);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PXCPLPhotoLibrarySource__updateIsLocalModeEnabled__block_invoke;
  v4[3] = &unk_1E5142B28;
  v4[4] = self;
  v5 = IsLocalModeEnabled;
  -[PXCPLPhotoLibrarySource performChanges:](self, "performChanges:", v4);
}

- (void)_updateIsKeepOriginalsEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PXCPLPhotoLibrarySource__updateIsKeepOriginalsEnabled___block_invoke;
  v5[3] = &unk_1E5142B28;
  v5[4] = self;
  v6 = a3;
  -[PXCPLPhotoLibrarySource performChanges:](self, "performChanges:", v5);
}

- (void)_updateIsRebuildingThumbnails
{
  _QWORD v3[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PXCPLPhotoLibrarySource__updateIsRebuildingThumbnails__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXCPLPhotoLibrarySource performChanges:](self, "performChanges:", v3);
}

- (void)_logChanges
{
  NSObject *v3;
  _BOOL4 isCloudPhotosEnabled;
  _BOOL4 isLocalModeEnabled;
  _BOOL4 isKeepOriginalsEnabled;
  void *v7;
  _BOOL4 isRebuildingThumbnails;
  int v9;
  PXCPLPhotoLibrarySource *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[PXCPLPhotoLibrarySource currentChanges](self, "currentChanges"))
  {
    PLUserStatusGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      isCloudPhotosEnabled = self->_isCloudPhotosEnabled;
      isLocalModeEnabled = self->_isLocalModeEnabled;
      isKeepOriginalsEnabled = self->_isKeepOriginalsEnabled;
      _DescriptionForPercentCompleted(self->_percentCompletedForRebuild);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isRebuildingThumbnails = self->_isRebuildingThumbnails;
      v9 = 138544642;
      v10 = self;
      v11 = 1024;
      v12 = isCloudPhotosEnabled;
      v13 = 1024;
      v14 = isLocalModeEnabled;
      v15 = 1024;
      v16 = isKeepOriginalsEnabled;
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = isRebuildingThumbnails;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ IsCloudPhotosEnabled: %d, IsLocalModeEnabled: %d, IsKeepOriginalsEnabled: %d, FractionCompletedForRebuild: %@, IsRebuildingThumbnails: %d (new)", (uint8_t *)&v9, 0x2Eu);

    }
  }
}

- (void)cplSettingsDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PXCPLPhotoLibrarySource_cplSettingsDidChange___block_invoke;
  v6[3] = &unk_1E5148D08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PLCPLSettingsObserver)cplSettingsObserver
{
  return self->_cplSettingsObserver;
}

- (BOOL)isLocalModeEnabled
{
  return self->_isLocalModeEnabled;
}

- (BOOL)isKeepOriginalsEnabled
{
  return self->_isKeepOriginalsEnabled;
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSharedQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postOpenProgress, 0);
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_cplSettingsObserver, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __48__PXCPLPhotoLibrarySource_cplSettingsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateIsCloudPhotosEnabled:", objc_msgSend(*(id *)(a1 + 40), "isCloudPhotoLibraryEnabled"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateIsKeepOriginalsEnabled:", objc_msgSend(v3, "isKeepOriginalsEnabled"));

}

uint64_t __56__PXCPLPhotoLibrarySource__updateIsRebuildingThumbnails__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsRebuildingThumbnails:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_logChanges");
}

uint64_t __57__PXCPLPhotoLibrarySource__updateIsKeepOriginalsEnabled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsKeepOriginalsEnabled:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_logChanges");
}

uint64_t __52__PXCPLPhotoLibrarySource__updateIsLocalModeEnabled__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsLocalModeEnabled:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_logChanges");
}

void __55__PXCPLPhotoLibrarySource__updateIsCloudPhotosEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setIsCloudPhotosEnabled:", *(unsigned __int8 *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "currentChanges"))
  {
    PLUserStatusGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(unsigned __int8 *)(v3 + 112);
      v5 = *(unsigned __int8 *)(v3 + 113);
      _DescriptionForPercentCompleted(*(_QWORD *)(v3 + 104));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 115);
      v8 = 138544386;
      v9 = v3;
      v10 = 1024;
      v11 = v4;
      v12 = 1024;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ IsCloudPhotosEnabled: %d (new), IsLocalModeEnabled: %d, FractionCompletedForRebuild: %@, IsRebuildingThumbnails: %d", (uint8_t *)&v8, 0x28u);

    }
  }
}

void __49__PXCPLPhotoLibrarySource__queue_resolveSettings__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIsKeepOriginalsEnabled:", *(unsigned __int8 *)(a1 + 40));

}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken_208183 != -1)
    dispatch_once(&sharedQueue_onceToken_208183, &__block_literal_global_208184);
  return (id)sharedQueue_sharedQueue_208185;
}

void __38__PXCPLPhotoLibrarySource_sharedQueue__block_invoke()
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

  v2 = dispatch_queue_create("com.apple.photos.PXCPLPhotoLibrarySource", attr);
  v3 = (void *)sharedQueue_sharedQueue_208185;
  sharedQueue_sharedQueue_208185 = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_129_208188);

}

void __38__PXCPLPhotoLibrarySource_sharedQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)sharedQueue_sharedQueue_208185);
}

@end
