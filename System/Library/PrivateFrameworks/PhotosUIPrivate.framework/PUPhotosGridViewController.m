@implementation PUPhotosGridViewController

- (PUPhotosGridViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  id v8;
  id v9;
  id v10;
  PUPhotosGridViewController *v11;
  PUPhotosGridBarsHelper *v12;
  PUPhotosGridBarsHelper *barsHelper;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PHCachingImageManager *cachingImageManager;
  PXAssetBadgeManager *v21;
  PXAssetBadgeManager *badgeManager;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spec"));

LABEL_3:
  objc_storeStrong((id *)&self->_photoLibrary, a4);
  objc_storeStrong((id *)&self->_gridSpec, a3);
  v10 = -[PUPhotosGridViewController newGridLayout](self, "newGridLayout");
  v26.receiver = self;
  v26.super_class = (Class)PUPhotosGridViewController;
  v11 = -[PUPhotosGridViewController initWithCollectionViewLayout:](&v26, sel_initWithCollectionViewLayout_, v10);
  if (v11)
  {
    v12 = objc_alloc_init(PUPhotosGridBarsHelper);
    barsHelper = v11->__barsHelper;
    v11->__barsHelper = v12;

    -[PUPhotosGridBarsHelper setDelegate:](v11->__barsHelper, "setDelegate:", v11);
    -[PUPhotosGridViewController navigationItem](v11, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_setPreferredLargeTitleDisplayMode:", 2);

    -[PUPhotosGridViewController setMainGridLayout:](v11, "setMainGridLayout:", v10);
    -[PUPhotosGridViewController setAllowedActions:](v11, "setAllowedActions:", 127);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0DC5040];
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v11, sel__menuControllerDidHideMenu_, v16, v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    v19 = objc_opt_new();
    cachingImageManager = v11->__cachingImageManager;
    v11->__cachingImageManager = (PHCachingImageManager *)v19;

    v21 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E0D7B1D8]);
    badgeManager = v11->__badgeManager;
    v11->__badgeManager = v21;

  }
  return v11;
}

- (PUPhotosGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 413, CFSTR("Do not use this initializer, use the designated one instead"));

  return 0;
}

- (PUPhotosGridViewController)initWithCollectionViewLayout:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 418, CFSTR("Do not use this initializer, use the designated one instead"));

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[PXPhotosDataSource unregisterChangeObserver:](self->_photosDataSource, "unregisterChangeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D71CF8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  -[PUSessionInfo removeSessionInfoObserver:](self->_sessionInfo, "removeSessionInfoObserver:", self);
  -[PUPhotosGridViewController _shareAssetsPopoverController](self, "_shareAssetsPopoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
  -[PUPhotoPinchGestureRecognizer setDelegate:](self->_photoOrStackPinchGestureRecognizer, "setDelegate:", 0);
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController dealloc](&v7, sel_dealloc);
}

- (PUPhotosGridViewControllerSpec)gridSpec
{
  PUPhotosGridViewControllerSpec *gridSpec;
  void *v6;

  gridSpec = self->_gridSpec;
  if (!gridSpec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 439, CFSTR("missing spec"));

    gridSpec = self->_gridSpec;
  }
  return gridSpec;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _BOOL4 v8;
  __int128 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  uint64_t v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  char v33;
  _QWORD v34[5];
  BOOL v35;
  _QWORD v36[5];
  CGAffineTransform t1;
  CGAffineTransform t2;
  objc_super v39;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v39, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = -[PUPhotosGridViewController isCurrentCollectionViewDataSource](self, "isCurrentCollectionViewDataSource");
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&t2, 0, sizeof(t2));
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&t1.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v10 = CGAffineTransformEqualToTransform(&t1, &t2);
  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "prepareForViewTransitionToSize:", width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v7, "isAnimated")
    && (-[PUPhotosGridViewController px_isVisible](self, "px_isVisible") & 1) != 0)
  {
    -[PUPhotosGridViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", 0);
    v14 = 0;
    goto LABEL_20;
  }
  -[PUPhotosGridViewController _cachedViewSizeTransitionContextSize](self, "_cachedViewSizeTransitionContextSize");
  if (width == v16 && height == v15)
  {
    -[PUPhotosGridViewController _cachedViewSizeTransitionContext](self, "_cachedViewSizeTransitionContext");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = 1;
    v13 = (void *)v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isSuspended");

    if (v20)
    {
      -[PUPhotosGridViewController _cachedViewSizeTransitionContext](self, "_cachedViewSizeTransitionContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        -[PUPhotosGridViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bounds");
        v24 = v23;
        v26 = v25;

        -[PUPhotosGridViewController _setCachedViewSizeTransitionContext:](self, "_setCachedViewSizeTransitionContext:", v13);
        -[PUPhotosGridViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v24, v26);
      }
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
  }
  -[PUPhotosGridViewController _pendingViewSizeTransitionContext](self, "_pendingViewSizeTransitionContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v14 = 1;
    if (!v18)
      goto LABEL_21;
    goto LABEL_20;
  }
  -[PUPhotosGridViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", v13);
  v14 = 1;
  if ((v18 & 1) != 0)
LABEL_20:
    -[PUPhotosGridViewController _invalidateCachedViewSizeTransitionContext](self, "_invalidateCachedViewSizeTransitionContext");
LABEL_21:
  v28 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v36[3] = &unk_1E58A7A08;
    v36[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v36);
  }
  v34[0] = v28;
  v34[1] = 3221225472;
  v34[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v34[3] = &unk_1E58A6000;
  v34[4] = self;
  v35 = v8;
  v30[0] = v28;
  v30[1] = 3221225472;
  v30[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v30[3] = &unk_1E58A6028;
  v32 = v8;
  v33 = v14;
  v30[4] = self;
  v31 = v12;
  v29 = v12;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v34, v30);

}

- (void)_invalidateCachedViewSizeTransitionContext
{
  -[PUPhotosGridViewController _setCachedViewSizeTransitionContext:](self, "_setCachedViewSizeTransitionContext:", 0);
  -[PUPhotosGridViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (double)_adjustedTransitionWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9 - v5 - v7;

  return v10;
}

- (BOOL)_transitionWidthHasChanged
{
  double v3;
  double lastTransitionWidth;
  BOOL v5;

  -[PUPhotosGridViewController _adjustedTransitionWidth](self, "_adjustedTransitionWidth");
  lastTransitionWidth = self->_lastTransitionWidth;
  v5 = v3 != lastTransitionWidth;
  if (lastTransitionWidth <= 0.0)
    v5 = 0;
  return v3 > 0.0 && v5;
}

- (BOOL)_updateTransitionWidthOnAppearance
{
  _BOOL4 v3;
  double v4;

  v3 = -[PUPhotosGridViewController _transitionWidthHasChanged](self, "_transitionWidthHasChanged");
  if (v3)
  {
    -[PUPhotosGridViewController _adjustedTransitionWidth](self, "_adjustedTransitionWidth");
    self->_lastTransitionWidth = v4;
  }
  return v3;
}

- (BOOL)updateSpec
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  PUPhotosGridViewControllerSpec *v6;
  PUPhotosGridViewControllerSpec *gridSpec;
  BOOL v8;

  -[PUPhotosGridViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "horizontalSizeClass") || !objc_msgSend(v3, "verticalSizeClass"))
    goto LABEL_14;
  +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v3);
  v4 = (objc_class *)objc_opt_class();
  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class())
  {
    v4 = (objc_class *)objc_opt_class();
  }
  if (v4 != (objc_class *)v5)
  {
    v6 = (PUPhotosGridViewControllerSpec *)objc_alloc_init(v4);
    gridSpec = self->_gridSpec;
    self->_gridSpec = v6;

    v8 = 1;
  }
  else
  {
LABEL_14:
    v8 = 0;
  }

  return v8;
}

- (id)newGridLayout
{
  PUSectionedGridLayout *v3;
  void *v4;
  uint64_t v5;

  v3 = objc_alloc_init(PUSectionedGridLayout);
  -[PUSectionedGridLayout setDelegate:](v3, "setDelegate:", self);
  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useFloatingHeaders");

  -[PUSectionedGridLayout setFloatingSectionHeadersEnabled:](v3, "setFloatingSectionHeadersEnabled:", v5);
  return v3;
}

- (void)setSessionInfo:(id)a3
{
  PUSessionInfo *v5;
  PUSessionInfo **p_sessionInfo;
  PUSessionInfo *sessionInfo;
  void (**v8)(void);
  void *v9;
  void *v10;
  PUSessionInfo *v11;

  v5 = (PUSessionInfo *)a3;
  p_sessionInfo = &self->_sessionInfo;
  sessionInfo = self->_sessionInfo;
  if (sessionInfo != v5)
  {
    v11 = v5;
    -[PUSessionInfo removeSessionInfoObserver:](sessionInfo, "removeSessionInfoObserver:", self);
    objc_storeStrong((id *)&self->_sessionInfo, a3);
    -[PUSessionInfo addSessionInfoObserver:](*p_sessionInfo, "addSessionInfoObserver:", self);
    -[PUSessionInfo bannerGenerator](*p_sessionInfo, "bannerGenerator");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_setBanner:", v9);

    -[PUPhotosGridViewController _updatePhotoSelectionManager](self, "_updatePhotoSelectionManager");
    -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 0);

    v5 = v11;
  }

}

- (void)setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *photosDataSource;
  void *v7;
  PXPhotosDataSource *v8;

  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v5)
  {
    v8 = v5;
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PUPhotosGridViewController _setDidForceDataSource:](self, "_setDidForceDataSource:", 0);
    if (-[PUPhotosGridViewController px_isVisible](self, "px_isVisible"))
      -[PUPhotosGridViewController forceDataSourceIfNeeded](self, "forceDataSourceIfNeeded");
    -[PXPhotosDataSource registerChangeObserver:](v8, "registerChangeObserver:", self);
    -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhotosDataSource:", v8);

    -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 1);
    v5 = v8;
  }

}

- (void)forceDataSourceIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  PXPhotosDataSource *v8;

  if (!-[PUPhotosGridViewController _didForceDataSource](self, "_didForceDataSource") && !self->_pendingNavigationBlock)
  {
    -[PUPhotosGridViewController _setDidForceDataSource:](self, "_setDidForceDataSource:", 1);
    v8 = self->_photosDataSource;
    if ((-[PXPhotosDataSource options](v8, "options") & 1) != 0)
    {
      if (-[PUPhotosGridViewController initiallyScrolledToBottom](self, "initiallyScrolledToBottom"))
        v3 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v3 = 0;
      -[PXPhotosDataSource setBackgroundFetchOriginSection:](v8, "setBackgroundFetchOriginSection:", v3);
      v4 = -[PXPhotosDataSource numberOfSections](v8, "numberOfSections") - 1;
      if (v3 < v4)
        v4 = v3;
      v5 = v4 & ~(v4 >> 63);
      -[PUPhotosGridViewController gridSpec](self, "gridSpec");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "forceLoadInitialSectionCount");

      -[PXPhotosDataSource forceAccurateSection:andSectionsBeforeAndAfter:](v8, "forceAccurateSection:andSectionsBeforeAndAfter:", v5, v7);
      -[PXPhotosDataSource startBackgroundFetchIfNeeded](v8, "startBackgroundFetchIfNeeded");
    }

  }
}

- (PHFetchResult)collectionListFetchResult
{
  return -[PXPhotosDataSource collectionListFetchResult](self->_photosDataSource, "collectionListFetchResult");
}

- (id)photoCollectionAtIndex:(unint64_t)a3
{
  return -[PXPhotosDataSource assetCollectionForSection:](self->_photosDataSource, "assetCollectionForSection:", a3);
}

- (unint64_t)_indexForPhotoCollection:(id)a3
{
  return -[PXPhotosDataSource sectionForAssetCollection:](self->_photosDataSource, "sectionForAssetCollection:", a3);
}

- (id)assetCollectionForSectionHeaderAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!self->_collectionListFetchResultBeforeChange)
    goto LABEL_3;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v6 != v8)
  {
    -[PHFetchResult objectAtIndexedSubscript:](self->_collectionListFetchResultBeforeChange, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_3:
    -[PXPhotosDataSource assetCollectionForSection:](self->_photosDataSource, "assetCollectionForSection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)_updateLayoutReferenceValues
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *p_collectionViewLayoutReferenceWidth;
  CGRect v18;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v18);

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v9 != self->_collectionViewLayoutReferenceSafeAreaInsets.left
    || v7 != self->_collectionViewLayoutReferenceSafeAreaInsets.top
    || v13 != self->_collectionViewLayoutReferenceSafeAreaInsets.right)
  {
    p_collectionViewLayoutReferenceWidth = &self->_collectionViewLayoutReferenceWidth;
LABEL_13:
    *p_collectionViewLayoutReferenceWidth = Width;
    self->_collectionViewLayoutReferenceSafeAreaInsets.top = v7;
    self->_collectionViewLayoutReferenceSafeAreaInsets.left = v9;
    self->_collectionViewLayoutReferenceSafeAreaInsets.bottom = v11;
    self->_collectionViewLayoutReferenceSafeAreaInsets.right = v13;
    -[PUPhotosGridViewController updateLayoutMetrics](self, "updateLayoutMetrics");
    -[PUPhotosGridViewController updateGlobalFooter](self, "updateGlobalFooter");
    -[PUPhotosGridViewController updateVisibleSupplementaryViewsOfKind:](self, "updateVisibleSupplementaryViewsOfKind:", CFSTR("PUFullMomentsHeader"));
    return;
  }
  p_collectionViewLayoutReferenceWidth = &self->_collectionViewLayoutReferenceWidth;
  if (Width != self->_collectionViewLayoutReferenceWidth
    || v11 != self->_collectionViewLayoutReferenceSafeAreaInsets.bottom)
  {
    goto LABEL_13;
  }
}

- (unint64_t)userEventSourceType
{
  return 13;
}

- (BOOL)isCurrentCollectionViewDataSource
{
  void *v3;
  PUPhotosGridViewController *v4;
  BOOL v5;

  if (!-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (PUPhotosGridViewController *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (id)assetsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = a3;
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sectionForAssetCollection:", v4);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "assetsInSection:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v8 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v5, "photoLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v9, v10, 0, 0, 0);

      }
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionForSection:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "item");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetAtIndexPathIfSafe:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  if (objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  v5 = objc_msgSend(v4, "section");
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSections");

  if (v5 >= v7
    || (v8 = objc_msgSend(v4, "item"),
        -[PUPhotosGridViewController photosDataSource](self, "photosDataSource"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v4, "section")),
        v9,
        v8 >= v10))
  {
LABEL_6:
    v12 = 0;
  }
  else
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetAtIndexPath:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (CGSize)imageRequestItemSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)imageRequestItemPixelSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  CGSize result;

  -[PUPhotosGridViewController imageRequestItemSize](self, "imageRequestItemSize");
  v4 = PUPixelSizeFromPointSize(v3);
  v6 = v5;
  -[PUPhotosGridViewController maximumThumbnailRequestSize](self, "maximumThumbnailRequestSize");
  if (*MEMORY[0x1E0C9D820] == v8 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v7)
  {
    v10 = v4;
    v11 = v6;
  }
  else
  {
    PXSizeMin();
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)cellFillMode
{
  void *v2;
  int64_t v3;

  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cellFillMode");

  return v3;
}

- (id)indexPathForAsset:(id)a3 hintCollection:(id)a4 hintIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 && v12 > objc_msgSend(v10, "section"))
    {
      -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v10, "section"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      if (v15 <= objc_msgSend(v10, "item"))
      {

      }
      else
      {
        objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v10, "item"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqual:", v8))
          v17 = v10;
        else
          v17 = 0;

        if (v17)
        {
          v18 = v17;
LABEL_33:

          goto LABEL_34;
        }
      }
    }
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v9)
    {
      v21 = objc_msgSend(v19, "sectionForAssetCollection:", v9);
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33 = v21;
        goto LABEL_30;
      }

    }
    objc_msgSend(v20, "collectionListFetchResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23 || objc_msgSend(v23, "assetCollectionType") != 3)
    {
      -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "forceAccurateAllSectionsIfNeeded");

      v9 = 0;
LABEL_31:
      objc_msgSend(v20, "indexPathForAsset:hintIndexPath:hintCollection:", v8, v10, v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
      v18 = v35;

      goto LABEL_33;
    }
    v37 = v8;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v8, 3, 0);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (!v26)
    {
LABEL_25:

      v9 = 0;
LABEL_35:
      v35 = 0;
      v8 = v37;
      goto LABEL_32;
    }
    v27 = v26;
    v28 = *(_QWORD *)v39;
LABEL_19:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v28)
        objc_enumerationMutation(v25);
      v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v29);
      v31 = objc_msgSend(v20, "sectionForAssetCollection:", v30);
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v27)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
    v33 = v31;
    v9 = v30;

    if (!v9)
      goto LABEL_35;
    v8 = v37;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "forceAccurateSectionsIfNeeded:", v34);

    goto LABEL_31;
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (void)_getFirstAsset:(id *)a3 collection:(id *)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  if (a3)
    *a3 = objc_retainAutorelease(v14);
  if (a4)
    *a4 = objc_retainAutorelease(v8);

}

- (BOOL)isContentViewInSyncWithModel
{
  return self->_contentViewInSyncWithModel;
}

- (void)setContentViewInSyncWithModel:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  self->_contentViewInSyncWithModel = a3;
  if (a3)
  {
    -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    -[PUPhotosGridViewController _setPreviousCollectionsCount:](self, "_setPreviousCollectionsCount:", v5);
  }
}

- (BOOL)isEmpty
{
  void *v2;
  void *v3;
  char v4;

  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEmpty");
  else
    v4 = 1;

  return v4;
}

- (id)selectedAssets
{
  void *v3;
  void *v4;
  void *v5;

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedAssetsWithAssetCollectionOrdering:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)selectedIndexPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedAssetIndexesWithAssetCollectionOrdering:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __48__PUPhotosGridViewController_selectedIndexPaths__block_invoke;
      v11[3] = &unk_1E58A6058;
      v13 = v7;
      v12 = v3;
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v11);

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }

  return v3;
}

- (BOOL)isAnyAssetSelected
{
  void *v2;
  char v3;

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnyAssetSelected");

  return v3;
}

- (BOOL)_areAllAssetsSelected
{
  void *v3;
  void *v4;
  char v5;

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "areAllAssetsSelectedInAssetCollections:", v4);

  return v5;
}

- (BOOL)_allowsActions:(unint64_t)a3
{
  return (a3 & ~-[PUPhotosGridViewController allowedActions](self, "allowedActions")) == 0;
}

- (BOOL)_canAllContainersPerformEditOperation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "canPerformEditOperation:", a3) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_canRemoveContent
{
  _BOOL4 v3;

  v3 = -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 1);
  if (v3)
    LOBYTE(v3) = -[PUPhotosGridViewController _canAllContainersPerformEditOperation:](self, "_canAllContainersPerformEditOperation:", 2);
  return v3;
}

- (BOOL)canDeleteContent
{
  _BOOL4 v3;

  v3 = -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 1);
  if (v3)
    LOBYTE(v3) = -[PUPhotosGridViewController _canAllContainersPerformEditOperation:](self, "_canAllContainersPerformEditOperation:", 1);
  return v3;
}

- (BOOL)_canAddContent
{
  _BOOL4 v3;

  v3 = -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 4);
  if (v3)
    LOBYTE(v3) = -[PUPhotosGridViewController _canAllContainersPerformEditOperation:](self, "_canAllContainersPerformEditOperation:", 3);
  return v3;
}

- (BOOL)canAddToOtherAlbumContent
{
  return -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 2);
}

- (BOOL)wantsAddContentInToolbar
{
  return 1;
}

- (id)_assetsAllowingEditOperation:(int64_t)a3 fromAssets:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PUPhotosGridViewController__assetsAllowingEditOperation_fromAssets___block_invoke;
  v8[3] = &__block_descriptor_40_e24_B32__0__PHAsset_8Q16_B24l;
  v8[4] = a3;
  v4 = a4;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_assetsAllowingRemove:(BOOL)a3 orDelete:(BOOL)a4 fromAssets:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (v6)
  {
    v10 = v8;
  }
  else
  {
    if (!v5)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[PUPhotosGridViewController _assetsAllowingEditOperation:fromAssets:](self, "_assetsAllowingEditOperation:fromAssets:", 1, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
LABEL_7:

  return v11;
}

- (BOOL)_canShareContent
{
  return -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 32);
}

- (BOOL)_canShareAsset:(id)a3
{
  return objc_msgSend(a3, "canPerformSharingAction");
}

- (id)_shareableAssetsFromAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[PUPhotosGridViewController _canShareAsset:](self, "_canShareAsset:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canPasteboardCopyAssetAtIndexPath:(id)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 1025, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  if (-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v5))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v5, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v9, "isStreamedVideo") ^ 1;
  }

  return v6;
}

- (BOOL)canDisplayEditButton
{
  _BOOL4 v3;
  BOOL v4;
  BOOL result;

  v3 = -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 2)
    || -[PUPhotosGridViewController _canAddContent](self, "_canAddContent")
    || -[PUPhotosGridViewController _canShareContent](self, "_canShareContent")
    || -[PUPhotosGridViewController _canRemoveContent](self, "_canRemoveContent")
    || -[PUPhotosGridViewController canDeleteContent](self, "canDeleteContent");
  if (!-[PUPhotosGridViewController isEmpty](self, "isEmpty"))
    return v3;
  v4 = -[PUPhotosGridViewController hasKnownNonEmptyContent_toWorkAround31995766](self, "hasKnownNonEmptyContent_toWorkAround31995766");
  result = v4 && v3;
  if (!v4 && v3)
    return -[PUPhotosGridViewController _canAddContent](self, "_canAddContent");
  return result;
}

- (BOOL)isTrashBinViewController
{
  return 0;
}

- (BOOL)isCameraRoll
{
  return 0;
}

- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *shareToolbarButton;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v18;
  UIBarButtonItem *v19;
  void *v20;
  UIBarButtonItem *v21;
  id v22;
  void *v23;
  UIBarButtonItem *v24;
  UIBarButtonItem *restoreToolbarButton;
  UIBarButtonItem *removeToolbarButton;
  id v27;
  void *v28;
  UIBarButtonItem *v29;
  UIBarButtonItem *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  UIBarButtonItem *v34;
  void *v35;
  UIBarButtonItem *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UIBarButtonItem *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  _BOOL4 v47;
  UIBarButtonItem *addToolbarButton;
  UIBarButtonItem *v49;
  UIBarButtonItem *v50;
  void *v51;
  void *v52;
  UIBarButtonItem *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  int v58;
  UIBarButtonItem *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  unint64_t v65;
  _BOOL4 v66;
  void *v67;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUPhotosGridViewController isAnyAssetSelected](self, "isAnyAssetSelected");
  if (-[PUPhotosGridViewController _canShareContent](self, "_canShareContent"))
  {
    if (!self->_shareToolbarButton)
    {
      v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__shareButtonPressed_);
      shareToolbarButton = self->_shareToolbarButton;
      self->_shareToolbarButton = v7;

    }
    -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController _shareableAssetsFromAssets:](self, "_shareableAssetsFromAssets:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12 && v12 < objc_msgSend(v10, "count"))
    {
      PULocalizedString(CFSTR("SHARE_BUTTON_TITLE_COUNT"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v12;
      PULocalizedStringWithValidatedFormat(v13, CFSTR("%ld"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PULocalizedString(CFSTR("SHARE_BUTTON_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIBarButtonItem setTitle:](self->_shareToolbarButton, "setTitle:", v14, v65);
    -[UIBarButtonItem setEnabled:](self->_shareToolbarButton, "setEnabled:", v12 != 0);
    objc_msgSend(v5, "addObject:", self->_shareToolbarButton);

  }
  v15 = -[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController");
  v16 = -[PUPhotosGridViewController canDeleteContent](self, "canDeleteContent");
  v17 = -[PUPhotosGridViewController _canRemoveContent](self, "_canRemoveContent");
  v18 = v17;
  if (!v16 && !v17)
  {
    v67 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_34;
  }
  v66 = v6;
  if (v15)
  {
    if (!self->_restoreToolbarButton)
    {
      v22 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("RESTORE_BUTTON_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (UIBarButtonItem *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 0, self, sel__removeButtonPressed_);
      restoreToolbarButton = self->_restoreToolbarButton;
      self->_restoreToolbarButton = v24;

    }
    removeToolbarButton = self->_removeToolbarButton;
    if (!removeToolbarButton)
    {
      v27 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PULocalizedString(CFSTR("DELETE_BUTTON_TITLE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (UIBarButtonItem *)objc_msgSend(v27, "initWithTitle:style:target:action:", v28, 0, self, sel__removeButtonPressed_);
      v30 = self->_removeToolbarButton;
      self->_removeToolbarButton = v29;

      removeToolbarButton = self->_removeToolbarButton;
    }
    if (v6)
      v31 = CFSTR("DELETE_BUTTON_TITLE");
    else
      v31 = CFSTR("DELETE_ALL_BUTTON_TITLE");
    if (v6)
      v32 = CFSTR("RESTORE_BUTTON_TITLE");
    else
      v32 = CFSTR("RESTORE_ALL_BUTTON_TITLE");
    PULocalizedString(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](removeToolbarButton, "setTitle:", v33);

    v34 = self->_restoreToolbarButton;
    PULocalizedString(v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](v34, "setTitle:", v35);
  }
  else
  {
    if (self->_removeToolbarButton)
      goto LABEL_27;
    v36 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 16, self, sel__removeButtonPressed_);
    v35 = self->_removeToolbarButton;
    self->_removeToolbarButton = v36;
  }

LABEL_27:
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "selectedAssets");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController _assetsAllowingRemove:orDelete:fromAssets:](self, "_assetsAllowingRemove:orDelete:fromAssets:", v18, v16, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");
  v42 = self->_removeToolbarButton;
  v43 = v41 != 0;
  if (!v41 && v15)
    v43 = -[PUPhotosGridViewController isEmpty](self, "isEmpty", v43) ^ 1;
  -[UIBarButtonItem setEnabled:](v42, "setEnabled:", v43);
  if (v3)
  {
    v67 = 0;
    v20 = 0;
  }
  else
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "photoCollectionToolbarTextTitleSpacerWidth");
    v46 = v45;

    -[PUPhotosGridViewController _barButtonSpacerWithWidth:](self, "_barButtonSpacerWithWidth:", v46);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _barButtonSpacerWithWidth:](self, "_barButtonSpacerWithWidth:", v46);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = self->_removeToolbarButton;
  v19 = self->_restoreToolbarButton;

  v6 = v66;
LABEL_34:
  if (!-[PUPhotosGridViewController _canAddContent](self, "_canAddContent"))
  {
    -[PUPhotosGridViewController canAddToOtherAlbumContent](self, "canAddToOtherAlbumContent");
    goto LABEL_41;
  }
  v47 = -[PUPhotosGridViewController wantsAddContentInToolbar](self, "wantsAddContentInToolbar");
  -[PUPhotosGridViewController canAddToOtherAlbumContent](self, "canAddToOtherAlbumContent");
  if (!v47 || v6)
  {
LABEL_41:
    v53 = 0;
    v52 = 0;
    goto LABEL_44;
  }
  addToolbarButton = self->_addToolbarButton;
  if (!addToolbarButton)
  {
    v49 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", 0, 0, self, sel__addButtonPressed_);
    v50 = self->_addToolbarButton;
    self->_addToolbarButton = v49;

    addToolbarButton = self->_addToolbarButton;
  }
  PULocalizedString(CFSTR("ADD_FROM_ALBUM_BUTTON_TITLE"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](addToolbarButton, "setTitle:", v51);

  -[UIBarButtonItem setEnabled:](self->_addToolbarButton, "setEnabled:", 1);
  if (v3)
  {
    v52 = 0;
  }
  else
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "photoCollectionToolbarIconToTextSpacerWidth");
    v56 = v55;

    -[PUPhotosGridViewController _barButtonSpacerWithWidth:](self, "_barButtonSpacerWithWidth:", v56);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53 = self->_addToolbarButton;
LABEL_44:
  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "shouldPlaceDeleteInCenterToolbarPosition");

  if (v58)
  {
    if (v20)
      objc_msgSend(v5, "addObject:", v20);
    if (v21)
      objc_msgSend(v5, "addObject:", v21);
    if (v67)
      objc_msgSend(v5, "addObject:", v67);
    if (v19)
      objc_msgSend(v5, "addObject:", v19);
    if (v52)
      objc_msgSend(v5, "addObject:", v52);
    v59 = v53;
    if (!v53)
      goto LABEL_69;
LABEL_68:
    objc_msgSend(v5, "addObject:", v59);
    goto LABEL_69;
  }
  if (v52)
    objc_msgSend(v5, "addObject:", v52);
  if (v53)
    objc_msgSend(v5, "addObject:", v53);
  if (v20)
    objc_msgSend(v5, "addObject:", v20);
  if (v21)
    objc_msgSend(v5, "addObject:", v21);
  if (v67)
    objc_msgSend(v5, "addObject:", v67);
  v59 = v19;
  if (v19)
    goto LABEL_68;
LABEL_69:
  if (v3)
  {
    v60 = objc_msgSend(v5, "count", v59);
    if (v60)
    {
      v61 = v60 - 1;
      if (v60 != 1)
      {
        v62 = 1;
        do
        {
          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
          objc_msgSend(v5, "insertObject:atIndex:", v63, v62);

          v62 += 2;
          --v61;
        }
        while (v61);
      }
    }
  }

  return v5;
}

- (id)_barButtonSpacerWithWidth:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v4, "setWidth:", a3);
  return v4;
}

- (void)setAlternateContentView:(id)a3
{
  UIView *v5;
  UIView *alternateContentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  alternateContentView = self->_alternateContentView;
  if (alternateContentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](alternateContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_alternateContentView, a3);
    -[PUPhotosGridViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_alternateContentView);

    -[PUPhotosGridViewController _updateSubviewsOrderingAndVisibility](self, "_updateSubviewsOrderingAndVisibility");
    v5 = v8;
  }

}

- (id)alternateContentView
{
  return self->_alternateContentView;
}

- (void)_updatePhotoSelectionManager
{
  void *v3;
  uint64_t v4;
  id v5;
  PUPhotoSelectionManager *v6;
  id v7;

  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoSelectionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t)v5;
  if (!v5)
  {
    -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v6 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
      -[PUPhotoSelectionManager setDataSource:](v6, "setDataSource:", self);
      v4 = (uint64_t)v6;
    }
  }
  v7 = (id)v4;
  -[PUPhotosGridViewController _setPhotoSelectionManager:](self, "_setPhotoSelectionManager:", v4);

}

- (void)selectAssets:(id)a3 fromAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoSelectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXPhotosDataSource sectionForAssetCollection:](self->_photosDataSource, "sectionForAssetCollection:", v7);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = v9;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource forceAccurateSectionsIfNeeded:](self->_photosDataSource, "forceAccurateSectionsIfNeeded:");
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          -[PXPhotosDataSource indexPathForAsset:inCollection:](self->_photosDataSource, "indexPathForAsset:inCollection:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addIndex:", objc_msgSend(v17, "item"));

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v9 = v19;
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v19, "selectAssetsAtIndexes:inAssetCollection:", v11, v7);

    v6 = v20;
  }

}

- (BOOL)_hasAtLeastOneContainer
{
  void *v2;
  BOOL v3;

  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_removeSelectedAssetsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    v8 = 0x1E0C99000uLL;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager", v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v10;
        objc_msgSend(*(id *)(v8 + 3360), "arrayWithObjects:count:", &v40, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectedAssetsWithAssetCollectionOrdering:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          -[PUPhotosGridViewController _assetsAllowingRemove:orDelete:fromAssets:](self, "_assetsAllowingRemove:orDelete:fromAssets:", 1, 0, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count") && objc_msgSend(v10, "canPerformEditOperation:", 2))
          {
            -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke;
            aBlock[3] = &unk_1E58AB790;
            aBlock[4] = v10;
            v34 = v15;
            v35 = v14;
            v28 = v15;
            v16 = _Block_copy(aBlock);
            v17 = v6;
            v18 = v7;
            v19 = v8;
            v20 = v4;
            v21 = _Block_copy(v16);
            objc_msgSend(v27, "addObject:", v21);

            v4 = v20;
            v8 = v19;
            v7 = v18;
            v6 = v17;

          }
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "photoLibrary", v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_2;
  v31[3] = &unk_1E58ABD10;
  v32 = v27;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_3;
  v29[3] = &unk_1E58AA6A8;
  v30 = v26;
  v23 = v26;
  v24 = v27;
  objc_msgSend(v22, "performChanges:completionHandler:", v31, v29);

}

- (id)localizedSelectionTitle
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedSelectionTitleWithPhotoSelectionManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4
{
  return -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", a4, 0, 0, a3.x, a3.y);
}

- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4 outLeftClosestMatch:(id *)a5 outAboveClosestMatch:(id *)a6
{
  double y;
  double x;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  void *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  y = a3.y;
  x = a3.x;
  v43 = *MEMORY[0x1E0C80C00];
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemAtPoint:", x, y);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  objc_msgSend(v11, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "conformsToProtocol:", &unk_1EEC9F260);

  if (!v12 && v15)
  {
    objc_msgSend(v11, "collectionViewLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemIndexPathAtPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a5 != 0 && v12 == 0)
    v17 = 0;
  else
    v17 = v12;
  if (((a5 != 0 && v12 == 0) & v15) == 1)
  {
    objc_msgSend(v11, "collectionViewLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "maxItemIndexPathLeftOfPoint:", x, y);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v19);
    *a5 = v17;
  }
  if (a6)
    v20 = v17 == 0;
  else
    v20 = 0;
  if (v20)
    v21 = v15 ^ 1;
  else
    v21 = 1;
  if (v20)
    v17 = 0;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(v11, "collectionViewLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "maxItemIndexPathAbovePoint:", x, y);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v23);
    *a6 = v17;
  }
  if (a4 != 0 && v17 == 0)
    v24 = 0;
  else
    v24 = v17;
  if (((a4 != 0 && v17 == 0) & v15) == 1)
  {
    objc_msgSend(v11, "collectionViewLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itemIndexPathClosestToPoint:", x, y);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a4 && !v24)
  {
    objc_msgSend(v11, "visibleCells");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v27)
    {
      v28 = v27;
      v24 = 0;
      v29 = *(_QWORD *)v39;
      v30 = 1.79769313e308;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v39 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v32, "center");
          v35 = (v34 - y) * (v34 - y) + (v33 - x) * (v33 - x);
          if (v35 < v30)
          {
            objc_msgSend(v11, "indexPathForCell:", v32);
            v36 = objc_claimAutoreleasedReturnValue();

            v24 = (void *)v36;
            v30 = v35;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v28);
    }
    else
    {
      v24 = 0;
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v24);

  return v13;
}

- (id)localizedTitleForAssets:(id)a3
{
  return &stru_1E58AD278;
}

- (id)_localizedBannerTextForAsset:(id)a3 isDestructive:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v9;

  v6 = a3;
  if (!-[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 1374, CFSTR("expected trash bin"));

  }
  PXPhotoKitLocalizedMessageForRecentlyDeletedDaysRemainingAsset();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedTitleForAssetCollection:(id)a3
{
  return -[PUPhotosGridViewController localizedTitleForAssetCollection:titleCategory:](self, "localizedTitleForAssetCollection:titleCategory:", a3, 0);
}

- (id)localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(v6, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PUPhotosGridViewController _dateRangeFormatter](self, "_dateRangeFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:toDate:", v8, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = 5;
    }
    else
    {
      v11 = (uint64_t)v7;
    }

    v7 = (void *)v11;
  }

  return v7;
}

- (PLDateRangeFormatter)_dateRangeFormatter
{
  PLDateRangeFormatter *dateRangeFormatter;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  dateRangeFormatter = self->__dateRangeFormatter;
  if (!dateRangeFormatter)
  {
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", -[PUPhotosGridViewController dateRangeFormatterPreset](self, "dateRangeFormatterPreset"));
    v4 = (PLDateRangeFormatter *)objc_claimAutoreleasedReturnValue();
    v5 = self->__dateRangeFormatter;
    self->__dateRangeFormatter = v4;

    dateRangeFormatter = self->__dateRangeFormatter;
  }
  return dateRangeFormatter;
}

- (int64_t)dateRangeFormatterPreset
{
  return 2;
}

- (id)sessionInfoForTransferredAssets:(id)a3
{
  id v3;
  PUAlbumPickerSessionInfo *v4;

  v3 = a3;
  v4 = -[PUAlbumPickerSessionInfo initWithSourceAlbum:transferredAssets:]([PUAlbumPickerSessionInfo alloc], "initWithSourceAlbum:transferredAssets:", 0, v3);

  return v4;
}

- (BOOL)shouldShowTabBar
{
  if ((-[PUPhotosGridViewController isEditing](self, "isEditing") & 1) != 0)
    return 0;
  else
    return !-[PUPhotosGridViewController alwaysHideTabBar](self, "alwaysHideTabBar");
}

- (BOOL)shouldShowToolbar
{
  int v3;
  void *v4;

  if ((-[PUPhotosGridViewSupplementalToolbarProvider shouldShowToolbar](self->_supplementalToolbarProvider, "shouldShowToolbar") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (-[PUPhotosGridViewController isEditing](self, "isEditing"))
  {
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "canDisplayEditActionsInNavigationBar") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)newToolbarItems
{
  if (!-[PUPhotosGridViewSupplementalToolbarProvider shouldShowToolbar](self->_supplementalToolbarProvider, "shouldShowToolbar"))return -[PUPhotosGridViewController _newEditActionItemsWithWideSpacing:](self, "_newEditActionItemsWithWideSpacing:", 1);
  -[PUPhotosGridViewSupplementalToolbarProvider toolbarItems](self->_supplementalToolbarProvider, "toolbarItems");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)globalHeaderHeight
{
  return 0.0;
}

- (BOOL)wantsGlobalFooter
{
  return 0;
}

- (BOOL)hasScrollableContent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    v6 = v5;
    objc_msgSend(v4, "adjustedContentInset");
    v8 = v7;
    v10 = v9;
    -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "collectionViewContentSize");
      v14 = v13;
      objc_msgSend(v11, "globalFooterHeight");
      LOBYTE(v12) = v10 + v8 + v14 - v15 > v6;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return (char)v12;
}

- (BOOL)wantsAddPlaceholderAtEndOfSection:(int64_t)a3
{
  return 0;
}

- (BOOL)isAddPlaceholderAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (-[PUPhotosGridViewController wantsAddPlaceholderAtEndOfSection:](self, "wantsAddPlaceholderAtEndOfSection:", objc_msgSend(v4, "section")))
  {
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v4, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = objc_msgSend(v4, "item") == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *v6;

  v5 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressGestureRecognizer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
    v5 = v6;
  }

}

- (id)bestReferenceItemIndexPath
{
  return -[PUPhotosGridViewController _bestReferenceItemIndexPathWithTopBias:](self, "_bestReferenceItemIndexPathWithTopBias:", 0);
}

- (id)_bestReferenceItemIndexPathWithTopBias:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v3 = a3;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  objc_msgSend(v5, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_38;
  objc_msgSend(v4, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_35:
    v7 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v4, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "adjustedContentInset");
  v18 = v10 + v17;
  v20 = v12 + v19;
  v22 = v14 - (v17 + v21);
  v24 = v16 - (v19 + v23);
  v25 = -0.0;
  if (v20 < 0.0)
    v25 = v20;
  v26 = v24 + v25;
  if (v20 >= 0.0)
    v27 = v20;
  else
    v27 = 0.0;
  v28 = objc_msgSend(v4, "numberOfSections");
  v29 = v28 - 1;
  if (v28 >= 1 && objc_msgSend(v4, "numberOfItemsInSection:", 0) >= 1)
  {
    if (v6 && objc_msgSend(v6, "firstPreparedVisualSection"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31
        && (objc_msgSend(v31, "frame"),
            v41.origin.x = v18,
            v41.origin.y = v27,
            v41.size.width = v22,
            v41.size.height = v26,
            CGRectIntersectsRect(v39, v41)))
      {
        v7 = v30;
      }
      else
      {
        v7 = 0;
      }

      if (!v6)
      {
        v33 = v29;
LABEL_24:
        v34 = objc_msgSend(v4, "numberOfItemsInSection:", v33);
        if (!v7 && v34 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v34 - 1, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36
            && (objc_msgSend(v36, "frame"),
                v42.origin.x = v18,
                v42.origin.y = v27,
                v42.size.width = v22,
                v42.size.height = v26,
                CGRectIntersectsRect(v40, v42)))
          {
            v7 = v35;
          }
          else
          {
            v7 = 0;
          }

        }
LABEL_31:
        if (v7)
          goto LABEL_38;
        goto LABEL_32;
      }
    }
    v33 = objc_msgSend(v6, "lastPreparedVisualSection");
    if (v33 != v29)
      goto LABEL_31;
    goto LABEL_24;
  }
LABEL_32:
  if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EEC9F260))
    goto LABEL_35;
  if (v3)
    objc_msgSend(v5, "itemIndexPathClosestToPoint:", v18, v27);
  else
    objc_msgSend(v5, "itemIndexPathAtCenterOfRect:", v18, v27, v22, v26);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v7;
}

- (void)_setPushedPhotoBrowserController:(id)a3
{
  objc_storeStrong((id *)&self->__pushedPhotoBrowserController, a3);
  -[PUPhotosGridViewController _updateBackButtonTitle](self, "_updateBackButtonTitle");
}

- (id)_referenceBarButtonItemForDeleteAction:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PUPhotosGridViewController__removeToolbarButton;
  if (a3 && a3 != 5)
  {
    if (a3 != 3)
      return 0;
    v3 = &OBJC_IVAR___PUPhotosGridViewController__restoreToolbarButton;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (int64_t)_deleteActionForBarButtonItem:(id)a3
{
  UIBarButtonItem *v4;
  int64_t v5;

  v4 = (UIBarButtonItem *)a3;
  if (-[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController"))
  {
    if (self->_restoreToolbarButton == v4)
    {
      v5 = 3;
    }
    else if (self->_removeToolbarButton == v4)
    {
      v5 = 5;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentScrollView
{
  void *v3;

  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)installGestureRecognizers
{
  void *v3;
  PUPhotoPinchGestureRecognizer *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUPhotosGridViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleLongPressGesture_);
    objc_msgSend(v3, "setDelegate:", self);
    -[PUPhotosGridViewController setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v3);
  }
  objc_msgSend(v9, "addGestureRecognizer:", v3);
  -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
  v4 = (PUPhotoPinchGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_handlePhotoOrStackPinchGestureRecognizer_);
    -[PUPhotoPinchGestureRecognizer setDelegate:](v4, "setDelegate:", self);
    -[PUPhotosGridViewController _setPhotoOrStackPinchGestureRecognizer:](self, "_setPhotoOrStackPinchGestureRecognizer:", v4);
  }
  objc_msgSend(v9, "addGestureRecognizer:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3A18]);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setSingleTouchPanGestureHysteresis:", 5.0);
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addInteraction:", v5);

  -[PUPhotosGridViewController set_multiSelectInteraction:](self, "set_multiSelectInteraction:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
  -[PUPhotosGridViewController _setContextMenuInteraction:](self, "_setContextMenuInteraction:", v7);
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addInteraction:", v7);

}

- (void)uninstallGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  -[PUPhotosGridViewController _multiSelectInteraction](self, "_multiSelectInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PUPhotosGridViewController _multiSelectInteraction](self, "_multiSelectInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _multiSelectInteraction](self, "_multiSelectInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeInteraction:", v12);

    -[PUPhotosGridViewController set_multiSelectInteraction:](self, "set_multiSelectInteraction:", 0);
  }
  -[PUPhotosGridViewController _contextMenuInteraction](self, "_contextMenuInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = v13;
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeInteraction:", v15);

    -[PUPhotosGridViewController _setContextMenuInteraction:](self, "_setContextMenuInteraction:", 0);
    v13 = v15;
  }

}

- (BOOL)canNavigateToPhotoInteractively:(BOOL)a3
{
  return 1;
}

- (BOOL)canBeginStackCollapseTransition
{
  return 0;
}

- (void)loadView
{
  PUCollectionView *v3;
  PUCollectionView *v4;
  id v5;
  objc_super v6;

  if (-[PUPhotosGridViewController useLayoutToLayoutNavigationTransitions](self, "useLayoutToLayoutNavigationTransitions"))
  {
    -[PUPhotosGridViewController setContentViewInSyncWithModel:](self, "setContentViewInSyncWithModel:", 1);
    v6.receiver = self;
    v6.super_class = (Class)PUPhotosGridViewController;
    -[PUPhotosGridViewController loadView](&v6, sel_loadView);
  }
  else
  {
    -[PUPhotosGridViewController collectionViewLayout](self, "collectionViewLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [PUCollectionView alloc];
    v4 = -[PUCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PUCollectionView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("PhotosGridView"));
    -[PUCollectionView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[PUPhotosGridViewController setCollectionView:](self, "setCollectionView:", v4);
    -[PUPhotosGridViewController setContentViewInSyncWithModel:](self, "setContentViewInSyncWithModel:", 0);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
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
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "setPrefetchingEnabled:", 0);
    objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
    objc_msgSend(v3, "setSelectionDelegate:", self);
    objc_msgSend(v3, "setAllowsSelection:", 1);
    objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));
    objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUAddPlaceholderCell"));
    objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUGridGlobalHeader"), CFSTR("PUGridGlobalHeader"));
    objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUGridGlobalFooter"), CFSTR("PUGridGlobalFooter"));
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoCollectionViewBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setBackgroundColor:", v5);
    if (-[PUPhotosGridViewController canDragOut](self, "canDragOut"))
      objc_msgSend(v3, "setDragSourceDelegate:", self);
    objc_msgSend(v3, "setDragDestinationDelegate:", self);
    objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReorderingCadence:", objc_msgSend(v6, "reorderCadence"));

    objc_msgSend(v3, "setDragInteractionEnabled:", 1);
  }
  -[PUPhotosGridViewController updateSpec](self, "updateSpec");
  -[PUPhotosGridViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[PUPhotosGridViewController _updatePhotoSelectionManager](self, "_updatePhotoSelectionManager");
  -[PUPhotosGridViewController _updateSubviewsOrderingAndVisibility](self, "_updateSubviewsOrderingAndVisibility");
  v7 = (void *)objc_opt_new();
  -[PUPhotosGridViewController _setCollectionViewSpeedometer:](self, "_setCollectionViewSpeedometer:", v7);

  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediumUpperThreshold:", 1000.0);

  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediumLowerThreshold:", 200.0);

  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFastUpperThreshold:", 5000.0);

  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFastLowerThreshold:", 1000.0);

  -[PUPhotosGridViewController _setMaximumNumberOfRowsToPreheat:](self, "_setMaximumNumberOfRowsToPreheat:", 10);
  -[PUPhotosGridViewController _updateBackButtonTitle](self, "_updateBackButtonTitle");
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "masterThumbnailFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sizeWithFallBackSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PUPhotosGridViewController _setMaximumThumbnailRequestSize:](self, "_setMaximumThumbnailRequestSize:");
  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __41__PUPhotosGridViewController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E58ABD10;
  v16[4] = self;
  objc_msgSend(v15, "scheduleMainQueueTask:", v16);

}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "topLevelStatusBarStyle");

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  v5 = -[PUPhotosGridViewController updateSpec](self, "updateSpec");
  v6 = -[PUPhotosGridViewController _updateTransitionWidthOnAppearance](self, "_updateTransitionWidthOnAppearance");
  -[PUPhotosGridViewController forceDataSourceIfNeeded](self, "forceDataSourceIfNeeded");
  -[PUPhotosGridViewController beginBatchPreheating](self, "beginBatchPreheating");
  -[PUPhotosGridViewController resetPreheating](self, "resetPreheating");
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  if (!-[PUPhotosGridViewController isContentViewInSyncWithModel](self, "isContentViewInSyncWithModel") || v5 || v6)
  {
    -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 0);
    -[PUPhotosGridViewController _updateLayoutReferenceValues](self, "_updateLayoutReferenceValues");
    -[PUPhotosGridViewController _performAutomaticContentOffsetAdjustment](self, "_performAutomaticContentOffsetAdjustment");
  }
  else
  {
    -[PUPhotosGridViewController _updateLayoutReferenceValues](self, "_updateLayoutReferenceValues");
    -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 0);
  }
  -[PUPhotosGridViewController endBatchPreheating](self, "endBatchPreheating");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewControllerViewWillAppear:", v3);

  v8 = -[PUPhotosGridViewController userEventSourceType](self, "userEventSourceType");
  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventSourceWillAppear:sender:", v8, self);

}

- (void)invalidateGridLayoutIfNecessary
{
  id v3;

  if (-[PUPhotosGridViewController _updateTransitionWidthOnAppearance](self, "_updateTransitionWidthOnAppearance"))
  {
    -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidAppear:](&v10, sel_viewDidAppear_);
  -[PUPhotosGridViewController _pushedPhotoBrowserController](self, "_pushedPhotoBrowserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

  }
  -[PUPhotosGridViewController _setPushedPhotoBrowserController:](self, "_setPushedPhotoBrowserController:", 0);
  -[PUPhotosGridViewController onViewDidAppearCompletion](self, "onViewDidAppearCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUPhotosGridViewController onViewDidAppearCompletion](self, "onViewDidAppearCompletion");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PUPhotosGridViewController *))v8)[2](v8, self);

    -[PUPhotosGridViewController setOnViewDidAppearCompletion:](self, "setOnViewDidAppearCompletion:", 0);
  }
  -[PUPhotosGridViewController preheatAssets](self, "preheatAssets");
  -[PUPhotosGridViewController installGestureRecognizers](self, "installGestureRecognizers");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewControllerViewDidAppear:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[PUPhotosGridViewController _saveAnchorForAutomaticContentOffsetAdjustment](self, "_saveAnchorForAutomaticContentOffsetAdjustment");
  -[PUPhotosGridViewController resetPreheating](self, "resetPreheating");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillDisappear:", v3);

  -[PUPhotosGridViewController _updateBackButtonTitle](self, "_updateBackButtonTitle");
  -[PUPhotosGridViewController setPendingProcessDataSourceUpdateBlock:](self, "setPendingProcessDataSourceUpdateBlock:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  -[PUPhotosGridViewController uninstallGestureRecognizers](self, "uninstallGestureRecognizers");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewDidDisappear:", v3);

  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventSourceDidDisappear:sender:", 13, self);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return ((1 << a3) & ~-[PUPhotosGridViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations")) == 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (BOOL)_hasAccessibilityLargeText
{
  void *v2;
  BOOL v3;

  -[PUPhotosGridViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PUInterfaceManager shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:](PUInterfaceManager, "shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:", v2);

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v4 = a4;
  v5 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = -[PUPhotosGridViewController isEditing](self, "isEditing");
  v39.receiver = self;
  v39.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController setEditing:animated:](&v39, sel_setEditing_animated_, v5, v4);
  if (v7 != v5)
  {
    -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", v4);
    if (v4)
      v8 = *MEMORY[0x1E0DC51A0];
    else
      v8 = 0;
    -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, v8);
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v9, "indexPathsForVisibleItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v15))
          {
            objc_msgSend(v9, "cellForItemAtIndexPath:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotosGridViewController _configureAddPlaceholderCell:animated:](self, "_configureAddPlaceholderCell:animated:", v16, v4);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v12);
    }

    if (v5)
    {
      -[PUPhotosGridViewController primingActivityViewController](self, "primingActivityViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = objc_alloc(MEMORY[0x1E0D96D28]);
        v19 = (void *)objc_msgSend(v18, "initWithActivityItems:applicationActivities:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
        -[PUPhotosGridViewController setPrimingActivityViewController:](self, "setPrimingActivityViewController:", v19);

      }
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[PUPhotosGridViewController _multiSelectInteraction](self, "_multiSelectInteraction", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "gesturesForFailureRequirements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v26, "setEnabled:", 0);
            objc_msgSend(v26, "setEnabled:", 1);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v23);
      }

      -[PUPhotosGridViewController _removeActionSheet](self, "_removeActionSheet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "presentingViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, 0);

      -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "deselectAllAssets");

      -[PUPhotosGridViewController setPrimingActivityViewController:](self, "setPrimingActivityViewController:", 0);
    }
    if (-[PUPhotosGridViewController _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText"))
    {
      -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "invalidateLayout");

    }
    -[PUPhotosGridViewController _updateCollectionViewMultipleSelection](self, "_updateCollectionViewMultipleSelection");

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  if (-[PUPhotosGridViewController updateSpec](self, "updateSpec"))
  {
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wantsCustomNavigationTransition");

    if (v4)
      -[UIViewController pu_restoreNavigationTransition](self, "pu_restoreNavigationTransition");
    else
      -[UIViewController pu_removeNavigationTransition](self, "pu_removeNavigationTransition");
    -[PUPhotosGridViewController _updateLayoutReferenceValues](self, "_updateLayoutReferenceValues");
    -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 0);
  }
  else
  {
    -[PUPhotosGridViewController _updateLayoutReferenceValues](self, "_updateLayoutReferenceValues");
  }
  if (!self->_didScrollToInitialPosition)
  {
    if (-[PUPhotosGridViewController initiallyScrolledToBottom](self, "initiallyScrolledToBottom"))
    {
      -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PUPhotosGridViewController wantsGlobalFooter](self, "wantsGlobalFooter"))
      {
        objc_msgSend(v5, "globalFooterIndexPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("PUGridGlobalFooter"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
      -[PUPhotosGridViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v8, "contentOffset");
        v11 = v10;
        objc_msgSend(v9, "collectionViewLayout");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "collectionViewContentSize");
        v14 = v13;

        objc_msgSend(v9, "adjustedContentInset");
        v16 = v15;
        objc_msgSend(v9, "bounds");
        v17 = v16 + v14 - CGRectGetHeight(v20);
        objc_msgSend(v7, "frame");
        objc_msgSend(v9, "px_scrollToContentOffset:animated:", 0, v11, v17 - v18);
      }
      else
      {
        objc_msgSend(v8, "px_scrollToEdge:animated:", 3, 0);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v9, "didScrollToInitialPosition");
      objc_msgSend(v5, "invalidateLayoutForVerticalScroll");

    }
    self->_didScrollToInitialPosition = 1;
  }
  -[PUPhotosGridViewController _updateContentOffsetForPendingViewSizeTransition](self, "_updateContentOffsetForPendingViewSizeTransition");
}

- (void)viewDidLayoutSubviews
{
  void (**pendingNavigationBlock)(void);
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  pendingNavigationBlock = (void (**)(void))self->_pendingNavigationBlock;
  if (pendingNavigationBlock)
  {
    pendingNavigationBlock[2]();
    v4 = self->_pendingNavigationBlock;
    self->_pendingNavigationBlock = 0;

  }
}

- (double)lastUserScrollTime
{
  return self->_lastUserScrollTime;
}

- (void)_userDidStartScrolling
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastUserScrollTime = v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidScroll:", v4);

  -[PUPhotosGridViewController preheatAssets](self, "preheatAssets");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerScrollViewDidScroll:", v4);

  -[PUPhotosGridViewController setPendingProcessDataSourceUpdateBlock:](self, "setPendingProcessDataSourceUpdateBlock:", 0);
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v8 = v7;
  objc_msgSend(v12, "adjustedContentInset");
  v10 = v8 + v9 < 0.0;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowNextChangeDeliveryOnAllRunLoopModes:", v10);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

  -[PUPhotosGridViewController _clearAutomaticContentOffsetSnapshot](self, "_clearAutomaticContentOffsetSnapshot");
  -[PUPhotosGridViewController _userDidStartScrolling](self, "_userDidStartScrolling");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollViewDidEndDragging:willDecelerate:", v6, v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidEndDecelerating:", v4);

}

- (void)scrollViewWillScrollToTop:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillScrollToTop:", v4);

  -[PUPhotosGridViewController _userDidStartScrolling](self, "_userDidStartScrolling");
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotosGridViewController _collectionViewSpeedometer](self, "_collectionViewSpeedometer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidScrollToTop:", v4);

}

- (int64_t)imageDeliveryMode
{
  return 0;
}

- (void)resetPreheating
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PHCachingImageManager stopCachingImagesForAllAssets](self->__cachingImageManager, "stopCachingImagesForAllAssets");
  -[PUPhotosGridViewController _setPreviousPreheatContentOffset:](self, "_setPreviousPreheatContentOffset:", 1.79769313e308, 1.79769313e308);
  -[PUPhotosGridViewController _setPreviousPrefetchContentOffset:](self, "_setPreviousPrefetchContentOffset:", 1.79769313e308, 1.79769313e308);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[PUPhotosGridViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E0C9D648], v4, v5, v6);
  -[PUPhotosGridViewController _setPreviousPrefetchRect:](self, "_setPreviousPrefetchRect:", v3, v4, v5, v6);
}

- (CGPoint)contentOffsetForPreheating
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGSize)contentSizeForPreheating
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)preheatAssets
{
  -[PUPhotosGridViewController preheatAssetsWithPrefetchingDisabled:](self, "preheatAssetsWithPrefetchingDisabled:", 0);
}

- (void)preheatAssetsWithPrefetchingDisabled:(BOOL)a3
{
  uint64_t v5;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL8 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  void *v82;
  CGFloat v83;
  void *v84;
  double v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  double v90;
  double v91;
  _QWORD v92[4];
  id v93;
  char v94;
  _QWORD aBlock[4];
  id v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;

  if (-[PUPhotosGridViewController isPreheatingEnabled](self, "isPreheatingEnabled"))
  {
    if (-[PUPhotosGridViewController px_isVisible](self, "px_isVisible"))
    {
      -[PUPhotosGridViewController collectionView](self, "collectionView");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (-[PUPhotosGridViewController _batchPreheatingCount](self, "_batchPreheatingCount") <= 0)
          {
            -[PUPhotosGridViewController collectionView](self, "collectionView");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotosGridViewController contentOffsetForPreheating](self, "contentOffsetForPreheating");
            v11 = v10;
            v13 = v12;
            objc_msgSend(v9, "bounds");
            v15 = v14;
            v17 = v16;
            -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotosGridViewController imageRequestItemSize](self, "imageRequestItemSize");
            v20 = v19;
            -[PUPhotosGridViewController _previousPreheatContentOffset](self, "_previousPreheatContentOffset");
            v22 = v21;
            -[PUPhotosGridViewController _previousPrefetchContentOffset](self, "_previousPrefetchContentOffset");
            if (v13 - v22 >= 0.0)
              v24 = v13 - v22;
            else
              v24 = -(v13 - v22);
            if (v24 > v20 * 0.5)
              goto LABEL_13;
            v25 = v13 - v23;
            if (v25 < 0.0)
              v25 = -v25;
            if (v25 > v20 * 0.5)
            {
LABEL_13:
              -[PUPhotosGridViewController _setPreviousPreheatContentOffset:](self, "_setPreviousPreheatContentOffset:", v11, v13);
              v26 = v20
                  * (double)-[PUPhotosGridViewController _maximumNumberOfRowsToPreheat](self, "_maximumNumberOfRowsToPreheat");
              if (v24 < v26)
                v26 = v24;
              if (v26 >= v17)
                v27 = v26;
              else
                v27 = v17;
              v28 = *MEMORY[0x1E0DC49E8];
              v29 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
              v30 = -v27;
              v31 = -v26;
              v32 = v27 * -4.0;
              if (v13 > v22)
              {
                v33 = v30;
              }
              else
              {
                v28 = v31;
                v33 = v32;
              }
              if (v13 < v22)
              {
                v31 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
                v32 = v30;
              }
              v85 = v11;
              v34 = v11 + v29;
              v35 = v13 + v28;
              v80 = v15;
              v36 = v15 - (v29 + *(double *)(MEMORY[0x1E0DC49E8] + 24));
              v37 = v17 - (v28 + v31);
              v77 = v13;
              v38 = v13 + v33;
              v39 = v17 - (v33 + v32);
              -[PUPhotosGridViewController contentSizeForPreheating](self, "contentSizeForPreheating");
              if (v35 >= 0.0)
                v41 = v35;
              else
                v41 = 0.0;
              if (v40 > 0.0 && v37 + v41 > v40)
                v42 = v40 - v41;
              else
                v42 = v37;
              if (v38 >= 0.0)
                v43 = v38;
              else
                v43 = 0.0;
              v44 = v40 - v43;
              if (v40 <= 0.0 || v39 + v43 <= v40)
                v44 = v39;
              v78 = v44;
              v79 = v43;
              -[PUPhotosGridViewController _previousPreheatRect](self, "_previousPreheatRect");
              v81 = v46;
              v83 = v45;
              v48 = v47;
              v50 = v49;
              -[PUPhotosGridViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v34, v41, v36, v42);
              -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = 0;
              v106 = &v105;
              v107 = 0x3032000000;
              v108 = __Block_byref_object_copy__71864;
              v109 = __Block_byref_object_dispose__71865;
              v110 = 0;
              v99 = 0;
              v100 = &v99;
              v101 = 0x3032000000;
              v102 = __Block_byref_object_copy__71864;
              v103 = __Block_byref_object_dispose__71865;
              v104 = 0;
              v52 = MEMORY[0x1E0C809B0];
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_451;
              aBlock[3] = &unk_1E58A60A0;
              v53 = v18;
              v96 = v53;
              v97 = &v105;
              v98 = &v99;
              v92[0] = v52;
              v92[1] = 3221225472;
              v92[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_2;
              v92[3] = &unk_1E58A60C8;
              v94 = 1;
              v54 = _Block_copy(aBlock);
              v93 = v54;
              PUDiffVerticalRects(v92, v83, v81, v48, v50, v34, v41, v36, v42);
              objc_msgSend(v51, "approximateAssetsAtIndexPaths:", v106[5]);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = v18;
              v84 = v9;
              objc_msgSend(v51, "approximateAssetsAtIndexPaths:", v100[5]);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (void *)objc_opt_new();
              objc_msgSend(v57, "setDeliveryMode:", -[PUPhotosGridViewController imageDeliveryMode](self, "imageDeliveryMode"));
              v58 = (unint64_t)-[PUPhotosGridViewController cellFillMode](self, "cellFillMode") < 2;
              -[PUPhotosGridViewController imageRequestItemPixelSize](self, "imageRequestItemPixelSize");
              v60 = v59;
              v62 = v61;
              -[PUPhotosGridViewController _cachingImageManager](self, "_cachingImageManager");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "startCachingImagesForAssets:targetSize:contentMode:options:", v55, v58, v57, v60, v62);

              -[PUPhotosGridViewController _cachingImageManager](self, "_cachingImageManager");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "stopCachingImagesForAssets:targetSize:contentMode:options:", v56, v58, v57, v60, v62);

              if (!a3)
              {
                -[PUPhotosGridViewController _previousPrefetchRect](self, "_previousPrefetchRect");
                v66 = v65;
                v68 = v67;
                v70 = v69;
                v72 = v71;
                -[PUPhotosGridViewController _setPreviousPrefetchRect:](self, "_setPreviousPrefetchRect:", v85 + 0.0, v79, v80, v78);
                -[PUPhotosGridViewController _setPreviousPrefetchContentOffset:](self, "_setPreviousPrefetchContentOffset:", v85, v77);
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v86[0] = MEMORY[0x1E0C809B0];
                v86[1] = 3221225472;
                v86[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_3;
                v86[3] = &unk_1E58A60F0;
                v87 = v53;
                v90 = v85;
                v91 = v77;
                v75 = v73;
                v88 = v75;
                v76 = v74;
                v89 = v76;
                PUDiffVerticalRects(v86, v66, v68, v70, v72, v85 + 0.0, v79, v80, v78);
                objc_msgSend(v51, "prefetchApproximateAssetsAtIndexPaths:reverseOrder:", v75, 1);
                objc_msgSend(v51, "prefetchApproximateAssetsAtIndexPaths:reverseOrder:", v76, 0);

              }
              _Block_object_dispose(&v99, 8);

              _Block_object_dispose(&v105, 8);
              v18 = v82;
              v9 = v84;
            }

          }
        }
      }
    }
  }
}

- (BOOL)isPreheatingEnabled
{
  return 1;
}

- (void)beginBatchPreheating
{
  -[PUPhotosGridViewController _setBatchPreheatingCount:](self, "_setBatchPreheatingCount:", -[PUPhotosGridViewController _batchPreheatingCount](self, "_batchPreheatingCount") + 1);
}

- (void)endBatchPreheating
{
  int64_t v3;

  v3 = -[PUPhotosGridViewController _batchPreheatingCount](self, "_batchPreheatingCount") - 1;
  -[PUPhotosGridViewController _setBatchPreheatingCount:](self, "_setBatchPreheatingCount:", v3);
  if (!v3)
    -[PUPhotosGridViewController preheatAssets](self, "preheatAssets");
}

- (double)cellAspectRatioHint
{
  return 0.0;
}

- (id)indexPathsForPreheatingInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  -[PUPhotosGridViewController gridLayout](self, "gridLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "representedElementKind", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(v15, "indexPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v9, "addObject:", v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v9;
}

- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  if ((unint64_t)a4 <= 3)
  {
    v8 = v7;
    -[PUPhotosGridViewController _setMaximumNumberOfRowsToPreheat:](self, "_setMaximumNumberOfRowsToPreheat:", qword_1AB0EFF00[a4]);
    v7 = v8;
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  if (sel_paste_ == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PUPhotosGridViewController _menuIndexPath](self, "_menuIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || -[PUPhotosGridViewController _hasAtLeastOneContainer](self, "_hasAtLeastOneContainer"))
    {
      -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v7, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "canPerformEditOperation:", 3))
      {
        objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "px_containsAssets");

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

    if (sel_copy_ == a3)
      v11 = 0;
    else
      v11 = v10;
  }
  else if (sel_copy_ == a3)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUPhotosGridViewController;
    v11 = -[PUPhotosGridViewController canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
  }

  return v11;
}

- (void)copy:(id)a3
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Please stop calling copy: on %@, it does not support copy anymore, but the method is still implemented to avoid crashing", (uint8_t *)&v5, 0xCu);

  }
}

- (void)paste:(id)a3
{
  id v5;
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
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[3];
  uint64_t v25;

  v5 = a3;
  -[PUPhotosGridViewController _menuIndexPath](self, "_menuIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "canPerformEditOperation:", 3) & 1) != 0)
  {
    if (!v6)
    {
LABEL_6:
      v8 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2374, CFSTR("Attempting to paste into a non-editable collection: %@"), v7);

    if (!v6)
      goto LABEL_6;
  }
  if (!self->_isMenuIndexPathExact)
    goto LABEL_6;
  -[PUPhotosGridViewController assetAtIndexPath:](self, "assetAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") > 1
    || objc_msgSend(v11, "count") == 1
    && (objc_msgSend(v11, "lastObject"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12 != v8))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    if (v8)
      v13 = objc_msgSend(v6, "item");
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = v13;
    -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__PUPhotosGridViewController_paste___block_invoke;
    v17[3] = &unk_1E58A6118;
    v18 = v7;
    v16 = v14;
    v19 = v16;
    v20 = v11;
    v21 = v8;
    v22 = v6;
    v23 = v24;
    objc_msgSend(v15, "performChanges:completionHandler:", v17, 0);

    _Block_object_dispose(v24, 8);
  }
  -[PUPhotosGridViewController _setMenuIndexPath:](self, "_setMenuIndexPath:", 0);
  self->_showingMenu = 0;

}

- (void)_handleSelectSessionDoneButton:(id)a3
{
  void *v4;
  id v5;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatus:", 1);

  }
}

- (void)_handleSelectSessionCancelButton:(id)a3
{
  void *v4;
  id v5;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatus:", 2);

  }
}

- (void)_handleCancelButton:(id)a3
{
  void *v4;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_handleSelectionButton:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PUPhotosGridViewController _areAllAssetsSelected](self, "_areAllAssetsSelected");
    -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v6, "deselectAllAssetsInAssetCollections:", v7);
    else
      objc_msgSend(v6, "selectAllAssetsInAssetCollections:", v7);

    -[PUPhotosGridViewController _updateCollectionViewMultipleSelection](self, "_updateCollectionViewMultipleSelection");
    -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 0);
  }
}

- (id)_selectionManagerWithSelectedSharableAssets
{
  PUPhotoSelectionManager *v3;
  void *v4;
  void *v5;
  PUPhotoSelectionManager *v6;
  id v7;
  PUPhotoSelectionManager *v8;
  PUPhotoSelectionManager *v9;
  _QWORD v11[5];
  id v12;
  PUPhotoSelectionManager *v13;

  v3 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
  -[PUPhotoSelectionManager setDataSource:](v3, "setDataSource:", self);
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PUPhotosGridViewController__selectionManagerWithSelectedSharableAssets__block_invoke;
  v11[3] = &unk_1E58A6140;
  v11[4] = self;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateSelectedAssetsWithAssetCollectionOrdering:block:", v7, v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

- (unint64_t)_sharableAssetsTypeInFetchResult:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PUPhotosGridViewController__sharableAssetsTypeInFetchResult___block_invoke;
  v7[3] = &unk_1E58A6168;
  v7[4] = self;
  v7[5] = v8;
  v7[6] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_selectionManagerWithSharableAssetsInFetchResult:(id)a3 forAssetCollection:(id)a4
{
  id v6;
  id v7;
  PUPhotoSelectionManager *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
  -[PUPhotoSelectionManager setDataSource:](v8, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__PUPhotosGridViewController__selectionManagerWithSharableAssetsInFetchResult_forAssetCollection___block_invoke;
  v13[3] = &unk_1E58A6190;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  if (objc_msgSend(v11, "count"))
    -[PUPhotoSelectionManager selectAssetsAtIndexes:inAssetCollection:](v8, "selectAssetsAtIndexes:inAssetCollection:", v11, v10);

  return v8;
}

- (id)_activitySharingControllerWithSelectionManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUActivitySharingConfiguration *v8;
  void *v9;
  PUActivitySharingController *v10;

  v4 = a3;
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchResultsByAssetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUActivitySharingConfiguration initWithCollectionsFetchResult:selectionManager:]([PUActivitySharingConfiguration alloc], "initWithCollectionsFetchResult:selectionManager:", v5, v4);
  -[PUActivitySharingConfiguration setAssetsFetchResultsByAssetCollection:](v8, "setAssetsFetchResultsByAssetCollection:", v7);
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setPhotosDataSource:](v8, "setPhotosDataSource:", v9);

  v10 = -[PUActivitySharingController initWithActivitySharingConfiguration:]([PUActivitySharingController alloc], "initWithActivitySharingConfiguration:", v8);
  -[PUActivitySharingController setDelegate:](v10, "setDelegate:", self);

  return v10;
}

- (void)_presentActivitySharingController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotosGridViewController setActivitySharingController:](self, "setActivitySharingController:", v7);
  objc_msgSend(v7, "activityViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v6);
}

- (void)sender:(id)a3 shareSelectedAssetsWithCompletion:(id)a4
{
  -[PUPhotosGridViewController _presentShareSheetWithCompletion:](self, "_presentShareSheetWithCompletion:", a4);
}

- (void)_presentShareSheetWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[16];

  v5 = a3;
  +[PUAssetActionManager actionManagerLog](PUAssetActionManager, "actionManagerLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", ", buf, 2u);
  }
  -[PUPhotosGridViewController _selectionManagerWithSelectedSharableAssets](self, "_selectionManagerWithSelectedSharableAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", buf, 2u);
    }
    -[PUPhotosGridViewController _activitySharingControllerWithSelectionManager:](self, "_activitySharingControllerWithSelectionManager:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        v12 = MEMORY[0x1E0C809B0];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke;
        v20[3] = &unk_1E58ABD10;
        v21 = v6;
        objc_msgSend(v11, "setReadyToInteractHandler:", v20);
        v18[0] = v12;
        v18[1] = 3221225472;
        v18[2] = __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke_475;
        v18[3] = &unk_1E58ABAC8;
        v19 = v5;
        -[PUPhotosGridViewController _presentActivitySharingController:completion:](self, "_presentActivitySharingController:completion:", v10, v18);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2551, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v15, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2551, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v15);
    }

    goto LABEL_8;
  }
  if (v5)
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_11:
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", ", buf, 2u);
  }

}

- (void)_shareButtonPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PUPhotosGridViewController sender:shareSelectedAssetsWithCompletion:](self, "sender:shareSelectedAssetsWithCompletion:", v5, 0);

}

- (void)sender:(id)a3 shareAssetsInFetchResult:(id)a4 forAssetCollection:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
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
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD aBlock[5];
  id v52;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(location, self);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke;
  aBlock[3] = &unk_1E58A61B8;
  aBlock[4] = self;
  v15 = v12;
  v52 = v15;
  v16 = _Block_copy(aBlock);
  v17 = -[PUPhotosGridViewController _sharableAssetsTypeInFetchResult:](self, "_sharableAssetsTypeInFetchResult:", v11);
  if (v17 == 2)
  {
    v38 = v13;
    v40 = v10;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("SHARE_THIS_MOMENT"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v14;
    v45[1] = 3221225472;
    v45[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_2;
    v45[3] = &unk_1E58A61E0;
    objc_copyWeak(&v50, location);
    v23 = v15;
    v46 = v23;
    v39 = v16;
    v49 = v16;
    v24 = v11;
    v47 = v24;
    v25 = v40;
    v48 = v25;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v45);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v26);

    v27 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("SHARE_PLAY_SLIDESHOW"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    v41[1] = 3221225472;
    v41[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_3;
    v41[3] = &unk_1E58A6208;
    objc_copyWeak(&v44, location);
    v41[4] = self;
    v42 = v23;
    v43 = v24;
    objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v29);

    v30 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v16 = v39;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v32);

    objc_msgSend(v20, "popoverPresentationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSourceView:", v25);
    objc_msgSend(v25, "bounds");
    objc_msgSend(v33, "setSourceRect:");
    objc_msgSend(v33, "setDelegate:", self);
    v34 = (void *)MEMORY[0x1E0DC3F10];
    -[PUPhotosGridViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v35, "semanticContentAttribute"));

    if (v36)
      v37 = 4;
    else
      v37 = 8;
    objc_msgSend(v33, "setPermittedArrowDirections:", v37);
    -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
    -[PUPhotosGridViewController _setShareAssetsPopoverController:](self, "_setShareAssetsPopoverController:", v33);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v50);

    v10 = v40;
    v13 = v38;
  }
  else if (v17 == 1)
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sectionForAssetCollection:", v15);

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      (*((void (**)(void *, id))v16 + 2))(v16, v11);
  }

  objc_destroyWeak(location);
}

- (void)_slideshowButtonPressed:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canDisplaySlideshowButton");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2640, CFSTR("expected slideshow capability"));

    }
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsInSection:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController _slideshowNavigationControllerForFetchResult:assetCollection:](self, "_slideshowNavigationControllerForFetchResult:assetCollection:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setModalTransitionStyle:", 2);
    -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
}

- (BOOL)shouldPreventRevealInMomentAction
{
  return 0;
}

- (id)_slideshowNavigationControllerForFetchResult:(id)a3 assetCollection:(id)a4
{
  id v6;
  id v7;
  PUSlideshowSession *v8;
  PUSlideshowViewController *v9;
  PUSlideshowNavigationController *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PUSlideshowSession initWithFetchResult:assetCollection:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:", v7, v6);

  v9 = -[PUSlideshowViewController initWithSession:]([PUSlideshowViewController alloc], "initWithSession:", v8);
  -[PUPhotosGridViewController _setSlideshowViewController:](self, "_setSlideshowViewController:", v9);
  -[PUSlideshowViewController setDelegate:](v9, "setDelegate:", self);
  v10 = -[PUSlideshowNavigationController initWithRootViewController:]([PUSlideshowNavigationController alloc], "initWithRootViewController:", v9);

  return v10;
}

- (void)activitySharingControllerDidCancel:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2675, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2675, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v7, v9);

    goto LABEL_6;
  }
LABEL_3:
  -[PUPhotosGridViewController _activitySharingControllerDidCancel:](self, "_activitySharingControllerDidCancel:", v10);

}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v16 = v9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2680, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2680, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  -[PUPhotosGridViewController _activitySharingController:didCompleteWithActivityType:success:](self, "_activitySharingController:didCompleteWithActivityType:success:", v16, v10, v5);

}

- (void)_activitySharingControllerDidCancel:(id)a3
{
  -[PUPhotosGridViewController setActivitySharingController:](self, "setActivitySharingController:", 0);
  -[PUPhotosGridViewController _setShareAssetsSender:](self, "_setShareAssetsSender:", 0);
}

- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  PUPhotosGridViewController *v30;
  id v31;
  id buf[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PUPhotosGridViewController activitySharingController](self, "activitySharingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas self.activitySharingController == nil.", (uint8_t *)buf, 2u);
    }
    goto LABEL_21;
  }
  if (v5)
  {
    -[PUPhotosGridViewController setActivitySharingController:](self, "setActivitySharingController:", 0);
    v11 = *MEMORY[0x1E0D7BD48];
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD48]) & 1) == 0
      && (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD08]) & 1) == 0
      && !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD98]))
    {
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BE38]))
      {
        if (-[PUPhotosGridViewController isEditing](self, "isEditing"))
          -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
        v16 = 0;
        goto LABEL_20;
      }
      v21 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v8, "viewModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectionManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "orderedSelectedAssets");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transientAssetCollectionWithAssets:title:", v25, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v14, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController _slideshowNavigationControllerForFetchResult:assetCollection:](self, "_slideshowNavigationControllerForFetchResult:assetCollection:", v26, v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:
      objc_initWeak(buf, self);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke;
      v27[3] = &unk_1E58A9F58;
      objc_copyWeak(&v31, buf);
      v17 = v16;
      v28 = v17;
      v29 = v9;
      v30 = self;
      -[UIViewController pu_dismissViewControllerAnimated:interactive:completion:](self, "pu_dismissViewControllerAnimated:interactive:completion:", 1, 0, v27);

      objc_destroyWeak(&v31);
      objc_destroyWeak(buf);
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v8, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _updateSelectionFromSelectionManager:](self, "_updateSelectionFromSelectionManager:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", v11))
    {
      -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController _performHideActivityWithSelectionManager:](self, "_performHideActivityWithSelectionManager:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_15:
        -[PUPhotosGridViewController _shareAssetsSender](self, "_shareAssetsSender");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && (-[PUPhotosGridViewController isEditing](self, "isEditing") & 1) == 0)
        {
          objc_msgSend(v16, "popoverPresentationController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSourceView:", v18);

          objc_msgSend(v16, "popoverPresentationController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bounds");
          objc_msgSend(v20, "setSourceRect:");

        }
        -[PUPhotosGridViewController _setActionConfirmationAlert:](self, "_setActionConfirmationAlert:", v16);

        goto LABEL_19;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD08]))
      {
        v16 = 0;
        goto LABEL_15;
      }
      -[PUPhotosGridViewController _performDuplicateActivityWithSelectionSnapshot:](self, "_performDuplicateActivityWithSelectionSnapshot:", v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_15;
    }
    v16 = v16;
    goto LABEL_15;
  }
LABEL_22:

}

- (id)_updateSelectionFromSelectionManager:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a3;
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2758, CFSTR("A selection manager should always be available."));

  }
  objc_msgSend(v6, "deselectAllAssets");
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PUPhotosGridViewController__updateSelectionFromSelectionManager___block_invoke;
  v13[3] = &unk_1E58A6140;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v5, "enumerateSelectedAssetsWithAssetCollectionOrdering:block:", v8, v13);

  -[PUPhotosGridViewController _updateCollectionViewMultipleSelection](self, "_updateCollectionViewMultipleSelection");
  objc_msgSend(v9, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_performHideActivityWithSelectionManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  PUHidePhotosActionController *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD);
  PUHidePhotosActionController *v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  PUHidePhotosActionController *v30;
  id v31;
  _QWORD v32[4];
  PUHidePhotosActionController *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id location;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isAnyAssetSelected"))
  {
    v29 = v4;
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke;
    v48[3] = &unk_1E58A6140;
    v31 = v6;
    v49 = v31;
    v9 = v7;
    v50 = v9;
    v10 = v5;
    v51 = v10;
    objc_msgSend(v4, "enumerateSelectedAssetsWithAssetCollectionOrdering:block:", v8, v48);

    v11 = [PUHidePhotosActionController alloc];
    -[PUPhotosGridViewController undoManager](self, "undoManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PUHidePhotosActionController initWithAssets:undoManager:](v11, "initWithAssets:undoManager:", v31, v12);

    if (v30)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v14 = v31;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v44 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v10, "assetReferenceAtIndexPath:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v19);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v15);
      }

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_2;
      aBlock[3] = &unk_1E58AB210;
      objc_copyWeak(&v42, &location);
      v28 = v13;
      v41 = v28;
      v20 = _Block_copy(aBlock);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_3;
      v37[3] = &unk_1E58A6230;
      objc_copyWeak(&v39, &location);
      v38 = v14;
      v21 = _Block_copy(v37);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_4;
      v32[3] = &unk_1E58A6258;
      objc_copyWeak(&v36, &location);
      v22 = v20;
      v34 = v22;
      v23 = v30;
      v33 = v23;
      v24 = v21;
      v35 = v24;
      -[PUHidePhotosActionController alertControllerForTogglingAssetsVisibilityWithCompletionHandler:](v23, "alertControllerForTogglingAssetsVisibilityWithCompletionHandler:", v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "popoverPresentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegate:", self);

      if (!v25)
      {
        v22[2](v22);
        -[PUHidePhotosActionController performActionWithCompletionHandler:](v23, "performActionWithCompletionHandler:", v24);
      }

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v39);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    else
    {
      v25 = 0;
    }

    v4 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_handleDuplicateActionCompletionWithSuccess:(BOOL)a3
{
  void *v4;
  int v5;

  if (-[PUPhotosGridViewController isEditing](self, "isEditing", a3))
  {
    +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldExitEditingModeAfterDuplication");

    if (v5)
      -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  }
  -[PUPhotosGridViewController _setDuplicateActionController:](self, "_setDuplicateActionController:", 0);
}

- (id)_performDuplicateActivityWithSelectionSnapshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void *, uint64_t, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D7B720]);
  -[PUPhotosGridViewController undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSelectionSnapshot:undoManager:", v4, v6);

  -[PUPhotosGridViewController _setDuplicateActionController:](self, "_setDuplicateActionController:", v7);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke;
  aBlock[3] = &unk_1E58A6280;
  objc_copyWeak(&v17, &location);
  v8 = v7;
  v16 = v8;
  v9 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  if (objc_msgSend(v8, "shouldUseAlertController"))
  {
    objc_msgSend(v8, "alertConfigurationForDuplicateActionWithUserConfirmationHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B190]), "initWithConfiguration:", v10);
    objc_msgSend(v11, "alertController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

  }
  else
  {
    v9[2](v9, 1, 1);
    v12 = 0;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id pendingNavigationBlock;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[5];

  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke;
  v19[3] = &unk_1E58ABD10;
  v19[4] = self;
  v7 = a4;
  v8 = a3;
  -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v19);
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUPhotosGridViewController _transitionWidthHasChanged](self, "_transitionWidthHasChanged"))
  {
    objc_initWeak(&location, self);
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke_2;
    aBlock[3] = &unk_1E58AA2E0;
    objc_copyWeak(&v17, &location);
    v15 = v9;
    v16 = v11;
    v12 = _Block_copy(aBlock);
    pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_pendingNavigationBlock = v12;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PUPhotosGridViewController navigateToRevealPhoto:inAssetContainer:animated:](self, "navigateToRevealPhoto:inAssetContainer:animated:", v9, v11, 0);
  }

}

- (void)handleAddToAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUAlbumPickerViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  -[PUPhotosGridViewController selectedAssets](self, "selectedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "albumPickerViewControllerSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController sessionInfoForTransferredAssets:](self, "sessionInfoForTransferredAssets:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUAlbumPickerViewController initWithSpec:sessionInfo:]([PUAlbumPickerViewController alloc], "initWithSpec:sessionInfo:", v8, v9);
  v11 = (void *)MEMORY[0x1E0CD14E0];
  objc_msgSend(v3, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRootAlbumCollectionListWithOptions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumPickerViewController setCollectionList:](v10, "setCollectionList:", v16);
  -[PUPhotosGridViewController _setAlbumPickerViewController:](self, "_setAlbumPickerViewController:", v10);
  -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PUPhotosGridViewController_handleAddToAction__block_invoke;
  v18[3] = &unk_1E58A62A8;
  v18[4] = self;
  v19 = v3;
  v17 = v3;
  -[PUAlbumPickerViewController setCompletionHandler:](v10, "setCompletionHandler:", v18);

}

- (void)_addButtonPressed:(id)a3
{
  void *v4;

  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[PUPhotosGridViewController isAnyAssetSelected](self, "isAnyAssetSelected"))
      -[PUPhotosGridViewController handleAddToAction](self, "handleAddToAction");
    else
      -[PUPhotosGridViewController handleAddFromAction](self, "handleAddFromAction");
  }
}

- (id)_allAssetsInCollections
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_removeButtonPressed:(id)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  PUPhotosGridViewController *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  int v59;
  void *v60;
  void (**v61)(void);
  _BOOL4 v62;
  void *v63;
  void *v64;
  BOOL v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  UIBarButtonItem *v69;
  NSObject *oslog;
  PUPhotosGridViewController *val;
  _QWORD v72[5];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  UIBarButtonItem *v77;
  NSObject *v78;
  void (**v79)(void);
  id v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  _QWORD v85[5];
  _QWORD v86[4];
  NSObject *v87;
  id v88;
  BOOL v89;
  BOOL v90;
  _QWORD v91[4];
  id v92;
  id v93;
  BOOL v94;
  _QWORD aBlock[4];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  __CFString *v103;
  __int16 v104;
  __CFString *v105;
  __int16 v106;
  __CFString *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v69 = (UIBarButtonItem *)a3;
  val = self;
  -[PUPhotosGridViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[PUPhotosGridViewController _removeActionSheet](self, "_removeActionSheet"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_4;
  }
  -[PUPhotosGridViewController _deleteActionController](self, "_deleteActionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_4:
    PLUIGetLog();
    oslog = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      -[PUPhotosGridViewController presentedViewController](self, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      v9 = v8;
      -[PUPhotosGridViewController _removeActionSheet](self, "_removeActionSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      v13 = v12;
      -[PUPhotosGridViewController _deleteActionController](self, "_deleteActionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v16 = v15;
      *(_DWORD *)buf = 138543874;
      v103 = v8;
      v104 = 2114;
      v105 = v12;
      v106 = 2114;
      v107 = v16;
      _os_log_impl(&dword_1AAB61000, oslog, OS_LOG_TYPE_DEFAULT, "Remove button ignored. presentedViewController: %{public}@ _removeActionSheet: %{public}@ _deleteActionController: %{public}@", buf, 0x20u);

    }
    goto LABEL_15;
  }
  if (!v69 || self->_removeToolbarButton != v69 && self->_restoreToolbarButton != v69)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2981, CFSTR("expect sender; need to double-check delete logic that assumes sender"));

  }
  -[PUPhotosGridViewController selectedAssets](self, "selectedAssets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v65 = v19 < 0x3E8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 < 0x3E8)
  {
    -[PUPhotosGridViewController selectedIndexPaths](self, "selectedIndexPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v18, "count");
    if (v22 != objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 2992, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assets count] == [indexPaths count]"));

    }
    if (objc_msgSend(v18, "count"))
    {
      v23 = 0;
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, v24);

        ++v23;
      }
      while (v23 < objc_msgSend(v18, "count"));
    }

  }
  v26 = self;
  v27 = -[PUPhotosGridViewController canDeleteContent](self, "canDeleteContent");
  v67 = -[PUPhotosGridViewController _canRemoveContent](val, "_canRemoveContent");
  v62 = -[PUPhotosGridViewController isTrashBinViewController](val, "isTrashBinViewController");
  if (v62 && !objc_msgSend(v18, "count"))
  {
    -[PUPhotosGridViewController _allAssetsInCollections](val, "_allAssetsInCollections");
    v28 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v28;
    v26 = val;
  }
  -[PUPhotosGridViewController _assetsAllowingRemove:orDelete:fromAssets:](v26, "_assetsAllowingRemove:orDelete:fromAssets:", v67, v27, v18);
  oslog = objc_claimAutoreleasedReturnValue();

  if ((v67 & v27) == 1)
  {
    -[PUPhotosGridViewController _assetsAllowingRemove:orDelete:fromAssets:](val, "_assetsAllowingRemove:orDelete:fromAssets:", 0, 1, oslog);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = objc_msgSend(v29, "isEqualToArray:", oslog);

  }
  if (-[NSObject count](oslog, "count"))
  {
    v59 = v27;
    v30 = v19 < 0x3E8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v32 = oslog;
      v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v98 != v34)
              objc_enumerationMutation(v32);
            objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              -[PUPhotosGridViewController photosDataSource](val, "photosDataSource");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "assetReferenceAtIndexPath:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "addObject:", v38);
            }

          }
          v33 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
        }
        while (v33);
      }

    }
    objc_initWeak((id *)buf, val);
    v39 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke;
    aBlock[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v96, (id *)buf);
    v61 = (void (**)(void))_Block_copy(aBlock);
    v91[0] = v39;
    v91[1] = 3221225472;
    v91[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_2;
    v91[3] = &unk_1E58A62D0;
    v94 = v65;
    objc_copyWeak(&v93, (id *)buf);
    v58 = v31;
    v92 = v58;
    v64 = _Block_copy(v91);
    v86[0] = v39;
    v86[1] = 3221225472;
    v86[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_3;
    v86[3] = &unk_1E58A62F8;
    objc_copyWeak(&v88, (id *)buf);
    v89 = v65;
    v90 = v62;
    v40 = oslog;
    v87 = v40;
    v66 = _Block_copy(v86);
    if (v67)
    {
      v85[0] = v39;
      v85[1] = 3221225472;
      v85[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_4;
      v85[3] = &unk_1E58A8DE8;
      v85[4] = val;
      v68 = _Block_copy(v85);
      v82[0] = v39;
      v82[1] = 3221225472;
      v82[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_5;
      v82[3] = &unk_1E58A6320;
      v82[4] = val;
      v41 = v66;
      v83 = v41;
      v42 = v64;
      v84 = v42;
      v63 = _Block_copy(v82);

      if (v59)
      {
        v76[0] = v39;
        v76[1] = 3221225472;
        v76[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_6;
        v76[3] = &unk_1E58A6348;
        v76[4] = val;
        v77 = v69;
        v78 = v40;
        v79 = v61;
        v80 = v42;
        v81 = v41;
        v60 = _Block_copy(v76);

      }
      else
      {
        v60 = 0;
      }
      objc_msgSend(MEMORY[0x1E0D7B718], "warningStringForAssets:isDeleting:", v40, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("CANCEL"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedSharedLibraryString();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("DELETE_FROM_LIBRARY_BUTTON_TITLE"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v47, 0, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v48, 1, v68);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addAction:", v52);

      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v49, 0, v63);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addAction:", v53);

      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v50, 2, v60);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addAction:", v54);

      -[PUPhotosGridViewController _setRemoveActionSheet:](val, "_setRemoveActionSheet:", v51);
      objc_msgSend(v51, "popoverPresentationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v55, "setBarButtonItem:", v69);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v55, "setSourceView:", v69);
            -[UIBarButtonItem frame](v69, "frame");
            objc_msgSend(v55, "setSourceRect:");
          }
        }
        objc_msgSend(v55, "setDelegate:", val);
      }
      -[PUPhotosGridViewController presentViewController:animated:completion:](val, "presentViewController:animated:completion:", v51, 1, 0);

    }
    else if (v59)
    {
      v43 = -[PUPhotosGridViewController _deleteActionForBarButtonItem:](val, "_deleteActionForBarButtonItem:", v69);
      v44 = objc_alloc(MEMORY[0x1E0D7B718]);
      -[PUPhotosGridViewController undoManager](val, "undoManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v44, "initWithAction:assets:undoManager:delegate:", v43, v40, v45, val);

      -[PUPhotosGridViewController _setDeleteActionController:](val, "_setDeleteActionController:", v46);
      v61[2]();
      v74[0] = v39;
      v74[1] = 3221225472;
      v74[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_9;
      v74[3] = &unk_1E58ABAC8;
      v75 = v64;
      v72[0] = v39;
      v72[1] = 3221225472;
      v72[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_10;
      v72[3] = &unk_1E58AB7D8;
      v72[4] = val;
      v73 = v66;
      objc_msgSend(v46, "performWithWillDeleteHandler:completionHandler:", v74, v72);

    }
    objc_destroyWeak(&v88);

    objc_destroyWeak(&v93);
    objc_destroyWeak(&v96);
    objc_destroyWeak((id *)buf);

  }
LABEL_15:

}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = objc_msgSend(a3, "action");
  -[PUPhotosGridViewController _setRemoveActionSheet:](self, "_setRemoveActionSheet:", v6);
  objc_msgSend(v6, "popoverPresentationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController _referenceBarButtonItemForDeleteAction:](self, "_referenceBarButtonItemForDeleteAction:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBarButtonItem:", v8);
  objc_msgSend(v9, "setDelegate:", self);
  -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)setCustomDoneButtonItem:(id)a3
{
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  v5 = (UIBarButtonItem *)a3;
  if (self->_customDoneButtonItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customDoneButtonItem, a3);
    -[PUPhotosGridViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
    v5 = v6;
  }

}

- (void)handleToggleSelectionOfItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v4, "section"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v4, "item"), v10);

  v7 = v6 ^ 1u;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "section");

  -[PUPhotosGridViewController setSelected:itemsAtIndexes:inSection:animated:](self, "setSelected:itemsAtIndexes:inSection:animated:", v7, v8, v9, 0);
}

- (void)handleNavigateToAsset:(id)a3 inContainer:(id)a4
{
  -[PUPhotosGridViewController navigateToPhoto:inAssetContainer:animated:](self, "navigateToPhoto:inAssetContainer:animated:", a3, a4, 1);
}

- (BOOL)shouldPerformAutomaticContentOffsetAdjustment
{
  return 0;
}

- (void)_saveAnchorForAutomaticContentOffsetAdjustment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  PHAssetCollection *v16;
  PHAssetCollection *visibleReferenceAssetContainerBeforeChange;
  double v18;
  NSIndexSet *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSIndexSet *visibleSectionsBeforeChange;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[PUPhotosGridViewController shouldPerformAutomaticContentOffsetAdjustment](self, "shouldPerformAutomaticContentOffsetAdjustment"))goto LABEL_23;
  if (self->_visibleReferenceAssetBeforeChange)
    return;
  -[PUPhotosGridViewController _bestReferenceItemIndexPathWithTopBias:](self, "_bestReferenceItemIndexPathWithTopBias:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(v5, "collectionView"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {

LABEL_23:
    -[PUPhotosGridViewController _clearAutomaticContentOffsetSnapshot](self, "_clearAutomaticContentOffsetSnapshot");
    return;
  }
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController assetAtIndexPathIfSafe:](self, "assetAtIndexPathIfSafe:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;
  v27 = v11;
  if (!v10)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentOffset");
    v14 = v13;

    objc_storeStrong((id *)&self->_visibleReferenceAssetBeforeChange, v9);
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetCollectionForSection:", objc_msgSend(v3, "section"));
    v16 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    visibleReferenceAssetContainerBeforeChange = self->_visibleReferenceAssetContainerBeforeChange;
    self->_visibleReferenceAssetContainerBeforeChange = v16;

    objc_msgSend(v7, "frame");
    self->_visibleReferenceAssetRelativeYBeforeChange = v18 - v14;
    objc_storeStrong((id *)&self->_visibleReferenceAssetIndexPathBeforeChange, v3);
  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v19 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indexPathsForVisibleItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        -[NSIndexSet addIndex:](v19, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "section"));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v23);
  }

  visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange;
  self->_visibleSectionsBeforeChange = v19;

  if ((v27 & 1) == 0)
    goto LABEL_23;
}

- (void)_performAutomaticContentOffsetAdjustment
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  if (-[PUPhotosGridViewController shouldPerformAutomaticContentOffsetAdjustment](self, "shouldPerformAutomaticContentOffsetAdjustment"))
  {
    if (self->_visibleReferenceAssetBeforeChange)
    {
      if (self->_visibleReferenceAssetContainerBeforeChange)
      {
        -[PUPhotosGridViewController collectionView](self, "collectionView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "contentOffset");
        v5 = v4;
        v7 = v6;

        -[PUPhotosGridViewController stableUpdatesContentOffsetForProposedContentOffset:](self, "stableUpdatesContentOffsetForProposedContentOffset:", v5, v7);
        v10 = v9;
        v11 = v8;
        if (v5 != v9 || v7 != v8)
        {
          -[PUPhotosGridViewController collectionView](self, "collectionView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setContentOffset:", v10, v11);

          -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invalidateLayoutForVerticalScroll");

        }
      }
    }
  }
  -[PUPhotosGridViewController _clearAutomaticContentOffsetSnapshot](self, "_clearAutomaticContentOffsetSnapshot");
}

- (void)_clearAutomaticContentOffsetSnapshot
{
  PHAsset *visibleReferenceAssetBeforeChange;
  PHAssetCollection *visibleReferenceAssetContainerBeforeChange;
  NSIndexPath *visibleReferenceAssetIndexPathBeforeChange;
  NSIndexSet *visibleSectionsBeforeChange;

  visibleReferenceAssetBeforeChange = self->_visibleReferenceAssetBeforeChange;
  self->_visibleReferenceAssetBeforeChange = 0;

  visibleReferenceAssetContainerBeforeChange = self->_visibleReferenceAssetContainerBeforeChange;
  self->_visibleReferenceAssetContainerBeforeChange = 0;

  visibleReferenceAssetIndexPathBeforeChange = self->_visibleReferenceAssetIndexPathBeforeChange;
  self->_visibleReferenceAssetIndexPathBeforeChange = 0;

  self->_visibleReferenceAssetRelativeYBeforeChange = 0.0;
  visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange;
  self->_visibleSectionsBeforeChange = 0;

}

- (CGPoint)stableUpdatesContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  PHAsset *visibleReferenceAssetBeforeChange;
  PHAsset *v7;
  PHAssetCollection *v8;
  NSIndexPath *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  CGPoint result;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  visibleReferenceAssetBeforeChange = self->_visibleReferenceAssetBeforeChange;
  if (visibleReferenceAssetBeforeChange && self->_visibleReferenceAssetContainerBeforeChange)
  {
    v7 = visibleReferenceAssetBeforeChange;
    v8 = self->_visibleReferenceAssetContainerBeforeChange;
    v9 = self->_visibleReferenceAssetIndexPathBeforeChange;
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForAsset:hintIndexPath:hintCollection:", v7, v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v13, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        y = CGRectGetMinY(v19) - self->_visibleReferenceAssetRelativeYBeforeChange;

      }
    }

  }
  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)_shouldUpdateCollectionView
{
  BOOL v3;

  v3 = -[PUPhotosGridViewController isCurrentCollectionViewDataSource](self, "isCurrentCollectionViewDataSource");
  return v3 & -[PUPhotosGridViewController px_isVisible](self, "px_isVisible");
}

- (void)photosDataSourceWillChange:(id)a3
{
  PHFetchResult *v4;
  PHFetchResult *collectionListFetchResultBeforeChange;

  objc_msgSend(a3, "collectionListFetchResult");
  v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  collectionListFetchResultBeforeChange = self->_collectionListFetchResultBeforeChange;
  self->_collectionListFetchResultBeforeChange = v4;

  if (-[PUPhotosGridViewController _shouldUpdateCollectionView](self, "_shouldUpdateCollectionView"))
    -[PUPhotosGridViewController _saveAnchorForAutomaticContentOffsetAdjustment](self, "_saveAnchorForAutomaticContentOffsetAdjustment");
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  -[PUPhotosGridViewController processDataSourceChange:](self, "processDataSourceChange:", a4);
}

- (void)processDataSourceChange:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t (**v18)(void);
  int v19;
  uint64_t v20;
  void *v21;
  PHFetchResult *collectionListFetchResultBeforeChange;
  id v23;

  v23 = a3;
  v4 = -[PUPhotosGridViewController _shouldUpdateCollectionView](self, "_shouldUpdateCollectionView");
  objc_msgSend(v23, "originatingPhotoLibraryChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v23, "originatingPhotoLibraryChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handlePhotoLibraryChange:", v8);

  }
  else
  {
    objc_msgSend(v6, "invalidateAllAssetIndexes");
  }

  -[PUPhotosGridViewController _invalidateCachedViewSizeTransitionContext](self, "_invalidateCachedViewSizeTransitionContext");
  if (v4)
  {
    if (objc_msgSend(v23, "hasIncrementalChanges")
      && !-[PUPhotosGridViewController shouldPerformFullReloadForIncrementalDataSourceChange:](self, "shouldPerformFullReloadForIncrementalDataSourceChange:", v23))
    {
      -[PUPhotosGridViewController updateInterfaceForIncrementalDataSourceChanges:](self, "updateInterfaceForIncrementalDataSourceChanges:", v23);
      -[PUPhotosGridViewController _clearAutomaticContentOffsetSnapshot](self, "_clearAutomaticContentOffsetSnapshot");
    }
    else
    {
      -[PUPhotosGridViewController beginBatchPreheating](self, "beginBatchPreheating");
      -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 1);
      -[PUPhotosGridViewController _performAutomaticContentOffsetAdjustment](self, "_performAutomaticContentOffsetAdjustment");
      -[PUPhotosGridViewController endBatchPreheating](self, "endBatchPreheating");
    }
    -[PUPhotosGridViewController pendingProcessDataSourceUpdateBlock](self, "pendingProcessDataSourceUpdateBlock");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PUPhotosGridViewController pendingProcessDataSourceUpdateBlock](self, "pendingProcessDataSourceUpdateBlock");
      v18 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v19 = v18[2]();

      if (v19)
        -[PUPhotosGridViewController setPendingProcessDataSourceUpdateBlock:](self, "setPendingProcessDataSourceUpdateBlock:", 0);
    }
    if (!-[PUPhotosGridViewController canDisplayEditButton](self, "canDisplayEditButton")
      && -[PUPhotosGridViewController isEditing](self, "isEditing"))
    {
      -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
    }
  }
  else
  {
    -[PUPhotosGridViewController setContentViewInSyncWithModel:](self, "setContentViewInSyncWithModel:", 0);
    -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayout");

    -[PUPhotosGridViewController _pushedPhotoBrowserController](self, "_pushedPhotoBrowserController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEmpty");

      if (v13)
      {
        -[PUPhotosGridViewController _pushedPhotoBrowserController](self, "_pushedPhotoBrowserController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pl_visitControllerHierarchyWithBlock:", &__block_literal_global_520_71800);

        -[PUPhotosGridViewController navigationController](self, "navigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v15, "popToViewController:animated:", self, 1);

      }
    }
  }
  -[PUPhotosGridViewController ppt_dataSourceChangeHandler](self, "ppt_dataSourceChangeHandler");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v23);
  collectionListFetchResultBeforeChange = self->_collectionListFetchResultBeforeChange;
  self->_collectionListFetchResultBeforeChange = 0;

}

- (BOOL)shouldPerformFullReloadForIncrementalDataSourceChange:(id)a3
{
  id v5;
  NSIndexSet *visibleSectionsBeforeChange;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "hasIncrementalChanges") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 3433, CFSTR("Must have incremental changes at this point"));

  }
  if (-[PUPhotosGridViewController isContentViewInSyncWithModel](self, "isContentViewInSyncWithModel"))
  {
    if ((objc_msgSend(v5, "changesAreNoOp") & 1) != 0
      || (visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange) == 0)
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      v7 = -[NSIndexSet pl_rangeCoveringIndexSet](visibleSectionsBeforeChange, "pl_rangeCoveringIndexSet");
      v9 = objc_msgSend(v5, "affectsSectionsInRange:", v7, v8) ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)updateLayoutMetrics
{
  void *v3;
  char isKindOfClass;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PUPhotosGridViewController collectionViewLayoutReferenceWidth](self, "collectionViewLayoutReferenceWidth");
    if (v5 > 0.0)
    {
      v6 = v5;
      -[PUPhotosGridViewController collectionViewLayoutReferenceSafeAreaInsets](self, "collectionViewLayoutReferenceSafeAreaInsets");
      PXEdgeInsetsForEdges();
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[PUPhotosGridViewController gridSpec](self, "gridSpec");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:", v15, v6, v8, v10, v12, v14);

    }
  }
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachedDefaultGlobalFooterHeight:", 0);

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");

  -[PUPhotosGridViewController _bestReferenceItemIndexPathWithTopBias:](self, "_bestReferenceItemIndexPathWithTopBias:", 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController assetAtIndexPathIfSafe:](self, "assetAtIndexPathIfSafe:", v10);

    }
  }
  -[PUPhotosGridViewController updateLayoutMetrics](self, "updateLayoutMetrics");
  -[PUPhotosGridViewController updateGlobalFooter](self, "updateGlobalFooter");

}

- (void)updatePeripheralInterfaceAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUPhotosGridViewController updateEmptyPlaceholderView](self, "updateEmptyPlaceholderView");
    -[PUPhotosGridViewController updateTitle](self, "updateTitle");
    -[PUPhotosGridViewController _updateToolbarContentsAnimated:](self, "_updateToolbarContentsAnimated:", v3);
    -[PUPhotosGridViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", v3);
    -[PUPhotosGridViewController _updateNavigationBannerAnimated:](self, "_updateNavigationBannerAnimated:", v3);
    -[PUPhotosGridViewController _updateGlobalHeaderVisibility](self, "_updateGlobalHeaderVisibility");
    -[PUPhotosGridViewController updateGlobalFooter](self, "updateGlobalFooter");
  }
}

- (void)_updateSelectionForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  char v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = -[PUPhotosGridViewController isEditing](self, "isEditing");
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSelectingAssets");

  if ((v7 & 1) != 0 || v9)
  {
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v6, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v6, "item"), v11);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v13, "setSelectionBadgeVisible:", v10);

}

- (void)_updateProgressForCellAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PUPhotosGridViewController _updateProgressForCell:atIndexPath:](self, "_updateProgressForCell:atIndexPath:", v5, v6);

}

- (void)_updateProgressForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PUPhotosGridViewController _updateAllProgressInfoIndexPaths](self, "_updateAllProgressInfoIndexPaths");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressInfosByCachedIndexPath, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "progress");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v10, "setProgress:", v9);

}

- (void)_updateCollectionViewMultipleSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v9))
        {
          objc_msgSend(v3, "cellForItemAtIndexPath:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotosGridViewController _updateSelectionForCell:atIndexPath:](self, "_updateSelectionForCell:atIndexPath:", v10, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _PUPhotosGridProgressInfo *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *progressInfosByIdentifier;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(_PUPhotosGridProgressInfo);
  -[_PUPhotosGridProgressInfo setIdentifier:](v11, "setIdentifier:", v10);
  -[_PUPhotosGridProgressInfo setAsset:](v11, "setAsset:", v8);

  -[_PUPhotosGridProgressInfo setCollection:](v11, "setCollection:", v7);
  -[_PUPhotosGridProgressInfo setProgress:](v11, "setProgress:", 0.0);
  if (!self->_progressInfosByCachedIndexPath)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressInfosByIdentifier = self->_progressInfosByIdentifier;
    self->_progressInfosByIdentifier = v12;

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_progressInfosByIdentifier, "setObject:forKeyedSubscript:", v11, v10);
  -[PUPhotosGridViewController _updateIndexPathForProgressInfo:](self, "_updateIndexPathForProgressInfo:", v11);
  -[_PUPhotosGridProgressInfo cachedIndexPath](v11, "cachedIndexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[PUPhotosGridViewController _updateProgressForCellAtIndexPath:](self, "_updateProgressForCellAtIndexPath:", v14);

  return v10;
}

- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4
{
  double v6;
  void *v7;
  id v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressInfosByIdentifier, "objectForKeyedSubscript:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "progress");
  if (v6 != a4)
  {
    objc_msgSend(v8, "setProgress:", a4);
    -[PUPhotosGridViewController _updateIndexPathForProgressInfo:](self, "_updateIndexPathForProgressInfo:", v8);
    objc_msgSend(v8, "cachedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _updateProgressForCellAtIndexPath:](self, "_updateProgressForCellAtIndexPath:", v7);

  }
}

- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  NSMutableDictionary *progressInfosByIdentifier;
  id v8;
  void *v9;
  id v10;

  progressInfosByIdentifier = self->_progressInfosByIdentifier;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](progressInfosByIdentifier, "objectForKeyedSubscript:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_progressInfosByIdentifier, "removeObjectForKey:", v8);

  objc_msgSend(v10, "cachedIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_progressInfosByCachedIndexPath, "removeObjectForKey:", v9);
    -[PUPhotosGridViewController _updateProgressForCellAtIndexPath:](self, "_updateProgressForCellAtIndexPath:", v9);
  }

}

- (void)presentAlertController:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PUPhotosGridViewController px_isVisible](self, "px_isVisible"))
    -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_updateIndexPathForProgressInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *progressInfosByCachedIndexPath;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "cachedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForAsset:inCollection:", v6, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setCachedIndexPath:", v4);
    progressInfosByCachedIndexPath = self->_progressInfosByCachedIndexPath;
    if (!progressInfosByCachedIndexPath)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_progressInfosByCachedIndexPath;
      self->_progressInfosByCachedIndexPath = v9;

      progressInfosByCachedIndexPath = self->_progressInfosByCachedIndexPath;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](progressInfosByCachedIndexPath, "setObject:forKeyedSubscript:", v11, v4);
  }

}

- (void)_invalidateAllProgressInfoIndexPaths
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_progressInfosByCachedIndexPath, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_530_71794);
  -[NSMutableDictionary removeAllObjects](self->_progressInfosByCachedIndexPath, "removeAllObjects");
}

- (void)_updateAllProgressInfoIndexPaths
{
  NSMutableDictionary *progressInfosByIdentifier;
  _QWORD v3[5];

  progressInfosByIdentifier = self->_progressInfosByIdentifier;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PUPhotosGridViewController__updateAllProgressInfoIndexPaths__block_invoke;
  v3[3] = &unk_1E58A63D0;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](progressInfosByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)_updateGlobalHeaderVisibility
{
  double v3;
  double v4;
  id v5;

  -[PUPhotosGridViewController globalHeaderHeight](self, "globalHeaderHeight");
  v4 = v3;
  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlobalHeaderHeight:", v4);

}

- (void)updateGlobalFooter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalFooterIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUGridGlobalFooter"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController updateGlobalFooterUsingFooterView:](self, "updateGlobalFooterUsingFooterView:", v6);
}

- (void)updateGlobalFooterUsingFooterView:(id)a3
{
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  float v14;
  id v15;
  id v16;

  v15 = a3;
  if (-[PUPhotosGridViewController _appearState](self, "_appearState") == 1
    && -[PUPhotosGridViewController isContentViewInSyncWithModel](self, "isContentViewInSyncWithModel")
    || -[PUPhotosGridViewController px_isVisible](self, "px_isVisible")
    && -[PUPhotosGridViewController isCurrentCollectionViewDataSource](self, "isCurrentCollectionViewDataSource"))
  {
    -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    if (!-[PUPhotosGridViewController wantsGlobalFooter](self, "wantsGlobalFooter"))
    {
LABEL_14:
      objc_msgSend(v4, "setGlobalFooterHeight:", v5);

      goto LABEL_15;
    }
    objc_msgSend(v4, "cachedDefaultGlobalFooterHeight");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "cachedDefaultGlobalFooterHeight");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      if (v9 != 0.0)
      {

        v10 = v15;
        if (!v15)
        {
          v15 = 0;
          goto LABEL_13;
        }
LABEL_12:
        v15 = v10;
        -[PUPhotosGridViewController configureGlobalFooterView:](self, "configureGlobalFooterView:", v10);
        -[PUPhotosGridViewController collectionViewLayoutReferenceWidth](self, "collectionViewLayoutReferenceWidth");
        objc_msgSend(v15, "sizeThatFits:");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setCachedDefaultGlobalFooterHeight:", v12);

LABEL_13:
        objc_msgSend(v4, "cachedDefaultGlobalFooterHeight");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v5 = v14;

        goto LABEL_14;
      }

    }
    v10 = v15;
    if (!v15)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D7B7E0]);
      objc_msgSend(v16, "setNeedsLayout");
      v10 = v16;
    }
    goto LABEL_12;
  }
LABEL_15:

}

- (void)_updateContentOffsetForPendingViewSizeTransition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  CGRect v16;

  -[PUPhotosGridViewController _pendingViewSizeTransitionContext](self, "_pendingViewSizeTransitionContext");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PUPhotosGridViewController collectionView](self, "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      CGRectGetWidth(v16);

      -[PUPhotosGridViewController collectionViewLayoutReferenceWidth](self, "collectionViewLayoutReferenceWidth");
      if (PXFloatApproximatelyEqualToFloat())
      {
        -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotosGridViewController collectionView](self, "collectionView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "contentOffset");
        v7 = v6;
        v9 = v8;

        objc_msgSend(v4, "targetContentOffsetForViewSizeTransitionContext:", v15);
        v12 = v11;
        v13 = v10;
        if (v7 != v11 || v9 != v10)
        {
          -[PUPhotosGridViewController collectionView](self, "collectionView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setContentOffset:", v12, v13);

          objc_msgSend(v4, "invalidateLayout");
        }
        -[PUPhotosGridViewController _setPendingViewSizeTransitionContext:](self, "_setPendingViewSizeTransitionContext:", 0);

      }
    }
  }

}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a3;
  -[PUPhotosGridViewController _barsHelper](self, "_barsHelper");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidateNavigationBarItems");
  objc_msgSend(v15, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "prompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v15, "shouldHideBackButton");
  objc_msgSend(v15, "leftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightBarButtonItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setTitle:animated:matchBarButtonItemAnimationDuration:", v5, v3, 1);
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PUPhotosGridViewController_updateNavigationBarAnimated___block_invoke;
  v16[3] = &unk_1E58ABCA8;
  v12 = v10;
  v17 = v12;
  v18 = v6;
  v13 = v6;
  objc_msgSend(v11, "performWithoutAnimation:", v16);
  objc_msgSend(v12, "setHidesBackButton:animated:", v7, v3);
  LODWORD(v11) = objc_msgSend(v12, "pu_shouldUpdateLeftBarButtonItems:", v8);
  v14 = objc_msgSend(v12, "pu_shouldUpdateRightBarButtonItems:", v9);
  if ((_DWORD)v11)
    objc_msgSend(v12, "setLeftBarButtonItems:animated:", v8, v3);
  if (v14)
    objc_msgSend(v12, "setRightBarButtonItems:animated:", v9, v3);

}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __CFString *v20;
  void *v21;
  _BOOL4 v22;
  int v23;
  _BOOL4 v24;
  _BOOL4 v25;
  BOOL v26;
  _BOOL4 v27;
  char v28;
  void *v29;
  char v30;
  id *v31;
  void *v32;
  int v33;
  id v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id *v40;
  _BOOL4 v41;
  UIBarButtonItem *slideshowButtonSpacer;
  UIBarButtonItem *v43;
  UIBarButtonItem *v44;
  void *v45;
  double v46;
  double v47;
  UIBarButtonItem *slideshowButton;
  id v49;
  void *v50;
  UIBarButtonItem *v51;
  UIBarButtonItem *v52;
  id *v53;
  BOOL v54;
  id *v55;
  BOOL *v56;
  id *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  id v64;
  id *v68;
  void *v69;
  id v70;
  void *v71;
  int v72;
  void *v73;

  v10 = -[PUPhotosGridViewController isEditing](self, "isEditing");
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSelectingAssets");

  if (v12
    && (-[PUPhotosGridViewController sessionInfo](self, "sessionInfo"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "promptLocation"),
        v13,
        !v14))
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedPrompt");
    v70 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = 0;
  }
  if (v10)
    -[PUPhotosGridViewController localizedSelectionTitle](self, "localizedSelectionTitle");
  else
    -[PUPhotosGridViewController title](self, "title");
  v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a3 = v64;
  -[PUPhotosGridViewController customDoneButtonItem](self, "customDoneButtonItem");
  v15 = objc_claimAutoreleasedReturnValue();
  v72 = v10;
  if (v12)
  {
    -[PUPhotosGridViewController _selectSessionDoneBarButtonItem](self, "_selectSessionDoneBarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _selectSessionCancelBarButtonItem](self, "_selectSessionCancelBarButtonItem");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PUPhotosGridViewController canDisplayEditButton](self, "canDisplayEditButton"))
    {
      -[PUPhotosGridViewController editButtonItem](self, "editButtonItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[PUPhotosGridViewController _cancelButtonItem](self, "_cancelButtonItem");
        v17 = objc_claimAutoreleasedReturnValue();

        v73 = 0;
        v18 = 1;
        v16 = (void *)v17;
        goto LABEL_20;
      }
      if (-[PUPhotosGridViewController isEmpty](self, "isEmpty"))
        v20 = CFSTR("EDIT");
      else
        v20 = CFSTR("SELECT");
      PULocalizedString(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v21);

    }
    else
    {
      v16 = 0;
    }
    v73 = 0;
  }
  v18 = 0;
LABEL_20:
  v68 = a3;
  v69 = (void *)v15;
  if (v15)
  {
    v22 = -[PUPhotosGridViewController showsCustomDoneButtonItemOnLeft](self, "showsCustomDoneButtonItemOnLeft");
    v23 = !-[PUPhotosGridViewController showsCustomDoneButtonItemOnLeft](self, "showsCustomDoneButtonItemOnLeft");
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  v24 = -[PUPhotosGridViewController showsSelectionSessionCancelButtonItemOnLeft](self, "showsSelectionSessionCancelButtonItemOnLeft");
  if (v73)
    v25 = v24;
  else
    v25 = 0;
  v71 = v16;
  if (((v18 | !v22) & 1) != 0)
  {
    v26 = v16 == 0;
    v27 = v16 != 0;
    if (v26)
      v28 = 0;
    else
      v28 = v23;
    if ((v28 & 1) == 0)
    {
      v29 = 0;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v15);
  v26 = v16 == 0;
  v27 = v16 != 0;
  if (v26)
    v30 = 0;
  else
    v30 = v23;
  if ((v30 & 1) != 0)
  {
    if (v29)
    {
LABEL_38:
      objc_msgSend(v29, "addObject:", v71);
      v27 = 1;
      goto LABEL_39;
    }
LABEL_37:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
LABEL_39:
  if (((v72 ^ 1 | v12) & 1) == 0)
  {
    v31 = a7;
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "canDisplayEditActionsInNavigationBar");

    if (v33)
    {
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = -[PUPhotosGridViewController _newEditActionItemsWithWideSpacing:](self, "_newEditActionItemsWithWideSpacing:", 0);
      objc_msgSend(v29, "addObjectsFromArray:", v34);

    }
    a7 = v31;
  }
  if (v25)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "addObject:", v73);
  }
  v35 = v23 ^ 1;
  if (((v18 | v23 ^ 1) & 1) != 0)
  {
    v36 = v69;
    v37 = v72;
    if ((v35 & v27) == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v71);
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v69;
    objc_msgSend(v38, "addObject:", v69);
    v37 = v72;
  }
  if (((v37 | v12) & 1) == 0 && !-[PUPhotosGridViewController isEmpty](self, "isEmpty"))
  {
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "canDisplaySlideshowButton") & 1) == 0)
    {

      if (v37)
        goto LABEL_67;
LABEL_73:
      v54 = objc_msgSend(v29, "count") != 0;
      goto LABEL_74;
    }
    v40 = a7;
    v41 = -[PUPhotosGridViewController allowSlideshowButton](self, "allowSlideshowButton");

    if (v41)
    {
      if (!v38)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      slideshowButtonSpacer = self->_slideshowButtonSpacer;
      if (!slideshowButtonSpacer)
      {
        v43 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
        v44 = self->_slideshowButtonSpacer;
        self->_slideshowButtonSpacer = v43;

        +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "photoCollectionToolbarTextTitleSpacerWidth");
        v47 = v46;

        -[UIBarButtonItem setWidth:](self->_slideshowButtonSpacer, "setWidth:", v47);
        slideshowButtonSpacer = self->_slideshowButtonSpacer;
      }
      objc_msgSend(v38, "addObject:", slideshowButtonSpacer);
      slideshowButton = self->_slideshowButton;
      if (!slideshowButton)
      {
        v49 = objc_alloc(MEMORY[0x1E0DC34F0]);
        PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_SLIDESHOW"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (UIBarButtonItem *)objc_msgSend(v49, "initWithTitle:style:target:action:", v50, 0, self, sel__slideshowButtonPressed_);
        v52 = self->_slideshowButton;
        self->_slideshowButton = v51;

        slideshowButton = self->_slideshowButton;
      }
      objc_msgSend(v38, "addObject:", slideshowButton);
    }
    a7 = v40;
  }
  if (!v37)
    goto LABEL_73;
LABEL_67:
  if (-[PUPhotosGridViewController isEmpty](self, "isEmpty")
    || !-[PUPhotosGridViewController allowSelectAllButton](self, "allowSelectAllButton"))
  {
    v54 = 1;
LABEL_74:
    v56 = a5;
    v55 = a6;
    v58 = v64;
    v57 = a4;
    goto LABEL_75;
  }
  v53 = a7;
  if (-[PUPhotosGridViewController _areAllAssetsSelected](self, "_areAllAssetsSelected"))
    -[PUPhotosGridViewController _deselectAllBarButtonItem](self, "_deselectAllBarButtonItem");
  else
    -[PUPhotosGridViewController _selectAllBarButtonItem](self, "_selectAllBarButtonItem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[PUPhotosGridViewController gridSpec](self, "gridSpec");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "shouldPlaceSelectAllButtonInRightNavigationBar");

    if (v62)
    {
      if (v38)
      {
        v63 = v38;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v63;
      }
    }
    else if (v29)
    {
      v63 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v63;
    }
    a7 = v53;
    v56 = a5;
    v55 = a6;
    v58 = v64;
    v57 = a4;
    objc_msgSend(v63, "addObject:", v60);
  }
  else
  {
    v56 = a5;
    v55 = a6;
    v58 = v64;
    v57 = a4;
  }

  v54 = 1;
LABEL_75:
  v59 = objc_retainAutorelease(v58);
  *v68 = v59;
  if (v57)
    *v57 = objc_retainAutorelease(v70);
  if (v56)
    *v56 = v54;
  if (v55)
    *v55 = objc_retainAutorelease(v29);
  if (a7)
    *a7 = objc_retainAutorelease(v38);

}

- (void)_updateToolbarContentsAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (-[PUPhotosGridViewController shouldShowToolbar](self, "shouldShowToolbar", a3))
    v4 = -[PUPhotosGridViewController newToolbarItems](self, "newToolbarItems");
  else
    v4 = 0;
  -[PUPhotosGridViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIViewController pu_toolbarViewModel](self, "pu_toolbarViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__PUPhotosGridViewController__updateToolbarContentsAnimated___block_invoke;
    v9[3] = &unk_1E58ABCA8;
    v10 = v7;
    v11 = v4;
    v8 = v7;
    objc_msgSend(v8, "performChanges:", v9);

  }
  else
  {
    if (-[PUPhotosGridViewController shouldShowToolbar](self, "shouldShowToolbar"))
      -[PUPhotosGridViewController setToolbarItems:](self, "setToolbarItems:", v4);
    -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 2, *MEMORY[0x1E0DC51A0]);
  }

}

- (id)_pickerBannerView
{
  void *v2;
  void *v3;
  void *v4;

  -[PUPhotosGridViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_banner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bannerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateNavigationBannerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PUPhotosGridViewController _pickerBannerView](self, "_pickerBannerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSelectingAssets") && objc_msgSend(v5, "promptLocation") == 1)
  {
    objc_msgSend(v5, "localizedPrompt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[PUPhotosGridViewController allowSelectAllButton](self, "allowSelectAllButton")
    && objc_msgSend(v5, "isSelectingAssets"))
  {
    -[PUPhotosGridViewController _selectionButton](self, "_selectionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUPhotosGridViewController _areAllAssetsSelected](self, "_areAllAssetsSelected"))
      v8 = CFSTR("DESELECT_ALL_BUTTON_TITLE");
    else
      v8 = CFSTR("SELECT_ALL_BUTTON_TITLE");
    PULocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);
    objc_msgSend(v7, "sizeToFit");

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v10, "setTitle:", v6);
  objc_msgSend(v10, "setLeftView:animated:", v7, v3);
  objc_msgSend(v10, "setRightView:animated:", 0, v3);

}

- (void)_updateSubviewsOrderingAndVisibility
{
  UIView *alternateContentView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[PUPhotosGridViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  alternateContentView = self->_alternateContentView;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (alternateContentView)
  {
    objc_msgSend(v4, "setHidden:", 1);

    -[PUPhotosGridViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 0);

    -[PUPhotosGridViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setHidden:", v8);

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendSubviewToBack:", v9);

  -[PUPhotosGridViewController _emptyPlaceholderView](self, "_emptyPlaceholderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bringSubviewToFront:", v10);

  -[UIView bringSubviewToFront:](self->_alternateContentView, "bringSubviewToFront:", self->_alternateContentView);
}

- (id)_selectSessionDoneBarButtonItem
{
  UIBarButtonItem *selectSessionDoneBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  selectSessionDoneBarButtonItem = self->_selectSessionDoneBarButtonItem;
  if (!selectSessionDoneBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleSelectSessionDoneButton_);
    v5 = self->_selectSessionDoneBarButtonItem;
    self->_selectSessionDoneBarButtonItem = v4;

    selectSessionDoneBarButtonItem = self->_selectSessionDoneBarButtonItem;
  }
  return selectSessionDoneBarButtonItem;
}

- (id)_selectSessionCancelBarButtonItem
{
  UIBarButtonItem *selectSessionCancelBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  selectSessionCancelBarButtonItem = self->_selectSessionCancelBarButtonItem;
  if (!selectSessionCancelBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleSelectSessionCancelButton_);
    v5 = self->_selectSessionCancelBarButtonItem;
    self->_selectSessionCancelBarButtonItem = v4;

    selectSessionCancelBarButtonItem = self->_selectSessionCancelBarButtonItem;
  }
  return selectSessionCancelBarButtonItem;
}

- (id)_cancelButtonItem
{
  UIBarButtonItem *cancelButtonItem;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PLLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel__handleCancelButton_);
    v7 = self->_cancelButtonItem;
    self->_cancelButtonItem = v6;

    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

- (id)_selectionButton
{
  UINavigationButton *selectionButton;
  UINavigationButton *v4;
  UINavigationButton *v5;

  selectionButton = self->_selectionButton;
  if (!selectionButton)
  {
    v4 = (UINavigationButton *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A38]), "initWithTitle:style:", &stru_1E58AD278, 0);
    v5 = self->_selectionButton;
    self->_selectionButton = v4;

    -[UINavigationButton addTarget:action:forControlEvents:](self->_selectionButton, "addTarget:action:forControlEvents:", self, sel__handleSelectionButton_, 64);
    -[UINavigationButton sizeToFit](self->_selectionButton, "sizeToFit");
    selectionButton = self->_selectionButton;
  }
  return selectionButton;
}

- (id)_selectAllBarButtonItem
{
  UIBarButtonItem *selectAllBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;

  selectAllBarButtonItem = self->_selectAllBarButtonItem;
  if (!selectAllBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E58AD278, 8, self, sel__handleSelectionButton_);
    v5 = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v4;

    PULocalizedString(CFSTR("SELECT_ALL_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_selectAllBarButtonItem, "setTitle:", v6);

    selectAllBarButtonItem = self->_selectAllBarButtonItem;
  }
  return selectAllBarButtonItem;
}

- (id)_deselectAllBarButtonItem
{
  UIBarButtonItem *deselectAllBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;

  deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
  if (!deselectAllBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E58AD278, 8, self, sel__handleSelectionButton_);
    v5 = self->_deselectAllBarButtonItem;
    self->_deselectAllBarButtonItem = v4;

    PULocalizedString(CFSTR("DESELECT_ALL_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_deselectAllBarButtonItem, "setTitle:", v6);

    deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
  }
  return deselectAllBarButtonItem;
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController"))
  {
    v13 = 0;
  }
  else
  {
    -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = objc_retainAutorelease(v12);
  *a3 = v17;
  v16 = objc_retainAutorelease(v13);
  *a4 = v16;
  *a5 = 0;
  *a6 = 0;

}

- (BOOL)wantsPlaceholderView
{
  _BOOL4 v3;

  v3 = -[PUPhotosGridViewController isEmpty](self, "isEmpty");
  if (v3)
    LOBYTE(v3) = !-[PUPhotosGridViewController wantsGlobalFooter](self, "wantsGlobalFooter");
  return v3;
}

- (void)updateEmptyPlaceholderView
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[PUPhotosGridViewController wantsPlaceholderView](self, "wantsPlaceholderView"))
    {
      objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v19 = 0;
      v16 = 0;
      v17 = 0;
      -[PUPhotosGridViewController getEmptyPlaceholderViewTitle:message:buttonTitle:buttonAction:](self, "getEmptyPlaceholderViewTitle:message:buttonTitle:buttonAction:", &v19, &v18, &v17, &v16);
      v4 = v19;
      v5 = v18;
      v6 = v17;
      v7 = v16;
      objc_msgSend(v3, "setText:", v4);
      objc_msgSend(v3, "setSecondaryText:", v5);
      objc_msgSend(v3, "buttonProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v6);

      v10 = (void *)MEMORY[0x1E0DC3428];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__PUPhotosGridViewController_updateEmptyPlaceholderView__block_invoke;
      v14[3] = &unk_1E58A63F8;
      v15 = v7;
      v11 = v7;
      objc_msgSend(v10, "actionWithHandler:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "buttonProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPrimaryAction:", v12);

      -[PUPhotosGridViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v3);
    }
    else
    {
      -[PUPhotosGridViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
    }
    -[PUPhotosGridViewController emptyPlaceholderViewDidChange](self, "emptyPlaceholderViewDidChange");
  }
}

- (void)updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUPhotosGridViewController beginBatchPreheating](self, "beginBatchPreheating");
    -[PUPhotosGridViewController _invalidateAllAssetIndexes](self, "_invalidateAllAssetIndexes");
    -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateLayout");

    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    -[PUPhotosGridViewController resetPreheating](self, "resetPreheating");
    -[PUPhotosGridViewController preheatAssets](self, "preheatAssets");
    -[PUPhotosGridViewController endBatchPreheating](self, "endBatchPreheating");
    -[PUPhotosGridViewController setContentViewInSyncWithModel:](self, "setContentViewInSyncWithModel:", 1);
    -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", v3);
    -[PUPhotosGridViewController _hideMenuIfNeeded](self, "_hideMenuIfNeeded");
  }
}

- (void)updateInterfaceForIncrementalDataSourceChanges:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  id v22;
  id v23;
  void (**v24)(void *, void *);
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  PUPhotosGridViewController *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v5 = a3;
  if ((objc_msgSend(v5, "hasIncrementalChanges") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 4135, CFSTR("Must have incremental changes to perform an incremental update"));

  }
  -[PUPhotosGridViewController _invalidateAllAssetIndexes](self, "_invalidateAllAssetIndexes");
  objc_msgSend(v5, "deletedSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertedSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletedIndexPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentChangedIndexPaths");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "favoriteChangedIndexPaths");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    v12 = 1;
  else
    v12 = objc_msgSend(v11, "count") != 0;
  if (objc_msgSend(v6, "count"))
    v13 = 1;
  else
    v13 = objc_msgSend(v9, "count") != 0;
  if (objc_msgSend(v7, "count"))
  {
    v27 = v11;
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    -[PUPhotosGridViewController photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUPhotosGridViewController-CollectionViewBatchUpdate"), 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke;
    v36[3] = &unk_1E58A9328;
    v37 = v6;
    v14 = v14;
    v38 = v14;
    v39 = v7;
    v40 = v9;
    v41 = v10;
    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_2;
    v34[3] = &unk_1E58AAE08;
    v34[4] = self;
    v35 = v16;
    v18 = v16;
    objc_msgSend(v14, "performBatchUpdates:completion:", v36, v34);
    if (v13)
    {
      -[PUPhotosGridViewController ppt_nextDeleteFinishedBlock](self, "ppt_nextDeleteFinishedBlock");
      v19 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[PUPhotosGridViewController ppt_setNextDeleteFinishedBlock:](self, "ppt_setNextDeleteFinishedBlock:", 0);
        v19[2](v19);
      }

    }
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pauseChangeDeliveryFor:identifier:", CFSTR("PUPhotosGridViewController-Padding"), 1.0);

    goto LABEL_16;
  }
  if (objc_msgSend(v10, "count"))
    v25 = 1;
  else
    v25 = v13;
  if ((v25 | v12) != 1)
    goto LABEL_19;
  v27 = v11;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v25)
    goto LABEL_11;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_3;
  aBlock[3] = &unk_1E58A6420;
  v31 = v14;
  v32 = v21;
  v33 = self;
  v22 = v21;
  v23 = v14;
  v24 = (void (**)(void *, void *))_Block_copy(aBlock);
  v24[2](v24, v29);
  v24[2](v24, v28);
  if (v8)
    -[PUPhotosGridViewController updateVisibleSectionHeadersAtIndexes:](self, "updateVisibleSectionHeadersAtIndexes:", v8);
  -[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 1);

  v11 = v27;
LABEL_19:
  -[PUPhotosGridViewController _hideMenuIfNeeded](self, "_hideMenuIfNeeded");
  -[PUPhotosGridViewController setContentViewInSyncWithModel:](self, "setContentViewInSyncWithModel:", 1);

}

- (void)updateVisibleSupplementaryViewsOfKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_indexPathsForVisibleSupplementaryViewsOfKind:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "_visibleSupplementaryViewOfKind:atIndexPath:", v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[PUPhotosGridViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v12, v4, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)imageForAsset:(id)a3 outIsPlaceholder:(BOOL *)a4
{
  return 0;
}

- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4
{
  -[PUPhotosGridViewController configureGridCell:forItemAtIndexPath:assetMayHaveChanged:](self, "configureGridCell:forItemAtIndexPath:assetMayHaveChanged:", a3, a4, 1);
}

- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4 assetMayHaveChanged:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  id v34;
  id v35;
  BOOL v36;
  id from;
  id location;
  _QWORD v39[3];
  char v40;
  char v41;
  _QWORD aBlock[4];
  id v43;
  PUPhotosGridViewController *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  unint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void *(*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  double v57;
  double v58;

  v8 = a3;
  v9 = a4;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollectionForSection:", objc_msgSend(v9, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController assetAtIndexPathIfSafe:](self, "assetAtIndexPathIfSafe:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PUPhotosGridViewController cellFillMode](self, "cellFillMode");
  -[PUPhotosGridViewController imageRequestItemPixelSize](self, "imageRequestItemPixelSize");
  v57 = v16;
  v58 = v17;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v18 = MEMORY[0x1E0C809B0];
  v54 = __Block_byref_object_copy__566;
  v55 = __Block_byref_object_dispose__567;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke;
  aBlock[3] = &unk_1E58A6448;
  v50 = a5;
  v19 = v14;
  v49 = v15;
  v43 = v19;
  v44 = self;
  v20 = v11;
  v45 = v20;
  v21 = v12;
  v46 = v21;
  v22 = v8;
  v47 = v22;
  v23 = v9;
  v48 = v23;
  v56 = _Block_copy(aBlock);
  -[PUPhotosGridViewController _cancelImageRequestForCell:](self, "_cancelImageRequestForCell:", v22);
  v41 = 0;
  -[PUPhotosGridViewController imageForAsset:outIsPlaceholder:](self, "imageForAsset:outIsPlaceholder:", v21, &v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    (*(void (**)(void))(v52[5] + 16))();
    v25 = 0;
  }
  else
  {
    v27 = v19;
    -[PUPhotosGridViewController imageRequestOptionsForAsset:pixelSize:](self, "imageRequestOptionsForAsset:pixelSize:", v21, &v57);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 0;
    objc_initWeak(&location, v22);
    objc_initWeak(&from, self);
    -[PUPhotosGridViewController _cachingImageManager](self, "_cachingImageManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_2;
    v29[3] = &unk_1E58A6470;
    objc_copyWeak(&v34, &location);
    objc_copyWeak(&v35, &from);
    v32 = &v51;
    v33 = v39;
    v30 = v21;
    v31 = v20;
    v36 = a5;
    v25 = objc_msgSend(v26, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v30, v15 < 2, v28, v29, v57, v58);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    _Block_object_dispose(v39, 8);

    v19 = v27;
  }
  objc_msgSend(v22, "setCurrentImageRequestID:", v25);

  _Block_object_dispose(&v51, 8);
}

- (id)imageRequestOptionsForAsset:(id)a3 pixelSize:(CGSize *)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v5, "setAllowPlaceholder:", 1);
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v5, "setDeliveryMode:", -[PUPhotosGridViewController imageDeliveryMode](self, "imageDeliveryMode"));
  return v5;
}

- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  _OWORD v30[2];
  __int128 v31;
  uint64_t v32;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(v12, "photoContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = !v8 || v7;
  if (v13)
  {
    if (v8 && (objc_msgSend(v13, "isCloudSharedAsset") & 1) == 0 && objc_msgSend(v13, "cloudPlaceholderKind") == 2)
    {
      v18 = 0;
      v19 = *MEMORY[0x1E0D7CE00];
      v31 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 8);
      v32 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 24);
      v20 = 1;
    }
    else
    {
      v21 = -[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController");
      v31 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 8);
      v32 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 24);
      if (v21)
      {
        v20 = 0;
        v19 = *MEMORY[0x1E0D7CE00];
        v18 = 1;
      }
      else
      {
        -[PUPhotosGridViewController _badgeManager](self, "_badgeManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "badgeInfoForAsset:inCollection:options:", v13, v14, 0);
          v24 = *(_QWORD *)&v30[0];
        }
        else
        {
          v24 = 0;
          memset(v30, 0, sizeof(v30));
        }
        v31 = *(_OWORD *)((char *)v30 + 8);
        v32 = *((_QWORD *)&v30[1] + 1);

        +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "badgeAllItemsAsFavorites");

        v18 = 0;
        v20 = 0;
        v19 = v24 | v26;
      }
    }
    *(_QWORD *)&v30[0] = v19;
    *(_OWORD *)((char *)v30 + 8) = v31;
    *((_QWORD *)&v30[1] + 1) = v32;
    objc_msgSend(v16, "setBadgeInfo:", v30);
    objc_msgSend(v16, "setTextBannerVisible:", v18);
    if ((_DWORD)v18)
    {
      LOBYTE(v30[0]) = 0;
      -[PUPhotosGridViewController _localizedBannerTextForAsset:isDestructive:](self, "_localizedBannerTextForAsset:isDestructive:", v13, v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textBannerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setText:", v27);
      -[PUPhotosGridViewController gridSpec](self, "gridSpec");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextAlignment:", objc_msgSend(v29, "cellBannerTextAlignment"));

      objc_msgSend(v28, "setDestructiveText:", LOBYTE(v30[0]));
    }
  }
  else
  {
    v20 = 0;
  }
  if (v17)
    objc_msgSend(v12, "setCloudIconVisible:", v20);

}

- (void)_cancelImageRequestForCell:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentImageRequestID");
  if ((_DWORD)v4)
  {
    v5 = v4;
    -[PUPhotosGridViewController _cachingImageManager](self, "_cachingImageManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelImageRequest:", v5);

    objc_msgSend(v7, "setCurrentImageRequestID:", 0);
  }

}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PUGridGlobalHeader")))
  {
    -[PUPhotosGridViewController configureGlobalHeaderView:](self, "configureGlobalHeaderView:", v9);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PUGridGlobalFooter")))
  {
    v8 = v9;
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setLayoutDelegate:", self);
    -[PUPhotosGridViewController configureGlobalFooterView:](self, "configureGlobalFooterView:", v8);

  }
}

- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  double v15;

  v4 = a4;
  v6 = a3;
  if (_configureAddPlaceholderCell_animated__onceToken != -1)
    dispatch_once(&_configureAddPlaceholderCell_animated__onceToken, &__block_literal_global_571_71759);
  v7 = 0.0;
  if (-[PUPhotosGridViewController isEditing](self, "isEditing"))
    v8 = 0.0;
  else
    v8 = 1.0;
  objc_msgSend(v6, "photoContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPhotoImage:", _configureAddPlaceholderCell_animated__image);
  objc_msgSend(v10, "setFillMode:", 0);
  objc_msgSend(v10, "setPhotoDecoration:", _configureAddPlaceholderCell_animated__decoration);
  v11 = (void *)MEMORY[0x1E0DC3F10];
  if (v4)
    v7 = 0.25;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke_2;
  v13[3] = &unk_1E58AACF0;
  v14 = v6;
  v15 = v8;
  v12 = v6;
  objc_msgSend(v11, "pu_animateWithDuration:animations:", v13, v7);

}

- (void)_updateBackButtonTitle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PUPhotosGridViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v16, "indexOfObject:", self);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4 + 1, v4 + 1 >= (unint64_t)objc_msgSend(v16, "count")))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v16, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v8 = isKindOfClass ^ 1;
  }
  -[PUPhotosGridViewController _pushedPhotoBrowserController](self, "_pushedPhotoBrowserController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && !-[PUPhotosGridViewControllerSpec wantsBackButtonTitleForPhotoBrowser](self->_gridSpec, "wantsBackButtonTitleForPhotoBrowser"))
  {

  }
  else
  {

    if ((v8 & 1) != 0)
    {
      -[PUPhotosGridViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PUPhotosGridViewController navigationItem](self, "navigationItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackBarButtonItem:", 0);
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  -[PUPhotosGridViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backBarButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E58AD278, 0, 0, 0);
    -[PUPhotosGridViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackBarButtonItem:", v12);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_ensureOneUpPresentationHelper
{
  PUOneUpPresentationHelper *v3;
  PUOneUpPresentationHelper *v4;
  void *v5;
  PUPhotoBrowserOneUpPresentationAdaptor *v6;

  -[PUPhotosGridViewController _photoBrowserOneUpPresentationAdaptor](self, "_photoBrowserOneUpPresentationAdaptor");
  v6 = (PUPhotoBrowserOneUpPresentationAdaptor *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(PUPhotoBrowserOneUpPresentationAdaptor);
    -[PUPhotoBrowserOneUpPresentationAdaptor setZoomTransitionDelegate:](v6, "setZoomTransitionDelegate:", self);
    -[PUPhotosGridViewController _setPhotoBrowserOneUpPresentationAdaptor:](self, "_setPhotoBrowserOneUpPresentationAdaptor:", v6);
  }
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v3 = (PUOneUpPresentationHelper *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [PUOneUpPresentationHelper alloc];
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[PUOneUpPresentationHelper initWithPhotosDataSource:](v4, "initWithPhotosDataSource:", v5);

    -[PUOneUpPresentationHelper setDelegate:](v3, "setDelegate:", self);
    -[PUOneUpPresentationHelper setAssetDisplayDelegate:](v3, "setAssetDisplayDelegate:", v6);
    -[PUPhotosGridViewController _setOneUpPresentationHelper:](self, "_setOneUpPresentationHelper:", v3);
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  char v20;
  _QWORD v21[4];
  id v22;

  y = a4.y;
  x = a4.x;
  -[PUPhotosGridViewController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !-[PUPhotosGridViewController allowedActions](self, "allowedActions"))
    goto LABEL_7;
  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "canCommitPreview") & 1) == 0)
  {

    goto LABEL_7;
  }
  v10 = -[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v8);

  if (v10)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  -[PUPhotosGridViewController previewViewControllerForItemAtIndexPath:](self, "previewViewControllerForItemAtIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = !-[PUPhotosGridViewController isInMultiSelectMode](self, "isInMultiSelectMode");
  v13 = (void *)MEMORY[0x1E0DC36B8];
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v21[3] = &unk_1E58A64B8;
  v22 = v11;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v18[3] = &unk_1E58A64E0;
  v20 = v12;
  v19 = v22;
  v15 = v22;
  objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v21, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v16;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "indexPathForItemAtPoint:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController _setPreviewingIndexPath:](self, "_setPreviewingIndexPath:", v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v12);

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  if (!-[PUPhotosGridViewController isInMultiSelectMode](self, "isInMultiSelectMode"))
  {
    objc_msgSend(v6, "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController _setPreviewCommitting:](self, "_setPreviewCommitting:", 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __111__PUPhotosGridViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E58ABCA8;
    v9[4] = self;
    v10 = v7;
    v8 = v7;
    objc_msgSend(v6, "addCompletion:", v9);

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  -[PUPhotosGridViewController _ensureOneUpPresentationHelper](self, "_ensureOneUpPresentationHelper");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "didDismissPreviewViewController:committing:", v8, -[PUPhotosGridViewController _previewCommitting](self, "_previewCommitting"));
  -[PUPhotosGridViewController _setPreviewCommitting:](self, "_setPreviewCommitting:", 0);
}

- (id)previewViewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[PUPhotosGridViewController _ensureOneUpPresentationHelper](self, "_ensureOneUpPresentationHelper");
    -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "canPresentOneUpViewControllerAnimated:", 1))
    {
      objc_msgSend(v6, "previewViewControllerForItemAtIndexPath:allowingActions:", v4, 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v5;
        objc_msgSend(v5, "createMenuActionControllerForManagerIfNeeded:withPresentingViewController:regionOfInterestProvider:", 0, self, 0);
        objc_msgSend(v5, "menuActionController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setDelegate:", self);
      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)menuActionController:(id)a3 didDismissWithActionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopForceIncludingAllAssets");

  LODWORD(v6) = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow.PUMenuActionController.share"));
  if ((_DWORD)v6)
  {
    -[PUPhotosGridViewController _previewingIndexPath](self, "_previewingIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PUPhotosGridViewController assetAtIndexPath:](self, "assetAtIndexPath:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetCollectionForSection:", objc_msgSend(v7, "section"));
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)MEMORY[0x1E0CD1390];
        -[NSObject localIdentifier](v8, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject photoLibrary](v8, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "px_standardLibrarySpecificFetchOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchAssetsWithLocalIdentifiers:options:", v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUPhotosGridViewController sender:shareAssetsInFetchResult:forAssetCollection:withCompletion:](self, "sender:shareAssetsInFetchResult:forAssetCollection:withCompletion:", 0, v16, v10, 0);
      }
      else
      {
        PLUIGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Missing asset for share operation", v17, 2u);
        }
      }

    }
    else
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Missing indexPath for share operation", v17, 2u);
      }
    }

  }
  -[PUPhotosGridViewController _setPreviewingIndexPath:](self, "_setPreviewingIndexPath:", 0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUPhotosGridViewController collectionListFetchResult](self, "collectionListFetchResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", a4);

  return v7
       + -[PUPhotosGridViewController wantsAddPlaceholderAtEndOfSection:](self, "wantsAddPlaceholderAtEndOfSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  if (-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v6))
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUAddPlaceholderCell"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController _configureAddPlaceholderCell:animated:](self, "_configureAddPlaceholderCell:animated:", v8, 0);
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUPhotoCell"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController configureGridCell:forItemAtIndexPath:](self, "configureGridCell:forItemAtIndexPath:", v8, v6);
  }

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v10, v9, v8);

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (!-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v7))
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isSelectingAssets") & 1) != 0)
      v9 = 1;
    else
      v9 = -[PUPhotosGridViewController isEditing](self, "isEditing");

    v10 = v9 & ~objc_msgSend(v6, "hasActiveDrag");
    objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUPhotosGridViewController canNavigateToPhotoInteractively:](self, "canNavigateToPhotoInteractively:", 0))
    {
      v12 = objc_msgSend(v11, "dragState");
      if ((v10 & 1) == 0)
      {
        if (!v12)
        {
          -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v7, "section"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotosGridViewController assetAtIndexPath:](self, "assetAtIndexPath:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotosGridViewController handleNavigateToAsset:inContainer:](self, "handleNavigateToAsset:inContainer:", v14, v13);

        }
        goto LABEL_13;
      }
    }
    else if (!v10)
    {
LABEL_13:

      goto LABEL_14;
    }
    -[PUPhotosGridViewController handleToggleSelectionOfItemAtIndexPath:](self, "handleToggleSelectionOfItemAtIndexPath:", v7);
    goto LABEL_13;
  }
  if ((-[PUPhotosGridViewController isEditing](self, "isEditing") & 1) == 0)
    -[PUPhotosGridViewController didSelectAddPlaceholderInSection:](self, "didSelectAddPlaceholderInSection:", objc_msgSend(v7, "section"));
LABEL_14:

  return 0;
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  void *v5;
  void *v6;

  -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  return 0;
}

- (void)sectionedGridLayout:(id)a3 didPrepareTransitionIsAppearing:(BOOL)a4
{
  if (a4)
    -[PUPhotosGridViewController preheatAssetsWithPrefetchingDisabled:](self, "preheatAssetsWithPrefetchingDisabled:", 1);
  else
    -[PUPhotosGridViewController resetPreheating](self, "resetPreheating", a3);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PUPhotosGridViewController _cancelImageRequestForCell:](self, "_cancelImageRequestForCell:", v6);

}

- (id)sectionedGridLayoutAnchorItemForAdjustingContentOffset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PUPhotosGridViewController bestReferenceItemIndexPath](self, "bestReferenceItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)sectionedGridLayoutTransitionAutoAdjustContentOffsetEnabled:(id)a3
{
  void *v3;
  char v4;

  -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesContentOffsetAutoAdjust");

  return v4;
}

- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint8_t v14[16];

  v5 = a4;
  if (v5)
  {
    v6 = -[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v5);
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
    if (!v6)
    {
      v9 = objc_msgSend(v5, "item");
      if (v9 < objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v5, "section")))
      {
        objc_msgSend(v7, "assetAtIndexPath:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "aspectRatio");
        v8 = v11;

      }
    }

  }
  else
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "IndexPath missing for aspectRatioForItemAtIndexPath", v14, 2u);
    }

    v8 = -1.0;
  }

  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[PUPhotosGridViewController isEditing](self, "isEditing");
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSelectingAssets");

  -[PUPhotosGridViewController longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v11);
    objc_msgSend(v11, "indexPathForItemAtPoint:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v10 = 0;
    else
      v10 = -[PUPhotosGridViewController shouldShowMenu](self, "shouldShowMenu");

  }
  else
  {
    -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v4)
    {
      if (((v5 | v7) & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v10 = 1;
        if (!-[PUPhotosGridViewController canNavigateToPhotoInteractively:](self, "canNavigateToPhotoInteractively:", 1))v10 = -[PUPhotosGridViewController canBeginStackCollapseTransition](self, "canBeginStackCollapseTransition");
      }
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PUPhotosGridViewController photoOrStackPinchGestureRecognizer](self, "photoOrStackPinchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[PUPhotosGridViewController _multiSelectInteraction](self, "_multiSelectInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gesturesForFailureRequirements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "containsObject:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handlePresentingPinchGestureRecognizer:", v17);

  v6 = v17;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v17, "state");
    -[PUPhotosGridViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pu_currentInteractiveTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIViewController pu_currentInteractiveNavigationTransition](self, "pu_currentInteractiveNavigationTransition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "updateInteractiveTransitionWithPhotoPinchGestureRecognizer:", v17);
    }
    else if (v7 == 2)
    {
      if (-[PUPhotosGridViewController canNavigateToPhotoInteractively:](self, "canNavigateToPhotoInteractively:", 1)
        && (objc_msgSend(v17, "velocity"), v13 > 0.0))
      {
        -[PUPhotosGridViewController collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locationInView:", v14);
        objc_msgSend(v14, "indexPathForItemAtPoint:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[PUPhotosGridViewController _beginInteractiveNavigationForItemAtIndexPath:](self, "_beginInteractiveNavigationForItemAtIndexPath:", v15);

      }
      else if (-[PUPhotosGridViewController canBeginStackCollapseTransition](self, "canBeginStackCollapseTransition"))
      {
        objc_msgSend(v17, "velocity");
        if (v16 < 0.0)
          -[PUPhotosGridViewController _beginInteractiveStackCollapse:](self, "_beginInteractiveStackCollapse:", v17);
      }
    }

    v6 = v17;
  }

}

- (BOOL)shouldShowMenu
{
  return !-[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController");
}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (objc_msgSend(v4, "state") != 1)
    goto LABEL_18;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v21 = 0;
  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", &v21, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  self->_isMenuIndexPathExact = objc_msgSend(v10, "isEqual:", v11);
  if (v10 || !v11)
  {
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v10 = v12;
LABEL_8:
  -[PUPhotosGridViewController _setMenuIndexPath:](self, "_setMenuIndexPath:", v10);
  if (-[PUPhotosGridViewController _hasAtLeastOneContainer](self, "_hasAtLeastOneContainer")
    && !self->_isMenuIndexPathExact
    && (-[PUPhotosGridViewController isEditing](self, "isEditing") & 1) == 0
    && !-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v10)
    && -[PUPhotosGridViewController shouldShowMenu](self, "shouldShowMenu"))
  {
    -[PUPhotosGridViewController becomeFirstResponder](self, "becomeFirstResponder");
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v10 && self->_isMenuIndexPathExact)
    {
      -[PUPhotosGridViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cellForItemAtIndexPath:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "center");
      v7 = v17;
      v9 = v18;

    }
    self->_showingMenu = 1;
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "showMenuFromView:rect:", v20, v7, v9, v13, v14);

  }
LABEL_18:

}

- (void)_hideMenuIfNeeded
{
  void *v3;
  void *v4;

  -[PUPhotosGridViewController _setMenuIndexPath:](self, "_setMenuIndexPath:", 0);
  if (self->_showingMenu)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideMenuFromView:", v4);

    self->_showingMenu = 0;
  }
}

- (void)_menuControllerDidHideMenu:(id)a3
{
  -[PUPhotosGridViewController _setMenuIndexPath:](self, "_setMenuIndexPath:", 0);
  self->_showingMenu = 0;
}

- (int64_t)swipeSelectionManager:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;

  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 4979, CFSTR("Section is out of bounds %li/%li"), a4, objc_msgSend(v13, "numberOfSections"));

  }
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", a4);

  return v10
       + -[PUPhotosGridViewController wantsAddPlaceholderAtEndOfSection:](self, "wantsAddPlaceholderAtEndOfSection:", a4);
}

- (id)swipeSelectionManager:(id)a3 photoCollectionAtIndex:(unint64_t)a4
{
  return -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", a4);
}

- (void)swipeSelectionManager:(id)a3 updatePhotoSelectionWithIndexes:(id)a4 inSection:(int64_t)a5 selectionMode:(int64_t)a6
{
  void *v9;
  void *v10;

  -[PUPhotosGridViewController _indexesWithoutPlaceholdersFromIndexes:inSection:](self, "_indexesWithoutPlaceholdersFromIndexes:inSection:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    -[PUPhotosGridViewController setSelected:itemsAtIndexes:inSection:animated:](self, "setSelected:itemsAtIndexes:inSection:animated:", a6 == 0, v9, a5, 0);
    v9 = v10;
  }

}

- (id)_indexesWithoutPlaceholdersFromIndexes:(id)a3 inSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "lastIndex");
  v8 = 0;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v10);

      if (v11)
      {
        if ((unint64_t)objc_msgSend(v6, "count") < 2)
        {
          v8 = 0;
        }
        else
        {
          v8 = (id)objc_msgSend(v6, "mutableCopy");
          objc_msgSend(v8, "removeIndex:", v9);
        }
      }
      else
      {
        v8 = v6;
      }
    }
  }

  return v8;
}

- (id)assetIndexPathForPhotoToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PUGridPhotoTokenIndexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PUGridPhotoTokenPhoto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PUGridPhotoTokenCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosGridViewController indexPathForAsset:hintCollection:hintIndexPath:](self, "indexPathForAsset:hintCollection:hintIndexPath:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)zoomTransition:(id)a3 photoTokenForPhoto:(id)a4 inCollection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForAsset:inCollection:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v7 && v8 && v10)
  {
    v13[0] = CFSTR("PUGridPhotoTokenIndexPath");
    v13[1] = CFSTR("PUGridPhotoTokenPhoto");
    v14[0] = v10;
    v14[1] = v7;
    v13[2] = CFSTR("PUGridPhotoTokenCollection");
    v14[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)zoomTransition:(id)a3 getFrame:(CGRect *)a4 inCoordinateSpace:(id *)a5 contentMode:(int64_t *)a6 cropInsets:(UIEdgeInsets *)a7 forPhotoToken:(id)a8 operation:(int64_t)a9
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double Height;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  BOOL v55;
  void *v57;
  id *v58;
  CGRect v59;

  v14 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 5055, CFSTR("Photo Token is invalid! (%@)"), v14);

  }
  -[PUPhotosGridViewController assetIndexPathForPhotoToken:](self, "assetIndexPathForPhotoToken:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_26;
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");
  objc_msgSend(v16, "cellForItemAtIndexPath:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a9 == 2)
  {
    objc_msgSend(v16, "collectionViewLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    Height = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v18;
      if (objc_msgSend(v20, "sectionHeadersEnabled"))
      {
        objc_msgSend(v20, "frameForSectionHeaderAtVisualSection:", objc_msgSend(v15, "section"));
        Height = CGRectGetHeight(v59);
      }

    }
    if (v17)
    {
      objc_msgSend(v17, "frame");
      objc_msgSend(v16, "scrollRectToVisible:animated:", 0, v21 + 0.0, v22 - Height);
    }
    else
    {
      v58 = a5;
      objc_msgSend(v16, "layoutAttributesForItemAtIndexPath:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionViewLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "layoutAttributesForItemAtIndexPath:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "frame");
      v27 = v26;
      objc_msgSend(v25, "frame");
      if (v27 == v28)
      {
        objc_msgSend(v16, "scrollToItemAtIndexPath:atScrollPosition:animated:", v15, 2, 0);
      }
      else
      {
        objc_msgSend(v25, "frame");
        objc_msgSend(v16, "scrollRectToVisible:animated:", 0, v29 + 0.0, v30 - Height);
      }
      objc_msgSend(v16, "layoutIfNeeded");
      objc_msgSend(v16, "cellForItemAtIndexPath:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      a5 = v58;
    }

  }
  if (v17)
  {
    objc_msgSend(v17, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[PUPhotosGridViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toView:", v39, v32, v34, v36, v38);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;

    v48 = -[PUPhotosGridViewController cellFillMode](self, "cellFillMode") != 1;
    -[PUPhotosGridViewController assetAtIndexPath:](self, "assetAtIndexPath:", v15);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v15, "section"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "representsBurst") && objc_msgSend(v50, "canShowAvalancheStacks"))
    {
      objc_msgSend(MEMORY[0x1E0D715B8], "frameOfTopImageInStackForStackFrame:", v41, v43, v45, v47);
      v41 = v51;
      v43 = v52;
      v45 = v53;
      v47 = v54;
    }
    if (a4)
    {
      a4->origin.x = v41;
      a4->origin.y = v43;
      a4->size.width = v45;
      a4->size.height = v47;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
    }
    if (a6)
      *a6 = v48;

    v55 = 1;
  }
  else
  {
LABEL_26:
    v55 = 0;
  }

  return v55;
}

- (void)zoomTransition:(id)a3 shouldHidePhotoTokens:(id)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  SEL v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v7 = a4;
  -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v10)
  {
    v11 = v10;
    v20 = a2;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v20, self, CFSTR("PUPhotosGridViewController.m"), 5139, CFSTR("Photo Token is invalid! (%@)"), v15);

        }
        -[PUPhotosGridViewController assetIndexPathForPhotoToken:](self, "assetIndexPathForPhotoToken:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          PLUIGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = 0;
            v28 = 2112;
            v29 = v8;
            _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "Cannot hide item at index path: %@ Layout: %@", buf, 0x16u);
          }

          goto LABEL_17;
        }
        v17 = (void *)v16;
        if (!v12)
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
        objc_msgSend(v12, "addObject:", v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
LABEL_17:
    v12 = 0;
  }

  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EEC9F5E8))
    objc_msgSend(v8, "setHiddenItemIndexPaths:", v12);

}

- (void)zoomTransition:(id)a3 willBeginForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v6;

  if (a5 && a6)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView", a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 0);

  }
}

- (void)zoomTransition:(id)a3 didFinishForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v6;

  if (a5 && a6)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView", a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 1);

  }
}

- (BOOL)zoomTransition:(id)a3 transitionImageForPhotoToken:(id)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 5176, CFSTR("Photo Token is invalid! (%@)"), v8);

  }
  v10 = v8;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUGridPhotoTokenPhoto"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isRAW"))
  {
    -[PUPhotosGridViewController assetIndexPathForPhotoToken:](self, "assetIndexPathForPhotoToken:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "photoContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17 != 0;
    if (v17)
      v9[2](v9, v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_updatePhotoDecorationForCell:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  -[PUPhotosGridViewController albumListTransitionContext](self, "albumListTransitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoDecoration");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "photoContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhotoDecoration:", v9);

}

- (void)setAlbumListTransitionContext:(id)a3
{
  PUAlbumListTransitionContext *v5;
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
  v5 = (PUAlbumListTransitionContext *)a3;
  if (self->_albumListTransitionContext != v5)
  {
    objc_storeStrong((id *)&self->_albumListTransitionContext, a3);
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "indexPathsForVisibleItems", 0);
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
          if (!-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v12))
          {
            objc_msgSend(v6, "cellForItemAtIndexPath:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotosGridViewController _updatePhotoDecorationForCell:animated:](self, "_updatePhotoDecorationForCell:animated:", v13, 0);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)setAlbumListTransitionLayout:(id)a3 animated:(BOOL)a4
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
  -[PUPhotosGridViewController _albumListTransitionLayout](self, "_albumListTransitionLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__albumListTransitionLayout, a3);
    if (v12)
    {
      v9 = v12;
    }
    else
    {
      -[PUPhotosGridViewController mainGridLayout](self, "mainGridLayout");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionViewLayout:animated:", v10, v4);

    v8 = v12;
  }

}

- (void)_beginInteractiveNavigationForItemAtIndexPath:(id)a3
{
  -[PUPhotosGridViewController _navigateToPhotoAtIndexPath:animated:interactive:](self, "_navigateToPhotoAtIndexPath:animated:interactive:", a3, 1, 1);
}

- (void)_beginInteractiveStackCollapse:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  -[PUPhotosGridViewController gridSpec](self, "gridSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesStackPopTransition");

  v6 = v17;
  if (v5)
  {
    -[UIViewController pu_navigationTransition](self, "pu_navigationTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PUPhotosGridViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "locationInView:", v8);
      v10 = v9;
      v12 = v11;
      objc_msgSend(v8, "contentOffset");
      v14 = v13;
      objc_msgSend(v8, "contentInset");
      objc_msgSend(v7, "setInteractionCenter:", v10, v12 - (v14 + v15));
      objc_msgSend(v7, "startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:", v17, 0);
      -[PUPhotosGridViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pu_popViewControllerAnimated:interactive:", 1, 1);

    }
    v6 = v17;
  }

}

- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PUPhotosGridViewController _ensureOneUpPresentationHelper](self, "_ensureOneUpPresentationHelper");
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentOneUpViewControllerFromAssetAtIndexPath:animated:interactiveMode:activity:editActivityCompletion:", v8, v6, v5, 0, 0);

}

- (void)navigateToPhotosDetailsForAssetCollection:(id)a3
{
  -[PUPhotosGridViewController navigateToPhotosDetailsForAssetCollection:animated:](self, "navigateToPhotosDetailsForAssetCollection:animated:", a3, 1);
}

- (void)navigateToPhotosDetailsForAssetCollection:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  void *v30;
  _QWORD v31[2];

  v24 = a4;
  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUPhotosGridViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD14E0];
  v31[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientCollectionListWithCollections:title:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v9, 0);
  v29 = v5;
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExistingAssetCollectionFetchResults:", v11);

  objc_msgSend(v10, "setHideHiddenAssets:", 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v10);
  v13 = objc_msgSend(v5, "titleCategory");
  if (v13)
    v14 = v13;
  else
    v14 = 6;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke;
  aBlock[3] = &unk_1E58A6508;
  v16 = v5;
  v28 = v16;
  v17 = _Block_copy(aBlock);
  -[PUPhotosGridViewController displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:preferredAttributesPromise:](self, "displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:preferredAttributesPromise:", v16, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B7A0]), "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v12, v18, 0, 0);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke_2;
  v25[3] = &unk_1E58A6530;
  v26 = v16;
  v20 = v16;
  objc_msgSend(v19, "performChanges:", v25);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B7D0]), "initWithContext:options:", v19, 0);
  -[PUPhotosGridViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pushViewController:animated:", v21, v24);

}

- (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  _BYTE buf[22];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLMemoriesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEBUG, "Creating display title info from asset collection %@", buf, 0xCu);
  }

  PLMemoriesGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "localizedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedSubtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEBUG, "Asset collection title:'%@' subtitle:'%@'", buf, 0x16u);

  }
  PLMemoriesGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[PUPhotosGridViewController localizedTitleForAssetCollection:](self, "localizedTitleForAssetCollection:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEBUG, "UI title:'%@'", buf, 0xCu);

  }
  PLMemoriesGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "descriptionOfTitleCategory:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a4;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v17;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEBUG, "Title category:%i “%@”", buf, 0x12u);

  }
  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "allowDynamicDetailsTitles");

  if ((v19 & 1) == 0)
  {

    v9 = 0;
  }
  *(_QWORD *)buf = a4;
  -[PUPhotosGridViewController localizedTitleForAssetCollection:titleCategory:](self, "localizedTitleForAssetCollection:titleCategory:", v8, buf);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7CD38], "defaultHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "titleForDisplayableText:titleCategory:options:", v20, *(_QWORD *)buf, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "simulatedDetailsAttributesLoadingDelay");
  v25 = v24;

  objc_msgSend(MEMORY[0x1E0D7B318], "displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:defaultTitle:defaultTitleCategory:titleKey:titleCategoryKey:defaultSubtitle:subtitleKey:simulatedLoadingDelay:preferredAttributesPromise:", v8, a4, v22, *(_QWORD *)buf, *MEMORY[0x1E0CD1CD0], *MEMORY[0x1E0CD1CC8], v25, 0, *MEMORY[0x1E0CD1CC0], v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5
{
  -[PUPhotosGridViewController navigateToPhoto:inAssetContainer:refetchIfNeeded:animated:](self, "navigateToPhoto:inAssetContainer:refetchIfNeeded:animated:", a3, a4, 0, a5);
}

- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 refetchIfNeeded:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  v6 = a6;
  -[PUPhotosGridViewController _indexPathForAsset:inAssetCollection:refetchIfNeeded:](self, "_indexPathForAsset:inAssetCollection:refetchIfNeeded:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    -[PUPhotosGridViewController _navigateToPhotoAtIndexPath:animated:interactive:](self, "_navigateToPhotoAtIndexPath:animated:interactive:", v8, v6, 0);
    v8 = v9;
  }

}

- (id)_indexPathForAsset:(id)a3 inAssetCollection:(id)a4 refetchIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForAsset:inCollection:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && v5)
  {
    objc_msgSend(v10, "refetchResultsForAssetCollection:", v9);
    objc_msgSend(v10, "indexPathForAsset:inCollection:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)navigateToRevealPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  id pendingNavigationBlock;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUPhotosGridViewController_navigateToRevealPhoto_inAssetContainer_animated___block_invoke;
  aBlock[3] = &unk_1E58A6558;
  objc_copyWeak(&v18, &location);
  v10 = v9;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  v19 = a5;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded")
    && self->_didScrollToInitialPosition)
  {
    if (!-[PUPhotosGridViewController isContentViewInSyncWithModel](self, "isContentViewInSyncWithModel"))
      -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 0);
    v12[2](v12);
  }
  else
  {
    v13 = _Block_copy(v12);
    pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_pendingNavigationBlock = v13;

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)navigateToBottomAnimated:(BOOL)a3
{
  void (**v5)(_QWORD);
  void *v6;
  id pendingNavigationBlock;
  _QWORD aBlock[4];
  id v9;
  BOOL v10;
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PUPhotosGridViewController_navigateToBottomAnimated___block_invoke;
  aBlock[3] = &unk_1E58AA4A0;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5[2](v5);
  }
  else
  {
    v6 = _Block_copy(v5);
    pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_pendingNavigationBlock = v6;

  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  return !-[PUPhotosGridViewController _navigateToBottomIfNeededAnimated:](self, "_navigateToBottomIfNeededAnimated:", a3);
}

- (BOOL)_navigateToBottomIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;

  v3 = a3;
  if (-[PUPhotosGridViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "px_isScrolledAtEdge:", 3);

    if ((v6 & 1) != 0)
      return 1;
  }
  -[PUPhotosGridViewController navigateToBottomAnimated:](self, "navigateToBottomAnimated:", v3);
  return 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController _actionConfirmationAlert](self, "_actionConfirmationAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5 && self->_shareToolbarButton)
  {
    v10 = -[PUPhotosGridViewController isEditing](self, "isEditing");

    if (v10)
      objc_msgSend(v11, "setBarButtonItem:", self->_shareToolbarButton);
  }
  else
  {

  }
  -[PUPhotosGridViewController _removeActionSheet](self, "_removeActionSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
    goto LABEL_6;
  -[PUPhotosGridViewController _deleteActionController](self, "_deleteActionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUPhotosGridViewController _deleteActionController](self, "_deleteActionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "action");

    -[PUPhotosGridViewController _referenceBarButtonItemForDeleteAction:](self, "_referenceBarButtonItemForDeleteAction:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBarButtonItem:", v6);
LABEL_6:

  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController _shareAssetsPopoverController](self, "_shareAssetsPopoverController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PUPhotosGridViewController _setShareAssetsPopoverController:](self, "_setShareAssetsPopoverController:", 0);
  -[PUPhotosGridViewController _actionConfirmationAlert](self, "_actionConfirmationAlert");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8 == v6)
  {
    -[PUPhotosGridViewController _setActionConfirmationAlert:](self, "_setActionConfirmationAlert:", 0);
    v7 = v8;
  }

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _QWORD v24[5];

  v3 = a3;
  -[PUPhotosGridViewController _removeActionSheet](self, "_removeActionSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  -[PUPhotosGridViewController _actionConfirmationAlert](self, "_actionConfirmationAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  -[PUPhotosGridViewController _albumPickerViewController](self, "_albumPickerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  -[PUPhotosGridViewController activitySharingController](self, "activitySharingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activityViewControllerIfAvailable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PUPhotosGridViewController setActivitySharingController:](self, "setActivitySharingController:", 0);
      -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    }
  }
  -[PUPhotosGridViewController _slideshowViewController](self, "_slideshowViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __57__PUPhotosGridViewController_prepareForDismissingForced___block_invoke;
      v24[3] = &unk_1E58ABD10;
      v24[4] = self;
      -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v24);
    }
  }
  -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[PUPhotosGridViewController oneUpPresentationHelper](self, "oneUpPresentationHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "dismissOneUpViewControllerForced:animated:", v3, 0);

  }
  else
  {
    v22 = 1;
  }
  -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);

  return v22;
}

- (void)beginCoalescedSelectionUpdates
{
  ++self->_coalescedSelectionEntranceCount;
}

- (void)endCoalescedSelectionUpdates
{
  void *v4;

  if (!-[PUPhotosGridViewController isPerformingCoalescedSelectionUpdates](self, "isPerformingCoalescedSelectionUpdates"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosGridViewController.m"), 5509, CFSTR("Got mismatched request to end coalesced selection updates"));

  }
  --self->_coalescedSelectionEntranceCount;
  if (!-[PUPhotosGridViewController isPerformingCoalescedSelectionUpdates](self, "isPerformingCoalescedSelectionUpdates"))-[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 0);
}

- (BOOL)isPerformingCoalescedSelectionUpdates
{
  return self->_coalescedSelectionEntranceCount != 0;
}

- (void)setSelected:(BOOL)a3 itemsAtIndexes:(id)a4 inSection:(int64_t)a5 animated:(BOOL)a6
{
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  BOOL v18;

  v7 = a3;
  v14 = a4;
  -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "selectAssetsAtIndexes:inAssetCollection:", v14, v9);
  else
    objc_msgSend(v10, "deselectAssetsAtIndexes:inAssetCollection:", v14, v9);

  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__PUPhotosGridViewController_setSelected_itemsAtIndexes_inSection_animated___block_invoke;
  v15[3] = &unk_1E58A6580;
  v17 = a5;
  v13 = v12;
  v16 = v13;
  v18 = v7;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v15);
  if (!-[PUPhotosGridViewController isPerformingCoalescedSelectionUpdates](self, "isPerformingCoalescedSelectionUpdates"))-[PUPhotosGridViewController updatePeripheralInterfaceAnimated:](self, "updatePeripheralInterfaceAnimated:", 0);

}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PUPhotosGridViewController selectedIndexPaths](self, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "section");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(v13, "addIndex:", objc_msgSend(v10, "item"));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PUPhotosGridViewController_deselectAllItemsAnimated___block_invoke;
  v16[3] = &unk_1E58A65A8;
  v16[4] = self;
  v17 = a3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (void)sessionInfoPhotoSelectionDidChange:(id)a3
{
  -[PUPhotosGridViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
  -[PUPhotosGridViewController _updateNavigationBannerAnimated:](self, "_updateNavigationBannerAnimated:", 0);
  -[PUPhotosGridViewController _updateCollectionViewMultipleSelection](self, "_updateCollectionViewMultipleSelection");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
    v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("allowIrisUI"));
  else
    v8 = 1;
  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    -[PUPhotosGridViewController gridSettings:changedValueForKey:](self, "gridSettings:changedValueForKey:", v10, v6);
    if (!v8)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    -[PUPhotosGridViewController updateLayoutMetrics](self, "updateLayoutMetrics");
    -[PUPhotosGridViewController updateInterfaceForModelReloadAnimated:](self, "updateInterfaceForModelReloadAnimated:", 1);
  }
LABEL_7:

}

- (id)pu_debugRows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "pu_debugRows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  v8 = (void *)MEMORY[0x1E0D83010];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __42__PUPhotosGridViewController_pu_debugRows__block_invoke;
  v14 = &unk_1E58AB2F8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "px_rowWithTitle:postDismissalAction:", CFSTR("Begin Scroll Test"), &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v3;
}

- (BOOL)allowSlideshowButton
{
  return !-[PUPhotosGridViewController isTrashBinViewController](self, "isTrashBinViewController");
}

- (BOOL)allowSelectAllButton
{
  return 0;
}

- (int64_t)oneUpPresentationOrigin
{
  return 0;
}

- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4
{
  -[PUPhotosGridViewController _setPushedPhotoBrowserController:](self, "_setPushedPhotoBrowserController:", a4);
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 1;
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  void *v5;
  id v6;

  -[PUPhotosGridViewController collectionView](self, "collectionView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);

  -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopForceIncludingAllAssets");

}

- (unint64_t)additionalOneUpViewControllerOptions
{
  return 0;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = v5;
  if (v5)
    -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  else
    -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  if (-[PUPhotosGridViewController px_isVisible](self, "px_isVisible", a3))
    -[PUPhotosGridViewController updateGlobalFooter](self, "updateGlobalFooter");
}

- (double)topMarginForPhotosGlobalFooterView:(id)a3
{
  return 0.0;
}

- (void)photosGridBarsHelper:(id)a3 getTitle:(id *)a4 prompt:(id *)a5 shouldHideBackButton:(BOOL *)a6 leftBarButtonItems:(id *)a7 rightBarButtonItems:(id *)a8 forPhotoSelectionManager:(id)a9
{
  -[PUPhotosGridViewController getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:](self, "getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:", a4, a5, a6, a7, a8);
}

- (id)photosGridBarsHelper:(id)a3 titleForPhotoSelectionManager:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "_localizedSelectionTitleWithPhotoSelectionManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)photosGridBarsHelper:(id)a3 didChange:(unint64_t)a4
{
  if ((a4 & 1) != 0)
    -[PUPhotosGridViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
}

- (BOOL)canDragOut
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  uint8_t v8[16];

  PLDragAndDropGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "canDragOut", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dragOutEnabled"))
  {
    -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSelectingAssets") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
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
  -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)_dragItemsForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PUPhotosGridViewController canDragOut](self, "canDragOut")
    && !-[PUPhotosGridViewController isAddPlaceholderAtIndexPath:](self, "isAddPlaceholderAtIndexPath:", v4))
  {
    -[PUPhotosGridViewController photosDataSource](self, "photosDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetReferenceAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D7B978];
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "confidentialWarningRequiredForAssetReferences:", v9);

    if ((v8 & 1) != 0)
    {
      -[PUPhotosGridViewController _presentConfidentialityWarning](self, "_presentConfidentialityWarning");
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v7, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PXDragAndDropItemProviderForDisplayAsset();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v5 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_9;
      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v12);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B338]), "initWithAssetReference:", v7);
      objc_msgSend(v13, "setLocalObject:", v14);

      v16 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v5 = v10;
LABEL_9:

    goto LABEL_10;
  }
  v5 = (id)MEMORY[0x1E0C9AA60];
LABEL_10:

  return v5;
}

- (id)_previewParametersForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  if (-[PUPhotosGridViewController cellFillMode](self, "cellFillMode") == 2)
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotosGridViewController assetAtIndexPath:](self, "assetAtIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aspectRatio");
    v10 = v9;
    objc_msgSend(v7, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", PURectWithAspectRatioFittingRect(v10, v11, v12, v13, v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisiblePath:", v15);

  }
  return v5;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ liftingPreviewParametersForItemAtIndexPath: %@", (uint8_t *)&v11, 0x16u);
  }

  -[PUPhotosGridViewController _previewParametersForItemAtIndexPath:](self, "_previewParametersForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ liftingPreviewParametersForItemAtIndexPath: %@", (uint8_t *)&v11, 0x16u);
  }

  -[PUPhotosGridViewController _previewParametersForItemAtIndexPath:](self, "_previewParametersForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  -[PUPhotosGridViewController _dragItemsForIndexPath:](self, "_dragItemsForIndexPath:", v10);
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
  -[PUPhotosGridViewController _dragItemsForIndexPath:](self, "_dragItemsForIndexPath:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)canDragIn
{
  _BOOL4 v3;

  v3 = -[PUPhotosGridViewController _allowsActions:](self, "_allowsActions:", 64);
  if (v3)
    LOBYTE(v3) = -[PUPhotosGridViewController _canAddContent](self, "_canAddContent");
  return v3;
}

- (BOOL)canHandleDropSession:(id)a3
{
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  void *v27;
  PUPhotosGridViewController *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[PUPhotosGridViewController canDragIn](self, "canDragIn");
  objc_msgSend(v5, "localDragSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v28 = self;
      v29 = v5;
      v11 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "localObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v14, "assetReference");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "asset");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (objc_class *)objc_opt_class();
              NSStringFromClass(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v28, CFSTR("PUPhotosGridViewController.m"), 5838, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("pxLocalObject.assetReference.asset"), v22);

              v16 = 0;
LABEL_19:

              v19 = 1;
              goto LABEL_20;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "px_descriptionForAssertionMessage");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v28, CFSTR("PUPhotosGridViewController.m"), 5838, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("pxLocalObject.assetReference.asset"), v18, v26);

            }
            if (objc_msgSend(v16, "sourceType") == 2)
              goto LABEL_19;

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
          continue;
        break;
      }
      v19 = 0;
LABEL_20:
      v5 = v29;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }
  if ((v6 & v19) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D7B528], "supportedTypeIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v23);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)handleDrop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLDragAndDropGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "handleDrop: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0D7B528], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PUPhotosGridViewController_handleDrop___block_invoke;
  v8[3] = &unk_1E58A65F8;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "fetchAssetsFromDrop:importIfNeeded:completion:", v7, 1, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ canHandleDropSesson: %@ ", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[PUPhotosGridViewController canHandleDropSession:](self, "canHandleDropSession:", v7);
  return v9;
}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  PLDragAndDropGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v13, 0x20u);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:dropLocation:", 2, 2);
  return v11;
}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v7, "dropSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController handleDrop:](self, "handleDrop:", v9);

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ canHandleSession: %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[PUPhotosGridViewController canHandleDropSession:](self, "canHandleDropSession:", v7);
  return v9;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ performDrop: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PUPhotosGridViewController handleDrop:](self, "handleDrop:", v7);
}

- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, 0, 0, a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSwipeSelectionEnabled"))
  {
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasActiveDrag") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isInMultiSelectMode
{
  char v3;
  void *v4;
  char v5;

  v3 = -[PUPhotosGridViewController isEditing](self, "isEditing");
  -[PUPhotosGridViewController sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSelectingAssets");

  return v5 | v3;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  if ((-[PUPhotosGridViewController isEditing](self, "isEditing", a3) & 1) == 0)
    -[PUPhotosGridViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return -[PUPhotosGridViewController interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:](self, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", a3, a4.x, a4.y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  objc_msgSend(MEMORY[0x1E0D7B4C0], "sharedInstance", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "enableAutomaticTransitionToSelectMode");

  if (!v11)
    return 0;
  v12 = -[PUPhotosGridViewController _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
  v13 = fabs(x) > fabs(y);
  return v12 && v13;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = -[PUPhotosGridViewController isInMultiSelectMode](self, "isInMultiSelectMode", a3);
  if (v10)
  {
    v11 = -[PUPhotosGridViewController _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
    v12 = fabs(x) > fabs(y);
    LOBYTE(v10) = v11 && v12;
  }
  return v10;
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  PUSwipeSelectionManager *v9;
  void *v10;
  PUSwipeSelectionManager *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, 0, 0, a4.x, a4.y);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", objc_msgSend(v16, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v16, "item"), v5);

  v8 = v7;
  v9 = [PUSwipeSelectionManager alloc];
  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUSwipeSelectionManager initWithSelectionMode:photoSelectionManager:](v9, "initWithSelectionMode:photoSelectionManager:", v8, v10);

  -[PUSwipeSelectionManager setDelegate:](v11, "setDelegate:", self);
  -[PUSwipeSelectionManager setDatasource:](v11, "setDatasource:", self);
  -[PUPhotosGridViewController _setSwipeSelectionManager:](self, "_setSwipeSelectionManager:", v11);
  -[PUSwipeSelectionManager beginSelectionFromIndexPath:](v11, "beginSelectionFromIndexPath:", v16);
  -[PUPhotosGridViewController _barsHelper](self, "_barsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSwipeSelecting:", 1);

  v13 = objc_alloc(MEMORY[0x1E0D7BB40]);
  -[PUPhotosGridViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTargetScrollView:", v14);

  objc_msgSend(v15, "setDelegate:", self);
  -[PUSwipeSelectionManager setSelectionAutoScroller:](v11, "setSelectionAutoScroller:", v15);

}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  y = a4.y;
  x = a4.x;
  -[PUPhotosGridViewController collectionView](self, "collectionView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", 0, x, y);
  v9 = v8;
  v11 = v10;

  v19 = 0;
  v20 = 0;
  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v20, &v19, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  v14 = v19;
  v15 = v14;
  if (v12 || v13 || v14)
  {
    -[PUPhotosGridViewController _swipeSelectionManager](self, "_swipeSelectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScreenTouchLocation:", v9, v11);
    objc_msgSend(v16, "updateSelectionWithCurrentIndexPath:leftClosestIndexPath:aboveClosestIndexPath:", v12, v13, v15);
    objc_msgSend(v16, "selectionAutoScroller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithUserInteractionLocation:inCoordinateSpace:", v18, x, y);

  }
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  void *v6;
  id v7;

  -[PUPhotosGridViewController _swipeSelectionManager](self, "_swipeSelectionManager", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "endSelection");
    -[PUPhotosGridViewController _setSwipeSelectionManager:](self, "_setSwipeSelectionManager:", 0);
    -[PUPhotosGridViewController _barsHelper](self, "_barsHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSwipeSelecting:", 0);

    v5 = v7;
  }

}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PUPhotosGridViewController _setActionConfirmationAlert:](self, "_setActionConfirmationAlert:", v5);
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[PUPhotosGridViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;

  v6 = a5;
  -[PUPhotosGridViewController _setActionConfirmationAlert:](self, "_setActionConfirmationAlert:", 0);
  -[PUPhotosGridViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

  return 1;
}

- (PUPhotosGridViewSupplementalToolbarProvider)supplementalToolbarProvider
{
  return self->_supplementalToolbarProvider;
}

- (void)setSupplementalToolbarProvider:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalToolbarProvider, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setGridSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gridSpec, a3);
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (unint64_t)allowedActions
{
  return self->_allowedActions;
}

- (void)setAllowedActions:(unint64_t)a3
{
  self->_allowedActions = a3;
}

- (PUGridLayoutProtocol)mainGridLayout
{
  return self->_mainGridLayout;
}

- (void)setMainGridLayout:(id)a3
{
  objc_storeStrong((id *)&self->_mainGridLayout, a3);
}

- (BOOL)initiallyScrolledToBottom
{
  return self->_initiallyScrolledToBottom;
}

- (void)setInitiallyScrolledToBottom:(BOOL)a3
{
  self->_initiallyScrolledToBottom = a3;
}

- (BOOL)alwaysHideTabBar
{
  return self->_alwaysHideTabBar;
}

- (void)setAlwaysHideTabBar:(BOOL)a3
{
  self->_alwaysHideTabBar = a3;
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (void)_setPhotoSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_photoSelectionManager, a3);
}

- (id)onViewDidAppearCompletion
{
  return self->_onViewDidAppearCompletion;
}

- (void)setOnViewDidAppearCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (PUPhotosGridBarsHelper)_barsHelper
{
  return self->__barsHelper;
}

- (PUPhotoPinchGestureRecognizer)photoOrStackPinchGestureRecognizer
{
  return self->_photoOrStackPinchGestureRecognizer;
}

- (void)_setPhotoOrStackPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_photoOrStackPinchGestureRecognizer, a3);
}

- (UIView)_emptyPlaceholderView
{
  return self->__emptyPlaceholderView;
}

- (void)_setEmptyPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->__emptyPlaceholderView, a3);
}

- (unint64_t)_previousCollectionsCount
{
  return self->__previousCollectionsCount;
}

- (void)_setPreviousCollectionsCount:(unint64_t)a3
{
  self->__previousCollectionsCount = a3;
}

- (UIViewController)_removeActionSheet
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__removeActionSheet);
}

- (void)_setRemoveActionSheet:(id)a3
{
  objc_storeWeak((id *)&self->__removeActionSheet, a3);
}

- (UIViewController)_actionConfirmationAlert
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__actionConfirmationAlert);
}

- (void)_setActionConfirmationAlert:(id)a3
{
  objc_storeWeak((id *)&self->__actionConfirmationAlert, a3);
}

- (UIView)_shareAssetsSender
{
  return (UIView *)objc_loadWeakRetained((id *)&self->__shareAssetsSender);
}

- (void)_setShareAssetsSender:(id)a3
{
  objc_storeWeak((id *)&self->__shareAssetsSender, a3);
}

- (PXPhotoKitDeletePhotosActionController)_deleteActionController
{
  return self->__deleteActionController;
}

- (void)_setDeleteActionController:(id)a3
{
  objc_storeStrong((id *)&self->__deleteActionController, a3);
}

- (PXPhotoKitDuplicateActionController)_duplicateActionController
{
  return self->__duplicateActionController;
}

- (void)_setDuplicateActionController:(id)a3
{
  objc_storeStrong((id *)&self->__duplicateActionController, a3);
}

- (PUAlbumPickerViewController)_albumPickerViewController
{
  return self->__albumPickerViewController;
}

- (void)_setAlbumPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->__albumPickerViewController, a3);
}

- (PUSlideshowViewController)_slideshowViewController
{
  return self->__slideshowViewController;
}

- (void)_setSlideshowViewController:(id)a3
{
  objc_storeStrong((id *)&self->__slideshowViewController, a3);
}

- (PUAlbumListTransitionContext)albumListTransitionContext
{
  return self->_albumListTransitionContext;
}

- (UICollectionViewLayout)_albumListTransitionLayout
{
  return self->__albumListTransitionLayout;
}

- (void)setAlbumListTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__albumListTransitionLayout, a3);
}

- (UIBarButtonItem)customDoneButtonItem
{
  return self->_customDoneButtonItem;
}

- (BOOL)showsCustomDoneButtonItemOnLeft
{
  return self->_showsCustomDoneButtonItemOnLeft;
}

- (void)setShowsCustomDoneButtonItemOnLeft:(BOOL)a3
{
  self->_showsCustomDoneButtonItemOnLeft = a3;
}

- (BOOL)showsSelectionSessionCancelButtonItemOnLeft
{
  return self->_showsSelectionSessionCancelButtonItemOnLeft;
}

- (void)setShowsSelectionSessionCancelButtonItemOnLeft:(BOOL)a3
{
  self->_showsSelectionSessionCancelButtonItemOnLeft = a3;
}

- (double)collectionViewLayoutReferenceWidth
{
  return self->_collectionViewLayoutReferenceWidth;
}

- (void)setCollectionViewLayoutReferenceWidth:(double)a3
{
  self->_collectionViewLayoutReferenceWidth = a3;
}

- (UIEdgeInsets)collectionViewLayoutReferenceSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_collectionViewLayoutReferenceSafeAreaInsets.top;
  left = self->_collectionViewLayoutReferenceSafeAreaInsets.left;
  bottom = self->_collectionViewLayoutReferenceSafeAreaInsets.bottom;
  right = self->_collectionViewLayoutReferenceSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCollectionViewLayoutReferenceSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_collectionViewLayoutReferenceSafeAreaInsets = a3;
}

- (UIViewController)_pushedPhotoBrowserController
{
  return self->__pushedPhotoBrowserController;
}

- (PUOneUpPresentationHelper)oneUpPresentationHelper
{
  return self->_oneUpPresentationHelper;
}

- (void)_setOneUpPresentationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpPresentationHelper, a3);
}

- (PUPhotoBrowserOneUpPresentationAdaptor)_photoBrowserOneUpPresentationAdaptor
{
  return self->__photoBrowserOneUpPresentationAdaptor;
}

- (void)_setPhotoBrowserOneUpPresentationAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->__photoBrowserOneUpPresentationAdaptor, a3);
}

- (UIPopoverPresentationController)_shareAssetsPopoverController
{
  return (UIPopoverPresentationController *)objc_loadWeakRetained((id *)&self->__shareAssetsPopoverController);
}

- (void)_setShareAssetsPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->__shareAssetsPopoverController, a3);
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingController, a3);
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

- (CGRect)_previousPrefetchRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__previousPrefetchRect.origin.x;
  y = self->__previousPrefetchRect.origin.y;
  width = self->__previousPrefetchRect.size.width;
  height = self->__previousPrefetchRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setPreviousPrefetchRect:(CGRect)a3
{
  self->__previousPrefetchRect = a3;
}

- (CGPoint)_previousPreheatContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__previousPreheatContentOffset.x;
  y = self->__previousPreheatContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setPreviousPreheatContentOffset:(CGPoint)a3
{
  self->__previousPreheatContentOffset = a3;
}

- (CGPoint)_previousPrefetchContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__previousPrefetchContentOffset.x;
  y = self->__previousPrefetchContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setPreviousPrefetchContentOffset:(CGPoint)a3
{
  self->__previousPrefetchContentOffset = a3;
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (int64_t)_maximumNumberOfRowsToPreheat
{
  return self->__maximumNumberOfRowsToPreheat;
}

- (void)_setMaximumNumberOfRowsToPreheat:(int64_t)a3
{
  self->__maximumNumberOfRowsToPreheat = a3;
}

- (CGSize)maximumThumbnailRequestSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumThumbnailRequestSize.width;
  height = self->_maximumThumbnailRequestSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setMaximumThumbnailRequestSize:(CGSize)a3
{
  self->_maximumThumbnailRequestSize = a3;
}

- (PUScrollViewSpeedometer)_collectionViewSpeedometer
{
  return self->__collectionViewSpeedometer;
}

- (void)_setCollectionViewSpeedometer:(id)a3
{
  objc_storeStrong((id *)&self->__collectionViewSpeedometer, a3);
}

- (UIMultiSelectInteraction)_multiSelectInteraction
{
  return self->__multiSelectInteraction;
}

- (void)set_multiSelectInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__multiSelectInteraction, a3);
}

- (PUSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (void)_setSwipeSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->__swipeSelectionManager, a3);
}

- (int64_t)_batchPreheatingCount
{
  return self->__batchPreheatingCount;
}

- (void)_setBatchPreheatingCount:(int64_t)a3
{
  self->__batchPreheatingCount = a3;
}

- (id)ppt_nextDeleteFinishedBlock
{
  return self->_ppt_nextDeleteFinishedBlock;
}

- (void)ppt_setNextDeleteFinishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (id)ppt_dataSourceChangeHandler
{
  return self->_ppt_dataSourceChangeHandler;
}

- (void)ppt_setDataSourceChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1528);
}

- (BOOL)_didForceDataSource
{
  return self->__didForceDataSource;
}

- (void)_setDidForceDataSource:(BOOL)a3
{
  self->__didForceDataSource = a3;
}

- (id)_pendingViewSizeTransitionContext
{
  return self->__pendingViewSizeTransitionContext;
}

- (void)_setPendingViewSizeTransitionContext:(id)a3
{
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, a3);
}

- (id)_cachedViewSizeTransitionContext
{
  return self->__cachedViewSizeTransitionContext;
}

- (void)_setCachedViewSizeTransitionContext:(id)a3
{
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, a3);
}

- (CGSize)_cachedViewSizeTransitionContextSize
{
  double width;
  double height;
  CGSize result;

  width = self->__cachedViewSizeTransitionContextSize.width;
  height = self->__cachedViewSizeTransitionContextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setCachedViewSizeTransitionContextSize:(CGSize)a3
{
  self->__cachedViewSizeTransitionContextSize = a3;
}

- (UIContextMenuInteraction)_contextMenuInteraction
{
  return self->__contextMenuInteraction;
}

- (void)_setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__contextMenuInteraction, a3);
}

- (NSIndexPath)_previewingIndexPath
{
  return self->__previewingIndexPath;
}

- (void)_setPreviewingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->__previewingIndexPath, a3);
}

- (BOOL)_previewCommitting
{
  return self->__previewCommitting;
}

- (void)_setPreviewCommitting:(BOOL)a3
{
  self->__previewCommitting = a3;
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (NSIndexPath)_menuIndexPath
{
  return self->__menuIndexPath;
}

- (void)_setMenuIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->__menuIndexPath, a3);
}

- (id)pendingProcessDataSourceUpdateBlock
{
  return self->_pendingProcessDataSourceUpdateBlock;
}

- (void)setPendingProcessDataSourceUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1584);
}

- (BOOL)hasKnownNonEmptyContent_toWorkAround31995766
{
  return self->_hasKnownNonEmptyContent_toWorkAround31995766;
}

- (void)setHasKnownNonEmptyContent_toWorkAround31995766:(BOOL)a3
{
  self->_hasKnownNonEmptyContent_toWorkAround31995766 = a3;
}

- (UIActivityViewController)primingActivityViewController
{
  return self->_primingActivityViewController;
}

- (void)setPrimingActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_primingActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primingActivityViewController, 0);
  objc_storeStrong(&self->_pendingProcessDataSourceUpdateBlock, 0);
  objc_storeStrong((id *)&self->__menuIndexPath, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong((id *)&self->__previewingIndexPath, 0);
  objc_storeStrong((id *)&self->__contextMenuInteraction, 0);
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, 0);
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, 0);
  objc_storeStrong(&self->_ppt_dataSourceChangeHandler, 0);
  objc_storeStrong(&self->_ppt_nextDeleteFinishedBlock, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__multiSelectInteraction, 0);
  objc_storeStrong((id *)&self->__collectionViewSpeedometer, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_destroyWeak((id *)&self->__shareAssetsPopoverController);
  objc_storeStrong((id *)&self->__photoBrowserOneUpPresentationAdaptor, 0);
  objc_storeStrong((id *)&self->_oneUpPresentationHelper, 0);
  objc_storeStrong((id *)&self->__pushedPhotoBrowserController, 0);
  objc_storeStrong((id *)&self->_customDoneButtonItem, 0);
  objc_storeStrong((id *)&self->__albumListTransitionLayout, 0);
  objc_storeStrong((id *)&self->_albumListTransitionContext, 0);
  objc_storeStrong((id *)&self->__slideshowViewController, 0);
  objc_storeStrong((id *)&self->__albumPickerViewController, 0);
  objc_storeStrong((id *)&self->__duplicateActionController, 0);
  objc_storeStrong((id *)&self->__deleteActionController, 0);
  objc_destroyWeak((id *)&self->__shareAssetsSender);
  objc_destroyWeak((id *)&self->__actionConfirmationAlert);
  objc_destroyWeak((id *)&self->__removeActionSheet);
  objc_storeStrong((id *)&self->__emptyPlaceholderView, 0);
  objc_storeStrong((id *)&self->_photoOrStackPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__barsHelper, 0);
  objc_storeStrong(&self->_onViewDidAppearCompletion, 0);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_mainGridLayout, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_gridSpec, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_supplementalToolbarProvider, 0);
  objc_storeStrong((id *)&self->__dateRangeFormatter, 0);
  objc_storeStrong(&self->_pendingNavigationBlock, 0);
  objc_storeStrong((id *)&self->_progressInfosByCachedIndexPath, 0);
  objc_storeStrong((id *)&self->_progressInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_slideshowButton, 0);
  objc_storeStrong((id *)&self->_slideshowButtonSpacer, 0);
  objc_storeStrong((id *)&self->_restoreToolbarButton, 0);
  objc_storeStrong((id *)&self->_removeToolbarButton, 0);
  objc_storeStrong((id *)&self->_addToolbarButton, 0);
  objc_storeStrong((id *)&self->_shareToolbarButton, 0);
  objc_storeStrong((id *)&self->_deselectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_selectSessionCancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectSessionDoneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_visibleSectionsBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetIndexPathBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetContainerBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetBeforeChange, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResultBeforeChange, 0);
  objc_storeStrong((id *)&self->_alternateContentView, 0);
}

void __41__PUPhotosGridViewController_handleDrop___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __41__PUPhotosGridViewController_handleDrop___block_invoke_2;
    v13 = &unk_1E58A65D0;
    objc_copyWeak(&v15, a1 + 6);
    v5 = v4;
    v14 = v5;
    objc_msgSend(a1[4], "setPendingProcessDataSourceUpdateBlock:", &v10);

    objc_destroyWeak(&v15);
  }
  v6 = objc_msgSend(v3, "count", v10, v11, v12, v13);
  objc_msgSend(a1[5], "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    objc_msgSend(MEMORY[0x1E0D7B330], "dropImportErrorAlertControllerWithHandler:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "presentViewController:animated:completion:", v9, 1, 0);

  }
}

BOOL __41__PUPhotosGridViewController_handleDrop___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForAsset:hintIndexPath:hintCollection:", *(_QWORD *)(a1 + 32), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 2, 1);

  }
  return v5 != 0;
}

void __42__PUPhotosGridViewController_pu_debugRows__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performScrollTest:iterations:delta:", CFSTR("ScrollPhotosGrid"), 1000, 20);

}

void __55__PUPhotosGridViewController_deselectAllItemsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setSelected:itemsAtIndexes:inSection:animated:", 0, v6, objc_msgSend(a2, "unsignedIntegerValue"), *(unsigned __int8 *)(a1 + 40));

}

void __76__PUPhotosGridViewController_setSelected_itemsAtIndexes_inSection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectionBadgeVisible:", *(unsigned __int8 *)(a1 + 48));

}

uint64_t __57__PUPhotosGridViewController_prepareForDismissingForced___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSlideshowViewController:", 0);
}

void __55__PUPhotosGridViewController_navigateToBottomAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "px_scrollToEdge:animated:", 3, *(unsigned __int8 *)(a1 + 40));
}

void __78__PUPhotosGridViewController_navigateToRevealPhoto_inAssetContainer_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "gridSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceLoadInitialSectionCount");

  objc_msgSend(WeakRetained, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionForAssetCollection:", *(_QWORD *)(a1 + 32));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "forceAccurateSection:andSectionsBeforeAndAfter:", v5, v3);
  objc_msgSend(v4, "indexPathForAsset:inCollection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(WeakRetained, "_setDidForceDataSource:", 1);
    objc_msgSend(WeakRetained, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundFetchOriginSection:", objc_msgSend(v6, "section"));
    objc_msgSend(v4, "startBackgroundFetchIfNeeded");
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 2, *(unsigned __int8 *)(a1 + 56));

  }
}

uint64_t __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromAssetCollection:proposedAttributes:", *(_QWORD *)(a1 + 32), a2);
}

void __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v2, "assetCollectionType") == 1)
    v3 = 7;
  else
    v3 = 0;
  objc_msgSend(v4, "setViewSourceOrigin:", v3);

}

void __111__PUPhotosGridViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureOneUpPresentationHelper");
  objc_msgSend(*(id *)(a1 + 32), "oneUpPresentationHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commitPreviewViewController:", *(_QWORD *)(a1 + 40));

}

id __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "px_previewActionMenus");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E58AD278, v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  PUPhotoDecoration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PhotoCollectionAddItemPlaceholder"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemInteractionTintColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pu_tintedImageWithColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_configureAddPlaceholderCell_animated__image;
  _configureAddPlaceholderCell_animated__image = v1;

  v3 = objc_alloc_init(PUPhotoDecoration);
  v4 = (void *)_configureAddPlaceholderCell_animated__decoration;
  _configureAddPlaceholderCell_animated__decoration = (uint64_t)v3;

  v5 = (void *)_configureAddPlaceholderCell_animated__decoration;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v5, "setBorderWidth:", round(*(double *)&PUMainScreenScale_screenScale * 0.5) / *(double *)&PUMainScreenScale_screenScale);
  v6 = (void *)_configureAddPlaceholderCell_animated__decoration;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v7);

}

void __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  BOOL v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v5 = a2;
  if (*(_BYTE *)(a1 + 88))
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 0;
  v19 = v5;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoImage");
    v7 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAvoidsImageViewIfPossible:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setFillMode:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "photoSize");
  v9 = v8;
  objc_msgSend(v19, "size");
  v11 = v10;
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v19, "size");
  objc_msgSend(v12, "setPhotoSize:");
  objc_msgSend(*(id *)(a1 + 40), "gridSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "displaysAvalancheStacks")
    && objc_msgSend(*(id *)(a1 + 48), "canShowAvalancheStacks"))
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "representsBurst") & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "displayAllItemsAsBursts");

    }
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "setNeedsAvalancheStack:", v14);
  v15 = *(void **)(a1 + 32);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoCollectionViewBackgroundColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setAvalancheStackBackgroundColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "setPhotoImage:", v19);
  objc_msgSend(*(id *)(a1 + 32), "setFlattensBadgeView:", objc_msgSend(*(id *)(a1 + 40), "canBeginStackCollapseTransition") ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "configureDecorationsForCell:withAsset:assetCollection:thumbnailIsPlaceholder:assetMayHaveChanged:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a3, *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "_updateSelectionForCell:atIndexPath:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "_updatePhotoDecorationForCell:animated:", *(_QWORD *)(a1 + 64), 0);
  objc_msgSend(*(id *)(a1 + 40), "_updateProgressForCell:atIndexPath:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  if (objc_msgSend(*(id *)(a1 + 40), "canDragOut")
    && (objc_msgSend(*(id *)(a1 + 40), "isAddPlaceholderAtIndexPath:", *(_QWORD *)(a1 + 72)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDraggable:", 1);
  }
  if (v9 != v11)
    objc_msgSend(*(id *)(a1 + 64), "setNeedsLayout");

}

void __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = objc_loadWeakRetained((id *)(a1 + 72));
  if (v5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v5, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (v5)
  {
    if (WeakRetained)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C68]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "intValue");
      v28 = objc_msgSend(WeakRetained, "currentImageRequestID");

      if (v27 == v28)
      {
        if (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != (_DWORD)v10)
          objc_msgSend(v8, "configureDecorationsForCell:withAsset:assetCollection:thumbnailIsPlaceholder:assetMayHaveChanged:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10, *(unsigned __int8 *)(a1 + 80));
        objc_msgSend(WeakRetained, "photoContentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contentHelper");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "updatePhotoImageWithoutReconfiguring:", v5);
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  if (MEMORY[0x1AF429AFC]())
  {
    +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "flashDegradedImages");

    if (v15)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      if (v17)
      {
        v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
        objc_msgSend(WeakRetained, "photoContentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v20 = (void *)objc_msgSend(v18, "initWithFrame:");

        objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBackgroundColor:", v21);

        objc_msgSend(v20, "setUserInteractionEnabled:", 0);
        objc_msgSend(WeakRetained, "photoContentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubview:", v20);

        v23 = (void *)MEMORY[0x1E0DC3F10];
        v24 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_3;
        v32[3] = &unk_1E58ABD10;
        v33 = v20;
        v30[0] = v24;
        v30[1] = 3221225472;
        v30[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_4;
        v30[3] = &unk_1E58A9910;
        v31 = v33;
        v25 = v33;
        objc_msgSend(v23, "animateWithDuration:animations:completion:", v32, v30, 1.0);

      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

}

uint64_t __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 32))
    result = objc_msgSend(*(id *)(result + 40), "deleteSections:");
  if (*(_QWORD *)(v1 + 48))
    result = objc_msgSend(*(id *)(v1 + 40), "insertSections:");
  if (*(_QWORD *)(v1 + 56))
    result = objc_msgSend(*(id *)(v1 + 40), "deleteItemsAtIndexPaths:");
  if (*(_QWORD *)(v1 + 64))
    return objc_msgSend(*(id *)(v1 + 40), "insertItemsAtIndexPaths:");
  return result;
}

void __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginBatchPreheating");
    objc_msgSend(*(id *)(a1 + 32), "resetPreheating");
    objc_msgSend(*(id *)(a1 + 32), "preheatAssets");
    objc_msgSend(*(id *)(a1 + 32), "endBatchPreheating");
  }
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_endPausingChanges:", *(_QWORD *)(a1 + 40));

}

void __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_3(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(a1[4], "cellForItemAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 && (objc_msgSend(a1[5], "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(a1[6], "configureGridCell:forItemAtIndexPath:assetMayHaveChanged:", v9, v8, 0);
          objc_msgSend(a1[5], "addObject:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

uint64_t __56__PUPhotosGridViewController_updateEmptyPlaceholderView__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__PUPhotosGridViewController__updateToolbarContentsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToolbarItems:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__PUPhotosGridViewController_updateNavigationBarAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPrompt:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__PUPhotosGridViewController__updateAllProgressInfoIndexPaths__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIndexPathForProgressInfo:");
}

uint64_t __66__PUPhotosGridViewController__invalidateAllProgressInfoIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCachedIndexPath:", 0);
}

uint64_t __54__PUPhotosGridViewController_processDataSourceChange___block_invoke(uint64_t a1, void *a2)
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

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    v3 = v4;
  }

}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "photosDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = *(id *)(a1 + 32);
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
          objc_msgSend(v3, "indexPathForAssetReference:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "forceExcludeAssetsAtIndexPaths:", v4);
    objc_msgSend(WeakRetained, "setEditing:animated:", 0, 0);
    objc_msgSend(WeakRetained, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v12, "setUserInteractionEnabled:", 1);

  }
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!a2)
  {
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_9;
    objc_msgSend(WeakRetained, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopExcludingAssets:", *(_QWORD *)(a1 + 32));

    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "setEditing:animated:", 0, 0);
    WeakRetained = v8;
  }
  if (!*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.photosDeleteGrid"), MEMORY[0x1E0C9AA70]);
    PLSAggregateDictionaryAddValueForScalarKey();
LABEL_8:
    WeakRetained = v8;
  }
LABEL_9:
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRemoveActionSheet:", 0);
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeSelectedAssetsWithCompletion:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_setRemoveActionSheet:", 0);
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_deleteActionForBarButtonItem:", *(_QWORD *)(a1 + 40));
  v3 = objc_alloc(MEMORY[0x1E0D7B718]);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithAction:assets:undoManager:delegate:", v2, v4, v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_setDeleteActionController:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_7;
  v10[3] = &unk_1E58ABAC8;
  v11 = *(id *)(a1 + 64);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_8;
  v8[3] = &unk_1E58AB7D8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v6, "performWithWillDeleteHandler:completionHandler:", v10, v8);

}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDeleteActionController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setRemoveActionSheet:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDeleteActionController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setRemoveActionSheet:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__PUPhotosGridViewController_handleAddToAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isContentViewInSyncWithModel") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "updateInterfaceForModelReloadAnimated:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PUPhotosGridViewController_handleAddToAction__block_invoke_2;
  v8[3] = &unk_1E58AB790;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v8);

}

uint64_t __47__PUPhotosGridViewController_handleAddToAction__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, char, void *);
  void *v8;
  id v9;
  id v10;

  if (a1[4])
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B170]), "initWithAssets:assetCollection:", a1[5], a1[4]);
    objc_msgSend(v2, "setShouldSortAssetsByCreationDate:", 1);
    objc_msgSend(a1[6], "undoManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __47__PUPhotosGridViewController_handleAddToAction__block_invoke_3;
    v8 = &unk_1E58AA020;
    v9 = a1[5];
    v10 = a1[4];
    objc_msgSend(v2, "executeWithUndoManager:completionHandler:", v3, &v5);

  }
  return objc_msgSend(a1[6], "_setAlbumPickerViewController:", 0, v5, v6, v7, v8);
}

void __47__PUPhotosGridViewController_handleAddToAction__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

uint64_t __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSlideshowViewController:", 0);
}

void __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "navigateToRevealPhoto:inAssetContainer:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

void __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (a2)
  {
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke_2;
    v12[3] = &unk_1E58AA420;
    objc_copyWeak(&v13, v6);
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v9, "performDuplicateAction:newStillImageTime:completionHandler:", a3, &v10, v12);
    objc_destroyWeak(&v13);
  }
  else
  {
    objc_msgSend(WeakRetained, "_handleDuplicateActionCompletionWithSuccess:", 0);
  }
  objc_msgSend(v8, "_setActionConfirmationAlert:", 0);

}

void __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDuplicateActionCompletionWithSuccess:", a2);

}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "addObject:", v8);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForAsset:hintIndexPath:hintCollection:", v8, v11, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v8);

}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "indexPathForAssetReference:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "forceExcludeAssetsAtIndexPaths:", v4);
  if (objc_msgSend(WeakRetained, "isEditing"))
    objc_msgSend(WeakRetained, "setEditing:animated:", 0, 0);

}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopExcludingAssets:", *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
  }

}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "performActionWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(WeakRetained, "_setActionConfirmationAlert:", 0);

}

void __67__PUPhotosGridViewController__updateSelectionFromSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoCollectionAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForAsset:hintIndexPath:hintCollection:", v8, v10, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v12 = *(void **)(a1 + 40);
    v13 = objc_msgSend(v15, "item");
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v15, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectAssetAtIndex:inAssetCollection:", v13, v14);

  }
}

void __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke_2;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v5, a1 + 7);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(a1[6], "_setShareAssetsSender:", 0);

  objc_destroyWeak(&v5);
}

void __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    v3 = WeakRetained;
    if (objc_msgSend(a1[5], "isEqualToString:", *MEMORY[0x1E0D7BE38]))
      objc_msgSend(a1[4], "setModalTransitionStyle:", 2);
    objc_msgSend(v3, "presentViewController:animated:completion:", a1[4], 1, 0);
    WeakRetained = v3;
  }

}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_selectionManagerWithSharableAssetsInFetchResult:forAssetCollection:", a2, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_activitySharingControllerWithSelectionManager:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_presentActivitySharingController:completion:", v3, 0);

}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sectionForAssetCollection:", *(_QWORD *)(a1 + 32));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(WeakRetained, "_setShareAssetsSender:", *(_QWORD *)(a1 + 48));

}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sectionForAssetCollection:", *(_QWORD *)(a1 + 40));

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(WeakRetained, "_slideshowNavigationControllerForFetchResult:assetCollection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModalTransitionStyle:", 2);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

void __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v2, 2u);
  }
}

uint64_t __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke_475(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __98__PUPhotosGridViewController__selectionManagerWithSharableAssetsInFetchResult_forAssetCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canShareAsset:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexForAsset:inCollection:hintIndex:", v7, *(_QWORD *)(a1 + 40), a3);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", v6);
  }

}

uint64_t __63__PUPhotosGridViewController__sharableAssetsTypeInFetchResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "_canShareAsset:", a2);
  if ((_DWORD)result)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 2uLL)
    {
      *(_QWORD *)(v7 + 24) = 1;
    }
    else
    {
      *(_QWORD *)(v7 + 24) = 2;
      *a4 = 1;
    }
  }
  return result;
}

void __73__PUPhotosGridViewController__selectionManagerWithSelectedSharableAssets__block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  if (objc_msgSend(a1[4], "_canShareAsset:", a2))
  {
    objc_msgSend(a1[5], "objectAtIndex:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "selectAssetAtIndex:inAssetCollection:", a3, v7);

  }
}

void __36__PUPhotosGridViewController_paste___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v3, "addIndex:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "removeAssets:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v3, "count", (_QWORD)v17) && *(_QWORD *)(a1 + 56))
  {
    v10 = objc_msgSend(*(id *)(a1 + 64), "item");
    if ((objc_msgSend(v3, "containsIndex:", v10) & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v13 = objc_msgSend(v3, "countOfIndexesInRange:", 0, v10);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = *(_QWORD *)(v11 + 24) - v13;
    }
    *(_QWORD *)(v11 + 24) = v12;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v15 = *(_QWORD *)(a1 + 48);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "addAssets:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertAssets:atIndexes:", v15, v16);

  }
}

void __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_451(uint64_t a1, int a2)
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "assetIndexPathsForElementsInRect:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = a2 == 0;
  else
    v5 = 1;
  v15 = (void *)v4;
  if (v5)
  {
    v6 = (void *)v4;
    if (!v4 || (a2 & 1) != 0)
      goto LABEL_12;
    v7 = *(_QWORD *)(a1 + 48);
    v9 = a1 + 48;
    v8 = v7;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v9 = a1 + 40;
    v8 = v10;
  }
  v11 = *(void **)(*(_QWORD *)(v8 + 8) + 40);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40);
  }
  objc_msgSend(v11, "addObjectsFromArray:", v15);
  v6 = v15;
LABEL_12:

}

uint64_t __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) != 0 || *(_BYTE *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_3(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGFloat MinY;
  uint64_t v12;
  id v13;
  CGRect v14;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetIndexPathsForElementsInRect:");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    MinY = CGRectGetMinY(v14);
    v12 = 40;
    if (*(double *)(a1 + 64) < MinY)
      v12 = 48;
    objc_msgSend(*(id *)(a1 + v12), "addObjectsFromArray:", v13);

  }
}

void __41__PUPhotosGridViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[PUPhotosGridSettings sharedInstance](PUPhotosGridSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyObserver:", *(_QWORD *)(a1 + 32));

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addKeyObserver:", *(_QWORD *)(a1 + 32));

}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAssets:", a1[6]);

}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_4;
  v3[3] = &unk_1E58A91E0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_sync(MEMORY[0x1E0C80D38], v3);

}

uint64_t __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __70__PUPhotosGridViewController__assetsAllowingEditOperation_fromAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canPerformEditOperation:", *(_QWORD *)(a1 + 32));
}

void __48__PUPhotosGridViewController_selectedIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_shareAssetsPopoverController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setShareAssetsPopoverController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_actionConfirmationAlert");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_actionConfirmationAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "_setActionConfirmationAlert:", 0);
    }
  }

}

uint64_t __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "px_isVisible");
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateNavigationBarAnimated:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_updateGlobalHeaderVisibility");
      return objc_msgSend(*(id *)(a1 + 32), "updateGlobalFooter");
    }
  }
  return result;
}

void __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "isCurrentCollectionViewDataSource"))
  {
    if (*(_BYTE *)(a1 + 49))
      objc_msgSend(*(id *)(a1 + 32), "_updateContentOffsetForPendingViewSizeTransition");
    objc_msgSend(*(id *)(a1 + 40), "finalizeViewTransitionToSize");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "px_isVisible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "updatePeripheralInterfaceAnimated:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_adjustedTransitionWidth");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) = v3;

}

+ (id)_localizedSelectionTitleWithPhotoSelectionManager:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isAnyAssetSelected"))
    objc_msgSend(v3, "localizedSelectionString");
  else
    PLLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)transferPhotoBrowserFromGridViewController:(id)a3 toGridViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "_pushedPhotoBrowserController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "_setPushedPhotoBrowserController:", v6);
    objc_msgSend(v9, "_setPushedPhotoBrowserController:", 0);
    objc_msgSend(v9, "_photoBrowserOneUpPresentationAdaptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPhotoBrowserOneUpPresentationAdaptor:", v7);
    objc_msgSend(v7, "setZoomTransitionDelegate:", v5);
    objc_msgSend(v9, "_setPhotoBrowserOneUpPresentationAdaptor:", 0);
    objc_msgSend(v9, "oneUpPresentationHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setOneUpPresentationHelper:", v8);
    objc_msgSend(v8, "setDelegate:", v5);
    objc_msgSend(v9, "_setOneUpPresentationHelper:", 0);

  }
}

@end
