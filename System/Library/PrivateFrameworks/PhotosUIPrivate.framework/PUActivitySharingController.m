@implementation PUActivitySharingController

- (PUActivitySharingController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 83, CFSTR("%s is not available as initializer"), "-[PUActivitySharingController init]");

  abort();
}

- (PUActivitySharingController)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 87, CFSTR("%s is not available as initializer"), "-[PUActivitySharingController new]");

  abort();
}

- (PUActivitySharingController)initWithActivitySharingConfiguration:(id)a3
{
  id v5;
  PUActivitySharingController *v6;
  PUActivitySharingViewModel *v7;
  PUActivitySharingViewModel *viewModel;
  uint64_t v9;
  NSDictionary *assetsFetchResultsByAssetCollection;
  uint64_t v11;
  PHPerson *person;
  uint64_t v13;
  NSArray *excludedActivityTypes;
  uint64_t v15;
  NSArray *activities;
  uint64_t v17;
  PHFetchResult *initialAssetsFetchResult;
  int v19;
  void *v21;
  void *v22;
  objc_super v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingConfiguration"));

  }
  v23.receiver = self;
  v23.super_class = (Class)PUActivitySharingController;
  v6 = -[PUActivitySharingController init](&v23, sel_init);
  if (v6)
  {
    v7 = -[PUActivitySharingViewModel initWithActivitySharingConfiguration:]([PUActivitySharingViewModel alloc], "initWithActivitySharingConfiguration:", v5);
    viewModel = v6->_viewModel;
    v6->_viewModel = v7;

    -[PUActivitySharingViewModel registerChangeObserver:context:](v6->_viewModel, "registerChangeObserver:context:", v6, PUActivitySharingControllerViewModelObserverContext);
    objc_msgSend(v5, "assetsFetchResultsByAssetCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    assetsFetchResultsByAssetCollection = v6->_assetsFetchResultsByAssetCollection;
    v6->_assetsFetchResultsByAssetCollection = (NSDictionary *)v9;

    v6->_allowsAirPlayActivity = objc_msgSend(v5, "allowsAirPlayActivity");
    v6->_allowsSuggestLessPersonActivity = objc_msgSend(v5, "allowsSuggestLessPersonActivity");
    objc_msgSend(v5, "person");
    v11 = objc_claimAutoreleasedReturnValue();
    person = v6->_person;
    v6->_person = (PHPerson *)v11;

    objc_msgSend(v5, "excludedActivityTypes");
    v13 = objc_claimAutoreleasedReturnValue();
    excludedActivityTypes = v6->_excludedActivityTypes;
    v6->_excludedActivityTypes = (NSArray *)v13;

    objc_msgSend(v5, "activities");
    v15 = objc_claimAutoreleasedReturnValue();
    activities = v6->_activities;
    v6->_activities = (NSArray *)v15;

    v6->_excludeShareActivity = objc_msgSend(v5, "excludeShareActivity");
    objc_msgSend(v5, "initialAssetsFetchResult");
    v17 = objc_claimAutoreleasedReturnValue();
    initialAssetsFetchResult = v6->_initialAssetsFetchResult;
    v6->_initialAssetsFetchResult = (PHFetchResult *)v17;

    v19 = _os_feature_enabled_impl();
    v6->_usePhotosStack = v19;
    if (v19 && !v6->_initialAssetsFetchResult)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PUActivitySharingController.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_initialAssetsFetchResult"));

    }
    if (!-[PUActivitySharingViewModel isActionSheet](v6->_viewModel, "isActionSheet"))
      -[PUActivitySharingController _createPhotosViewControllerIfNeeded](v6, "_createPhotosViewControllerIfNeeded");
  }

  return v6;
}

- (void)_createPhotosViewControllerIfNeeded
{
  NSObject *v3;
  id v4;
  const char *v5;
  PUPhotosSharingStackViewController *v6;
  PUPhotosSharingStackViewController *stackViewController;
  PUCarouselSharingViewController *v8;
  void *v9;
  NSDictionary *assetsFetchResultsByAssetCollection;
  void *v11;
  PUCarouselSharingViewController *v12;
  void *v13;
  void *v14;
  PUCarouselSharingViewController *carouselViewController;
  int v16;
  id v17;
  __int16 v18;
  PUActivitySharingController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_usePhotosStack)
  {
    if (self->_stackViewController)
    {
      PLShareSheetGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = (id)objc_opt_class();
        v18 = 2048;
        v19 = self;
        v4 = v17;
        v5 = "<%@:%p>: _createPhotosViewControllerIfNeeded called for a non-nil _stackViewController...";
LABEL_8:
        _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v16, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v6 = -[PUPhotosSharingStackViewController initWithAssetFetchResult:]([PUPhotosSharingStackViewController alloc], "initWithAssetFetchResult:", self->_initialAssetsFetchResult);
    stackViewController = self->_stackViewController;
    self->_stackViewController = v6;

  }
  else
  {
    if (self->_carouselViewController)
    {
      PLShareSheetGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412546;
        v17 = (id)objc_opt_class();
        v18 = 2048;
        v19 = self;
        v4 = v17;
        v5 = "<%@:%p>: _createPhotosViewControllerIfNeeded called for a non-nil _carouselViewController...";
        goto LABEL_8;
      }
LABEL_9:

      return;
    }
    v8 = [PUCarouselSharingViewController alloc];
    -[PUActivitySharingViewModel collectionListFetchResult](self->_viewModel, "collectionListFetchResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    assetsFetchResultsByAssetCollection = self->_assetsFetchResultsByAssetCollection;
    -[PUActivitySharingViewModel selectionManager](self->_viewModel, "selectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PUCarouselSharingViewController initWithPhotoCollectionsFetchResult:assetsFetchResultsByAssetCollection:selection:](v8, "initWithPhotoCollectionsFetchResult:assetsFetchResultsByAssetCollection:selection:", v9, assetsFetchResultsByAssetCollection, v11);

    -[PUCarouselSharingViewController setDelegate:](v12, "setDelegate:", self);
    -[PUActivitySharingViewModel photosDataSource](self->_viewModel, "photosDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController setPhotosDataSource:](v12, "setPhotosDataSource:", v13);

    -[PUActivitySharingViewModel selectionManager](self->_viewModel, "selectionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v12);

    carouselViewController = self->_carouselViewController;
    self->_carouselViewController = v12;

  }
}

- (PUCarouselSharingViewController)carouselViewController
{
  void *v5;

  if (self->_usePhotosStack)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 143, CFSTR("Attempting to obtain carousel when using photos stack view"));

  }
  return self->_carouselViewController;
}

- (id)activityViewControllerIfAvailable
{
  void *v3;
  _BOOL4 activityViewControllerWasCreated;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  const char *v8;
  int v10;
  id v11;
  __int16 v12;
  PUActivitySharingController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    activityViewControllerWasCreated = self->_activityViewControllerWasCreated;
    PLShareSheetGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (activityViewControllerWasCreated)
    {
      if (v6)
      {
        v10 = 138412546;
        v11 = (id)objc_opt_class();
        v12 = 2048;
        v13 = self;
        v7 = v11;
        v8 = "<%@:%p>:  Accessing activityViewControllerIfAvailable when it has been dealloced already.";
LABEL_7:
        _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0x16u);

      }
    }
    else if (v6)
    {
      v10 = 138412546;
      v11 = (id)objc_opt_class();
      v12 = 2048;
      v13 = self;
      v7 = v11;
      v8 = "<%@:%p>:  Accessing activityViewControllerIfAvailable before it has been created.";
      goto LABEL_7;
    }

  }
  return v3;
}

- (PXActivityViewController)activityViewController
{
  PUActivityViewController **p_internalActivityViewController;
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  PUActivitySharingController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_internalActivityViewController = &self->_internalActivityViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalActivityViewController);

  if (!WeakRetained)
  {
    if (self->_activityViewControllerWasCreated)
    {
      PLShareSheetGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = (id)objc_opt_class();
        v18 = 2048;
        v19 = self;
        v7 = v17;
        _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "<%@:%p>: Accessing lazy activityViewController getter when it has been dealloced already.", buf, 0x16u);

      }
    }
    self->_activityViewControllerWasCreated = 1;
    -[PUActivitySharingController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isActionSheet");

    if ((v9 & 1) == 0)
    {
      -[PUActivitySharingController viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAnyAssetSelected");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.viewModel.selectionManager.isAnyAssetSelected"));

      }
    }
    -[PUActivitySharingController _createActivityViewControllerWithActivities:](self, "_createActivityViewControllerWithActivities:", self->_activities);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_internalActivityViewController, v13);

    -[PUActivitySharingController _updateExcludedActivityTypes](self, "_updateExcludedActivityTypes");
  }
  return (PXActivityViewController *)objc_loadWeakRetained((id *)p_internalActivityViewController);
}

- (id)photosDataSource
{
  void *v2;
  void *v3;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  void *v2;
  void *v3;
  void *v4;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionSnapshot *)v4;
}

- (NSDictionary)selectedAssetsByAssetCollection
{
  void *v2;
  void *v3;
  void *v4;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedAssetsByAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSArray)selectedAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionListFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAssetsWithAssetCollectionOrdering:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)selectInitialAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionListFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectInitialAssetsInAssetCollections:", v6);

  -[PUActivitySharingController _updateSelectedAssetIdentifiers](self, "_updateSelectedAssetIdentifiers");
}

- (id)_assetItemsForAssetsFetchResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PUActivityAssetItem *v11;
  PUActivityAssetItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        v11 = [PUActivityAssetItem alloc];
        v12 = -[PUActivityAssetItem initWithAsset:](v11, "initWithAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_createActivityViewControllerWithActivities:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PUPhotosSharingStackViewController *stackViewController;
  void *v16;
  PUCarouselSharingViewController *carouselViewController;
  void *v18;
  void *v19;
  id v20;
  dispatch_block_t v21;
  NSObject *v22;
  PUActivityViewController *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  char v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id location;
  _QWORD block[4];
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  PUActivitySharingController *v50;
  __int16 v51;
  PUActivityViewController *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUActivitySharingController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActionSheet");

  if ((v7 & 1) != 0)
  {
    +[PUActivityViewController actionSheetPhotosApplicationActivities](PUActivityViewController, "actionSheetPhotosApplicationActivities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v11 = 0;
    v36 = 0;
    v5 = (id)v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99E40];
    -[PUActivitySharingController selectedAssets](self, "selectedAssets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orderedSetWithArray:", v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "valueForKey:", CFSTR("localIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_usePhotosStack)
    {
      stackViewController = self->_stackViewController;
      if (!stackViewController)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_stackViewController"));

        stackViewController = self->_stackViewController;
      }
      -[PUPhotosSharingStackViewController assetFetchResult](stackViewController, "assetFetchResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUActivitySharingController _assetItemsForAssetsFetchResult:](self, "_assetItemsForAssetsFetchResult:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      carouselViewController = self->_carouselViewController;
      if (!carouselViewController)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_carouselViewController"));

        carouselViewController = self->_carouselViewController;
      }
      -[PUCarouselSharingViewController currentActivityAssetItems](carouselViewController, "currentActivityAssetItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v36, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke;
    block[3] = &unk_1E58ABD10;
    v46 = v19;
    v20 = v19;
    v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v22, v21);

  }
  v23 = -[PUActivityViewController initWithAssetItems:photosApplicationActivities:linkPresentation:assetIdentifiers:sharingViewModel:]([PUActivityViewController alloc], "initWithAssetItems:photosApplicationActivities:linkPresentation:assetIdentifiers:sharingViewModel:", v10, v5, 0, v11, self->_viewModel);
  -[PUActivityViewController setDelegate:](v23, "setDelegate:", self);
  -[PUActivityViewController setAirDropDelegate:](v23, "setAirDropDelegate:", self);
  -[PUActivityViewController setActivitySharingController:](v23, "setActivitySharingController:", self);
  -[PUActivityViewController setEnableNewDesignInPhotos:](v23, "setEnableNewDesignInPhotos:", 1);
  -[PUActivityViewController setAllowsCustomPresentationStyle:](v23, "setAllowsCustomPresentationStyle:", 1);
  -[PUActivityViewController setModalPresentationStyle:](v23, "setModalPresentationStyle:", 2);
  -[PUActivityViewController presentationController](v23, "presentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  if (v7)
  {
    if (-[PUActivitySharingController excludeShareActivity](self, "excludeShareActivity"))
      v25 = 2;
    else
      v25 = 1;
    -[PUActivityViewController setSharingStyle:](v23, "setSharingStyle:", v25);
    objc_msgSend(v5, "valueForKey:", CFSTR("activityType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityViewController setIncludedActivityTypes:](v23, "setIncludedActivityTypes:", v26);
    -[PUActivityViewController setWhitelistActionActivitiesOnly:](v23, "setWhitelistActionActivitiesOnly:", 1);

  }
  else
  {
    -[PUActivityViewController setSharingStyle:](v23, "setSharingStyle:", 0);
    v27 = 16;
    if (!self->_usePhotosStack)
      v27 = 88;
    -[PUActivityViewController setPhotosCarouselViewController:](v23, "setPhotosCarouselViewController:", *(Class *)((char *)&self->super.isa + v27));
  }
  PLShareSheetGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v48 = v29;
    v49 = 2048;
    v50 = self;
    v51 = 2112;
    v52 = v23;
    v30 = v29;
    _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_DEFAULT, "<%@:%p>: creating PUActivityViewController:%@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v23);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_160;
  aBlock[3] = &unk_1E589B5B8;
  objc_copyWeak(&v42, &location);
  objc_copyWeak(&v43, (id *)buf);
  v31 = _Block_copy(aBlock);
  -[PUActivityViewController setCompletionWithItemsHandler:](v23, "setCompletionWithItemsHandler:", v31);
  -[PUActivityViewController setReadyForInteraction:](v23, "setReadyForInteraction:", 0);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_2_162;
  v37[3] = &unk_1E589B5E0;
  objc_copyWeak(&v38, &location);
  v40 = v7;
  objc_copyWeak(&v39, (id *)buf);
  v32 = _Block_copy(v37);
  -[PUActivityViewController _setShareSheetReadyToInteractHandler:](v23, "_setShareSheetReadyToInteractHandler:", v32);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v23;
}

- (void)_updateExcludedActivityTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  PUActivitySharingController *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUActivitySharingController allowsAirPlayActivity](self, "allowsAirPlayActivity"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D7BC80]);
  if (!-[PUActivitySharingController allowsSuggestLessPersonActivity](self, "allowsSuggestLessPersonActivity"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D7BE50]);
  -[PUActivitySharingController person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "faceCount");

  if (v5 <= 1)
  {
    v6 = *MEMORY[0x1E0D7BDB0];
    v21[0] = *MEMORY[0x1E0D7BDF0];
    v21[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  -[PUActivitySharingController excludedActivityTypes](self, "excludedActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[PUActivitySharingController excludedActivityTypes](self, "excludedActivityTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  PLShareSheetGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = (id)objc_opt_class();
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v3;
    v12 = v16;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "<%@:%p>: set ExcludedActivityTypes: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExcludedActivityTypes:", v13);

}

- (void)_activityViewControllerDidCompleteWithActivityType:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  PUActivitySharingController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLShareSheetGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("NO");
    if (v6)
      v14 = CFSTR("YES");
    v15 = v14;
    v19 = 138413570;
    v20 = v11;
    v21 = 2048;
    v22 = self;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "<%@:%p>: activityViewController %@ did complete with activity type:%@ didComplete:%@ error:%@", (uint8_t *)&v19, 0x3Eu);

  }
  if (v6
    && -[PUActivitySharingController _shouldIncrementShareCountForActivityType:](self, "_shouldIncrementShareCountForActivityType:", v8))
  {
    -[PUActivitySharingController _incrementShareCountForSelectedAssets](self, "_incrementShareCountForSelectedAssets");
  }
  if (v8
    && ((-[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController"),
         v16 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v16, "presentingViewController"),
         v17 = (void *)objc_claimAutoreleasedReturnValue(),
         v17,
         v16,
         v17)
     || v6))
  {
    -[PUActivitySharingController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activitySharingController:didCompleteWithActivityType:success:", self, v8, v6);
  }
  else
  {
    -[PUActivitySharingController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activitySharingControllerDidCancel:", self);
  }

}

- (PHAsset)currentAsset
{
  void *v2;
  void *v3;

  if (self->_usePhotosStack)
  {
    -[PUPhotosSharingStackViewController currentAsset](self->_stackViewController, "currentAsset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUActivitySharingController carouselViewController](self, "carouselViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentAsset");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PHAsset *)v2;
}

- (BOOL)_shouldIncrementShareCountForActivityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (+[PUActivityViewController isShareActivity:](PUActivityViewController, "isShareActivity:", v3))
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D96D88]) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_incrementShareCountForSelectedAssets
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PXIncrementShareCountForAssets();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x1E0D09830];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "px_currentVariationType", (_QWORD)v14))
        {
          v12 = (void *)MEMORY[0x1E0D09910];
          v18 = v10;
          v19 = v5;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.sharing.livePhotoShared"), v13);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)_cancel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  -[PUActivitySharingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PUActivitySharingController__cancel__block_invoke;
  v7[3] = &unk_1E589B608;
  v5 = v3;
  v8 = v5;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setCompletionWithItemsHandler:", v7);

  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cancel");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_activitySharingControllerWillDismissActivityViewController
{
  void *v3;
  char v4;
  void *v5;

  -[PUActivitySharingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUActivitySharingController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activitySharingControllerWillDismissActivityViewController:", self);

  }
  -[PUActivitySharingController _cancelPreheatResourcesRequest](self, "_cancelPreheatResourcesRequest");
}

- (BOOL)activityViewControllerShouldCancelAfterPreparationCanceled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  PUActivitySharingController *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLShareSheetGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = (id)objc_opt_class();
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    v6 = v9;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p>: preparation was cancelled for activityViewController:%@", (uint8_t *)&v8, 0x20u);

  }
  -[PUActivitySharingController _cancel](self, "_cancel");

  return 0;
}

- (void)_updateActionSheetPresentationStyleIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[PUActivitySharingController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActionSheet");

  if ((v4 & 1) == 0)
  {
    -[PUActivitySharingController _createPhotosViewControllerIfNeeded](self, "_createPhotosViewControllerIfNeeded");
    -[PUActivitySharingController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivitySharingController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionListFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectAllAssetsInAssetCollections:", v8);

    v9 = 16;
    if (!self->_usePhotosStack)
      v9 = 88;
    v10 = *(uint64_t *)((char *)&self->super.isa + v9);
    -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPhotosCarouselViewController:", v10);

    -[PUActivitySharingController carouselViewController](self, "carouselViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentActivityAssetItems");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAssetItems:", v14);

    -[PUActivitySharingController _updateSelectedAssetIdentifiers](self, "_updateSelectedAssetIdentifiers");
  }
}

- (void)_updateSelectedAssetIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E40];
  -[PUActivitySharingController selectedAssets](self, "selectedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKey:", CFSTR("localIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSelectedAssetIdentifiers:", v6);

}

- (void)carouselSharingViewController:(id)a3 addAssetItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAssetItem:", v5);

  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_selectedAssetIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "containsObject:", v13) & 1) == 0)
  {
    if (v9)
    {
      v10 = (void *)objc_msgSend(v9, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(v10, "addObject:", v13);
    -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setSelectedAssetIdentifiers:", v11);

  }
  -[PUActivitySharingController _updatePreheatResourcesRequest](self, "_updatePreheatResourcesRequest");

}

- (void)carouselSharingViewController:(id)a3 removeAssetItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAssetItem:", v5);

  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_selectedAssetIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v12);
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setSelectedAssetIdentifiers:", v10);

  -[PUActivitySharingController _updatePreheatResourcesRequest](self, "_updatePreheatResourcesRequest");
}

- (void)carouselSharingViewController:(id)a3 setAssetItems:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUsingCustomItems");

  if (v7)
  {
    PLShareSheetGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Ignoring carousel changes. Using custom items", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssetItems:", v5);

    -[PUActivitySharingController _updateSelectedAssetIdentifiers](self, "_updateSelectedAssetIdentifiers");
    -[PUActivitySharingController _updatePreheatResourcesRequest](self, "_updatePreheatResourcesRequest");
  }

}

- (void)carouselSharingViewController:(id)a3 replaceAssetItem:(id)a4 withAssetItem:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[PUActivitySharingController internalActivityViewController](self, "internalActivityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replaceAssetItem:withAssetItem:", v8, v7);

  -[PUActivitySharingController _updatePreheatResourcesRequest](self, "_updatePreheatResourcesRequest");
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  -[PUActivitySharingController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySharingControllerDidCancel:", self);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((v6 & 1) == 0 || (void *)PUActivitySharingControllerViewModelObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivitySharingController.m"), 481, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUActivitySharingController _updateActionSheetPresentationStyleIfNeeded](self, "_updateActionSheetPresentationStyleIfNeeded");

}

- (void)_preheatResources
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[PUActivitySharingController selectedAssets](self, "selectedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1740]), "initWithAsset:requestType:", v4, 1);
    -[PUActivitySharingController setResourcesPreheatRequest:](self, "setResourcesPreheatRequest:", v5);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PUActivitySharingController__preheatResources__block_invoke;
    v6[3] = &unk_1E589B658;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "retrieveRequiredResourcesWithOptions:completionHandler:", 0, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

  }
}

- (void)_handlePreheatRequestCompletionWithSuccess:(BOOL)a3 cancelled:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  int v18;
  PUActivitySharingController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a4;
  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  PLShareSheetGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v13;
      v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request finished with success for asset uuid %{public}@";
LABEL_7:
      v15 = v10;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 22;
LABEL_10:
      _os_log_impl(&dword_1AAB61000, v15, v16, v14, (uint8_t *)&v18, v17);

    }
  }
  else if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v13;
      v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request cancelled for asset uuid %{public}@";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = self;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v8;
    v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request failed for asset uuid %{public}@ with e"
          "rror: %{public}@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 32;
    goto LABEL_10;
  }

  -[PUActivitySharingController setResourcesPreheatRequest:](self, "setResourcesPreheatRequest:", 0);
}

- (void)_cancelPreheatResourcesRequest
{
  void *v3;

  -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRetrievalRequest");

  -[PUActivitySharingController setResourcesPreheatRequest:](self, "setResourcesPreheatRequest:", 0);
}

- (void)_updatePreheatResourcesRequest
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUActivitySharingController resourcesPreheatRequest](self, "resourcesPreheatRequest");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUActivitySharingController selectedAssets](self, "selectedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if ((v6 & 1) == 0)
      -[PUActivitySharingController _cancelPreheatResourcesRequest](self, "_cancelPreheatResourcesRequest");

  }
}

- (PXActivitySharingControllerDelegate)delegate
{
  return (PXActivitySharingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUActivitySharingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (NSDictionary)assetsFetchResultsByAssetCollection
{
  return self->_assetsFetchResultsByAssetCollection;
}

- (void)setAssetsFetchResultsByAssetCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)allowsAirPlayActivity
{
  return self->_allowsAirPlayActivity;
}

- (void)setAllowsAirPlayActivity:(BOOL)a3
{
  self->_allowsAirPlayActivity = a3;
}

- (BOOL)allowsSuggestLessPersonActivity
{
  return self->_allowsSuggestLessPersonActivity;
}

- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3
{
  self->_allowsSuggestLessPersonActivity = a3;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setCarouselViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carouselViewController, a3);
}

- (BOOL)excludeShareActivity
{
  return self->_excludeShareActivity;
}

- (PHResourceLocalAvailabilityRequest)resourcesPreheatRequest
{
  return self->_resourcesPreheatRequest;
}

- (void)setResourcesPreheatRequest:(id)a3
{
  objc_storeStrong((id *)&self->_resourcesPreheatRequest, a3);
}

- (PUActivityViewController)internalActivityViewController
{
  return (PUActivityViewController *)objc_loadWeakRetained((id *)&self->_internalActivityViewController);
}

- (void)setInternalActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_internalActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalActivityViewController);
  objc_storeStrong((id *)&self->_resourcesPreheatRequest, 0);
  objc_storeStrong((id *)&self->_carouselViewController, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_assetsFetchResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initialAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
}

void __48__PUActivitySharingController__preheatResources__block_invoke(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  char v14;

  v9 = a4;
  v10 = a5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v13 = a2;
  v14 = a3;
  v11 = v10;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v12);
}

void __48__PUActivitySharingController__preheatResources__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePreheatRequestCompletionWithSuccess:cancelled:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));

}

void __38__PUActivitySharingController__cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "activitySharingControllerDidCancel:", WeakRetained);

}

uint64_t __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestGraphReadyNotificationWithCoalescingIdentifier:completion:", 0, &__block_literal_global_3922);
}

void __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_160(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  v12 = objc_msgSend(WeakRetained, "allowsEmbedding");

  if ((v12 & 1) == 0)
  {
    v13 = objc_loadWeakRetained(v8);
    objc_msgSend(v13, "setAirDropDelegate:", 0);

  }
  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "_activityViewControllerDidCompleteWithActivityType:success:error:", v10, a3, v9);

}

void __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_2_162(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setReadyForInteraction:", 1);

  if (!*(_BYTE *)(a1 + 48))
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "_preheatResources");

  }
}

@end
