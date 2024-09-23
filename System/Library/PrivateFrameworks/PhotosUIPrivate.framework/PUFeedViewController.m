@implementation PUFeedViewController

- (PUFeedViewController)initWithSpec:(id)a3 contentType:(int64_t)a4
{
  id v7;
  PUFeedViewController *v8;
  PUFeedViewController *v9;
  void *v10;
  uint64_t v11;
  PLManagedAlbumList *sharedAlbumList;
  id v13;
  uint64_t v14;
  PXFeedSectionInfosManager *feedSectionInfosManager;
  uint64_t v16;
  PHCachingImageManager *cachingImageManager;
  uint64_t v18;
  NSMutableArray *lastPreheatIndexPathList;
  uint64_t v20;
  NSMutableArray *lastPreheatIndexPathInfoList;
  uint64_t v22;
  PXFeedDateFormatter *dateFormatter;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableSet *v31;
  NSMutableSet *imageCellsPlayingVideo;
  _QWORD v34[5];
  objc_super v35;

  v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PUFeedViewController;
  v8 = -[PUFeedViewController init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_spec, a3);
    v9->_contentType = a4;
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "albumListForContentMode:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    sharedAlbumList = v9->__sharedAlbumList;
    v9->__sharedAlbumList = (PLManagedAlbumList *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D7B408]);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __49__PUFeedViewController_initWithSpec_contentType___block_invoke;
    v34[3] = &__block_descriptor_40_e49_v16__0___PXConfigurableFeedSectionInfosManager__8l;
    v34[4] = a4 == 2;
    v14 = objc_msgSend(v13, "initWithPhotoLibrary:configurationBlock:", v10, v34);
    feedSectionInfosManager = v9->__feedSectionInfosManager;
    v9->__feedSectionInfosManager = (PXFeedSectionInfosManager *)v14;

    -[PXFeedSectionInfosManager setDelegate:](v9->__feedSectionInfosManager, "setDelegate:", v9);
    v16 = objc_opt_new();
    cachingImageManager = v9->__cachingImageManager;
    v9->__cachingImageManager = (PHCachingImageManager *)v16;

    v18 = objc_opt_new();
    lastPreheatIndexPathList = v9->__lastPreheatIndexPathList;
    v9->__lastPreheatIndexPathList = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    lastPreheatIndexPathInfoList = v9->__lastPreheatIndexPathInfoList;
    v9->__lastPreheatIndexPathInfoList = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x1E0D7B3F8], "defaultFeedSectionDateFormatter");
    v22 = objc_claimAutoreleasedReturnValue();
    dateFormatter = v9->__dateFormatter;
    v9->__dateFormatter = (PXFeedDateFormatter *)v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v9, sel__appWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v9, sel__appDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v9, sel__dateFormatterChanged_, *MEMORY[0x1E0D7C398], v9->__dateFormatter);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v9, sel__libraryUpdatingDidExpire_, CFSTR("PUFeedLibraryUpdatingDidExpireNotification"), 0);

    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "slowScrollPreheatingWindowSize");
    -[PUFeedViewController _setPreheatingWindowSize:](v9, "_setPreheatingWindowSize:");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v9, sel__preferredContentSizeChanged_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v9, sel__reduceMotionStatusChanged_, *MEMORY[0x1E0DC45B0], 0);

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    imageCellsPlayingVideo = v9->_imageCellsPlayingVideo;
    v9->_imageCellsPlayingVideo = v31;

  }
  return v9;
}

- (PUFeedViewControllerSpec)spec
{
  PUFeedViewControllerSpec *spec;
  void *v6;

  spec = self->_spec;
  if (!spec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 374, CFSTR("missing spec"));

    spec = self->_spec;
  }
  return spec;
}

- (BOOL)_updateSpec
{
  PUFeedViewControllerSpec *spec;
  void *v4;
  BOOL v5;
  void *v6;
  objc_class *v7;
  PUFeedViewControllerSpec *v8;
  PUFeedViewControllerSpec *v9;

  spec = self->_spec;
  -[PUFeedViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutReferenceSize");
  -[PUFeedViewControllerSpec setLayoutReferenceWidth:](spec, "setLayoutReferenceWidth:");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  -[PUFeedViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "horizontalSizeClass")
    && objc_msgSend(v6, "verticalSizeClass")
    && (+[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v6), v7 = (objc_class *)objc_opt_class(), v7 != (objc_class *)objc_opt_class()))
  {
    v8 = (PUFeedViewControllerSpec *)objc_alloc_init(v7);
    v9 = self->_spec;
    self->_spec = v8;

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_collectionViewTypeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _BOOL4 v6;
  int64_t v7;

  height = a3.height;
  width = a3.width;
  -[PUFeedViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v5);
  v7 = width > height && v6;

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  void *v8;

  if (-[PUFeedViewController _updateSpec](self, "_updateSpec", a3))
  {
    -[PUFeedViewController spec](self, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowInvitationsInPopover");

    if ((v5 & 1) == 0)
      -[PUFeedViewController _dismissInvitationsPopoverIfNeeded](self, "_dismissInvitationsPopoverIfNeeded");
    v6 = -[PUFeedViewController _sizeTransitionState](self, "_sizeTransitionState");
    if ((unint64_t)(v6 - 1) >= 2)
    {
      if (v6)
        return;
      -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", 0);
    }
    else
    {
      -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[PUFeedViewController _setTargetCollectionView:](self, "_setTargetCollectionView:", 0);
    }
    -[PUFeedViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", 0, 5);
    -[PUFeedViewController _updateCollectionViews](self, "_updateCollectionViews");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUFeedViewController _targetSize](self, "_targetSize");
  if (v8 != width || (-[PUFeedViewController _targetSize](self, "_targetSize"), v9 != height))
  {
    -[PUFeedViewController _updateSpec](self, "_updateSpec");
    -[PUFeedViewController _setTargetSize:](self, "_setTargetSize:", width, height);
    -[PUFeedViewController _cancelBarsAutoHide](self, "_cancelBarsAutoHide");
    -[PUFeedViewController _setSizeTransitionState:](self, "_setSizeTransitionState:", 1);
    -[PUFeedViewController _setTargetCollectionViewType:](self, "_setTargetCollectionViewType:", -[PUFeedViewController _collectionViewTypeForSize:](self, "_collectionViewTypeForSize:", width, height));
    -[PUFeedViewController _invalidateLastPreheatedContentOffset](self, "_invalidateLastPreheatedContentOffset");
    -[PUFeedViewController _invalidatePreheatedAssets](self, "_invalidatePreheatedAssets");
    -[PUFeedViewController _updateCollectionViews](self, "_updateCollectionViews");
    -[PUFeedViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
    -[PUFeedViewController _rotationLastRestorableState](self, "_rotationLastRestorableState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[PUFeedViewController _currentRestorableState](self, "_currentRestorableState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _setRotationLastRestorableState:](self, "_setRotationLastRestorableState:", v10);
    }
    -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");
    -[PUFeedViewController _restoreScrollPositionInCollectionView:fromRestorableState:](self, "_restoreScrollPositionInCollectionView:fromRestorableState:", v11, v10);
    -[PUFeedViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

    -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v11);
    -[PUFeedViewController _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 1);
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hideMenu");

    if (-[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", -[PUFeedViewController _targetCollectionViewType](self, "_targetCollectionViewType")))
    {
      v14 = 0;
    }
    else
    {
      v14 = 2;
    }
    -[PUFeedViewController _setBarsState:](self, "_setBarsState:", v14);
    v15[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__PUFeedViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v16[3] = &unk_1E58A7A08;
    v16[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PUFeedViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v15[3] = &unk_1E58A7A08;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v16, v15);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", 0);
  -[PUPhotoPinchGestureRecognizer setDelegate:](self->__pinchGestureRecognizer, "setDelegate:", 0);
  -[PUScrollViewSpeedometer setDelegate:](self->__collectionViewSpeedometer, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PUPhotoPinchGestureRecognizer *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PUFeedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudFeedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  -[PUFeedViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 1);

  -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
  -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 0);
  -[PUFeedViewController _setViewsInSyncWithModel:](self, "_setViewsInSyncWithModel:", 0);
  -[PUFeedViewController _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
    objc_msgSend(v7, "setDelegate:", self);
    -[PUFeedViewController _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v7);
  }
  -[PUFeedViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", v7);

  -[PUFeedViewController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v9 = (PUPhotoPinchGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePinch_);
    -[PUPhotoPinchGestureRecognizer setDelegate:](v9, "setDelegate:", self);
    -[PUFeedViewController _setPinchGestureRecognizer:](self, "_setPinchGestureRecognizer:", v9);
  }
  -[PUFeedViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", v9);

  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__PUFeedViewController_viewDidLoad__block_invoke;
  v12[3] = &unk_1E58ABD10;
  v12[4] = self;
  objc_msgSend(v11, "scheduleMainQueueTask:", v12);

  -[PUFeedViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
}

- (void)viewWillLayoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  int64_t v16;
  double v17;
  _BOOL4 v18;
  double v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD);
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  if (!-[PUFeedViewController _hasAppeared](self, "_hasAppeared")
    && -[PUFeedViewController px_isVisible](self, "px_isVisible"))
  {
    -[PUFeedViewController _setHasAppeared:](self, "_setHasAppeared:", 1);
    -[PUFeedViewController _viewWillLayoutBeforeAppearing](self, "_viewWillLayoutBeforeAppearing");
  }
  v3 = -[PUFeedViewController _updateSpec](self, "_updateSpec");
  -[PUFeedViewController _targetSize](self, "_targetSize");
  v5 = v4;
  v7 = v6;
  -[PUFeedViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (-[PUFeedViewController _needsUpdateLayout](self, "_needsUpdateLayout") || v10 != v5 || v12 != v7 || v3)
  {
    -[PUFeedViewController _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 0);
    if (!-[PUFeedViewController _sizeTransitionState](self, "_sizeTransitionState"))
    {
      -[PUFeedViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v16 = -[PUFeedViewController _collectionViewTypeForSize:](self, "_collectionViewTypeForSize:", v14, v15);

      -[PUFeedViewController _setCurrentCollectionViewType:](self, "_setCurrentCollectionViewType:", v16);
      -[PUFeedViewController _setTargetSize:](self, "_setTargetSize:", v10, v12);
    }
    -[PUFeedViewController _targetSize](self, "_targetSize");
    v18 = v5 != v17;
    if (v7 != v19)
      v18 = 1;
    if (v18 || v3)
    {
      -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeFromSuperview");

      -[PUFeedViewController _setTargetCollectionView:](self, "_setTargetCollectionView:", 0);
      -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", 0);
      -[PUFeedViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", 0, 5);
    }
    if (!-[PUFeedViewController _areViewsInSyncWithModel](self, "_areViewsInSyncWithModel"))
      -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
    -[PUFeedViewController _updateCollectionViews](self, "_updateCollectionViews");
    -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 0);
  }
  -[PUFeedViewController onNextViewLayout](self, "onNextViewLayout");
  v22 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PUFeedViewController setOnNextViewLayout:](self, "setOnNextViewLayout:", 0);
    v22[2](v22);
  }

}

- (void)_performOnNextViewLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  -[PUFeedViewController onNextViewLayout](self, "onNextViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__PUFeedViewController__performOnNextViewLayout___block_invoke;
  v12 = &unk_1E58AA540;
  v13 = v5;
  v14 = v4;
  v6 = v4;
  v7 = v5;
  -[PUFeedViewController setOnNextViewLayout:](self, "setOnNextViewLayout:", &v9);
  -[PUFeedViewController viewIfLoaded](self, "viewIfLoaded", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_viewWillLayoutBeforeAppearing
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType"));
  -[PUFeedViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lastOperation");

  v6 = 1;
  if (v5 == 2)
    v6 = 2;
  if (v3)
    v7 = 0;
  else
    v7 = v6;
  -[PUFeedViewController _setBarsState:](self, "_setBarsState:", v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[PUFeedViewController _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 1);
  -[PUFeedViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewWillAppear:", v3);

  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventSourceWillAppear:sender:", 15, self);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewDidAppear:](&v12, sel_viewDidAppear_);
  -[PUFeedViewController _setPushedAlbum:](self, "_setPushedAlbum:", 0);
  -[PUFeedViewController _setPushedViewController:](self, "_setPushedViewController:", 0);
  -[PUFeedViewController _tearDownBrowsing](self, "_tearDownBrowsing");
  -[PUFeedViewController _userDidViewFeed](self, "_userDidViewFeed");
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _invalidateLastPreheatedContentOffset](self, "_invalidateLastPreheatedContentOffset");
  -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v5);
  -[PUFeedViewController _suppressionContexts](self, "_suppressionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    v9 = v8;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "*** %@ Suppressing SB alerts for %@", buf, 0x16u);

  }
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNotificationSuppressionContexts:", v6);

  if (-[PUFeedViewController _barsState](self, "_barsState") == 1)
    -[PUFeedViewController _scheduleBarsAutoHide](self, "_scheduleBarsAutoHide");
  if (-[PUFeedViewController _isInvitationsPopoverShowPending](self, "_isInvitationsPopoverShowPending"))
    -[PUFeedViewController _showInvitationsPopoverAnimated:](self, "_showInvitationsPopoverAnimated:", 0);
  -[PUFeedViewController _setViewDidAppear:](self, "_setViewDidAppear:", 1);
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentingViewControllerViewDidAppear:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PUFeedViewController _setViewDidAppear:](self, "_setViewDidAppear:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  -[PUFeedViewController _cancelBarsAutoHide](self, "_cancelBarsAutoHide");
  -[PUFeedViewController _appDidFinishEnteringForeground](self, "_appDidFinishEnteringForeground");
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillDisappear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewDidDisappear:](&v11, sel_viewDidDisappear_);
  -[PUFeedViewController _setHasAppeared:](self, "_setHasAppeared:", 0);
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    v7 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "*** %@ ending suppresion contexts", buf, 0xCu);

  }
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationSuppressionContexts:", 0);

  -[PUFeedViewController _dismissInvitationsPopoverIfNeeded](self, "_dismissInvitationsPopoverIfNeeded");
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewControllerViewDidDisappear:", v3);

  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventSourceDidDisappear:sender:", 15, self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewSafeAreaInsetsDidChange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int (**v20)(void *, void *);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[12];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController viewSafeAreaInsetsDidChange](&v26, sel_viewSafeAreaInsetsDidChange);
  -[PUFeedViewController _previousSafeAreaInsets](self, "_previousSafeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUFeedViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__PUFeedViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v25[3] = &__block_descriptor_96_e36_B16__0__PUFeedCollectionViewLayout_8l;
  v25[4] = v4;
  v25[5] = v6;
  v25[6] = v8;
  v25[7] = v10;
  *(double *)&v25[8] = v13;
  *(double *)&v25[9] = v15;
  *(double *)&v25[10] = v17;
  *(double *)&v25[11] = v19;
  v20 = (unsigned int (**)(void *, void *))_Block_copy(v25);
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "collectionViewLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "collectionViewLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20[2](v20, v22))
    objc_msgSend(v22, "invalidateLayoutAndCache");
  if (v20[2](v20, v24))
    objc_msgSend(v24, "invalidateLayoutAndCache");
  -[PUFeedViewController _setPreviousSafeAreaInsets:](self, "_setPreviousSafeAreaInsets:", v13, v15, v17, v19);

}

- (CGSize)preferredContentSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)PUFeedViewController;
  -[PUFeedViewController preferredContentSize](&v14, sel_preferredContentSize);
  v4 = v3;
  v6 = v5;
  if (-[PUFeedViewController contentType](self, "contentType") == 2)
  {
    -[PUFeedViewController _targetSize](self, "_targetSize");
    if (v8 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      -[PUFeedViewController _setTargetSize:](self, "_setTargetSize:", 375.0, 360.0);
    -[PUFeedViewController _updateCollectionViews](self, "_updateCollectionViews");
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentSize");
    v6 = fmax(v11, 360.0);
    *(double *)&v4 = 375.0;

  }
  v12 = *(double *)&v4;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_suppressionContexts
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D74838]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "*** Supressing SB alerts for %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (id)_collectionViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (BOOL)_isCollectionViewEmpty:(id)a3
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;

  objc_msgSend(a3, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v6 = v5 == 0.0 || v4 == 0.0;

  return v6;
}

- (id)_collectionViewContainingView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUFeedViewController _collectionViews](self, "_collectionViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    v11 = v8;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v10);

      if ((objc_msgSend(v4, "isDescendantOfView:", v8) & 1) != 0)
        break;
      ++v10;
      v11 = v8;
      if (v7 == v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
  }

  return v8;
}

- (int64_t)_typeForCollectionView:(id)a3
{
  id v4;
  id v5;
  id v6;
  int64_t v7;
  int64_t v8;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v8 = -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType");
LABEL_7:
    v7 = v8;
    goto LABEL_8;
  }
  -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v8 = -[PUFeedViewController _targetCollectionViewType](self, "_targetCollectionViewType");
    goto LABEL_7;
  }
LABEL_4:
  v7 = 0;
LABEL_8:

  return v7;
}

- (int64_t)_numberOfSectionInfosForCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSectionInfos");

  return v4;
}

- (id)_sectionInfoForSection:(int64_t)a3 collectionView:(id)a4
{
  void *v5;
  void *v6;

  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionInfoAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sectionInfosForSections:(id)a3 collectionView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionInfosAtIndexes:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_assetForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "typeForItemAtIndex:", objc_msgSend(v6, "item")))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "assetForItemAtIndex:", objc_msgSend(v6, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_indexPathForItemWithAsset:(id)a3 inCollectionView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(v5, "cloudFeedAssetsEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfSectionInfoForCloudFeedEntry:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = v8;
    objc_msgSend(v7, "sectionInfoAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfItemWithAsset:", v5);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (void)_requestPlayerItemForAsset:(id)a3 preparation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  PUFeedViewController *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke;
  block[3] = &unk_1E589EF20;
  v18 = v8;
  v19 = v11;
  v20 = self;
  v21 = v10;
  v22 = v9;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v8;
  dispatch_async(v12, block);

}

- (void)_requestImageForAsset:(id)a3 tileSize:(CGSize)a4 completion:(id)a5
{
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned __int16 v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  int v29;
  _QWORD v30[3];

  width = a4.width;
  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v29 = 0;
  -[PUFeedViewController spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageSize");
  objc_msgSend(v10, "getFastImageFormat:qualityImageFormat:forSourceSize:destinationSize:allowCrop:", (char *)&v29 + 2, &v29, 1);

  v11 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v11, "setAllowPlaceholder:", 1);
  if (!(_WORD)v29)
    objc_msgSend(v11, "setDeliveryMode:", 1);
  objc_msgSend(v11, "setResizeMode:", 1);
  objc_msgSend(v11, "setNetworkAccessAllowed:", 1);
  if ((_WORD)v29)
    v12 = v29;
  else
    v12 = HIWORD(v29);
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "contentMode");
  objc_msgSend(v13, "sizeWithFallBackSize:", PUPixelSizeFromPointSize(width));
  v16 = v15;
  v18 = v17;
  v19 = objc_alloc(MEMORY[0x1E0CD1428]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithPLManagedObject:photoLibrary:", v8, v20);

  v22 = *MEMORY[0x1E0CD19C0];
  v30[0] = *MEMORY[0x1E0CD1960];
  v30[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "newObjectWithPropertySets:", v23);

  -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__PUFeedViewController__requestImageForAsset_tileSize_completion___block_invoke;
  v27[3] = &unk_1E58A4E38;
  v27[4] = self;
  v28 = v9;
  v26 = v9;
  objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v24, v14, v11, v27, v16, v18);

}

- (void)_configurePlayerCell:(id)a3 forAssetAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  char v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v10);
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetForItemAtIndex:", objc_msgSend(v9, "item"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "shouldShowCommentBadgesInCollectionViewType:", v11);

  if ((_DWORD)v11)
    v15 = objc_msgSend(v13, "totalCommentsCount");
  else
    v15 = 0;
  -[PUFeedViewController _indexPathForImageHiddenDuringZoomTransition](self, "_indexPathForImageHiddenDuringZoomTransition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v9);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setCommentCount:", v15);
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke;
  v37[3] = &unk_1E58AAD68;
  v19 = v8;
  v38 = v19;
  v39 = v17;
  objc_msgSend(v19, "performIrisPlayerChanges:", v37);
  v20 = objc_msgSend(v19, "tag") + 1;
  objc_msgSend(v19, "setTag:", v20);
  objc_msgSend(v10, "collectionViewLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frameForTileAtIndexPath:", v9);
  v23 = v22;
  v25 = v24;
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_2;
  v34[3] = &unk_1E589EF48;
  v26 = v19;
  v35 = v26;
  v36 = v20;
  -[PUFeedViewController _requestImageForAsset:tileSize:completion:](self, "_requestImageForAsset:tileSize:completion:", v13, v34, v23, v25);
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_4;
  v31[3] = &unk_1E589EF70;
  v32 = v26;
  v33 = v20;
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_5;
  v28[3] = &unk_1E589EF98;
  v29 = v32;
  v30 = v20;
  v27 = v32;
  -[PUFeedViewController _requestPlayerItemForAsset:preparation:completion:](self, "_requestPlayerItemForAsset:preparation:completion:", v13, v31, v28);

}

- (void)_configureImageCell:(id)a3 forAssetAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v10);
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "assetForItemAtIndex:", objc_msgSend(v9, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "playbackStyle") == 4 || objc_msgSend(v13, "forceAllItemsAsVideo");
  -[PUFeedViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShowCommentBadgesInCollectionViewType:", v11);

  if (v16)
    v17 = objc_msgSend(v12, "totalCommentsCount");
  else
    v17 = 0;
  -[PUFeedViewController _indexPathForImageHiddenDuringZoomTransition](self, "_indexPathForImageHiddenDuringZoomTransition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqual:", v9);

  if (objc_msgSend(v12, "playbackStyle") == 3
    || objc_msgSend(v12, "playbackStyle") == 5
    || objc_msgSend(v13, "forceLivePhotoBadges"))
  {
    v14 |= 4uLL;
  }
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setImageContentMode:", 2);
  objc_msgSend(v8, "setOverlayOptions:", v14);
  objc_msgSend(v8, "setCommentCount:", v17);
  objc_msgSend(v8, "setImageHidden:", v19);
  v20 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v20);
  objc_msgSend(v10, "collectionViewLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frameForTileAtIndexPath:", v9);
  v23 = v22;
  v25 = v24;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__PUFeedViewController__configureImageCell_forAssetAtIndexPath_inCollectionView___block_invoke;
  v28[3] = &unk_1E589EF48;
  v29 = v8;
  v30 = v20;
  v26 = v8;
  -[PUFeedViewController _requestImageForAsset:tileSize:completion:](self, "_requestImageForAsset:tileSize:completion:", v12, v28, v23, v25);

}

- (void)_configureImageCell:(id)a3 forThumbnailAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  unsigned __int16 v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  int v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v11;
  objc_msgSend(v11, "assetForItemAtIndex:", objc_msgSend(v9, "item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thumbnailSize");
  v15 = v14;
  v17 = v16;

  -[PUFeedViewController spec](self, "spec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldUseAspectThumbnails");

  if ((objc_msgSend(v12, "isVideo") & 1) != 0
    || (+[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "forceAllItemsAsVideo"),
        v20,
        v21))
  {
    v22 = 2;
    if (v19)
    {
LABEL_4:
      objc_msgSend(v12, "imageSize");
      v24 = v23;
      v26 = v25;
      -[PUFeedViewController spec](self, "spec");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "thumbnailSizeForImageSize:", v24, v26);
      v29 = v28;
      v31 = v30;

      goto LABEL_7;
    }
  }
  else
  {
    v22 = 0;
    if (v19)
      goto LABEL_4;
  }
  v29 = *MEMORY[0x1E0C9D820];
  v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_7:
  -[PUFeedViewController _indexPathForImageHiddenDuringZoomTransition](self, "_indexPathForImageHiddenDuringZoomTransition");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqual:", v9);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setImageContentMode:", 2);
  objc_msgSend(v8, "setTappable:", 1);
  objc_msgSend(v8, "setOverlayOptions:", v22);
  objc_msgSend(v8, "setMaximumImageSize:", v29, v31);
  objc_msgSend(v8, "setImageAlignment:", 1);
  objc_msgSend(v8, "setImageHidden:", v33);
  objc_msgSend(v8, "setCornerRadius:", 4.0);
  v34 = objc_msgSend(v8, "tag") + 1;
  objc_msgSend(v8, "setTag:", v34);
  v58 = 0;
  -[PUFeedViewController spec](self, "spec");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageSize");
  objc_msgSend(v35, "getFastImageFormat:qualityImageFormat:forSourceSize:destinationSize:allowCrop:", (char *)&v58 + 2, &v58, v19 ^ 1u);

  v36 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v36, "setAllowPlaceholder:", 1);
  v52 = v9;
  if (!(_WORD)v58)
    objc_msgSend(v36, "setDeliveryMode:", 1, v9);
  objc_msgSend(v36, "setResizeMode:", 1, v52);
  objc_msgSend(v36, "setNetworkAccessAllowed:", 1);
  if ((_WORD)v58)
    v37 = v58;
  else
    v37 = HIWORD(v58);
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "contentMode");
  objc_msgSend(v38, "sizeWithFallBackSize:", v15, v17);
  v41 = v40;
  v43 = v42;
  v44 = objc_alloc(MEMORY[0x1E0CD1428]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithPLManagedObject:photoLibrary:", v12, v45);

  v47 = *MEMORY[0x1E0CD19C0];
  v59[0] = *MEMORY[0x1E0CD1960];
  v59[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v46, "newObjectWithPropertySets:", v48);

  -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __85__PUFeedViewController__configureImageCell_forThumbnailAtIndexPath_inCollectionView___block_invoke;
  v55[3] = &unk_1E589EFC0;
  v56 = v8;
  v57 = v34;
  v51 = v8;
  objc_msgSend(v50, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v49, v39, v36, v55, v41, v43);

}

- (void)_configureStackCell:(id)a3 forThumbnailsAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  PUFeedViewController *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  int v50;
  int v51;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v8, "section"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setTappable:", 1);
  objc_msgSend(v10, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "item");
  objc_msgSend(v11, "assetsForItemAtIndex:maximumCount:", v13, PUFeedStackViewMaximumNumberOfVisibleItems);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfVisibleItems:", objc_msgSend(v14, "count"));
  -[PUFeedViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "thumbnailSize");
  v17 = v16;
  v19 = v18;

  -[PUFeedViewController spec](self, "spec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldUseAspectThumbnails");

  objc_msgSend(v14, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageSize");
  v24 = v23;
  v26 = v25;

  if ((v21 & 1) != 0)
  {
    -[PUFeedViewController spec](self, "spec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "thumbnailSizeForImageSize:", v24, v26);
    v29 = v28;
    v31 = v30;

  }
  else
  {
    v31 = v19;
    v29 = v17;
  }
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "configureCloudFeedStackView:withStackSize:", v12, v29, v31);
  objc_msgSend(v12, "setStyle:", v21);
  objc_msgSend(v9, "backgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHasRoundedCorners:withCornersBackgroundColor:", 1, v33);

  objc_msgSend(v12, "setPosterSquareCornerRadius:", 4.0);
  v51 = 0;
  -[PUFeedViewController spec](self, "spec");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "getFastImageFormat:qualityImageFormat:forSourceSize:destinationSize:allowCrop:", (char *)&v51 + 2, &v51, v21 ^ 1, v24, v26, v17, v19);

  -[PUFeedViewController _indexPathForImageHiddenDuringZoomTransition](self, "_indexPathForImageHiddenDuringZoomTransition");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v12, "tag") + 1;
  objc_msgSend(v12, "setTag:", v36);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __86__PUFeedViewController__configureStackCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke;
  v40[3] = &unk_1E589F010;
  v45 = v29;
  v46 = v31;
  v41 = v35;
  v42 = v8;
  v50 = v51;
  v47 = v17;
  v48 = v19;
  v43 = v12;
  v44 = self;
  v49 = v36;
  v37 = v12;
  v38 = v8;
  v39 = v35;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v40);

}

- (void)_configureBadgedThumbnailCell:(id)a3 forThumbnailsAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  _QWORD v30[5];
  id v31;
  double v32;
  double v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setTappable:", 1);
  objc_msgSend(v10, "badgedThumbnailView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "item");
  objc_msgSend(v11, "assetsForItemAtIndex:maximumCount:", v13, PUFeedStackViewMaximumNumberOfVisibleItems);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfItems:", objc_msgSend(v14, "count"));
  -[PUFeedViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "thumbnailSize");
  v17 = v16;
  v19 = v18;
  if (objc_msgSend(v14, "count") == 1)
    v20 = objc_msgSend(v15, "shouldUseAspectThumbnails");
  else
    v20 = 0;
  objc_msgSend(v14, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageSize");
  v23 = v22;
  v25 = v24;

  if (v20)
  {
    objc_msgSend(v15, "thumbnailSizeForImageSize:", v23, v25);
    v17 = v26;
    v19 = v27;
  }
  v37 = 0;
  objc_msgSend(v11, "getCommentCount:likeCount:", 0, &v37);
  objc_msgSend(v12, "setShowBadge:", v37 != 0);
  v36 = 0;
  objc_msgSend(v15, "getFastImageFormat:qualityImageFormat:forSourceSize:destinationSize:allowCrop:", (char *)&v36 + 2, &v36, v20 ^ 1u, v23, v25, v17, v19);
  v28 = objc_msgSend(v12, "tag") + 1;
  objc_msgSend(v12, "setTag:", v28);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v17, v19);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __96__PUFeedViewController__configureBadgedThumbnailCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke;
  v30[3] = &unk_1E589F038;
  v35 = v36;
  v32 = v17;
  v33 = v19;
  v30[4] = self;
  v31 = v12;
  v34 = v28;
  v29 = v12;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);

}

- (void)_configureCaptionCell:(id)a3 forCaptionAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a4;
  v8 = a5;
  v9 = a3;
  -[PUFeedViewController spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v8);
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v23, "section"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "sectionType");
  if (v11 == 1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_msgSend(v10, "textInsetsForHeadersAndFootersInSectionType:collectionViewType:", v13, v11);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setSectionInfo:", v12);
  objc_msgSend(v9, "setCaptionItemIndex:", objc_msgSend(v23, "item"));
  objc_msgSend(v9, "setHideCaption:", isKindOfClass & 1);
  objc_msgSend(v9, "setContentInsets:", v16, v18, v20, v22);

}

- (void)_configureTextCell:(id)a3 forCommentAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v8 = a5;
  v9 = a4;
  v25 = a3;
  v10 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v8);
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v8);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "item");
  objc_msgSend(v26, "commentForItemAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commentText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultTextAttributesForCollectionViewType:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emphasizedTextAttributesForCollectionViewType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultSubTitleTextAttributesForCollectionViewType:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "isMyComment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCommentWithText:defaultTextAttributes:emphasizedTextAttributes:", v13, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "commenterDisplayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForCommentWithCommenterFullName:text:defaultTextAttributes:emphasizedTextAttributes:", v21, v13, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "commentDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _textForDate:](self, "_textForDate:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:", v23, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configureTextCell:forCommentWithDescriptionPhrase:date:", v25, v20, v24);

}

- (void)_configureTextCell:(id)a3 forLikesAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  PUFeedViewController *v49;
  void *v50;
  char v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v8 = a4;
  v9 = a5;
  v43 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);
  v49 = self;
  v46 = v9;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v8, "section"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v8;
  objc_msgSend(v10, "likesForItemAtIndex:", objc_msgSend(v8, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v10;
  objc_msgSend(v10, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v51 = 0;
    v18 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        v20 = v13;
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v21, "isMyComment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "BOOLValue");

        if ((v23 & 1) != 0)
        {
          v51 = 1;
        }
        else
        {
          objc_msgSend(v21, "commenterDisplayName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "length"))
            objc_msgSend(v50, "addObject:", v24);

        }
        objc_msgSend(v21, "asset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 && (objc_msgSend(v12, "containsObject:", v25) & 1) == 0)
        {
          objc_msgSend(v12, "addObject:", v25);
          v26 = objc_msgSend(v25, "isVideo");
          v16 += v26;
          v17 += v26 ^ 1;
        }
        objc_msgSend(v21, "commentDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v51 = 0;
  }

  v27 = objc_msgSend(v50, "count");
  -[PUFeedViewController spec](v49, "spec");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "defaultTextAttributesForCollectionViewType:", v43);
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "emphasizedTextAttributesForCollectionViewType:", v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "defaultSubTitleTextAttributesForCollectionViewType:", v43);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 + v16)
  {
    v32 = v27 + (v51 & 1);
    if (v17 + v16 > 1)
    {
      v34 = (void *)v29;
      if (v32 > 1)
      {
        v36 = 0;
      }
      else
      {
        objc_msgSend(v12, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "cloudShareAlbum");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedTitle");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1E0CB3498];
        objc_msgSend(v50, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "px_localizedAttributedStringForLikesFromUser:orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:", v51 & 1, v40, v17, v16, v44, v34, v30, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v33 = objc_msgSend(v28, "largeNumberOfSubjectsForLikes");
      v34 = (void *)v29;
      if (v33 && v32 > v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesWithLikerCount:isVideo:defaultTextAttributes:emphasizedTextAttributes:", v32, v16 > 0, v29, v30);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesFromUser:otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:", v51 & 1, v50, v16 > 0, v29, v30);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (void *)v35;
    }
  }
  else
  {
    v36 = 0;
    v34 = (void *)v29;
  }
  -[PUFeedViewController _textForDate:](v49, "_textForDate:", v13);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:", v41, v31);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "configureTextCell:forLikesWithDescriptionPhrase:date:", v48, v36, v42);

}

- (void)_configureTextCell:(id)a3 forTextAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v8, "section"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultTextAttributesForCollectionViewType:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emphasizedTextAttributesForCollectionViewType:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v11, "sectionType");
  if (v16 == 4)
  {
    objc_msgSend(v11, "invitationRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "album");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inviteeDisplayNameIncludingEmail:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invitationState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    v22 = v21 == 2;
    objc_msgSend(v18, "localizedTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:", v19, v23, v22, v13, v15, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController spec](self, "spec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configureTextCell:forEventWithDescriptionPhrase:", v26, v24);

  }
  else
  {
    NSLog(CFSTR("unexpected section type %li for text at index path %@"), v16, v8);
  }

}

- (void)_configureTitleCell:(id)a3 forTextAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v8, "section"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sectionType");
  if (v11 == 4)
  {
    objc_msgSend(v12, "setCollectionViewType:", -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9));
    objc_msgSend(v12, "setSectionInfo:", v10);
  }
  else
  {
    NSLog(CFSTR("unexpected section type %li for text at index path %@"), v11, v8);
  }

}

- (void)_configureInvitationCell:(id)a3 forInvitationAtIndexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  uint64_t v15;
  id v16;

  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(a4, "section");
  v11 = -[PUFeedViewController _numberOfSectionInfosForCollectionView:](self, "_numberOfSectionInfosForCollectionView:", v8);
  v12 = -[PUFeedViewController contentType](self, "contentType");
  v13 = v12 != 2;
  v14 = v12 == 2;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", v10, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setUseInPopover:", v14);
  v15 = v10 == v11 - 1 || v13;
  objc_msgSend(v9, "setShowHeader:", v15);
  objc_msgSend(v9, "setShowFooter:", v13);
  objc_msgSend(v9, "setInvitationSectionInfo:", v16);

}

- (void)_getDescriptionPhrase:(id *)a3 streamDisclosureLabel:(id *)a4 actionText:(id *)a5 buttonType:(int64_t *)a6 forSections:(id)a7 inCollectionView:(id)a8
{
  id v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int64_t *v24;
  void *v25;
  int64_t v26;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  char v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  id v60;
  id *v61;
  void *v62;
  void *v63;
  void *v66;
  void *v68;
  __CFString *v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = a8;
  v13 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v12);
  v68 = v11;
  -[PUFeedViewController _sectionInfosForSections:collectionView:](self, "_sectionInfosForSections:collectionView:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sectionType");
  -[PUFeedViewController spec](self, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultTextAttributesForCollectionViewType:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController spec](self, "spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emphasizedTextAttributesForCollectionViewType:", v13);
  v20 = objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController spec](self, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "defaultSubTitleTextAttributesForCollectionViewType:", v13);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "albumTitle");
  v22 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)v20;
  v69 = (__CFString *)v22;
  if (v16 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCreatingStreamWithName:defaultTextAttributes:emphasizedTextAttributes:", v22, v18, v20);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = 0;
    v28 = a5;
    v24 = a6;
    if (!a3)
      goto LABEL_55;
    goto LABEL_54;
  }
  if (v16 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserJoiningStreamWithName:defaultTextAttributes:emphasizedTextAttributes:", v22, v18, v20);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sharedAlbum");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a6;
    if (objc_msgSend(v23, "canContributeToCloudSharedAlbum"))
    {
      PXLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v28 = a5;

    v26 = 0;
    v27 = 0;
    if (!a3)
      goto LABEL_55;
LABEL_54:
    *a3 = objc_retainAutorelease(v71);
    goto LABEL_55;
  }
  if (objc_msgSend(v15, "numberOfItems") < 1)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(v15, "assetForItemAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59 = v18;
  v57 = objc_msgSend(v29, "cloudIsMyAsset");
  v60 = v12;
  v63 = v14;
  v58 = v29;
  if ((v57 & 1) != 0)
  {
    v62 = 0;
  }
  else
  {
    objc_msgSend(v29, "cloudOwnerDisplayName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v31 = v63;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v77 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "countsByAssetDisplayType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "unionSet:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v33);
  }
  v61 = a3;

  v18 = v59;
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:defaultTextAttributes:subjectName:", v30, v59, v62);
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "configurationForSectionHeaderType:collectionViewType:", 3, v13);

  if (v38)
  {
    v39 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v69)
      v40 = v69;
    else
      v40 = &stru_1E58AD278;
    v27 = (void *)objc_msgSend(v39, "initWithString:attributes:", v40, v70);
  }
  else
  {
    v27 = 0;
  }
  -[PUFeedViewController spec](self, "spec");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "configurationForSectionHeaderType:collectionViewType:", 4, v13);

  if (v42)
    v43 = v57;
  else
    v43 = 1;
  if ((v43 & 1) != 0)
  {
    v26 = 0;
    v28 = a5;
  }
  else
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v44 = v31;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v73;
      v48 = 1;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v73 != v47)
            objc_enumerationMutation(v44);
          v48 &= objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "areAllAssetsLiked");
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v46);
    }
    else
    {
      v48 = 1;
    }

    v50 = objc_msgSend(v68, "firstIndex");
    -[PUFeedViewController _justLikedSections](self, "_justLikedSections");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKey:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
      v48 = objc_msgSend(v53, "BOOLValue");
    v54 = objc_msgSend(v30, "count");
    v55 = 3;
    if (!v48)
      v55 = 1;
    v56 = 7;
    if (v48)
      v56 = 10;
    if (v54 >= 2)
      v26 = v56;
    else
      v26 = v55;

    v28 = a5;
    a3 = v61;
  }

  v25 = 0;
  v12 = v60;
  v14 = v63;
  v24 = a6;
  if (a3)
    goto LABEL_54;
LABEL_55:
  if (a4)
    *a4 = objc_retainAutorelease(v27);
  if (v28)
    *v28 = objc_retainAutorelease(v25);
  if (v24)
    *v24 = v26;

}

- (void)_configureTextCell:(id)a3 forHeaderOfSections:(id)a4 inCollectionView:(id)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v10 = a5;
  v11 = a3;
  -[PUFeedViewController _getDescriptionPhrase:streamDisclosureLabel:actionText:buttonType:forSections:inCollectionView:](self, "_getDescriptionPhrase:streamDisclosureLabel:actionText:buttonType:forSections:inCollectionView:", &v22, &v21, &v20, &v23, a4, v10);
  v12 = v21;
  v13 = v22;
  v14 = v20;
  v15 = v12;
  v16 = v13;
  objc_msgSend(v11, "setDelegate:", self);
  v17 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v10);

  -[PUFeedViewController spec](self, "spec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = a6;
  objc_msgSend(v18, "configureTextCell:forSectionHeaderWithDescriptionPhrase:streamDisclosureLabel:actionText:buttonType:collectionViewType:animated:", v11, v16, v15, v14, v23, v17, v19);

}

- (void)_configureTitleCell:(id)a3 forHeaderOfSections:(id)a4 inCollectionView:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v9 = a5;
  v10 = a3;
  -[PUFeedViewController _sectionInfosForSections:collectionView:](self, "_sectionInfosForSections:collectionView:", a4, v9);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);

  v13 = objc_msgSend(v11, "sectionType");
  if (objc_msgSend(v11, "sectionType"))
    v14 = 1;
  else
    v14 = 2;
  -[PUFeedViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textInsetsForHeadersAndFootersInSectionType:collectionViewType:", v13, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setContentInsets:", v17, v19, v21, v23);
  objc_msgSend(v10, "setCollectionViewType:", v12);
  objc_msgSend(v10, "setTappable:", 1);
  objc_msgSend(v10, "setTappableArea:", v14);
  objc_msgSend(v10, "setSectionInfo:", v11);

}

- (BOOL)_configureTextCell:(id)a3 forFooterOfSection:(int64_t)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a5;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);
  objc_msgSend(v9, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "configurationForSectionHeaderType:collectionViewType:", 6, v11);

  if (v14 && objc_msgSend(v12, "numberOfTilesOmittedInSection:", a4) >= 1)
  {
    objc_msgSend(v8, "setDelegate:", self);
    v15 = 1;
    objc_msgSend(v8, "setTappable:", 1);
    v21 = 0;
    v22 = 0;
    objc_msgSend(v10, "getPhotoCount:videoCount:", &v22, &v21);
    PXLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21 + v22;
    PULocalizedStringWithValidatedFormat(v16, CFSTR("%ld"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController spec](self, "spec", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configureTextCell:forSectionFooterWithActionText:collectionViewType:", v8, v17, v11);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_configureTextCell:(id)a3 forHeaderOfGroupID:(id)a4 inCollectionView:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  v9 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUFeedViewController _textForDate:](self, "_textForDate:", v16);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 1555, CFSTR("unexpected groupID class %@"), v16);

      v12 = 0;
      goto LABEL_7;
    }
    v11 = v16;
  }
  v12 = v11;
LABEL_7:
  v14 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);
  -[PUFeedViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureTextCell:forSectionGroupHeaderWithText:collectionViewType:", v10, v12, v14);

}

- (BOOL)_shouldHideSectionWithType:(int64_t)a3 inCollectionViewType:(int64_t)a4
{
  BOOL v7;
  char v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (a3)
    v7 = a3 == 3;
  else
    v7 = 1;
  v8 = v7;
  v9 = -[PUFeedViewController contentType](self, "contentType");
  if (v9 == 2)
  {
    v8 = a3 != 2;
  }
  else
  {
    if (v9 == 1)
      goto LABEL_17;
    if (v9)
    {
LABEL_14:
      v8 = 0;
      goto LABEL_17;
    }
    if (a4 != 1)
    {
      if (!a4 && a3 == 2)
      {
        -[PUFeedViewController spec](self, "spec");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v10, "shouldShowInvitationsInPopover");

        goto LABEL_17;
      }
      goto LABEL_14;
    }
    v8 ^= 1u;
  }
LABEL_17:
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "feedContent");

  if (v12 == 2)
  {
    if (a3 == 3 || !a3)
      return 1;
  }
  else if (v12 == 1 && a3 != 0 && a3 != 3)
  {
    return 1;
  }
  return v8;
}

- (BOOL)_shouldHideHeaderForSectionWithType:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x16u >> a3);
}

- (BOOL)_shouldJoinSectionInfo:(id)a3 withSectionInfo:(id)a4 collectionViewType:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  if (a5 == 1
    && (v9 = objc_msgSend(v7, "sectionType"), v9 == objc_msgSend(v8, "sectionType"))
    && objc_msgSend(v7, "numberOfItems"))
  {
    v10 = 0;
    if (objc_msgSend(v8, "numberOfItems") && v9 != 3)
    {
      objc_msgSend(v7, "assetForItemAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetForItemAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudShareAlbum");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cloudShareAlbum");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
        v10 = objc_msgSend(v11, "cloudHasSameOwnerAsAsset:", v12);
      else
        v10 = 0;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_groupIDForSectionWithInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "sectionType") != 2)
  {
    -[PUFeedViewController _dateForSectionWithInfo:](self, "_dateForSectionWithInfo:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v6;
    goto LABEL_7;
  }
  if (-[PUFeedViewController contentType](self, "contentType") != 2)
  {
    PXLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (id)_dateForSectionWithInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 30, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_textForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUFeedViewController _dateFormatter](self, "_dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_dateFormatterChanged:(id)a3
{
  if (-[PUFeedViewController _areViewsInSyncWithModel](self, "_areViewsInSyncWithModel", a3))
    -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
}

- (void)_configureCollectionView:(id)a3 isVertical:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);
  +[PUFeedImageCell preloadResources](PUFeedImageCell, "preloadResources");
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ImageCell"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PlayerCell"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CommentCell"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("LikesCell"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TitleCell"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("InvitationCell"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindCaption"), CFSTR("CaptionView"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindLikes"), CFSTR("LikesCell"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindComment"), CFSTR("CommentCell"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindSeparator"), CFSTR("SeparatorView"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindThumbnail"), CFSTR("AssetIcon"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindThumbnail"), CFSTR("Stack"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindThumbnail"), CFSTR("BadgedThumbnailCell"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindSectionHeader"), CFSTR("SectionHeaderView"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindSectionHeaderBackground"), CFSTR("SectionHeaderBackgroundView"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindSectionFooter"), CFSTR("SectionFooterView"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUFeedCollectionElementKindSectionGroupHeader"), CFSTR("SectionGroupHeaderView"));
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudFeedBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v7);
  objc_msgSend(v5, "setDragSourceDelegate:", self);
  objc_msgSend(v5, "setDragInteractionEnabled:", 1);

}

- (void)_appWillEnterForeground:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PUFeedViewController _userDidViewFeed](self, "_userDidViewFeed", a3);
  -[PUFeedViewController spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowInvitationsInPopover");

  if ((v5 & 1) == 0 && -[PUFeedViewController _areViewsInSyncWithModel](self, "_areViewsInSyncWithModel"))
  {
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexesOfInvitationsReceivedSectionInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[PUFeedViewController _collectionViews](self, "_collectionViews", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "collectionViewLayout");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "updateCollectionViewWithDeletedSections:insertedSections:updatedSections:", 0, 0, v7);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

    }
  }
  if (!-[PUFeedViewController _appJustEnteredForeground](self, "_appJustEnteredForeground"))
  {
    -[PUFeedViewController _setAppJustEnteredForeground:](self, "_setAppJustEnteredForeground:", 1);
    -[PUFeedViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__appDidFinishEnteringForeground, 0, 3.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D71F90];
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__contextDidFinishRemoteMerge_, v15, v17);

  }
  -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 0);
}

- (void)_contextDidFinishRemoteMerge:(id)a3
{
  if (-[PUFeedViewController _appJustEnteredForeground](self, "_appJustEnteredForeground", a3))
  {
    -[PUFeedViewController _userDidViewFeed](self, "_userDidViewFeed");
    if (-[PUFeedViewController _isInvitationsPopoverShowPending](self, "_isInvitationsPopoverShowPending"))
      -[PUFeedViewController _showInvitationsPopoverAnimated:](self, "_showInvitationsPopoverAnimated:", 0);
    -[PUFeedViewController _appDidFinishEnteringForeground](self, "_appDidFinishEnteringForeground");
  }
}

- (void)_appDidFinishEnteringForeground
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PUFeedViewController _appJustEnteredForeground](self, "_appJustEnteredForeground"))
  {
    -[PUFeedViewController _setAppJustEnteredForeground:](self, "_setAppJustEnteredForeground:", 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__appDidFinishEnteringForeground, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D71F90];
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, v3, v5);

  }
}

- (void)_userDidViewFeed
{
  int64_t v3;
  uint64_t v4;

  if (-[PUFeedViewController px_isVisible](self, "px_isVisible"))
  {
    v3 = -[PUFeedViewController contentType](self, "contentType");
    if (v3)
      v4 = 2 * (v3 == 1);
    else
      v4 = 3;
    objc_msgSend(MEMORY[0x1E0D71BA8], "userDidViewCloudFeedContent:", v4);
  }
}

- (void)_userDidScrollFeed
{
  -[PUFeedViewController _setRotationLastRestorableState:](self, "_setRotationLastRestorableState:", 0);
}

- (void)_setUserCloudSharedLiked:(BOOL)a3 forItemsInSections:(id)a4 inCollectionView:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  BOOL v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v6 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E20];
  v10 = a4;
  objc_msgSend(v9, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __85__PUFeedViewController__setUserCloudSharedLiked_forItemsInSections_inCollectionView___block_invoke;
  v29[3] = &unk_1E58A0380;
  v29[4] = self;
  v13 = v8;
  v30 = v13;
  v14 = v11;
  v31 = v14;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v29);

  if (objc_msgSend(v14, "count"))
  {
    v28 = 0;
    v15 = objc_msgSend(MEMORY[0x1E0D719E0], "canSetUserCloudSharedLiked:forAssets:error:", v6, v14, &v28);
    v16 = v28;
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v14, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __85__PUFeedViewController__setUserCloudSharedLiked_forItemsInSections_inCollectionView___block_invoke_2;
      v25[3] = &unk_1E58AAD68;
      v26 = v14;
      v27 = v6;
      objc_msgSend(v19, "performTransaction:", v25);
      v20 = v26;
    }
    else
    {
      objc_msgSend(v16, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedFailureReason");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addAction:", v24);

      -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
      v17 = (void *)v21;
    }

  }
}

- (void)_invalidatePreheatedAssets
{
  void *v3;
  void *v4;
  id v5;

  -[PUFeedViewController _lastPreheatIndexPathList](self, "_lastPreheatIndexPathList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PUFeedViewController _lastPreheatIndexPathInfoList](self, "_lastPreheatIndexPathInfoList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopCachingImagesForAllAssets");

}

- (void)_updatePreheatedAssetsForCollectionView:(id)a3
{
  objc_msgSend(a3, "contentOffset");
  -[PUFeedViewController _setLastPreheatedContentOffset:](self, "_setLastPreheatedContentOffset:");
}

- (void)_invalidateLastPreheatedContentOffset
{
  -[PUFeedViewController _setLastPreheatedContentOffset:](self, "_setLastPreheatedContentOffset:", 1.79769313e308, 1.79769313e308);
}

- (void)_preheatSectionInfosAtIndexes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  char v43;
  char v44;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldPreheatCoreData");

    if (v6)
    {
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldPreheatAssets");

      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldPreheatComments");

      objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "managedObjectContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __54__PUFeedViewController__preheatSectionInfosAtIndexes___block_invoke;
      v39[3] = &unk_1E589F060;
      v16 = v13;
      v40 = v16;
      v43 = v8;
      v17 = v14;
      v41 = v17;
      v44 = v10;
      v18 = v15;
      v42 = v18;
      objc_msgSend(v4, "enumerateIndexesUsingBlock:", v39);
      if (objc_msgSend(v17, "count"))
      {
        v19 = (void *)MEMORY[0x1E0C97B48];
        objc_msgSend(MEMORY[0x1E0D71880], "entityName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fetchRequestWithEntityName:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "setPropertiesToFetch:", &unk_1E59BA000);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPredicate:", v22);

        v38 = 0;
        objc_msgSend(v12, "executeFetchRequest:error:", v21, &v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v38;
        v25 = v24;
        if (!v23)
          NSLog(CFSTR("asset preheat fetch request failed: %@"), v24);

      }
      if (objc_msgSend(v18, "count"))
      {
        v35 = v16;
        objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudSharedComment"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setPropertiesToFetch:", &unk_1E59BA018);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudFeedCommentEntry IN %@"), v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setPredicate:", v27);

        objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudSharedComment"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPropertiesToFetch:", &unk_1E59BA030);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudFeedLikeCommentEntry IN %@"), v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPredicate:", v29);

        v37 = 0;
        objc_msgSend(v12, "executeFetchRequest:error:", v26, &v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v37;
        v32 = v31;
        if (!v30)
          NSLog(CFSTR("comment preheat fetch request failed: %@"), v31);
        v36 = v32;
        objc_msgSend(v12, "executeFetchRequest:error:", v28, &v36);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v36;

        if (!v33)
          NSLog(CFSTR("like preheat fetch request failed: %@"), v34);

        v16 = v35;
      }

    }
  }

}

- (BOOL)_areSharedStreamsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v2, "photoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "sharedStreamsEnabledForPhotoLibraryURL:", v4);

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateSharedStreamsEnabled");

  LOBYTE(v3) = objc_msgSend((id)*MEMORY[0x1E0DC4730], "launchedToTest") | v6 | v3;
  return (char)v3;
}

- (BOOL)_isAnySharedAlbumAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[PUFeedViewController _areSharedStreamsEnabled](self, "_areSharedStreamsEnabled"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUFeedViewController _sharedAlbumList](self, "_sharedAlbumList", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isOwnedCloudSharedAlbum") & 1) != 0
          || !objc_msgSend(v9, "isPendingPhotoStreamAlbum"))
        {
          v10 = 1;
          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (BOOL)_isLibraryUpdatingTimeoutExpired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v9;

  if (!-[PUFeedViewController _hasCheckedLibraryUpdatingExpiration](self, "_hasCheckedLibraryUpdatingExpiration"))
  {
    objc_msgSend(MEMORY[0x1E0D719C0], "sharedBundleController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openBundleAtLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "indicatorFileCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _setLibraryUpdatingPreviouslyExpired:](self, "_setLibraryUpdatingPreviouslyExpired:", objc_msgSend(v7, "isStreamsLibraryUpdatingExpired"));
    if (!-[PUFeedViewController _isLibraryUpdatingPreviouslyExpired](self, "_isLibraryUpdatingPreviouslyExpired"))
      objc_msgSend(v7, "setStreamsLibraryUpdatingExpired:", 1);
    -[PUFeedViewController _setCheckedLibraryUpdatingExpiration:](self, "_setCheckedLibraryUpdatingExpiration:", 1);

  }
  if (-[PUFeedViewController _isLibraryUpdatingPreviouslyExpired](self, "_isLibraryUpdatingPreviouslyExpired"))
    return 1;
  if (_isLibraryUpdatingTimeoutExpired_otherToken != -1)
    dispatch_once(&_isLibraryUpdatingTimeoutExpired_otherToken, &__block_literal_global_28556);
  objc_msgSend((id)_libraryUpdatingTimeoutStartDate, "timeIntervalSinceNow");
  return v9 < -120.0;
}

- (void)_libraryUpdatingDidExpire:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PUFeedViewController__libraryUpdatingDidExpire___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)_shouldShowTransitionUI
{
  void *v3;
  int v4;

  if (-[PUFeedViewController _isLibraryUpdatingTimeoutExpired](self, "_isLibraryUpdatingTimeoutExpired")
    || !-[PUFeedViewController _areSharedStreamsEnabled](self, "_areSharedStreamsEnabled"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasEnoughCloudFeedAssetEntriesToDisplay") ^ 1;

  }
  return v4;
}

- (int64_t)_placeholderTypeForSizeTransitionState:(int64_t)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  BOOL v16;
  BOOL v17;

  if (-[PUFeedViewController contentType](self, "contentType"))
    return 0;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSectionInfos");
  if (v7 < 1)
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "numberOfInvitationsReceived");
  if (-[PUFeedViewController _shouldShowTransitionUI](self, "_shouldShowTransitionUI"))
  {
    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isNetworkReachable");

    if (v10)
      v5 = 4;
    else
      v5 = 5;
    goto LABEL_31;
  }
  if (!v7)
  {
    v5 = -[PUFeedViewController _userDidDismissPlaceholder](self, "_userDidDismissPlaceholder") ^ 1;
    goto LABEL_31;
  }
  if (v8 >= v7)
  {
    if (a3)
      v11 = -[PUFeedViewController _targetCollectionViewType](self, "_targetCollectionViewType");
    else
      v11 = -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType");
    v14 = v11;
    -[PUFeedViewController spec](self, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "shouldShowInvitationsInPopover") & 1) != 0)
    {

    }
    else
    {
      v16 = -[PUFeedViewController _shouldHideSectionWithType:inCollectionViewType:](self, "_shouldHideSectionWithType:inCollectionViewType:", 2, v14);

      if (v16)
      {
        v5 = 3;
        goto LABEL_31;
      }
    }
    if (-[PUFeedViewController _userDidDismissPlaceholder](self, "_userDidDismissPlaceholder"))
      v5 = 0;
    else
      v5 = 2;
    goto LABEL_31;
  }
  if (a3)
    -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
  else
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateLayout");
  objc_msgSend(v13, "prepareLayout");
  if (-[PUFeedViewController _isCollectionViewEmpty:](self, "_isCollectionViewEmpty:", v12)
    && !-[PUFeedViewController _userDidDismissPlaceholder](self, "_userDidDismissPlaceholder"))
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }

LABEL_31:
  v17 = -[PUFeedViewController _areSharedStreamsEnabled](self, "_areSharedStreamsEnabled");
  if (v5 != 2 && !v17 && !-[PUFeedViewController _userDidDismissPlaceholder](self, "_userDidDismissPlaceholder"))
    v5 = 1;

  return v5;
}

- (void)_configureSpeedometer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speedometerMediumUpperThreshold");
  objc_msgSend(v3, "setMediumUpperThreshold:");
  objc_msgSend(v4, "speedometerMediumLowerThreshold");
  objc_msgSend(v3, "setMediumLowerThreshold:");
  objc_msgSend(v4, "speedometerFastUpperThreshold");
  objc_msgSend(v3, "setFastUpperThreshold:");
  objc_msgSend(v4, "speedometerFastLowerThreshold");
  objc_msgSend(v3, "setFastLowerThreshold:");

}

- (void)_startObservingPopoverContentSizeIfNecessary
{
  id v3;

  if (-[PUFeedViewController contentType](self, "contentType") == 2
    && !-[PUFeedViewController observingPopoverContentSizeChange](self, "observingPopoverContentSizeChange"))
  {
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 1, 0);
    -[PUFeedViewController setObservingPopoverContentSizeChange:](self, "setObservingPopoverContentSizeChange:", 1);

  }
}

- (void)_stopObservingPopoverContentSizeIfNecessary
{
  id v3;

  if (-[PUFeedViewController contentType](self, "contentType") == 2)
  {
    if (-[PUFeedViewController observingPopoverContentSizeChange](self, "observingPopoverContentSizeChange"))
    {
      -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));
      -[PUFeedViewController setObservingPopoverContentSizeChange:](self, "setObservingPopoverContentSizeChange:", 0);

    }
  }
}

- (void)_setViewDidAppear:(BOOL)a3
{
  if (self->__viewDidAppear != a3)
  {
    self->__viewDidAppear = a3;
    -[PUFeedViewController _updateCellsVideoEnabledness](self, "_updateCellsVideoEnabledness");
  }
}

- (BOOL)_setupBrowsingFromItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v7, "section"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "item");
  v10 = objc_msgSend(v8, "typeForItemAtIndex:", v9);
  switch(v10)
  {
    case 2:
      objc_msgSend(v8, "likesForItemAtIndex:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      objc_msgSend(v8, "commentForItemAtIndex:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(v8, "assetForItemAtIndex:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_9;
    default:
      v12 = 0;
      break;
  }
  v11 = 0;
LABEL_9:
  if (v11 | v12)
    -[PUFeedViewController _setupBrowsingFromAsset:orComment:](self, "_setupBrowsingFromAsset:orComment:", v11, v12);

  return (v11 | v12) != 0;
}

- (void)_setupBrowsingFromAsset:(id)a3 orComment:(id)a4
{
  id v6;

  v6 = a4;
  -[PUFeedViewController _setBrowsingSelectedAsset:](self, "_setBrowsingSelectedAsset:", a3);
  -[PUFeedViewController _setBrowsingSelectedComment:](self, "_setBrowsingSelectedComment:", v6);

  -[PUFeedViewController _updateBrowsingAssetContainerList](self, "_updateBrowsingAssetContainerList");
  -[PUFeedViewController _updateOneUpDataSource](self, "_updateOneUpDataSource");
}

- (void)_tearDownBrowsing
{
  -[PUFeedViewController _setBrowsingSelectedAsset:](self, "_setBrowsingSelectedAsset:", 0);
  -[PUFeedViewController _setBrowsingSelectedComment:](self, "_setBrowsingSelectedComment:", 0);
  -[PUFeedViewController _setBrowsingAssetContainerList:](self, "_setBrowsingAssetContainerList:", 0);
}

- (void)_updateBrowsingAssetContainerList
{
  int64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  uint64_t *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = -[PUFeedViewController _browsingSelectedSection](self, "_browsingSelectedSection");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v5 = v3;
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionInfoAtIndex:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isLoaded") & 1) == 0)
      -[PUFeedViewController _ensureWindowOfLoadedSectionInfosIncludesSection:](self, "_ensureWindowOfLoadedSectionInfosIncludesSection:", v5);

  }
  -[PUFeedViewController _sectionInfosForBrowsingFromSectionInfo:](self, "_sectionInfosForBrowsingFromSectionInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D7B3E8]);
    -[PUFeedViewController _setBrowsingAssetContainerList:](self, "_setBrowsingAssetContainerList:", v8);
  }
  objc_msgSend(v8, "setSectionInfos:", v7);
  -[PUFeedViewController _pushedViewController](self, "_pushedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EEC46E38))
  {
    v10 = v9;
    v11 = (void *)MEMORY[0x1E0CD14A0];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke;
    v23[3] = &unk_1E589F0C8;
    v13 = &v24;
    v24 = v10;
    v14 = v10;
    v15 = v23;
LABEL_12:
    objc_msgSend(v11, "pl_simulateChangeWithAssetContainerList:photoLibrary:handler:", v8, v12, v15, v18, v19, v20, v21);

    goto LABEL_13;
  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EEC09FD8))
  {
    v16 = v9;
    v11 = (void *)MEMORY[0x1E0CD14A0];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke_3;
    v21 = &unk_1E589F0C8;
    v13 = &v22;
    v22 = v16;
    v17 = v16;
    v15 = &v18;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_updateOneUpDataSource
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 2205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataSourceManager isKindOfClass:[PUPhotoKitDataSourceManager class]]"));

    }
    -[PUFeedViewController _createOneUpPhotosDataSource](self, "_createOneUpPhotosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPhotosDataSource:", v7);

    -[PUFeedViewController _setOneUpDataSourceUpdateScheduled:](self, "_setOneUpDataSourceUpdateScheduled:", 0);
    v6 = v9;
  }

}

- (void)_scheduleOneUpDataSourceUpdate
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[PUFeedViewController _isOneUpDataSourceUpdateScheduled](self, "_isOneUpDataSourceUpdateScheduled"))
  {
    -[PUFeedViewController _setOneUpDataSourceUpdateScheduled:](self, "_setOneUpDataSourceUpdateScheduled:", 1);
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__PUFeedViewController__scheduleOneUpDataSourceUpdate__block_invoke;
    v4[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_performOneUpDataSourceUpdateNow
{
  void *v3;

  if (-[PUFeedViewController _isOneUpDataSourceUpdateScheduled](self, "_isOneUpDataSourceUpdateScheduled"))
  {
    -[PUFeedViewController _setOneUpDataSourceUpdateScheduled:](self, "_setOneUpDataSourceUpdateScheduled:", 0);
    -[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[PUFeedViewController _updateOneUpDataSource](self, "_updateOneUpDataSource");
  }
}

- (id)_browsingSelectedIndexPath
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 2237, CFSTR("browsing not prepared yet"));

  }
  objc_msgSend(v4, "sectionInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUFeedViewController _browsingSelectedSection](self, "_browsingSelectedSection");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionInfoAtIndex:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_msgSend(v5, "indexOfObject:", v7);
  -[PUFeedViewController _browsingSelectedComment](self, "_browsingSelectedComment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _browsingSelectedAsset](self, "_browsingSelectedAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v7, "indexOfItemWithAsset:", v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLCloudFeedGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "asset not found in section info (asset=%@; sectionInfo=%@)",
        (uint8_t *)&v18,
        0x16u);
    }

    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)_browsingSelectedSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;

  -[PUFeedViewController _browsingSelectedComment](self, "_browsingSelectedComment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _browsingSelectedAsset](self, "_browsingSelectedAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "asset");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "cloudFeedEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfSectionInfoForCloudFeedEntry:", v9);

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL && v7)
  {
    objc_msgSend(v7, "cloudFeedAssetsEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfSectionInfoForCloudFeedEntry:", v11);

  }
  return v10;
}

- (id)_sectionInfosForBrowsingFromSectionInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v4 = a3;
  if (objc_msgSend(v4, "hasMultipleAssetsForItemAtIndex:", 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", -[PUFeedViewController _loadedSectionInfosWindowSize](self, "_loadedSectionInfosWindowSize"));
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "numberOfSectionInfos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUFeedViewController _isFlowDirectionReversed](self, "_isFlowDirectionReversed"))
      v9 = 2;
    else
      v9 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __64__PUFeedViewController__sectionInfosForBrowsingFromSectionInfo___block_invoke;
    v27[3] = &unk_1E58A0380;
    v10 = v7;
    v28 = v10;
    v11 = v4;
    v29 = v11;
    v12 = v6;
    v30 = v12;
    objc_msgSend(v8, "enumerateIndexesWithOptions:usingBlock:", v9, v27);
    if (objc_msgSend(v11, "sectionType") == 1)
    {
      v13 = objc_msgSend(v12, "indexOfObject:", v11);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = v13;
        objc_msgSend(v11, "assetForItemAtIndex:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        if (v14 < (unint64_t)(objc_msgSend(v12, "count") - 1))
        {
          objc_msgSend(v12, "objectAtIndex:", v14 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!objc_msgSend(v15, "typeForItemAtIndex:", 0))
        {
          objc_msgSend(v15, "assetForItemAtIndex:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v26);

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setExcludedAssetIndexes:", v18);

          }
        }
        if (v14 < 1)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndex:", v14 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v20 = objc_msgSend(v19, "numberOfItems") - 1;
        if (!objc_msgSend(v19, "typeForItemAtIndex:", v20))
        {
          objc_msgSend(v19, "assetForItemAtIndex:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqual:", v26);

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setExcludedAssetIndexes:", v23);

          }
        }

      }
    }
    v24 = v30;
    v5 = v12;

  }
  return v5;
}

- (void)_navigateToOneUpBrowserAnimated:(BOOL)a3
{
  -[PUFeedViewController _navigateToOneUpBrowserWithOptions:animated:](self, "_navigateToOneUpBrowserWithOptions:animated:", 0, a3);
}

- (void)_navigateToOneUpBrowserWithOptions:(int64_t)a3 animated:(BOOL)a4
{
  -[PUFeedViewController _navigateToOneUpBrowserWithOptions:animated:pinchGestureRecognizer:](self, "_navigateToOneUpBrowserWithOptions:animated:pinchGestureRecognizer:", a3, a4, 0);
}

- (void)_navigateToOneUpBrowserWithOptions:(int64_t)a3 animated:(BOOL)a4 pinchGestureRecognizer:(id)a5
{
  _BOOL8 v6;
  char v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a4;
  v7 = a3;
  -[PUFeedViewController _oneUpPresentationAssetContainerList](self, "_oneUpPresentationAssetContainerList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (-[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isEqual:", v10),
        v10,
        v11))
  {
    -[PUFeedViewController _ensureOneUpPresentationHelper](self, "_ensureOneUpPresentationHelper");
    -[PUFeedViewController _updateOneUpBrowsingCurrentAssetReference](self, "_updateOneUpBrowsingCurrentAssetReference");
    -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = MEMORY[0x1E0C809B0];
    if ((v7 & 8) != 0)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __91__PUFeedViewController__navigateToOneUpBrowserWithOptions_animated_pinchGestureRecognizer___block_invoke;
      v27[3] = &unk_1E58ABD10;
      v28 = v14;
      objc_msgSend(v28, "performChanges:", v27);

    }
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v15, "currentAssetReference");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "videoPlayer");
      v22 = v16;
      v23 = 3221225472;
      v24 = __91__PUFeedViewController__navigateToOneUpBrowserWithOptions_animated_pinchGestureRecognizer___block_invoke_2;
      v25 = &unk_1E58ABD10;
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v26;
      objc_msgSend(v19, "performChanges:", &v22);

    }
    -[PUFeedViewController _browsingSelectedComment](self, "_browsingSelectedComment", v22, v23, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentOneUpViewControllerAnimated:interactiveMode:", v6, a5 != 0);

  }
}

- (void)_ensureOneUpPresentationHelper
{
  PUOneUpPresentationHelper *v3;
  void *v4;
  void *v5;
  PUPhotoBrowserOneUpPresentationAdaptor *v6;

  -[PUFeedViewController _photoBrowserOneUpPresentationAdaptor](self, "_photoBrowserOneUpPresentationAdaptor");
  v6 = (PUPhotoBrowserOneUpPresentationAdaptor *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(PUPhotoBrowserOneUpPresentationAdaptor);
    -[PUPhotoBrowserOneUpPresentationAdaptor setZoomTransitionDelegate:](v6, "setZoomTransitionDelegate:", self);
    -[PUFeedViewController _setPhotoBrowserOneUpPresentationAdaptor:](self, "_setPhotoBrowserOneUpPresentationAdaptor:", v6);
  }
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v3 = (PUOneUpPresentationHelper *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _setOneUpPresentationAssetContainerList:](self, "_setOneUpPresentationAssetContainerList:", v4);
    -[PUFeedViewController _createOneUpPhotosDataSource](self, "_createOneUpPhotosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PUOneUpPresentationHelper initWithPhotosDataSource:]([PUOneUpPresentationHelper alloc], "initWithPhotosDataSource:", v5);
    -[PUOneUpPresentationHelper setDelegate:](v3, "setDelegate:", self);
    -[PUOneUpPresentationHelper setAssetDisplayDelegate:](v3, "setAssetDisplayDelegate:", v6);
    -[PUFeedViewController _setOneUpPresentationHelper:](self, "_setOneUpPresentationHelper:", v3);

  }
}

- (void)_clearOneUpPresentationHelper
{
  void *v3;

  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[PUFeedViewController _setOneUpPresentationHelper:](self, "_setOneUpPresentationHelper:", 0);
  -[PUFeedViewController _setPhotoBrowserOneUpPresentationAdaptor:](self, "_setPhotoBrowserOneUpPresentationAdaptor:", 0);
  -[PUFeedViewController _setOneUpPresentationAssetContainerList:](self, "_setOneUpPresentationAssetContainerList:", 0);
}

- (id)_createOneUpPhotosDataSource
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t v12[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1AAB61000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[79401480]: Creating new PXPhotosDataSource (fetch updated assets)", v12, 2u);
  }
  -[PUFeedViewController _browsingAssetContainerList](self, "_browsingAssetContainerList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 2403, CFSTR("browsing not prepared yet"));

  }
  v5 = (void *)MEMORY[0x1E0CD1580];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_fetchResultForAssetContainerList:photoLibrary:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v7, 4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v8);

  return v9;
}

- (void)_updateOneUpBrowsingCurrentAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  -[PUFeedViewController _ensureOneUpPresentationHelper](self, "_ensureOneUpPresentationHelper");
  -[PUFeedViewController _browsingSelectedIndexPath](self, "_browsingSelectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetReferenceAtIndexPath:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PUFeedViewController__updateOneUpBrowsingCurrentAssetReference__block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v11, "performChanges:", v12);

}

- (void)_expandWindowOfLoadedSectionInfos
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = -[PUFeedViewController _loadedSectionInfosWindowSize](self, "_loadedSectionInfosWindowSize");
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSectionInfos");

  if (v3 < v5)
  {
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "infiniteScrollingWindowSizeIncrement") + v3;

    -[PUFeedViewController _setLoadedSectionInfosWindowSize:](self, "_setLoadedSectionInfosWindowSize:", v7);
    -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
  }
}

- (void)_ensureWindowOfLoadedSectionInfosIncludesSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;

  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSectionInfos") - a3 + 10;

  if (-[PUFeedViewController _loadedSectionInfosWindowSize](self, "_loadedSectionInfosWindowSize") < v6)
    -[PUFeedViewController _setLoadedSectionInfosWindowSize:](self, "_setLoadedSectionInfosWindowSize:", v6);
  -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
}

- (void)_updateWindowOfLoadedSectionInfos
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!-[PUFeedViewController _loadedSectionInfosWindowSize](self, "_loadedSectionInfosWindowSize"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "launchedToTest");

    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = objc_msgSend(v6, "testInitialWindowSize");
    else
      v8 = objc_msgSend(v6, "initialWindowSize");
    v9 = v8;

    -[PUFeedViewController _setLoadedSectionInfosWindowSize:](self, "_setLoadedSectionInfosWindowSize:", v9);
  }
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 2458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionInfosManager != nil"));

    v10 = 0;
  }
  v11 = objc_msgSend(v10, "numberOfSectionInfos");
  v12 = -[PUFeedViewController _loadedSectionInfosWindowSize](self, "_loadedSectionInfosWindowSize");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11 - v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexesOfUnloadedSectionInfosAtIndexes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _preheatSectionInfosAtIndexes:](self, "_preheatSectionInfosAtIndexes:", v15);
  objc_msgSend(MEMORY[0x1E0D7B400], "beginCachingSharedAlbumsByGUIDs");
  objc_msgSend(v17, "loadSectionInfosAtIndexes:", v14);
  objc_msgSend(MEMORY[0x1E0D7B400], "endCachingSharedAlbumsByGUIDs");

}

- (BOOL)prefersStatusBarHidden
{
  objc_super v4;

  if (-[PUFeedViewController _barsState](self, "_barsState") == 2)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PUFeedViewController;
  return -[PUFeedViewController prefersStatusBarHidden](&v4, sel_prefersStatusBarHidden);
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return -[PUFeedViewController _barsState](self, "_barsState") != 2;
}

- (BOOL)pu_wantsToolbarVisible
{
  return 0;
}

- (BOOL)pu_wantsTabBarVisible
{
  return -[PUFeedViewController _barsState](self, "_barsState") != 2;
}

- (void)_updateParallaxForCollectionView:(id)a3
{
  id v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vitalityEnabled");
  v6 = *MEMORY[0x1E0DC5360];
  v7 = *MEMORY[0x1E0DC5368];

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "parallaxEnabled"))
    v9 = !UIAccessibilityIsReduceMotionEnabled();
  else
    v9 = 0;
  if (!v5)
    v6 = v7;

  objc_msgSend(v3, "collectionViewLayout");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldApplyParallaxEffect:", v9);
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParallaxModel:", objc_msgSend(v10, "parallaxModel"));

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parallaxFactor");
  objc_msgSend(v12, "setParallaxFactor:");

  objc_msgSend(v3, "setDecelerationRate:", v6);
}

- (void)_updateCollectionViews
{
  void *v3;
  void *v4;
  int64_t v5;
  int v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(_QWORD);
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id (*v46)(uint64_t);
  void *v47;
  PUFeedViewController *v48;
  id v49;
  uint64_t v50;
  uint64_t aBlock;
  uint64_t v52;
  id (*v53)(uint64_t);
  void *v54;
  PUFeedViewController *v55;
  id v56;
  char v57;

  -[PUFeedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _stopObservingPopoverContentSizeIfNecessary](self, "_stopObservingPopoverContentSizeIfNecessary");
  -[PUFeedViewController spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUFeedViewController _sizeTransitionState](self, "_sizeTransitionState");
  v6 = 0;
  v7 = 1.0;
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 2:
      v6 = 1;
      v7 = 0.0;
LABEL_6:
      v8 = 1.0;
      goto LABEL_7;
    case 1:
      v6 = 1;
      v8 = 0.0;
LABEL_7:
      v9 = v7;
      v10 = -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType") == 0;
      v11 = -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType") == 1;
      v7 = v8;
      goto LABEL_9;
  }
  v9 = 1.0;
  v11 = 0;
  v10 = 0;
LABEL_9:
  -[PUFeedViewController _setFlowDirectionReversed:](self, "_setFlowDirectionReversed:", 1);
  v12 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v52 = 3221225472;
  v53 = __46__PUFeedViewController__updateCollectionViews__block_invoke;
  v54 = &unk_1E589F0F0;
  v55 = self;
  v57 = 0;
  v13 = v4;
  v56 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(&aBlock);
  v44 = v12;
  v45 = 3221225472;
  v46 = __46__PUFeedViewController__updateCollectionViews__block_invoke_2;
  v47 = &unk_1E589F0F0;
  LOBYTE(v50) = 0;
  v48 = self;
  v49 = v13;
  v42 = v13;
  v15 = (void (**)(_QWORD))_Block_copy(&v44);
  -[PUFeedViewController _targetCollectionView](self, "_targetCollectionView");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v6)
  {
    if (!v16)
    {
      if (-[PUFeedViewController _targetCollectionViewType](self, "_targetCollectionViewType", v42, v44, v45, v46, v47, v48, v49, v50, aBlock, v52, v53, v54, v55))
      {
        v18 = v15;
      }
      else
      {
        v18 = v14;
      }
      ((void (*)(void))v18[2])();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _setTargetCollectionView:](self, "_setTargetCollectionView:", v17);
      objc_msgSend(v17, "collectionViewLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateLayoutAndCache");

    }
    objc_msgSend(v17, "superview", v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v3)
    {
      objc_msgSend(v3, "addSubview:", v17);
      objc_msgSend(v17, "layoutIfNeeded");
      objc_msgSend(v17, "collectionViewLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "flowDirectionEdge");

      objc_msgSend(v17, "px_scrollToEdge:animated:", v22, 0);
    }
    objc_msgSend(v17, "setAlpha:", v7);
  }
  else
  {
    if (!v16)
      goto LABEL_21;
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView", v42, v44, v45, v46, v47, v48, v49, v50, aBlock, v52, v53, v54, v55);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeFromSuperview");

    -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", v17);
    -[PUFeedViewController _setTargetCollectionView:](self, "_setTargetCollectionView:", 0);
  }

LABEL_21:
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView", v42);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "collectionViewLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "flowDirection");

  if (!v24)
  {
    if (!v10)
    {
      v31 = 0;
      v32 = 0;
      if (!v11)
        goto LABEL_58;
LABEL_51:
      v15[2](v15);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    v32 = 0;
    goto LABEL_39;
  }
  v28 = v26 == 3 || v26 == 0;
  if ((unint64_t)(v26 - 1) >= 2)
    v29 = 0;
  else
    v29 = v24;
  if (v28)
    v30 = v24;
  else
    v30 = 0;
  v31 = v30;
  v32 = v29;
  if (v10)
  {
    if (v31)
    {
LABEL_40:
      objc_msgSend(v31, "setAlpha:", v9);
      goto LABEL_43;
    }
LABEL_39:
    v14[2](v14);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (v31)
  {
    objc_msgSend(v31, "removeFromSuperview");
    -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", 0);
  }
LABEL_43:
  if (!v11)
  {
    if (v32)
    {
      objc_msgSend(v32, "removeFromSuperview");
      -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", 0);
    }
    if (!v10)
      goto LABEL_55;
    goto LABEL_53;
  }
  if (!v32)
    goto LABEL_51;
LABEL_52:
  objc_msgSend(v32, "setAlpha:", v9);
  if (v10)
  {
LABEL_53:
    objc_msgSend(v31, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 != v3)
    {
      objc_msgSend(v3, "addSubview:", v31);
      -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", v31);
      objc_msgSend(v31, "layoutIfNeeded");
      objc_msgSend(v31, "collectionViewLayout");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "flowDirectionEdge");

      objc_msgSend(v31, "px_scrollToEdge:animated:", v35, 0);
    }
  }
LABEL_55:
  if (v11)
  {
    objc_msgSend(v32, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36 != v3)
    {
      objc_msgSend(v3, "addSubview:", v32);
      -[PUFeedViewController _setCurrentCollectionView:](self, "_setCurrentCollectionView:", v32);
      objc_msgSend(v32, "layoutIfNeeded");
      objc_msgSend(v32, "collectionViewLayout");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "flowDirectionEdge");

      objc_msgSend(v32, "px_scrollToEdge:animated:", v38, 0);
    }
  }
LABEL_58:
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "setDelegate:", 0);
    -[PUFeedViewController _setCollectionViewSpeedometer:](self, "_setCollectionViewSpeedometer:", 0);
  }
  -[PUFeedViewController _startObservingPopoverContentSizeIfNecessary](self, "_startObservingPopoverContentSizeIfNecessary");
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _setObservableScrollView:forEdges:](self, "_setObservableScrollView:forEdges:", v41, 5);

}

- (void)_updatePeripheralInterfaceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;

  v3 = a3;
  if (PLIsLockdownMode())
  {
    -[PUFeedViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 1);

  }
  else
  {
    -[PUFeedViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v3);
    -[PUFeedViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
  }
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v3 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PUFeedViewController _isAnySharedAlbumAvailable](self, "_isAnySharedAlbumAvailable");
  PXLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowInvitationsInPopover");

  if (!v8)
    goto LABEL_7;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfInvitationsReceived");

  if (v10 < 1)
  {
    -[PUFeedViewController _setInvitationsBarButtonItem:](self, "_setInvitationsBarButtonItem:", 0);
    -[PUFeedViewController _dismissInvitationsPopoverIfNeeded](self, "_dismissInvitationsPopoverIfNeeded");
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  PXLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  PULocalizedStringWithValidatedFormat(v11, CFSTR("%ld"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController _invitationsBarButtonItem](self, "_invitationsBarButtonItem", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v12, 0, self, sel__invitationsButtonAction_);
    -[PUFeedViewController _setInvitationsBarButtonItem:](self, "_setInvitationsBarButtonItem:", v13);
  }
  objc_msgSend(v13, "setTitle:", v12);
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  -[PUFeedViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidesBackButton:animated:", !v5, v3);
  objc_msgSend(v15, "setTitle:", v6);
  objc_msgSend(v15, "setLeftBarButtonItems:animated:", 0, v3);
  objc_msgSend(v15, "setRightBarButtonItems:animated:", v14, v3);
  objc_msgSend(v15, "px_setDisableLargeTitle:", 1);

}

- (id)_placeholderConfiguration:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  switch(a3)
  {
    case 1:
      PXLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0DC3428];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__PUFeedViewController__placeholderConfiguration___block_invoke;
      v24[3] = &unk_1E58AB5D0;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      break;
    case 2:
      PXLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "numberOfInvitationsReceived");
      PXLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v13;
      PULocalizedStringWithValidatedFormat(v14, CFSTR("%ld"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x1E0DC3428];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__PUFeedViewController__placeholderConfiguration___block_invoke_2;
      v22[3] = &unk_1E58AB5D0;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v22, v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

      break;
    case 3:
      MGGetBoolAnswer();
      PXLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      PXLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v6 = 0;
      v5 = 0;
      break;
    case 5:
      PXLocalizedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D7B590], "currentDeviceCanonicalModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("CLOUD_FEED_UPDATING_LIBRARY_NO_NETWORK_MESSAGE_%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      PXLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      v8 = 0;
      v6 = 0;
      break;
    default:
      v8 = 0;
      v6 = 0;
      v5 = 0;
      v4 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v4);
  objc_msgSend(v16, "setSecondaryText:", v5);
  objc_msgSend(v16, "buttonProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v6);

  objc_msgSend(v16, "buttonProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPrimaryAction:", v8);

  return v16;
}

- (void)_updateEmptyPlaceholder
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;

  if (-[PUFeedViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[PUFeedViewController _sizeTransitionState](self, "_sizeTransitionState");
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (v3)
      {
LABEL_19:
        -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setHidden:", 0);

        -[PUFeedViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
        return;
      }
      v4 = -[PUFeedViewController _placeholderTypeForSizeTransitionState:](self, "_placeholderTypeForSizeTransitionState:", 0);
      if (!v4)
      {
        if (-[PUFeedViewController _userDidDismissPlaceholder](self, "_userDidDismissPlaceholder"))
        {
          -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "numberOfSectionInfos");
          if (v8 < 1)
            v9 = 0;
          else
            v9 = objc_msgSend(v7, "numberOfInvitationsReceived");
          -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[PUFeedViewController _isCollectionViewEmpty:](self, "_isCollectionViewEmpty:", v10);

          if (v8 > v9 && !v11)
            -[PUFeedViewController _setUserDidDismissPlaceholder:](self, "_setUserDidDismissPlaceholder:", 0);

        }
        goto LABEL_19;
      }
    }
    else
    {
      v4 = -[PUFeedViewController _placeholderTypeForSizeTransitionState:](self, "_placeholderTypeForSizeTransitionState:", 0);
      v5 = -[PUFeedViewController _placeholderTypeForSizeTransitionState:](self, "_placeholderTypeForSizeTransitionState:", 1);
      if (v5)
        v4 = v5;
      if (!v4)
        goto LABEL_19;
    }
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PUFeedViewController _placeholderConfiguration:](self, "_placeholderConfiguration:", v4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v13);

  }
}

- (BOOL)_shouldShowBarsForCollectionViewType:(int64_t)a3
{
  void *v3;
  int v4;

  if (a3)
  {
    -[PUFeedViewController spec](self, "spec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldHideBarsInLandscape") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_scheduleBarsAutoHide
{
  -[PUFeedViewController _cancelBarsAutoHide](self, "_cancelBarsAutoHide");
  -[PUFeedViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__autoHideBarsNow, 0, 2.0);
}

- (void)_cancelBarsAutoHide
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__autoHideBarsNow, 0);
}

- (void)_autoHideBarsNow
{
  -[PUFeedViewController _setBarsState:](self, "_setBarsState:", 2);
  -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 1, *MEMORY[0x1E0DC51A0]);
}

- (void)_dismissInvitationsPopoverIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PUFeedViewController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      -[PUFeedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      -[PUFeedViewController _setInvitationsPopoverRootController:](self, "_setInvitationsPopoverRootController:", 0);
    }
  }
}

- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PUFeedViewController _invalidatePreheatedAssets](self, "_invalidatePreheatedAssets");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUFeedViewController _collectionViews](self, "_collectionViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "collectionViewLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUFeedViewController _updateParallaxForCollectionView:](self, "_updateParallaxForCollectionView:", v10);
        objc_msgSend(v11, "invalidateLayoutAndCache");
        objc_msgSend(v10, "reloadData");
        -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[PUFeedViewController _setViewsInSyncWithModel:](self, "_setViewsInSyncWithModel:", 1);
  -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
  -[PUFeedViewController _updateBrowsingAssetContainerList](self, "_updateBrowsingAssetContainerList");
  -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", v3);
  -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[PUFeedViewController _updateCellsVideoEnabledness](self, "_updateCellsVideoEnabledness");
}

- (void)_updateInterfaceForDeletedSections:(id)a3 insertedSections:(id)a4 updatedSections:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    -[PUFeedViewController _invalidatePreheatedAssets](self, "_invalidatePreheatedAssets");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PUFeedViewController _collectionViews](self, "_collectionViews", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v16, "collectionViewLayout");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "updateCollectionViewWithDeletedSections:insertedSections:updatedSections:", v8, v9, v10);
          -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    -[PUFeedViewController _setViewsInSyncWithModel:](self, "_setViewsInSyncWithModel:", 1);
    -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
    -[PUFeedViewController _updateBrowsingAssetContainerList](self, "_updateBrowsingAssetContainerList");
    -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 1);
    -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllObjects");

    -[PUFeedViewController _updateCellsVideoEnabledness](self, "_updateCellsVideoEnabledness");
  }

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PUFeedViewController *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v7, "section"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v8, "typeForItemAtIndex:", objc_msgSend(v7, "item")))
  {
    case 0:
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "vitalityEnabled"))
      {

        goto LABEL_11;
      }
      v10 = objc_msgSend(v8, "hasPlayableAssetForItemAtIndex:", objc_msgSend(v7, "item"));

      if ((v10 & 1) == 0)
      {
LABEL_11:
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ImageCell"), v7);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[PUFeedViewController _configureImageCell:forAssetAtIndexPath:inCollectionView:](self, "_configureImageCell:forAssetAtIndexPath:inCollectionView:", v14, v7, v6);
        goto LABEL_12;
      }
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PlayerCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__PUFeedViewController_collectionView_cellForItemAtIndexPath___block_invoke;
      v16[3] = &unk_1E58A9AE0;
      v12 = v11;
      v17 = v12;
      v18 = v6;
      v19 = self;
      v20 = v7;
      objc_msgSend(v12, "performIrisPlayerChanges:", v16);
      v13 = v20;
      v14 = v12;

LABEL_12:
      return v14;
    case 1:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CommentCell"), v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureTextCell:forCommentAtIndexPath:inCollectionView:](self, "_configureTextCell:forCommentAtIndexPath:inCollectionView:", v14, v7, v6);
      goto LABEL_12;
    case 2:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("LikesCell"), v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureTextCell:forLikesAtIndexPath:inCollectionView:](self, "_configureTextCell:forLikesAtIndexPath:inCollectionView:", v14, v7, v6);
      goto LABEL_12;
    case 3:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TitleCell"), v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureTitleCell:forTextAtIndexPath:inCollectionView:](self, "_configureTitleCell:forTextAtIndexPath:inCollectionView:", v14, v7, v6);
      goto LABEL_12;
    case 4:
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("InvitationCell"), v7);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureInvitationCell:forInvitationAtIndexPath:inCollectionView:](self, "_configureInvitationCell:forInvitationAtIndexPath:inCollectionView:", v14, v7, v6);
      goto LABEL_12;
    default:
      v14 = 0;
      goto LABEL_12;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSeparator")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("SeparatorView"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudFeedSeparatorColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilityHigherContrastTintColorForColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setBackgroundColor:", v15);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("BadgedThumbnailCell"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _configureBadgedThumbnailCell:forThumbnailsAtIndexPath:inCollectionView:](self, "_configureBadgedThumbnailCell:forThumbnailsAtIndexPath:inCollectionView:", v12, v11, v9);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindCaption")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("CaptionView"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _configureCaptionCell:forCaptionAtIndexPath:inCollectionView:](self, "_configureCaptionCell:forCaptionAtIndexPath:inCollectionView:", v12, v11, v9);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindLikes")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("LikesCell"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _configureTextCell:forLikesAtIndexPath:inCollectionView:](self, "_configureTextCell:forLikesAtIndexPath:inCollectionView:", v12, v11, v9);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindComment")))
  {
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("CommentCell"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _configureTextCell:forCommentAtIndexPath:inCollectionView:](self, "_configureTextCell:forCommentAtIndexPath:inCollectionView:", v12, v11, v9);
  }
  else
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")))
    {
      objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("SectionHeaderView"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collectionViewLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sectionsJoinedWithSection:", objc_msgSend(v11, "section"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureTitleCell:forHeaderOfSections:inCollectionView:animated:](self, "_configureTitleCell:forHeaderOfSections:inCollectionView:animated:", v12, v17, v9, 0);
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeaderBackground")))
      {
        objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("SectionHeaderBackgroundView"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setUserInteractionEnabled:", 0);
        v18 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);
        -[PUFeedViewController spec](self, "spec");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "configureGradientCell:forSectionHeaderBackgroundInCollectionViewType:", v12, v18);

        goto LABEL_18;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionFooter")))
      {
        objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("SectionFooterView"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUFeedViewController _configureTextCell:forFooterOfSection:inCollectionView:](self, "_configureTextCell:forFooterOfSection:inCollectionView:", v12, objc_msgSend(v11, "section"), v9);
        goto LABEL_18;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionGroupHeader")))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 3077, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("SectionGroupHeaderView"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v11, "section"), v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _groupIDForSectionWithInfo:](self, "_groupIDForSectionWithInfo:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _configureTextCell:forHeaderOfGroupID:inCollectionView:](self, "_configureTextCell:forHeaderOfGroupID:inCollectionView:", v12, v17, v9);
    }

  }
LABEL_18:

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (-[PUFeedViewController _setupBrowsingFromItemAtIndexPath:inCollectionView:](self, "_setupBrowsingFromItemAtIndexPath:inCollectionView:", a4, a3))
  {
    -[PUFeedViewController _navigateToOneUpBrowserAnimated:](self, "_navigateToOneUpBrowserAnimated:", 1);
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v14;
    v7 = objc_msgSend(v6, "currentImageRequestID");
    if ((_DWORD)v7)
    {
      v8 = v7;
      -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelImageRequest:", v8);

      objc_msgSend(v6, "setCurrentImageRequestID:", 0);
    }
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v14;
    objc_msgSend(v10, "setPlayerItem:", 0);
    v11 = objc_msgSend(v10, "playerItemRequestID");
    if ((_DWORD)v11)
    {
      v12 = v11;
      -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancelImageRequest:", v12);

      objc_msgSend(v10, "setPlayerItemRequestID:", 0);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "item");
  LOBYTE(v9) = objc_msgSend(v8, "typeForItemAtIndex:", v9) == 0;

  return v9;
}

- (BOOL)_shouldHideSectionInfo:(id)a3 forCollectionView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  BOOL v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isLoaded")
    && (objc_msgSend(v6, "numberOfItems") || objc_msgSend(v6, "shouldBeVisibleWhenEmpty"))
    && (v8 = objc_msgSend(v6, "sectionType"),
        v9 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v7),
        !-[PUFeedViewController _shouldHideSectionWithType:inCollectionViewType:](self, "_shouldHideSectionWithType:inCollectionViewType:", v8, v9)))
  {
    v11 = objc_msgSend(v6, "numberOfItems");
    v10 = v9 == 1 && v11 == 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldHideSection:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PUFeedViewController _shouldHideSectionInfo:forCollectionView:](self, "_shouldHideSectionInfo:forCollectionView:", v8, v7);

  return (char)self;
}

- (int64_t)_typeForSectionInfo:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "sectionType");
  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return qword_1AB0EFA30[v3 - 1];
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 typeForSection:(int64_t)a5
{
  void *v6;
  int64_t v7;

  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUFeedViewController _typeForSectionInfo:](self, "_typeForSectionInfo:", v6);

  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 contentInsetsForSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v8 = a4;
  v9 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sectionType");
  v12 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v9);

  -[PUFeedViewController spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsetsForSectionType:collectionViewType:", v11, v12);

  -[PUFeedViewController _desiredSafeAreaInsetsForCollectionViewType:](self, "_desiredSafeAreaInsetsForCollectionViewType:", v12);
  if (objc_msgSend(v8, "flowDirection"))
    objc_msgSend(v8, "flowDirection");
  UIEdgeInsetsAdd();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (UIEdgeInsets)_desiredSafeAreaInsetsForCollectionViewType:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  if (-[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", a3))
  {
    -[PUFeedViewController px_safeAreaInsets](self, "px_safeAreaInsets");
  }
  else
  {
    -[PUFeedViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_peripheryInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v4 = v10;
    v5 = v12;
    v6 = v14;
    v7 = v16;
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 imageSizeForTileAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v7 = a5;
  v8 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v7, "section"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "item");
  objc_msgSend(v9, "assetForItemAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageSize");
  v14 = v12 <= 0.0;
  if (v13 <= 0.0)
    v14 = 1;
  if (v14)
    v15 = 1.0;
  else
    v15 = v12;
  if (v14)
    v16 = 1.0;
  else
    v16 = v13;

  v17 = v15;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 mininumSizeForTileAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a5;
  v8 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v7, "section"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "item");
  objc_msgSend(v9, "assetForItemAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isVideo") & 1) != 0
    || (+[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "forceAllItemsAsVideo"),
        v12,
        v13))
  {
    -[PUFeedViewController spec](self, "spec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minimumVideoTileSize");
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldShowCaptionForTileAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a5;
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ignoresCaptions");

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v8, "section"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "sectionType") && objc_msgSend(v12, "sectionType") != 3)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v12, "captionForItemAtIndex:", objc_msgSend(v8, "item"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        v11 = 1;
      }
      else
      {
        v14 = objc_msgSend(v12, "indexOfFirstItemFromLastBatch");
        v11 = objc_msgSend(v8, "item") == v14;
      }

    }
  }

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 captionSizeForTileAtIndexPath:(id)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v10 = collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__onceToken;
  v11 = a5;
  v12 = a3;
  if (v10 != -1)
    dispatch_once(&collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__onceToken, &__block_literal_global_482);
  -[PUFeedViewController _configureCaptionCell:forCaptionAtIndexPath:inCollectionView:](self, "_configureCaptionCell:forCaptionAtIndexPath:inCollectionView:", collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__measuringCaptionCell, v11, v12);

  objc_msgSend((id)collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__measuringCaptionCell, "sizeThatFits:", width, height);
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldShowLikesForTileAtIndexPath:(id)a5
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 likesSizeForTileAtIndexPath:(id)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v10 = collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__onceToken;
  v11 = a5;
  v12 = a3;
  if (v10 != -1)
    dispatch_once(&collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__onceToken, &__block_literal_global_483);
  -[PUFeedViewController _configureTextCell:forLikesAtIndexPath:inCollectionView:](self, "_configureTextCell:forLikesAtIndexPath:inCollectionView:", collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__measuringTextCell, v11, v12);

  objc_msgSend((id)collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__measuringTextCell, "sizeThatFits:", width, height);
  result.height = v14;
  result.width = v13;
  return result;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 commentCountForTileAtIndexPath:(id)a5
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 commentSizeForTileAtIndexPath:(id)a5 commentIndex:(int64_t)a6 proposedSize:(CGSize)a7
{
  double height;
  double width;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  height = a7.height;
  width = a7.width;
  v12 = collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__onceToken;
  v13 = a5;
  v14 = a3;
  if (v12 != -1)
    dispatch_once(&collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__onceToken, &__block_literal_global_484);
  v15 = (void *)MEMORY[0x1E0CB36B0];
  v16 = objc_msgSend(v13, "section");

  objc_msgSend(v15, "indexPathForItem:inSection:", a6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _configureTextCell:forCommentAtIndexPath:inCollectionView:](self, "_configureTextCell:forCommentAtIndexPath:inCollectionView:", collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__measuringTextCell, v17, v14);

  objc_msgSend((id)collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__measuringTextCell, "sizeThatFits:", width, height);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)collectionView:(id)a3 layout:(id)a4 batchIDForTileAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a5;
  v8 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v7, "section"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "item");
  objc_msgSend(v9, "batchIDForItemAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)collectionView:(id)a3 layout:(id)a4 referenceMaximumLength:(double *)a5 minimumNumberOfTilesToOmit:(int64_t *)a6 forSection:(int64_t)a7
{
  id v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  id v15;

  v11 = a3;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a7, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v15, "sectionType");
  v13 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v11);

  -[PUFeedViewController spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getReferenceMaximumLength:minimumNumberOfTilesToOmit:forSectionType:collectionViewType:", a5, a6, v12, v13);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForRowAtIndexPath:(id)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v13, "section"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v14, "typeForItemAtIndex:", objc_msgSend(v13, "item")))
  {
    case 1:
      if (collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken != -1)
        dispatch_once(&collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken, &__block_literal_global_485);
      -[PUFeedViewController _configureTextCell:forCommentAtIndexPath:inCollectionView:](self, "_configureTextCell:forCommentAtIndexPath:inCollectionView:", collectionView_layout_sizeForRowAtIndexPath_proposedSize__commentMeasuringTextCell, v13, v11);
      v15 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__commentMeasuringTextCell;
      goto LABEL_8;
    case 2:
      if (collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_486 != -1)
        dispatch_once(&collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_486, &__block_literal_global_487);
      -[PUFeedViewController _configureTextCell:forLikesAtIndexPath:inCollectionView:](self, "_configureTextCell:forLikesAtIndexPath:inCollectionView:", collectionView_layout_sizeForRowAtIndexPath_proposedSize__likeMeasuringTextCell, v13, v11);
      v15 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__likeMeasuringTextCell;
LABEL_8:
      objc_msgSend(v15, "sizeThatFits:", width, height);
      width = v16;
      height = v17;
      break;
    case 3:
      if (collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_488 != -1)
        dispatch_once(&collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_488, &__block_literal_global_489);
      -[PUFeedViewController _configureTitleCell:forTextAtIndexPath:inCollectionView:](self, "_configureTitleCell:forTextAtIndexPath:inCollectionView:", collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringTitleCell, v13, v11);
      objc_msgSend((id)collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringTitleCell, "sizeThatFits:", width, height);
      v19 = v18;
      height = v20;
      if (objc_msgSend(v12, "flowDirection") && objc_msgSend(v12, "flowDirection") != 3)
        width = v19;
      break;
    case 4:
      if (collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_490 != -1)
        dispatch_once(&collectionView_layout_sizeForRowAtIndexPath_proposedSize__onceToken_490, &__block_literal_global_491);
      -[PUFeedViewController _configureInvitationCell:forInvitationAtIndexPath:inCollectionView:](self, "_configureInvitationCell:forInvitationAtIndexPath:inCollectionView:", collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringInvitationCell, v13, v11);
      objc_msgSend((id)collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringInvitationCell, "sizeThatFits:", width, height);
      v22 = v21;
      height = v23;
      if (objc_msgSend(v12, "flowDirection") && objc_msgSend(v12, "flowDirection") != 3)
        width = v22;
      break;
    default:
      break;
  }

  v24 = width;
  v25 = height;
  result.height = v25;
  result.width = v24;
  return result;
}

- (PUFeedSeparatorMetrics)collectionView:(SEL)a3 layout:(id)a4 metricsForSeparatorBetweenRowAtIndexPath:(id)a5 andRowAtIndexPath:(id)a6 proposedMetrics:(id)a7
{
  __int128 v9;
  PUFeedSeparatorMetrics *result;
  id v11;

  v9 = *(_OWORD *)&a8->var1.top;
  retstr->var0 = a8->var0;
  *(_OWORD *)&retstr->var1.top = v9;
  *(_OWORD *)&retstr->var1.bottom = *(_OWORD *)&a8->var1.bottom;
  -[PUFeedViewController spec](self, "spec", a4, a5, a6, a7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureCommentSeparatorMetrics:", retstr);

  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForThumbnailInSection:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailSize");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v6, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 1)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[PUFeedViewController spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldUseAspectThumbnails");

  if (v14)
  {
    objc_msgSend(v6, "assetForItemAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageSize");
    v16 = v15;
    v18 = v17;
    -[PUFeedViewController spec](self, "spec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "thumbnailSizeForImageSize:", v16, v18);
    v21 = v20;
    v23 = v22;

    if (v21 > v23)
      v11 = v23;
    goto LABEL_5;
  }
LABEL_6:

  v24 = v9;
  v25 = v11;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldJoinSection:(int64_t)a5 withSection:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a6, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = -[PUFeedViewController _shouldJoinSectionInfo:withSectionInfo:collectionViewType:](self, "_shouldJoinSectionInfo:withSectionInfo:collectionViewType:", v12, v13, -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v10));

  return v14;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldHideHeaderInSection:(int64_t)a5
{
  PUFeedViewController *v5;
  void *v6;

  v5 = self;
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[PUFeedViewController _shouldHideHeaderForSectionWithType:](v5, "_shouldHideHeaderForSectionWithType:", objc_msgSend(v6, "sectionType"));

  return (char)v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForHeaderOfSections:(id)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (collectionView_layout_sizeForHeaderOfSections_proposedSize__onceToken != -1)
    dispatch_once(&collectionView_layout_sizeForHeaderOfSections_proposedSize__onceToken, &__block_literal_global_492);
  if (objc_msgSend(v12, "flowDirection"))
    v14 = objc_msgSend(v12, "flowDirection") == 3;
  else
    v14 = 1;
  v15 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v11);
  -[PUFeedViewController _configureTitleCell:forHeaderOfSections:inCollectionView:animated:](self, "_configureTitleCell:forHeaderOfSections:inCollectionView:animated:", collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell, v13, v11, 0);
  if (!v14
    && !-[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", v15))
  {
    objc_msgSend((id)collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell, "contentInsets");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend((id)collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell, "contentInsets");
    v23 = v22;
    objc_msgSend(v11, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaInsets");
    v26 = v25;

    if (v23 >= v26)
      v27 = v23;
    else
      v27 = v26;
    objc_msgSend((id)collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell, "setContentInsets:", v17, v19, v27, v21);
  }
  objc_msgSend((id)collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell, "sizeThatFits:", width, height);
  v30 = v29;
  if (!v14)
    width = v28;

  v31 = width;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForFooterInSection:(int64_t)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v11 = a3;
  v12 = a4;
  if (collectionView_layout_sizeForFooterInSection_proposedSize__onceToken != -1)
    dispatch_once(&collectionView_layout_sizeForFooterInSection_proposedSize__onceToken, &__block_literal_global_493);
  if (-[PUFeedViewController _configureTextCell:forFooterOfSection:inCollectionView:](self, "_configureTextCell:forFooterOfSection:inCollectionView:", collectionView_layout_sizeForFooterInSection_proposedSize__measuringTextCell, a5, v11))
  {
    objc_msgSend((id)collectionView_layout_sizeForFooterInSection_proposedSize__measuringTextCell, "sizeThatFits:", width, height);
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (PUFeedSeparatorMetrics)collectionView:(SEL)a3 layout:(id)a4 metricsForSeparatorBetweenSection:(id)a5 andSection:(int64_t)a6 proposedMetrics:(int64_t)a7
{
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  int64_t v19;
  _BOOL8 v20;
  __int128 v21;
  void *v22;
  PUFeedSeparatorMetrics *result;
  id v24;

  v24 = a4;
  v14 = a5;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a6, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = 0;
    v17 = v24;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a7, v24);
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = v24;
    v16 = (void *)v18;
  }
  v19 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", v17);
  v20 = -[PUFeedViewController _shouldJoinSectionInfo:withSectionInfo:collectionViewType:](self, "_shouldJoinSectionInfo:withSectionInfo:collectionViewType:", v15, v16, v19);
  v21 = *(_OWORD *)&a8->var1.top;
  retstr->var0 = a8->var0;
  *(_OWORD *)&retstr->var1.top = v21;
  *(_OWORD *)&retstr->var1.bottom = *(_OWORD *)&a8->var1.bottom;
  -[PUFeedViewController spec](self, "spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "configureSeparatorMetrics:betweenSectionWithInfo:andSectionWithInfo:joined:collectionViewType:", retstr, v15, v16, v20, v19);

  return result;
}

- (id)collectionView:(id)a3 layout:(id)a4 groupIDForSection:(int64_t)a5
{
  void *v6;
  void *v7;

  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _groupIDForSectionWithInfo:](self, "_groupIDForSectionWithInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 headerSizeForGroupID:(id)a5 proposedSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v10 = collectionView_layout_headerSizeForGroupID_proposedSize__onceToken;
  v11 = a5;
  v12 = a3;
  if (v10 != -1)
    dispatch_once(&collectionView_layout_headerSizeForGroupID_proposedSize__onceToken, &__block_literal_global_494);
  -[PUFeedViewController _configureTextCell:forHeaderOfGroupID:inCollectionView:](self, "_configureTextCell:forHeaderOfGroupID:inCollectionView:", collectionView_layout_headerSizeForGroupID_proposedSize__measuringTextCell, v11, v12);

  objc_msgSend((id)collectionView_layout_headerSizeForGroupID_proposedSize__measuringTextCell, "sizeThatFits:", width, height);
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 spacingBetweenSection:(int64_t)a5 andHeaderForGroupID:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a6;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", a5, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUFeedViewController spec](self, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spacingBetweenSectionWithInfo:andHeaderWithGroupID:", v10, v9);
  v13 = v12;

  return v13;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 configurationForSectionHeaderType:(int64_t)a5
{
  int64_t v7;
  void *v8;
  int64_t v9;

  v7 = -[PUFeedViewController _typeForCollectionView:](self, "_typeForCollectionView:", a3, a4);
  -[PUFeedViewController spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "configurationForSectionHeaderType:collectionViewType:", a5, v7);

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v37 = a3;
  if (-[PUFeedViewController _viewDidAppear](self, "_viewDidAppear"))
  {
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4 == v37 && -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType") == 0;

    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v37 && -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType") == 1;

    if (v5 || v7)
    {
      -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollViewDidScroll:", v37);

      v9 = -[PUFeedViewController _isFlowDirectionReversed](self, "_isFlowDirectionReversed");
      if (v9)
        v10 = 1;
      else
        v10 = 3;
      if (v9)
        v11 = 0;
      else
        v11 = 2;
      if (v5)
        v12 = v10;
      else
        v12 = v11;
      v13 = objc_msgSend(v37, "px_isScrolledAtEdge:tolerance:", v12, 0.0);
      if ((_DWORD)v13
        && !-[PUFeedViewController _isCollectionViewScrolledToNewest](self, "_isCollectionViewScrolledToNewest"))
      {
        -[PUFeedViewController _userDidViewFeed](self, "_userDidViewFeed");
      }
      -[PUFeedViewController _setCollectionViewScrolledToNewest:](self, "_setCollectionViewScrolledToNewest:", v13);
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "allowsInfiniteScrolling");

      if (-[PUFeedViewController contentType](self, "contentType") != 2
        && v15
        && objc_msgSend(v37, "px_isScrolledAtEdge:tolerance:", dword_1AB0EF4C0[v12], 100.0))
      {
        -[PUFeedViewController _expandWindowOfLoadedSectionInfos](self, "_expandWindowOfLoadedSectionInfos");
      }
      if (!-[PUFeedViewController _sizeTransitionState](self, "_sizeTransitionState"))
      {
        objc_msgSend(v37, "contentOffset");
        v36 = v16;
        v18 = v17;
        -[PUFeedViewController _lastPreheatedContentOffset](self, "_lastPreheatedContentOffset");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v37, "bounds");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "preheatingMinimumScrollFactor");
        v33 = v32;

        v38.origin.x = v24;
        v38.origin.y = v26;
        v38.size.width = v28;
        v38.size.height = v30;
        if (vabdd_f64(v18, v22) >= v33 * CGRectGetHeight(v38)
          || (v39.origin.x = v24,
              v39.origin.y = v26,
              v39.size.width = v28,
              v39.size.height = v30,
              vabdd_f64(v36, v20) >= v33 * CGRectGetWidth(v39)))
        {
          -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v37);
        }
      }
      -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "presentingViewControllerScrollViewDidScroll:", v37);

    }
    objc_msgSend(v37, "is_scrollViewDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scrollViewDidScroll:", v37);

    objc_msgSend(v37, "is_didLayoutPlayerViews");
    -[PUFeedViewController _updateCellsVideoEnabledness](self, "_updateCellsVideoEnabledness");
  }

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

LABEL_6:
    -[PUFeedViewController _userDidScrollFeed](self, "_userDidScrollFeed");
    -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollViewWillScrollToTop:", v4);

    objc_msgSend(v4, "is_scrollViewDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollViewShouldScrollToTop:", v4);

    v10 = 1;
    goto LABEL_7;
  }
  v6 = -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType");

  if (v6)
    goto LABEL_6;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "flowDirection");
  if (v9 != 3)
    goto LABEL_6;
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidScrollToTop:", v4);

  objc_msgSend(v4, "is_scrollViewDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewDidScrollToTop:", v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUFeedViewController _userDidScrollFeed](self, "_userDidScrollFeed");
  if (!-[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType"))&& -[PUFeedViewController _barsState](self, "_barsState") != 2)
  {
    -[PUFeedViewController _cancelBarsAutoHide](self, "_cancelBarsAutoHide");
    -[PUFeedViewController _setBarsState:](self, "_setBarsState:", 2);
    -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 1, *MEMORY[0x1E0DC51A0]);
  }
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

  objc_msgSend(v4, "is_scrollViewDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollViewDidEndDragging:willDecelerate:", v6, v4);

  objc_msgSend(v6, "is_scrollViewDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewDidEndDragging:willDecelerate:", v6, v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidEndDecelerating:", v4);

  objc_msgSend(v4, "is_scrollViewDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollViewDidEndDecelerating:", v4);

}

- (void)feedSectionInfosManager:(id)a3 sectionInfosDidChange:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideMenu");

  v6 = objc_msgSend(v12, "shouldReload");
  objc_msgSend(v12, "deletedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PUFeedViewController px_isVisible](self, "px_isVisible") & 1) != 0)
  {
    if ((!-[PUFeedViewController _areViewsInSyncWithModel](self, "_areViewsInSyncWithModel") | v6) == 1)
    {
      -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 1);
    }
    else
    {
      -[PUFeedViewController _updateInterfaceForDeletedSections:insertedSections:updatedSections:](self, "_updateInterfaceForDeletedSections:insertedSections:updatedSections:", v7, v8, v9);
      objc_msgSend(v12, "sectionInfosWithCommentChanges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _scheduleInterfaceUpdateForSectionInfosWithCommentChanges:updatedAssets:](self, "_scheduleInterfaceUpdateForSectionInfosWithCommentChanges:updatedAssets:", v11, v10);

    }
  }
  else
  {
    -[PUFeedViewController _setViewsInSyncWithModel:](self, "_setViewsInSyncWithModel:", 0);
    -[PUFeedViewController _updateWindowOfLoadedSectionInfos](self, "_updateWindowOfLoadedSectionInfos");
    -[PUFeedViewController _updateBrowsingAssetContainerList](self, "_updateBrowsingAssetContainerList");
  }
  if ((objc_msgSend(v12, "shouldReload") & 1) != 0
    || objc_msgSend(v7, "count")
    || objc_msgSend(v8, "count")
    || objc_msgSend(v9, "count"))
  {
    -[PUFeedViewController _updateOneUpDataSource](self, "_updateOneUpDataSource");
  }
  else if (objc_msgSend(v10, "count"))
  {
    -[PUFeedViewController _scheduleOneUpDataSourceUpdate](self, "_scheduleOneUpDataSourceUpdate");
  }

}

- (void)_scheduleInterfaceUpdateForSectionInfosWithCommentChanges:(id)a3 updatedAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    if ((-[PUFeedViewController px_isVisible](self, "px_isVisible") & 1) != 0)
    {
      if (objc_msgSend(v6, "count"))
      {
        -[PUFeedViewController _sectionInfosWithCommentChanges](self, "_sectionInfosWithCommentChanges");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUFeedViewController _setSectionInfosWithCommentChanges:](self, "_setSectionInfosWithCommentChanges:", v8);
        }
        objc_msgSend(v8, "unionSet:", v6);

      }
      if (objc_msgSend(v7, "count"))
      {
        -[PUFeedViewController _updatedAssets](self, "_updatedAssets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUFeedViewController _setUpdatedAssets:](self, "_setUpdatedAssets:", v9);
        }
        objc_msgSend(v9, "unionSet:", v7);

      }
      if (!-[PUFeedViewController _isInterfaceBatchUpdateScheduled](self, "_isInterfaceBatchUpdateScheduled"))
      {
        -[PUFeedViewController _setInterfaceBatchUpdateScheduled:](self, "_setInterfaceBatchUpdateScheduled:", 1);
        objc_initWeak(&location, self);
        v10 = dispatch_time(0, 1000000000);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __96__PUFeedViewController__scheduleInterfaceUpdateForSectionInfosWithCommentChanges_updatedAssets___block_invoke;
        v11[3] = &unk_1E58AB2F8;
        objc_copyWeak(&v12, &location);
        dispatch_after(v10, MEMORY[0x1E0C80D38], v11);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[PUFeedViewController _setViewsInSyncWithModel:](self, "_setViewsInSyncWithModel:", 0);
    }
  }

}

- (void)_performInterfaceBatchUpdateNow
{
  PUFeedViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  PUFeedViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v2 = self;
  v59 = *MEMORY[0x1E0C80C00];
  -[PUFeedViewController _sectionInfosWithCommentChanges](self, "_sectionInfosWithCommentChanges");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _updatedAssets](v2, "_updatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _setSectionInfosWithCommentChanges:](v2, "_setSectionInfosWithCommentChanges:", 0);
  -[PUFeedViewController _setUpdatedAssets:](v2, "_setUpdatedAssets:", 0);
  -[PUFeedViewController _setInterfaceBatchUpdateScheduled:](v2, "_setInterfaceBatchUpdateScheduled:", 0);
  if (-[PUFeedViewController px_isVisible](v2, "px_isVisible")
    && -[PUFeedViewController _areViewsInSyncWithModel](v2, "_areViewsInSyncWithModel"))
  {
    -[PUFeedViewController _currentCollectionView](v2, "_currentCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "count"))
    {
      v43 = v3;
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      v53 = 0u;
      objc_msgSend(v4, "_visibleSupplementaryViewsOfKind:", CFSTR("PUFeedCollectionElementKindSectionHeader"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v54;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v54 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v9);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "indexPath");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "section");

              -[PUFeedViewController _sectionInfoForSection:collectionView:](v2, "_sectionInfoForSection:collectionView:", v12, v4);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v45, "containsObject:", v13))
              {
                objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUFeedViewController _configureTitleCell:forHeaderOfSections:inCollectionView:animated:](v2, "_configureTitleCell:forHeaderOfSections:inCollectionView:animated:", v10, v14, v4, 0);

              }
            }
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v7);
      }

      v15 = -[PUFeedViewController _typeForCollectionView:](v2, "_typeForCollectionView:", v4);
      -[PUFeedViewController spec](v2, "spec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v16, "shouldShowCommentBadgesInCollectionViewType:", v15);

      v3 = v43;
      if ((_DWORD)v15)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v4, "visibleCells");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v50;
          v21 = &unk_1ECF04000;
          do
          {
            v22 = 0;
            v44 = v19;
            do
            {
              if (*(_QWORD *)v50 != v20)
                objc_enumerationMutation(v17);
              v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v22);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = v23;
                objc_msgSend(v24, "indexPath");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUFeedViewController _sectionInfoForSection:collectionView:](v2, "_sectionInfoForSection:collectionView:", objc_msgSend(v25, "section"), v4);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v45, "containsObject:", v26))
                {
                  -[PUFeedViewController _assetForItemAtIndexPath:inCollectionView:](v2, "_assetForItemAtIndexPath:inCollectionView:", v25, v4);
                  v27 = v20;
                  v28 = v4;
                  v29 = v2;
                  v30 = v21;
                  v31 = v17;
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setCommentCount:", objc_msgSend(v32, "totalCommentsCount"));

                  v17 = v31;
                  v21 = v30;
                  v2 = v29;
                  v4 = v28;
                  v20 = v27;
                  v19 = v44;
                }

              }
              ++v22;
            }
            while (v19 != v22);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v19);
        }

        v3 = v43;
      }
    }
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "collectionViewLayout");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __55__PUFeedViewController__performInterfaceBatchUpdateNow__block_invoke;
      v46[3] = &unk_1E589F258;
      v46[4] = v2;
      v47 = v4;
      v42 = v3;
      v48 = v42;
      objc_msgSend(v33, "enumerateImageElementsInRect:usingBlock:", v46, v35, v37, v39, v41);
      -[PUFeedViewController _updateSectionsWithCaptionChangesFromUpdatedAssets:](v2, "_updateSectionsWithCaptionChangesFromUpdatedAssets:", v42);
      -[PUFeedViewController _updateSectionsWithLikesAndCommentChangesFromUpdatedAssets:](v2, "_updateSectionsWithLikesAndCommentChangesFromUpdatedAssets:", v42);

    }
  }
  else
  {
    -[PUFeedViewController _setViewsInSyncWithModel:](v2, "_setViewsInSyncWithModel:", 0);
  }

}

- (void)_updateSectionsWithCaptionChangesFromUpdatedAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PUFeedViewController *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v9)
  {

    v11 = 0;
    goto LABEL_26;
  }
  v10 = v9;
  v24 = self;
  v11 = 0;
  v12 = *(_QWORD *)v32;
  v27 = v8;
  v28 = v6;
  v25 = *(_QWORD *)v32;
  v26 = v7;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "cloudFeedAssetsEntry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v14) & 1) != 0)
        goto LABEL_21;
      v15 = objc_msgSend(v6, "indexOfSectionInfoForCloudFeedEntry:", v14);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_21;
      v16 = v15;
      if ((objc_msgSend(v11, "containsIndex:", v15) & 1) != 0)
        goto LABEL_21;
      v30 = v11;
      objc_msgSend(v6, "sectionInfoAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v29, "numberOfItemsInSection:", v16);
      if (v18 < 1)
        goto LABEL_20;
      v19 = v18 + 1;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v19 - 2, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindCaption"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          break;
LABEL_14:
        if ((unint64_t)--v19 <= 1)
          goto LABEL_19;
      }
      objc_msgSend(v17, "captionForItemAtIndex:", v19 - 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "length"))
      {

        goto LABEL_14;
      }
      v23 = v30;
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v30 = v23;
      objc_msgSend(v23, "addIndex:", v16);

LABEL_19:
      v8 = v27;
      v6 = v28;
      v12 = v25;
      v7 = v26;
LABEL_20:
      objc_msgSend(v7, "addObject:", v14);

      v11 = v30;
LABEL_21:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v10);

  if (v11)
    -[PUFeedViewController _updateInterfaceForDeletedSections:insertedSections:updatedSections:](v24, "_updateInterfaceForDeletedSections:insertedSections:updatedSections:", 0, 0, v11);
LABEL_26:

}

- (void)_updateSectionsWithLikesAndCommentChangesFromUpdatedAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PUFeedViewController *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "cloudFeedAssetsEntry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
        {
          v14 = objc_msgSend(v6, "indexOfSectionInfoForCloudFeedEntry:", v13);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v14;
            if ((objc_msgSend(v5, "containsIndex:", v14) & 1) == 0)
            {
              objc_msgSend(v5, "addIndex:", v15);
              objc_msgSend(v7, "addObject:", v13);
            }
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v5, "count"))
    -[PUFeedViewController _updateInterfaceForDeletedSections:insertedSections:updatedSections:](v16, "_updateInterfaceForDeletedSections:insertedSections:updatedSections:", 0, 0, v5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  if (-[PUFeedViewController contentType](self, "contentType") == 2)
  {
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v8 && objc_msgSend(v11, "isEqualToString:", CFSTR("contentSize")))
    {
      -[PUFeedViewController popoverPresentationController](self, "popoverPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredContentSizeDidChangeForChildContentContainer:", self);

    }
  }

}

- (void)assetContainerListDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[PUFeedViewController _pushedAlbum](self, "_pushedAlbum", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "isDeleted");
    v5 = v10;
    if (v6)
    {
      -[PUFeedViewController _pushedViewController](self, "_pushedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pl_visitControllerHierarchyWithBlock:", &__block_literal_global_498);

      -[PUFeedViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popToViewController:animated:", self, 1);

      v5 = v10;
    }
  }

}

- (id)zoomTransition:(id)a3 photoTokenForPhoto:(id)a4 inCollection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a5, "transientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionInfoWithIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (-[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "indexOfSectionInfo:", v10),
          v11,
          v12 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pl_managedAssetFromPhotoLibrary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v10, "sectionType");
    if (v16 != 3)
    {
      if (v16 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = CFSTR("PUFeedPhotoTokenIndexPath");
        v24[1] = CFSTR("PUFeedPhotoTokenPhoto");
        v25[0] = v18;
        v25[1] = v7;
        v24[2] = CFSTR("PUFeedPhotoTokenSectionInfo");
        v24[3] = CFSTR("PUFeedPhotoTokenElementKind");
        v25[2] = v10;
        v25[3] = CFSTR("PUFeedCollectionElementKindThumbnail");
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = v25;
        v21 = v24;
        v22 = 4;
        goto LABEL_11;
      }
      if (v16)
      {
        v13 = 0;
        goto LABEL_13;
      }
    }
    v17 = objc_msgSend(v10, "indexOfItemWithAsset:", v15);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = CFSTR("PUFeedPhotoTokenIndexPath");
    v26[1] = CFSTR("PUFeedPhotoTokenPhoto");
    v27[0] = v18;
    v27[1] = v7;
    v26[2] = CFSTR("PUFeedPhotoTokenSectionInfo");
    v27[2] = v10;
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v27;
    v21 = v26;
    v22 = 3;
LABEL_11:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)zoomTransition:(id)a3 getFrame:(CGRect *)a4 inCoordinateSpace:(id *)a5 contentMode:(int64_t *)a6 cropInsets:(UIEdgeInsets *)a7 forPhotoToken:(id)a8 operation:(int64_t)a9
{
  id v15;
  id v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double x;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  id v39;
  void *v40;
  int v41;
  void *v42;
  double v43;
  double Height;
  double v45;
  double v46;
  double v47;
  double MidY;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  CGFloat v54;
  uint64_t v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  BOOL IsEmpty;
  __int128 v77;
  int64_t *v79;
  UIEdgeInsets *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  UIEdgeInsets *v86;
  id v87;
  void *v88;
  int64_t *v89;
  void (**v90)(void);
  id *v91;
  _QWORD aBlock[4];
  id v93;
  id v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v15 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = a6;
    v80 = a7;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 3921, CFSTR("Photo Token is invalid! (%@)"), v15);

    a7 = v80;
    a6 = v79;
  }
  v16 = v15;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenIndexPath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v17)
  {
    v91 = a5;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenSectionInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUFeedViewController _shouldHideSectionInfo:forCollectionView:](self, "_shouldHideSectionInfo:forCollectionView:", v22, v23))
    {
      v24 = 0;
      v25 = 0;
    }
    else
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenElementKind"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v23, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v25, v17);
      else
        objc_msgSend(v23, "layoutAttributesForItemAtIndexPath:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      if (v26 && (objc_msgSend(v26, "isHidden") & 1) == 0)
      {
        objc_msgSend(v24, "frame");
        x = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;
        objc_msgSend(v23, "bounds");
        v103.origin.x = v35;
        v103.origin.y = v36;
        v103.size.width = v37;
        v103.size.height = v38;
        v95.origin.x = x;
        v95.origin.y = v30;
        v95.size.width = v32;
        v95.size.height = v34;
        if (!CGRectIntersectsRect(v95, v103))
          objc_msgSend(v23, "scrollRectToVisible:animated:", 0, x, v30, v32, v34);
        v89 = a6;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __113__PUFeedViewController_zoomTransition_getFrame_inCoordinateSpace_contentMode_cropInsets_forPhotoToken_operation___block_invoke;
        aBlock[3] = &unk_1E589F2A0;
        v87 = v22;
        v93 = v87;
        v39 = v17;
        v94 = v39;
        v90 = (void (**)(void))_Block_copy(aBlock);
        if (v25)
        {
          v82 = v39;
          v86 = a7;
          -[PUFeedViewController spec](self, "spec");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "shouldUseAspectThumbnails");

          if (v41)
          {
            -[PUFeedViewController spec](self, "spec");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v90[2]();
            objc_msgSend(v42, "thumbnailSizeForImageSize:");
            Height = v43;
            v46 = v45;

          }
          else
          {
            v96.origin.x = x;
            v96.origin.y = v30;
            v96.size.width = v32;
            v96.size.height = v34;
            Height = CGRectGetHeight(v96);
            v97.origin.x = x;
            v97.origin.y = v30;
            v97.size.width = v32;
            v97.size.height = v34;
            v46 = CGRectGetHeight(v97);
          }
          v98.origin.x = x;
          v98.origin.y = v30;
          v98.size.width = v32;
          v98.size.height = v34;
          v47 = CGRectGetMaxX(v98) - Height;
          v99.origin.x = v47;
          v99.origin.y = v30;
          v99.size.width = v32;
          v99.size.height = v34;
          MidY = CGRectGetMidY(v99);
          if (PUMainScreenScale_onceToken != -1)
            dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
          v49 = *(double *)&PUMainScreenScale_screenScale;
          objc_msgSend(v87, "assetsForItemAtIndex:maximumCount:", 0, PUFeedStackViewMaximumNumberOfVisibleItems);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenPhoto"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v50;
          objc_msgSend(v50, "pl_managedAssetFromPhotoLibrary:", v51);
          v52 = objc_claimAutoreleasedReturnValue();

          v84 = (void *)v52;
          v53 = objc_msgSend(v88, "indexOfObject:", v52);
          if (v53 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v54 = round(v49 * (MidY + v46 * -0.5)) / v49;
            v100.origin.x = v47;
            v100.origin.y = v54;
            v100.size.width = Height;
            v100.size.height = v46;
            v101.origin.x = CGRectGetMidX(v100);
            x = v101.origin.x;
            v101.origin.y = v54;
            v101.size.width = Height;
            v101.size.height = v46;
            v30 = CGRectGetMidY(v101);
            v32 = 1.0;
            v34 = 1.0;
          }
          else
          {
            v55 = v53;
            objc_msgSend(v23, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindThumbnail"), v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "badgedThumbnailView");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "imageViewForItemAtIndex:", v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v57, "bounds");
            v59 = v58;
            v61 = v60;
            v63 = v62;
            v65 = v64;
            objc_msgSend(v23, "coordinateSpace");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "convertRect:toCoordinateSpace:", v66, v59, v61, v63, v65);
            x = v67;
            v30 = v68;
            v32 = v69;
            v34 = v70;

          }
          a7 = v86;

        }
        -[PUFeedViewController view](self, "view");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "convertRect:fromView:", v23, x, v30, v32, v34);
        v18 = v72;
        v19 = v73;
        v20 = v74;
        v21 = v75;

        a6 = v89;
      }
    }

    a5 = v91;
  }
  v102.origin.x = v18;
  v102.origin.y = v19;
  v102.size.width = v20;
  v102.size.height = v21;
  IsEmpty = CGRectIsEmpty(v102);
  if (!IsEmpty)
  {
    if (a4)
    {
      a4->origin.x = v18;
      a4->origin.y = v19;
      a4->size.width = v20;
      a4->size.height = v21;
      if (a5)
      {
        -[PUFeedViewController view](self, "view");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    if (a6)
      *a6 = 0;
    if (a7)
    {
      v77 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
      *(_OWORD *)&a7->top = *MEMORY[0x1E0DC49E8];
      *(_OWORD *)&a7->bottom = v77;
    }
  }

  return !IsEmpty;
}

- (void)zoomTransition:(id)a3 setVisibility:(BOOL)a4 forPhotoToken:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;

  v5 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 4018, CFSTR("Photo Token is invalid! (%@)"), v8);

  }
  v9 = v8;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenIndexPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenSectionInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfSectionInfo:", v12);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_msgSend(v12, "sectionType");
    if (v15 == 3)
      goto LABEL_7;
    if (v15 != 1)
    {
      if (v15)
        goto LABEL_17;
LABEL_7:
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenPhoto"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "vitalityEnabled"))
      {
        v18 = objc_msgSend(v16, "canPlayPhotoIris");

        if ((v18 & 1) != 0)
        {
          objc_msgSend(v10, "cellForItemAtIndexPath:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __67__PUFeedViewController_zoomTransition_setVisibility_forPhotoToken___block_invoke;
          v36[3] = &unk_1E58AAD68;
          v37 = v19;
          v38 = v5;
          v20 = v19;
          objc_msgSend(v20, "performIrisPlayerChanges:", v36);

LABEL_14:
          goto LABEL_17;
        }
      }
      else
      {

      }
      objc_msgSend(v10, "cellForItemAtIndexPath:", v11);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImageHidden:", !v5);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindThumbnail"), v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "item");
    objc_msgSend(v12, "assetsForItemAtIndex:maximumCount:", v22, PUFeedStackViewMaximumNumberOfVisibleItems);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenPhoto"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pl_managedAssetFromPhotoLibrary:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v23;
    v27 = objc_msgSend(v23, "indexOfObject:", v26);
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = v34;
      v29 = v21;
      v21 = 0;
    }
    else
    {
      v30 = v27;
      objc_msgSend(v34, "badgedThumbnailView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v28 = v34;
      objc_msgSend(v29, "setImageHidden:forItemAtIndex:", !v5, v31);
    }

    v11 = v21;
  }
LABEL_17:
  if (v5)
    v32 = 0;
  else
    v32 = v11;
  -[PUFeedViewController _setIndexPathForImageHiddenDuringZoomTransition:](self, "_setIndexPathForImageHiddenDuringZoomTransition:", v32);

}

- (BOOL)zoomTransition:(id)a3 transitionImageForPhotoToken:(id)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedViewController.m"), 4071, CFSTR("Photo Token is invalid! (%@)"), v8);

  }
  v10 = v8;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenIndexPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v11, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindThumbnail"), v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUFeedPhotoTokenPhoto"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "aspectRatio");
    v17 = PXFloatEqualToFloatWithTolerance();
    if (v17)
      v9[2](v9, v15);

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (void)zoomTransition:(id)a3 willBeginForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v6;

  if (a5 && a6)
  {
    -[PUFeedViewController _pinchedCollectionView](self, "_pinchedCollectionView", a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 0);

  }
}

- (void)zoomTransition:(id)a3 didFinishForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v6;

  if (a5 && a6)
  {
    -[PUFeedViewController _pinchedCollectionView](self, "_pinchedCollectionView", a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 1);

  }
}

- (BOOL)cloudFeedAssetIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "cloudFeedAssetsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _loadedSectionInfoForCloudFeedEntry:](self, "_loadedSectionInfoForCloudFeedEntry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "indexOfItemWithAsset:", v4) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = 0;

  return v8;
}

- (BOOL)cloudFeedCommentIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "cloudFeedEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _loadedSectionInfoForCloudFeedEntry:](self, "_loadedSectionInfoForCloudFeedEntry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "indexOfItemWithComment:", v4) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = 0;

  return v8;
}

- (BOOL)cloudFeedInvitationForAlbumIsAvailableForNavigation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D71618];
  v5 = a3;
  objc_msgSend(v5, "cloudGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstEntryWithType:albumGUID:inLibrary:", 3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "indexOfSectionInfoForCloudFeedEntry:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v5;
}

- (void)performWhenReadyToNavigate:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[PUFeedViewController _hasAppeared](self, "_hasAppeared"))
    v4[2]();
  else
    -[PUFeedViewController _performOnNextViewLayout:](self, "_performOnNextViewLayout:", v4);

}

- (void)navigateToRevealCloudFeedAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PUFeedViewController_navigateToRevealCloudFeedAsset_completion___block_invoke;
  v8[3] = &unk_1E589F2C8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PUFeedViewController _navigateToRevealAsset:completion:](self, "_navigateToRevealAsset:completion:", a3, v8);

}

- (void)navigateToCloudFeedAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PUFeedViewController_navigateToCloudFeedAsset_completion___block_invoke;
  v10[3] = &unk_1E589F2F0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUFeedViewController _navigateToRevealAsset:completion:](self, "_navigateToRevealAsset:completion:", v9, v10);

}

- (void)navigateToRevealCloudFeedComment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PUFeedViewController_navigateToRevealCloudFeedComment_completion___block_invoke;
  v13[3] = &unk_1E589F2C8;
  v9 = v7;
  v13[4] = self;
  v14 = v9;
  if (!-[PUFeedViewController _navigateToRevealComment:completion:](self, "_navigateToRevealComment:completion:", v6, v13))
  {
    objc_msgSend(v6, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __68__PUFeedViewController_navigateToRevealCloudFeedComment_completion___block_invoke_2;
    v11[3] = &unk_1E589F2C8;
    v11[4] = self;
    v12 = v9;
    -[PUFeedViewController _navigateToRevealAsset:completion:](self, "_navigateToRevealAsset:completion:", v10, v11);

  }
}

- (void)navigateToCloudFeedComment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PUFeedViewController_navigateToCloudFeedComment_completion___block_invoke;
  aBlock[3] = &unk_1E589F2F0;
  aBlock[4] = self;
  v8 = v6;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  if (!-[PUFeedViewController _navigateToRevealComment:completion:](self, "_navigateToRevealComment:completion:", v8, v10))
  {
    objc_msgSend(v8, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _navigateToRevealAsset:completion:](self, "_navigateToRevealAsset:completion:", v11, v10);

  }
}

- (void)navigateToRevealCloudFeedInvitationForAlbum:(id)a3 completion:(id)a4
{
  void *v5;
  int v6;
  PUFeedViewController *v7;
  PUFeedViewController *v8;
  void (**v9)(id, PUFeedViewController *);

  v9 = (void (**)(id, PUFeedViewController *))a4;
  -[PUFeedViewController spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowInvitationsInPopover");

  if (v6)
  {
    -[PUFeedViewController _showInvitationsPopoverAnimated:](self, "_showInvitationsPopoverAnimated:", 0);
    -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
    v7 = (PUFeedViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUFeedViewController navigateToNewestContentAnimated:](self, "navigateToNewestContentAnimated:", 0);
    v7 = self;
  }
  v8 = v7;
  if (v9)
    v9[2](v9, v7);

}

- (BOOL)_shouldNavigateToNewestContent
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flowDirectionEdge");

  LOBYTE(v3) = objc_msgSend(v2, "px_isScrolledAtEdge:", v4) ^ 1;
  return (char)v3;
}

- (void)navigateToNewestContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "flowDirectionEdge");

  objc_msgSend(v6, "px_scrollToEdge:animated:", v5, v3);
}

- (void)_navigateToRevealAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "cloudFeedAssetsEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _loadedSectionInfoForCloudFeedEntry:](self, "_loadedSectionInfoForCloudFeedEntry:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "indexOfItemWithAsset:", v11);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[PUFeedViewController _navigateToSectionInfo:atItemIndex:completion:](self, "_navigateToSectionInfo:atItemIndex:completion:", v9, v10, v6);
  }

}

- (BOOL)_navigateToRevealComment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cloudFeedEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _loadedSectionInfoForCloudFeedEntry:](self, "_loadedSectionInfoForCloudFeedEntry:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || -[PUFeedViewController _shouldHideSectionInfo:forCollectionView:](self, "_shouldHideSectionInfo:forCollectionView:", v9, v10)|| (v11 = objc_msgSend(v9, "indexOfItemWithComment:", v6), v11 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v12 = 0;
  }
  else
  {
    -[PUFeedViewController _navigateToSectionInfo:atItemIndex:completion:](self, "_navigateToSectionInfo:atItemIndex:completion:", v9, v11, v7);
    v12 = 1;
  }

  return v12;
}

- (id)_loadedSectionInfoForCloudFeedEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSectionInfoForCloudFeedEntry:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    && (!objc_msgSend(v5, "reconfigureToIncludeCloudFeedEntry:", v4)
     || (v6 = objc_msgSend(v5, "indexOfSectionInfoForCloudFeedEntry:", v4), v6 == 0x7FFFFFFFFFFFFFFFLL)))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "sectionInfoAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isLoaded") & 1) == 0)
      -[PUFeedViewController _ensureWindowOfLoadedSectionInfosIncludesSection:](self, "_ensureWindowOfLoadedSectionInfosIncludesSection:", v6);
  }

  return v7;
}

- (void)_navigateToSectionInfo:(id)a3 atItemIndex:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, id);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (void (**)(id, id))a5;
  -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfSectionInfo:", v14);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    if (!-[PUFeedViewController _areViewsInSyncWithModel](self, "_areViewsInSyncWithModel"))
      -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
    -[PUFeedViewController _updateCollectionViews](self, "_updateCollectionViews");
    -[PUFeedViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 0);
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pu_scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 18, 0);
    if (v8)
      v8[2](v8, v14);

  }
}

- (void)_updateCellsVideoEnabledness
{
  PUFeedViewController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL8 v25;
  PUFeedViewController *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  uint64_t v63;
  void *v64;
  CGRect rect;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v2 = self;
  v75 = *MEMORY[0x1E0C80C00];
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _collectionViewSpeedometer](v2, "_collectionViewSpeedometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "regime");

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loopsEnabled");

  v7 = -[PUFeedViewController _viewDidAppear](v2, "_viewDidAppear");
  if (v6)
    v8 = v4 < 3 && v7;
  else
    v8 = 0;
  objc_msgSend(v64, "visibleCells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v70;
    v63 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v8)
          {
            objc_msgSend(v15, "contentView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "frame");
            v18 = v17;
            v20 = v19;
            v22 = v21;
            v24 = v23;
            objc_msgSend(v15, "contentView");
            v25 = v8;
            v26 = v2;
            v27 = v10;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "superview");
            v29 = v12;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "convertRect:fromView:", v30, v18, v20, v22, v24);
            v32 = v31;
            v34 = v33;
            v36 = v35;
            rect.origin.y = v35;
            v38 = v37;

            v12 = v29;
            v10 = v27;
            v2 = v26;
            v8 = v25;
            v13 = v63;

            objc_msgSend(v64, "bounds");
            v81.origin.x = v39;
            v81.origin.y = v40;
            v81.size.width = v41;
            v81.size.height = v42;
            v76.origin.x = v32;
            v76.origin.y = v34;
            v76.size.width = v36;
            v76.size.height = v38;
            v43 = v38;
            v77 = CGRectIntersection(v76, v81);
            x = v77.origin.x;
            y = v77.origin.y;
            width = v77.size.width;
            height = v77.size.height;
            v48 = CGRectGetWidth(v77);
            v78.origin.x = v32;
            v78.origin.y = v34;
            v78.size.width = rect.origin.y;
            v78.size.height = v43;
            v49 = v48 / CGRectGetWidth(v78);
            v79.origin.x = x;
            v79.origin.y = y;
            v79.size.width = width;
            v79.size.height = height;
            v50 = CGRectGetHeight(v79);
            v80.origin.x = v32;
            v80.origin.y = v34;
            v80.size.width = rect.origin.y;
            v80.size.height = v43;
            v51 = CGRectGetHeight(v80);
            v52 = v15;
            if (v49 > 0.33 && v50 / v51 > 0.33)
            {
              v53 = v52;
              if (!-[PUFeedViewController _beginPlayingVideoInCellIfNeeded:](v2, "_beginPlayingVideoInCellIfNeeded:", v52, v50 / v51))objc_msgSend(v62, "addObject:", v53);
              goto LABEL_19;
            }
          }
          else
          {
            v54 = v15;
          }
          -[PUFeedViewController _endPlayingVideoInCellIfNeeded:](v2, "_endPlayingVideoInCellIfNeeded:", v15, v62);
LABEL_19:

          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v62, "count"))
  {
    -[PUFeedViewController imageCellsPlayingVideo](v2, "imageCellsPlayingVideo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56 <= 4)
    {
      v67 = 0u;
      v68 = 0u;
      rect.size = 0u;
      v66 = 0u;
      v57 = v62;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &rect.size, v73, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v66 != v60)
              objc_enumerationMutation(v57);
            -[PUFeedViewController _beginPlayingVideoInCellIfNeeded:](v2, "_beginPlayingVideoInCellIfNeeded:", *(_QWORD *)(*(_QWORD *)&rect.size.height + 8 * j), v62);
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &rect.size, v73, 16);
        }
        while (v59);
      }

    }
  }

}

- (BOOL)_beginPlayingVideoInCellIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25[2];
  id location;

  v4 = a3;
  -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v7 = 0;
LABEL_11:

      goto LABEL_12;
    }
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", objc_msgSend(v9, "section"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetForItemAtIndex:", objc_msgSend(v10, "item"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "playbackStyle") == 5)
    {
      -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 > 4)
      {
        v7 = 0;
        goto LABEL_10;
      }
      v15 = (void *)objc_msgSend(v4, "tag");
      objc_initWeak(&location, self);
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__PUFeedViewController__beginPlayingVideoInCellIfNeeded___block_invoke;
      v23[3] = &unk_1E589F318;
      objc_copyWeak(v25, &location);
      v17 = v10;
      v24 = v17;
      v25[1] = v15;
      v20[0] = v16;
      v20[1] = 3221225472;
      v20[2] = __57__PUFeedViewController__beginPlayingVideoInCellIfNeeded___block_invoke_2;
      v20[3] = &unk_1E589F340;
      objc_copyWeak(v22, &location);
      v21 = v17;
      v22[1] = v15;
      -[PUFeedViewController _requestPlayerItemForAsset:preparation:completion:](self, "_requestPlayerItemForAsset:preparation:completion:", v12, v23, v20);
      -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v4);

      objc_destroyWeak(v22);
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    v7 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v7 = 1;
LABEL_12:

  return v7;
}

- (void)_handleVideoRequestID:(int)a3 forCellAtIndexPath:(id)a4 withTag:(int64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v10, "tag") == a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setPlayerItemRequestID:", v6);
    }
  }

}

- (void)_handleVideoRequestResult:(id)a3 forCellAtIndexPath:(id)a4 withTag:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v10, "tag") == a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPlayerItem:", v11);

      }
    }
  }

}

- (void)_endPlayingVideoInCellIfNeeded:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setPlayerItem:", 0);
  v4 = objc_msgSend(v8, "playerItemRequestID");
  if ((_DWORD)v4)
  {
    v5 = v4;
    -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelImageRequest:", v5);

    objc_msgSend(v8, "setPlayerItemRequestID:", 0);
  }
  -[PUFeedViewController imageCellsPlayingVideo](self, "imageCellsPlayingVideo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return objc_msgSend(a3, "type") == 20;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (**v14)(id, uint64_t, _QWORD);

  v14 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = a3;
  v8 = -[PUFeedViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", v7);
  objc_msgSend(v7, "sidebarBackNavigationRootDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  if (v10 == 20)
  {
    -[PUFeedViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PUFeedViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_updateBackButtonVisibilityForTraitCollection:", v12);

  }
  if (v8)
    v13 = 1;
  else
    v13 = 2;
  v14[2](v14, v13, 0);

}

- (id)px_navigationDestination
{
  return 0;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissOneUpViewControllerForced:animated:", v3, 0);

  return 1;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  if (-[PUFeedViewController contentType](self, "contentType"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = -[PUFeedViewController _shouldNavigateToNewestContent](self, "_shouldNavigateToNewestContent");
    if (v5)
    {
      -[PUFeedViewController navigateToNewestContentAnimated:](self, "navigateToNewestContentAnimated:", v3);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)didTapFeedCell:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "representedElementKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")))
  {
    -[PUFeedViewController _didTapThumbnailOrOverlayPlayButtonInFeedCell:](self, "_didTapThumbnailOrOverlayPlayButtonInFeedCell:", v5);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionHeader")))
  {
    -[PUFeedViewController _didTapSectionHeaderFeedCell:](self, "_didTapSectionHeaderFeedCell:", v5);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("PUFeedCollectionElementKindSectionFooter")))
  {
    -[PUFeedViewController _didTapSectionFooterFeedCell:](self, "_didTapSectionFooterFeedCell:", v5);
  }

}

- (void)_didTapCommentButtonInFeedCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUFeedViewController _setupBrowsingFromItemAtIndexPath:inCollectionView:](self, "_setupBrowsingFromItemAtIndexPath:inCollectionView:", v5, v6))
  {
    -[PUFeedViewController _navigateToOneUpBrowserWithOptions:animated:](self, "_navigateToOneUpBrowserWithOptions:animated:", 4, 1);
  }

}

- (void)_didTapThumbnailOrOverlayPlayButtonInFeedCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUFeedViewController _setupBrowsingFromItemAtIndexPath:inCollectionView:](self, "_setupBrowsingFromItemAtIndexPath:inCollectionView:", v5, v8))
  {
    -[PUFeedViewController _assetForItemAtIndexPath:inCollectionView:](self, "_assetForItemAtIndexPath:inCollectionView:", v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isVideo"))
      v7 = 11;
    else
      v7 = 0;
    -[PUFeedViewController _navigateToOneUpBrowserWithOptions:animated:](self, "_navigateToOneUpBrowserWithOptions:animated:", v7, 1);

  }
}

- (void)_didTapSectionHeaderFeedCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "section");
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sectionType");
  if (v9 > 5 || ((1 << v9) & 0x29) == 0)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Header should be hidden by _shouldHideHeaderForSectionWithType:! %@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend(v8, "numberOfItems") < 1)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "assetForItemAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "sharedAlbum");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _navigateToRevealPhoto:inAlbum:animated:](self, "_navigateToRevealPhoto:inAlbum:animated:", v11, v12, 1);

  }
}

- (void)_didTapSectionFooterFeedCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "section");
  -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfItems") >= 1)
  {
    objc_msgSend(v7, "assetForItemAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudShareAlbum");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _navigateToRevealPhoto:inAlbum:animated:](self, "_navigateToRevealPhoto:inAlbum:animated:", v8, v9, 1);

  }
}

- (void)didTapButtonInFeedTextCell:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  dispatch_time_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v23, "section");
  objc_msgSend(v22, "sectionsJoinedWithSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "buttonType");
  v10 = (v8 & 0xFFFFFFFFFFFFFFFBLL) - 1 < 2 || v8 == 7;
  -[PUFeedViewController _justLikedSections](self, "_justLikedSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, v14);

  -[PUFeedViewController _setJustLikedSections:](self, "_setJustLikedSections:", v12);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _configureTextCell:forHeaderOfSections:inCollectionView:animated:](self, "_configureTextCell:forHeaderOfSections:inCollectionView:animated:", v4, v15, v5, 1);

  UIAnimationDragCoefficient();
  v17 = dispatch_time(0, (uint64_t)(v16 * 0.5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PUFeedViewController_didTapButtonInFeedTextCell___block_invoke;
  block[3] = &unk_1E589F368;
  block[4] = self;
  v25 = v11;
  v28 = v10;
  v26 = v7;
  v27 = v5;
  v18 = v5;
  v19 = v7;
  v20 = v11;
  dispatch_after(v17, MEMORY[0x1E0C80D38], block);
  PLSAggregateDictionaryAddValueForScalarKey();
  v21 = (_QWORD *)MEMORY[0x1E0D7BF58];
  if (!v10)
    v21 = (_QWORD *)MEMORY[0x1E0D7BF60];
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *v21, MEMORY[0x1E0C9AA70]);

}

- (void)didTapLikeButtonInFeedCaptionCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;

  v4 = a3;
  -[PUFeedViewController _collectionViewContainingView:](self, "_collectionViewContainingView:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionsJoinedWithSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "isLiked");
  -[PUFeedViewController _setUserCloudSharedLiked:forItemsInSections:inCollectionView:](self, "_setUserCloudSharedLiked:forItemsInSections:inCollectionView:", v8, v7, v10);
  PLSAggregateDictionaryAddValueForScalarKey();
  v9 = (_QWORD *)MEMORY[0x1E0D7BF58];
  if (!(_DWORD)v8)
    v9 = (_QWORD *)MEMORY[0x1E0D7BF60];
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *v9, MEMORY[0x1E0C9AA70]);

}

- (void)feedInvitationCell:(id)a3 didAccept:(BOOL)a4
{
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  PUFeedViewController *v12;
  id v13[2];
  id location;

  if (a4)
  {
    objc_msgSend(a3, "invitationSectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedAlbum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PUFeedViewController_feedInvitationCell_didAccept___block_invoke;
    block[3] = &unk_1E58A6AC0;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a2;
    v11 = v7;
    v12 = self;
    v9 = v7;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);

  }
  else
  {
    -[PUFeedViewController _setUserDidDismissPlaceholder:](self, "_setUserDidDismissPlaceholder:", 0);
  }
}

- (void)feedInvitationCell:(id)a3 presentViewController:(id)a4
{
  -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  BOOL v9;
  BOOL v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  -[PUFeedViewController _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 != v4)
  {
    v6 = (void *)v5;
    goto LABEL_3;
  }
  v11 = -[PUFeedViewController _shouldShowBarsForCollectionViewType:](self, "_shouldShowBarsForCollectionViewType:", -[PUFeedViewController _currentCollectionViewType](self, "_currentCollectionViewType"));

  if (!v11)
  {
    -[PUFeedViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v4, "locationInView:", v6);
    v21 = v20;
    v22.origin.x = v13;
    v22.origin.y = v15;
    v22.size.width = v17;
    v22.size.height = v19;
    if (v21 < CGRectGetMinY(v22) + 12.5
      || (v23.origin.x = v13,
          v23.origin.y = v15,
          v23.size.width = v17,
          v23.size.height = v19,
          v21 > CGRectGetMaxY(v23) + -12.5)
      || -[PUFeedViewController _barsState](self, "_barsState") != 2)
    {
      v7 = 1;
      goto LABEL_4;
    }
LABEL_3:
    v7 = 0;
LABEL_4:

    goto LABEL_5;
  }
  v7 = 0;
LABEL_5:
  -[PUFeedViewController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
    v9 = 1;
  else
    v9 = v7;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PUFeedViewController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5
{
  void *v7;
  int64_t v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumScrollRegimeForQualityImageFormats");

  if (v8 == -1)
    v8 = -[PUFeedViewController _defaultMaximumScrollRegimeForQualityImageFormats](self, "_defaultMaximumScrollRegimeForQualityImageFormats");
  if (-[PUFeedViewController _shouldSuspendQualityImageFormats](self, "_shouldSuspendQualityImageFormats") != v8 < a4)
  {
    v9 = v8 < a4;
    v10 = v8 >= a4;
    v11 = v9;
    -[PUFeedViewController _setShouldSuspendQualityImageFormats:](self, "_setShouldSuspendQualityImageFormats:", v11);
    -[PUFeedViewController _cachingImageManager](self, "_cachingImageManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsCachingHighQualityImages:", v10);

  }
  if (a4 == 3)
  {
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fastScrollPreheatingWindowSize");
  }
  else if (a4 == 2)
  {
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediumScrollPreheatingWindowSize");
  }
  else
  {
    if (!a4)
    {
      -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedViewController _updatePreheatedAssetsForCollectionView:](self, "_updatePreheatedAssetsForCollectionView:", v13);

    }
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "slowScrollPreheatingWindowSize");
  }
  v16 = v15;

  -[PUFeedViewController _setPreheatingWindowSize:](self, "_setPreheatingWindowSize:", v16);
  -[PUFeedViewController _updateCellsVideoEnabledness](self, "_updateCellsVideoEnabledness");
  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "useSpeedometerFeedback");

  if (v18)
  {
    switch(a4)
    {
      case 3:
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v19 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
        v19 = objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v19 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        v24 = 0;
        goto LABEL_25;
    }
    v24 = (id)v19;
LABEL_25:
    -[PUFeedViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTintColor:", v24);

    -[PUFeedViewController tabBarController](self, "tabBarController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tabBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v24);

  }
}

- (int64_t)_defaultMaximumScrollRegimeForQualityImageFormats
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (_defaultMaximumScrollRegimeForQualityImageFormats_onceToken != -1)
    dispatch_once(&_defaultMaximumScrollRegimeForQualityImageFormats_onceToken, &__block_literal_global_520);
  if ((-[PUFeedViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    -[PUFeedViewController view](self, "view");
  else
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 >= v7)
    v8 = v7;
  else
    v8 = v5;
  if (v8 / *(double *)&_defaultMaximumScrollRegimeForQualityImageFormats_largestJPEGThumbnailDimension < 3.0)
    return 1;
  else
    return 2;
}

- (id)_currentRestorableState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int (**v7)(void *, _QWORD);
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
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  PUFeedViewControllerRestorableState *v75;
  double v76;
  double v77;
  void *v79;
  unsigned int v80;
  void *v81;
  double MidY;
  double MidX;
  void *v84;
  id obj;
  PUFeedViewController *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD aBlock[5];
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v99 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v3, "px_isScrolledAtEdge:tolerance:", objc_msgSend(v4, "flowDirectionEdge"), 10.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PUFeedViewController__currentRestorableState__block_invoke;
  aBlock[3] = &unk_1E589F3B0;
  v86 = self;
  aBlock[4] = self;
  v6 = v3;
  v96 = v6;
  v7 = (unsigned int (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "adjustedContentInset");
  v17 = v9 + v16;
  v19 = v11 + v18;
  v21 = v13 - (v16 + v20);
  v23 = v15 - (v18 + v22);
  if (objc_msgSend(v4, "flowDirection") && objc_msgSend(v4, "flowDirection") != 3)
  {
    v25 = v21 * 0.400000006;
    v24 = v23;
  }
  else
  {
    v24 = v23 * 0.200000003;
    v25 = v21;
  }
  v26 = PURectWithSizeThatFitsInRect(v25, v24, v17, v19, v21, v23);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v100.origin.x = v17;
  v100.origin.y = v19;
  v100.size.width = v21;
  v100.size.height = v23;
  MidX = CGRectGetMidX(v100);
  v101.origin.x = v17;
  v101.origin.y = v19;
  v101.size.width = v21;
  v101.size.height = v23;
  MidY = CGRectGetMidY(v101);
  v84 = v4;
  objc_msgSend(v4, "layoutAttributesForElementsInRect:", v26, v28, v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v92 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
        if (v7[2](v7, v38))
          objc_msgSend(v5, "addObject:", v38);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    }
    while (v35);
  }
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v84, "pu_layoutAttributesForElementClosestToPoint:inRect:passingTest:", v7, MidX, MidY, v17, v19, v21, v23);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v5, "addObject:", v39);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count", v33));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v5;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v88 != v44)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v46, "indexPath");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUFeedViewController _assetForItemAtIndexPath:inCollectionView:](v86, "_assetForItemAtIndexPath:inCollectionView:", v47, v6);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "uuid");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "frame");
        objc_msgSend(v6, "pu_displayFrameForRect:");
        v51 = v50;
        v53 = v52;
        v55 = v54;
        v57 = v56;
        objc_msgSend(v40, "addObject:", v49);
        v102.origin.x = v51;
        v102.origin.y = v53;
        v102.size.width = v55;
        v102.size.height = v57;
        NSStringFromCGRect(v102);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v58);

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    }
    while (v43);
  }

  v59 = v84;
  objc_msgSend(v84, "pu_layoutAttributesForElementClosestToPoint:inRect:passingTest:", &__block_literal_global_524, MidX, MidY, v17, v19, v21, v23);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    objc_msgSend(v60, "indexPath");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "section");

    -[PUFeedViewController _sectionInfoForSection:collectionView:](v86, "_sectionInfoForSection:collectionView:", v63, v6);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "cloudFeedEntry");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "URIRepresentation");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v84;
    objc_msgSend(v84, "frameForSection:", v63);
    objc_msgSend(v6, "pu_displayFrameForRect:");
    v68 = v67;
    v70 = v69;
    v72 = v71;
    v74 = v73;

  }
  else
  {
    v66 = 0;
    v68 = *MEMORY[0x1E0C9D648];
    v70 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v72 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v74 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v75 = objc_alloc_init(PUFeedViewControllerRestorableState);
  -[PUFeedViewControllerRestorableState setDate:](v75, "setDate:", v81);
  -[PUFeedViewControllerRestorableState setScrolledToNewest:](v75, "setScrolledToNewest:", v80);
  -[PUFeedViewControllerRestorableState setCenterAssetUUIDs:](v75, "setCenterAssetUUIDs:", v40);
  -[PUFeedViewControllerRestorableState setCenterAssetFrames:](v75, "setCenterAssetFrames:", v41);
  -[PUFeedViewControllerRestorableState setCenterSectionEntryURIRepresentation:](v75, "setCenterSectionEntryURIRepresentation:", v66);
  -[PUFeedViewControllerRestorableState setCenterSectionFrame:](v75, "setCenterSectionFrame:", v68, v70, v72, v74);
  objc_msgSend(v6, "bounds");
  -[PUFeedViewControllerRestorableState setCollectionViewSize:](v75, "setCollectionViewSize:", v76, v77);

  return v75;
}

- (void)_enumerateCenterAssetsInRestorableState:(id)a3 inCollectionView:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "collectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerAssetUUIDs");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerAssetFrames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__PUFeedViewController__enumerateCenterAssetsInRestorableState_inCollectionView_usingBlock___block_invoke;
  v18[3] = &unk_1E589F418;
  v18[4] = self;
  v19 = v8;
  v20 = v11;
  v21 = v12;
  v22 = v9;
  v13 = v9;
  v14 = v12;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v18);

}

- (void)_restoreScrollPositionInCollectionView:(id)a3 fromRestorableState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double MinY;
  double MinX;
  double v43;
  double v44;
  CGFloat rect;
  _QWORD v46[5];
  uint64_t v47;
  CGRect *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  objc_msgSend(v6, "bounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "collectionViewSize");
  v15 = v10 == v14 && v12 == v13;
  if (!*((_BYTE *)v57 + 24))
  {
    if (v15)
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __83__PUFeedViewController__restoreScrollPositionInCollectionView_fromRestorableState___block_invoke;
      v53[3] = &unk_1E589F440;
      v54 = v6;
      v55 = &v56;
      -[PUFeedViewController _enumerateCenterAssetsInRestorableState:inCollectionView:usingBlock:](self, "_enumerateCenterAssetsInRestorableState:inCollectionView:usingBlock:", v7, v54, v53);

    }
    else
    {
      v47 = 0;
      v48 = (CGRect *)&v47;
      v49 = 0x4010000000;
      v50 = &unk_1AB197D4B;
      v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v51 = *MEMORY[0x1E0C9D628];
      v52 = v16;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __83__PUFeedViewController__restoreScrollPositionInCollectionView_fromRestorableState___block_invoke_2;
      v46[3] = &unk_1E589F468;
      v46[4] = &v47;
      -[PUFeedViewController _enumerateCenterAssetsInRestorableState:inCollectionView:usingBlock:](self, "_enumerateCenterAssetsInRestorableState:inCollectionView:usingBlock:", v7, v6, v46);
      if (!CGRectIsEmpty(v48[1]))
      {
        objc_msgSend(v6, "pu_scrollToRect:atScrollPosition:animated:", 18, 0, v48[1].origin.x, v48[1].origin.y, v48[1].size.width, v48[1].size.height);
        *((_BYTE *)v57 + 24) = 1;
      }
      _Block_object_dispose(&v47, 8);
    }
  }
  if (!*((_BYTE *)v57 + 24))
  {
    objc_msgSend(v7, "centerSectionEntryURIRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0D71618];
      objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "entryWithURIRepresentation:inLibrary:", v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUFeedViewController _feedSectionInfosManager](self, "_feedSectionInfosManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "indexOfSectionInfoForCloudFeedEntry:", v20);

      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "frameForSection:", v22);
        objc_msgSend(v6, "pu_displayFrameForRect:");
        v27 = v23;
        v28 = v24;
        v29 = v25;
        v30 = v26;
        if (v15)
        {
          objc_msgSend(v7, "centerSectionFrame");
          rect = v31;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          objc_msgSend(v6, "contentOffset");
          v43 = v38;
          v44 = v39;
          v60.origin.x = v27;
          v60.origin.y = v28;
          v60.size.width = v29;
          v60.size.height = v30;
          MinX = CGRectGetMinX(v60);
          v61.origin.x = v33;
          v61.origin.y = v35;
          v61.size.width = rect;
          v61.size.height = v37;
          v40 = CGRectGetMinX(v61);
          v62.origin.x = v27;
          v62.origin.y = v28;
          v62.size.width = v29;
          v62.size.height = v30;
          MinY = CGRectGetMinY(v62);
          v63.origin.x = v33;
          v63.origin.y = v35;
          v63.size.width = rect;
          v63.size.height = v37;
          objc_msgSend(v6, "px_scrollToContentOffset:animated:", 0, v43 + MinX - v40, v44 + MinY - CGRectGetMinY(v63));
        }
        else
        {
          objc_msgSend(v6, "pu_scrollToRect:atScrollPosition:animated:", 9, 0, v23, v24, v25, v26);
        }
        *((_BYTE *)v57 + 24) = 1;
      }

    }
  }
  _Block_object_dispose(&v56, 8);

}

- (void)_navigateToRevealPhoto:(id)a3 inAlbum:(id)a4 animated:(BOOL)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = (void *)MEMORY[0x1E0CD16F8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "px_deprecated_appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pl_PHAssetFromPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosViewConfigurationForAssetCollection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v13);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__PUFeedViewController__navigateToRevealPhoto_inAlbum_animated___block_invoke;
  v18[3] = &unk_1E58A8A60;
  v19 = v11;
  v15 = v11;
  objc_msgSend(v14, "navigateToAsset:inAssetContainer:revealInOneUp:animated:completionHandler:", v15, v12, 0, 0, v18);
  v16 = v14;
  -[PUFeedViewController _setPushedAlbum:](self, "_setPushedAlbum:", v8);

  -[PUFeedViewController _setPushedViewController:](self, "_setPushedViewController:", v16);
  -[PUFeedViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushViewController:animated:", v16, 1);

}

- (void)_showOutOfNetworkInvitationMessageForSharedAlbum:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 1, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  PLLocalizedFrameworkString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedStringWithValidatedFormat(v8, CFSTR("%@ %@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 0, v21, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3448];
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__PUFeedViewController__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke;
  v24[3] = &unk_1E58AB6C0;
  v15 = v6;
  v25 = v15;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v11, 1, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v16);

  v17 = (void *)MEMORY[0x1E0DC3448];
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __91__PUFeedViewController__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke_2;
  v22[3] = &unk_1E58A3B68;
  v22[4] = self;
  v23 = v15;
  v18 = v15;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v10, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v19);

  -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)_openiCloudSettings
{
  objc_msgSend(MEMORY[0x1E0D7BAD8], "navigateToDestination:completion:", 4, 0);
}

- (void)_handleTap:(id)a3
{
  -[PUFeedViewController _cancelBarsAutoHide](self, "_cancelBarsAutoHide", a3);
  -[PUFeedViewController _setBarsState:](self, "_setBarsState:", 2 * (-[PUFeedViewController _barsState](self, "_barsState") != 2));
  -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 1, *MEMORY[0x1E0DC51A0]);
}

- (void)_handlePinch:(id)a3
{
  void *v4;
  char v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PUFeedViewController _oneUpPresentationHelper](self, "_oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handlePresentingPinchGestureRecognizer:", v14);

  if ((v5 & 1) == 0 && objc_msgSend(v14, "state") == 2)
  {
    objc_msgSend(v14, "velocity");
    if (v6 > 0.0)
    {
      -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInView:", v7);
      v9 = v8;
      v11 = v10;
      objc_msgSend(v7, "collectionViewLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForImageElementAtPoint:", v9, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[PUFeedViewController _beginInteractiveNavigationForItemAtIndexPath:inCollectionView:](self, "_beginInteractiveNavigationForItemAtIndexPath:inCollectionView:", v13, v7);

    }
  }

}

- (BOOL)_beginInteractiveNavigationForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;

  v6 = a4;
  v7 = -[PUFeedViewController _setupBrowsingFromItemAtIndexPath:inCollectionView:](self, "_setupBrowsingFromItemAtIndexPath:inCollectionView:", a3, v6);
  if (v7)
  {
    -[PUFeedViewController _setPinchedCollectionView:](self, "_setPinchedCollectionView:", v6);
    -[PUFeedViewController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _navigateToOneUpBrowserWithOptions:animated:pinchGestureRecognizer:](self, "_navigateToOneUpBrowserWithOptions:animated:pinchGestureRecognizer:", 0, 1, v8);

  }
  return v7;
}

- (void)_invitationsButtonAction:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  -[PUFeedViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[PUFeedViewController _dismissInvitationsPopoverIfNeeded](self, "_dismissInvitationsPopoverIfNeeded");
  else
LABEL_3:
    -[PUFeedViewController _showInvitationsPopoverAnimated:](self, "_showInvitationsPopoverAnimated:", 1);
}

- (void)_showInvitationsPopoverAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  PUFeedViewController *v7;
  PUFeedViewController *v8;
  void *v9;
  PUFeedViewController *v10;

  -[PUFeedViewController _setInvitationsPopoverShowPending:](self, "_setInvitationsPopoverShowPending:", 0);
  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
  v10 = (PUFeedViewController *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[PUFeedViewController spec](self, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "popoverFeedViewControllerSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PUFeedViewController initWithSpec:contentType:]([PUFeedViewController alloc], "initWithSpec:contentType:", v5, 2);
    -[PUFeedViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 7);
    -[PUFeedViewController popoverPresentationController](v10, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[PUFeedViewController _setInvitationsPopoverRootController:](self, "_setInvitationsPopoverRootController:", v10);
  }
  -[PUFeedViewController presentedViewController](self, "presentedViewController");
  v7 = (PUFeedViewController *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7 != v10)
  {
    -[PUFeedViewController _invitationsBarButtonItem](self, "_invitationsBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
    else
      -[PUFeedViewController _setInvitationsPopoverShowPending:](self, "_setInvitationsPopoverShowPending:", 1);

    v8 = v10;
  }

}

- (void)_handlePlaceholderAction
{
  int64_t v3;
  void *v4;
  int v5;

  v3 = -[PUFeedViewController _placeholderTypeForSizeTransitionState:](self, "_placeholderTypeForSizeTransitionState:", 0);
  if (v3 == 2)
  {
    -[PUFeedViewController spec](self, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowInvitationsInPopover");

    if (v5)
    {
      -[PUFeedViewController _showInvitationsPopoverAnimated:](self, "_showInvitationsPopoverAnimated:", 1);
    }
    else
    {
      -[PUFeedViewController _setUserDidDismissPlaceholder:](self, "_setUserDidDismissPlaceholder:", 1);
      -[PUFeedViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
    }
  }
  else if (v3 == 1)
  {
    -[PUFeedViewController _createNewStream](self, "_createNewStream");
  }
}

- (void)_createNewStream
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D719E0];
  objc_msgSend(v3, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "sharedStreamsEnabledForPhotoLibraryURL:", v5);

  if ((_DWORD)v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0D7B2B0]);
    objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithPhotoLibrary:presentationEnvironment:", v3, v7);

    objc_msgSend(v8, "performActionWithCompletionHandler:", 0);
  }
  else
  {
    -[PUFeedViewController spec](self, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "promptStyle");

    if (v10 == 1)
    {
      PXLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    PXLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v11, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v15);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__PUFeedViewController__createNewStream__block_invoke;
    v17[3] = &unk_1E58A8DE8;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v12, 0, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v16);

    -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  }

}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PUFeedViewController _invitationsBarButtonItem](self, "_invitationsBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarButtonItem:", v6);

  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUFeedViewController _invitationsPopoverRootController](self, "_invitationsPopoverRootController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stopObservingPopoverContentSizeIfNecessary");
  -[PUFeedViewController _setInvitationsPopoverRootController:](self, "_setInvitationsPopoverRootController:", 0);
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;

  -[PUFeedViewController spec](self, "spec", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFormats");

  -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
  -[PUFeedViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _configureSpeedometer:](self, "_configureSpeedometer:", v6);

}

- (void)_preferredContentSizeChanged:(id)a3
{
  void *v4;
  id v5;

  -[PUFeedViewController _currentRestorableState](self, "_currentRestorableState", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _invalidateCachedMetrics](self, "_invalidateCachedMetrics");
  -[PUFeedViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController _restoreScrollPositionInCollectionView:fromRestorableState:](self, "_restoreScrollPositionInCollectionView:fromRestorableState:", v4, v5);

}

- (void)_invalidateCachedMetrics
{
  void *v3;
  id v4;

  -[PUFeedViewController _setAssetsAddedCachedSectionHeaderSize:](self, "_setAssetsAddedCachedSectionHeaderSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "invalidateLayoutAndCache");
}

- (void)_reduceMotionStatusChanged:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "parallaxEnabled"))
    v5 = !UIAccessibilityIsReduceMotionEnabled();
  else
    v5 = 0;

  -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldApplyParallaxEffect:", v5);
  objc_msgSend(v6, "invalidateLayout");

}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 13;
}

- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4
{
  -[PUFeedViewController _setPushedViewController:](self, "_setPushedViewController:", a4);
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  -[PUFeedViewController _clearOneUpPresentationHelper](self, "_clearOneUpPresentationHelper", a3, a4);
  -[PUFeedViewController _setPushedViewController:](self, "_setPushedViewController:", 0);
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 1;
}

- (BOOL)canDragOut
{
  NSObject *v2;
  void *v3;
  char v4;
  uint8_t v6[16];

  PLDragAndDropGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEBUG, "canDragOut", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dragOutEnabled");

  return v4;
}

- (BOOL)_confidentialityWarningRequiredForAsset:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityCheckRequired"))
    v4 = objc_msgSend(MEMORY[0x1E0D7B978], "confidentialWarningRequiredForAsset:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)_presentConfidentialityWarning
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityAlertWithConfirmAction:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)_dragItemsForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PUFeedViewController canDragOut](self, "canDragOut"))
  {
    v5 = objc_msgSend(v4, "section");
    -[PUFeedViewController _currentCollectionView](self, "_currentCollectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedViewController _sectionInfoForSection:collectionView:](self, "_sectionInfoForSection:collectionView:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "typeForItemAtIndex:", objc_msgSend(v4, "item"));
    objc_msgSend(v7, "assetForItemAtIndex:", objc_msgSend(v4, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v10 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pl_PHAssetFromPhotoLibrary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PUFeedViewController _confidentialityWarningRequiredForAsset:](self, "_confidentialityWarningRequiredForAsset:", v12))
      {
        -[PUFeedViewController _presentConfidentialityWarning](self, "_presentConfidentialityWarning");
        v13 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        PXDragAndDropItemProviderForAsset();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v14);
        v16 = objc_alloc(MEMORY[0x1E0D7CCD0]);
        PXSimpleIndexPathFromIndexPath();
        v17 = (void *)objc_msgSend(v16, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v12, 0, &v20);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B338]), "initWithAssetReference:", v17);
        objc_msgSend(v15, "setLocalObject:", v18);
        v21[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v10 = v13;

    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ itemsForBeginningDragSession: %@ atIndexPath: %@", (uint8_t *)&v14, 0x20u);
  }

  -[PUFeedViewController _dragItemsForIndexPath:](self, "_dragItemsForIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  CGPoint v27;

  y = a6.y;
  x = a6.x;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  PLDragAndDropGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v27.x = x;
    v27.y = y;
    NSStringFromCGPoint(v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEBUG, "_collectionView: %@ itemsForAddingToDragSession: %@ atIndexPath: %@ point: %@", (uint8_t *)&v18, 0x2Au);

  }
  -[PUFeedViewController _dragItemsForIndexPath:](self, "_dragItemsForIndexPath:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (PXFeedSectionInfosManager)_feedSectionInfosManager
{
  return self->__feedSectionInfosManager;
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (NSMutableArray)_lastPreheatIndexPathList
{
  return self->__lastPreheatIndexPathList;
}

- (void)set_lastPreheatIndexPathList:(id)a3
{
  objc_storeStrong((id *)&self->__lastPreheatIndexPathList, a3);
}

- (NSMutableArray)_lastPreheatIndexPathInfoList
{
  return self->__lastPreheatIndexPathInfoList;
}

- (void)set_lastPreheatIndexPathInfoList:(id)a3
{
  objc_storeStrong((id *)&self->__lastPreheatIndexPathInfoList, a3);
}

- (PXFeedDateFormatter)_dateFormatter
{
  return self->__dateFormatter;
}

- (BOOL)_isFlowDirectionReversed
{
  return self->__flowDirectionReversed;
}

- (void)_setFlowDirectionReversed:(BOOL)a3
{
  self->__flowDirectionReversed = a3;
}

- (PUScrollViewSpeedometer)_collectionViewSpeedometer
{
  return self->__collectionViewSpeedometer;
}

- (void)_setCollectionViewSpeedometer:(id)a3
{
  objc_storeStrong((id *)&self->__collectionViewSpeedometer, a3);
}

- (BOOL)_isCollectionViewScrolledToNewest
{
  return self->__collectionViewScrolledToNewest;
}

- (void)_setCollectionViewScrolledToNewest:(BOOL)a3
{
  self->__collectionViewScrolledToNewest = a3;
}

- (BOOL)_shouldSuspendQualityImageFormats
{
  return self->__shouldSuspendQualityImageFormats;
}

- (void)_setShouldSuspendQualityImageFormats:(BOOL)a3
{
  self->__shouldSuspendQualityImageFormats = a3;
}

- (BOOL)_viewDidAppear
{
  return self->__viewDidAppear;
}

- (int64_t)_sizeTransitionState
{
  return self->__sizeTransitionState;
}

- (void)_setSizeTransitionState:(int64_t)a3
{
  self->__sizeTransitionState = a3;
}

- (PUFeedViewControllerRestorableState)_rotationLastRestorableState
{
  return self->__rotationLastRestorableState;
}

- (void)_setRotationLastRestorableState:(id)a3
{
  objc_storeStrong((id *)&self->__rotationLastRestorableState, a3);
}

- (int64_t)_barsState
{
  return self->__barsState;
}

- (void)_setBarsState:(int64_t)a3
{
  self->__barsState = a3;
}

- (CGSize)_targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->__targetSize.width;
  height = self->__targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTargetSize:(CGSize)a3
{
  self->__targetSize = a3;
}

- (int64_t)_currentCollectionViewType
{
  return self->__currentCollectionViewType;
}

- (void)_setCurrentCollectionViewType:(int64_t)a3
{
  self->__currentCollectionViewType = a3;
}

- (int64_t)_targetCollectionViewType
{
  return self->__targetCollectionViewType;
}

- (void)_setTargetCollectionViewType:(int64_t)a3
{
  self->__targetCollectionViewType = a3;
}

- (UICollectionView)_currentCollectionView
{
  return self->__currentCollectionView;
}

- (void)_setCurrentCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->__currentCollectionView, a3);
}

- (UICollectionView)_targetCollectionView
{
  return self->__targetCollectionView;
}

- (void)_setTargetCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->__targetCollectionView, a3);
}

- (UIEdgeInsets)_previousSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__previousSafeAreaInsets.top;
  left = self->__previousSafeAreaInsets.left;
  bottom = self->__previousSafeAreaInsets.bottom;
  right = self->__previousSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setPreviousSafeAreaInsets:(UIEdgeInsets)a3
{
  self->__previousSafeAreaInsets = a3;
}

- (int64_t)_loadedSectionInfosWindowSize
{
  return self->__loadedSectionInfosWindowSize;
}

- (void)_setLoadedSectionInfosWindowSize:(int64_t)a3
{
  self->__loadedSectionInfosWindowSize = a3;
}

- (BOOL)_areViewsInSyncWithModel
{
  return self->__viewsInSyncWithModel;
}

- (void)_setViewsInSyncWithModel:(BOOL)a3
{
  self->__viewsInSyncWithModel = a3;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (UIBarButtonItem)_invitationsBarButtonItem
{
  return self->__invitationsBarButtonItem;
}

- (void)_setInvitationsBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->__invitationsBarButtonItem, a3);
}

- (PUFeedViewController)_invitationsPopoverRootController
{
  return self->__invitationsPopoverRootController;
}

- (void)_setInvitationsPopoverRootController:(id)a3
{
  objc_storeStrong((id *)&self->__invitationsPopoverRootController, a3);
}

- (CGPoint)_lastPreheatedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__lastPreheatedContentOffset.x;
  y = self->__lastPreheatedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setLastPreheatedContentOffset:(CGPoint)a3
{
  self->__lastPreheatedContentOffset = a3;
}

- (NSIndexPath)_indexPathForImageHiddenDuringZoomTransition
{
  return self->__indexPathForImageHiddenDuringZoomTransition;
}

- (void)_setIndexPathForImageHiddenDuringZoomTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (PUPhotoPinchGestureRecognizer)_pinchGestureRecognizer
{
  return self->__pinchGestureRecognizer;
}

- (void)_setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, a3);
}

- (UICollectionView)_pinchedCollectionView
{
  return self->__pinchedCollectionView;
}

- (void)_setPinchedCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->__pinchedCollectionView, a3);
}

- (PLManagedAlbumList)_sharedAlbumList
{
  return self->__sharedAlbumList;
}

- (PLCloudSharedAlbum)_pushedAlbum
{
  return self->__pushedAlbum;
}

- (void)_setPushedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->__pushedAlbum, a3);
}

- (UIViewController)_pushedViewController
{
  return self->__pushedViewController;
}

- (void)_setPushedViewController:(id)a3
{
  objc_storeStrong((id *)&self->__pushedViewController, a3);
}

- (BOOL)_appJustEnteredForeground
{
  return self->__appJustEnteredForeground;
}

- (void)_setAppJustEnteredForeground:(BOOL)a3
{
  self->__appJustEnteredForeground = a3;
}

- (BOOL)_userDidDismissPlaceholder
{
  return self->__userDidDismissPlaceholder;
}

- (void)_setUserDidDismissPlaceholder:(BOOL)a3
{
  self->__userDidDismissPlaceholder = a3;
}

- (PLManagedAsset)_browsingSelectedAsset
{
  return self->__browsingSelectedAsset;
}

- (void)_setBrowsingSelectedAsset:(id)a3
{
  objc_storeStrong((id *)&self->__browsingSelectedAsset, a3);
}

- (PLCloudSharedComment)_browsingSelectedComment
{
  return self->__browsingSelectedComment;
}

- (void)_setBrowsingSelectedComment:(id)a3
{
  objc_storeStrong((id *)&self->__browsingSelectedComment, a3);
}

- (PXFeedAssetContainerList)_browsingAssetContainerList
{
  return self->__browsingAssetContainerList;
}

- (void)_setBrowsingAssetContainerList:(id)a3
{
  objc_storeStrong((id *)&self->__browsingAssetContainerList, a3);
}

- (NSDictionary)_justLikedSections
{
  return self->__justLikedSections;
}

- (void)_setJustLikedSections:(id)a3
{
  objc_storeStrong((id *)&self->__justLikedSections, a3);
}

- (BOOL)_isInterfaceBatchUpdateScheduled
{
  return self->__interfaceBatchUpdateScheduled;
}

- (void)_setInterfaceBatchUpdateScheduled:(BOOL)a3
{
  self->__interfaceBatchUpdateScheduled = a3;
}

- (NSMutableSet)_sectionInfosWithCommentChanges
{
  return self->__sectionInfosWithCommentChanges;
}

- (void)_setSectionInfosWithCommentChanges:(id)a3
{
  objc_storeStrong((id *)&self->__sectionInfosWithCommentChanges, a3);
}

- (NSMutableSet)_updatedAssets
{
  return self->__updatedAssets;
}

- (void)_setUpdatedAssets:(id)a3
{
  objc_storeStrong((id *)&self->__updatedAssets, a3);
}

- (BOOL)_isInvitationsPopoverShowPending
{
  return self->__invitationsPopoverShowPending;
}

- (void)_setInvitationsPopoverShowPending:(BOOL)a3
{
  self->__invitationsPopoverShowPending = a3;
}

- (BOOL)_isLibraryUpdatingPreviouslyExpired
{
  return self->__libraryUpdatingPreviouslyExpired;
}

- (void)_setLibraryUpdatingPreviouslyExpired:(BOOL)a3
{
  self->__libraryUpdatingPreviouslyExpired = a3;
}

- (BOOL)_hasCheckedLibraryUpdatingExpiration
{
  return self->__checkedLibraryUpdatingExpiration;
}

- (void)_setCheckedLibraryUpdatingExpiration:(BOOL)a3
{
  self->__checkedLibraryUpdatingExpiration = a3;
}

- (double)_preheatingWindowSize
{
  return self->__preheatingWindowSize;
}

- (void)_setPreheatingWindowSize:(double)a3
{
  self->__preheatingWindowSize = a3;
}

- (CGSize)_assetsAddedCachedSectionHeaderSize
{
  double width;
  double height;
  CGSize result;

  width = self->__assetsAddedCachedSectionHeaderSize.width;
  height = self->__assetsAddedCachedSectionHeaderSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setAssetsAddedCachedSectionHeaderSize:(CGSize)a3
{
  self->__assetsAddedCachedSectionHeaderSize = a3;
}

- (PUOneUpPresentationHelper)_oneUpPresentationHelper
{
  return self->__oneUpPresentationHelper;
}

- (void)_setOneUpPresentationHelper:(id)a3
{
  objc_storeStrong((id *)&self->__oneUpPresentationHelper, a3);
}

- (PUPhotoBrowserOneUpPresentationAdaptor)_photoBrowserOneUpPresentationAdaptor
{
  return self->__photoBrowserOneUpPresentationAdaptor;
}

- (void)_setPhotoBrowserOneUpPresentationAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->__photoBrowserOneUpPresentationAdaptor, a3);
}

- (PXFeedAssetContainerList)_oneUpPresentationAssetContainerList
{
  return self->__oneUpPresentationAssetContainerList;
}

- (void)_setOneUpPresentationAssetContainerList:(id)a3
{
  objc_storeStrong((id *)&self->__oneUpPresentationAssetContainerList, a3);
}

- (BOOL)_isOneUpDataSourceUpdateScheduled
{
  return self->__oneUpDataSourceUpdateScheduled;
}

- (void)_setOneUpDataSourceUpdateScheduled:(BOOL)a3
{
  self->__oneUpDataSourceUpdateScheduled = a3;
}

- (BOOL)_needsUpdateLayout
{
  return self->__needsUpdateLayout;
}

- (void)_setNeedsUpdateLayout:(BOOL)a3
{
  self->__needsUpdateLayout = a3;
}

- (BOOL)_hasAppeared
{
  return self->__hasAppeared;
}

- (void)_setHasAppeared:(BOOL)a3
{
  self->__hasAppeared = a3;
}

- (BOOL)observingPopoverContentSizeChange
{
  return self->_observingPopoverContentSizeChange;
}

- (void)setObservingPopoverContentSizeChange:(BOOL)a3
{
  self->_observingPopoverContentSizeChange = a3;
}

- (NSMutableSet)imageCellsPlayingVideo
{
  return self->_imageCellsPlayingVideo;
}

- (id)onNextViewLayout
{
  return self->_onNextViewLayout;
}

- (void)setOnNextViewLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNextViewLayout, 0);
  objc_storeStrong((id *)&self->_imageCellsPlayingVideo, 0);
  objc_storeStrong((id *)&self->__oneUpPresentationAssetContainerList, 0);
  objc_storeStrong((id *)&self->__photoBrowserOneUpPresentationAdaptor, 0);
  objc_storeStrong((id *)&self->__oneUpPresentationHelper, 0);
  objc_storeStrong((id *)&self->__updatedAssets, 0);
  objc_storeStrong((id *)&self->__sectionInfosWithCommentChanges, 0);
  objc_storeStrong((id *)&self->__justLikedSections, 0);
  objc_storeStrong((id *)&self->__browsingAssetContainerList, 0);
  objc_storeStrong((id *)&self->__browsingSelectedComment, 0);
  objc_storeStrong((id *)&self->__browsingSelectedAsset, 0);
  objc_storeStrong((id *)&self->__pushedViewController, 0);
  objc_storeStrong((id *)&self->__pushedAlbum, 0);
  objc_storeStrong((id *)&self->__sharedAlbumList, 0);
  objc_storeStrong((id *)&self->__pinchedCollectionView, 0);
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__indexPathForImageHiddenDuringZoomTransition, 0);
  objc_storeStrong((id *)&self->__invitationsPopoverRootController, 0);
  objc_storeStrong((id *)&self->__invitationsBarButtonItem, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__targetCollectionView, 0);
  objc_storeStrong((id *)&self->__currentCollectionView, 0);
  objc_storeStrong((id *)&self->__rotationLastRestorableState, 0);
  objc_storeStrong((id *)&self->__collectionViewSpeedometer, 0);
  objc_storeStrong((id *)&self->__dateFormatter, 0);
  objc_storeStrong((id *)&self->__lastPreheatIndexPathInfoList, 0);
  objc_storeStrong((id *)&self->__lastPreheatIndexPathList, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->__feedSectionInfosManager, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __40__PUFeedViewController__createNewStream__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openiCloudSettings");
}

uint64_t __91__PUFeedViewController__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __91__PUFeedViewController__showOutOfNetworkInvitationMessageForSharedAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openiCloudSettings");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__PUFeedViewController__navigateToRevealPhoto_inAlbum_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 1)
  {
    PLGridZeroGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v7;
      v10 = 2048;
      v11 = a2;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to initial asset (%@) from feed with result %lu. Error: %@", (uint8_t *)&v8, 0x20u);

    }
  }

}

uint64_t __83__PUFeedViewController__restoreScrollPositionInCollectionView_fromRestorableState___block_invoke(uint64_t a1, void *a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double MidX;
  double MidY;
  uint64_t result;
  double rect_8;
  double rect_8a;
  double rect_16;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(a2, "frame");
  objc_msgSend(v12, "pu_displayFrameForRect:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  rect_8 = v21;
  rect_16 = v22;
  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.width = v18;
  v31.size.height = v20;
  MidX = CGRectGetMidX(v31);
  v32.origin.x = a4;
  v32.origin.y = a5;
  v32.size.width = a6;
  v32.size.height = a7;
  rect_8a = rect_8 + MidX - CGRectGetMidX(v32);
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  MidY = CGRectGetMidY(v33);
  v34.origin.x = a4;
  v34.origin.y = a5;
  v34.size.width = a6;
  v34.size.height = a7;
  result = objc_msgSend(*(id *)(a1 + 32), "px_scrollToContentOffset:animated:", 0, rect_8a, rect_16 + MidY - CGRectGetMidY(v34));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __83__PUFeedViewController__restoreScrollPositionInCollectionView_fromRestorableState___block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGRect v7;

  objc_msgSend(a2, "frame");
  v7.origin.x = v3;
  v7.origin.y = v4;
  v7.size.width = v5;
  v7.size.height = v6;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v7);
}

void __92__PUFeedViewController__enumerateCenterAssetsInRestorableState_inCollectionView_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  id v12;
  CGRect v13;

  v5 = (void *)MEMORY[0x1E0D719A8];
  v6 = a2;
  objc_msgSend(v5, "systemPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetWithUUID:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_indexPathForItemWithAsset:inCollectionView:", v12, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "layoutAttributesForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isHidden") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = CGRectFromString(v11);
      (*(void (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 64) + 16))((__n128)v13.origin, *(__n128 *)&v13.origin.y, (__n128)v13.size, *(__n128 *)&v13.size.height);

    }
  }
  else
  {
    v10 = 0;
  }

}

BOOL __47__PUFeedViewController__currentRestorableState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "representedElementCategory"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_assetForItemAtIndexPath:inCollectionView:", v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

  }
  return v4;
}

uint64_t __47__PUFeedViewController__currentRestorableState__block_invoke_2()
{
  return 1;
}

void __73__PUFeedViewController__defaultMaximumScrollRegimeForQualityImageFormats__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "masterThumbnailFormat");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;
  PLPhysicalScreenScale();
  *(double *)&_defaultMaximumScrollRegimeForQualityImageFormats_largestJPEGThumbnailDimension = v2 / v3;

}

void __53__PUFeedViewController_feedInvitationCell_didAccept___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_navigateToRevealPhoto:inAlbum:animated:", 0, v2, 1);

}

uint64_t __51__PUFeedViewController_didTapButtonInFeedTextCell___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setJustLikedSections:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setUserCloudSharedLiked:forItemsInSections:inCollectionView:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __57__PUFeedViewController__beginPlayingVideoInCellIfNeeded___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleVideoRequestID:forCellAtIndexPath:withTag:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __57__PUFeedViewController__beginPlayingVideoInCellIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleVideoRequestResult:forCellAtIndexPath:withTag:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __62__PUFeedViewController_navigateToCloudFeedComment_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupBrowsingFromAsset:orComment:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_navigateToOneUpBrowserAnimated:", 0);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pushedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

uint64_t __68__PUFeedViewController_navigateToRevealCloudFeedComment_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __68__PUFeedViewController_navigateToRevealCloudFeedComment_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __60__PUFeedViewController_navigateToCloudFeedAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setupBrowsingFromAsset:orComment:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "_navigateToOneUpBrowserAnimated:", 0);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pushedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

uint64_t __66__PUFeedViewController_navigateToRevealCloudFeedAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __67__PUFeedViewController_zoomTransition_setVisibility_forPhotoToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerHidden:", *(_BYTE *)(a1 + 40) == 0);
}

double __113__PUFeedViewController_zoomTransition_getFrame_inCoordinateSpace_contentMode_cropInsets_forPhotoToken_operation___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "assetForItemAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageSize");
  v3 = v2;

  return v3;
}

uint64_t __52__PUFeedViewController_assetContainerListDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEC31040))
    v3 = objc_msgSend(v2, "prepareForDismissingForced:", 1);
  else
    v3 = 1;

  return v3;
}

void __55__PUFeedViewController__performInterfaceBatchUpdateNow__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(a1[4], "_assetForItemAtIndexPath:inCollectionView:", v11, a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(a1[6], "containsObject:", v7))
      goto LABEL_11;
    +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "vitalityEnabled"))
    {
      v9 = objc_msgSend(v7, "canPlayPhotoIris");

      if ((v9 & 1) != 0)
      {
        objc_msgSend(a1[5], "cellForItemAtIndexPath:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "_configurePlayerCell:forAssetAtIndexPath:inCollectionView:", v10, v11, a1[5]);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(a1[5], "cellForItemAtIndexPath:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_configureImageCell:forAssetAtIndexPath:inCollectionView:", v10, v11, a1[5]);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PUFeedCollectionElementKindThumbnail")))
  {
    objc_msgSend(a1[5], "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUFeedCollectionElementKindThumbnail"), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_configureBadgedThumbnailCell:forThumbnailsAtIndexPath:inCollectionView:", v7, v11, a1[5]);
LABEL_11:

  }
}

void __96__PUFeedViewController__scheduleInterfaceUpdateForSectionInfosWithCommentChanges_updatedAssets___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performInterfaceBatchUpdateNow");

}

void __80__PUFeedViewController_collectionView_layout_headerSizeForGroupID_proposedSize___block_invoke()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_headerSizeForGroupID_proposedSize__measuringTextCell;
  collectionView_layout_headerSizeForGroupID_proposedSize__measuringTextCell = v1;

}

void __82__PUFeedViewController_collectionView_layout_sizeForFooterInSection_proposedSize___block_invoke()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForFooterInSection_proposedSize__measuringTextCell;
  collectionView_layout_sizeForFooterInSection_proposedSize__measuringTextCell = v1;

}

void __83__PUFeedViewController_collectionView_layout_sizeForHeaderOfSections_proposedSize___block_invoke()
{
  PUFeedTitleCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTitleCell alloc];
  v1 = -[PUFeedTitleCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell;
  collectionView_layout_sizeForHeaderOfSections_proposedSize__measuringTitleCell = v1;

}

void __81__PUFeedViewController_collectionView_layout_sizeForRowAtIndexPath_proposedSize___block_invoke_4()
{
  PUFeedInvitationCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedInvitationCell alloc];
  v1 = -[PUFeedInvitationCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringInvitationCell;
  collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringInvitationCell = v1;

}

void __81__PUFeedViewController_collectionView_layout_sizeForRowAtIndexPath_proposedSize___block_invoke_3()
{
  PUFeedTitleCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTitleCell alloc];
  v1 = -[PUFeedTitleCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringTitleCell;
  collectionView_layout_sizeForRowAtIndexPath_proposedSize__measuringTitleCell = v1;

}

void __81__PUFeedViewController_collectionView_layout_sizeForRowAtIndexPath_proposedSize___block_invoke_2()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__likeMeasuringTextCell;
  collectionView_layout_sizeForRowAtIndexPath_proposedSize__likeMeasuringTextCell = v1;

}

void __81__PUFeedViewController_collectionView_layout_sizeForRowAtIndexPath_proposedSize___block_invoke()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_sizeForRowAtIndexPath_proposedSize__commentMeasuringTextCell;
  collectionView_layout_sizeForRowAtIndexPath_proposedSize__commentMeasuringTextCell = v1;

}

void __102__PUFeedViewController_collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize___block_invoke()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__measuringTextCell;
  collectionView_layout_commentSizeForTileAtIndexPath_commentIndex_proposedSize__measuringTextCell = v1;

}

void __87__PUFeedViewController_collectionView_layout_likesSizeForTileAtIndexPath_proposedSize___block_invoke()
{
  PUFeedTextCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedTextCell alloc];
  v1 = -[PUFeedTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__measuringTextCell;
  collectionView_layout_likesSizeForTileAtIndexPath_proposedSize__measuringTextCell = v1;

}

void __89__PUFeedViewController_collectionView_layout_captionSizeForTileAtIndexPath_proposedSize___block_invoke()
{
  PUFeedCaptionCell *v0;
  uint64_t v1;
  void *v2;

  v0 = [PUFeedCaptionCell alloc];
  v1 = -[PUFeedCaptionCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__measuringCaptionCell;
  collectionView_layout_captionSizeForTileAtIndexPath_proposedSize__measuringCaptionCell = v1;

}

uint64_t __62__PUFeedViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContainingCollectionView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_configurePlayerCell:forAssetAtIndexPath:inCollectionView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __50__PUFeedViewController__placeholderConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createNewStream");

}

void __50__PUFeedViewController__placeholderConfiguration___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowInvitationsInPopover");

  v5 = objc_loadWeakRetained(v1);
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "_showInvitationsPopoverAnimated:", 1);
  }
  else
  {
    objc_msgSend(v5, "_setUserDidDismissPlaceholder:", 1);

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "_updateEmptyPlaceholder");
  }

}

id __46__PUFeedViewController__updateCollectionViews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  PUFeedCollectionViewLayout *v8;
  PUFeedCollectionViewLayout *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(*(id *)(a1 + 32), "_targetSize");
  v5 = v4;
  v7 = v6;
  v8 = objc_alloc_init(PUFeedCollectionViewLayout);
  v9 = v8;
  if (*(_BYTE *)(a1 + 48))
    v10 = 3;
  else
    v10 = 0;
  -[PUFeedCollectionViewLayout setFlowDirection:](v8, "setFlowDirection:", v10);
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "configureFeedCollectionViewLayout:forCollectionViewType:collectionViewSize:collectionViewContentInset:", v9, 0, &v13, v5, v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v9, v2, v3, v5, v7);
  objc_msgSend(v11, "setContentInset:", v13, v14);
  objc_msgSend(v11, "setAutoresizingMask:", 0);
  objc_msgSend(v11, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v11, "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(v11, "_setContentInsetAdjustmentBehavior:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureCollectionView:isVertical:", v11, 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateParallaxForCollectionView:", v11);

  return v11;
}

id __46__PUFeedViewController__updateCollectionViews__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  PUFeedCollectionViewLayout *v8;
  PUFeedCollectionViewLayout *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(*(id *)(a1 + 32), "_targetSize");
  v5 = v4;
  v7 = v6;
  v8 = objc_alloc_init(PUFeedCollectionViewLayout);
  v9 = v8;
  if (*(_BYTE *)(a1 + 48))
    v10 = 2;
  else
    v10 = 1;
  -[PUFeedCollectionViewLayout setFlowDirection:](v8, "setFlowDirection:", v10);
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "configureFeedCollectionViewLayout:forCollectionViewType:collectionViewSize:collectionViewContentInset:", v9, 1, &v13, v5, v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v9, v2, v3, v5, v7);
  objc_msgSend(v11, "setContentInset:", v13, v14);
  objc_msgSend(v11, "setAutoresizingMask:", 0);
  objc_msgSend(v11, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v11, "setAlwaysBounceHorizontal:", 1);
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v11, "_setContentInsetAdjustmentBehavior:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_configureCollectionView:isVertical:", v11, 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateParallaxForCollectionView:", v11);

  return v11;
}

uint64_t __65__PUFeedViewController__updateOneUpBrowsingCurrentAssetReference__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__PUFeedViewController__navigateToOneUpBrowserWithOptions_animated_pinchGestureRecognizer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", 0);
}

uint64_t __91__PUFeedViewController__navigateToOneUpBrowserWithOptions_animated_pinchGestureRecognizer___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 4, CFSTR("Navigated to 1-Up from PUFeedViewController"));
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
}

void __64__PUFeedViewController__sectionInfosForBrowsingFromSectionInfo___block_invoke(id *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1[4], "sectionInfoAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfItems") >= 1 && (v3 == a1[5] || !objc_msgSend(v3, "typeForItemAtIndex:", 0)))
  {
    objc_msgSend(v3, "setExcludedAssetIndexes:", 0);
    objc_msgSend(a1[6], "addObject:", v3);
  }

}

void __54__PUFeedViewController__scheduleOneUpDataSourceUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performOneUpDataSourceUpdateNow");

}

void __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "prepareForPhotoLibraryChange:", v3);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke_2;
  v6[3] = &unk_1E58ABCA8;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "photoLibraryDidChange:", a2);
}

uint64_t __57__PUFeedViewController__updateBrowsingAssetContainerList__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "photoLibraryDidChangeOnMainQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__PUFeedViewController__libraryUpdatingDidExpire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEmptyPlaceholder");
}

void __56__PUFeedViewController__isLibraryUpdatingTimeoutExpired__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_time_t v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_libraryUpdatingTimeoutStartDate;
  _libraryUpdatingTimeoutStartDate = v0;

  v2 = dispatch_time(0, 120000000000);
  dispatch_after(v2, MEMORY[0x1E0C80D38], &__block_literal_global_357);
}

void __56__PUFeedViewController__isLibraryUpdatingTimeoutExpired__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PUFeedLibraryUpdatingDidExpireNotification"), 0);

}

void __54__PUFeedViewController__preheatSectionInfosAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionInfoAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "isFault") && objc_msgSend(v10, "faultingState") == 1)
          {
            objc_msgSend(v10, "objectID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "cloudFeedCommentsEntry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 48);
      objc_msgSend(v12, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
  }

}

void __85__PUFeedViewController__setUserCloudSharedLiked_forItemsInSections_inCollectionView___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSection:collectionView:", a2, *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "numberOfItems") >= 1)
  {
    v3 = 0;
    do
    {
      v4 = objc_msgSend(v7, "typeForItemAtIndex:", v3);
      v5 = v7;
      if (!v4)
      {
        objc_msgSend(v7, "assetForItemAtIndex:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

        v5 = v7;
      }
      ++v3;
    }
    while (v3 < objc_msgSend(v5, "numberOfItems"));
  }

}

void __85__PUFeedViewController__setUserCloudSharedLiked_forItemsInSections_inCollectionView___block_invoke_2(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setUserCloudSharedLiked:", *(unsigned __int8 *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __96__PUFeedViewController__configureBadgedThumbnailCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CD15A8];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setAllowPlaceholder:", 1);
  if (!*(_WORD *)(a1 + 72))
    objc_msgSend(v7, "setDeliveryMode:", 1);
  objc_msgSend(v7, "setResizeMode:", 1);
  objc_msgSend(v7, "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "contentMode");
  objc_msgSend(v8, "sizeWithFallBackSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc(MEMORY[0x1E0CD1428]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPLManagedObject:photoLibrary:", v6, v15);

  v17 = *MEMORY[0x1E0CD19C0];
  v27[0] = *MEMORY[0x1E0CD1960];
  v27[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "newObjectWithPropertySets:", v18);

  objc_msgSend(*(id *)(a1 + 32), "_cachingImageManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__PUFeedViewController__configureBadgedThumbnailCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke_2;
  v23[3] = &unk_1E589EFE8;
  v21 = *(id *)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 64);
  v24 = v21;
  v25 = v22;
  v26 = a3;
  objc_msgSend(v20, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v19, v9, v7, v23, v11, v13);

}

void __96__PUFeedViewController__configureBadgedThumbnailCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v3, *(_QWORD *)(a1 + 48));

}

void __86__PUFeedViewController__configureStackCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  _BOOL8 v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  if (objc_msgSend(*(id *)(a1 + 32), "item") == a3)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "section");
    v9 = v8 == objc_msgSend(*(id *)(a1 + 40), "section");
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "setImageSize:forItemAtIndex:", a3, v6, v7);
  objc_msgSend(*(id *)(a1 + 48), "setImageHidden:forItemAtIndex:", v9, a3);
  v10 = (objc_class *)MEMORY[0x1E0CD15A8];
  v11 = v5;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "setAllowPlaceholder:", 1);
  if (!*(_WORD *)(a1 + 104))
    objc_msgSend(v12, "setDeliveryMode:", 1);
  objc_msgSend(v12, "setResizeMode:", 1);
  objc_msgSend(v12, "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "contentMode");
  objc_msgSend(v13, "sizeWithFallBackSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  v16 = v15;
  v18 = v17;
  v19 = objc_alloc(MEMORY[0x1E0CD1428]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithPLManagedObject:photoLibrary:", v11, v20);

  v22 = *MEMORY[0x1E0CD19C0];
  v32[0] = *MEMORY[0x1E0CD1960];
  v32[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "newObjectWithPropertySets:", v23);

  objc_msgSend(*(id *)(a1 + 56), "_cachingImageManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__PUFeedViewController__configureStackCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke_2;
  v28[3] = &unk_1E589EFE8;
  v26 = *(id *)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 96);
  v29 = v26;
  v30 = v27;
  v31 = a3;
  objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v24, v14, v12, v28, v16, v18);

}

void __86__PUFeedViewController__configureStackCell_forThumbnailsAtIndexPath_inCollectionView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v3, *(_QWORD *)(a1 + 48));

}

void __85__PUFeedViewController__configureImageCell_forThumbnailAtIndexPath_inCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v3);

}

void __81__PUFeedViewController__configureImageCell_forAssetAtIndexPath_inCollectionView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (v3 == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:withTag:", v4, v3);

}

uint64_t __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerHidden:", *(unsigned __int8 *)(a1 + 40));
}

void __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_3;
    v7[3] = &unk_1E58AA878;
    v8 = v6;
    v9 = v5;
    v10 = a3;
    objc_msgSend(v8, "performIrisPlayerChanges:", v7);

  }
}

uint64_t __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setCurrentImageRequestID:", a2);
  return result;
}

void __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_5(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  double v10;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_6;
    v7[3] = &unk_1E58A9DF0;
    v8 = v6;
    v10 = a3;
    v9 = v5;
    objc_msgSend(v8, "performIrisPlayerChanges:", v7);

  }
}

uint64_t __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPhotoTime:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setVideoAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __82__PUFeedViewController__configurePlayerCell_forAssetAtIndexPath_inCollectionView___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPhotoImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPhotoImageDegraded:", *(unsigned __int8 *)(a1 + 48));
}

void __66__PUFeedViewController__requestImageForAsset_tileSize_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD1C48]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id, uint64_t))(v10 + 16))(v10, v5, v9);
  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "%@ Image request failed with error=%@", (uint8_t *)&v14, 0x16u);

    }
  }

}

void __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  int v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pl_PHAssetFromPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v5, "setVideoComplementAllowed:", 1);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_2;
  v14[3] = &unk_1E589EED0;
  v7 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  LODWORD(v7) = objc_msgSend(v7, "requestPlayerItemForVideo:options:resultHandler:", v4, v5, v14);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_240;
  block[3] = &unk_1E589EEF8;
  v12 = *(id *)(a1 + 64);
  v13 = (int)v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_3;
  block[3] = &unk_1E58A8C48;
  v13 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

void __74__PUFeedViewController__requestPlayerItemForAsset_preparation_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __n128 v4;
  NSObject *v5;
  CMTimeValue v6;
  CMTimeValue v7;
  void *v8;
  uint64_t v9;
  CMTime v10;
  CMTime buf;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    memset(&buf, 0, sizeof(buf));
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v3, "photoIrisStillDisplayTime");
      if ((buf.flags & 0x1D) == 1)
      {
        v10 = buf;
        v4.n128_f64[0] = CMTimeGetSeconds(&v10);
        goto LABEL_10;
      }
    }
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 48);
      LODWORD(v10.value) = 138412290;
      *(CMTimeValue *)((char *)&v10.value + 4) = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to load Iris Timing Information", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.value + 4) = v7;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v8;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to load Iris Video: %@", (uint8_t *)&buf, 0x16u);

    }
  }

  v4.n128_u64[0] = 0;
LABEL_10:
  v9 = *(_QWORD *)(a1 + 64);
  if (v9)
    (*(void (**)(uint64_t, void *, __n128))(v9 + 16))(v9, v2, v4);

}

uint64_t __51__PUFeedViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  uint64_t v16;

  v2 = a2;
  if (objc_msgSend(v2, "flowDirection"))
    objc_msgSend(v2, "flowDirection");
  PXEdgeInsetsForEdges();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  PXEdgeInsetsForEdges();
  v14 = v6 != v13;
  if (v4 != v15)
    v14 = 1;
  if (v10 != v12)
    v14 = 1;
  v16 = v8 != v11 || v14;

  return v16;
}

uint64_t __49__PUFeedViewController__performOnNextViewLayout___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35__PUFeedViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2;

  +[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyObserver:", *(_QWORD *)(a1 + 32));

}

uint64_t __75__PUFeedViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sizeTransitionState");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setSizeTransitionState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_updateCollectionViews");
    objc_msgSend(*(id *)(a1 + 32), "_updateEmptyPlaceholder");
    objc_msgSend(*(id *)(a1 + 32), "_updateNavigationItemAnimated:", 1);
    return objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 2, 0x3FD3333333333333);
  }
  return result;
}

uint64_t __75__PUFeedViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sizeTransitionState");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentCollectionViewType:", objc_msgSend(*(id *)(a1 + 32), "_targetCollectionViewType"));
    objc_msgSend(*(id *)(a1 + 32), "_setSizeTransitionState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateCollectionViews");
    objc_msgSend(*(id *)(a1 + 32), "_updatePeripheralInterfaceAnimated:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_userDidViewFeed");
  }
  return result;
}

uint64_t __49__PUFeedViewController_initWithSpec_contentType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEntryFilter:", *(_QWORD *)(a1 + 32));
}

+ (void)initialize
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__PUFeedViewController_initialize__block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a2;
  v2[5] = a1;
  if (initialize_onceToken_28682 != -1)
    dispatch_once(&initialize_onceToken_28682, v2);
}

void __34__PUFeedViewController_initialize__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  PUFeedStackViewMaximumNumberOfVisibleItems = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", 0);
  if (PUFeedStackViewMaximumNumberOfVisibleItems != +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PUFeedViewController.m"), 328, CFSTR("unexpected number of visible items"));

  }
}

@end
