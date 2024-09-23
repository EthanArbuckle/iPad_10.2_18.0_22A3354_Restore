@implementation PUAvalancheReviewController

- (PUAvalancheReviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 154, CFSTR("%s is not available as initializer"), "-[PUAvalancheReviewController initWithNibName:bundle:]");

  abort();
}

- (PUAvalancheReviewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 158, CFSTR("%s is not available as initializer"), "-[PUAvalancheReviewController initWithCoder:]");

  abort();
}

- (PUAvalancheReviewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 162, CFSTR("%s is not available as initializer"), "-[PUAvalancheReviewController init]");

  abort();
}

- (PUAvalancheReviewController)initWithSpec:(id)a3 startingAtAsset:(id)a4 inAvalanche:(id)a5 currentAssetContainer:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  PUAvalancheReviewController *v17;
  PLAvalanche **p_avalancheBeingReviewed;
  NSOrderedSet *v19;
  NSOrderedSet *initialFavorites;
  PHCachingImageManager *v21;
  PHCachingImageManager *cachingImageManager;
  PLAssetContainerList *v23;
  PLAssetContainerList *avalancheContainerList;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  PUAvalancheReviewController *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avalanche"));

    if (v14)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentAssetContainer"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"), v36);

  if (!v13)
    goto LABEL_12;
LABEL_3:
  if (!v14)
    goto LABEL_13;
LABEL_4:
  objc_msgSend(v13, "assets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexOfObject:", v12);

  if (v16 == 0x7FFFFFFFFFFFFFFFLL
    || (v37.receiver = self,
        v37.super_class = (Class)PUAvalancheReviewController,
        v17 = -[PUAvalancheReviewController initWithNibName:bundle:](&v37, sel_initWithNibName_bundle_, 0, 0),
        (self = v17) == 0))
  {
    v31 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v17->__spec, a3);
    p_avalancheBeingReviewed = &self->__avalancheBeingReviewed;
    objc_storeStrong((id *)&self->__avalancheBeingReviewed, a5);
    objc_storeStrong((id *)&self->__initialAsset, a4);
    objc_msgSend(v13, "userFavorites");
    v19 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    initialFavorites = self->__initialFavorites;
    self->__initialFavorites = v19;

    objc_storeStrong((id *)&self->__currentAssetContainer, a6);
    v21 = (PHCachingImageManager *)objc_opt_new();
    cachingImageManager = self->__cachingImageManager;
    self->__cachingImageManager = v21;

    v23 = (PLAssetContainerList *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71B18]), "initWithAssetContainer:", self->__avalancheBeingReviewed);
    avalancheContainerList = self->_avalancheContainerList;
    self->_avalancheContainerList = v23;

    PLOneUpGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[PLAvalanche uuid](*p_avalancheBeingReviewed, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAvalanche assets](*p_avalancheBeingReviewed, "assets");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      -[PLAssetContainerList containers](self->_avalancheContainerList, "containers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 138543874;
      v39 = v26;
      v40 = 2048;
      v41 = v28;
      v42 = 2048;
      v43 = v30;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "PUAvalanceReviewController: Init with item avalanche %{public}@, count: %lu, container count: %lu", buf, 0x20u);

    }
    self = self;
    v31 = self;
  }

  return v31;
}

- (PHFetchResult)assetCollectionsFetchResult
{
  PUAvalancheReviewController *v2;
  PHFetchResult *assetCollectionsFetchResult;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *resultsForAssetCollection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  PUAvalancheReviewController *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  PHFetchResult *v35;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v2 = self;
  v48 = *MEMORY[0x1E0C80C00];
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  if (!assetCollectionsFetchResult)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = 976;
    resultsForAssetCollection = v2->_resultsForAssetCollection;
    v2->_resultsForAssetCollection = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
    -[PUAvalancheReviewController avalancheContainerList](v2, "avalancheContainerList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99DE8];
    v11 = objc_msgSend(v9, "count");
    v12 = v10;
    v13 = v7;
    objc_msgSend(v12, "arrayWithCapacity:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v9;
    v16 = (void *)v14;
    obj = v15;
    v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v38)
    {
      v17 = *(_QWORD *)v40;
      v18 = 0x1E0CD1000uLL;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v21 = *(void **)(v18 + 952);
          objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "pl_PHAssetCollectionForAssetContainer:photoLibrary:includeTrash:", v20, v22, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v16, "addObject:", v23);
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v23, v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v5), "setObject:forKey:", v24, v23);
            PLOneUpGetLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v23, "uuid");
              v26 = v17;
              v27 = v16;
              v28 = v5;
              v29 = v13;
              v30 = v2;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 138543618;
              v44 = v31;
              v45 = 2048;
              v46 = v32;
              _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "PUAvalanceReviewController: Fetched assets for collection: %{public}@ with count: %lu", buf, 0x16u);

              v2 = v30;
              v13 = v29;
              v5 = v28;
              v16 = v27;
              v17 = v26;
              v18 = 0x1E0CD1000;
            }

          }
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v38);
    }

    objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", v16, &stru_1E58AD278);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v33, v13);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v2->_assetCollectionsFetchResult;
    v2->_assetCollectionsFetchResult = (PHFetchResult *)v34;

    assetCollectionsFetchResult = v2->_assetCollectionsFetchResult;
  }
  return assetCollectionsFetchResult;
}

- (id)assetsInAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    if (!self->_assetCollectionsFetchResult)
      v5 = -[PUAvalancheReviewController assetCollectionsFetchResult](self, "assetCollectionsFetchResult");
    -[NSMutableDictionary objectForKey:](self->_resultsForAssetCollection, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  PUPhotoPinchGestureRecognizer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUAvalancheReviewController _updateMainViewAnimated:](self, "_updateMainViewAnimated:", 0);
  -[PUAvalancheReviewController _updateBarItemsAnimated:](self, "_updateBarItemsAnimated:", 0);
  v3 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePhotoPinch_);
  -[PUPhotoPinchGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[PUAvalancheReviewController _setPhotoZoomPinchGestureRecognizer:](self, "_setPhotoZoomPinchGestureRecognizer:", v3);
  -[PUAvalancheReviewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PUAvalancheReviewController _initialAsset](self, "_initialAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageSize");
  PXSizeGetAspectRatio();
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCellAspectRatio:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUAvalancheReviewController _startPreheatingAllAssets](self, "_startPreheatingAllAssets");
}

- (void)dealloc
{
  objc_super v3;

  -[PUAvalancheReviewController _stopPreheatingAllAssets](self, "_stopPreheatingAllAssets");
  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", 0);
  -[PUPhotoPinchGestureRecognizer setDelegate:](self->__photoZoomPinchGestureRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setScrubberDelegate:", self);
  -[PUAvalancheReviewController _updateMainViewAnimated:](self, "_updateMainViewAnimated:", 0);
  -[PUAvalancheReviewController _reloadAvalancheDataWithAsset:](self, "_reloadAvalancheDataWithAsset:", self->__initialAsset);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAvalancheReviewController;
  -[PUAvalancheReviewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUAvalancheReviewController _updateCollectionViewLayoutInsets](self, "_updateCollectionViewLayoutInsets");
}

- (BOOL)pu_wantsToolbarVisible
{
  return 1;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *inFlightReferenceIndexPath;
  NSIndexPath *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)PUAvalancheReviewController;
  v7 = a4;
  -[PUAvalancheReviewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v8);
  v9 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  inFlightReferenceIndexPath = self->__inFlightReferenceIndexPath;
  self->__inFlightReferenceIndexPath = v9;
  v11 = v9;

  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E58A7A08;
  v13[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E58A7A08;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateEnabledNavigationBarItems
{
  id v2;

  -[PUAvalancheReviewController _doneBarButtonItem](self, "_doneBarButtonItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

}

- (void)_updateNavigationItemTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userFavorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    PULocalizedString(CFSTR("REVIEW_COUNT_PHOTOS_SELECTED_TITLE_TEXT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    PULocalizedStringWithValidatedFormat(v6, CFSTR("%lu"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PULocalizedString(CFSTR("EMPTY_REVIEW_TITLE_TEXT"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PUAvalancheReviewController navigationItem](self, "navigationItem", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);
  objc_msgSend(v7, "setPrompt:", 0);

}

- (void)_updateBarItemsAnimated:(BOOL)a3
{
  _BarButton *v4;
  void *v5;
  void *v6;
  void *v7;
  _BarButton *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *doneBarButtonItem;
  UIBarButtonItem *cancelBarButtonItem;
  _BarButton *v12;
  void *v13;
  void *v14;
  void *v15;
  _BarButton *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  void *v19;
  void *v20;
  void *v21;
  UIBarButtonItem *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!self->__doneBarButtonItem)
  {
    v4 = [_BarButton alloc];
    PULocalizedString(CFSTR("AVALANCHE_DONE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_BarButton initWithTitle:titleColor:backgroundColor:target:action:](v4, "initWithTitle:titleColor:backgroundColor:target:action:", v5, v6, v7, self, sel__handleDoneButton_);

    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);
    doneBarButtonItem = self->__doneBarButtonItem;
    self->__doneBarButtonItem = v9;

  }
  cancelBarButtonItem = self->__cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    v12 = [_BarButton alloc];
    PULocalizedString(CFSTR("AVALANCHE_CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_BarButton initWithTitle:titleColor:backgroundColor:target:action:](v12, "initWithTitle:titleColor:backgroundColor:target:action:", v13, v14, v15, self, sel__cancelReviewModeAction_);

    v17 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v16);
    v18 = self->__cancelBarButtonItem;
    self->__cancelBarButtonItem = v17;

    cancelBarButtonItem = self->__cancelBarButtonItem;
  }
  v23[0] = cancelBarButtonItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->__doneBarButtonItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLeftBarButtonItems:", v19);
  objc_msgSend(v21, "setRightBarButtonItems:", v20);
  -[PUAvalancheReviewController _updateNavigationItemTitle](self, "_updateNavigationItemTitle");

}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUAvalancheReviewCollectionViewLayout *v8;
  double v9;
  double v10;
  id v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  if (-[PUAvalancheReviewController isViewLoaded](self, "isViewLoaded", a3))
  {
    -[PUAvalancheReviewController _spec](self, "_spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    memset(v15, 0, sizeof(v15));
    -[PUAvalancheReviewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v16, v15);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoCollectionViewBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
    v8 = (PUAvalancheReviewCollectionViewLayout *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interItemSpacing");
    if (v8)
    {
      if (v7)
      {
LABEL_4:
        objc_msgSend(v7, "setFrame:", v16, v17);
        -[PUAvalancheReviewController _updateCollectionViewLayoutInsets](self, "_updateCollectionViewLayoutInsets");

        return;
      }
    }
    else
    {
      v10 = v9;
      v8 = objc_alloc_init(PUAvalancheReviewCollectionViewLayout);
      -[PUHorizontalCollectionViewLayout setInteritemSpacing:](v8, "setInteritemSpacing:", v10);
      -[PUHorizontalCollectionViewLayout setDelegate:](v8, "setDelegate:", self);
      objc_storeStrong((id *)&self->__collectionViewLayout, v8);
      if (v7)
        goto LABEL_4;
    }
    v11 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v7 = (void *)objc_msgSend(v11, "initWithFrame:collectionViewLayout:", v8, v16, v17);
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v7, "setAlwaysBounceHorizontal:", 1);
    objc_msgSend(v7, "setPagingEnabled:", 0);
    objc_msgSend(v7, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    objc_msgSend(v7, "setDataSource:", self);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v7, "setBackgroundColor:", v6);
    objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUAvalancheReviewCellIdentifier"));
    objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUAvalancheReviewBadgeKind"), CFSTR("PUAvalancheReviewBadgeIdentifier"));
    objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 2);
    v12 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapInMainCollectionView_);
    tapGestureRecognizer = self->__tapGestureRecognizer;
    self->__tapGestureRecognizer = v12;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->__tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->__tapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", self);
    objc_msgSend(v7, "addGestureRecognizer:", self->__tapGestureRecognizer);
    objc_storeStrong((id *)&self->__collectionView, v7);
    -[PUAvalancheReviewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->__collectionView);

    goto LABEL_4;
  }
}

- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  -[PUAvalancheReviewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (a3)
  {
    a3->origin.x = v9;
    a3->origin.y = v11;
    a3->size.width = v13;
    a3->size.height = v15;
  }
  if (a4)
  {
    -[PUAvalancheReviewController px_safeAreaInsets](self, "px_safeAreaInsets");
    UIEdgeInsetsMax();
    a4->top = v16;
    a4->left = v17;
    a4->bottom = v18;
    a4->right = v19;
  }
}

- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  void *v6;
  char *v7;
  id v8;

  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (char *)objc_msgSend(v6, "assetsCount");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7 - 1, 0);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v8);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease(v7);

}

- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  _BOOL8 v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "tag") + 1;
  objc_msgSend(v7, "setTag:", v9);
  -[PUAvalancheReviewController _photoZoomCell](self, "_photoZoomCell");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController _photosSharingTransitionContext](self, "_photosSharingTransitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyAssetIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v8);

  -[PUAvalancheReviewController _existingView](self, "_existingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  -[PUAvalancheReviewController _phAssetAtIndexPath:](self, "_phAssetAtIndexPath:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  v19 = v18;
  if (v10 == v7)
    v20 = 1;
  else
    v20 = v13;
  if (v10 == v7)
    objc_msgSend(v18, "setDeliveryMode:", 1);
  v21 = v10 == v7;
  v22 = v10 != v7;
  v23 = v21;
  objc_msgSend(v19, "setSynchronous:", v23);
  objc_msgSend(v19, "setNetworkAccessAllowed:", v22);
  objc_msgSend(v19, "setLoadingMode:", 0x40000);
  if ((v20 & 1) == 0)
  {
    objc_msgSend(v7, "frame");
    v16 = v24;
  }
  v25 = PUPixelSizeFromPointSize(v16);
  v27 = v26;
  objc_msgSend(v7, "photoView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController _cachingImageManager](self, "_cachingImageManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __69__PUAvalancheReviewController__updatePhotoForAsset_cell_atIndexPath___block_invoke;
  v33[3] = &unk_1E589D028;
  v35 = v29;
  v36 = v9;
  v34 = v7;
  v31 = v29;
  v32 = v7;
  objc_msgSend(v30, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, v19, v33, v25, v27);

}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "photoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPhotoSize:", v11, v13);
  objc_msgSend(v15, "setFillMode:", 1);
  objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insetContentCornerRadius");
  objc_msgSend(v15, "setCornerRadius:");

  objc_msgSend(v15, "setContinuousCorners:", 1);
  objc_msgSend(v7, "setSelected:", objc_msgSend(v17, "isUserFavorite:", v9));
  -[PUAvalancheReviewController _updatePhotoForAsset:cell:atIndexPath:](self, "_updatePhotoForAsset:cell:atIndexPath:", v9, v7, v6);

}

- (CGRect)selectionBadgeFrameForItemFrame:(CGRect)a3 atIndexPath:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUAvalancheReviewController _spec](self, "_spec", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionBadgeSize");
  v11 = v10;
  v13 = v12;

  -[PUAvalancheReviewController _spec](self, "_spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectionBadgeOffset");
  v16 = v15;
  v18 = v17;

  -[PUAvalancheReviewController _spec](self, "_spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "selectionBadgeCorner");

  if (v20 != 1)
  {
    v21 = y;
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    if (v20 == 4)
    {
      v28 = x;
      v29 = width;
      v30 = height;
    }
    else
    {
      v23 = height;
      v24 = *MEMORY[0x1E0C9D648];
      if (v20 == 2)
      {
        v25 = x;
        v26 = width;
        v27 = CGRectGetWidth(*(CGRect *)(&v21 - 1));
        v43.origin.x = v24;
        v43.origin.y = v22;
        v43.size.width = v11;
        v43.size.height = v13;
        v16 = v27 - CGRectGetWidth(v43) - v16;
        goto LABEL_8;
      }
      v31 = x;
      v41 = x;
      v42 = width;
      v32 = v21;
      v33 = width;
      v34 = v23;
      v40 = CGRectGetWidth(*(CGRect *)(&v21 - 1));
      v44.origin.x = v24;
      v44.origin.y = v22;
      v44.size.width = v11;
      v44.size.height = v13;
      v16 = v40 - CGRectGetWidth(v44) - v16;
      v28 = v41;
      v29 = v42;
      v21 = v32;
      v30 = v34;
    }
    v35 = CGRectGetHeight(*(CGRect *)(&v21 - 1));
    v45.origin.x = v16;
    v45.origin.y = v22;
    v45.size.width = v11;
    v45.size.height = v13;
    v18 = v35 - CGRectGetHeight(v45) - v18;
  }
LABEL_8:
  v36 = v16;
  v37 = v18;
  v38 = v11;
  v39 = v13;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (void)_handleTapAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _toggleCurrentPickStatusAtIndexPath:](self, "_toggleCurrentPickStatusAtIndexPath:", v6);
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0
    && objc_msgSend(v4, "isTracking"))
  {
    -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginInteractiveUpdate");
    -[PUAvalancheReviewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v6, 1);

  }
}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  id v17;

  v4 = a3;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v17);
  v6 = v5;
  v8 = v7;

  -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v11 = v10;
  objc_msgSend(v9, "itemsContentInset");
  v14 = v11 - fabs(v13);
  if (v6 > fabs(v12) && v6 < v14)
  {
    -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PUAvalancheReviewController _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", v16);

  }
}

- (void)_handlePhotoPinch:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
    {
      if (v4 == 1)
      {
        -[PUAvalancheReviewController _collectionView](self, "_collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "locationInView:", v7);
        -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v7, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
          goto LABEL_14;
        -[PUAvalancheReviewController _beginZoomingForCellAtIndexPath:](self, "_beginZoomingForCellAtIndexPath:", v5);

      }
      else
      {
        v7 = 0;
      }
      v5 = 0;
      goto LABEL_14;
    }
    -[PUAvalancheReviewController _photoZoomAnimator](self, "_photoZoomAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PUAvalancheReviewController _photoZoomCell](self, "_photoZoomCell");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "adjustedTranslationInView:", v7);
      v15 = v14;
      v17 = v16;
      objc_msgSend(v19, "adjustedScaleInView:", v7);
      objc_msgSend(v5, "updateWithTranslation:rotation:scale:", v15, v17, 0.0, v18);
      goto LABEL_14;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_14;
  }
  -[PUAvalancheReviewController _photoZoomAnimator](self, "_photoZoomAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PUAvalancheReviewController _endZoomingForCell](self, "_endZoomingForCell");
    goto LABEL_11;
  }
  -[PUAvalancheReviewController _photoZoomCell](self, "_photoZoomCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "adjustedTranslationVelocityInView:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v19, "adjustedScaleVelocityInView:", v7);
  objc_msgSend(v5, "finishWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:", 0, v9, v11, 0.0, v12);
LABEL_14:

}

- (id)_currentAsset
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", self->__collectionView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetsCount");
  if (objc_msgSend(v3, "item") >= v5)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v3, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_phAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PUAvalancheReviewController assetCollectionsFetchResult](self, "assetCollectionsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGSize)_sizeForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGSize result;

  v4 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PUAvalancheReviewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v38, &v36);
  v9 = *(double *)&v39 - (*((double *)&v36 + 1) + *((double *)&v37 + 1));
  v10 = *((double *)&v39 + 1) - (*(double *)&v36 + *(double *)&v37);
  objc_msgSend(v8, "imageSize");
  v12 = v11;
  v14 = v13;
  -[PUAvalancheReviewController _spec](self, "_spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interItemSpacing");
  v17 = v16;

  v18 = v9 + v17 * -4.0;
  v19 = v10 + v17 * -2.0;
  -[PUAvalancheReviewController _spec](self, "_spec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectionBadgeSize");
  v22 = v21;
  -[PUAvalancheReviewController _spec](self, "_spec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "selectionBadgeOffset");
  v25 = v22 + v24 * 2.0;

  PURectWithSizeThatFitsInRect(v12, v14, 0.0, 0.0, v18, v19);
  if (v27 < v25 && v14 < v12)
  {
    v26 = v26 * (v25 / v27);
    v27 = v25;
  }
  if (v26 < v25 && v12 < v14)
  {
    v27 = v27 * (v25 / v26);
    v26 = v25;
  }
  if (v26 >= v25)
    v30 = v26;
  else
    v30 = v25;
  if (v18 < v30)
    v30 = v18;
  if (v27 >= v25)
    v31 = v27;
  else
    v31 = v25;
  if (v19 < v31)
    v31 = v19;
  v32 = round(v30);
  v33 = round(v31);

  v34 = v32;
  v35 = v33;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  v8 = v7;
  -[PUAvalancheReviewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v11, v6);
  v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
}

- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v10;
  CGRect v12;
  CGRect v13;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  -[PUAvalancheReviewController _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v4, 0, MidX, CGRectGetMidY(v13));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;
  objc_msgSend(v5, "bounds");
  v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a4.y;
  x = a4.x;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "visibleCells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v10 = 0;
      v14 = *(_QWORD *)v25;
      v15 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v8, "indexPathForCell:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v18) & 1) == 0)
          {
            objc_msgSend(v17, "center");
            v21 = (v20 - y) * (v20 - y) + (v19 - x) * (v19 - x);
            if (v21 < v15)
            {
              v22 = v18;

              v15 = v21;
              v10 = v22;
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  PUPhotosSharingSelectionView *v6;
  id v7;
  PUPhotosSharingSelectionView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a4)
  {
    objc_msgSend(a4, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("PUAvalancheReviewBadgeKind"), CFSTR("PUAvalancheReviewBadgeIdentifier"), a3);
    v6 = (PUPhotosSharingSelectionView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3;
    v6 = objc_alloc_init(PUPhotosSharingSelectionView);
  }
  v8 = v6;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a3, "item");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosSharingSelectionView setSelected:](v8, "setSelected:", objc_msgSend(v9, "isUserFavorite:", v12));
  return v8;
}

- (void)_updateCollectionViewLayoutInsets
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUAvalancheReviewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v16, &v14);
  v12 = 0;
  v13 = 0;
  -[PUAvalancheReviewController _getFirstValidIndexPath:lastValidIndexPath:](self, "_getFirstValidIndexPath:lastValidIndexPath:", &v13, &v12);
  v3 = v13;
  v4 = v12;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v9 = *((double *)&v14 + 1);
    v11 = *((double *)&v15 + 1);
  }
  else
  {
    -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v3);
    v8 = v7;
    -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v5);
    v9 = *((double *)&v14 + 1) + round((*(double *)&v17 - v8) * 0.5);
    v11 = *((double *)&v15 + 1) + round((*(double *)&v17 - v10) * 0.5);
    *((double *)&v14 + 1) = v9;
    *((double *)&v15 + 1) = v11;
  }
  -[PUHorizontalCollectionViewLayout setItemsContentInset:](self->__collectionViewLayout, "setItemsContentInset:", *(double *)&v14, v9, *(double *)&v15, v11);

}

- (void)_beginZoomingForCellAtIndexPath:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PUPhotosZoomingSharingGridCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PUTransitionViewAnimator *v26;
  uint64_t v27;
  uint64_t v28;
  PUTransitionViewAnimator *v29;
  void *v30;
  id v31;

  v31 = a3;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 793, CFSTR("expected index path"));

  }
  -[PUAvalancheReviewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController _photoZoomPinchGestureRecognizer](self, "_photoZoomPinchGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", v6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "setInitialPinchRect:");
  -[PUAvalancheReviewController _spec](self, "_spec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "selectionBadgeCorner");

  -[PUAvalancheReviewController _selectionViewAtIndexPath:forCollectionView:](self, "_selectionViewAtIndexPath:forCollectionView:", v31, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", v31, v11, v13, v15, v17);
  objc_msgSend(v20, "setFrame:");
  v21 = -[PUPhotosZoomingSharingGridCell initWithFrame:selectionView:optionView:layoutAnchor:]([PUPhotosZoomingSharingGridCell alloc], "initWithFrame:selectionView:optionView:layoutAnchor:", v20, 0, v19, v11, v13, v15, v17);
  -[PUAvalancheReviewController _setPhotoZoomCell:](self, "_setPhotoZoomCell:", v21);
  -[PUAvalancheReviewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v21, v31);
  objc_msgSend(v6, "addSubview:", v21);
  -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setZoomingCellIndexPath:", v31);

  -[PUAvalancheReviewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUserInteractionEnabled:", 0);

  -[PUAvalancheReviewController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "navigationBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUserInteractionEnabled:", 0);

  v26 = [PUTransitionViewAnimator alloc];
  UIRectGetCenter();
  v29 = -[PUTransitionViewAnimator initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:](v26, "initWithView:sourceFrame:targetFrame:anchorPoint:shouldUseTargetAspectRatio:rampUpDuration:direction:", v21, 1, 0, v11, v13, v15, v17, v11, v13, v15, v17, v27, v28, 0x3FB999999999999ALL);
  -[PUTransitionViewAnimator setAppliesScaleViaTransform:](v29, "setAppliesScaleViaTransform:", 0);
  -[PUTransitionViewAnimator setDelegate:](v29, "setDelegate:", self);
  -[PUAvalancheReviewController _setPhotoZoomAnimator:](self, "_setPhotoZoomAnimator:", v29);

}

- (void)_endZoomingForCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUAvalancheReviewController _photoZoomCell](self, "_photoZoomCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[PUAvalancheReviewController _setPhotoZoomCell:](self, "_setPhotoZoomCell:", 0);
  -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZoomingCellIndexPath:", 0);

  -[PUAvalancheReviewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[PUAvalancheReviewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  -[PUAvalancheReviewController _photoZoomAnimator](self, "_photoZoomAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  -[PUAvalancheReviewController _setPhotoZoomAnimator:](self, "_setPhotoZoomAnimator:", 0);
}

- (PUReviewScrubber)_reviewScrubber
{
  void *v2;
  void *v3;
  id v4;

  -[PUAvalancheReviewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (PUReviewScrubber *)v4;
}

- (unsigned)reviewScrubberImageFormat
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "largestUncroppedNonJPEGThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "formatID");

  return v4;
}

- (void)_updateReviewScrubberFromContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", self->__collectionView);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v12);
  v4 = v3;
  -[UICollectionView contentOffset](self->__collectionView, "contentOffset");
  v6 = v5;
  -[UICollectionView contentInset](self->__collectionView, "contentInset");
  v8 = v6 - v7;
  -[PUAvalancheReviewControllerSpec interItemSpacing](self->__spec, "interItemSpacing");
  v10 = v8 / (v4 + v9);
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithAbsoluteProgress:", v10);

}

- (void)_reloadAvalancheDataWithAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v14, "userFavorites");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "indexOfObject:", v8);

  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v6;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedIndexPath:", v11);

  -[PUAvalancheReviewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v11, 0);
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)_promoteFavoriteAssetsAndDeleteNonPicks:(BOOL)a3 withReviewCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PUAvalancheReviewController *v11;
  id v12;
  _QWORD *v13;
  BOOL v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__14958;
  v15[4] = __Block_byref_object_dispose__14959;
  -[PUAvalancheReviewController _currentAsset](self, "_currentAsset");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "canPerformEditOperation:", 1) & 1) != 0)
  {
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke;
    v9[3] = &unk_1E589D078;
    v14 = a3;
    v10 = v7;
    v11 = self;
    v13 = v15;
    v12 = v6;
    objc_msgSend(v8, "performTransaction:", v9);

  }
  _Block_object_dispose(v15, 8);

}

- (void)_toggleCurrentPickStatusAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "isUserFavorite:", v7))
    goto LABEL_8;
  objc_msgSend(v5, "proposedStackAssetAfterRemovingFavorite:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  objc_msgSend(v7, "albums");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 2)
  {
LABEL_8:
    -[PUAvalancheReviewController _reallyToggleCurrentPickStatusAtIndexPath:](self, "_reallyToggleCurrentPickStatusAtIndexPath:", v4);
    goto LABEL_9;
  }
  objc_msgSend(v7, "albums");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "count");

  v48[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedHidePhotosEverywhereWarning();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLLocalizedFrameworkString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedFrameworkString();
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v16, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0DC3448];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __67__PUAvalancheReviewController__toggleCurrentPickStatusAtIndexPath___block_invoke;
  v46[3] = &unk_1E58A4748;
  v46[4] = self;
  v20 = v4;
  v47 = v20;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v15, 2, v46);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v21);

  objc_msgSend(v17, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cellForItemAtIndexPath:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[PUAvalancheReviewController navigationController](self, "navigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v44 = v15;
    v34 = v14;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertRect:toView:", v35, v26, v28, v30, v32);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    v14 = v34;
    v15 = v44;

    objc_msgSend(v22, "setSourceView:", v24);
    objc_msgSend(v22, "setSourceRect:", v37, v39, v41, v43);

  }
  -[PUAvalancheReviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

LABEL_9:
}

- (void)_reallyToggleCurrentPickStatusAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v13, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isUserFavorite:", v6);
  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleIndexPath:animated:", v13, 0);
  if (v7)
    objc_msgSend(v4, "removeUserFavorite:", v6);
  else
    objc_msgSend(v4, "addUserFavorite:", v6);
  v9 = v7 ^ 1u;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellForItemAtIndexPath:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelected:", v9);
  objc_msgSend(v10, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUAvalancheReviewBadgeKind"), v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelected:", v9);
  objc_msgSend(v8, "reloadIndexPath:animated:", v13, 0);
  -[PUAvalancheReviewController _updateNavigationItemTitle](self, "_updateNavigationItemTitle");
  -[PUAvalancheReviewController _updateEnabledNavigationBarItems](self, "_updateEnabledNavigationBarItems");

}

- (void)_dismissReviewControllerWithAsset:(id)a3
{
  PLAvalanche *avalancheBeingReviewed;
  void *v5;
  id v6;

  v6 = a3;
  avalancheBeingReviewed = self->__avalancheBeingReviewed;
  -[PUAvalancheReviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "avalancheReviewControllerDidComplete:withAsset:animated:", self, v6, avalancheBeingReviewed != 0);

}

- (void)_finishReviewAndDeleteNonPicks:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  self->__completingReviewMode = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PUAvalancheReviewController__finishReviewAndDeleteNonPicks___block_invoke;
  aBlock[3] = &unk_1E589D0A0;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  -[PUAvalancheReviewController _promoteFavoriteAssetsAndDeleteNonPicks:withReviewCompletionHandler:](self, "_promoteFavoriteAssetsAndDeleteNonPicks:withReviewCompletionHandler:", v3, v5);

}

- (void)_handleDoneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];

  v4 = a3;
  -[PUAvalancheReviewController _initialFavorites](self, "_initialFavorites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userFavorites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  if (objc_msgSend(v8, "count"))
    v14 = 0;
  else
    v14 = objc_msgSend(v13, "count") != 0;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assetsCount");

  v17 = objc_msgSend(v13, "count");
  if (v14 && (v18 = v17, v17 >= 1) && (v19 = v16 - v17, v19 >= 1))
  {
    v34 = v4;
    if (v19 == 1)
    {
      PULocalizedString(CFSTR("AVALANCHE_KEEP_OTHER_PHOTO_TITLE"));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PULocalizedString(CFSTR("AVALANCHE_KEEP_OTHER_COUNT_PHOTOS_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedStringWithValidatedFormat(v20, CFSTR("%lu"));
      v21 = objc_claimAutoreleasedReturnValue();

    }
    v33 = (void *)v21;
    PULocalizedString(CFSTR("AVALANCHE_KEEP_ONLY_COUNT_FAVORITES"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    PULocalizedStringWithValidatedFormat(v22, CFSTR("%lu"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    PULocalizedString(CFSTR("AVALANCHE_KEEP_EVERYTHING"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("CANCEL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v21, 0, 0, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v25, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:", v27);

    v28 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __49__PUAvalancheReviewController__handleDoneButton___block_invoke;
    v36[3] = &unk_1E58A8DE8;
    v36[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v24, 0, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:", v29);

    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = __49__PUAvalancheReviewController__handleDoneButton___block_invoke_2;
    v35[3] = &unk_1E58A8DE8;
    v35[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v23, 0, v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:", v30);

    -[PUAvalancheReviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);
    objc_msgSend(v26, "popoverPresentationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPermittedArrowDirections:", 15);
    v4 = v34;
    objc_msgSend(v31, "setBarButtonItem:", v34);

  }
  else
  {
    -[PUAvalancheReviewController _finishReviewAndDeleteNonPicks:](self, "_finishReviewAndDeleteNonPicks:", 0);
  }

}

- (void)_cancelReviewMode
{
  void *v3;
  void *v4;
  id v5;

  -[PUAvalancheReviewController _updateBarItemsAnimated:](self, "_updateBarItemsAnimated:", 1);
  -[PUAvalancheReviewController _initialAsset](self, "_initialAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_PHAssetFromPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _dismissReviewControllerWithAsset:](self, "_dismissReviewControllerWithAsset:", v4);

}

- (void)pu_assetContainerDidChange:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 completingReviewMode;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  PLAvalanche **p_avalancheBeingReviewed;
  uint64_t v14;
  void *v15;
  PLAvalanche *v16;
  PHFetchResult *assetCollectionsFetchResult;
  NSMutableDictionary *resultsForAssetCollection;
  NSObject *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "assetContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _currentAssetContainer](self, "_currentAssetContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    completingReviewMode = self->__completingReviewMode;

    if (!completingReviewMode)
    {
      -[PUAvalancheReviewController _currentAsset](self, "_currentAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x1E0D715B8]);
      objc_msgSend(v7, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithUUID:photoLibrary:", v9, v11);

      p_avalancheBeingReviewed = &self->__avalancheBeingReviewed;
      objc_storeStrong((id *)&self->__avalancheBeingReviewed, v12);
      v14 = objc_msgSend(v12, "assetsCount");
      if (v14)
      {
        -[PUAvalancheReviewController _currentAsset](self, "_currentAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAvalancheReviewController _reloadAvalancheDataWithAsset:](self, "_reloadAvalancheDataWithAsset:", v15);

        -[PUAvalancheReviewController _updatePreheatedAssets](self, "_updatePreheatedAssets");
      }
      else
      {
        v16 = *p_avalancheBeingReviewed;
        *p_avalancheBeingReviewed = 0;

        -[PUAvalancheReviewController _cancelReviewMode](self, "_cancelReviewMode");
      }
      assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
      self->_assetCollectionsFetchResult = 0;

      resultsForAssetCollection = self->_resultsForAssetCollection;
      self->_resultsForAssetCollection = 0;

      PLOneUpGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = v9;
        v22 = 2048;
        v23 = v14;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "PUAvalanceReviewController: Invalidated asset collection fetch result for avalanche: %{public}@ with new asset count: %lu", (uint8_t *)&v20, 0x16u);
      }

    }
  }
  else
  {

  }
}

- (void)_stopPreheatingAllAssets
{
  -[PHCachingImageManager stopCachingImagesForAllAssets](self->__cachingImageManager, "stopCachingImagesForAllAssets");
}

- (void)_startPreheatingAllAssets
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assetsCount");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  -[PUAvalancheReviewController _cachingImageManager](self, "_cachingImageManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _initialAsset](self, "_initialAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      if ((uint64_t)(i + v10) >= v4)
      {
        v17 = 0;
        v12 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v12);
        v14 = PUPixelSizeFromPointSize(v13);
        v16 = v15;
        -[PUAvalancheReviewController _phAssetAtIndexPath:](self, "_phAssetAtIndexPath:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "startCachingImagesForAssets:targetSize:contentMode:options:", v18, 0, v5, v14, v16);

      }
      if (((v10 - i) & 0x8000000000000000) != 0)
      {

        if ((uint64_t)(i + v10) >= v4)
          break;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v19);
        v21 = PUPixelSizeFromPointSize(v20);
        v23 = v22;
        -[PUAvalancheReviewController _phAssetAtIndexPath:](self, "_phAssetAtIndexPath:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "startCachingImagesForAssets:targetSize:contentMode:options:", v25, 0, v5, v21, v23);

      }
    }
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginInteractiveUpdate");

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;

  -[PUAvalancheReviewController _updatePreheatedAssets](self, "_updatePreheatedAssets", a3);
  -[PUAvalancheReviewController _photosSharingTransitionContext](self, "_photosSharingTransitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (!self->__updatingContentOffsetFromScrubbing)
  {
    -[PUAvalancheReviewController _updateReviewScrubberFromContentOffset](self, "_updateReviewScrubberFromContentOffset");
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v4;

  if (!a4)
  {
    -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishInteractiveUpdate");

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3;

  -[PUAvalancheReviewController _reviewScrubber](self, "_reviewScrubber", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishInteractiveUpdate");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  double width;
  double height;
  double v11;
  double y;
  double MidX;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;

  x = a4.x;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "bounds");
  width = v36.size.width;
  height = v36.size.height;
  v11 = a5->x;
  y = a5->y;
  v36.origin.x = a5->x;
  v36.origin.y = y;
  MidX = CGRectGetMidX(v36);
  objc_msgSend(v8, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutAttributesForElementsInRect:", v11, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    v20 = 1.79769313e308;
    v21 = 1.79769313e308;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v22);
        objc_msgSend(v23, "indexPath", (_QWORD)v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "representedElementCategory"))
        {
          if ((-[PUAvalancheReviewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v8, v24), v26 = v25, x == 0.0)|| x > 0.0 && v25 > a5->x|| x < 0.0 && v25 < a5->x)
          {
            objc_msgSend(v23, "center");
            v28 = vabdd_f64(v27, MidX);
            if (v28 < v20)
            {
              v20 = v28;
              v21 = v26;
            }
          }
        }

        ++v22;
      }
      while (v18 != v22);
      v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v18 = v29;
    }
    while (v29);

    if (v21 != 1.79769313e308)
    {
      a5->x = v21;
      a5->y = 0.0;
    }
  }
  else
  {

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetsCount");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUAvalancheReviewCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v7, v6);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("PUAvalancheReviewBadgeKind")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAvalancheReviewController.m"), 1220, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUAvalancheReviewController _selectionViewAtIndexPath:forCollectionView:](self, "_selectionViewAtIndexPath:forCollectionView:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", a5, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)layout:(id)a3 collectionView:(id)a4 selectionBadgeFrameForItemFrame:(CGRect)a5 atIndexPath:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[PUAvalancheReviewController selectionBadgeFrameForItemFrame:atIndexPath:](self, "selectionBadgeFrameForItemFrame:atIndexPath:", a6, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)reviewScrubber:(id)a3 willDisplayCell:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "item");

  objc_msgSend(v12, "objectAtIndex:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSuggested:", objc_msgSend(v11, "isAutoPick:", v14));
  objc_msgSend(v8, "setFavorite:", objc_msgSend(v11, "isUserFavorite:", v14));
  v15 = objc_msgSend(v10, "isMinibar");

  objc_msgSend(v8, "setWantsSmallSuggestionIndicators:", v15);
  v16 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v16);
  v17 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v17, "setAllowPlaceholder:", 1);
  objc_msgSend(v17, "setDeliveryMode:", 1);
  objc_msgSend(v17, "setLoadingMode:", 0x40000);
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", -[PUAvalancheReviewController reviewScrubberImageFormat](self, "reviewScrubberImageFormat"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v18, "contentMode");
  objc_msgSend(v18, "sizeWithFallBackSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v20 = v19;
  v22 = v21;
  v23 = objc_alloc(MEMORY[0x1E0CD1428]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithPLManagedObject:photoLibrary:", v14, v24);

  v26 = *MEMORY[0x1E0CD19C0];
  v35[0] = *MEMORY[0x1E0CD1960];
  v35[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v25, "newObjectWithPropertySets:", v27);

  objc_msgSend(v17, "setSynchronous:", 1);
  -[PUAvalancheReviewController _cachingImageManager](self, "_cachingImageManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __74__PUAvalancheReviewController_reviewScrubber_willDisplayCell_atIndexPath___block_invoke;
  v32[3] = &unk_1E589EFC0;
  v33 = v8;
  v34 = v16;
  v30 = v8;
  objc_msgSend(v29, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v28, v31, v17, v32, v20, v22);

}

- (void)reviewScrubberDidScrub:(id)a3
{
  UICollectionView *collectionView;
  id v5;
  id v6;

  collectionView = self->__collectionView;
  v5 = a3;
  -[UICollectionView _stopScrollingAndZoomingAnimations](collectionView, "_stopScrollingAndZoomingAnimations");
  self->__updatingContentOffsetFromScrubbing = 1;
  objc_msgSend(v5, "selectedIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v6, 0);
  self->__updatingContentOffsetFromScrubbing = 0;

}

- (void)reviewScrubberDidSelectItemAtIndexPath:(id)a3
{
  UICollectionView *collectionView;
  id v5;

  collectionView = self->__collectionView;
  v5 = a3;
  -[UICollectionView _stopScrollingAndZoomingAnimations](collectionView, "_stopScrollingAndZoomingAnimations");
  -[PUAvalancheReviewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v5, 1);

}

- (unint64_t)reviewScrubber:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  void *v4;
  unint64_t v5;

  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetsCount");

  return v5;
}

- (BOOL)reviewScrubber:(id)a3 shouldProvideFeedbackForCellAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[PUAvalancheReviewController _avalancheBeingReviewed](self, "_avalancheBeingReviewed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v6, "isAutoPick:", v9);
  return (char)v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint v18;
  CGRect v19;

  v4 = a3;
  -[PUAvalancheReviewController _photoZoomPinchGestureRecognizer](self, "_photoZoomPinchGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isDragging") & 1) != 0 || (objc_msgSend(v7, "isDecelerating") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[PUAvalancheReviewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v16, &v14);
      v8 = *(double *)&v16 + *((double *)&v14 + 1);
      v9 = *((double *)&v16 + 1) + *(double *)&v14;
      v10 = *(double *)&v17 - (*((double *)&v14 + 1) + *((double *)&v15 + 1));
      v11 = *((double *)&v17 + 1) - (*(double *)&v14 + *(double *)&v15);
      objc_msgSend(v4, "locationInView:", v7);
      v18.y = v12;
      v19.origin.x = v8;
      v19.origin.y = v9;
      v19.size.width = v10;
      v19.size.height = v11;
      v18.x = v8;
      v6 = CGRectContainsPoint(v19, v18);
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UITapGestureRecognizer *v7;
  void *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  char v10;
  id v11;

  v6 = a4;
  v7 = (UITapGestureRecognizer *)a3;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tapGestureRecognizer = self->__tapGestureRecognizer;

  if (tapGestureRecognizer == v7)
  {
    objc_msgSend(v8, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
      v10 = objc_msgSend(v8, "isDecelerating");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
  PUPhotosSharingTransitionContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (PUPhotosSharingTransitionContext *)a3;
  if (self->__photosSharingTransitionContext != v5)
  {
    objc_storeStrong((id *)&self->__photosSharingTransitionContext, a3);
    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "visibleCells", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v6, "indexPathForCell:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAvalancheReviewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v12, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)setOneUpPhotosSharingTransitionInfo:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PUAssetTransitionInfo *v12;

  v12 = (PUAssetTransitionInfo *)a3;
  if (self->__assetTransitionInfo != v12)
  {
    objc_storeStrong((id *)&self->__assetTransitionInfo, a3);
    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "photoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetTransitionInfo image](v12, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaceHolderImage:", v11);

  }
}

- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[PUAvalancheReviewController _transitionLayout](self, "_transitionLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__transitionLayout, a3);
    if (v12)
    {
      v9 = v12;
    }
    else
    {
      -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[PUAvalancheReviewController _collectionView](self, "_collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionViewLayout:animated:", v10, v4);

    v8 = v12;
  }

}

- (id)embeddedActivityView
{
  return 0;
}

- (CGRect)embeddedActivityViewFrameWhenShowing:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[PUAvalancheReviewController _collectionViewLayout](self, "_collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:fromView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[PUAvalancheReviewController _collectionView](self, "_collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(id, void *);
  _QWORD v34[4];
  id v35;
  PUAvalancheReviewController *v36;
  id v37;

  v33 = (void (**)(id, void *))a4;
  -[PUAvalancheReviewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PUAvalancheReviewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", self->__collectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](self->__collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAvalancheReviewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v6, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v15, v17, v19);
  objc_msgSend(v20, "setImage:", v10);
  objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insetContentCornerRadius");
  v23 = v22;
  objc_msgSend(v20, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v23);

  v25 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v20, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerCurve:", v25);

  objc_msgSend(v20, "setClipsToBounds:", 1);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __91__PUAvalancheReviewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  v34[3] = &unk_1E58A9EA0;
  v27 = v10;
  v35 = v27;
  v36 = self;
  v28 = v6;
  v37 = v28;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAvalancheReviewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:", 0, v30, v20, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "oneUpTransitionContextWithContextShouldHideBackground:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    v33[2](v33, v32);

}

- (void)_resetPreheating
{
  -[PUAvalancheReviewController _stopPreheatingAllAssets](self, "_stopPreheatingAllAssets");
  -[PUAvalancheReviewController _startPreheatingAllAssets](self, "_startPreheatingAllAssets");
  -[PUAvalancheReviewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUAvalancheReviewController _setPreheatedAssets:](self, "_setPreheatedAssets:", 0);
  -[PUAvalancheReviewController _setAssetsToSizeDictionary:](self, "_setAssetsToSizeDictionary:", 0);
}

- (void)_updatePreheatedAssets
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  NSMutableDictionary *assetsToSizeDictionary;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id obj;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v91 = *MEMORY[0x1E0C80C00];
  -[PUAvalancheReviewController _collectionView](self, "_collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->__transitionLayout)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    objc_msgSend(v3, "bounds");
    x = v92.origin.x;
    y = v92.origin.y;
    width = v92.size.width;
    height = v92.size.height;
    if (!CGRectIsEmpty(v92))
    {
      if ((unint64_t)(-[PUAvalancheReviewController interfaceOrientation](self, "interfaceOrientation") - 1) >= 2)
        v11 = height;
      else
        v11 = width;
      -[PUAvalancheReviewController _previousPreheatRect](self, "_previousPreheatRect");
      v13 = v12;
      v93.origin.x = x;
      v93.origin.y = y;
      v93.size.width = width;
      v93.size.height = height;
      v94 = CGRectInset(v93, v11 * -2.0, 0.0);
      v14 = v94.origin.x;
      v15 = v94.origin.y;
      v16 = v94.origin.x - v13;
      if (v16 < 0.0)
        v16 = -v16;
      if (v16 > v11 / 3.0)
      {
        v17 = v94.size.width;
        v18 = v94.size.height;
        if (-[PUAvalancheReviewController px_isVisible](self, "px_isVisible"))
        {
          -[PUAvalancheReviewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v14, v15, v17, v18);
          objc_msgSend(v3, "collectionViewLayout");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "layoutAttributesForElementsInRect:", v14, v15, v17, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v20, "count"));
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v22 = v20;
          v23 = (void *)v21;
          obj = v22;
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v82;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v82 != v26)
                  objc_enumerationMutation(obj);
                v28 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                if (!objc_msgSend(v28, "representedElementCategory"))
                {
                  objc_msgSend(v28, "indexPath");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PUAvalancheReviewController _phAssetAtIndexPath:](self, "_phAssetAtIndexPath:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "addObject:", v30);
                  objc_msgSend(v71, "setObject:forKey:", v29, v30);

                }
              }
              v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
            }
            while (v25);
          }

          -[PUAvalancheReviewController _preheatedAssets](self, "_preheatedAssets");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAvalancheReviewController _setPreheatedAssets:](self, "_setPreheatedAssets:", v23);
          v32 = (void *)objc_msgSend(v23, "mutableCopy");
          objc_msgSend(v32, "minusSet:", v31);
          v67 = (void *)objc_msgSend(v31, "mutableCopy");
          objc_msgSend(v67, "minusSet:", v23);
          if (objc_msgSend(v32, "count") || objc_msgSend(v67, "count"))
          {
            v63 = v31;
            v65 = v5;
            v66 = v3;
            if (!self->__assetsToSizeDictionary)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUAvalancheReviewController _setAssetsToSizeDictionary:](self, "_setAssetsToSizeDictionary:", v33);

            }
            v64 = v23;
            v34 = (void *)objc_opt_new();
            objc_msgSend(v34, "setNetworkAccessAllowed:", 1);
            v72 = v34;
            objc_msgSend(v34, "setLoadingMode:", 0x40000);
            -[PUAvalancheReviewController _cachingImageManager](self, "_cachingImageManager");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v62 = v32;
            v68 = v32;
            v36 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v78;
              do
              {
                for (j = 0; j != v37; ++j)
                {
                  if (*(_QWORD *)v78 != v38)
                    objc_enumerationMutation(v68);
                  v40 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
                  objc_msgSend(v71, "objectForKeyedSubscript:", v40, v62);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PUAvalancheReviewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v41);
                  v43 = PUPixelSizeFromPointSize(v42);
                  v45 = v44;
                  v88 = v40;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "startCachingImagesForAssets:targetSize:contentMode:options:", v46, 0, v72, v43, v45);

                  assetsToSizeDictionary = self->__assetsToSizeDictionary;
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v43, v45);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](assetsToSizeDictionary, "setObject:forKey:", v48, v40);

                }
                v37 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
              }
              while (v37);
            }

            v49 = (void *)objc_opt_new();
            objc_msgSend(v49, "setNetworkAccessAllowed:", 1);
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v69 = v67;
            v50 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v74;
              do
              {
                for (k = 0; k != v51; ++k)
                {
                  if (*(_QWORD *)v74 != v52)
                    objc_enumerationMutation(v69);
                  v54 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
                  -[NSMutableDictionary objectForKeyedSubscript:](self->__assetsToSizeDictionary, "objectForKeyedSubscript:", v54, v62);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "CGSizeValue");
                  v57 = v56;
                  v59 = v58;

                  v86 = v54;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "stopCachingImagesForAssets:targetSize:contentMode:options:", v60, 0, v72, v57, v59);

                  -[NSMutableDictionary removeObjectForKey:](self->__assetsToSizeDictionary, "removeObjectForKey:", v54);
                  v85 = v54;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "startCachingImagesForAssets:targetSize:contentMode:options:", v61, 0, v49, v57, v59);

                }
                v51 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
              }
              while (v51);
            }

            v5 = v65;
            v3 = v66;
            v31 = v63;
            v23 = v64;
            v32 = v62;
          }

        }
      }
    }
  }

}

- (PUAvalancheReviewControllerDelegate)delegate
{
  return (PUAvalancheReviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUAvalancheReviewControllerSpec)_spec
{
  return self->__spec;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (PUAvalancheReviewCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UIBarButtonItem)_doneBarButtonItem
{
  return self->__doneBarButtonItem;
}

- (UIBarButtonItem)_cancelBarButtonItem
{
  return self->__cancelBarButtonItem;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (NSIndexPath)_inFlightReferenceIndexPath
{
  return self->__inFlightReferenceIndexPath;
}

- (BOOL)_updatingContentOffsetFromScrubbing
{
  return self->__updatingContentOffsetFromScrubbing;
}

- (BOOL)_completingReviewMode
{
  return self->__completingReviewMode;
}

- (void)set_completingReviewMode:(BOOL)a3
{
  self->__completingReviewMode = a3;
}

- (PLAvalanche)_avalancheBeingReviewed
{
  return self->__avalancheBeingReviewed;
}

- (PLManagedAsset)_initialAsset
{
  return self->__initialAsset;
}

- (NSOrderedSet)_initialFavorites
{
  return self->__initialFavorites;
}

- (PLAssetContainer)_currentAssetContainer
{
  return self->__currentAssetContainer;
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (CGRect)_previousPreheatRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__previousPreheatRect.origin.x;
  y = self->__previousPreheatRect.origin.y;
  width = self->__previousPreheatRect.size.width;
  height = self->__previousPreheatRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setPreviousPreheatRect:(CGRect)a3
{
  self->__previousPreheatRect = a3;
}

- (NSMutableSet)_preheatedAssets
{
  return self->__preheatedAssets;
}

- (void)_setPreheatedAssets:(id)a3
{
  objc_storeStrong((id *)&self->__preheatedAssets, a3);
}

- (NSMutableDictionary)_assetsToSizeDictionary
{
  return self->__assetsToSizeDictionary;
}

- (void)_setAssetsToSizeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->__assetsToSizeDictionary, a3);
}

- (PUPhotoPinchGestureRecognizer)_photoZoomPinchGestureRecognizer
{
  return self->__photoZoomPinchGestureRecognizer;
}

- (void)_setPhotoZoomPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__photoZoomPinchGestureRecognizer, a3);
}

- (PUTransitionViewAnimator)_photoZoomAnimator
{
  return self->__photoZoomAnimator;
}

- (void)_setPhotoZoomAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__photoZoomAnimator, a3);
}

- (PUPhotosZoomingSharingGridCell)_photoZoomCell
{
  return self->__photoZoomCell;
}

- (void)_setPhotoZoomCell:(id)a3
{
  objc_storeStrong((id *)&self->__photoZoomCell, a3);
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)_setTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__transitionLayout, a3);
}

- (PUPhotosSharingTransitionContext)_photosSharingTransitionContext
{
  return self->__photosSharingTransitionContext;
}

- (void)set_photosSharingTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->__photosSharingTransitionContext, a3);
}

- (PUAssetTransitionInfo)_assetTransitionInfo
{
  return self->__assetTransitionInfo;
}

- (void)set_assetTransitionInfo:(id)a3
{
  objc_storeStrong((id *)&self->__assetTransitionInfo, a3);
}

- (PLAssetContainerList)avalancheContainerList
{
  return self->_avalancheContainerList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avalancheContainerList, 0);
  objc_storeStrong((id *)&self->__assetTransitionInfo, 0);
  objc_storeStrong((id *)&self->__photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_storeStrong((id *)&self->__photoZoomCell, 0);
  objc_storeStrong((id *)&self->__photoZoomAnimator, 0);
  objc_storeStrong((id *)&self->__photoZoomPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__assetsToSizeDictionary, 0);
  objc_storeStrong((id *)&self->__preheatedAssets, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->__currentAssetContainer, 0);
  objc_storeStrong((id *)&self->__initialFavorites, 0);
  objc_storeStrong((id *)&self->__initialAsset, 0);
  objc_storeStrong((id *)&self->__avalancheBeingReviewed, 0);
  objc_storeStrong((id *)&self->__inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->__doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultsForAssetCollection, 0);
  objc_storeStrong((id *)&self->_assetCollectionsFetchResult, 0);
}

void __91__PUAvalancheReviewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(*(id *)(a1 + 40), "_phAssetAtIndexPath:", *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

}

void __74__PUAvalancheReviewController_reviewScrubber_willDisplayCell_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v3);

}

uint64_t __49__PUAvalancheReviewController__handleDoneButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishReviewAndDeleteNonPicks:", 0);
}

uint64_t __49__PUAvalancheReviewController__handleDoneButton___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishReviewAndDeleteNonPicks:", 1);
}

void __62__PUAvalancheReviewController__finishReviewAndDeleteNonPicks___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updateBarItemsAnimated:", 1);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_PHAssetFromPhotoLibrary:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_dismissReviewControllerWithAsset:", v6);
}

uint64_t __67__PUAvalancheReviewController__toggleCurrentPickStatusAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyToggleCurrentPickStatusAtIndexPath:", *(_QWORD *)(a1 + 40));
}

void __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_currentAssetContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E589D050;
  v8 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  objc_msgSend(v3, "applyChangesAndDeleteNonPicks:currentContainer:completionHandler:", v2, v4, v7);

}

uint64_t __99__PUAvalancheReviewController__promoteFavoriteAssetsAndDeleteNonPicks_withReviewCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isUserFavorite:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "stackAsset");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

void __69__PUAvalancheReviewController__updatePhotoForAsset_cell_atIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (v20 && objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v20, "size");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "photoImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    if (v9 >= v11)
    {

    }
    else
    {
      objc_msgSend(v20, "size");
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "photoImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v16 = v15;

      if (v13 < v16)
        goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "placeHolderImage");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_11;
    v18 = (void *)v17;
    objc_msgSend(*(id *)(a1 + 40), "placeHolderImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      v7 = 1;

    if ((v7 & 1) == 0)
LABEL_11:
      objc_msgSend(*(id *)(a1 + 40), "setPhotoImage:", v20);
  }
LABEL_12:

}

void __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateMainViewAnimated:", 0);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[131];
  if (v3)
  {
    objc_msgSend(v2, "_pageToIndexPath:animated:", v3, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1048);
    *(_QWORD *)(v4 + 1048) = 0;

  }
}

uint64_t __82__PUAvalancheReviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetPreheating");
}

@end
