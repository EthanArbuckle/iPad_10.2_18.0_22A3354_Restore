@implementation PXSharedLibraryStatusProvider

- (BOOL)hasSharedLibraryOrPreview
{
  return self->_hasPreview || self->_hasSharedLibrary;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

+ (PXSharedLibraryStatusProvider)sharedLibraryStatusProviderWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  PXSharedLibraryStatusProvider *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  int IsLaunchedToExecuteTests;
  uint64_t v13;
  uint64_t v14;
  int AppBooleanValue;
  BOOL v16;
  int v17;
  BOOL v18;
  int v20;
  id v21;
  __int16 v22;
  PXSharedLibraryStatusProvider *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTableLock);
    v4 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
    if (!sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
      sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable = v5;

      v4 = (void *)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (PXSharedLibraryStatusProvider *)v7;
      PLSharedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_27:

        os_unfair_lock_unlock((os_unfair_lock_t)&sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTableLock);
        goto LABEL_28;
      }
      v20 = 138412546;
      v21 = v3;
      v22 = 2048;
      v23 = v8;
      v10 = "%@ Reusing existing shared library status provider: %p";
    }
    else
    {
      IsLaunchedToExecuteTests = PFProcessIsLaunchedToExecuteTests();
      if ((IsLaunchedToExecuteTests & 1) != 0)
      {
        v13 = 0;
        v14 = 0;
      }
      else
      {
        LOBYTE(v20) = 0;
        AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("LastKnownHasSharedLibraryPreview"), CFSTR("com.apple.mobileslideshow"), (Boolean *)&v20);
        if ((_BYTE)v20)
          v16 = AppBooleanValue == 0;
        else
          v16 = 1;
        v13 = !v16;
        LOBYTE(v20) = 0;
        v17 = CFPreferencesGetAppBooleanValue(CFSTR("LastKnownHasSharedLibrary"), CFSTR("com.apple.mobileslideshow"), (Boolean *)&v20);
        if ((_BYTE)v20)
          v18 = v17 == 0;
        else
          v18 = 1;
        v14 = !v18;
      }
      v8 = -[PXSharedLibraryStatusProvider initWithPhotoLibrary:deferInitialization:initialHasPreview:initialHasSharedLibrary:]([PXSharedLibraryStatusProvider alloc], "initWithPhotoLibrary:deferInitialization:initialHasPreview:initialHasSharedLibrary:", v3, IsLaunchedToExecuteTests ^ 1u, v13, v14);
      objc_msgSend((id)sharedLibraryStatusProviderWithPhotoLibrary___statusProvidersMapTable, "setObject:forKey:", v8, v3);
      PLSharedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
      v20 = 138412546;
      v21 = v3;
      v22 = 2048;
      v23 = v8;
      v10 = "%@ Creating new shared library status provider: %p";
    }
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v20, 0x16u);
    goto LABEL_27;
  }
  PLSharedLibraryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_FAULT, "+[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:] called without a photo library", (uint8_t *)&v20, 2u);
  }

  v8 = 0;
LABEL_28:

  return v8;
}

- (PXSharedLibraryStatusProvider)initWithPhotoLibrary:(id)a3 deferInitialization:(BOOL)a4 initialHasPreview:(BOOL)a5 initialHasSharedLibrary:(BOOL)a6
{
  _BOOL4 v8;
  id v12;
  PXSharedLibraryStatusProvider *v13;
  PXSharedLibraryStatusProvider *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v8 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v23.receiver = self;
  v23.super_class = (Class)PXSharedLibraryStatusProvider;
  v13 = -[PXSharedLibraryStatusProvider init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_deferredInitializationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_photoLibrary, a3);
    v14->_hasPreview = a5;
    v14->_hasSharedLibrary = a6;
    if (v8)
    {
      PLSharedLibraryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PXSharedLibraryStatusProvider _statusDescription](v14, "_statusDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider deferring initialization... (%{public}@)", buf, 0xCu);

      }
      objc_initWeak((id *)buf, v14);
      +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __116__PXSharedLibraryStatusProvider_initWithPhotoLibrary_deferInitialization_initialHasPreview_initialHasSharedLibrary___block_invoke;
      v21[3] = &unk_1E5148D30;
      objc_copyWeak(&v22, (id *)buf);
      objc_msgSend(v17, "scheduleMainQueueTask:", v21);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14->_isInitialized = 1;
      -[PXSharedLibraryStatusProvider _initializeDataSourceManagers](v14, "_initializeDataSourceManagers");
    }
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addDeferredKeyObserver:", v14);

  }
  return v14;
}

- (id)_statusDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Invitation: %d, Preview: %d, Shared Library: %d, Exiting: %d>"), self->_invitation != 0, self->_hasPreview, self->_hasSharedLibrary, self->_exiting != 0);
}

- (BOOL)hasSharedLibrary
{
  return self->_hasSharedLibrary;
}

- (BOOL)hasPreview
{
  return self->_hasPreview;
}

void __116__PXSharedLibraryStatusProvider_initWithPhotoLibrary_deferInitialization_initialHasPreview_initialHasSharedLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performDeferredInitializationIfNecessary");

}

- (void)_updateSharedLibraryWithChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  _OWORD v10[2];

  v3 = a3;
  -[PXSectionedDataSourceManager dataSource](self->_sharedLibraryDataSourceManager, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAnyItems"))
  {
    if (v5)
      objc_msgSend(v5, "firstItemIndexPath");
    else
      memset(v10, 0, sizeof(v10));
    objc_msgSend(v5, "sharedLibraryAtItemIndexPath:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PXSharedLibraryStatusProvider__updateSharedLibraryWithChangeNotification___block_invoke;
    v7[3] = &unk_1E512A710;
    v8 = v6;
    v9 = v6 != 0;
    -[PXSharedLibraryStatusProvider performChanges:](self, "performChanges:", v7);

  }
  else
  {
    objc_storeStrong((id *)&self->_sharedLibrary, v6);
    self->_hasSharedLibrary = v6 != 0;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
      PXPreferencesSetInteger(CFSTR("LastKnownHasSharedLibrary"), self->_hasSharedLibrary);
  }

}

- (void)_updatePreviewWithChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  _OWORD v10[2];

  v3 = a3;
  -[PXSectionedDataSourceManager dataSource](self->_previewDataSourceManager, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAnyItems"))
  {
    if (v5)
      objc_msgSend(v5, "firstItemIndexPath");
    else
      memset(v10, 0, sizeof(v10));
    objc_msgSend(v5, "sharedLibraryAtItemIndexPath:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PXSharedLibraryStatusProvider__updatePreviewWithChangeNotification___block_invoke;
    v7[3] = &unk_1E512A710;
    v8 = v6;
    v9 = v6 != 0;
    -[PXSharedLibraryStatusProvider performChanges:](self, "performChanges:", v7);

  }
  else
  {
    objc_storeStrong((id *)&self->_preview, v6);
    self->_hasPreview = v6 != 0;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
      PXPreferencesSetInteger(CFSTR("LastKnownHasSharedLibraryPreview"), self->_hasPreview);
  }

}

- (void)_updateInvitationWithChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  PXSharedLibrary *v8;
  PXSharedLibrary *invitation;
  id v10;
  char v11;
  _QWORD v12[4];
  PXSharedLibrary *v13;
  _OWORD v14[2];

  v3 = a3;
  -[PXSharedLibrary identifier](self->_invitation, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager dataSource](self->_invitationsDataSourceManager, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsAnyItems"))
  {
    if (v6)
      objc_msgSend(v6, "firstItemIndexPath");
    else
      memset(v14, 0, sizeof(v14));
    objc_msgSend(v6, "sharedLibraryAtItemIndexPath:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_8;
LABEL_5:
    v8 = v7;
    invitation = self->_invitation;
    self->_invitation = v8;
    goto LABEL_9;
  }
  v7 = 0;
  if (!v3)
    goto LABEL_5;
LABEL_8:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PXSharedLibraryStatusProvider__updateInvitationWithChangeNotification___block_invoke;
  v12[3] = &unk_1E512A6E8;
  v13 = v7;
  -[PXSharedLibraryStatusProvider performChanges:](self, "performChanges:", v12);
  invitation = v13;
LABEL_9:

  -[PXSharedLibrary identifier](self->_invitation, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v10)
  {

  }
  else
  {
    v11 = objc_msgSend(v5, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
      -[PXSharedLibraryStatusProvider _updateInvitationReceivedDateWithIdentifier:](self, "_updateInvitationReceivedDateWithIdentifier:", v10);
  }

}

- (void)_updateExitingWithChangeNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  PXSharedLibrary *v7;
  PXSharedLibrary *exiting;
  _QWORD v9[4];
  PXSharedLibrary *v10;
  _OWORD v11[2];

  v3 = a3;
  -[PXSectionedDataSourceManager dataSource](self->_exitingDataSourceManager, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAnyItems"))
  {
    if (v5)
      objc_msgSend(v5, "firstItemIndexPath");
    else
      memset(v11, 0, sizeof(v11));
    objc_msgSend(v5, "sharedLibraryAtItemIndexPath:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if (v3)
    {
LABEL_8:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __70__PXSharedLibraryStatusProvider__updateExitingWithChangeNotification___block_invoke;
      v9[3] = &unk_1E512A6E8;
      v10 = v6;
      -[PXSharedLibraryStatusProvider performChanges:](self, "performChanges:", v9);
      exiting = v10;
      goto LABEL_9;
    }
  }
  v7 = v6;
  exiting = self->_exiting;
  self->_exiting = v7;
LABEL_9:

}

- (void)_performDeferredInitializationIfNecessary
{
  os_unfair_lock_s *p_deferredInitializationLock;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_deferredInitializationLock = &self->_deferredInitializationLock;
  os_unfair_lock_lock(&self->_deferredInitializationLock);
  if (!self->_invitationsDataSourceManager)
  {
    -[PXSharedLibraryStatusProvider _initializeDataSourceManagers](self, "_initializeDataSourceManagers");
    PLSharedLibraryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider performed scheduled deferred initialization: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  os_unfair_lock_unlock(p_deferredInitializationLock);
}

- (void)_initializeDataSourceManagers
{
  -[PXSharedLibraryStatusProvider _configureInvitationDataSourceManager](self, "_configureInvitationDataSourceManager");
  -[PXSharedLibraryStatusProvider _configurePreviewDataSourceManager](self, "_configurePreviewDataSourceManager");
  -[PXSharedLibraryStatusProvider _configureSharedLibraryDataSourceManager](self, "_configureSharedLibraryDataSourceManager");
  -[PXSharedLibraryStatusProvider _configureExitingDataSourceManager](self, "_configureExitingDataSourceManager");
}

- (void)_configureSharedLibraryDataSourceManager
{
  void *v3;
  PXSharedLibraryDataSourceManager *v4;
  PXSharedLibraryDataSourceManager *sharedLibraryDataSourceManager;
  PXSharedLibraryDataSourceManager *v6;

  -[PXSharedLibraryStatusProvider photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryDataSourceManager currentSharedLibraryDataSourceManagerForPhotoLibrary:](PXSharedLibraryDataSourceManager, "currentSharedLibraryDataSourceManagerForPhotoLibrary:", v3);
  v4 = (PXSharedLibraryDataSourceManager *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_sharedLibraryDataSourceManager, "unregisterChangeObserver:context:", self, SharedLibraryObservationContext);
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  self->_sharedLibraryDataSourceManager = v4;
  v6 = v4;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_sharedLibraryDataSourceManager, "registerChangeObserver:context:", self, SharedLibraryObservationContext);
  -[PXSharedLibraryStatusProvider _updateSharedLibraryWithChangeNotification:](self, "_updateSharedLibraryWithChangeNotification:", 0);
}

- (void)_configurePreviewDataSourceManager
{
  void *v3;
  PXSharedLibraryDataSourceManager *v4;
  PXSharedLibraryDataSourceManager *previewDataSourceManager;
  PXSharedLibraryDataSourceManager *v6;

  -[PXSharedLibraryStatusProvider photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryDataSourceManager currentPreviewDataSourceManagerForPhotoLibrary:](PXSharedLibraryDataSourceManager, "currentPreviewDataSourceManagerForPhotoLibrary:", v3);
  v4 = (PXSharedLibraryDataSourceManager *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_previewDataSourceManager, "unregisterChangeObserver:context:", self, PreviewObservationContext);
  previewDataSourceManager = self->_previewDataSourceManager;
  self->_previewDataSourceManager = v4;
  v6 = v4;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_previewDataSourceManager, "registerChangeObserver:context:", self, PreviewObservationContext);
  -[PXSharedLibraryStatusProvider _updatePreviewWithChangeNotification:](self, "_updatePreviewWithChangeNotification:", 0);
}

- (void)_configureInvitationDataSourceManager
{
  void *v3;
  PXSharedLibraryDataSourceManager *v4;
  PXSharedLibraryDataSourceManager *invitationsDataSourceManager;
  PXSharedLibraryDataSourceManager *v6;
  _QWORD block[5];

  if (!self->_invitationsDataSourceManager && !-[PXSharedLibraryStatusProvider isInitialized](self, "isInitialized"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  -[PXSharedLibraryStatusProvider photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryDataSourceManager currentInvitationsDataSourceManagerForPhotoLibrary:](PXSharedLibraryDataSourceManager, "currentInvitationsDataSourceManagerForPhotoLibrary:", v3);
  v4 = (PXSharedLibraryDataSourceManager *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_invitationsDataSourceManager, "unregisterChangeObserver:context:", self, InvitationObservationContext);
  invitationsDataSourceManager = self->_invitationsDataSourceManager;
  self->_invitationsDataSourceManager = v4;
  v6 = v4;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_invitationsDataSourceManager, "registerChangeObserver:context:", self, InvitationObservationContext);
  -[PXSharedLibraryStatusProvider _updateInvitationWithChangeNotification:](self, "_updateInvitationWithChangeNotification:", 0);
}

- (void)_configureExitingDataSourceManager
{
  void *v3;
  PXSharedLibraryDataSourceManager *v4;
  PXSharedLibraryDataSourceManager *exitingDataSourceManager;
  PXSharedLibraryDataSourceManager *v6;

  -[PXSharedLibraryStatusProvider photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryDataSourceManager currentExitingDataSourceManagerForPhotoLibrary:](PXSharedLibraryDataSourceManager, "currentExitingDataSourceManagerForPhotoLibrary:", v3);
  v4 = (PXSharedLibraryDataSourceManager *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_exitingDataSourceManager, "unregisterChangeObserver:context:", self, ExitingObservationContext);
  exitingDataSourceManager = self->_exitingDataSourceManager;
  self->_exitingDataSourceManager = v4;
  v6 = v4;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_exitingDataSourceManager, "registerChangeObserver:context:", self, ExitingObservationContext);
  -[PXSharedLibraryStatusProvider _updateExitingWithChangeNotification:](self, "_updateExitingWithChangeNotification:", 0);
}

- (PXSharedLibrary)sharedLibraryOrPreview
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXSharedLibraryStatusProvider preview](self, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PXSharedLibraryStatusProvider sharedLibrary](self, "sharedLibrary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (PXSharedLibrary *)v6;
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  PXSharedLibraryDataSourceManager *sharedLibraryDataSourceManager;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  if (!sharedLibraryDataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sharedLibraryDataSourceManager"));

    sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  }
  -[PXSharedLibraryDataSourceManager fetchSharedLibraryForURL:completionHandler:](sharedLibraryDataSourceManager, "fetchSharedLibraryForURL:completionHandler:", v10, v7);

}

- (id)fetchPreview
{
  PXSharedLibraryDataSourceManager *previewDataSourceManager;
  void *v6;

  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  previewDataSourceManager = self->_previewDataSourceManager;
  if (!previewDataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_previewDataSourceManager"));

    previewDataSourceManager = self->_previewDataSourceManager;
  }
  return -[PXSharedLibraryDataSourceManager fetchPreview](previewDataSourceManager, "fetchPreview");
}

- (id)fetchSharedLibrary
{
  PXSharedLibraryDataSourceManager *sharedLibraryDataSourceManager;
  void *v6;

  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  if (!sharedLibraryDataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sharedLibraryDataSourceManager"));

    sharedLibraryDataSourceManager = self->_sharedLibraryDataSourceManager;
  }
  return -[PXSharedLibraryDataSourceManager fetchSharedLibrary](sharedLibraryDataSourceManager, "fetchSharedLibrary");
}

- (id)fetchExiting
{
  PXSharedLibraryDataSourceManager *exitingDataSourceManager;
  void *v6;

  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  exitingDataSourceManager = self->_exitingDataSourceManager;
  if (!exitingDataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_exitingDataSourceManager"));

    exitingDataSourceManager = self->_exitingDataSourceManager;
  }
  return -[PXSharedLibraryDataSourceManager fetchExiting](exitingDataSourceManager, "fetchExiting");
}

- (void)_updateInvitationReceivedDateWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    _PXPreferencesSharedLibraryInvitationDate(CFSTR("SharedLibraryInvitationReceivedDate"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      PLSharedLibraryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543362;
        v8 = v3;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Updating shared library invitation received date for library %{public}@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _PXPreferencesSetSharedLibraryInvitationDate(CFSTR("SharedLibraryInvitationReceivedDate"), v6, v3);

    }
  }

}

- (PXSharedLibraryStatusProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 315, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryStatusProvider init]");

  abort();
}

- (void)_fullfillDeferredInitializationIfNecessary
{
  os_unfair_lock_s *p_deferredInitializationLock;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_deferredInitializationLock = &self->_deferredInitializationLock;
  os_unfair_lock_lock(&self->_deferredInitializationLock);
  if (!self->_invitationsDataSourceManager)
  {
    -[PXSharedLibraryStatusProvider _initializeDataSourceManagers](self, "_initializeDataSourceManagers");
    PLSharedLibraryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryStatusProvider performed deferred initialization on-demand: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  os_unfair_lock_unlock(p_deferredInitializationLock);
}

- (PXSharedLibrary)invitation
{
  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  return self->_invitation;
}

- (PXSharedLibrary)preview
{
  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  return self->_preview;
}

- (PXSharedLibrary)sharedLibrary
{
  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  return self->_sharedLibrary;
}

- (PXSharedLibrary)exiting
{
  -[PXSharedLibraryStatusProvider _fullfillDeferredInitializationIfNecessary](self, "_fullfillDeferredInitializationIfNecessary");
  return self->_exiting;
}

- (void)setIsInitialized:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isInitialized != v3)
  {
    self->_isInitialized = v3;
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 64);
  }
}

- (void)setHasPreview:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_hasPreview != v3)
  {
    self->_hasPreview = v3;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
      PXPreferencesSetInteger(CFSTR("LastKnownHasSharedLibraryPreview"), self->_hasPreview);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 1);
  }
}

- (void)setHasSharedLibrary:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_hasSharedLibrary != v3)
  {
    self->_hasSharedLibrary = v3;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
      PXPreferencesSetInteger(CFSTR("LastKnownHasSharedLibrary"), self->_hasSharedLibrary);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 2);
  }
}

- (void)setInvitation:(id)a3
{
  PXSharedLibrary *v5;

  v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_invitation != v5)
  {
    objc_storeStrong((id *)&self->_invitation, a3);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 4);
  }

}

- (void)setPreview:(id)a3
{
  PXSharedLibrary *v5;

  v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_preview != v5)
  {
    objc_storeStrong((id *)&self->_preview, a3);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 8);
  }

}

- (void)setSharedLibrary:(id)a3
{
  PXSharedLibrary *v5;

  v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_sharedLibrary != v5)
  {
    objc_storeStrong((id *)&self->_sharedLibrary, a3);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 16);
  }

}

- (void)setExiting:(id)a3
{
  PXSharedLibrary *v5;

  v5 = (PXSharedLibrary *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_exiting != v5)
  {
    objc_storeStrong((id *)&self->_exiting, a3);
    -[PXSharedLibraryStatusProvider signalChange:](self, "signalChange:", 32);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((void *)InvitationObservationContext == a5)
  {
    -[PXSharedLibraryStatusProvider _updateInvitationWithChangeNotification:](self, "_updateInvitationWithChangeNotification:", 1);
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "PXSharedLibraryStatusProvider INVITATIONS did change: %{public}@";
      goto LABEL_13;
    }
  }
  else if ((void *)PreviewObservationContext == a5)
  {
    -[PXSharedLibraryStatusProvider _updatePreviewWithChangeNotification:](self, "_updatePreviewWithChangeNotification:", 1);
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "PXSharedLibraryStatusProvider PREVIEW did change: %{public}@";
      goto LABEL_13;
    }
  }
  else if ((void *)SharedLibraryObservationContext == a5)
  {
    -[PXSharedLibraryStatusProvider _updateSharedLibraryWithChangeNotification:](self, "_updateSharedLibraryWithChangeNotification:", 1);
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "PXSharedLibraryStatusProvider SHARED LIBRARY did change: %{public}@";
      goto LABEL_13;
    }
  }
  else
  {
    if ((void *)ExitingObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryStatusProvider.m"), 468, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSharedLibraryStatusProvider _updateExitingWithChangeNotification:](self, "_updateExitingWithChangeNotification:", 1);
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      v11 = "PXSharedLibraryStatusProvider EXITING did change: %{public}@";
LABEL_13:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);

    }
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentInvitationsDataSourceManager](PXSharedLibraryDataSourceManager, "keyPathsAffectingCurrentInvitationsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    -[PXSharedLibraryStatusProvider _configureInvitationDataSourceManager](self, "_configureInvitationDataSourceManager");
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      v10 = "PXSharedLibraryStatusProvider INVITATIONS MANAGER did change: %{public}@";
LABEL_13:
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentPreviewDataSourceManager](PXSharedLibraryDataSourceManager, "keyPathsAffectingCurrentPreviewDataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v5);

  if (v12)
  {
    -[PXSharedLibraryStatusProvider _configurePreviewDataSourceManager](self, "_configurePreviewDataSourceManager");
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      v10 = "PXSharedLibraryStatusProvider PREVIEW MANAGER did change: %{public}@";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentSharedLibraryDataSourceManager](PXSharedLibraryDataSourceManager, "keyPathsAffectingCurrentSharedLibraryDataSourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v5);

  if (v14)
  {
    -[PXSharedLibraryStatusProvider _configureSharedLibraryDataSourceManager](self, "_configureSharedLibraryDataSourceManager");
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      v10 = "PXSharedLibraryStatusProvider SHARED LIBRARY MANAGER did change: %{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  +[PXSharedLibraryDataSourceManager keyPathsAffectingCurrentExitingDataSourceManager](PXSharedLibraryDataSourceManager, "keyPathsAffectingCurrentExitingDataSourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v5);

  if (v16)
  {
    -[PXSharedLibraryStatusProvider _configureExitingDataSourceManager](self, "_configureExitingDataSourceManager");
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PXSharedLibraryStatusProvider _statusDescription](self, "_statusDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v9;
      v10 = "PXSharedLibraryStatusProvider EXITING MANAGER did change: %{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
LABEL_15:

}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_exiting, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_exitingDataSourceManager, 0);
  objc_storeStrong((id *)&self->_sharedLibraryDataSourceManager, 0);
  objc_storeStrong((id *)&self->_previewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_invitationsDataSourceManager, 0);
}

uint64_t __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke_2;
  v3[3] = &unk_1E51479C8;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __70__PXSharedLibraryStatusProvider__configureInvitationDataSourceManager__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsInitialized:", 1);
}

uint64_t __70__PXSharedLibraryStatusProvider__updateExitingWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setExiting:", *(_QWORD *)(a1 + 32));
}

void __76__PXSharedLibraryStatusProvider__updateSharedLibraryWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSharedLibrary:", v3);
  objc_msgSend(v4, "setHasSharedLibrary:", *(unsigned __int8 *)(a1 + 40));

}

void __70__PXSharedLibraryStatusProvider__updatePreviewWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPreview:", v3);
  objc_msgSend(v4, "setHasPreview:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __73__PXSharedLibraryStatusProvider__updateInvitationWithChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInvitation:", *(_QWORD *)(a1 + 32));
}

@end
