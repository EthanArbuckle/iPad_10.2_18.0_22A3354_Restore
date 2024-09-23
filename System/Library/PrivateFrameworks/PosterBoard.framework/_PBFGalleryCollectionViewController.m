@implementation _PBFGalleryCollectionViewController

- (_PBFGalleryCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  _PBFGalleryCollectionViewController *v3;
  PBFApplicationStateNode *v4;
  PBFApplicationStateNode *state;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PBFGalleryCollectionViewController;
  v3 = -[_PBFGalleryCollectionViewController initWithCollectionViewLayout:](&v7, sel_initWithCollectionViewLayout_, a3);
  if (v3)
  {
    v4 = -[PBFApplicationStateNode initWithDescription:]([PBFApplicationStateNode alloc], "initWithDescription:", CFSTR("Gallery Collection View Controller"));
    state = v3->_state;
    v3->_state = v4;

  }
  return v3;
}

- (void)viewDidLoad
{
  NSMapTable *v3;
  NSMapTable *displayedCellForIndexPath;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  UICollectionViewDiffableDataSource *v11;
  UICollectionViewDiffableDataSource *diffableDataSource;
  UICollectionViewDiffableDataSource *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_PBFGalleryCollectionViewController;
  -[_PBFGalleryCollectionViewController viewDidLoad](&v19, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  self->_displayedCellForIndexPath = v3;

  -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kGalleryPosterCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kGalleryPosterHeroCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kGalleryPosterCellWithComplicationsReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kGalleryPosterSmartAlbumCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kGalleryPosterCellWithDescriptionReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("KGalleryHeaderElementKind"), CFSTR("KGalleryHeaderElementKind"));
  if (PRIsLowQualityDevice())
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_344);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);
    objc_msgSend(v5, "setBackgroundView:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47498], "pbf_materialView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGroupNameBase:", CFSTR("Gallery-Sheet"));
    objc_msgSend(v5, "setBackgroundView:", v7);
  }

  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  if (!self->_diffableDataSource)
  {
    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x1E0DC35E8]);
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_2;
    v16[3] = &unk_1E86F40E8;
    objc_copyWeak(&v17, &location);
    v11 = (UICollectionViewDiffableDataSource *)objc_msgSend(v9, "initWithCollectionView:cellProvider:", v5, v16);
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v11;

    v13 = self->_diffableDataSource;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __50___PBFGalleryCollectionViewController_viewDidLoad__block_invoke_3;
    v14[3] = &unk_1E86F2368;
    objc_copyWeak(&v15, &location);
    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v13, "setSupplementaryViewProvider:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  -[_PBFGalleryCollectionViewController _updateAssetHelperActiveContexts:](self, "_updateAssetHelperActiveContexts:", 1);

}

- (void)setHostingViewController:(id)a3
{
  UIViewController **p_hostingViewController;
  id v5;
  UIView *containerView;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  UIView *v12;
  id v13;

  p_hostingViewController = &self->_hostingViewController;
  v5 = a3;
  objc_storeWeak((id *)p_hostingViewController, v5);
  objc_msgSend(v5, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  containerView = self->_containerView;
  if (!containerView)
  {
    objc_msgSend(v13, "bounds");
    v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    v12 = self->_containerView;
    self->_containerView = v11;

    -[UIView _setLayoutDebuggingIdentifier:](self->_containerView, "_setLayoutDebuggingIdentifier:", CFSTR("PBFPosterGalleryPreviewViewController Container View"));
    -[UIView setHidden:](self->_containerView, "setHidden:", 1);
    -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 0);
    containerView = self->_containerView;
  }
  objc_msgSend(v13, "addSubview:", containerView);
  objc_msgSend(v13, "sendSubviewToBack:", self->_containerView);

}

- (void)setDataProvider:(id)a3
{
  PBFPosterGalleryDataProvider *v5;
  PBFPosterGalleryDataProvider **p_dataProvider;
  PBFPosterGalleryDataProvider *dataProvider;
  PBFPosterGalleryAssetHelper *v8;
  PBFPosterGalleryAssetHelper *assetHelper;
  PBFPosterGalleryAssetHelper *v10;
  void *v11;
  PBFPosterGalleryDataProvider *v12;

  v5 = (PBFPosterGalleryDataProvider *)a3;
  p_dataProvider = &self->_dataProvider;
  dataProvider = self->_dataProvider;
  if (dataProvider != v5)
  {
    v12 = v5;
    -[PBFPosterGalleryDataProvider removeObserver:](dataProvider, "removeObserver:", self);
    -[PBFPosterGalleryDataProvider invalidate](*p_dataProvider, "invalidate");
    -[PBFPosterGalleryAssetHelper invalidate](self->_assetHelper, "invalidate");
    objc_storeStrong((id *)&self->_dataProvider, a3);
    -[PBFPosterGalleryDataProvider addObserver:](*p_dataProvider, "addObserver:", self);
    if (v12)
    {
      v8 = -[PBFPosterGalleryAssetHelper initWithPreviewGenerator:extensionInstanceProvider:]([PBFPosterGalleryAssetHelper alloc], "initWithPreviewGenerator:extensionInstanceProvider:", *p_dataProvider, v12);
      assetHelper = self->_assetHelper;
      self->_assetHelper = v8;

      -[PBFPosterGalleryAssetHelper setDelegate:](self->_assetHelper, "setDelegate:", self);
      if (-[_PBFGalleryCollectionViewController isViewLoaded](self, "isViewLoaded"))
        -[_PBFGalleryCollectionViewController _updateAssetHelperActiveContexts:](self, "_updateAssetHelperActiveContexts:", 1);
      v10 = self->_assetHelper;
      -[PBFPosterGalleryDataProvider posterPreviews](*p_dataProvider, "posterPreviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterGalleryAssetHelper setPosterPreviews:](v10, "setPosterPreviews:", v11);

      if (-[_PBFGalleryCollectionViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))-[PBFPosterGalleryAssetHelper setSuspended:](self->_assetHelper, "setSuspended:", 0);
    }
    -[_PBFGalleryCollectionViewController _applySnapshotFromDataProvider:](self, "_applySnapshotFromDataProvider:", *p_dataProvider);
    v5 = v12;
  }

}

- (void)setApplicationStateMonitor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[PBFApplicationStateMonitor isEqual:](self->_applicationStateMonitor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
    if (-[_PBFGalleryCollectionViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    {
      -[_PBFGalleryCollectionViewController _resetState](self, "_resetState");
      objc_msgSend(v5, "pushState:", self->_state);
    }
  }

}

- (void)_updateAssetHelperActiveContexts:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  _PBFGalleryCollectionViewController *v11;

  if (a3)
    -[PBFPosterGalleryAssetHelper resetKnownDisplayContexts](self->_assetHelper, "resetKnownDisplayContexts");
  -[UIViewController pbf_displayContext](self, "pbf_displayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __72___PBFGalleryCollectionViewController__updateAssetHelperActiveContexts___block_invoke;
  v9 = &unk_1E86F4110;
  v10 = v4;
  v11 = self;
  v5 = v4;
  PBFSnapshotDefinitionEnumerateSupportedOrientationsForCurrentDeviceClass(&v6);
  -[PBFPosterGalleryAssetHelper setActiveDisplayContext:](self->_assetHelper, "setActiveDisplayContext:", v5, v6, v7, v8, v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  -[_PBFGalleryCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[_PBFGalleryCollectionViewController _applySnapshotFromDataProvider:](self, "_applySnapshotFromDataProvider:", self->_dataProvider);
  -[PBFApplicationStateMonitor pushState:](self->_applicationStateMonitor, "pushState:", self->_state);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PBFGalleryCollectionViewController;
  -[_PBFGalleryCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefetchingEnabled:", 0);

  -[PBFPosterGalleryAssetHelper setSuspended:](self->_assetHelper, "setSuspended:", 1);
  -[PBFPosterGalleryAssetHelper setActiveDisplayContext:](self->_assetHelper, "setActiveDisplayContext:", 0);
  -[_PBFGalleryCollectionViewController _purgeSnapshots](self, "_purgeSnapshots");
  -[PBFApplicationStateNode cancel](self->_state, "cancel");
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  -[_PBFGalleryCollectionViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[_PBFGalleryCollectionViewController _kickstartAssetHelperIfPossible](self, "_kickstartAssetHelperIfPossible");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)_PBFGalleryCollectionViewController;
  v7 = a4;
  -[_PBFGalleryCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90___PBFGalleryCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E86F4138;
  v12[4] = self;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, &__block_literal_global_364);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PBFGalleryCollectionViewController;
  -[_PBFGalleryCollectionViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_PBFGalleryCollectionViewController _updateAssetHelperActiveContexts:](self, "_updateAssetHelperActiveContexts:", 1);
}

- (CGRect)previewFrameForScrollingPreviewWithIdentifierToVisible:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  CGRect result;

  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_5:
    v14 = *MEMORY[0x1E0C9D628];
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_6;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sectionHeaderBottomSpacing");
  objc_msgSend(v10, "sectionHeaderTitleFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");

  objc_msgSend(v7, "frame");
  UIRectInset();
  objc_msgSend(v5, "scrollRectToVisible:animated:", 0);
  objc_msgSend(v7, "posterPreviewView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterPreviewFrame");
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v5);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

LABEL_6:
  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_kickstartAssetHelperIfPossible
{
  PBFPosterGalleryAssetHelper *assetHelper;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PBFPosterGalleryDataProvider *dataProvider;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[_PBFGalleryCollectionViewController isViewLoaded](self, "isViewLoaded")
    && -[PBFPosterGalleryAssetHelper isSuspended](self->_assetHelper, "isSuspended"))
  {
    assetHelper = self->_assetHelper;
    -[UIViewController pbf_displayContext](self, "pbf_displayContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryAssetHelper setActiveDisplayContext:](assetHelper, "setActiveDisplayContext:", v4);

    -[PBFPosterGalleryAssetHelper setSuspended:](self->_assetHelper, "setSuspended:", 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_PBFGalleryCollectionViewController collectionView](self, "collectionView", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForVisibleItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          dataProvider = self->_dataProvider;
          -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterGalleryDataProvider previewForPreviewUniqueIdentifier:](dataProvider, "previewForPreviewUniqueIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[PBFPosterGalleryAssetHelper updatePosterPreview:isVisible:](self->_assetHelper, "updatePosterPreview:isVisible:", v13, 1);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)_applySnapshotFromDataProvider:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  PBFPosterGalleryAssetHelper *assetHelper;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_PBFGalleryCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = -[_PBFGalleryCollectionViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    if (v9)
    {
      if (v4)
      {
        -[UICollectionViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "buildSnapshot");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5 || (objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
        {
          assetHelper = self->_assetHelper;
          -[PBFPosterGalleryDataProvider posterPreviews](self->_dataProvider, "posterPreviews");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterGalleryAssetHelper setPosterPreviews:](assetHelper, "setPosterPreviews:", v8);

          -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](self->_diffableDataSource, "applySnapshotUsingReloadData:", v6);
          -[_PBFGalleryCollectionViewController _resetState](self, "_resetState");
        }

      }
    }
  }

}

- (void)_purgeSnapshots
{
  void *v3;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v5;

  v3 = (void *)MEMORY[0x1D17A3580](self, a2);
  diffableDataSource = self->_diffableDataSource;
  v5 = (void *)objc_opt_new();
  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](diffableDataSource, "applySnapshotUsingReloadData:", v5);

  -[PBFPosterGalleryDataProvider invalidate](self->_dataProvider, "invalidate");
  -[PBFPosterGalleryAssetHelper cancel](self->_assetHelper, "cancel");
  objc_autoreleasePoolPop(v3);
}

- (void)_resetState
{
  PBFApplicationStateNode *state;
  void *v3;
  id v4;

  state = self->_state;
  -[PBFPosterGalleryDataProvider posterPreviews](self->_dataProvider, "posterPreviews");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_369);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFApplicationStateNode setComponents:](state, "setComponents:", v3);

}

- (void)configureCell:(id)a3 forCollectionView:(id)a4 posterPreview:(id)a5 indexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  UIView *v24;
  UIView *containerView;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;

  v67 = a3;
  v9 = a5;
  v10 = a6;
  -[PBFPosterGalleryAssetHelper activeDisplayContext](self->_assetHelper, "activeDisplayContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController pbf_displayContext](self, "pbf_displayContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDisplayContext:", v12);

  if ((v13 & 1) == 0)
    -[_PBFGalleryCollectionViewController _updateAssetHelperActiveContexts:](self, "_updateAssetHelperActiveContexts:", 0);
  v14 = -[UIViewController pbf_layoutOrientation](self, "pbf_layoutOrientation");
  -[PBFPosterGalleryAssetHelper assetsForPosterPreview:](self->_assetHelper, "assetsForPosterPreview:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(v9, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v26, 0, v14, objc_msgSend(v10, "row"), 1.0);

    objc_msgSend(v67, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderWidth:", 0.0);
    goto LABEL_18;
  }
  v17 = v10;
  objc_msgSend(v15, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "liveViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v18;
  v23 = v22;

  objc_msgSend(v23, "superview");
  v24 = (UIView *)objc_claimAutoreleasedReturnValue();
  containerView = self->_containerView;

  if (v24 == containerView)
    objc_msgSend(v23, "setNeedsLayout");
  else
    -[UIView addSubview:](self->_containerView, "addSubview:", v23);
  v10 = v17;
  objc_msgSend(v9, "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v27, v23, v14, objc_msgSend(v17, "row"), 1.0);

  v28 = PBFDebugLiveWallpapers();
  if (v19)
  {
    if (v28)
    {
      objc_msgSend(v67, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = 1.0;
LABEL_16:
      objc_msgSend(v30, "setBorderWidth:", v32);

    }
  }
  else if (v28)
  {
    objc_msgSend(v67, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = 0.0;
    goto LABEL_16;
  }

LABEL_18:
  objc_msgSend(v67, "posterPreviewView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "complicationContentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "posterPreview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqual:", v9);

  if ((v36 & 1) == 0)
  {
    objc_msgSend(v34, "setPosterPreview:", v9);
    objc_msgSend(v34, "prepareComplicationPreviewWithGenerator:", self->_dataProvider);
  }
  objc_msgSend(v9, "galleryLocalizedTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v37, "length"))
    goto LABEL_29;
  v38 = objc_msgSend(v67, "supportsPosterTitle");

  if (v38)
  {
    objc_msgSend(v9, "galleryOptions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "modeSymbolImageName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v66 = v16;
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AB8], 1);
      v40 = objc_claimAutoreleasedReturnValue();
      v65 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      -[_PBFGalleryCollectionViewController view](self, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "window");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "screen");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = (void *)v40;
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v37, v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v44;
      objc_msgSend(v44, "previewCellLabelColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "imageWithTintColor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setImage:", v47);

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v65);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v9, "galleryLocalizedTitle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v49, "initWithString:", v50);

      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("%@ %@"));
      -[_PBFGalleryCollectionViewController traitCollection](self, "traitCollection");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "layoutDirection");

      v55 = objc_alloc(MEMORY[0x1E0CB3498]);
      if (v54 == 1)
        v56 = objc_msgSend(v55, "initWithFormat:options:locale:", v52, 0, 0, v51, v48);
      else
        v56 = objc_msgSend(v55, "initWithFormat:options:locale:", v52, 0, 0, v48, v51);
      v58 = (void *)v56;
      objc_msgSend(v67, "setAttributedPosterTitle:", v56);

      v16 = v66;
      v57 = v64;
    }
    else
    {
      objc_msgSend(v9, "galleryLocalizedTitle");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setPosterTitle:", v57);
    }

LABEL_29:
  }
  objc_msgSend(v9, "galleryLocalizedDescription");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    v61 = objc_msgSend(v67, "supportsPosterDescription");

    if (v61)
    {
      objc_msgSend(v9, "galleryLocalizedDescription");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setPosterDescription:", v62);

    }
  }

}

- (void)assetHelper:(id)a3 didUpdateAssetsForPosterPreview:(id)a4
{
  -[_PBFGalleryCollectionViewController _reloadCellForPosterPreviewIfVisible:](self, "_reloadCellForPosterPreviewIfVisible:", a4);
}

- (void)assetHelper:(id)a3 prepareForPosterPreview:(id)a4 movingToLive:(id)a5
{
  UIViewController **p_hostingViewController;
  id v7;
  id WeakRetained;

  p_hostingViewController = &self->_hostingViewController;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_hostingViewController);
  objc_msgSend(WeakRetained, "bs_addChildViewController:withSuperview:", v7, self->_containerView);

}

- (void)assetHelper:(id)a3 posterPreview:(id)a4 teardownLiveViewController:(id)a5
{
  UIViewController **p_hostingViewController;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  p_hostingViewController = &self->_hostingViewController;
  v8 = a5;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_hostingViewController);
  objc_msgSend(WeakRetained, "bs_removeChildViewController:", v8);

  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeFromSuperview");
  -[_PBFGalleryCollectionViewController _reloadCellForPosterPreviewIfVisible:](self, "_reloadCellForPosterPreviewIfVisible:", v11);

}

- (BOOL)_reloadCellForPosterPreviewIfVisible:(id)a3
{
  id v4;
  UICollectionViewDiffableDataSource *diffableDataSource;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  diffableDataSource = self->_diffableDataSource;
  objc_msgSend(v4, "previewUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](diffableDataSource, "indexPathForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMapTable objectForKey:](self->_displayedCellForIndexPath, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
    {
      -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PBFGalleryCollectionViewController configureCell:forCollectionView:posterPreview:indexPath:](self, "configureCell:forCollectionView:posterPreview:indexPath:", v8, v10, v4, v7);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  PBFPosterGalleryDataProvider *dataProvider;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "cellForItemAtIndexPath:", v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  dataProvider = self->_dataProvider;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterGalleryDataProvider previewForPreviewUniqueIdentifier:](dataProvider, "previewForPreviewUniqueIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", PBFPreviewTypeHero) & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v11 = objc_msgSend(v9, "presentationStyle");

  if (v11 != 1)
  {
    -[PBFPosterGalleryAssetHelper assetsForPosterPreview:](self->_assetHelper, "assetsForPosterPreview:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyFrameImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v10, "image"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
      objc_msgSend(v17, "posterPreviewView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "prepareForFullScreenTransitionWithContentView:", v13);

    }
    goto LABEL_6;
  }
LABEL_7:
  -[_PBFGalleryCollectionViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "posterPreviewView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "galleryCollectionViewControllerDidSelectPreview:fromPreviewView:", v9, v16);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  NSMapTable *displayedCellForIndexPath;
  id v8;
  id v9;
  PBFPosterGalleryDataProvider *dataProvider;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  v8 = a5;
  v9 = a4;
  -[NSMapTable setObject:forKey:](displayedCellForIndexPath, "setObject:forKey:", v9, v8);
  dataProvider = self->_dataProvider;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider previewForPreviewUniqueIdentifier:](dataProvider, "previewForPreviewUniqueIdentifier:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PBFPosterGalleryAssetHelper updatePosterPreview:isVisible:](self->_assetHelper, "updatePosterPreview:isVisible:", v14, 1);
  -[_PBFGalleryCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PBFGalleryCollectionViewController configureCell:forCollectionView:posterPreview:indexPath:](self, "configureCell:forCollectionView:posterPreview:indexPath:", v9, v12, v14, v8);

  -[_PBFGalleryCollectionViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "galleryCollectionViewControllerWillDisplayPreview:", v14);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  NSMapTable *displayedCellForIndexPath;
  id v7;
  PBFPosterGalleryDataProvider *dataProvider;
  void *v9;
  id v10;

  displayedCellForIndexPath = self->_displayedCellForIndexPath;
  v7 = a5;
  -[NSMapTable removeObjectForKey:](displayedCellForIndexPath, "removeObjectForKey:", v7);
  dataProvider = self->_dataProvider;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterGalleryDataProvider previewForPreviewUniqueIdentifier:](dataProvider, "previewForPreviewUniqueIdentifier:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PBFPosterGalleryAssetHelper updatePosterPreview:isVisible:](self->_assetHelper, "updatePosterPreview:isVisible:", v10, 0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[PBFPosterGalleryAssetHelper setSuspended:](self->_assetHelper, "setSuspended:", 1);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[PBFPosterGalleryAssetHelper setSuspended:](self->_assetHelper, "setSuspended:", 0, a4);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  void *v5;
  PBFPosterGalleryAssetHelper *assetHelper;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80___PBFGalleryCollectionViewController_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  v8[3] = &unk_1E86F41C0;
  v8[4] = self;
  objc_msgSend(a4, "bs_mapNoNulls:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  assetHelper = self->_assetHelper;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryAssetHelper prefetchPosterPreviews:](assetHelper, "prefetchPosterPreviews:", v7);

}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  void *v5;
  PBFPosterGalleryAssetHelper *assetHelper;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92___PBFGalleryCollectionViewController_collectionView_cancelPrefetchingForItemsAtIndexPaths___block_invoke;
  v8[3] = &unk_1E86F41C0;
  v8[4] = self;
  objc_msgSend(a4, "bs_mapNoNulls:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  assetHelper = self->_assetHelper;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryAssetHelper cancelPrefetchForPosterPreviews:](assetHelper, "cancelPrefetchForPosterPreviews:", v7);

}

- (PBFPosterGalleryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (_PBFGalleryCollectionViewControllerDelegate)delegate
{
  return (_PBFGalleryCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (UIViewController)hostingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_displayedCellForIndexPath, 0);
  objc_storeStrong((id *)&self->_assetHelper, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

@end
