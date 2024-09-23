@implementation PXContentSyndicationConfigurationProvider

- (void)_invalidateDataSourceManager
{
  void *v3;

  -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:context:", self, PXContentSyndicationConfigurationProviderDataSourceObservationContext);

  -[PXContentSyndicationConfigurationProvider setSyndicationItemsDataSourceManager:](self, "setSyndicationItemsDataSourceManager:", 0);
}

uint64_t __80__PXContentSyndicationConfigurationProvider__markDataSourceManagerAsReadyToLoad__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSourceManager");
  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceManagerIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

- (void)_createDataSourceManagerIfNeeded
{
  void *v3;
  void *v4;
  PXContentSyndicationEmptyDataSourceManager *v5;
  NSObject *v6;
  PXContentSyndicationEmptyDataSourceManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXContentSyndicationConfigurationProvider readyToLoadActualDataSourceManager](self, "readyToLoadActualDataSourceManager"))
    {
      -[PXContentSyndicationConfigurationProvider _dataSourceManagerForDataSourceType:](self, "_dataSourceManagerForDataSourceType:", -[PXContentSyndicationConfigurationProvider dataSourceType](self, "dataSourceType"));
      v5 = (PXContentSyndicationEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLSyndicationUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Not yet ready to load the real data source manager, so loading an empty one instead.", (uint8_t *)&v18, 2u);
      }

      v5 = objc_alloc_init(PXContentSyndicationEmptyDataSourceManager);
    }
    v7 = v5;
    -[PXContentSyndicationConfigurationProvider setSyndicationItemsDataSourceManager:](self, "setSyndicationItemsDataSourceManager:", v5);

    -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", self, PXContentSyndicationConfigurationProviderDataSourceObservationContext);

    v9 = objc_opt_class();
    -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();

    if (v9 != v11)
    {
      PLSyndicationUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentSyndicationConfigurationProvider syndicationItemsDataSourceManager](self, "syndicationItemsDataSourceManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v14;
        v20 = 2114;
        v21 = v17;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Content syndication data source manager changed from %{public}@ to %{public}@", (uint8_t *)&v18, 0x16u);

      }
      -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 2);
    }

  }
}

- (PXContentSyndicationDataSourceManager)syndicationItemsDataSourceManager
{
  return self->_syndicationItemsDataSourceManager;
}

- (void)setSyndicationItemsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationItemsDataSourceManager, a3);
}

- (BOOL)readyToLoadActualDataSourceManager
{
  return self->_readyToLoadActualDataSourceManager;
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

uint64_t __62__PXContentSyndicationConfigurationProvider__updateEverything__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateContentSyndicationAvailability");
  objc_msgSend(*(id *)(a1 + 32), "_updateDataSourceType");
  objc_msgSend(*(id *)(a1 + 32), "_createDataSourceManagerIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_updateShowUnsavedSyndicatedContentInPhotosGrids");
  objc_msgSend(*(id *)(a1 + 32), "_updateShowUnsavedSyndicatedContentInMemories");
  objc_msgSend(*(id *)(a1 + 32), "_updateShowUnsavedSyndicatedContentInFeaturedPhotos");
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

- (void)setShowUnsavedSyndicatedContentInPhotosGrids:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInPhotosGrids != a3)
  {
    self->_showUnsavedSyndicatedContentInPhotosGrids = a3;
    -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 4);
  }
}

- (void)setShowUnsavedSyndicatedContentInMemories:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInMemories != a3)
  {
    self->_showUnsavedSyndicatedContentInMemories = a3;
    -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 8);
  }
}

- (void)setShowUnsavedSyndicatedContentInFeaturedPhotos:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInFeaturedPhotos != a3)
  {
    self->_showUnsavedSyndicatedContentInFeaturedPhotos = a3;
    -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 16);
  }
}

- (void)setContentSyndicationIsAvailable:(BOOL)a3
{
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_contentSyndicationIsAvailable != a3)
  {
    self->_contentSyndicationIsAvailable = a3;
    PLSyndicationUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_contentSyndicationIsAvailable)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = v5;
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Content syndication availability changed to %{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[PXContentSyndicationConfigurationProvider _invalidateDataSourceManager](self, "_invalidateDataSourceManager");
    -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 1);
  }
}

- (void)_updateShowUnsavedSyndicatedContentInPhotosGrids
{
  PHPhotoLibrary *photoLibrary;
  void *v4;
  void *v5;
  uint64_t v6;

  photoLibrary = self->_photoLibrary;
  -[PXContentSyndicationConfigurationProvider testingOverride_contentSyndicationEnabled](self, "testingOverride_contentSyndicationEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_isContentSyndicationAvailable(photoLibrary, v4))
  {
    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showSyndicatedContentInLibrary");

  }
  else
  {
    v6 = 0;
  }

  -[PXContentSyndicationConfigurationProvider setShowUnsavedSyndicatedContentInPhotosGrids:](self, "setShowUnsavedSyndicatedContentInPhotosGrids:", v6);
}

- (void)_updateShowUnsavedSyndicatedContentInMemories
{
  PHPhotoLibrary *photoLibrary;
  void *v4;
  uint64_t isContentSyndicationAvailable;

  photoLibrary = self->_photoLibrary;
  -[PXContentSyndicationConfigurationProvider testingOverride_contentSyndicationEnabled](self, "testingOverride_contentSyndicationEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  -[PXContentSyndicationConfigurationProvider setShowUnsavedSyndicatedContentInMemories:](self, "setShowUnsavedSyndicatedContentInMemories:", isContentSyndicationAvailable);
}

- (void)_updateShowUnsavedSyndicatedContentInFeaturedPhotos
{
  PHPhotoLibrary *photoLibrary;
  void *v4;
  uint64_t isContentSyndicationAvailable;

  photoLibrary = self->_photoLibrary;
  -[PXContentSyndicationConfigurationProvider testingOverride_contentSyndicationEnabled](self, "testingOverride_contentSyndicationEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  -[PXContentSyndicationConfigurationProvider setShowUnsavedSyndicatedContentInFeaturedPhotos:](self, "setShowUnsavedSyndicatedContentInFeaturedPhotos:", isContentSyndicationAvailable);
}

- (void)_updateDataSourceType
{
  void *v3;
  uint64_t v4;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataSourceType");

  if (v4 != -[PXContentSyndicationConfigurationProvider dataSourceType](self, "dataSourceType"))
  {
    -[PXContentSyndicationConfigurationProvider _invalidateDataSourceManager](self, "_invalidateDataSourceManager");
    -[PXContentSyndicationConfigurationProvider setDataSourceType:](self, "setDataSourceType:", v4);
    -[PXContentSyndicationConfigurationProvider _createDataSourceManagerIfNeeded](self, "_createDataSourceManagerIfNeeded");
  }
}

- (void)_updateContentSyndicationAvailability
{
  PHPhotoLibrary *photoLibrary;
  void *v4;
  uint64_t isContentSyndicationAvailable;

  photoLibrary = self->_photoLibrary;
  -[PXContentSyndicationConfigurationProvider testingOverride_contentSyndicationEnabled](self, "testingOverride_contentSyndicationEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  -[PXContentSyndicationConfigurationProvider setContentSyndicationIsAvailable:](self, "setContentSyndicationIsAvailable:", isContentSyndicationAvailable);
}

- (id)_dataSourceManagerForDataSourceType:(int64_t)a3
{
  PHPhotoLibrary *photoLibrary;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  PXContentSyndicationPhotoKitDataSourceManager *v10;
  void *v11;
  PXContentSyndicationEmptyDataSourceManager *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  __objc2_class *v18;
  __int16 v20;
  uint8_t v21[2];
  uint8_t v22[16];
  uint8_t buf[16];

  photoLibrary = self->_photoLibrary;
  -[PXContentSyndicationConfigurationProvider testingOverride_contentSyndicationEnabled](self, "testingOverride_contentSyndicationEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(photoLibrary) = _isContentSyndicationAvailable(photoLibrary, v6);

  if ((_DWORD)photoLibrary)
  {
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
        -[PXContentSyndicationConfigurationProvider syndicationPhotoLibrary](self, "syndicationPhotoLibrary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        PLSyndicationUIGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        if (!v7)
        {
          if (v9)
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library wasn't loaded in the background loading directly with data source manager instantiation.", v22, 2u);
          }

          v18 = PXContentSyndicationPhotoKitDataSourceManager;
          goto LABEL_16;
        }
        if (v9)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Using already-created syndication photo library instance for data source manager.", buf, 2u);
        }

        v10 = [PXContentSyndicationPhotoKitDataSourceManager alloc];
        -[PXContentSyndicationConfigurationProvider syndicationPhotoLibrary](self, "syndicationPhotoLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PXContentSyndicationPhotoKitDataSourceManager initWithPhotoLibrary:](v10, "initWithPhotoLibrary:", v11);

        if (!v12)
          goto LABEL_17;
        return v12;
      case 1:
      case 2:
      case 3:
        v18 = PXContentSyndicationMockSingleAssetsDataSourceManager;
        goto LABEL_16;
      case 6:
        v18 = PXContentSyndicationMockCMMDataSourceManager;
        goto LABEL_16;
      case 7:
        v18 = PXContentSyndicationMockSharedAlbumsDataSourceManager;
LABEL_16:
        v12 = (PXContentSyndicationEmptyDataSourceManager *)objc_alloc_init(v18);
        if (!v12)
          goto LABEL_17;
        return v12;
      default:
LABEL_17:
        PLSyndicationUIGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_WORD *)v21 = 0;
        v14 = "ContentSyndicationConfiguration: Data Source Manager could not be created, falling back to empty data sour"
              "ce manager. The syndication library may not exist, or could not be opened.";
        v15 = v21;
        v16 = v13;
        v17 = OS_LOG_TYPE_ERROR;
        break;
    }
    goto LABEL_19;
  }
  PLSyndicationUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 0;
    v14 = "ContentSyndicationConfiguration: Using empty data source manager, as content syndication is not available.";
    v15 = (uint8_t *)&v20;
    v16 = v13;
    v17 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
    _os_log_impl(&dword_1A6789000, v16, v17, v14, v15, 2u);
  }
LABEL_20:

  v12 = objc_alloc_init(PXContentSyndicationEmptyDataSourceManager);
  return v12;
}

- (NSNumber)testingOverride_contentSyndicationEnabled
{
  return self->_testingOverride_contentSyndicationEnabled;
}

- (void)_updateShowContentSyndicationItemInSidebar
{
  if (-[PXContentSyndicationConfigurationProvider showContentSyndicationItemInSidebar](self, "showContentSyndicationItemInSidebar"))
  {
    -[PXContentSyndicationConfigurationProvider setShowContentSyndicationItemInSidebar:](self, "setShowContentSyndicationItemInSidebar:", 0);
    -[PXContentSyndicationConfigurationProvider signalChange:](self, "signalChange:", 32);
  }
}

- (BOOL)showContentSyndicationItemInSidebar
{
  return self->_showContentSyndicationItemInSidebar;
}

- (BOOL)showUnsavedSyndicatedContentInPhotosGrids
{
  return self->_showUnsavedSyndicatedContentInPhotosGrids;
}

+ (PXContentSyndicationConfigurationProvider)sharedInstance
{
  if (sharedInstance_onceToken_238993 != -1)
    dispatch_once(&sharedInstance_onceToken_238993, &__block_literal_global_238994);
  return (PXContentSyndicationConfigurationProvider *)(id)sharedInstance_provider;
}

+ (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProviderWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  PXContentSyndicationConfigurationProvider *v8;
  NSObject *v9;
  const char *v10;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  PXContentSyndicationConfigurationProvider *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXContentSyndicationConfigurationProvider.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)&contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTableLock);
  v4 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
  if (!contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
    contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable = v5;

    v4 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (PXContentSyndicationConfigurationProvider *)v7;
    PLSyndicationUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2048;
      v17 = v8;
      v10 = "%@ Reusing existing content syndication configuration provider: %p";
LABEL_10:
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 0x16u);
    }
  }
  else
  {
    v8 = -[PXContentSyndicationConfigurationProvider initWithPhotoLibrary:]([PXContentSyndicationConfigurationProvider alloc], "initWithPhotoLibrary:", v3);
    objc_msgSend((id)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable, "setObject:forKey:", v8, v3);
    PLSyndicationUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2048;
      v17 = v8;
      v10 = "%@ Creating new content syndication configuration provider: %p";
      goto LABEL_10;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTableLock);
  return v8;
}

- (PXContentSyndicationConfigurationProvider)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXContentSyndicationConfigurationProvider *v7;
  PXContentSyndicationConfigurationProvider *v8;
  void *v9;
  PXLibraryFilterState *v10;
  PXLibraryFilterState *libraryFilterState;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v19;
  _QWORD block[4];
  PXContentSyndicationConfigurationProvider *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location[2];
  objc_super v26;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationConfigurationProvider.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v26.receiver = self;
  v26.super_class = (Class)PXContentSyndicationConfigurationProvider;
  v7 = -[PXContentSyndicationConfigurationProvider init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v8->_photoLibrary);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v9);
    libraryFilterState = v8->_libraryFilterState;
    v8->_libraryFilterState = v10;

    +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addDeferredKeyObserver:", v8);
    if (_isContentSyndicationPossible())
    {
      objc_initWeak(location, v8);
      +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke;
      v23[3] = &unk_1E5148D30;
      objc_copyWeak(&v24, location);
      objc_msgSend(v13, "scheduleTaskWithQoS:block:", 0, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak(location);
    }
    -[PXLibraryFilterState registerChangeObserver:context:](v8->_libraryFilterState, "registerChangeObserver:context:", v8, PXLibraryFilterStateObservationContext_238917);
    if ((objc_msgSend(v12, "delayLoadingActualDataSourceUntilAfterLaunch") & 1) == 0)
      v8->_readyToLoadActualDataSourceManager = 1;
    -[PXContentSyndicationConfigurationProvider _updateEverything](v8, "_updateEverything");
    if (-[PXContentSyndicationConfigurationProvider contentSyndicationIsAvailable](v8, "contentSyndicationIsAvailable")
      && objc_msgSend(v12, "delayLoadingActualDataSourceUntilAfterLaunch"))
    {
      PLSyndicationUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Beginning delayed load of real data source manager. Loading syndication photo library in background thread.", (uint8_t *)location, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(25, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_143;
      block[3] = &unk_1E5148D08;
      v21 = v8;
      v22 = v15;
      v17 = v15;
      dispatch_async(v16, block);

    }
    else
    {
      -[PXContentSyndicationConfigurationProvider _markDataSourceManagerAsReadyToLoad](v8, "_markDataSourceManagerAsReadyToLoad");
    }

  }
  return v8;
}

- (BOOL)contentSyndicationIsAvailable
{
  return self->_contentSyndicationIsAvailable;
}

- (void)_updateEverything
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__PXContentSyndicationConfigurationProvider__updateEverything__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v2);
}

- (void)_markDataSourceManagerAsReadyToLoad
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  PLSyndicationUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Loading real data source manager.", buf, 2u);
  }

  if (!self->_readyToLoadActualDataSourceManager)
  {
    self->_readyToLoadActualDataSourceManager = 1;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __80__PXContentSyndicationConfigurationProvider__markDataSourceManagerAsReadyToLoad__block_invoke;
    v4[3] = &unk_1E51479C8;
    v4[4] = self;
    -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v4);
  }
}

void __59__PXContentSyndicationConfigurationProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_provider;
  sharedInstance_provider = v0;

}

void __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_initializeSocialHighlightCenter");

}

- (void)setTestingOverride_contentSyndicationEnabled:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  char v7;
  NSNumber *v8;

  v8 = (NSNumber *)a3;
  v5 = self->_testingOverride_contentSyndicationEnabled;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSNumber isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_testingOverride_contentSyndicationEnabled, a3);
      -[PXContentSyndicationConfigurationProvider _updateEverything](self, "_updateEverything");
    }
  }

}

- (PXContentSyndicationConfigurationProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationConfigurationProvider.m"), 207, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationConfigurationProvider init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationConfigurationProvider;
  -[PXContentSyndicationConfigurationProvider dealloc](&v4, sel_dealloc);
}

- (void)_initializeSocialHighlightCenter
{
  PXContentSyndicationHighlightCenter *v3;
  PXContentSyndicationHighlightCenter *socialLayerHighlightCenter;

  +[PXContentSyndicationHighlightCenter shared](PXContentSyndicationHighlightCenter, "shared");
  v3 = (PXContentSyndicationHighlightCenter *)objc_claimAutoreleasedReturnValue();
  socialLayerHighlightCenter = self->_socialLayerHighlightCenter;
  self->_socialLayerHighlightCenter = v3;

  -[PXContentSyndicationHighlightCenter registerObserver:](self->_socialLayerHighlightCenter, "registerObserver:", self);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  PXContentSyndicationConfigurationProvider *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  PXContentSyndicationConfigurationProvider *v25;

  v5 = a4;
  NSStringFromSelector(sel_contentSyndicationEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
    goto LABEL_6;
  NSStringFromSelector(sel_showSyndicatedContentInLibrary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  NSStringFromSelector(sel_ignoreSocialLayerEnablement);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v8))
  {

    goto LABEL_5;
  }
  NSStringFromSelector(sel_showContentSyndicationInSystemPhotoLibraryOnly);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    NSStringFromSelector(sel_dataSourceType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqualToString:", v11);

    if (v12)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke;
      v24 = &unk_1E51479C8;
      v25 = self;
      v13 = &v21;
    }
    else
    {
      NSStringFromSelector(sel_showSidebarItemEvenIfNoSyndicatedContentAvailable);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v5, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_8;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke_2;
      v19 = &unk_1E51479C8;
      v20 = self;
      v13 = &v16;
    }
    -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v13, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_8;
  }
LABEL_7:
  -[PXContentSyndicationConfigurationProvider _updateEverything](self, "_updateEverything");
LABEL_8:

}

- (void)contentSyndicationHighlightCenterDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PLSyndicationUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: SLHighlightCenter reports that Shared with You enablement has changed.", v5, 2u);
  }

  -[PXContentSyndicationConfigurationProvider _updateEverything](self, "_updateEverything");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v9 = a3;
  if ((void *)PXContentSyndicationConfigurationProviderDataSourceObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v14 = MEMORY[0x1E0C809B0];
      v10 = __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke;
      v11 = &v14;
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_238917 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationConfigurationProvider.m"), 607, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v10 = __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke_2;
      v11 = &v13;
LABEL_7:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E51479C8;
      v11[4] = (uint64_t)self;
      -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v13);
    }
  }

}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (BOOL)showUnsavedSyndicatedContentInMemories
{
  return self->_showUnsavedSyndicatedContentInMemories;
}

- (BOOL)showUnsavedSyndicatedContentInFeaturedPhotos
{
  return self->_showUnsavedSyndicatedContentInFeaturedPhotos;
}

- (void)setShowContentSyndicationItemInSidebar:(BOOL)a3
{
  self->_showContentSyndicationItemInSidebar = a3;
}

- (void)setReadyToLoadActualDataSourceManager:(BOOL)a3
{
  self->_readyToLoadActualDataSourceManager = a3;
}

- (PHPhotoLibrary)syndicationPhotoLibrary
{
  return self->_syndicationPhotoLibrary;
}

- (void)setSyndicationPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (int)systemLibraryChangeToken
{
  return self->_systemLibraryChangeToken;
}

- (void)setSystemLibraryChangeToken:(int)a3
{
  self->_systemLibraryChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverride_contentSyndicationEnabled, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_syndicationItemsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlightCenter, 0);
}

uint64_t __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

uint64_t __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

uint64_t __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateDataSourceType");
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

uint64_t __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateShowContentSyndicationItemInSidebar");
}

void __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_143(uint64_t a1)
{
  unint64_t v2;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  int v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "dataSourceType");
  if (v2 > 5 || ((1 << v2) & 0x31) == 0)
  {
    PLSyndicationUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library loading not needed. Must be using a mock/internal data source type. Dispatching to main.", buf, 2u);
    }
    v21 = 0;
  }
  else
  {
    PLSyndicationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v7;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXContentSyndicationConfigurationProvider.syndicationLibraryLoad", ", buf, 2u);
    }

    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = COERCE_DOUBLE(v25);
    objc_msgSend(*(id *)(a1 + 32), "setSyndicationPhotoLibrary:", v9);

    objc_msgSend(*(id *)(a1 + 32), "syndicationPhotoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      PLSyndicationUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "ContentSyndicationConfiguration: Unable to open syndication library: %@", buf, 0xCu);
      }

    }
    v13 = v8;
    v14 = v13;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_END, v5, "PXContentSyndicationConfigurationProvider.syndicationLibraryLoad", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v6);
    v17 = v16;
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v19 = v18;
    PLSyndicationUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v27 = v17 * 1000.0;
      v28 = 2048;
      v29 = v19 * 1000.0;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library took %.2fms to load, total time %.2fms. Dispatching to main.", buf, 0x16u);
    }

    v21 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "syndicationPhotoLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21 || v22)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_144;
    v23[3] = &unk_1E5149198;
    v24 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
}

uint64_t __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_markDataSourceManagerAsReadyToLoad");
}

+ (void)preloadResourcesForPhotoLibrary:(id)a3
{
  id v3;

  v3 = a3;
  if (_isContentSyndicationPossible())
    _isContentSyndicationAvailable(v3, 0);

}

@end
