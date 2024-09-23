@implementation PUAssetExplorerReviewScreenViewController

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9 reviewBarsModel:(id)a10 options:(unint64_t)a11
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  return -[PUAssetExplorerReviewScreenViewController initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:](self, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:", a3, a4, a5, a6, a7, a8, 0, a9, v12, a10, 0, a11);
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[PUAssetExplorerReviewScreenViewController initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:options:](self, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:options:", a3, a4, a5, a6, a7, a8, 0, a9, v10, 0);
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 options:(unint64_t)a12
{
  uint64_t v13;

  LOBYTE(v13) = a11;
  return -[PUAssetExplorerReviewScreenViewController initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:](self, "initWithDataSourceManager:mediaProvider:reviewAssetProvider:initialIndexPath:initialSelectedAssetUUIDs:initialDisabledLivePhotoAssetUUIDs:selectionCountLimit:sourceType:lowMemoryMode:reviewBarsModel:resizeTaskDescriptorViewModel:options:", a3, a4, a5, a6, a7, a8, a9, a10, v13, 0, 0, a12);
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 reviewBarsModel:(id)a12 resizeTaskDescriptorViewModel:(id)a13 options:(unint64_t)a14
{
  id v21;
  PUAssetExplorerReviewScreenViewController *v22;
  PUAssetExplorerReviewScreenViewController *v23;
  PUAssetExplorerReviewScreenAssetsDataSourceManager *v24;
  PUAssetExplorerReviewScreenAssetsDataSourceManager *reviewDataSourceManager;
  PUJoiningMediaProvider *v26;
  PUJoiningMediaProvider *reviewMediaProvider;
  PUReviewAssetsMediaProvider *v28;
  PUJoiningMediaProvider *v29;
  void *v30;
  uint64_t v31;
  NSSet *initialSelectedAssetUUIDs;
  uint64_t v33;
  NSSet *initialDisabledLivePhotoAssetUUIDs;
  NSMutableDictionary *v35;
  NSMutableDictionary *reviewAssetRequestsByUUID;
  NSMutableDictionary *v37;
  NSMutableDictionary *substituteAssetsByUUID;
  PUReviewScreenSpec *v39;
  PUReviewScreenSpec *spec;
  PUAssetExplorerReviewScreenViewController *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v48 = a4;
  v47 = a5;
  v46 = a6;
  v49 = a7;
  v21 = a8;
  v45 = a9;
  v44 = a12;
  v43 = a13;
  v51.receiver = self;
  v51.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  v22 = -[PUAssetExplorerReviewScreenViewController initWithNibName:bundle:](&v51, sel_initWithNibName_bundle_, 0, 0);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->__clientDataSourceManager, a3);
    objc_storeStrong((id *)&v23->__clientMediaProvider, a4);
    objc_storeStrong((id *)&v23->__reviewAssetProvider, a5);
    v24 = -[PUAssetExplorerReviewScreenAssetsDataSourceManager initWithOriginalDataSourceManager:]([PUAssetExplorerReviewScreenAssetsDataSourceManager alloc], "initWithOriginalDataSourceManager:", v50);
    reviewDataSourceManager = v23->__reviewDataSourceManager;
    v23->__reviewDataSourceManager = v24;

    v26 = objc_alloc_init(PUJoiningMediaProvider);
    reviewMediaProvider = v23->__reviewMediaProvider;
    v23->__reviewMediaProvider = v26;

    v28 = objc_alloc_init(PUReviewAssetsMediaProvider);
    -[PUJoiningMediaProvider registerMediaProvider:forAssetPassingTest:](v23->__reviewMediaProvider, "registerMediaProvider:forAssetPassingTest:", v28, &__block_literal_global_13215);
    v29 = v23->__reviewMediaProvider;
    -[PUAssetExplorerReviewScreenViewController _clientMediaProvider](v23, "_clientMediaProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUJoiningMediaProvider registerMediaProvider:forAssetClass:](v29, "registerMediaProvider:forAssetClass:", v30, objc_opt_class());

    objc_storeStrong((id *)&v23->_initialIndexPath, a6);
    v31 = objc_msgSend(v49, "copy");
    initialSelectedAssetUUIDs = v23->_initialSelectedAssetUUIDs;
    v23->_initialSelectedAssetUUIDs = (NSSet *)v31;

    v33 = objc_msgSend(v21, "copy");
    initialDisabledLivePhotoAssetUUIDs = v23->_initialDisabledLivePhotoAssetUUIDs;
    v23->_initialDisabledLivePhotoAssetUUIDs = (NSSet *)v33;

    objc_storeStrong((id *)&v23->_selectionCountLimit, a9);
    objc_storeStrong((id *)&v23->_reviewBarsModel, a12);
    objc_storeStrong((id *)&v23->_resizeTaskDescriptorViewModel, a13);
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reviewAssetRequestsByUUID = v23->__reviewAssetRequestsByUUID;
    v23->__reviewAssetRequestsByUUID = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    substituteAssetsByUUID = v23->__substituteAssetsByUUID;
    v23->__substituteAssetsByUUID = v37;

    v23->_sourceType = a10;
    v23->__lowMemoryMode = a11;
    v23->__options = a14;
    v39 = -[PUReviewScreenSpec initWithOptions:]([PUReviewScreenSpec alloc], "initWithOptions:", a14);
    spec = v23->__spec;
    v23->__spec = v39;

    v41 = v23;
  }

  return v23;
}

- (PUAssetExplorerAnalytics)assetExplorerAnalytics
{
  PUAssetExplorerAnalytics *assetExplorerAnalytics;
  PUAssetExplorerAnalytics *v4;
  PUAssetExplorerAnalytics *v5;

  assetExplorerAnalytics = self->_assetExplorerAnalytics;
  if (!assetExplorerAnalytics)
  {
    v4 = objc_alloc_init(PUAssetExplorerAnalytics);
    v5 = self->_assetExplorerAnalytics;
    self->_assetExplorerAnalytics = v4;

    assetExplorerAnalytics = self->_assetExplorerAnalytics;
  }
  return assetExplorerAnalytics;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $3E6F08A3C5806EFB334810DBFA26E1DE *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToDidPerformCompletionAction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressCancel = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressRetake = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanPerformActionType = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldEnableActionType = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillTransitionToSize = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToFileSizeMenu = objc_opt_respondsToSelector() & 1;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  unint64_t v5;
  PUOneUpViewController *v6;
  PUNavigationController *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  PUNavigationController *navigationController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  -[PUAssetExplorerReviewScreenViewController loadView](&v23, sel_loadView);
  -[PUAssetExplorerReviewScreenViewController _spec](self, "_spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _createBrowsingSessionIfNecessary](self, "_createBrowsingSessionIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  v6 = -[PUOneUpViewController initWithBrowsingSession:options:initialActivity:]([PUOneUpViewController alloc], "initWithBrowsingSession:options:initialActivity:", v4, objc_msgSend(v3, "oneUpOptions"), 2 * (v5 == 4));
  v7 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v6);
  -[PUAssetExplorerReviewScreenViewController addChildViewController:](self, "addChildViewController:", v7);
  -[PUAssetExplorerReviewScreenViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUNavigationController view](v7, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v17, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "addSubview:", v17);
  -[PUNavigationController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
  navigationController = self->__navigationController;
  self->__navigationController = v7;

  -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "selectedUUIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendEvent:view:source:currentAssetCount:", CFSTR("PUAssetExplorerAnalyticsEventOpen1Up"), 1, v5, objc_msgSend(v22, "count"));

}

- (id)_createBrowsingSessionIfNecessary
{
  PUBrowsingSession *browsingSession;
  void *v4;
  uint64_t v5;
  void *v6;
  PUAssetExplorerReviewScreenActionManager *v7;
  void *v8;
  uint64_t v9;
  id v10;
  PUBrowsingSession *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  PUAssetExplorerReviewScreenActionManager *actionManager;
  PUAssetExplorerReviewScreenActionManager *v24;
  PUBrowsingSession *v25;
  PUBrowsingSession *v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  PUAssetExplorerReviewScreenViewController *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;

  browsingSession = self->__browsingSession;
  if (!browsingSession)
  {
    -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _reviewMediaProvider](self, "_reviewMediaProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController initialSelectedAssetUUIDs](self, "initialSelectedAssetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController initialDisabledLivePhotoAssetUUIDs](self, "initialDisabledLivePhotoAssetUUIDs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUAssetExplorerReviewScreenActionManager initWithSourceType:]([PUAssetExplorerReviewScreenActionManager alloc], "initWithSourceType:", -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType"));
    -[PUAssetExplorerReviewScreenActionManager setReviewScreenActionManagerDelegate:](v7, "setReviewScreenActionManagerDelegate:", self);
    -[PUAssetExplorerReviewScreenActionManager setReviewAssetProvider:](v7, "setReviewAssetProvider:", self);
    -[PUAssetExplorerReviewScreenActionManager selectionManager](v7, "selectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke;
    v44[3] = &unk_1E589CD70;
    v10 = v6;
    v45 = v10;
    objc_msgSend(v8, "performChanges:", v44);
    v31 = v8;
    objc_msgSend(v8, "registerChangeObserver:context:", self, PUReviewScreenSelectionManagerObservationContext);
    -[PUAssetExplorerReviewScreenActionManager disableLivePhotosSelectionManager](v7, "disableLivePhotosSelectionManager");
    v42[0] = v9;
    v42[1] = 3221225472;
    v42[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_2;
    v42[3] = &unk_1E589CD70;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v33;
    v43 = v30;
    objc_msgSend(v29, "performChanges:", v42);
    v32 = (void *)v5;
    v11 = -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:]([PUBrowsingSession alloc], "initWithDataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:", v4, v7, v5, 0, -[PUAssetExplorerReviewScreenViewController _lowMemoryMode](self, "_lowMemoryMode"));
    -[PUAssetExplorerReviewScreenViewController initialIndexPath](self, "initialIndexPath");
    v12 = objc_claimAutoreleasedReturnValue();
    v34 = v4;
    objc_msgSend(v4, "assetsDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v28 = (void *)v12;
    if (v12)
      objc_msgSend(v13, "assetReferenceAtIndexPath:", v12);
    else
      objc_msgSend(v13, "startingAssetReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUBrowsingSession viewModel](v11, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_3;
    v37[3] = &unk_1E58A9AE0;
    v38 = v15;
    v39 = v16;
    v40 = self;
    v18 = v10;
    v41 = v18;
    v19 = v16;
    v20 = v15;
    objc_msgSend(v19, "performChanges:", v37);
    objc_msgSend(v19, "registerChangeObserver:", self);
    -[PUAssetExplorerReviewScreenViewController resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_4;
    v35[3] = &unk_1E589CD98;
    v35[4] = self;
    v36 = v18;
    v22 = v18;
    objc_msgSend(v21, "performChanges:", v35);

    actionManager = self->__actionManager;
    self->__actionManager = v7;
    v24 = v7;

    v25 = self->__browsingSession;
    self->__browsingSession = v11;
    v26 = v11;

    browsingSession = self->__browsingSession;
  }
  return browsingSession;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  -[PUAssetExplorerReviewScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self->_delegateFlags.respondsToWillTransitionToSize)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);

  }
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PUAssetExplorerReviewScreenViewController _navigationController](self, "_navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUAssetExplorerReviewScreenViewController _navigationController](self, "_navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUAssetExplorerReviewScreenViewController;
    -[PUAssetExplorerReviewScreenViewController childViewControllerForStatusBarStyle](&v6, sel_childViewControllerForStatusBarStyle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)childViewControllerForStatusBarHidden
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PUAssetExplorerReviewScreenViewController _navigationController](self, "_navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUAssetExplorerReviewScreenViewController _navigationController](self, "_navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUAssetExplorerReviewScreenViewController;
    -[PUAssetExplorerReviewScreenViewController childViewControllerForStatusBarHidden](&v6, sel_childViewControllerForStatusBarHidden);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_remainingReviewAssetRequests
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_reviewAssetRequestForAssetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_createReviewAssetRequestForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _reviewAssetProvider](self, "_reviewAssetProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reviewAssetProviderRequestForDisplayAsset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  }
  return v6;
}

- (void)_updateForCompletedReviewAssetRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "sourceAsset");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);
    v7 = objc_msgSend(v6, "count");
    -[PUAssetExplorerReviewScreenViewController _requestProgressController](self, "_requestProgressController");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v7 && v8)
    {
      -[PUAssetExplorerReviewScreenViewController _failedReviewAssetRequestAlertController](self, "_failedReviewAssetRequestAlertController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hideAnimated:allowDelay:", 1, 0);
      -[PUAssetExplorerReviewScreenViewController _tearDownProgressController](self, "_tearDownProgressController");
      if (!v10)
        -[PUAssetExplorerReviewScreenViewController _performCompletionAction:](self, "_performCompletionAction:", 0);

    }
  }

}

- (void)_cancelReviewAssetRequestForAssetUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancelReviewAssetRequest");
    objc_msgSend(v4, "removeObjectForKey:", v7);
  }

}

- (void)_cancelReviewAssetRequests
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestsByUUID](self, "_reviewAssetRequestsByUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_167_13184);
  objc_msgSend(v3, "removeAllObjects");

}

- (void)_requestReviewAssetForAsset:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _substituteAssetForUUID:](self, "_substituteAssetForUUID:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestForAssetUUID:](self, "_reviewAssetRequestForAssetUUID:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 | v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenViewController.m"), 480, CFSTR("We should not be trying to request an asset that we already have a file-backed asset for or for which we have a reviewAssetRequest in progress"));

  }
  -[PUAssetExplorerReviewScreenViewController _createReviewAssetRequestForAsset:](self, "_createReviewAssetRequestForAsset:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__PUAssetExplorerReviewScreenViewController__requestReviewAssetForAsset___block_invoke;
    v11[3] = &unk_1E589CE00;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v9, "requestReviewAssetWithCompletionHandler:", v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)_handleReviewAssetRequest:(id)a3 completedWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6 reviewAsset:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PUReviewAsset *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v9 = a4;
  v12 = a3;
  v13 = a7;
  if (v12)
  {
    objc_msgSend(v12, "sourceAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestForAssetUUID:](self, "_reviewAssetRequestForAssetUUID:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 != v12)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (v13 && v9)
    {
      objc_msgSend(v13, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v15);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenViewController.m"), 511, CFSTR("Expected asset identifiers to match"));

      }
      NSTemporaryDirectory();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "canPlayPhotoIris"))
      {
        -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "disableLivePhotosSelectionManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isSelectedUUID:", v15) ^ 1;

      }
      else
      {
        v22 = 0;
      }
      v23 = -[PUReviewAsset initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:]([PUReviewAsset alloc], "initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:", v13, v19, v22);
      -[PUAssetExplorerReviewScreenViewController _updateWithSubstituteAsset:shouldSelect:](self, "_updateWithSubstituteAsset:shouldSelect:", v23, 0);
    }
    else
    {
      if (a5)
      {
LABEL_14:
        -[PUAssetExplorerReviewScreenViewController _updateForCompletedReviewAssetRequest:](self, "_updateForCompletedReviewAssetRequest:", v12);
        goto LABEL_15;
      }
      -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectionManager");
      v23 = (PUReviewAsset *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __119__PUAssetExplorerReviewScreenViewController__handleReviewAssetRequest_completedWithSuccess_canceled_error_reviewAsset___block_invoke;
      v25[3] = &unk_1E589CD70;
      v26 = v15;
      -[PUReviewAsset performChanges:](v23, "performChanges:", v25);
      -[PUAssetExplorerReviewScreenViewController _showFailedReviewAssetRequestAlert](self, "_showFailedReviewAssetRequestAlert");

    }
    goto LABEL_14;
  }
LABEL_16:

}

- (void)_showFailedReviewAssetRequestAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  -[PUAssetExplorerReviewScreenViewController _failedReviewAssetRequestAlertController](self, "_failedReviewAssetRequestAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PULocalizedString(CFSTR("OK"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_ERROR_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_ERROR_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _setFailedReviewAssetRequestAlertController:](self, "_setFailedReviewAssetRequestAlertController:", v7);
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DC3448];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __79__PUAssetExplorerReviewScreenViewController__showFailedReviewAssetRequestAlert__block_invoke;
    v13 = &unk_1E58AA850;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "actionWithTitle:style:handler:", v4, 0, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v9, v10, v11, v12, v13);

    -[PUAssetExplorerReviewScreenViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (void)_handleFailedReviewAssetRequestAlertControllerDismissal
{
  -[PUAssetExplorerReviewScreenViewController _setFailedReviewAssetRequestAlertController:](self, "_setFailedReviewAssetRequestAlertController:", 0);
}

- (id)_createProgressControllerForRemainingRequests:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUAssetExplorerReviewScreenViewController _requestProgressController](self, "_requestProgressController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenViewController.m"), 569, CFSTR("Not expecting existing progress controller"));

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "progress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 += objc_msgSend(v13, "totalUnitCount");

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "progress", (_QWORD)v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          objc_msgSend(v14, "addChild:withPendingUnitCount:", v20, objc_msgSend(v20, "totalUnitCount"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }

  v22 = objc_alloc_init(MEMORY[0x1E0D7B158]);
  objc_msgSend(v22, "setProgress:", v14);
  -[PUAssetExplorerReviewScreenViewController _setRequestProgressController:](self, "_setRequestProgressController:", v22);

  return v22;
}

- (void)_tearDownProgressController
{
  -[PUAssetExplorerReviewScreenViewController _setRequestProgressController:](self, "_setRequestProgressController:", 0);
}

- (id)_substituteAssetForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _substituteAssetsByUUID](self, "_substituteAssetsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setSubstituteAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v7, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUAssetExplorerReviewScreenViewController _substituteAssetsByUUID](self, "_substituteAssetsByUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllFilesAtReferencedURLs");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v4);

  }
}

- (void)_updateWithSubstituteAsset:(id)a3 shouldSelect:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[PUAssetExplorerReviewScreenViewController _setSubstituteAsset:](self, "_setSubstituteAsset:", v6);
    -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke;
    v14[3] = &unk_1E589CE28;
    v9 = v6;
    v15 = v9;
    objc_msgSend(v7, "performChanges:", v14);
    if (v4)
    {
      -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke_2;
      v12[3] = &unk_1E589CD70;
      v13 = v9;
      objc_msgSend(v11, "performChanges:", v12);

    }
  }

}

- (void)_deleteAllLinkedFiles
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _substituteAssetsByUUID](self, "_substituteAssetsByUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_191);
  objc_msgSend(v3, "removeAllObjects");

}

- (id)_getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _substituteAssetsByUUID](self, "_substituteAssetsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __104__PUAssetExplorerReviewScreenViewController__getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets__block_invoke;
  v14 = &unk_1E589CE90;
  v15 = v4;
  v16 = v6;
  v7 = v6;
  v8 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
  objc_msgSend(v5, "removeAllObjects", v11, v12, v13, v14);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (self->_delegateFlags.respondsToCanPerformActionType
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v14 = objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewController:canPerformActionType:onAsset:inAssetCollection:", self, a4, v11, v12), WeakRetained, !v14))
  {
    v22 = 0;
  }
  else if (a4 - 9 > 1)
  {
    v22 = 1;
  }
  else
  {
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedUUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    -[PUAssetExplorerReviewScreenViewController initialSelectedAssetUUIDs](self, "initialSelectedAssetUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    v21 = 9;
    if (v18 != v20)
      v21 = 10;
    v22 = v21 != a4;
  }

  return v22;
}

- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  PUAssetExplorerReviewScreenViewControllerDelegate **p_delegate;
  id v10;
  id v11;
  id WeakRetained;

  if (!self->_delegateFlags.respondsToShouldEnableActionType)
    return 1;
  p_delegate = &self->_delegate;
  v10 = a6;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewController:shouldEnableActionType:onAsset:inAssetCollection:", self, a4, v11, v10);

  return a4;
}

- (void)assetExplorerReviewScreenActionManager:(id)a3 didPressSelectForAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  unsigned int v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  char v42;

  v5 = a4;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController selectionCountLimit](self, "selectionCountLimit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isSelectedUUID:", v6);
  v39 = v9;
  if ((v10 & 1) == 0
    && v9
    && (objc_msgSend(v8, "selectedUUIDs"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v13 = objc_msgSend(v9, "unsignedIntValue"),
        v11,
        v12 >= v13))
  {
    PXLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v9, "unsignedIntValue");
    PULocalizedStringWithValidatedFormat(v27, CFSTR("%lu"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v28, 1, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAction:", v32);

    -[PUAssetExplorerReviewScreenViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
  }
  else
  {
    v37 = v7;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __107__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManager_didPressSelectForAsset___block_invoke;
    v40[3] = &unk_1E589CEB8;
    v42 = v10 ^ 1;
    v38 = v6;
    v14 = v6;
    v41 = v14;
    v36 = v8;
    objc_msgSend(v8, "performChanges:", v40);
    v15 = CFSTR("PUAssetExplorerAnalyticsEventReselectPhoto");
    if (v10)
      v15 = CFSTR("PUAssetExplorerAnalyticsEventRemovePhoto");
    v16 = v15;
    -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectionManager");
    v20 = v5;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectedUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendEvent:view:source:currentAssetCount:", v16, 2, v18, objc_msgSend(v22, "count"));

    v5 = v20;
    -[PUAssetExplorerReviewScreenViewController _reviewAssetProvider](self, "_reviewAssetProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[PUAssetExplorerReviewScreenViewController initialSelectedAssetUUIDs](self, "initialSelectedAssetUUIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if ((v10 & 1) != 0)
      {
        -[PUAssetExplorerReviewScreenViewController _cancelReviewAssetRequestForAssetUUID:](self, "_cancelReviewAssetRequestForAssetUUID:", v14);
      }
      else if ((objc_msgSend(v24, "containsObject:", v14) & 1) == 0)
      {
        -[PUAssetExplorerReviewScreenViewController _substituteAssetForUUID:](self, "_substituteAssetForUUID:", v14);
        v33 = objc_claimAutoreleasedReturnValue();
        -[PUAssetExplorerReviewScreenViewController _reviewAssetRequestForAssetUUID:](self, "_reviewAssetRequestForAssetUUID:", v14);
        v34 = objc_claimAutoreleasedReturnValue();
        if (!(v33 | v34))
          -[PUAssetExplorerReviewScreenViewController _requestReviewAssetForAsset:](self, "_requestReviewAssetForAsset:", v20);

      }
    }

    v7 = v37;
    v6 = v38;
    v8 = v36;
  }

}

- (void)assetExplorerReviewScreenActionManagerDidPressDone:(id)a3
{
  -[PUAssetExplorerReviewScreenViewController _handleCompletionAction:](self, "_handleCompletionAction:", 0);
}

- (void)assetExplorerReviewScreenActionManagerDidPressSelectAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAssetExplorerReviewScreenViewController initialSelectedAssetUUIDs](self, "initialSelectedAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressSelectAll___block_invoke;
  v8[3] = &unk_1E589CD70;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "performChanges:", v8);

}

- (void)assetExplorerReviewScreenActionManagerDidPressDeselectAll:(id)a3
{
  void *v3;
  id v4;

  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performChanges:", &__block_literal_global_200);
}

- (void)_handleSelectionChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  if ((-[PUAssetExplorerReviewScreenViewController _options](self, "_options") & 4) != 0)
  {
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "selectedUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _titleForSelectedAssetUUIDs:](self, "_titleForSelectedAssetUUIDs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "selectedUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _fileSizeMenuForSelectedUUIDs:](self, "_fileSizeMenuForSelectedUUIDs:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAssetExplorerReviewScreenViewController _browsingSession](self, "_browsingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke;
    v18[3] = &unk_1E58ABCA8;
    v19 = v10;
    v20 = v6;
    v12 = v6;
    v13 = v10;
    objc_msgSend(v13, "performChanges:", v18);
    objc_msgSend(v13, "resizeTaskDescriptorViewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke_2;
    v16[3] = &unk_1E58A08A0;
    v17 = v8;
    v15 = v8;
    objc_msgSend(v14, "performChanges:", v16);

  }
}

- (id)_titleForSelectedAssetUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if ((-[PUAssetExplorerReviewScreenViewController _options](self, "_options") & 8) == 0)
    -[PUAssetExplorerReviewScreenViewController _options](self, "_options");
  -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "photosDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v4, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchAssetsWithUUIDs:options:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "countOfAssetsWithMediaType:", 1);
    objc_msgSend(v15, "countOfAssetsWithMediaType:", 2);

  }
  objc_msgSend(v4, "count");
  PXLocalizedSelectionMessageForAssetsCount();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_fileSizeMenuForSelectedUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_delegateFlags.respondsToFileSizeMenu)
  {
    v4 = a3;
    -[PUAssetExplorerReviewScreenViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetExplorerReviewScreenViewController:fileSizeMenuForSelectedUUIDs:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_handleCompletionAction:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id from;
  id location;

  kdebug_trace();
  -[PUAssetExplorerReviewScreenViewController _remainingReviewAssetRequests](self, "_remainingReviewAssetRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PUAssetExplorerReviewScreenViewController _createProgressControllerForRemainingRequests:](self, "_createProgressControllerForRemainingRequests:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __69__PUAssetExplorerReviewScreenViewController__handleCompletionAction___block_invoke;
    v11 = &unk_1E589EBC8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    objc_msgSend(v6, "setCancellationHandler:", &v8);
    objc_msgSend(v6, "showAnimated:allowDelay:", 1, objc_msgSend(v5, "count", v8, v9, v10, v11) == 1);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PUAssetExplorerReviewScreenViewController _performCompletionAction:](self, "_performCompletionAction:", a3);
  }

}

- (void)_handleProgressControllerCanceled:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUAssetExplorerReviewScreenViewController _requestProgressController](self, "_requestProgressController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenViewController.m"), 915, CFSTR("Not expecting multiple progress controllers"));

    v6 = v8;
  }
  objc_msgSend(v6, "hideAnimated:allowDelay:", 1, 0);
  -[PUAssetExplorerReviewScreenViewController _tearDownProgressController](self, "_tearDownProgressController");
  -[PUAssetExplorerReviewScreenViewController _performCancelAction](self, "_performCancelAction");

}

- (void)assetExplorerReviewScreenActionManager:(id)a3 didToggleLivePhoto:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PUReviewAsset *v11;
  void *v12;
  PUReviewAsset *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EEC561A8))
  {
    v5 = v19;
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableLivePhotosSelectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSelectedUUID:", v6) ^ 1;

    +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:](PUReviewAsset, "createUniqueMediaDirectoryForAssetWithIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [PUReviewAsset alloc];
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUReviewAsset initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:](v11, "initWithReviewAsset:linkFileURLsToUniquePathsInDirectory:canPlayPhotoIris:", v5, v12, v9);

    -[PUAssetExplorerReviewScreenViewController _updateWithSubstituteAsset:shouldSelect:](self, "_updateWithSubstituteAsset:shouldSelect:", v13, 0);
    -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:view:source:currentAssetCount:", CFSTR("PUAssetExplorerAnalyticsEventToggleLivePhoto"), 2, v15, objc_msgSend(v18, "count"));

  }
}

- (void)assetExplorerReviewScreenActionManagerDidPressSend:(id)a3
{
  -[PUAssetExplorerReviewScreenViewController _handleCompletionAction:](self, "_handleCompletionAction:", 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenSelectionManagerObservationContext == a5)
    -[PUAssetExplorerReviewScreenViewController _handleSelectionChanged](self, "_handleSelectionChanged", a3, a4);
}

- (void)photoEditController:(id)a3 didFinishEditingSessionForAsset:(id)a4 completed:(BOOL)a5
{
  _BOOL4 v5;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenViewController.m"), 976, CFSTR("Editing a photo must output a PUReviewAsset!"));

    }
    -[PUAssetExplorerReviewScreenViewController _updateWithSubstituteAsset:shouldSelect:](self, "_updateWithSubstituteAsset:shouldSelect:", v16, 1);
    v8 = PUAssetExplorerAnalyticsEventEditSave;
  }
  else
  {
    v8 = PUAssetExplorerAnalyticsEventEditCancel;
  }
  v9 = *v8;
  -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:view:source:currentAssetCount:", v9, 2, v11, objc_msgSend(v14, "count"));

}

- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4
{
  __CFString **v6;
  __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (a4)
  {
    -[PUAssetExplorerReviewScreenViewController _updateWithSubstituteAsset:shouldSelect:](self, "_updateWithSubstituteAsset:shouldSelect:", a4, 1);
    v6 = PUAssetExplorerAnalyticsEventMarkupSave;
  }
  else
  {
    v6 = PUAssetExplorerAnalyticsEventMarkupCancel;
  }
  v7 = *v6;
  -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectedUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:view:source:currentAssetCount:", v7, 2, v9, objc_msgSend(v12, "count"));

  objc_msgSend(v13, "unregisterObserver:", self);
}

- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5
{
  id v8;
  __CFString **v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PUAssetExplorerReviewScreenViewController *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  if (v8)
  {
    -[PUAssetExplorerReviewScreenViewController _updateWithSubstituteAsset:shouldSelect:](self, "_updateWithSubstituteAsset:shouldSelect:", v8, 1);
    v9 = PUAssetExplorerAnalyticsEventFunEffectsSave;
  }
  else
  {
    v9 = PUAssetExplorerAnalyticsEventFunEffectsCancel;
  }
  v10 = *v9;
  -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:view:source:currentAssetCount:", v10, 2, v12, objc_msgSend(v15, "count"));

  if (a5)
  {
    if (a5 == 1)
    {
      v16 = self;
      v17 = 0;
      goto LABEL_10;
    }
    if (a5 == 2)
    {
      v16 = self;
      v17 = 1;
LABEL_10:
      -[PUAssetExplorerReviewScreenViewController _handleCompletionAction:](v16, "_handleCompletionAction:", v17);
    }
  }
  else
  {
    -[PUAssetExplorerReviewScreenViewController _performRetakeAction](self, "_performRetakeAction");
  }

}

- (id)reviewAssetProviderRequestForDisplayAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PUAssetExplorerReviewScreenViewController _reviewAssetProvider](self, "_reviewAssetProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reviewAssetProviderRequestForDisplayAsset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_performCancelAction
{
  void *v3;
  id WeakRetained;

  -[PUAssetExplorerReviewScreenViewController _cancelReviewAssetRequests](self, "_cancelReviewAssetRequests");
  -[PUAssetExplorerReviewScreenViewController _deleteAllLinkedFiles](self, "_deleteAllLinkedFiles");
  -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detachFromOriginalDataSourceManager");

  if (self->_delegateFlags.respondsToDidPressCancel)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewControllerDidPressCancel:", self);

  }
}

- (void)_performRetakeAction
{
  id WeakRetained;

  -[PUAssetExplorerReviewScreenViewController _cancelReviewAssetRequests](self, "_cancelReviewAssetRequests");
  -[PUAssetExplorerReviewScreenViewController _deleteAllLinkedFiles](self, "_deleteAllLinkedFiles");
  if (self->_delegateFlags.respondsToDidPressRetake)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewControllerDidPressRetake:", self);

  }
}

- (void)_performCompletionAction:(unint64_t)a3
{
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  PUAssetExplorerReviewScreenViewController *v31;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityCheckRequired"))
    goto LABEL_23;
  v5 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  v6 = 0;
  if (v5 <= 3 && v5 != 2)
  {
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v13)
    {
      v14 = v13;
      v28 = v8;
      v29 = v7;
      v30 = a3;
      v31 = self;
      v15 = *(_QWORD *)v34;
LABEL_6:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)MEMORY[0x1E0CD1390];
        v37 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16);
        v6 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1, v28, v29, v30, v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fetchAssetsWithLocalIdentifiers:options:", v18, v11);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v19, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v19) = objc_msgSend(MEMORY[0x1E0D7B978], "confidentialWarningRequiredForAsset:", v20);
        if ((v19 & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v14)
            goto LABEL_6;
          v6 = 0;
          break;
        }
      }
      a3 = v30;
      self = v31;
      v8 = v28;
      v7 = v29;
    }
    else
    {
      v6 = 0;
    }

  }
  -[PUAssetExplorerReviewScreenViewController _browsingSession](self, "_browsingSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentAssetReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "conformsToProtocol:", &unk_1EEC56290);

  if (v25)
  {
    objc_msgSend(v23, "asset");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (!v6)
    {
      if (v26)
        v6 = objc_msgSend(MEMORY[0x1E0D7B978], "confidentialWarningRequiredForAsset:", v26);
    }

  }
  if (v6)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70__PUAssetExplorerReviewScreenViewController__performCompletionAction___block_invoke;
    v32[3] = &unk_1E58A7A80;
    v32[4] = self;
    v32[5] = a3;
    -[PUAssetExplorerReviewScreenViewController _presentConfidentialityAlertWithConfirmAction:abortAction:](self, "_presentConfidentialityAlertWithConfirmAction:abortAction:", v32, 0);
  }
  else
  {
LABEL_23:
    -[PUAssetExplorerReviewScreenViewController _performCompletionActionSteps:](self, "_performCompletionActionSteps:", a3);
  }
}

- (void)_performCompletionActionSteps:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  __CFString **v11;
  __CFString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "disableLivePhotosSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets](self, "_getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenViewController _reviewDataSourceManager](self, "_reviewDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detachFromOriginalDataSourceManager");

  if (self->_delegateFlags.respondsToDidPerformCompletionAction)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewController:didPerformCompletionAction:withSelectedAssetUUIDs:livePhotoDisabledAssetUUIDs:substituteAssetsByUUID:", self, a3, v5, v7, v8);

  }
  if (a3)
  {
    if (a3 != 1)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v11 = PUAssetExplorerAnalyticsEventCompleteReviewSend;
  }
  else
  {
    v11 = PUAssetExplorerAnalyticsEventCompleteReviewDone;
  }
  v12 = *v11;
LABEL_9:
  -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
  -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectedUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:view:source:currentAssetCount:", v12, 2, v14, objc_msgSend(v17, "count"));

  kdebug_trace();
}

- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC3448];
  v7 = a4;
  v8 = a3;
  PULocalizedString(CFSTR("OK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v9, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("CANCEL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D7B978];
  v17[0] = v10;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "confidentialityAlertWithActions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAssetExplorerReviewScreenViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(a4, "currentAssetDidChange", a3))
  {
    -[PUAssetExplorerReviewScreenViewController assetExplorerAnalytics](self, "assetExplorerAnalytics");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[PUAssetExplorerReviewScreenViewController sourceType](self, "sourceType");
    -[PUAssetExplorerReviewScreenViewController _actionManager](self, "_actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:view:source:currentAssetCount:", CFSTR("PUAssetExplorerAnalyticsEventScroll"), 2, v5, objc_msgSend(v8, "count"));

  }
}

- (PUAssetExplorerReviewScreenViewControllerDelegate)delegate
{
  return (PUAssetExplorerReviewScreenViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (NSSet)initialSelectedAssetUUIDs
{
  return self->_initialSelectedAssetUUIDs;
}

- (NSSet)initialDisabledLivePhotoAssetUUIDs
{
  return self->_initialDisabledLivePhotoAssetUUIDs;
}

- (NSNumber)selectionCountLimit
{
  return self->_selectionCountLimit;
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (PUNavigationController)_navigationController
{
  return self->__navigationController;
}

- (PUAssetsDataSourceManager)_clientDataSourceManager
{
  return self->__clientDataSourceManager;
}

- (PUAssetExplorerReviewScreenAssetsDataSourceManager)_reviewDataSourceManager
{
  return self->__reviewDataSourceManager;
}

- (PUMediaProvider)_clientMediaProvider
{
  return self->__clientMediaProvider;
}

- (PUJoiningMediaProvider)_reviewMediaProvider
{
  return self->__reviewMediaProvider;
}

- (PUReviewAssetProvider)_reviewAssetProvider
{
  return self->__reviewAssetProvider;
}

- (PUAssetExplorerReviewScreenActionManager)_actionManager
{
  return self->__actionManager;
}

- (PUBrowsingSession)_browsingSession
{
  return self->__browsingSession;
}

- (NSMutableDictionary)_reviewAssetRequestsByUUID
{
  return self->__reviewAssetRequestsByUUID;
}

- (NSMutableDictionary)_substituteAssetsByUUID
{
  return self->__substituteAssetsByUUID;
}

- (PXActivityProgressController)_requestProgressController
{
  return self->__requestProgressController;
}

- (void)_setRequestProgressController:(id)a3
{
  objc_storeStrong((id *)&self->__requestProgressController, a3);
}

- (UIAlertController)_failedReviewAssetRequestAlertController
{
  return self->__failedReviewAssetRequestAlertController;
}

- (void)_setFailedReviewAssetRequestAlertController:(id)a3
{
  objc_storeStrong((id *)&self->__failedReviewAssetRequestAlertController, a3);
}

- (unint64_t)_options
{
  return self->__options;
}

- (PUReviewScreenSpec)_spec
{
  return self->__spec;
}

- (BOOL)_lowMemoryMode
{
  return self->__lowMemoryMode;
}

- (void)setAssetExplorerAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__failedReviewAssetRequestAlertController, 0);
  objc_storeStrong((id *)&self->__requestProgressController, 0);
  objc_storeStrong((id *)&self->__substituteAssetsByUUID, 0);
  objc_storeStrong((id *)&self->__reviewAssetRequestsByUUID, 0);
  objc_storeStrong((id *)&self->__browsingSession, 0);
  objc_storeStrong((id *)&self->__actionManager, 0);
  objc_storeStrong((id *)&self->__reviewAssetProvider, 0);
  objc_storeStrong((id *)&self->__reviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__clientMediaProvider, 0);
  objc_storeStrong((id *)&self->__reviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__clientDataSourceManager, 0);
  objc_storeStrong((id *)&self->__navigationController, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_storeStrong((id *)&self->_selectionCountLimit, 0);
  objc_storeStrong((id *)&self->_initialDisabledLivePhotoAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_initialSelectedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __70__PUAssetExplorerReviewScreenViewController__performCompletionAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCompletionActionSteps:", *(_QWORD *)(a1 + 40));
}

void __69__PUAssetExplorerReviewScreenViewController__handleCompletionAction___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleProgressControllerCanceled:", v2);

}

uint64_t __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNavigationBarTitle:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "signalReviewScreenSelectionChanged");
}

uint64_t __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFileSizeMenu:", *(_QWORD *)(a1 + 32));
}

void __103__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressDeselectAll___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v2, "set");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedUUIDs:", v4);

}

uint64_t __101__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressSelectAll___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedUUIDs:", *(_QWORD *)(a1 + 32));
}

uint64_t __107__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManager_didPressSelectForAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(a2, "addSelectedUUID:", v2);
  else
    return objc_msgSend(a2, "removeSelectedUUID:", v2);
}

void __104__PUAssetExplorerReviewScreenViewController__getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend(v5, "isSelectedUUID:", v7))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);
  else
    objc_msgSend(v6, "removeAllFilesAtReferencedURLs");

}

uint64_t __66__PUAssetExplorerReviewScreenViewController__deleteAllLinkedFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeAllFilesAtReferencedURLs");
}

uint64_t __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceAssetInDataSourceWithAsset:", *(_QWORD *)(a1 + 32));
}

void __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSelectedUUID:", v4);

}

void __79__PUAssetExplorerReviewScreenViewController__showFailedReviewAssetRequestAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleFailedReviewAssetRequestAlertControllerDismissal");

}

uint64_t __119__PUAssetExplorerReviewScreenViewController__handleReviewAssetRequest_completedWithSuccess_canceled_error_reviewAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSelectedUUID:", *(_QWORD *)(a1 + 32));
}

void __73__PUAssetExplorerReviewScreenViewController__requestReviewAssetForAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v9 = (id *)(a1 + 32);
  v10 = a5;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained(v9);
  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleReviewAssetRequest:completedWithSuccess:canceled:error:reviewAsset:", v12, a2, a3, v11, v10);

}

uint64_t __71__PUAssetExplorerReviewScreenViewController__cancelReviewAssetRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancelReviewAssetRequest");
}

uint64_t __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedUUIDs:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedUUIDs:", *(_QWORD *)(a1 + 32));
}

void __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setCurrentAssetReference:");
  objc_msgSend(*(id *)(a1 + 48), "reviewBarsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "reviewBarsModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setReviewScreenBarsModel:", v3);

  }
  objc_msgSend(*(id *)(a1 + 40), "setVideoContentAllowed:forReason:", 1, CFSTR("AssetExplorer"));
  objc_msgSend(*(id *)(a1 + 48), "resizeTaskDescriptorViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "resizeTaskDescriptorViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setResizeTaskDescriptorViewModel:", v5);

  }
  if ((objc_msgSend(*(id *)(a1 + 48), "_options") & 4) != 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_titleForSelectedAssetUUIDs:", *(_QWORD *)(a1 + 56));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNavigationBarTitle:", v7);

  }
}

void __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_fileSizeMenuForSelectedUUIDs:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileSizeMenu:", v5);

}

uint64_t __282__PUAssetExplorerReviewScreenViewController_initWithDataSourceManager_mediaProvider_reviewAssetProvider_initialIndexPath_initialSelectedAssetUUIDs_initialDisabledLivePhotoAssetUUIDs_selectionCountLimit_sourceType_lowMemoryMode_reviewBarsModel_resizeTaskDescriptorViewModel_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
