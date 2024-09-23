@implementation PUSidebarViewController

- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5
{
  return -[PUSidebarViewController initWithNavigationRoot:photoLibrary:libraryFilterState:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:](self, "initWithNavigationRoot:photoLibrary:libraryFilterState:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:", a3, a4, a5, 0, 0, 0);
}

- (PUSidebarViewController)initWithNavigationRoot:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5 options:(unint64_t)a6 additionalAssetsFilterPredicate:(id)a7 pickerAllPhotosVirtualCollection:(id)a8
{
  id v15;
  id v16;
  id v17;
  PUSidebarViewController *v18;
  PUSidebarViewController *v19;
  void *v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PUSidebarViewController;
  v18 = -[PUSidebarViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_navigationRoot, a3);
    objc_storeStrong((id *)&v19->_photoLibrary, a4);
    objc_storeStrong((id *)&v19->_libraryFilterState, a5);
    v19->_options = a6;
    objc_storeStrong((id *)&v19->_assetsFilterPredicate, a7);
    objc_storeStrong((id *)&v19->_pickerAllPhotosVirtualCollection, a8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v19, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);

    -[PXLibraryFilterState registerChangeObserver:context:](v19->_libraryFilterState, "registerChangeObserver:context:", v19, PXLibraryFilterStateObservationContext_44248);
  }

  return v19;
}

- (void)viewDidLoad
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUSidebarViewController;
  -[PUSidebarViewController viewDidLoad](&v13, sel_viewDidLoad);
  PLSidebarGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.viewDidLoad", ", v12, 2u);
  }

  -[PUSidebarViewController configureViewHierarchy](self, "configureViewHierarchy");
  -[PUSidebarViewController configureDataSource](self, "configureDataSource");
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController setupDataSectionManagerWithLoadMode:](self, "setupDataSectionManagerWithLoadMode:", objc_msgSend(v7, "sidebarLaunchLoadMode"));

  if ((-[PUSidebarViewController options](self, "options") & 1) == 0)
  {
    -[PUSidebarViewController editButtonItem](self, "editButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  v10 = v6;
  v11 = v10;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_END, v4, "PUSidebarViewController.viewDidLoad", ", v12, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSidebarViewController;
  -[PUSidebarViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChangeProcessingPaused:forReason:", 0, CFSTR("Sidebar Hidden"));

  -[PUSidebarViewController _updateSelectedRowScrollToVisible:](self, "_updateSelectedRowScrollToVisible:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSidebarViewController;
  -[PUSidebarViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sidebarPauseChangeProcessingWhenHidden");

  if (v5)
  {
    -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChangeProcessingPaused:forReason:", 1, CFSTR("Sidebar Hidden"));

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PUSidebarViewController;
  -[PUSidebarViewController traitCollectionDidChange:](&v24, sel_traitCollectionDidChange_, v4);
  -[PUSidebarViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appearanceDidChange");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PUSidebarViewController collectionView](self, "collectionView", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          objc_opt_self();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v18 = v15;
            objc_msgSend(v18, "item");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUSidebarViewController _updateOutlineCell:forListItem:](self, "_updateOutlineCell:forListItem:", v18, v19);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)configureViewHierarchy
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PUCollectionsCollectionViewDropDelegate *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t buf[16];

  PLSidebarGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.configureViewHierarchy", ", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PUSidebarViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUSidebarViewController generateLayout](self, "generateLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v17, v10, v12, v14, v16);

  objc_msgSend(v18, "setAutoresizingMask:", 18);
  -[PUSidebarViewController traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "userInterfaceIdiom") == 6)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v20);

  objc_msgSend(v18, "setDelegate:", self);
  objc_msgSend(v18, "setSpringLoaded:", 1);
  objc_msgSend(v18, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v18, "_setAllowsSelectionDuringEditing:", 1);
  -[PUSidebarViewController traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22 == 5)
    objc_msgSend(v18, "setContentInset:", 16.0, 0.0, 0.0, 0.0);
  objc_msgSend(v18, "_setShouldPersistSelectionOnReloadDataWhenPossible:", 1);
  -[PUSidebarViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v18);

  -[PUSidebarViewController setCollectionView:](self, "setCollectionView:", v18);
  v24 = objc_alloc_init(PUCollectionsCollectionViewDropDelegate);
  -[PUCollectionsCollectionViewDropDelegate setDropDataProvider:](v24, "setDropDataProvider:", self);
  objc_msgSend(v18, "setDropDelegate:", v24);
  -[PUSidebarViewController setDropDelegate:](self, "setDropDelegate:", v24);
  v25 = v6;
  v26 = v25;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v26, OS_SIGNPOST_INTERVAL_END, v4, "PUSidebarViewController.configureViewHierarchy", ", v27, 2u);
  }

}

- (id)generateLayout
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 3);
  objc_msgSend(v2, "setShowsSeparators:", 0);
  objc_msgSend(v2, "setHeaderMode:", 2);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __41__PUSidebarViewController_generateLayout__block_invoke;
  v8 = &unk_1E58A1910;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "setTrailingSwipeActionsConfigurationProvider:", &v5);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v3;
}

- (void)_updateHeaderCell:(id)a3 forListItem:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  objc_msgSend(v6, "headerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v15, "setContentConfiguration:", v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isExpandable");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC3588]);
    objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
      && objc_msgSend(v13, "enableSidebarHeaderSelection"))
    {
      if (-[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker"))
        v14 = 1;
      else
        v14 = 2;
    }
    else
    {
      v14 = 1;
    }
    objc_msgSend(v12, "setStyle:", v14);
    objc_msgSend(v10, "addObject:", v12);

  }
  objc_msgSend(v15, "setAccessories:", v10);

}

- (void)_updateOutlineCell:(id)a3 forListItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC4040], "defaultOutlineCellConfigurationForState:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContentViewConfiguration:", v8);

  objc_msgSend(MEMORY[0x1E0DC34D8], "listSidebarCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundConfiguration:", v9);

  -[PUSidebarViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 6)
  {
    v12 = (void *)MEMORY[0x1E0DC3868];
    objc_msgSend(MEMORY[0x1E0DC3860], "effect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "styleWithEffect:shape:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHoverStyle:", v14);

  }
  objc_msgSend(v7, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v15);

  objc_msgSend(v6, "setItem:", v7);
  -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentSectionSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "containsItem:", v7))
  {
    objc_msgSend(v17, "parentOfChild:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(v7, "style");
  if (v19 <= 1)
    objc_msgSend(v6, "setStyle:", v19);
  -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cancelImageRequest:", objc_msgSend(v6, "mediaRequestID"));

  -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __58__PUSidebarViewController__updateOutlineCell_forListItem___block_invoke;
  v28 = &unk_1E58A1938;
  v29 = v6;
  v30 = v7;
  v22 = v7;
  v23 = v6;
  v24 = objc_msgSend(v21, "requestImageForItem:parentItem:completion:", v22, v18, &v25);
  objc_msgSend(v23, "setMediaRequestID:", v24, v25, v26, v27, v28);

}

- (void)configureDataSource
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t v26[16];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id buf[2];

  PLSidebarGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PUSidebarViewController.configureDataSource", ", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7 = (void *)MEMORY[0x1E0DC35C8];
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __46__PUSidebarViewController_configureDataSource__block_invoke;
  v40[3] = &unk_1E58A1960;
  objc_copyWeak(&v41, buf);
  objc_msgSend(v7, "registrationWithCellClass:configurationHandler:", v8, v40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC35C8];
  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v38[1] = 3221225472;
  v38[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_2;
  v38[3] = &unk_1E58A1960;
  objc_copyWeak(&v39, buf);
  objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_3;
  aBlock[3] = &unk_1E58A1988;
  v25 = v10;
  v36 = v25;
  v14 = v13;
  v37 = v14;
  v15 = _Block_copy(aBlock);
  v16 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[PUSidebarViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithCollectionView:cellProvider:", v17, v15);

  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_4;
  v33[3] = &unk_1E58A19B0;
  objc_copyWeak(&v34, buf);
  objc_msgSend(v18, "sectionSnapshotHandlers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWillExpandItemHandler:", v33);

  v31[0] = v9;
  v31[1] = 3221225472;
  v31[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_6;
  v31[3] = &unk_1E58A19B0;
  objc_copyWeak(&v32, buf);
  objc_msgSend(v18, "sectionSnapshotHandlers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWillCollapseItemHandler:", v31);

  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_7;
  v29[3] = &unk_1E58A19D8;
  objc_copyWeak(&v30, buf);
  objc_msgSend(v18, "reorderingHandlers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCanReorderItemHandler:", v29);

  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_8;
  v27[3] = &unk_1E58A1A00;
  objc_copyWeak(&v28, buf);
  objc_msgSend(v18, "reorderingHandlers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDidReorderHandler:", v27);

  -[PUSidebarViewController setDataSource:](self, "setDataSource:", v18);
  v23 = v6;
  v24 = v23;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v24, OS_SIGNPOST_INTERVAL_END, v4, "PUSidebarViewController.configureDataSource", ", v26, 2u);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(buf);

}

- (BOOL)_isPhotosPicker
{
  return (-[PUSidebarViewController options](self, "options") >> 1) & 1;
}

- (void)setupDataSectionManagerWithLoadMode:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  PUSidebarDataSectionEnablementController *v10;
  void *v11;
  int v12;
  objc_class *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  unint64_t v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  int64_t v35;
  uint8_t buf[16];

  PLSidebarGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v31 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PUSidebarViewController.setupDataSectionManager", ", buf, 2u);
  }
  spid = v6;
  v32 = v8;

  -[PUSidebarViewController photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUSidebarDataSectionEnablementController initWithPhotoLibrary:isPhotosPicker:excludesHiddenAlbum:]([PUSidebarDataSectionEnablementController alloc], "initWithPhotoLibrary:isPhotosPicker:excludesHiddenAlbum:", v9, -[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker"), (-[PUSidebarViewController options](self, "options") >> 2) & 1);
  -[PUSidebarViewController setSidebarDataSectionEnablementController:](self, "setSidebarDataSectionEnablementController:", v10);
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sidebarUseMacStructure");

  v13 = (objc_class *)objc_opt_class();
  if (-[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker"))
    v14 = 7;
  else
    v14 = v12 ^ 1u;
  v15 = [v13 alloc];
  -[PUSidebarViewController libraryFilterState](self, "libraryFilterState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController assetsFilterPredicate](self, "assetsFilterPredicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController pickerAllPhotosVirtualCollection](self, "pickerAllPhotosVirtualCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithPhotoLibrary:libraryFilterState:sectionEnablementProvider:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:", v9, v16, v10, v14, v17, v18);

  -[PUSidebarViewController setSidebarDataController:](self, "setSidebarDataController:", v19);
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0D7B9A0]);
  -[PUSidebarViewController dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithSidebarDataController:dataSource:", v19, v22);

  objc_msgSend(v23, "setDelegate:", self);
  if (objc_msgSend(v20, "sidebarAnimateDataSourceUpdates"))
    v24 = -[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker") ^ 1;
  else
    v24 = 0;
  objc_msgSend(v23, "setAnimateDataSourceUpdates:", v24);
  if ((unint64_t)(a3 - 2) < 2)
  {
    objc_msgSend(v23, "loadRootItems");
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __63__PUSidebarViewController_setupDataSectionManagerWithLoadMode___block_invoke;
    v33[3] = &unk_1E58AACF0;
    v35 = a3;
    v34 = v23;
    objc_msgSend(v27, "scheduleTaskAfterCATransactionCommits:", v33);

LABEL_17:
    v25 = v31;
    goto LABEL_20;
  }
  if (a3 == 1)
  {
    objc_msgSend(v23, "loadRootItems");
    goto LABEL_17;
  }
  v25 = v31;
  if (!a3)
  {
    if (objc_msgSend(v20, "sidebarLaunchAnimateLoad"))
      v26 = -[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker") ^ 1;
    else
      v26 = 0;
    objc_msgSend(v23, "reloadFromDataControllerApplyAnimated:onQueue:", v26, 0);
  }
LABEL_20:
  -[PUSidebarViewController setSidebarOutlineSectionController:](self, "setSidebarOutlineSectionController:", v23);
  v28 = v32;
  v29 = v28;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PUSidebarViewController.setupDataSectionManager", ", buf, 2u);
  }

}

- (id)_collectionViewIndexPathForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PUSidebarViewController sidebarDataController](self, "sidebarDataController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUSidebarViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItemIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_itemIndexPathForDestination:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;

  v4 = a3;
  -[PUSidebarViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_msgSend(v5, "px_virtualCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      objc_msgSend(v7, "photosCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 8:
    case 17:
      objc_msgSend(v6, "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHCollection *CollectionForNavigationDestinationInPhotoLibrary(PXProgrammaticNavigationDestination *__strong, PHPhotoLibrary *__strong)");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "px_descriptionForAssertionMessage");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PUSidebarViewController.m"), 415, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("destination.collection"), v20, v21);

        }
      }
      break;
    case 14:
      objc_msgSend(v7, "searchCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 16:
      objc_msgSend(v7, "prototypeCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 18:
      objc_msgSend(v7, "forYouCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 20:
      objc_msgSend(v7, "sharedActivityCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 23:
      objc_msgSend(v7, "allAlbumsCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 27:
      objc_msgSend(v7, "eventsCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 28:
      objc_msgSend(v7, "tripsCollection");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v8 = (void *)v9;
      break;
    default:
      break;
  }

  if (v8)
  {
    ListItemIdentifierForCollection(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarViewController _collectionViewIndexPathForItemIdentifier:](self, "_collectionViewIndexPathForItemIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v8, "px_fetchAncestryIncludingRoot:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expandItemsForIdentifiersIfNeeded:animated:", v13, 1);

      -[PUSidebarViewController _collectionViewIndexPathForItemIdentifier:](self, "_collectionViewIndexPathForItemIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_26;
  }
  if (objc_msgSend(v6, "type") == 32)
  {
    objc_msgSend(v6, "lemonadeNavigationDestination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUSidebarViewController _collectionViewIndexPathForItemIdentifier:](self, "_collectionViewIndexPathForItemIdentifier:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v6, "type") == 21)
    {
      objc_msgSend(v6, "importSourceUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        -[PUSidebarViewController _collectionViewIndexPathForItemIdentifier:](self, "_collectionViewIndexPathForItemIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }
    if (objc_msgSend(v6, "type") == 22)
    {
      -[PUSidebarViewController _collectionViewIndexPathForItemIdentifier:](self, "_collectionViewIndexPathForItemIdentifier:", *MEMORY[0x1E0D7C8E8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
LABEL_27:

  return v11;
}

- (BOOL)_hasSidebarItemForDestination:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUSidebarViewController _itemIndexPathForDestination:](self, "_itemIndexPathForDestination:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_updateSelectedRowScrollToVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController currentNavigationDestination](self, "currentNavigationDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D7B868]);
    -[PUSidebarViewController photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_virtualCollections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "momentsCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithObject:revealMode:", v11, 1);
    -[PUSidebarViewController setCurrentNavigationDestination:](self, "setCurrentNavigationDestination:", v6);

  }
  -[PUSidebarViewController _itemIndexPathForDestination:](self, "_itemIndexPathForDestination:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathsForSelectedItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
    v16 = objc_msgSend(v14, "containsObject:", v12) ^ 1;
  else
    v16 = 1;
  HIDWORD(v42) = v16;
  if (!v3)
    goto LABEL_16;
  if (!objc_msgSend(v5, "sidebarScrollSelectedItemToCenter"))
    goto LABEL_16;
  if (!v12)
    goto LABEL_17;
  if (!objc_msgSend(v5, "sidebarOnlyScrollOffscreenItemOnScreen"))
    goto LABEL_17;
  objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_17;
  v18 = (void *)v17;
  objc_msgSend(v13, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v18, "frame");
  v50.origin.x = v27;
  v50.origin.y = v28;
  v50.size.width = v29;
  v50.size.height = v30;
  v49.origin.x = v20;
  v49.origin.y = v22;
  v49.size.width = v24;
  v49.size.height = v26;
  v31 = CGRectContainsRect(v49, v50);

  if (v31)
  {
LABEL_16:
    LODWORD(v42) = 0;
    v40 = 0;
  }
  else
  {
LABEL_17:
    LODWORD(v42) = 1;
    v40 = 2;
  }
  v32 = v5;
  v33 = objc_msgSend(v5, "sidebarAnimateSelectionUpdates", v40);
  v34 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v34, "removeObject:", v12);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = v34;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v44 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v13, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), v33);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v37);
  }

  if (!objc_msgSend(v13, "isEditing") && v42)
    objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v12, v33, v41);

}

- (id)_backNavigationRootItemForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sidebarHideNavBackButtonForSelectedItem");

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSectionSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v4;
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      while (!objc_msgSend(v11, "isGroup"))
      {
        v7 = v11;

        objc_msgSend(v9, "parentOfChild:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v7;
        if (!v11)
          goto LABEL_10;
      }
      v7 = v12;
LABEL_10:

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)_handleDidSelectListItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "actionType");
    v7 = objc_claimAutoreleasedReturnValue();
    -[PUSidebarViewController _performActionForType:completionHandler:](self, "_performActionForType:completionHandler:", v7, v6);

    v6 = (id)v7;
  }
  else
  {
    -[PUSidebarViewController _navigateToDestinationForItem:sameItem:completionHandler:](self, "_navigateToDestinationForItem:sameItem:completionHandler:", v8, -[PUSidebarViewController selectingAlreadySelectedIndexPath](self, "selectingAlreadySelectedIndexPath"), v6);
  }

}

- (void)_navigateToDestinationForItem:(id)a3 sameItem:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void (**v11)(void *, _QWORD, void *);
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a5)
    v10 = a5;
  else
    v10 = &__block_literal_global_174;
  v11 = (void (**)(void *, _QWORD, void *))_Block_copy(v10);
  v12 = 3;
  if (!v6)
    v12 = 0;
  v40 = v12;
  objc_msgSend(v9, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    && objc_msgSend(v15, "enableSidebarHeaderSelection")
    && !-[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker"))
  {
    v16 = 1;
    if (v14)
      goto LABEL_20;
  }
  else
  {
    v16 = objc_msgSend(v9, "isGroup") ^ 1;
    if (v14)
    {
LABEL_20:
      v17 = v13;
      goto LABEL_34;
    }
  }
  if (!v13)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 585, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v38, v37);

    }
    objc_msgSend(v17, "transientIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D7C8E8]);

    if (v19)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithType:revealMode:", 22, v40);
      goto LABEL_34;
    }
  }
  if (!v16)
    goto LABEL_35;
  objc_msgSend(v9, "collection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "px_isMyAlbumsVirtualCollection");

  if (v21)
  {
    objc_msgSend(v13, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_virtualCollections");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rootAlbumCollectionList");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v17 = (id)v24;

    goto LABEL_25;
  }
  objc_msgSend(v9, "collection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "px_isSharedAlbumsVirtualCollection");

  if (v26)
  {
    objc_msgSend(v13, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_virtualCollections");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sharedAlbumsCollectionList");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v17 = v13;
LABEL_25:
  objc_msgSend(v9, "collection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "px_isMyAlbumsVirtualCollection"))
  {

  }
  else
  {
    objc_msgSend(v9, "collection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "px_isSharedAlbumsVirtualCollection");

    if (!v29)
    {
      -[PUSidebarViewController _backNavigationRootItemForItem:](self, "_backNavigationRootItemForItem:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "collection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v32, 0);
      else
        v30 = 0;

      goto LABEL_33;
    }
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v17, 0);
LABEL_33:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:sidebarNavigationBackButtonRootDestination:", v17, v40, v30);

LABEL_34:
  v13 = v17;
  if (v14)
  {
LABEL_37:
    -[PUSidebarViewController _triggerNavigationToDestination:animated:completionHandler:](self, "_triggerNavigationToDestination:animated:completionHandler:", v14, v6, v11);
    goto LABEL_41;
  }
LABEL_35:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = objc_alloc(MEMORY[0x1E0D7B868]);
    objc_msgSend(v9, "importSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v33, "initWithImportSource:revealMode:", v34, v40);

    if (v14)
      goto LABEL_37;
  }
  PLSidebarGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v13;
    _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_ERROR, "Sidebar navigation failed to create destination for collection %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D7CED0], -1, CFSTR("Sidebar navigation failed to create destination for collection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, 0, v14);
LABEL_41:

}

- (void)_triggerNavigationToDestination:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[PUSidebarViewController setIsUpdating:](self, "setIsUpdating:", 1);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __86__PUSidebarViewController__triggerNavigationToDestination_animated_completionHandler___block_invoke;
  v20 = &unk_1E58A1A88;
  v10 = v8;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  objc_copyWeak(&v23, &location);
  v12 = _Block_copy(&v17);
  -[PUSidebarViewController _highlightNavigationDestination:](self, "_highlightNavigationDestination:", v10, v17, v18, v19, v20);
  -[PUSidebarViewController navigationRoot](self, "navigationRoot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
    v15 = 2;
  else
    v15 = 0;
  objc_msgSend(v13, "navigateToDestination:options:completionHandler:", v10, v15, v12);

  -[PUSidebarViewController px_splitViewController](self, "px_splitViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dismissPrimaryColumnIfOverlay");

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_performActionForType:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  const void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PUSidebarViewController *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 650, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType != nil"));

  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D7C258]))
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler == nil"));

    }
    -[PUSidebarViewController _createSharedAlbum](self, "_createSharedAlbum");
  }
  else
  {
    if (v8)
      v9 = v8;
    else
      v9 = &__block_literal_global_196;
    v10 = _Block_copy(v9);

    -[PUSidebarViewController _updateSelectedRowScrollToVisible:](self, "_updateSelectedRowScrollToVisible:", 0);
    v11 = objc_alloc(MEMORY[0x1E0D7B700]);
    -[PUSidebarViewController photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_virtualCollections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootAlbumCollectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithActionType:collectionList:", v7, v14);

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 691, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v15, "setDelegate:", self);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_2;
    v20[3] = &unk_1E58A1AF8;
    v21 = v15;
    v22 = self;
    v8 = v10;
    v23 = v8;
    v16 = v15;
    objc_msgSend(v16, "performActionWithCompletionHandler:", v20);

  }
}

- (PXSelectionContainerProvider)selectionProvider
{
  void *v2;
  void *v3;

  -[PUSidebarViewController splitViewController](self, "splitViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXSelectionProviderForViewController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionContainerProvider *)v3;
}

- (void)validateCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((char *)objc_msgSend(v6, "action") == sel_newAlbum_)
  {
    v3 = (id)*MEMORY[0x1E0D7C240];
    if (v3)
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0D7B700], "localizedTitleForActionType:collectionList:", v3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDiscoverabilityTitle:", v5);

    }
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v8;
  PUSidebarReorderController *v9;
  void *v10;
  void *v11;
  PUSidebarReorderController *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  v4 = a4;
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUSidebarViewController;
  -[PUSidebarViewController setEditing:animated:](&v18, sel_setEditing_animated_, a3, 1);
  -[PUSidebarViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((-[PUSidebarViewController options](self, "options") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 725, CFSTR("Editing should not be allowed."));

    }
    v9 = [PUSidebarReorderController alloc];
    -[PUSidebarViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PUSidebarReorderController initWithDataSource:outlineSectionController:](v9, "initWithDataSource:outlineSectionController:", v10, v11);

  }
  else
  {
    v12 = 0;
  }
  -[PUSidebarViewController setReorderController:](self, "setReorderController:", v12);
  objc_msgSend(v8, "setEditing:", v5);
  if (v5)
  {
    +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sidebarEditAutoExpandToEditableItem");

    if (v14)
    {
      -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "expandItemsToRevealFirstEditableItemIfNeededAnimated:", v4);

    }
  }
  else
  {
    -[PUSidebarViewController _updateSelectedRowScrollToVisible:](self, "_updateSelectedRowScrollToVisible:", 0);
  }

}

- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  PUSidebarViewController *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[PUSidebarViewController options](self, "options") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[PUSidebarViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isDeletable"))
    {
      objc_msgSend(v6, "collection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PXCollectionDeleteConfirmationTitle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0DC36C8];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke;
      v18 = &unk_1E58A1B20;
      v19 = self;
      v20 = v6;
      objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v8, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3D08];
      v21[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1, v15, v16, v17, v18, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configurationWithActions:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)_deleteItemTapped:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v16, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 766, CFSTR("Expected a no nil collection on item %@"), v16);

  }
  -[PUSidebarViewController undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectionDeletionAlertControllerForCollection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceView:", v10);

  objc_msgSend(v14, "setDelegate:", self);
  -[PUSidebarViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = *a5;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[PUSidebarViewController splitViewController](self, "splitViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "showColumn:", 0);

    }
  }

}

- (void)outlineCell:(id)a3 updatedTitle:(id)a4 forItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PUSidebarViewController *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "canPerformEditOperation:", 7) & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B8A0]), "initWithCollection:title:", v9, v7);
    -[PUSidebarViewController undoManager](self, "undoManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__PUSidebarViewController_outlineCell_updatedTitle_forItem___block_invoke;
    v19[3] = &unk_1E58A1B48;
    v12 = v9;
    v20 = v12;
    v21 = v7;
    v22 = self;
    objc_msgSend(v10, "executeWithUndoManager:completionHandler:", v11, v19);

    v13 = (void *)MEMORY[0x1E0D09910];
    v25 = *MEMORY[0x1E0D09818];
    v14 = v25;
    v26 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumRenamed"), v15);

    v16 = (void *)MEMORY[0x1E0D09910];
    v23 = v14;
    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumRenamedFromSidebar"), v17);

  }
  else
  {
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v28 = v9;
      v29 = 2113;
      v30 = v8;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Renaming collection %{private}@ of item %{private}@ is not supported", buf, 0x16u);
    }

    -[PUSidebarViewController sidebarOutlineSectionController](self, "sidebarOutlineSectionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v10, "animateDataSourceUpdates"), 0);
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  PUSidebarViewController *v34;

  v7 = a3;
  v8 = a4;
  -[PUSidebarViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v11, "canContainCollections"))
    {
      objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D7BBE8];
      -[PUSidebarViewController splitViewController](self, "splitViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "popoverPresenterWithViewController:sourceItem:", v24, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUSidebarViewController undoManager](self, "undoManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PXCollectionActionMenuForCollection();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v27 = (void *)MEMORY[0x1E0DC36B8];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
        v30[3] = &unk_1E58A1BB8;
        v31 = v22;
        v28 = v22;
        objc_msgSend(v27, "configurationWithIdentifier:previewProvider:actionProvider:", v10, 0, v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_16;
    }
LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  v12 = v11;
  v13 = -[PUSidebarViewController options](self, "options");
  v14 = objc_msgSend(v12, "assetCollectionSubtype");
  v15 = objc_msgSend(v12, "assetCollectionSubtype");
  if ((v13 & 1) != 0
    || ((v16 = v15, v17 = -[PUSidebarViewController isEditing](self, "isEditing"), v14 != 2)
      ? (v18 = v16 == 101)
      : (v18 = 1),
        !v18 ? (v19 = 0) : (v19 = 1),
        v17 || (v19 & 1) == 0))
  {

    goto LABEL_18;
  }
  v20 = (void *)MEMORY[0x1E0DC36B8];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
  v32[3] = &unk_1E58A1B90;
  v33 = v12;
  v34 = self;
  v21 = v12;
  objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", v10, 0, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
LABEL_19:

  return v22;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "setPreferredCommitStyle:", 0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __100__PUSidebarViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E58ABCA8;
    v9[4] = self;
    v10 = v8;
    objc_msgSend(v7, "addCompletion:", v9);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[PUSidebarViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PUSidebarViewController _handleDidSelectListItem:completionHandler:](self, "_handleDidSelectListItem:completionHandler:", v7, 0);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[PUSidebarViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEditing"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = objc_msgSend(v9, "isGroup") ^ 1;
  }
  objc_msgSend(MEMORY[0x1E0D7B570], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled")
    && objc_msgSend(v11, "enableSidebarHeaderSelection")
    && !-[PUSidebarViewController _isPhotosPicker](self, "_isPhotosPicker"))
  {
    if ((objc_msgSend(v6, "isEditing") & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      if ((objc_msgSend(v9, "isGroup") & 1) == 0)
        goto LABEL_8;
      objc_msgSend(v9, "collection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_8;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
LABEL_8:
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController setSelectingAlreadySelectedIndexPath:](self, "setSelectingAlreadySelectedIndexPath:", objc_msgSend(v12, "containsObject:", v7));

  v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  -[PUSidebarViewController dataSource](self, "dataSource");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  return (v6 & 1) == 0;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUSidebarViewController dropDelegate](self, "dropDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "collectionView:shouldSpringLoadItemAtIndexPath:withContext:", v10, v9, v8);

  return v12;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[PUSidebarViewController reorderController](self, "reorderController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetIndexPathForMoveFromItemAtIndexPath:toProposedIndexPath:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)albumStreamingOptionsViewController:(id)a3 didCompleteWithReason:(int)a4
{
  -[PUSidebarViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[PUSidebarViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PUSidebarViewController splitViewController](self, "splitViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;

  v6 = a5;
  -[PUSidebarViewController splitViewController](self, "splitViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  switch(a5)
  {
    case 1:
      v13 = v10;
      -[PUSidebarViewController px_splitViewController](self, "px_splitViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "selectedNavigationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v12 = v16 != 0;
        if (v16)
          objc_msgSend(v16, "pushViewController:animated:", v13, 1);

      }
      else
      {
        v12 = 0;
      }

      goto LABEL_12;
    case 2:
      -[PUSidebarViewController navigationController](self, "navigationController");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 1;
      objc_msgSend(v13, "presentViewController:animated:completion:", v11, 1, 0);
LABEL_12:

      goto LABEL_13;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 967, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D7B5C8];
    v6 = v8;
    objc_msgSend(v5, "moviePresenterWithPresentingViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v6, 0, 1);

  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v6 = a4;
  if ((-[PUSidebarViewController options](self, "options") & 1) != 0)
    goto LABEL_13;
  if (sel_newAlbum_ != a3 && sel_newSharedAlbum_ != a3 && sel_newFolder_ != a3)
  {
    if (sel_newSmartAlbum_ != a3)
    {
      v14.receiver = self;
      v14.super_class = (Class)PUSidebarViewController;
      v12 = -[PUSidebarViewController canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
      goto LABEL_14;
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  -[PUSidebarViewController splitViewController](self, "splitViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

LABEL_14:
  return v12;
}

- (void)newAlbum:(id)a3
{
  -[PUSidebarViewController _performActionForType:completionHandler:](self, "_performActionForType:completionHandler:", *MEMORY[0x1E0D7C248], 0);
}

- (void)newSmartAlbum:(id)a3
{
  -[PUSidebarViewController _performActionForType:completionHandler:](self, "_performActionForType:completionHandler:", *MEMORY[0x1E0D7C260], 0);
}

- (void)newFolder:(id)a3
{
  -[PUSidebarViewController _performActionForType:completionHandler:](self, "_performActionForType:completionHandler:", *MEMORY[0x1E0D7C250], 0);
}

- (void)_highlightNavigationDestination:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUSidebarViewController currentNavigationDestination](self, "currentNavigationDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    -[PUSidebarViewController setCurrentNavigationDestination:](self, "setCurrentNavigationDestination:", v5);
    -[PUSidebarViewController _updateSelectedRowScrollToVisible:](self, "_updateSelectedRowScrollToVisible:", 1);
  }

}

- (void)selectItemForDestination:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[PUSidebarViewController isUpdating](self, "isUpdating"))
    -[PUSidebarViewController _highlightNavigationDestination:](self, "_highlightNavigationDestination:", v4);

}

- (void)sidebarOutlineSectionController:(id)a3 willApplySnapshotWithChangedItemsAfterChange:(id)a4 applyBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[PUSidebarViewController deferredNavigationItem](self, "deferredNavigationItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v10[2](v10);
  }
  else
  {
    -[PUSidebarViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathsForSelectedItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PUSidebarViewController dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemIdentifierForIndexPath:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    v10[2](v10);
    if (!v12)
      goto LABEL_24;
  }
  -[PUSidebarViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPathForItemIdentifier:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v12, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v9;
    v18 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v18)
    {
      v35 = v10;
      v36 = v9;
      v37 = v8;
      v21 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v20);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v23, "identifier", v35, v36, v37);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", v19);

          if (v25)
          {
            -[PUSidebarViewController dataSource](self, "dataSource");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "indexPathForItemIdentifier:", v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
        }
        v18 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v18)
          continue;
        break;
      }
LABEL_18:
      v9 = v36;
      v8 = v37;
      v10 = v35;
    }

  }
  -[PUSidebarViewController deferredNavigationItem](self, "deferredNavigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  if (v27 && v18)
  {
    -[PUSidebarViewController setDeferredNavigationItem:](self, "setDeferredNavigationItem:", 0);
    v28 = 4;
  }
  -[PUSidebarViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, v28);

LABEL_24:
  -[PUSidebarViewController dataSource](self, "dataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "snapshot");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v31;
  v32 = v31;
  PXFilter();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadItemsWithIdentifiers:", v33);
  -[PUSidebarViewController dataSource](self, "dataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "applySnapshot:animatingDifferences:", v32, objc_msgSend(v8, "animateDataSourceUpdates"));

}

- (void)splitViewControllerWillExpand:(id)a3
{
  void *v4;
  id v5;

  -[PUSidebarViewController navigationRoot](self, "navigationRoot", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_navigationDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSidebarViewController navigateToFallbackForDestination:](self, "navigateToFallbackForDestination:", v4);

}

- (void)navigateToFallbackForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PUSidebarViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_virtualCollections");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allAlbumsCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v12, "rootAlbumCollectionList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v9, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:sidebarNavigationBackButtonRootDestination:", v9, 0, v10);
    -[PUSidebarViewController _triggerNavigationToDestination:animated:completionHandler:](self, "_triggerNavigationToDestination:animated:completionHandler:", v11, 0, 0);

  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUSidebarViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSidebarViewController px_safeAreaInsets](self, "px_safeAreaInsets");
  objc_msgSend(v6, "px_adjustInsetsForKeyboardInfo:safeAreaInsets:", v5);

}

- (void)ppt_runTabSwitchingTestWithName:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void (**v15)(void *, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(void *, _QWORD);
  id v39;
  id v40;
  id v41;
  void (**v42)(void *, _QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v13)
    v13 = &__block_literal_global_237;
  v15 = (void (**)(void *, _QWORD))_Block_copy(v13);
  -[PUSidebarViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("tab"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("all")) & 1) == 0)
  {
    v19 = CFSTR("Sidebar currently only supports switching to all tabs");
    goto LABEL_7;
  }
  v18 = objc_msgSend(v16, "numberOfItemsInSection:", 0);
  if (v18 <= 1)
  {
    v19 = CFSTR("couldn't find sidebar items to cycle through");
LABEL_7:
    objc_msgSend(v12, "failedTest:withFailureFormat:", v10, v19);
    v15[2](v15, 0);
    goto LABEL_22;
  }
  v20 = v18;
  v29 = v12;
  v30 = v17;
  v32 = v11;
  v33 = v10;
  v31 = v16;
  objc_msgSend(v16, "indexPathsForSelectedItems");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0;
  v23 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSidebarViewController dataSource](self, "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itemIdentifierForIndexPath:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "collection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      break;
    objc_msgSend(v21, "addObject:", v26);
    if (!v22)
    {
      if (objc_msgSend(v34, "containsObject:", v24))
        v22 = v26;
      else
        v22 = 0;
    }

    if (v20 == ++v23)
    {
      if (v22)
        goto LABEL_16;
      goto LABEL_19;
    }
  }

  if (v22)
    goto LABEL_16;
LABEL_19:
  objc_msgSend(v21, "firstObject");
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v11 = v32;
  v10 = v33;
  if ((unint64_t)objc_msgSend(v21, "count") > 1)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("iterations"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "integerValue");

    objc_msgSend(v29, "startedTest:", v33);
    objc_msgSend(v21, "count");
    v39 = v29;
    v40 = v33;
    v41 = v21;
    v42 = v15;
    v35 = v22;
    v12 = v29;
    v36 = v39;
    v11 = v32;
    v37 = v40;
    v10 = v33;
    v38 = v42;
    PXIterateAsynchronously();

  }
  else
  {
    v12 = v29;
    objc_msgSend(v29, "failedTest:withFailureFormat:", v33, CFSTR("couldn't find enough sidebar items to cycle through"));
    v15[2](v15, 0);
  }

  v17 = v30;
  v16 = v31;
LABEL_22:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXLibraryFilterStateObservationContext_44248 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSidebarViewController.m"), 1225, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PUSidebarViewController setupDataSectionManagerWithLoadMode:](self, "setupDataSectionManagerWithLoadMode:", 0);
    v9 = v11;
  }

}

- (void)_createSharedAlbum
{
  id v3;
  PHPhotoLibrary *photoLibrary;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0D7B2B0]);
  photoLibrary = self->_photoLibrary;
  objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithPhotoLibrary:presentationEnvironment:", photoLibrary, v5);

  objc_msgSend(v6, "performActionWithCompletionHandler:", 0);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
  {
    PXLemonadeReroutedProgrammaticDestination();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PUSidebarViewController _hasSidebarItemForDestination:](self, "_hasSidebarItemForDestination:", v5))
    {
      v6 = 1;
    }
    else
    {
      PXLemonadeViewControllerFactory();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "sidebarRoutingOptionsForDestination:", v5);

    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUSidebarViewController;
    v6 = -[PUSidebarViewController routingOptionsForDestination:](&v9, sel_routingOptionsForDestination_, v4);
    v5 = v4;
  }

  return v6;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v21 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
  {
    PXLemonadeReroutedProgrammaticDestination();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v9;
  }
  else
  {
    v10 = v21;
  }
  v22 = v10;
  -[PUSidebarViewController _highlightNavigationDestination:](self, "_highlightNavigationDestination:", v10);
  if ((objc_msgSend(v22, "isLemonadeHome") & 1) == 0
    && (!objc_msgSend(v22, "isTargetingAsset") || (objc_msgSend(v22, "isTargetingAlbum") & 1) != 0))
  {
    PXLemonadeViewControllerFactory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerForSidebarNavigationDestination:photoLibrary:", v22, self->_photoLibrary);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (void *)v12;
    goto LABEL_12;
  }
  -[PUSidebarViewController navigationRoot](self, "navigationRoot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "lemonadeRootViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v13 = 0;
LABEL_12:

  -[PUSidebarViewController splitViewController](self, "splitViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewControllerForColumn:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 != v13)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = v13;
    else
      v16 = 0;
    v17 = v16;
    -[PUSidebarViewController actionProviderDelegate](self, "actionProviderDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActionProviderDelegate:", v18);

    -[PUSidebarViewController splitViewController](self, "splitViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setViewController:forColumn:", 0, 2);

    -[PUSidebarViewController splitViewController](self, "splitViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setViewController:forColumn:", v13, 2);

  }
  objc_msgSend(v13, "navigateToDestination:options:completionHandler:", v22, a4, v8);

}

- (PXActionProviderDelegate)actionProviderDelegate
{
  return (PXActionProviderDelegate *)objc_loadWeakRetained((id *)&self->_actionProviderDelegate);
}

- (void)setActionProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionProviderDelegate, a3);
}

- (PXProgrammaticNavigationParticipant)navigationRoot
{
  return self->_navigationRoot;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (PHAssetCollection)pickerAllPhotosVirtualCollection
{
  return self->_pickerAllPhotosVirtualCollection;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXSidebarOutlineSectionController)sidebarOutlineSectionController
{
  return self->_sidebarOutlineSectionController;
}

- (void)setSidebarOutlineSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarOutlineSectionController, a3);
}

- (PUSidebarDataSectionEnablementController)sidebarDataSectionEnablementController
{
  return self->_sidebarDataSectionEnablementController;
}

- (void)setSidebarDataSectionEnablementController:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarDataSectionEnablementController, a3);
}

- (PXSidebarDataController)sidebarDataController
{
  return self->_sidebarDataController;
}

- (void)setSidebarDataController:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarDataController, a3);
}

- (PUCollectionsCollectionViewDropDelegate)dropDelegate
{
  return self->_dropDelegate;
}

- (void)setDropDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_dropDelegate, a3);
}

- (PXProgrammaticNavigationDestination)currentNavigationDestination
{
  return self->_currentNavigationDestination;
}

- (void)setCurrentNavigationDestination:(id)a3
{
  objc_storeStrong((id *)&self->_currentNavigationDestination, a3);
}

- (PUSidebarReorderController)reorderController
{
  return self->_reorderController;
}

- (void)setReorderController:(id)a3
{
  objc_storeStrong((id *)&self->_reorderController, a3);
}

- (PXNavigationListItem)deferredNavigationItem
{
  return self->_deferredNavigationItem;
}

- (void)setDeferredNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_deferredNavigationItem, a3);
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)selectingAlreadySelectedIndexPath
{
  return self->_selectingAlreadySelectedIndexPath;
}

- (void)setSelectingAlreadySelectedIndexPath:(BOOL)a3
{
  self->_selectingAlreadySelectedIndexPath = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (void)setAssetCollectionActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_deferredNavigationItem, 0);
  objc_storeStrong((id *)&self->_reorderController, 0);
  objc_storeStrong((id *)&self->_currentNavigationDestination, 0);
  objc_storeStrong((id *)&self->_dropDelegate, 0);
  objc_storeStrong((id *)&self->_sidebarDataController, 0);
  objc_storeStrong((id *)&self->_sidebarDataSectionEnablementController, 0);
  objc_storeStrong((id *)&self->_sidebarOutlineSectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_pickerAllPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_navigationRoot, 0);
  objc_destroyWeak((id *)&self->_actionProviderDelegate);
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[8];
  v5 = v3;
  v4 = v3;
  PXIterateAsynchronously();

}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_9;
  v4[3] = &unk_1E58A1AF8;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_handleDidSelectListItem:completionHandler:", v3, v4);

}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v3 = a2;
  v4 = objc_msgSend(v3, "index");
  v5 = *(_QWORD *)(a1 + 72);
  if (v4 >= v5)
    v6 = 2 * v5 - v4 - 2;
  else
    v6 = v4;
  if (v6 >= 1)
    objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:", CFSTR("SwitchTab"), *(_QWORD *)(a1 + 40));
  v7 = v6 > 0;
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4;
  v12[3] = &unk_1E58A1C50;
  v17 = v7;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 64);
  v15 = v3;
  v16 = v10;
  v11 = v3;
  objc_msgSend(v9, "_handleDidSelectListItem:completionHandler:", v8, v12);

}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  char v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5;
  v9[3] = &unk_1E58A1C28;
  v15 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v16 = a2;
  v11 = v7;
  v12 = v5;
  v14 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(v6, "scheduleTaskAfterCATransactionCommits:", v9);

}

void __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SwitchTab"), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 73))
  {
    v2 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6;
    block[3] = &unk_1E58ABD10;
    v4 = *(id *)(a1 + 56);
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailureFormat:", *(_QWORD *)(a1 + 40), CFSTR("Error when changing sidebar item:%@"), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

uint64_t __94__PUSidebarViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

BOOL __115__PUSidebarViewController_sidebarOutlineSectionController_willApplySnapshotWithChangedItemsAfterChange_applyBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexOfItemIdentifier:", a2) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __100__PUSidebarViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidSelectListItem:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

id __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  PXPhotosViewConfigurationForAssetCollection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollectionActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_223);
  objc_msgSend(v3, "setPerformerDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setAssetCollectionActionManager:", v3);
  objc_msgSend(MEMORY[0x1E0D7B180], "contextMenuWithActionManager:overrideActions:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __91__PUSidebarViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureStartingSectionHasContent");
}

void __60__PUSidebarViewController_outlineCell_updatedTitle_forItem___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138478339;
      v11 = v7;
      v12 = 2113;
      v13 = v8;
      v14 = 2113;
      v15 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to rename collection %{private}@ to %{private}@ with error %{private}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "sidebarOutlineSectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadFromDataControllerApplyAnimated:onQueue:", objc_msgSend(v9, "animateDataSourceUpdates"), 0);

  }
}

void __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2;
  v10[3] = &unk_1E58AA518;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_deleteItemTapped:sourceView:completion:", v7, a3, v10);

}

uint64_t __73__PUSidebarViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a1[4], "createdCollection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!a2 || !v6)
  {
    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v12 = objc_msgSend(v5, "code");

      if (v12 == 3072)
      {
        PLSidebarGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v14 = "Album creation was cancelled by user";
          v15 = v13;
          v16 = OS_LOG_TYPE_DEFAULT;
          v17 = 2;
LABEL_12:
          _os_log_impl(&dword_1AAB61000, v15, v16, v14, buf, v17);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {

    }
    PLSidebarGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      v14 = "Failed to perform album creation with error \"%@\".";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 12;
      goto LABEL_12;
    }
LABEL_13:

    objc_msgSend(a1[5], "_updateSelectedRowScrollToVisible:", 0);
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_16;
  }
  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sidebarHideNavBackButtonForSelectedItem");

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v7, 0);
  else
    v10 = 0;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:sidebarNavigationBackButtonRootDestination:", v7, 1, v10);
  objc_msgSend(a1[5], "navigationRoot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_3;
  v20[3] = &unk_1E58A1AD0;
  v20[4] = a1[5];
  v21 = v7;
  v22 = a1[6];
  v23 = a2;
  objc_msgSend(v19, "navigateToDestination:options:completionHandler:", v18, 0, v20);

LABEL_16:
}

void __67__PUSidebarViewController__performActionForType_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 1)
  {
    PLSidebarGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to a created album creation with Error \"%@\".", (uint8_t *)&v8, 0xCu);
    }

  }
  PXNavigationListItemWithObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDeferredNavigationItem:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __86__PUSidebarViewController__triggerNavigationToDestination_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 1)
  {
    PLSidebarGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412802;
      v11 = v7;
      v12 = 2048;
      v13 = a2;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Sidebar navigation to destination %@failed with result %ld error %@", (uint8_t *)&v10, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, a2 == 1, v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setIsUpdating:", 0);

}

id __56__PUSidebarViewController__itemIndexPathForDestination___block_invoke(uint64_t a1, void *a2)
{
  return ListItemIdentifierForCollection(a2);
}

uint64_t __63__PUSidebarViewController_setupDataSectionManagerWithLoadMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadFromDataControllerApplyAnimated:onQueue:", *(_QWORD *)(a1 + 40) == 3, 0);
}

void __46__PUSidebarViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_updateHeaderCell:forListItem:", v7, v6);

}

void __46__PUSidebarViewController_configureDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_updateOutlineCell:forListItem:", v7, v6);

}

id __46__PUSidebarViewController_configureDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v7, "isGroup");
  v11 = 40;
  if (v10)
    v11 = 32;
  objc_msgSend(v9, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + v11), v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD block[4];
  id v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "sidebarOutlineSectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionControllerWillExpandItem:", v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUSidebarViewController_configureDataSource__block_invoke_5;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v7, v2);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "sidebarOutlineSectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionControllerWillCollapseItem:", v3);

}

uint64_t __46__PUSidebarViewController_configureDataSource__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "reorderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canReorderItem:", v3);

  return v6;
}

void __46__PUSidebarViewController_configureDataSource__block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "reorderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performReorderWithTransaction:", v3);

}

void __46__PUSidebarViewController_configureDataSource__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSelectedRowScrollToVisible:", 0);

}

void __58__PUSidebarViewController__updateOutlineCell_forListItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

}

id __41__PUSidebarViewController_generateLayout__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_trailingSwipeActionConfigurationForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
