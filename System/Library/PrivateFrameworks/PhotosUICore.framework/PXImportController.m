@implementation PXImportController

- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5
{
  return -[PXImportController initWithImportSource:photoLibrary:imageFormat:dateOrder:](self, "initWithImportSource:photoLibrary:imageFormat:dateOrder:", a3, a4, a5, 0);
}

- (PXImportController)initWithImportSource:(id)a3 photoLibrary:(id)a4 imageFormat:(unsigned __int16)a5 dateOrder:(int64_t)a6
{
  uint64_t v7;
  id v11;
  id v12;
  PXImportController *v13;
  PXImportController *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *sharedViewModelsById;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *sharedViewModelsUpdateQueue;
  void *v25;
  objc_class *v26;
  void *v27;
  id v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *otherDataSourceManagersQueue;
  PXImportAssetsDataSourceManager *v31;
  PXImportAssetsDataSourceManager *dataSourceManager;
  NSMutableSet *v33;
  NSMutableSet *otherDataSourceManagers;
  void *v35;
  uint64_t v36;
  PXSectionedSelectionManager *selectionManager;
  PXImportMediaProvider *v38;
  PXImportMediaProvider *importMediaProvider;
  uint64_t v40;
  PXPowerController *powerController;
  PXImportMediaLoadingCoordinator *v42;
  PXImportMediaLoadingCoordinator *mediaLoadingCoordinator;
  objc_super v45;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PXImportController;
  v13 = -[PXImportController init](&v45, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_dateOrder = a6;
    objc_storeStrong((id *)&v13->_importSource, a3);
    -[PHImportSource addImportSourceObserver:](v14->_importSource, "addImportSourceObserver:", v14);
    objc_storeStrong((id *)&v14->_photoLibrary, a4);
    v14->_imageFormat = v7;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedViewModelsById = v14->_sharedViewModelsById;
    v14->_sharedViewModelsById = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-sharedViewModelsUpdateQueue"), v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), v18);
    sharedViewModelsUpdateQueue = v14->_sharedViewModelsUpdateQueue;
    v14->_sharedViewModelsUpdateQueue = (OS_dispatch_queue *)v23;

    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@-otherDataSourceManagersQueue"), v27);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = dispatch_queue_create((const char *)objc_msgSend(v28, "UTF8String"), v18);
    otherDataSourceManagersQueue = v14->_otherDataSourceManagersQueue;
    v14->_otherDataSourceManagersQueue = (OS_dispatch_queue *)v29;

    v31 = -[PXImportAssetsDataSourceManager initWithDelegate:logIdentifier:]([PXImportAssetsDataSourceManager alloc], "initWithDelegate:logIdentifier:", v14, CFSTR("primary"));
    dataSourceManager = v14->_dataSourceManager;
    v14->_dataSourceManager = v31;

    v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    otherDataSourceManagers = v14->_otherDataSourceManagers;
    v14->_otherDataSourceManagers = v33;

    v14->_alreadyImportedItemsSelectable = 1;
    -[PXImportController createDataSourceManagerWithLogIdentifier:](v14, "createDataSourceManagerWithLogIdentifier:", CFSTR("selection"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDispatchesDataSourceUpdatesOnMainQueue:", 1);
    v36 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v35);
    selectionManager = v14->_selectionManager;
    v14->_selectionManager = (PXSectionedSelectionManager *)v36;

    -[PXSectionedSelectionManager registerChangeObserver:context:](v14->_selectionManager, "registerChangeObserver:context:", v14, PXImportControllerSelectionManagerObserverContext);
    v38 = -[PXImportMediaProvider initWithImageFormat:]([PXImportMediaProvider alloc], "initWithImageFormat:", v7);
    importMediaProvider = v14->_importMediaProvider;
    v14->_importMediaProvider = v38;

    +[PXPowerController sharedController](PXPowerController, "sharedController");
    v40 = objc_claimAutoreleasedReturnValue();
    powerController = v14->_powerController;
    v14->_powerController = (PXPowerController *)v40;

    v14->_importAssetsPowerAssertionIdentifier = -[PXPowerController generateAssertionIdentifier](v14->_powerController, "generateAssertionIdentifier");
    v14->_deleteAssetsPowerAssertionIdentifier = -[PXPowerController generateAssertionIdentifier](v14->_powerController, "generateAssertionIdentifier");
    v14->_loadAssetsPowerAssertionIdentifier = -[PXPowerController generateAssertionIdentifier](v14->_powerController, "generateAssertionIdentifier");
    v42 = -[PXImportMediaLoadingCoordinator initWithImportController:]([PXImportMediaLoadingCoordinator alloc], "initWithImportController:", v14);
    mediaLoadingCoordinator = v14->_mediaLoadingCoordinator;
    v14->_mediaLoadingCoordinator = v42;

  }
  return v14;
}

- (PXImportController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 153, CFSTR("%s is not available as initializer"), "-[PXImportController init]");

  abort();
}

- (void)adoptImportSource:(id)a3
{
  PHImportSource *v5;
  PHImportSource *importSource;
  void *v7;
  PHImportSource *v8;

  v5 = (PHImportSource *)a3;
  importSource = self->_importSource;
  v8 = v5;
  if (importSource != v5)
  {
    -[PHImportSource removeImportSourceObserver:](importSource, "removeImportSourceObserver:", self);
    objc_storeStrong((id *)&self->_importSource, a3);
    -[PHImportSource assets](v8, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportController importSource:didAddAssets:](self, "importSource:didAddAssets:", v8, v7);

    -[PHImportSource addImportSourceObserver:](v8, "addImportSourceObserver:", self);
  }

}

- (void)shutdown
{
  px_dispatch_on_main_queue_sync();
}

- (void)dealloc
{
  NSTimer *initialBatchOfAssetsTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_initialBatchOfAssetsTimer, "invalidate");
  initialBatchOfAssetsTimer = self->_initialBatchOfAssetsTimer;
  self->_initialBatchOfAssetsTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXImportController;
  -[PXImportController dealloc](&v4, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImportController;
  -[PXImportController performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setLoadingContent:(BOOL)a3
{
  if (self->_loadingContent != a3)
  {
    self->_loadingContent = a3;
    -[PXImportController signalChange:](self, "signalChange:", 1);
  }
}

- (void)setHasLoadedInitialBatchOfAssets:(BOOL)a3
{
  if (self->_hasLoadedInitialBatchOfAssets != a3)
  {
    self->_hasLoadedInitialBatchOfAssets = a3;
    -[PXImportController signalChange:](self, "signalChange:", 16);
  }
}

- (void)setLoadingInitialBatchOfAssets:(BOOL)a3
{
  if (self->_loadingInitialBatchOfAssets != a3)
  {
    self->_loadingInitialBatchOfAssets = a3;
    -[PXImportController signalChange:](self, "signalChange:", 32);
  }
}

- (void)loadAssets
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PHImportSource *importSource;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  PHImportSource *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD aBlock[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PXImportController importSource](self, "importSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_adoptImportSource_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 339, CFSTR("%@ was asked to load assets with a nil import source. Call %@ first to set an import source."), self, v21);

  }
  _importControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PXImportController loadAssets]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%s: start", buf, 0xCu);
  }

  if (!-[PXImportController hasLoadedAssets](self, "hasLoadedAssets"))
  {
    -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_184_219925);
    v6 = -[PXImportController dateOrder](self, "dateOrder");
    +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "assetEnumerationBehavior");

    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PXImportController_loadAssets__block_invoke_2;
    aBlock[3] = &unk_1E5137DE0;
    objc_copyWeak(&v23, (id *)buf);
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "assetEnumerationBatchSize");

      importSource = self->_importSource;
      -[PXImportController photoLibrary](self, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)-[PHImportSource loadAssetsForLibrary:allowDuplicates:order:batchSize:atEnd:](importSource, "loadAssetsForLibrary:allowDuplicates:order:batchSize:atEnd:", v13, 0, v6, v11, v9);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetEnumerationBatchInterval");
      v17 = v16;

      v18 = self->_importSource;
      -[PXImportController photoLibrary](self, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)-[PHImportSource loadAssetsForLibrary:allowDuplicates:order:batchInterval:atEnd:](v18, "loadAssetsForLibrary:allowDuplicates:order:batchInterval:atEnd:", v13, 0, v6, v9, v17);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleImportSourceModifiedAssets
{
  _QWORD block[5];

  -[PXImportController setHasReceivedImportSourceAssetChanges:](self, "setHasReceivedImportSourceAssetChanges:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PXImportController_handleImportSourceModifiedAssets__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)startInitialBatchOfAssetsTimerWithTimeout:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  -[PXImportController initialBatchOfAssetsTimer](self, "initialBatchOfAssetsTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    -[PXImportController initialBatchOfAssetsTimer](self, "initialBatchOfAssetsTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0C99E88];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke;
  v13 = &unk_1E5141230;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v10, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController setInitialBatchOfAssetsTimer:](self, "setInitialBatchOfAssetsTimer:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)importSource:(id)a3 didAddAssets:(id)a4
{
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  PXImportController *v17;

  v12 = a4;
  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateEmptyImportSource");

  if ((v6 & 1) == 0)
  {
    -[PXImportController sharedViewModelsUpdateQueue](self, "sharedViewModelsUpdateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXImportController_importSource_didAddAssets___block_invoke;
    block[3] = &unk_1E5148D08;
    v9 = v12;
    v16 = v9;
    v17 = self;
    dispatch_sync(v7, block);

    -[PXImportController handleImportSourceModifiedAssets](self, "handleImportSourceModifiedAssets");
    -[PXImportController dataSourceManager](self, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAssets:", v9);

    -[PXImportController otherDataSourceManagersQueue](self, "otherDataSourceManagersQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __48__PXImportController_importSource_didAddAssets___block_invoke_2;
    v13[3] = &unk_1E5148D08;
    v13[4] = self;
    v14 = v9;
    dispatch_sync(v11, v13);

    -[PXImportController restartTimedAssetsLoadingPowerAssertion](self, "restartTimedAssetsLoadingPowerAssertion");
    -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_196_219918);

  }
}

- (void)importSource:(id)a3 didRemoveAssets:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  PXImportController *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  PXImportController *v31;
  _QWORD v32[5];
  id v33;
  _QWORD block[4];
  id v35;
  PXImportController *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "simulateEmptyImportSource");

  if ((v7 & 1) == 0)
  {
    _importDataLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[PXImportController importSource:didRemoveAssets:]";
      v44 = 2048;
      v45 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "%s: Did remove %tu assets", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self;
    -[PXImportController dataSourceManager](self, "dataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v5;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16), "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "itemForImportAssetUuid:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v9, "addObject:", v18);
          }
          else
          {
            _importDataLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              v43 = "-[PXImportController importSource:didRemoveAssets:]";
              _os_log_debug_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEBUG, "%s: Unable to find view model for removed asset", buf, 0xCu);
            }

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }

    -[PXImportController handleImportSourceModifiedAssets](v27, "handleImportSourceModifiedAssets");
    v20 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke;
    block[3] = &unk_1E5148D08;
    v21 = v9;
    v35 = v21;
    v36 = v27;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[PXImportController dataSourceManager](v27, "dataSourceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAssets:", v12);

    -[PXImportController otherDataSourceManagersQueue](v27, "otherDataSourceManagersQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472;
    v32[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke_2;
    v32[3] = &unk_1E5148D08;
    v32[4] = v27;
    v24 = v12;
    v33 = v24;
    dispatch_sync(v23, v32);

    -[PXImportController sharedViewModelsUpdateQueue](v27, "sharedViewModelsUpdateQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __51__PXImportController_importSource_didRemoveAssets___block_invoke_3;
    v29[3] = &unk_1E5148D08;
    v30 = v24;
    v31 = v27;
    dispatch_sync(v25, v29);

    if (objc_msgSend(v21, "count"))
    {
      -[PXImportController deleteAction](v27, "deleteAction");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "didRemoveAssets:", v21);

    }
    -[PXImportController restartTimedAssetsLoadingPowerAssertion](v27, "restartTimedAssetsLoadingPowerAssertion");
    -[PXImportController performChanges:](v27, "performChanges:", &__block_literal_global_197_219917);

    v5 = v28;
  }

}

- (int64_t)importAsset:(id)a3 asDuplicateOfLibraryAsset:(id)a4 applyToAll:(BOOL *)a5
{
  return 0;
}

- (void)capabilitiesDidChangeForImportSource:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PXImportController_capabilitiesDidChangeForImportSource___block_invoke;
  v3[3] = &unk_1E5137E88;
  v3[4] = self;
  -[PXImportController performChanges:](self, "performChanges:", v3);
}

- (void)nameDidChangeForImportSource:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXImportController_nameDidChangeForImportSource___block_invoke;
  v3[3] = &unk_1E5137E88;
  v3[4] = self;
  -[PXImportController performChanges:](self, "performChanges:", v3);
}

- (void)userRequiredToTrustHostForImportSource:(id)a3
{
  -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_198_219913);
}

- (void)userHasTrustedHostForImportSource:(id)a3
{
  -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_199_219912);
}

- (id)createDataSourceManagerWithLogIdentifier:(id)a3
{
  id v4;
  PXImportAssetsDataSourceManager *v5;
  void *v6;
  PXImportAssetsDataSourceManager *v7;
  NSObject *v8;
  PXImportAssetsDataSourceManager *v9;
  PXImportAssetsDataSourceManager *v10;
  PXImportAssetsDataSourceManager *v11;
  _QWORD v13[5];
  PXImportAssetsDataSourceManager *v14;

  v4 = a3;
  v5 = [PXImportAssetsDataSourceManager alloc];
  -[PXImportController dataSourceManager](self, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXImportAssetsDataSourceManager initWithAssetsFromDataSourceManager:delegate:logIdentifier:](v5, "initWithAssetsFromDataSourceManager:delegate:logIdentifier:", v6, self, v4);

  -[PXImportController otherDataSourceManagersQueue](self, "otherDataSourceManagersQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PXImportController_createDataSourceManagerWithLogIdentifier___block_invoke;
  v13[3] = &unk_1E5148D08;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  dispatch_sync(v8, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)removeDataSourceManager:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PXImportController *v9;

  v4 = a3;
  -[PXImportController otherDataSourceManagersQueue](self, "otherDataSourceManagersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXImportController_removeDataSourceManager___block_invoke;
  block[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)viewModelMapForImportAssetsDataSourceManager:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__219864;
  v13 = __Block_byref_object_dispose__219865;
  v14 = 0;
  -[PXImportController sharedViewModelsUpdateQueue](self, "sharedViewModelsUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PXImportController_viewModelMapForImportAssetsDataSourceManager___block_invoke;
  v8[3] = &unk_1E5148AA8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)setUserRequiredToTrustHostOnSourceDevice:(BOOL)a3
{
  if (self->_userRequiredToTrustHostOnSourceDevice != a3)
  {
    self->_userRequiredToTrustHostOnSourceDevice = a3;
    -[PXImportController signalChange:](self, "signalChange:", 8);
  }
}

- (void)setImportingAssets:(BOOL)a3
{
  if (self->_importingAssets != a3)
  {
    self->_importingAssets = a3;
    -[PXImportController signalChange:](self, "signalChange:", 2);
  }
}

- (void)importItems:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PXImportSessionInfo *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void (**v35)(id, id);
  PXImportController *val;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v35 = (void (**)(id, id))a4;
  v34 = a5;
  val = self;
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 615, CFSTR("%s: There is an import already in progress."), "-[PXImportController importItems:configuration:completion:]");

  }
  -[PXImportController importProgress](self, "importProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 616, CFSTR("%s: Import progress should be nil when import is started."), "-[PXImportController importItems:configuration:completion:]");

  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 617, CFSTR("%s: There are no items to import."), "-[PXImportController importItems:configuration:completion:]");

  }
  _importControllerLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[PXImportController importItems:configuration:completion:]";
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v13 = objc_alloc_init(PXImportSessionInfo);
  -[PXImportController setImportSessionInfo:](self, "setImportSessionInfo:", v13);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStartDate:", v14);

  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setItemsToImport:", v9);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v22, "performChanges:", &__block_literal_global_213_219896);
        objc_msgSend(v22, "importAsset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v17, "addObject:", v23);
        }
        else
        {
          _importDataLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v45 = "-[PXImportController importItems:configuration:completion:]";
            v46 = 2112;
            v47 = v22;
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_INFO, "%s: Warning: view model missing import asset: %@", buf, 0x16u);
          }

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v19);
  }

  -[PXImportController setImportCompletionHandler:](val, "setImportCompletionHandler:", v34);
  if (v35)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0CD15C8]);
    v35[2](v35, v25);
  }
  else
  {
    v25 = 0;
  }
  -[PXImportController powerController](val, "powerController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController importAssetsPowerAssertionIdentifier](val, "importAssetsPowerAssertionIdentifier"), 1, 0);

  -[PXImportMediaLoadingCoordinator setPaused:](val->_mediaLoadingCoordinator, "setPaused:", 1);
  objc_initWeak((id *)buf, val);
  objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController importSource](val, "importSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController photoLibrary](val, "photoLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__PXImportController_importItems_configuration_completion___block_invoke_214;
  v37[3] = &unk_1E5137F30;
  objc_copyWeak(&v38, (id *)buf);
  objc_msgSend(v27, "importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:performanceDelegate:atEnd:", v17, v28, v29, v25, &v39, val, 0, v37);
  v30 = v39;

  -[PXImportController setImportProgress:](val, "setImportProgress:", v30);
  -[PXImportController startObservingImportProgress](val, "startObservingImportProgress");
  -[PXImportController performChanges:](val, "performChanges:", &__block_literal_global_217_219900);
  objc_destroyWeak(&v38);

  objc_destroyWeak((id *)buf);
}

- (void)stopImport
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _importControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[PXImportController stopImport]";
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (!-[PXImportController isImportingAssets](self, "isImportingAssets"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 671, CFSTR("Attempted to stop import while there was no active import."));

  }
  -[PXImportSessionInfo setImportStopped:](self->_importSessionInfo, "setImportStopped:", 1);
  -[PXImportController importProgress](self, "importProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[PXImportController mediaLoadingCoordinator](self, "mediaLoadingCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", 0);

}

- (void)finishImportingWithResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[PXImportController finishImportingWithResults:]";
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PXImportController stopObservingImportProgress](self, "stopObservingImportProgress");
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImportComplete:", 1);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEndDate:", v7);

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemsToImport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v14);

  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "importedItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v16);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v17);
        -[PXImportController deselectItem:](self, "deselectItem:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v18);
  }

  v21 = (void *)MEMORY[0x1E0C99E20];
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "itemsToImport");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "minusSet:", v17);
  if (objc_msgSend(v24, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v36;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v28++), "performChanges:", &__block_literal_global_220_219887);
        }
        while (v26 != v28);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v26);
    }

  }
  -[PXImportController importCompletionHandler](self, "importCompletionHandler");
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PXImportController importSessionInfo](self, "importSessionInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController setImportCompletionHandler:](self, "setImportCompletionHandler:", 0);
  -[PXImportController setImportSessionInfo:](self, "setImportSessionInfo:", 0);
  -[PXImportController setImportProgress:](self, "setImportProgress:", 0);
  -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_221);
  if (v29)
    ((void (**)(_QWORD, void *, id))v29)[2](v29, v30, v4);
  objc_initWeak((id *)buf, self);
  -[PXImportController importCompletionDelegate](self, "importCompletionDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __49__PXImportController_finishImportingWithResults___block_invoke_3;
  v33[3] = &unk_1E5148D30;
  objc_copyWeak(&v34, (id *)buf);
  objc_msgSend(v31, "importController:didCompleteImportWithImportSession:results:completion:", self, v30, v4, v33);

  -[PXImportController mediaLoadingCoordinator](self, "mediaLoadingCoordinator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPaused:", 0);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

}

- (void)completedImportRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _importDataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "importAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[PXImportController completedImportRecord:]";
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "%s: import complete for %@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PXImportController_completedImportRecord___block_invoke;
  v9[3] = &unk_1E5148D08;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

- (void)setDeletingAssets:(BOOL)a3
{
  if (self->_deletingAssets != a3)
  {
    self->_deletingAssets = a3;
    -[PXImportController signalChange:](self, "signalChange:", 4);
  }
}

- (void)deleteItems:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  void *v12;
  PXImportDeleteAction *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _importControllerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PXImportController deleteItems:withCompletionHandler:]";
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PXImportController deleteAction](self, "deleteAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportController.m"), 794, CFSTR("Attempted to delete import items while another delete is in progress"));

  }
  +[PXImportItemViewModel importAssetsFromModels:](PXImportItemViewModel, "importAssetsFromModels:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXImportDeleteAction initWithAssets:]([PXImportDeleteAction alloc], "initWithAssets:", v12);
  -[PXImportDeleteAction setImportController:](v13, "setImportController:", self);
  -[PXImportController setDeleteCompletionHandler:](self, "setDeleteCompletionHandler:", v8);
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__PXImportController_deleteItems_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E5148D30;
  objc_copyWeak(&v26, (id *)buf);
  -[PXImportDeleteAction setCompletionBlock:](v13, "setCompletionBlock:", v25);
  -[PXImportController setDeleteAction:](self, "setDeleteAction:", v13);
  -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_229_219876);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        -[PXImportController deselectItem:](self, "deselectItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++), (_QWORD)v21);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v15);
  }

  -[PXImportController powerController](self, "powerController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController deleteAssetsPowerAssertionIdentifier](self, "deleteAssetsPowerAssertionIdentifier"), 2, 0);

  objc_msgSend((id)objc_opt_class(), "importOperationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v13);

  -[PXImportMediaLoadingCoordinator setPaused:](self->_mediaLoadingCoordinator, "setPaused:", 1);
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (void)finishDeletingItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  -[PXImportController deleteAction](self, "deleteAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "didSucceed");
  objc_msgSend(v8, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController deleteCompletionHandler](self, "deleteCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v5, "copy");

  -[PXImportController setDeleteCompletionHandler:](self, "setDeleteCompletionHandler:", 0);
  -[PXImportController setDeleteAction:](self, "setDeleteAction:", 0);
  -[PXImportController performChanges:](self, "performChanges:", &__block_literal_global_230_219869);
  -[PXImportController powerController](self, "powerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePowerAssertionForIdentifier:withReason:completion:", -[PXImportController deleteAssetsPowerAssertionIdentifier](self, "deleteAssetsPowerAssertionIdentifier"), 2, 0);

  if (v6)
    ((void (**)(_QWORD, uint64_t, void *))v6)[2](v6, v3, v4);
  -[PXImportMediaLoadingCoordinator setPaused:](self->_mediaLoadingCoordinator, "setPaused:", 0);

}

- (void)setSelected:(BOOL)a3 forItems:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _OWORD v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[40];
  _BYTE v34[128];
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PXImportController selectionManager](self, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        memset(buf, 0, 32);
        if (v9)
          objc_msgSend(v9, "itemIndexPathForItem:", v17);
        v28[0] = *(_OWORD *)buf;
        v28[1] = *(_OWORD *)&buf[16];
        if (v4)
          objc_msgSend(v11, "addIndexPath:", v28);
        else
          objc_msgSend(v11, "removeIndexPath:", v28);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  -[PXImportController selectionManager](self, "selectionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __43__PXImportController_setSelected_forItems___block_invoke;
  v26[3] = &unk_1E513C668;
  v27 = v11;
  v19 = v11;
  objc_msgSend(v18, "performChanges:", v26);

  -[PXImportController selectionManager](self, "selectionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectionSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _importControllerLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = objc_msgSend(v12, "count");
    objc_msgSend(v21, "selectedIndexPaths");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[PXImportController setSelected:forItems:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v23;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v25;
    _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_INFO, "%s: Selected: %d (%lu models) (selected count %lu)", buf, 0x26u);

  }
}

- (void)selectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE buf[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (objc_msgSend(v4, "isSelectable"))
  {
    -[PXImportController selectionManager](self, "selectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v18 = 0u;
    v19 = 0u;
    if (v7)
      objc_msgSend(v7, "itemIndexPathForItem:", v4);
    *(_OWORD *)buf = v18;
    *(_OWORD *)&buf[16] = v19;
    if ((objc_msgSend(v6, "isIndexPathSelected:", buf) & 1) == 0)
    {
      -[PXImportController selectionManager](self, "selectionManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __33__PXImportController_selectItem___block_invoke;
      v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
      v16 = v18;
      v17 = v19;
      objc_msgSend(v9, "performChanges:", v15);

      -[PXImportController selectionManager](self, "selectionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectionSnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      _importControllerLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "selectedIndexPaths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[PXImportController selectItem:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v14;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "%s: %@ (selected count %lu)", buf, 0x20u);

      }
    }

  }
}

- (void)deselectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE buf[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PXImportController selectionManager](self, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v18 = 0u;
  v19 = 0u;
  if (v7)
    objc_msgSend(v7, "itemIndexPathForItem:", v4);
  *(_OWORD *)buf = v18;
  *(_OWORD *)&buf[16] = v19;
  if (objc_msgSend(v6, "isIndexPathSelected:", buf))
  {
    -[PXImportController selectionManager](self, "selectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __35__PXImportController_deselectItem___block_invoke;
    v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v16 = v18;
    v17 = v19;
    objc_msgSend(v9, "performChanges:", v15);

    -[PXImportController selectionManager](self, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _importControllerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "selectedIndexPaths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[PXImportController deselectItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v14;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "%s: %@ (selected count %lu)", buf, 0x20u);

    }
  }

}

- (id)selectedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PXImportController selectionManager](self, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__219864;
  v17 = __Block_byref_object_dispose__219865;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__PXImportController_selectedItems__block_invoke;
  v10[3] = &unk_1E5138040;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateAllIndexPathsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setAlreadyImportedItemsSelectable:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 alreadyImportedItemsSelectable;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  if (self->_alreadyImportedItemsSelectable != a3)
  {
    self->_alreadyImportedItemsSelectable = a3;
    -[PXImportController selectionManager](self, "selectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    if (self->_alreadyImportedItemsSelectable)
    {
      alreadyImportedItemsSelectable = 1;
    }
    else
    {
      +[PXImportItemViewModel alreadyImportedGroupIdentifier](PXImportItemViewModel, "alreadyImportedGroupIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetCollectionForIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_msgSend(v6, "sectionForAssetCollection:", v10);
        objc_msgSend(v5, "selectedIndexPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke;
        v21[3] = &unk_1E5138068;
        v23 = v11;
        v13 = objc_alloc_init((Class)off_1E50B3668);
        v22 = v13;
        objc_msgSend(v12, "enumerateAllIndexPathsUsingBlock:", v21);
        -[PXImportController selectionManager](self, "selectionManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_2;
        v19[3] = &unk_1E513C668;
        v20 = v13;
        v15 = v13;
        objc_msgSend(v14, "performChanges:", v19);

      }
      alreadyImportedItemsSelectable = self->_alreadyImportedItemsSelectable;
    }
    -[PXImportController dataSourceManager](self, "dataSourceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlreadyImportedItemsSelectable:", alreadyImportedItemsSelectable);

    -[PXImportController otherDataSourceManagersQueue](self, "otherDataSourceManagersQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_3;
    v18[3] = &unk_1E5149198;
    v18[4] = self;
    dispatch_sync(v17, v18);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a4;
  v11 = v10;
  if ((void *)PXImportProgressObservationContext == a6)
  {
    objc_msgSend(v10, "fractionCompleted");
    -[PXImportController sendActionProgress:](self, "sendActionProgress:");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXImportController;
    -[PXImportController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (void)sendActionProgress:(double)a3
{
  px_dispatch_on_main_queue_sync();
}

- (void)startObservingImportProgress
{
  px_dispatch_on_main_queue_sync();
}

- (void)stopObservingImportProgress
{
  px_dispatch_on_main_queue_sync();
}

- (void)restartTimedAssetsLoadingPowerAssertion
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PXImportController assetLoadingPowerAssertionTimer](self, "assetLoadingPowerAssertionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  _importControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PXImportController restartTimedAssetsLoadingPowerAssertion]";
      v12 = 2048;
      v13 = 0x4024000000000000;
      _os_log_debug_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%s: Timer already running, resetting timeout to %.0f seconds.", buf, 0x16u);
    }

    -[PXImportController assetLoadingPowerAssertionTimer](self, "assetLoadingPowerAssertionTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PXImportController restartTimedAssetsLoadingPowerAssertion]";
      v12 = 2048;
      v13 = 0x4024000000000000;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_INFO, "%s: Timer not running, taking assets-loading power assertion and starting timer for %.0f seconds.", buf, 0x16u);
    }

    -[PXImportController powerController](self, "powerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPowerAssertionForIdentifier:withReason:completion:", -[PXImportController loadAssetsPowerAssertionIdentifier](self, "loadAssetsPowerAssertionIdentifier"), 4, 0);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_assetLoadingPowerAssertionTimerFired, 0, 0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportController setAssetLoadingPowerAssertionTimer:](self, "setAssetLoadingPowerAssertionTimer:", v8);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXImportController_restartTimedAssetsLoadingPowerAssertion__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)stopTimedAssetsLoadingPowerAssertion
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _importControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[PXImportController stopTimedAssetsLoadingPowerAssertion]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[PXImportController assetLoadingPowerAssertionTimer](self, "assetLoadingPowerAssertionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
  {
    -[PXImportController assetLoadingPowerAssertionTimer](self, "assetLoadingPowerAssertionTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[PXImportController setAssetLoadingPowerAssertionTimer:](self, "setAssetLoadingPowerAssertionTimer:", 0);
    -[PXImportController powerController](self, "powerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removePowerAssertionForIdentifier:withReason:completion:", -[PXImportController loadAssetsPowerAssertionIdentifier](self, "loadAssetsPowerAssertionIdentifier"), 4, 0);

  }
}

- (void)assetLoadingPowerAssertionTimerFired
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[PXImportController assetLoadingPowerAssertionTimerFired]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PXImportController stopTimedAssetsLoadingPowerAssertion](self, "stopTimedAssetsLoadingPowerAssertion");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSArray *v17;
  NSArray *lastSelectedModels;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) != 0 && (void *)PXImportControllerSelectionManagerObserverContext == a5)
  {
    -[PXImportController selectionManager](self, "selectionManager", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedIndexPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    if (objc_msgSend(v9, "count") >= 1)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __51__PXImportController_observable_didChange_context___block_invoke;
      v25[3] = &unk_1E513B078;
      v26 = v8;
      v27 = v10;
      v28 = v7;
      objc_msgSend(v9, "enumerateItemIndexPathsUsingBlock:", v25);

    }
    v19 = v9;
    v20 = v8;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_lastSelectedModels;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v10, "containsObject:", v16, v19, v20, (_QWORD)v21) & 1) == 0
            && objc_msgSend(v16, "isSelected")
            && (objc_msgSend(v16, "isDeleted") & 1) == 0)
          {
            objc_msgSend(v16, "performChanges:", &__block_literal_global_245);
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v13);
    }

    -[PXImportController setLastSelectionSnapshot:](self, "setLastSelectionSnapshot:", v7);
    v17 = (NSArray *)objc_msgSend(v10, "copy");
    lastSelectedModels = self->_lastSelectedModels;
    self->_lastSelectedModels = v17;

  }
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unsigned)imageFormat
{
  return self->_imageFormat;
}

- (int64_t)dateOrder
{
  return self->_dateOrder;
}

- (PXImportMediaProvider)importMediaProvider
{
  return self->_importMediaProvider;
}

- (PXImportAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXImportControllerTopLevelCompletionDelegate)importCompletionDelegate
{
  return (PXImportControllerTopLevelCompletionDelegate *)objc_loadWeakRetained((id *)&self->_importCompletionDelegate);
}

- (void)setImportCompletionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_importCompletionDelegate, a3);
}

- (BOOL)isLoadingContent
{
  return self->_loadingContent;
}

- (BOOL)hasLoadedInitialBatchOfAssets
{
  return self->_hasLoadedInitialBatchOfAssets;
}

- (BOOL)isLoadingInitialBatchOfAssets
{
  return self->_isLoadingInitialBatchOfAssets;
}

- (BOOL)isUserRequiredToTrustHostOnSourceDevice
{
  return self->_userRequiredToTrustHostOnSourceDevice;
}

- (BOOL)isImportingAssets
{
  return self->_importingAssets;
}

- (PXImportSessionInfo)importSessionInfo
{
  return self->_importSessionInfo;
}

- (void)setImportSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_importSessionInfo, a3);
}

- (NSProgress)importProgress
{
  return self->_importProgress;
}

- (void)setImportProgress:(id)a3
{
  objc_storeStrong((id *)&self->_importProgress, a3);
}

- (PHAssetCollection)importDestinationAlbum
{
  return self->_importDestinationAlbum;
}

- (void)setImportDestinationAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_importDestinationAlbum, a3);
}

- (BOOL)isDeletingAssets
{
  return self->_deletingAssets;
}

- (PXImportDeleteAction)deleteAction
{
  return self->_deleteAction;
}

- (void)setDeleteAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteAction, a3);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (BOOL)alreadyImportedItemsSelectable
{
  return self->_alreadyImportedItemsSelectable;
}

- (BOOL)hasLoadedAssets
{
  return self->_hasLoadedAssets;
}

- (void)setHasLoadedAssets:(BOOL)a3
{
  self->_hasLoadedAssets = a3;
}

- (BOOL)hasReceivedImportSourceAssetChanges
{
  return self->_hasReceivedImportSourceAssetChanges;
}

- (void)setHasReceivedImportSourceAssetChanges:(BOOL)a3
{
  self->_hasReceivedImportSourceAssetChanges = a3;
}

- (void)setIsLoadingInitialBatchOfAssets:(BOOL)a3
{
  self->_isLoadingInitialBatchOfAssets = a3;
}

- (NSTimer)initialBatchOfAssetsTimer
{
  return self->_initialBatchOfAssetsTimer;
}

- (void)setInitialBatchOfAssetsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_initialBatchOfAssetsTimer, a3);
}

- (NSMutableDictionary)sharedViewModelsById
{
  return self->_sharedViewModelsById;
}

- (OS_dispatch_queue)sharedViewModelsUpdateQueue
{
  return self->_sharedViewModelsUpdateQueue;
}

- (NSMutableSet)otherDataSourceManagers
{
  return self->_otherDataSourceManagers;
}

- (OS_dispatch_queue)otherDataSourceManagersQueue
{
  return self->_otherDataSourceManagersQueue;
}

- (PXPowerController)powerController
{
  return self->_powerController;
}

- (void)setPowerController:(id)a3
{
  objc_storeStrong((id *)&self->_powerController, a3);
}

- (unsigned)importAssetsPowerAssertionIdentifier
{
  return self->_importAssetsPowerAssertionIdentifier;
}

- (void)setImportAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_importAssetsPowerAssertionIdentifier = a3;
}

- (unsigned)deleteAssetsPowerAssertionIdentifier
{
  return self->_deleteAssetsPowerAssertionIdentifier;
}

- (void)setDeleteAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_deleteAssetsPowerAssertionIdentifier = a3;
}

- (unsigned)loadAssetsPowerAssertionIdentifier
{
  return self->_loadAssetsPowerAssertionIdentifier;
}

- (void)setLoadAssetsPowerAssertionIdentifier:(unsigned int)a3
{
  self->_loadAssetsPowerAssertionIdentifier = a3;
}

- (NSTimer)assetLoadingPowerAssertionTimer
{
  return self->_assetLoadingPowerAssertionTimer;
}

- (void)setAssetLoadingPowerAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadingPowerAssertionTimer, a3);
}

- (id)importCompletionHandler
{
  return self->_importCompletionHandler;
}

- (void)setImportCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)deleteCompletionHandler
{
  return self->_deleteCompletionHandler;
}

- (void)setDeleteCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (PXSelectionSnapshot)lastSelectionSnapshot
{
  return self->_lastSelectionSnapshot;
}

- (void)setLastSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectionSnapshot, a3);
}

- (PXImportMediaLoadingCoordinator)mediaLoadingCoordinator
{
  return self->_mediaLoadingCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLoadingCoordinator, 0);
  objc_storeStrong((id *)&self->_lastSelectionSnapshot, 0);
  objc_storeStrong(&self->_deleteCompletionHandler, 0);
  objc_storeStrong(&self->_importCompletionHandler, 0);
  objc_storeStrong((id *)&self->_assetLoadingPowerAssertionTimer, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_otherDataSourceManagersQueue, 0);
  objc_storeStrong((id *)&self->_otherDataSourceManagers, 0);
  objc_storeStrong((id *)&self->_sharedViewModelsUpdateQueue, 0);
  objc_storeStrong((id *)&self->_sharedViewModelsById, 0);
  objc_storeStrong((id *)&self->_initialBatchOfAssetsTimer, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_importDestinationAlbum, 0);
  objc_storeStrong((id *)&self->_importProgress, 0);
  objc_storeStrong((id *)&self->_importSessionInfo, 0);
  objc_destroyWeak((id *)&self->_importCompletionDelegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_importMediaProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_lastSelectedModels, 0);
}

void __51__PXImportController_observable_didChange_context___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  int v10;
  _QWORD v11[4];
  char v12;
  __int128 v13;
  __int128 v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2[1];
  v13 = *a2;
  v14 = v5;
  objc_msgSend(v4, "assetReferenceAtItemIndexPath:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  v8 = *(void **)(a1 + 48);
  v9 = a2[1];
  v13 = *a2;
  v14 = v9;
  v10 = objc_msgSend(v8, "isIndexPathSelected:", &v13);
  if (v10 != objc_msgSend(v7, "isSelected"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PXImportController_observable_didChange_context___block_invoke_2;
    v11[3] = &__block_descriptor_33_e40_v16__0___PXMutableImportItemViewModel__8l;
    v12 = v10;
    objc_msgSend(v7, "performChanges:", v11);
  }

}

uint64_t __51__PXImportController_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", 0);
}

uint64_t __51__PXImportController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:", *(unsigned __int8 *)(a1 + 32));
}

void __61__PXImportController_restartTimedAssetsLoadingPowerAssertion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assetLoadingPowerAssertionTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetLoadingPowerAssertionTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTimer:forMode:", v3, *MEMORY[0x1E0C99748]);

  }
}

uint64_t __49__PXImportController_stopObservingImportProgress__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "importProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"), PXImportProgressObservationContext);

  objc_msgSend(*(id *)(a1 + 32), "setImportProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "sendActionProgress:", 0.0);
}

void __50__PXImportController_startObservingImportProgress__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "importProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionCompleted");
  objc_msgSend(v2, "sendActionProgress:");

  objc_msgSend(*(id *)(a1 + 32), "importProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"), 0, PXImportProgressObservationContext);

}

void __41__PXImportController_sendActionProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "importProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("PXImportControllerFractionCompleted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("PXImportControllerCompletedItemCount");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (v2)
    v5 = objc_msgSend(v2, "completedUnitCount");
  else
    v5 = 0;
  objc_msgSend(v4, "numberWithLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("PXImportControllerTotalItemCount");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  if (v2)
    v8 = objc_msgSend(v2, "totalUnitCount");
  else
    v8 = 0;
  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("PXImportControllerProgressNotification"), *(_QWORD *)(a1 + 32), v10);

}

uint64_t __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke(uint64_t result, uint64_t a2)
{
  void *v2;
  __int128 v3;
  _OWORD v4[2];

  if (*(_QWORD *)(a2 + 8) != *(_QWORD *)(result + 40))
  {
    v2 = *(void **)(result + 32);
    v3 = *(_OWORD *)(a2 + 16);
    v4[0] = *(_OWORD *)a2;
    v4[1] = v3;
    return objc_msgSend(v2, "addIndexPath:", v4);
  }
  return result;
}

uint64_t __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __56__PXImportController_setAlreadyImportedItemsSelectable___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlreadyImportedItemsSelectable:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 110));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __35__PXImportController_selectedItems__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

uint64_t __35__PXImportController_deselectItem___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedState:forIndexPath:", 0, v4);
}

uint64_t __33__PXImportController_selectItem___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedState:forIndexPath:", 1, v4);
}

uint64_t __43__PXImportController_setSelected_forItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__PXImportController_finishDeletingItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeletingAssets:", 0);
}

void __56__PXImportController_deleteItems_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[PXImportController deleteItems:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%s: Delete operation done", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_228;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

uint64_t __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeletingAssets:", 1);
}

void __56__PXImportController_deleteItems_withCompletionHandler___block_invoke_228(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishDeletingItems");

}

void __44__PXImportController_completedImportRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unfilteredDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "importAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForImportAssetUuid:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "deselectItem:", v6);
    objc_msgSend(*(id *)(a1 + 40), "exceptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    if (v8)
    {
      objc_msgSend(v9, "errorItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setErrorItems:", v11);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "errorItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v6);

      v13 = &__block_literal_global_222_219881;
    }
    else
    {
      objc_msgSend(v9, "importedItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setImportedItems:", v16);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "importedItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v6);

      _importDataLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[PXImportController completedImportRecord:]_block_invoke";
        _os_log_debug_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "%s: ====   TBD:  move imported items into the top section? ===", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__PXImportController_completedImportRecord___block_invoke_223;
      v21[3] = &unk_1E5137FD8;
      v21[4] = *(_QWORD *)(a1 + 32);
      v13 = v21;
    }
    objc_msgSend(v6, "performChanges:", v13);
  }
  else
  {
    _importDataLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "importAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[PXImportController completedImportRecord:]_block_invoke_2";
      v24 = 2112;
      v25 = v20;
      _os_log_debug_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "%s: Model not found in data source for import item %@", buf, 0x16u);

    }
  }

}

void __44__PXImportController_completedImportRecord___block_invoke_223(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v4 = a2;
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImportDate:", v3);

  objc_msgSend(v4, "setState:", 2);
}

uint64_t __44__PXImportController_completedImportRecord___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 3);
}

void __49__PXImportController_finishImportingWithResults___block_invoke_3(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "powerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "removePowerAssertionForIdentifier:withReason:completion:", objc_msgSend(v3, "importAssetsPowerAssertionIdentifier"), 1, 0);

}

uint64_t __49__PXImportController_finishImportingWithResults___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImportingAssets:", 0);
}

uint64_t __49__PXImportController_finishImportingWithResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 0);
}

void __59__PXImportController_importItems_configuration_completion___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v8);
}

uint64_t __59__PXImportController_importItems_configuration_completion___block_invoke_216(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImportingAssets:", 1);
}

void __59__PXImportController_importItems_configuration_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PXImportController importItems:configuration:completion:]_block_invoke_2";
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%s: PHImportController completion block called", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "finishImportingWithResults:", *(_QWORD *)(a1 + 32));

}

uint64_t __59__PXImportController_importItems_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 1);
}

void __67__PXImportController_viewModelMapForImportAssetsDataSourceManager___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sharedViewModelsById");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__PXImportController_removeDataSourceManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    _PFAssertFailHandler();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "otherDataSourceManagers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "member:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "otherDataSourceManagers");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 32));

      return;
    }
  }
  v6 = _PFAssertFailHandler();
  __63__PXImportController_createDataSourceManagerWithLogIdentifier___block_invoke(v6);
}

void __63__PXImportController_createDataSourceManagerWithLogIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __56__PXImportController_userHasTrustedHostForImportSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserRequiredToTrustHostOnSourceDevice:", 0);
}

uint64_t __61__PXImportController_userRequiredToTrustHostForImportSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserRequiredToTrustHostOnSourceDevice:", 1);
}

uint64_t __51__PXImportController_nameDidChangeForImportSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 128);
}

uint64_t __59__PXImportController_capabilitiesDidChangeForImportSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 64);
}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "deselectItem:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeAssets:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __51__PXImportController_importSource_didRemoveAssets___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "sharedViewModelsById", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __51__PXImportController_importSource_didRemoveAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserRequiredToTrustHostOnSourceDevice:", 0);
}

void __48__PXImportController_importSource_didAddAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PXImportItemViewModel *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "sharedViewModelsById", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (PXImportItemViewModel *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v10 = -[PXImportItemViewModel initWithImportAsset:]([PXImportItemViewModel alloc], "initWithImportAsset:", v7);
          objc_msgSend(*(id *)(a1 + 40), "sharedViewModelsById");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __48__PXImportController_importSource_didAddAssets___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "otherDataSourceManagers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "addAssets:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __48__PXImportController_importSource_didAddAssets___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserRequiredToTrustHostOnSourceDevice:", 0);
}

void __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  id v7;
  uint8_t v8[16];

  v3 = a2;
  _importControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Initial batch of assets have been loaded.", v8, 2u);
  }

  objc_msgSend(v3, "invalidate");
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setInitialBatchOfAssetsTimer:", 0);

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "performChanges:", &__block_literal_global_193_219920);

}

void __64__PXImportController_startInitialBatchOfAssetsTimerWithTimeout___block_invoke_192(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setLoadingInitialBatchOfAssets:", 0);
  objc_msgSend(v2, "setHasLoadedInitialBatchOfAssets:", 1);

}

uint64_t __54__PXImportController_handleImportSourceModifiedAssets__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasLoadedInitialBatchOfAssets");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_190_219921);
    return objc_msgSend(*(id *)(a1 + 32), "startInitialBatchOfAssetsTimerWithTimeout:", 1.5);
  }
  return result;
}

uint64_t __54__PXImportController_handleImportSourceModifiedAssets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLoadingInitialBatchOfAssets:", 1);
}

void __32__PXImportController_loadAssets__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _importControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PXImportController loadAssets]_block_invoke_2";
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHasLoadedAssets:", 1);

  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "mediaLoadingCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPaused:", 0);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __32__PXImportController_loadAssets__block_invoke_186;
  v14[3] = &unk_1E51429B8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v11;
  v17 = v5;
  v12 = v5;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

  objc_destroyWeak(&v18);
}

void __32__PXImportController_loadAssets__block_invoke_186(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "hasReceivedImportSourceAssetChanges") & 1) == 0)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "initialBatchOfAssetsTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_5;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "startInitialBatchOfAssetsTimerWithTimeout:", 5.0);
  }

LABEL_5:
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "performChanges:", &__block_literal_global_188_219928);

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    _importControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v9;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Exceptions during asset loading: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "importCompletionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "importController:didLoadAssets:exceptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __32__PXImportController_loadAssets__block_invoke_2_187(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLoadingContent:", 0);
}

void __32__PXImportController_loadAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setLoadingContent:", 1);
  objc_msgSend(v2, "setLoadingInitialBatchOfAssets:", 1);

}

void __30__PXImportController_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "stopObservingImportProgress");
  objc_msgSend(*(id *)(a1 + 32), "stopTimedAssetsLoadingPowerAssertion");
  objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_219933);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  *(_QWORD *)(v2 + 216) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "shutdown");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 296);
  *(_QWORD *)(v4 + 296) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 272);
  *(_QWORD *)(v8 + 272) = 0;

}

void __30__PXImportController_shutdown__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setHasLoadedInitialBatchOfAssets:", 0);
  objc_msgSend(v2, "setLoadingInitialBatchOfAssets:", 0);

}

+ (id)importOperationQueue
{
  if (importOperationQueue_onceToken != -1)
    dispatch_once(&importOperationQueue_onceToken, &__block_literal_global_159_219973);
  return (id)importOperationQueue__importQueue;
}

+ (id)assetsForModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "importAsset", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (int64_t)diskSpaceRequiredToImportItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "importAsset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "approximateBytesRequiredToImport");

        if (!v10)
          _PFAssertContinueHandler();
        v6 += v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
    v11 = v6 + 0x200000;
  }
  else
  {
    v11 = 0x200000;
  }

  return v11;
}

+ (id)itemsConstrainedByAvailableDiskSpaceFromItems:(id)a3 additionalBytesRequired:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  NSObject *v21;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForPath:", v7);
  v28 = (id)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
  if (v10)
  {
    v11 = v10;
    v26 = a4;
    v27 = v7;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v16, "importAsset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "approximateBytesRequiredToImport");

        if (!v18)
          _PFAssertContinueHandler();
        v13 += v18;
        v19 = v13 + 0x200000;
        if (v13 + 0x200000 >= v8)
          v12 = 1;
        else
          objc_msgSend(v28, "addObject:", v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    }
    while (v11);

    if ((v12 & 1) != 0)
      v20 = v13 + 0x200000 - v8;
    else
      v20 = 0;
    a4 = v26;
    v7 = v27;
  }
  else
  {

    v20 = 0;
    v19 = 0x200000;
  }
  *a4 = v20;
  _importControllerLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = objc_msgSend(v9, "count");
    v24 = *a4;
    v25 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 134219008;
    v34 = v23;
    v35 = 2048;
    v36 = v19;
    v37 = 2048;
    v38 = v8;
    v39 = 2048;
    v40 = v24;
    v41 = 2048;
    v42 = v25;
    _os_log_debug_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEBUG, "%lu items totalling %lld bytes with %lld bytes available leaves %lld additional bytes required. (%lu items importable.)", buf, 0x34u);
  }

  return v28;
}

+ (void)favoriteAssetsFromImportResults:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  objc_msgSend(a3, "importRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke_2;
  v12[3] = &unk_1E5149198;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v5, "performChanges:completionHandler:", v12, &__block_literal_global_174_219964);

}

+ (id)importFilesAtURLs:(id)a3 photoLibrary:(id)a4 collection:(id)a5 checkDuplicates:(BOOL)a6 referenced:(BOOL)a7 delegate:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  id v21;
  char isKindOfClass;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  char v36;

  v10 = a7;
  v11 = a6;
  v15 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a5;
  v19 = a3;
  v20 = objc_msgSend(v18, "px_isFavoritesSmartAlbum");
  v21 = objc_alloc_init(MEMORY[0x1E0CD15C8]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v20)
    v23 = 0;
  else
    v23 = v18;
  if ((isKindOfClass & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  objc_msgSend(v21, "setDestinationAlbum:", v24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v18;
  else
    v25 = 0;
  objc_msgSend(v21, "setDestinationFolder:", v25);

  objc_msgSend(v21, "destinationFolder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPreserveFolderStructure:", v26 != 0);

  objc_msgSend(v21, "setAllowDuplicates:", !v11);
  objc_msgSend(v21, "setShouldImportAsReferenced:", v10);
  objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke;
  v32[3] = &unk_1E5137D78;
  v36 = v20;
  v34 = v16;
  v35 = a1;
  v33 = v15;
  v28 = v16;
  v29 = v15;
  objc_msgSend(v27, "importUrls:intoLibrary:withOptions:delegate:performanceDelegate:atEnd:", v19, v29, v21, v17, 0, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

void __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 48), "favoriteAssetsFromImportResults:photoLibrary:", v3, *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = v4;
    v5 = v3;
    px_dispatch_on_main_queue();

  }
}

uint64_t __118__PXImportController_importFilesAtURLs_photoLibrary_collection_checkDuplicates_referenced_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFavorite:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Error marking assets as favorite: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

uint64_t __67__PXImportController_favoriteAssetsFromImportResults_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

uint64_t __42__PXImportController_importOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)importOperationQueue__importQueue;
  importOperationQueue__importQueue = (uint64_t)v0;

  objc_msgSend((id)importOperationQueue__importQueue, "setQualityOfService:", 25);
  return objc_msgSend((id)importOperationQueue__importQueue, "setMaxConcurrentOperationCount:", 2);
}

@end
