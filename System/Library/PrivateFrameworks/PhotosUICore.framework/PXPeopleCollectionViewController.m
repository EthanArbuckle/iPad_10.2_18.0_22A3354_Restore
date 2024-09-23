@implementation PXPeopleCollectionViewController

- (PXPeopleCollectionViewController)initWithDataSource:(id)a3 progressManager:(id)a4 libraryFilterState:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPeopleDragAndDropCollectionViewLayout *v12;
  PXPeopleCollectionViewController *v13;
  void *v14;
  uint64_t v15;
  PHPhotoLibrary *photoLibrary;
  void *v17;
  uint64_t v18;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  id v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(PXPeopleDragAndDropCollectionViewLayout);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:", 0.0);
  v22.receiver = self;
  v22.super_class = (Class)PXPeopleCollectionViewController;
  v13 = -[PXPeopleCollectionViewController initWithCollectionViewLayout:](&v22, sel_initWithCollectionViewLayout_, v12);
  if (v13)
  {
    objc_msgSend(v10, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoLibrary");
    v15 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v13->_photoLibrary;
    v13->_photoLibrary = (PHPhotoLibrary *)v15;

    -[PXPeopleCollectionViewController setInstallsStandardGestureForInteractiveMovement:](v13, "setInstallsStandardGestureForInteractiveMovement:", 0);
    -[UIViewController px_enableBarAppearance](v13, "px_enableBarAppearance");
    -[PXPeopleCollectionViewController setNeedToCheckProgress:](v13, "setNeedToCheckProgress:", 1);
    v13->_mode = 0;
    objc_storeStrong((id *)&v13->_dataSource, a3);
    -[PXPeopleSectionedDataSource addChangeObserver:](v13->_dataSource, "addChangeObserver:", v13);
    objc_storeStrong((id *)&v13->_progressManager, a4);
    -[PXPeopleProgressManager setUpdateInterval:](v13->_progressManager, "setUpdateInterval:", 30.0);
    v13->_progressFooterState = 0;
    -[PXPeopleCollectionViewController navigationItem](v13, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_setPreferredLargeTitleDisplayMode:", 2);

    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v13->_photoLibrary);
    v18 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v13->_sharedLibraryStatusProvider;
    v13->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v18;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v13->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v13, PXSharedLibraryStatusProviderObservationContext_192501);
    objc_storeStrong((id *)&v13->_libraryFilterState, a5);
    -[PXLibraryFilterState registerChangeObserver:context:](v13->_libraryFilterState, "registerChangeObserver:context:", v13, PXLibraryFilterStateObservationContext_192502);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PXPeopleCollectionViewController setPpt_seenPeople:](v13, "setPpt_seenPeople:", v20);

    -[PXPeopleCollectionViewController setPpt_numCellsLeft:](v13, "setPpt_numCellsLeft:", -1);
  }

  return v13;
}

- (PXPeopleCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 205, CFSTR("%s is not available as initializer"), "-[PXPeopleCollectionViewController initWithNibName:bundle:]");

  abort();
}

- (PXPeopleCollectionViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 209, CFSTR("%s is not available as initializer"), "-[PXPeopleCollectionViewController initWithCoder:]");

  abort();
}

- (PXPeopleCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 213, CFSTR("%s is not available as initializer"), "-[PXPeopleCollectionViewController initWithCollectionViewLayout:]");

  abort();
}

- (PXPeopleCollectionViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 217, CFSTR("%s is not available as initializer"), "-[PXPeopleCollectionViewController init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChangeObserver:", self);

  -[PXPeopleCollectionViewController _stopProgressMonitoring](self, "_stopProgressMonitoring");
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  PXPeopleDragAndDropCollectionView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  PXPeopleDragAndDropCollectionView *v14;
  PXPeopleSwipeSelectionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  PXPeopleProgressFooterView *v21;
  PXPeopleProgressFooterView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIFocusGuide *v28;
  UIFocusGuide *favoritesLeadingFocusGuide;
  UIFocusGuide *v30;
  UIFocusGuide *favoritesTrailingFocusGuide;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXPeopleDragAndDropCollectionView alloc];
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXPeopleDragAndDropCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);

  -[PXPeopleDragAndDropCollectionView setRemembersLastFocusedIndexPath:](v14, "setRemembersLastFocusedIndexPath:", 1);
  -[PXPeopleDragAndDropCollectionView setAlwaysBounceVertical:](v14, "setAlwaysBounceVertical:", 1);
  -[PXPeopleCollectionViewController setCollectionView:](self, "setCollectionView:", v14);
  -[PXPeopleDragAndDropCollectionView setDragDropDelegate:](v14, "setDragDropDelegate:", self);
  if (!-[PXPeopleCollectionViewController isInSelectionOnlyMode](self, "isInSelectionOnlyMode"))
  {
    v15 = -[PXPeopleSwipeSelectionManager initWithScrollView:]([PXPeopleSwipeSelectionManager alloc], "initWithScrollView:", v14);
    -[PXPeopleSwipeSelectionManager setDelegate:](v15, "setDelegate:", self);
    -[PXPeopleSwipeSelectionManager swipeGestureRecognizer](v15, "swipeGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", 0);
    -[PXPeopleDragAndDropCollectionView superview](v14, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addGestureRecognizer:", v16);

    -[PXPeopleCollectionViewController setSwipeSelectionManager:](self, "setSwipeSelectionManager:", v15);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDragAndDropCollectionView setBackgroundColor:](v14, "setBackgroundColor:", v18);

  -[PXPeopleDragAndDropCollectionView registerClass:forCellWithReuseIdentifier:](v14, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PeopleHomeCell"));
  v19 = objc_opt_class();
  v20 = *MEMORY[0x1E0DC48A8];
  -[PXPeopleDragAndDropCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v14, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v19, *MEMORY[0x1E0DC48A8], CFSTR("PeopleHomeMeHeader"));
  -[PXPeopleDragAndDropCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v14, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v20, CFSTR("PeopleHomeSeparatorHeader"));
  -[PXPeopleDragAndDropCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v14, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("PeopleHomeFooter"));
  if (-[PXPeopleCollectionViewController isProgressFooterAvailable](self, "isProgressFooterAvailable"))
  {
    v21 = [PXPeopleProgressFooterView alloc];
    v22 = -[PXPeopleProgressFooterView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PXPeopleCollectionViewController setProgressFooterView:](self, "setProgressFooterView:", v22);

  }
  -[PXPeopleCollectionViewController _createAddPeopleButton](self, "_createAddPeopleButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController setAddPeopleButton:](self, "setAddPeopleButton:", v23);

  -[PXPeopleDragAndDropCollectionView _setShouldPrefetchCellsWhenPerformingReloadData:](v14, "_setShouldPrefetchCellsWhenPerformingReloadData:", 1);
  -[PXPeopleDragAndDropCollectionView setPrefetchingEnabled:](v14, "setPrefetchingEnabled:", 0);
  if (!-[PXPeopleCollectionViewController isInSelectionOnlyMode](self, "isInSelectionOnlyMode"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_handleReorderingGesture_);
    objc_msgSend(v24, "setMinimumPressDuration:", 0.2);
    objc_msgSend(v24, "setDelegate:", self);
    -[PXPeopleCollectionViewController setDragRecognizer:](self, "setDragRecognizer:", v24);
    -[PXPeopleDragAndDropCollectionView addGestureRecognizer:](v14, "addGestureRecognizer:", v24);
    -[PXPeopleCollectionViewController _updateNavigationItem](self, "_updateNavigationItem");
    -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "px_setPreferredLargeTitleDisplayMode:", 2);
    if (PFOSVariantHasInternalUI())
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_statusDebugRecognizerTapped_);
      objc_msgSend(v26, "setNumberOfTapsRequired:", 2);
      -[PXPeopleCollectionViewController progressFooterView](self, "progressFooterView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addGestureRecognizer:", v26);

      -[PXPeopleCollectionViewController setStatusDebugRecognizer:](self, "setStatusDebugRecognizer:", v26);
    }

  }
  v28 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
  favoritesLeadingFocusGuide = self->_favoritesLeadingFocusGuide;
  self->_favoritesLeadingFocusGuide = v28;

  -[UIFocusGuide setIdentifier:](self->_favoritesLeadingFocusGuide, "setIdentifier:", CFSTR("FavoritesLeading"));
  v30 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
  favoritesTrailingFocusGuide = self->_favoritesTrailingFocusGuide;
  self->_favoritesTrailingFocusGuide = v30;

  -[UIFocusGuide setIdentifier:](self->_favoritesTrailingFocusGuide, "setIdentifier:", CFSTR("FavoritesTrailing"));
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x100000, sel_showPerson_);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController addKeyCommand:](self, "addKeyCommand:", v32);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("."), 0, sel_toggleFavorite_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController addKeyCommand:](self, "addKeyCommand:", v33);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel_removePerson_);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController addKeyCommand:](self, "addKeyCommand:", v34);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  if (!-[PXPeopleCollectionViewController isInSelectionOnlyMode](self, "isInSelectionOnlyMode"))
  {
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChangeObserver:", self);

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startListeningToLibraryNotifications");

  -[PXPeopleCollectionViewController _updateAddPeopleButton](self, "_updateAddPeopleButton");
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChangeObserver:", self);

  if (-[PXPeopleCollectionViewController isProgressFooterAvailable](self, "isProgressFooterAvailable"))
    -[PXPeopleCollectionViewController _stopProgressMonitoring](self, "_stopProgressMonitoring");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleCollectionViewController;
  v7 = a4;
  -[PXPeopleCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PXPeopleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5148240;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleCollectionViewController;
  -[PXPeopleCollectionViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[PXPeopleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[PXPeopleCollectionViewController _updateVisibleCellsForSelectionMode:](self, "_updateVisibleCellsForSelectionMode:");
  }
}

- (BOOL)shouldShowProgressFooter
{
  return -[PXPeopleCollectionViewController progressFooterState](self, "progressFooterState") == 1;
}

- (int64_t)progressFooterState
{
  -[PXPeopleCollectionViewController _updateProgressFooterStateWithForce:](self, "_updateProgressFooterStateWithForce:", 0);
  return self->_progressFooterState;
}

- (void)enterSelectionModeWithSelectionHandler:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXPeopleCollectionViewController selectionHandler](self, "selectionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 380, CFSTR("self.selectionHandler must be nil before trying to set a selection handler!"));

  }
  -[PXPeopleCollectionViewController setIsInSelectionOnlyMode:](self, "setIsInSelectionOnlyMode:", 1);
  -[PXPeopleCollectionViewController setSelectionHandler:](self, "setSelectionHandler:", v7);

}

- (id)selectionModeTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;

  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_peoplePetsHomeVisibility");

  PXLocalizedStringFromTable(CFSTR("PXPeopleHomeSelectPeopleTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPeoplePetsHomeTitle(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShouldShowMeHeader:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_shouldShowMeHeader != a3)
  {
    v3 = a3;
    -[PXPeopleCollectionViewController meViewController](self, "meViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      self->_shouldShowMeHeader = v3;
      -[PXPeopleCollectionViewController _updateMeHeaderVisibilityIfNeeded:animated:](self, "_updateMeHeaderVisibilityIfNeeded:animated:", v3, 1);
    }
  }
}

- (void)_updateMeHeaderVisibilityIfNeeded:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  v4 = 0.1;
  if (!a4)
    v4 = 0.0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PXPeopleCollectionViewController__updateMeHeaderVisibilityIfNeeded_animated___block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, v4, 0.0);
}

- (void)_updateVisibleCellsForSelectionMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    v10 = a3 == 0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setSelectionStyle:", v10, (_QWORD)v12);
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (unint64_t)_fixedColumnCountForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[PXPeopleCollectionViewController _horizontalSizeClass](self, "_horizontalSizeClass");
  v6 = -[PXPeopleCollectionViewController _verticalSizeClass](self, "_verticalSizeClass");
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v10 = 5;
  if (v9 > 1024.0)
  {
    v11 = 2;
  }
  else
  {
    v10 = 4;
    v11 = 1;
  }
  if (v5 != 2)
    v10 = 2;
  if (v6 == 1)
    v12 = 4;
  else
    v12 = v10;
  v13 = objc_msgSend(v4, "section");

  if (v13 <= 0)
    v14 = 0;
  else
    v14 = v11;
  return v12 + v14;
}

- (int64_t)_horizontalSizeClass
{
  void *v2;
  int64_t v3;

  -[PXPeopleCollectionViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3;
}

- (int64_t)_verticalSizeClass
{
  void *v2;
  int64_t v3;

  -[PXPeopleCollectionViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");

  return v3;
}

- (CGSize)_itemSizeForItemAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  CGSize result;

  v4 = -[PXPeopleCollectionViewController _fixedColumnCountForIndexPath:](self, "_fixedColumnCountForIndexPath:", a3);
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;

  v10 = v9 + v7 + 24.0;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  v14 = (v13 - v10 + (float)((float)(v4 - 1) * -20.0)) / (double)v4;
  v15 = floorf(v14);
  v16 = v15;
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)_bottomInsetForSection:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  double result;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections") - 1;

  result = 40.0;
  if (v5 == a3)
    return 20.0;
  return result;
}

- (void)_updateNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _rightBarItemsForMode:](self, "_rightBarItemsForMode:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItems:", v3);
  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(v4, "px_peoplePetsHomeVisibility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v5);

  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "useGridZeroForDetails");

  if ((_DWORD)v5)
    v7 = 0;
  else
    v7 = 2;
  objc_msgSend(v8, "px_setBackButtonDisplayMode:", v7);

}

- (void)_shouldShowProgressFooterWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXPeopleCollectionViewController progressManager](self, "progressManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PXPeopleCollectionViewController__shouldShowProgressFooterWithCompletion___block_invoke;
  v7[3] = &unk_1E513FE10;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "shouldUseProgressFooterWithCompletion:", v7);

}

- (void)_updateProgressFooterStateWithForce:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (a3 || !self->_progressFooterState)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__PXPeopleCollectionViewController__updateProgressFooterStateWithForce___block_invoke;
    v4[3] = &unk_1E5142510;
    objc_copyWeak(&v5, &location);
    -[PXPeopleCollectionViewController _shouldShowProgressFooterWithCompletion:](self, "_shouldShowProgressFooterWithCompletion:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)focusedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXPeopleCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForCell:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)toggleFavorite:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PXPeopleCollectionViewController focusedIndexPath](self, "focusedIndexPath", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _changePersonsAtIndexPaths:toPersonType:](self, "_changePersonsAtIndexPaths:toPersonType:", v6, -[PXPeopleCollectionViewController _changeTypeForIndexPaths:](self, "_changeTypeForIndexPaths:", v6));

  }
}

- (void)removePerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PXPeopleCollectionViewController focusedIndexPath](self, "focusedIndexPath", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXPeopleCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _initiatePersonRemovingWithSourceItem:](self, "_initiatePersonRemovingWithSourceItem:", v5);

  }
}

- (void)showPerson:(id)a3
{
  void *v4;
  BOOL v5;
  unint64_t v6;
  void *v7;

  -[PXPeopleCollectionViewController focusedIndexPath](self, "focusedIndexPath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    v5 = -[PXPeopleCollectionViewController isInSelectionOnlyMode](self, "isInSelectionOnlyMode");
    v4 = v7;
    if (!v5)
    {
      v6 = -[PXPeopleCollectionViewController mode](self, "mode");
      v4 = v7;
      if (!v6)
      {
        -[PXPeopleCollectionViewController showDetailsForMemberAtIndexPath:](self, "showDetailsForMemberAtIndexPath:", v7);
        v4 = v7;
      }
    }
  }

}

- (void)showDetailsForMemberAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXPeopleCollectionViewController _detailViewControllerAtIndexPath:](self, "_detailViewControllerAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXPeopleCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController showViewController:sender:](self, "showViewController:sender:", v4, v6);

  }
}

- (id)_detailViewControllerAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosUIViewController *v11;
  PXPeopleDetailViewController *v12;
  PXPhotosUIViewController *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "useGridZeroForDetails");

  if ((_DWORD)v5)
  {
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotosViewConfigurationForPeople(v8, 0, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v10);
  }
  else
  {
    v12 = [PXPeopleDetailViewController alloc];
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXPeopleDetailViewController initWithPeople:ignoreSharedLibraryFilters:](v12, "initWithPeople:ignoreSharedLibraryFilters:", v10, 0);
  }
  v13 = v11;

  return v13;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfDisclosedSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfPersonsInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _OWORD v40[3];
  _OWORD v41[2];
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  id v48[2];
  id location[2];

  v6 = a3;
  v7 = a4;
  v39 = v6;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PeopleHomeCell"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "memberAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceImage");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "setImage:", v11);
  v12 = (void *)(objc_msgSend(v8, "tag", v11) + 1);
  objc_msgSend(v8, "setTag:", v12);
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v10;
  objc_msgSend(v10, "setCellUUID:", v13);

  -[PXPeopleCollectionViewController _itemSizeForItemAtIndexPath:](self, "_itemSizeForItemAtIndexPath:", v7);
  v15 = v14;
  v17 = v16;
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldDebugBlurredCells");

  if (v19 && (objc_msgSend(v7, "item") & 0x8000000000000003) == 1)
    v17 = v15;
  objc_msgSend(v9, "personAtIndexPath:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXPeopleCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E5133E50;
  v22 = v8;
  v46 = v22;
  v48[1] = v12;
  objc_copyWeak(v48, location);
  v23 = v20;
  v47 = v23;
  v24 = _Block_copy(aBlock);
  objc_msgSend(v39, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displayScale");
  v27 = v26;
  v43[0] = v21;
  v43[1] = 3221225472;
  v43[2] = __74__PXPeopleCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v43[3] = &unk_1E5133E78;
  v28 = v24;
  v44 = v28;
  objc_msgSend(v9, "imageAtIndexPath:targetSize:displayScale:resultHandler:", v7, v43, v15, v17, v27);

  objc_msgSend(v9, "titleAtIndexPath:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "avatarView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", 1.0);
  objc_msgSend(v30, "setHighlighted:", 0);
  v37 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v41[0] = *MEMORY[0x1E0C9BAA8];
  v38 = v41[0];
  v41[1] = v37;
  v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v36 = v42;
  objc_msgSend(v30, "setTransform:", v41);
  v40[0] = v38;
  v40[1] = v37;
  v40[2] = v36;
  objc_msgSend(v22, "setTransform:", v40);
  objc_msgSend(v22, "setName:", v29);
  objc_msgSend(v22, "setTextAlpha:", 1.0);
  objc_msgSend(v9, "personAtIndexPath:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFavorite:", objc_msgSend(v31, "type") == 1);

  objc_msgSend(v22, "setSelectionStyle:", -[PXPeopleCollectionViewController mode](self, "mode") == 0);
  objc_msgSend(v22, "setPeopleCellDelegate:", self);
  v32 = v22;

  objc_destroyWeak(v48);
  objc_destroyWeak(location);

  return v32;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  void *v58;
  _QWORD v59[4];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    if (objc_msgSend(v11, "section")
      || !-[PXPeopleCollectionViewController shouldShowMeHeader](self, "shouldShowMeHeader")
      || -[PXPeopleCollectionViewController mode](self, "mode"))
    {
      if (objc_msgSend(v11, "section") == 1)
      {
        objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("PeopleHomeSeparatorHeader"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subviews");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackgroundColor:", v16);

          objc_msgSend(v15, "setUserInteractionEnabled:", 0);
          objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v12, "addSubview:", v15);
          v47 = (void *)MEMORY[0x1E0CB3718];
          objc_msgSend(v15, "leadingAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "leadingAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "constraintEqualToAnchor:", v55);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = v53;
          objc_msgSend(v15, "trailingAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "trailingAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "constraintEqualToAnchor:", v49);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v59[1] = v45;
          objc_msgSend(v15, "topAnchor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "topAnchor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "constraintEqualToAnchor:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v59[2] = v18;
          objc_msgSend(v15, "heightAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "px_screenScale");
          objc_msgSend(v19, "constraintEqualToConstant:", 1.0 / v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v59[3] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "activateConstraints:", v22);

        }
      }
      else
      {
        objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("PeopleHomeMeHeader"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("PeopleHomeMeHeader"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subviews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (!v32)
      {
        -[PXPeopleCollectionViewController meViewController](self, "meViewController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PXPeopleCollectionViewController addChildViewController:](self, "addChildViewController:", v58);
        objc_msgSend(v58, "didMoveToParentViewController:", self);
        objc_msgSend(v58, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", v34);

        v46 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v33, "leadingAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "leadingAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToAnchor:", v54);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v52;
        objc_msgSend(v33, "trailingAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "trailingAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v48);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v44;
        objc_msgSend(v33, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bottomAnchor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "constraintEqualToAnchor:", v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v60[2] = v35;
        objc_msgSend(v12, "topAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "topAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToAnchor:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v60[3] = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "activateConstraints:", v39);

      }
    }
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48A0]))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 685, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, CFSTR("PeopleHomeFooter"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", -[PXPeopleCollectionViewController mode](self, "mode") == 1);
    v23 = objc_msgSend(v11, "section");
    -[PXPeopleCollectionViewController dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "numberOfSections") - 1;

    if (v23 == v25)
    {
      -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "containsView:", v26) & 1) != 0)
      {
        -[PXPeopleCollectionViewController progressFooterView](self, "progressFooterView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v12, "containsView:", v27);
        v29 = -[PXPeopleCollectionViewController shouldShowProgressFooter](self, "shouldShowProgressFooter");

        if (v28 == v29)
          goto LABEL_16;
      }
      else
      {

      }
      -[PXPeopleCollectionViewController _configureFooterInView:](self, "_configureFooterInView:", v12);
    }
  }
LABEL_16:

  return v12;
}

- (void)_configureFooterInView:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
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
  PXPeopleCollectionViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PXPeopleCollectionViewController *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  _QWORD v59[2];
  _QWORD v60[4];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v7);
  }

  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "setUserInteractionEnabled:", 0);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v10);
  objc_msgSend(v10, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v44;
  objc_msgSend(v10, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v13;
  objc_msgSend(v10, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 16.0);
  v52 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v16;
  objc_msgSend(v10, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController collectionView](v52, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "px_screenScale");
  objc_msgSend(v17, "constraintEqualToConstant:", 1.0 / v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v51 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObjectsFromArray:", v21);

  v22 = v51;
  v23 = v50;

  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v51, "addSubview:", v50);
  objc_msgSend(v50, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v26;
  objc_msgSend(v50, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObjectsFromArray:", v30);

  v31 = v52;
  if (-[PXPeopleCollectionViewController shouldShowProgressFooter](v52, "shouldShowProgressFooter"))
  {
    -[PXPeopleCollectionViewController progressFooterView](v52, "progressFooterView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v51, "addSubview:", v32);
    objc_msgSend(v32, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v45;
    objc_msgSend(v32, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v40;
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v35;
    objc_msgSend(v32, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 20.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObjectsFromArray:", v39);

    v23 = v50;
    v22 = v51;

    v31 = v52;
  }
  -[PXPeopleCollectionViewController _updateProgressFooterText](v31, "_updateProgressFooterText");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v53);

}

- (UIBarButtonItem)rightBarButtonItem
{
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *rightBarButtonItem;
  UIBarButtonItem *v9;

  if (-[PXPeopleCollectionViewController mode](self, "mode") == 1)
  {
    v3 = CFSTR("PXPeopleHomeCancelButtonTitle");
  }
  else
  {
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(v4, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeSelectButtonTitle"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_rightBarButtonItem)
  {
    PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](self->_rightBarButtonItem, "setTitle:", v5);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v6, "initWithTitle:style:target:action:", v5, 0, self, sel__selectAction_);
    rightBarButtonItem = self->_rightBarButtonItem;
    self->_rightBarButtonItem = v7;

  }
  v9 = self->_rightBarButtonItem;

  return v9;
}

- (void)_selectAction:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  PXBarAnimationOptions *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  BOOL v32;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPeopleCollectionViewController mode](self, "mode");
  v7 = v6 == 0;
  -[PXPeopleCollectionViewController setMode:](self, "setMode:", v7);
  -[PXPeopleCollectionViewController swipeSelectionManager](self, "swipeSelectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "swipeGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  -[PXPeopleCollectionViewController _rightBarItemsForMode:](self, "_rightBarItemsForMode:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _leftBarItemsForMode:](self, "_leftBarItemsForMode:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v10;
  objc_msgSend(v5, "setRightBarButtonItems:", v10);
  objc_msgSend(v5, "setLeftBarButtonItems:", v11);
  if (v6 && objc_msgSend(v5, "px_hidesBackButtonInRegularWidth"))
  {
    -[PXPeopleCollectionViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_updateBackButtonVisibilityForTraitCollection:", v12);

  }
  else
  {
    objc_msgSend(v5, "setHidesBackButton:animated:", v6 == 0, 0);
  }
  v13 = v6 != 0;
  -[PXPeopleCollectionViewController _toolBarItemsForMode:](self, "_toolBarItemsForMode:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setToolbarItems:", v14);

  -[PXPeopleCollectionViewController dragRecognizer](self, "dragRecognizer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v13);

  objc_msgSend(v4, "setAllowsMultipleSelection:", v6 == 0);
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v6)
  {
    objc_msgSend(v18, "resumeListeningForChanges");

    objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", 0, 0, 0);
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(v20, "px_peoplePetsHomeVisibility"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v21);

  }
  else
  {
    objc_msgSend(v18, "pauseListeningForChangesWithTimeout:identifier:", CFSTR("PXPeopleCollectionViewController"), 10000.0);

    -[PXPeopleCollectionViewController _updateNavTitleForIndexes:](self, "_updateNavTitleForIndexes:", 0);
  }
  -[PXPeopleCollectionViewController setShouldShowMeHeader:](self, "setShouldShowMeHeader:", v13);
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    if (objc_msgSend(v23, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 786, CFSTR("Only 1 section footer supported"));

    }
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", v6 == 0);

  }
  v25 = v6 == 0;
  v26 = -[PXBarAnimationOptions initWithType:]([PXBarAnimationOptions alloc], "initWithType:", 0);
  -[UIViewController px_barAppearance](self, "px_barAppearance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __50__PXPeopleCollectionViewController__selectAction___block_invoke;
  v31[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
  v32 = v25;
  objc_msgSend(v27, "performChangesWithAnimationOptions:changes:", v26, v31);

  -[PXPeopleCollectionViewController _updateToolbarItemsForIndexPaths:](self, "_updateToolbarItemsForIndexPaths:", 0);
}

- (void)setPeopleHomeSortingType:(unint64_t)a3
{
  id v5;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPeopleHomeSortingType:", a3);
  self->_peopleHomeSortingType = objc_msgSend(v5, "peopleHomeSortingType");
  -[PXPeopleCollectionViewController _updateNavigationItem](self, "_updateNavigationItem");

}

- (id)_toolBarItemsForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PXPeopleCollectionViewController removeToolbarItem](self, "removeToolbarItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController favoriteToolbarItem](self, "favoriteToolbarItem", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v10[3] = v4;
  -[PXPeopleCollectionViewController mergeToolbarItem](self, "mergeToolbarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_rightBarItemsForMode:(unint64_t)a3
{
  __CFString *v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v44[5];
  _QWORD v45[5];
  uint64_t v46;
  _QWORD v47[2];
  void *v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  if (-[PXPeopleCollectionViewController mode](self, "mode") == 1)
  {
    v5 = CFSTR("PXPeopleHomeCancelButtonTitle");
  }
  else
  {
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(v6, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeSelectButtonTitle"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0DC3518];
  v8 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __58__PXPeopleCollectionViewController__rightBarItemsForMode___block_invoke;
  v45[3] = &unk_1E513C038;
  v45[4] = self;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v45);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonWithType:primaryAction:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController _formattingButtonWithBackground:](self, "_formattingButtonWithBackground:", v11);
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *MEMORY[0x1E0DC1138];
  v50[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeWithAttributes:", v15);
  v18 = v17;
  v20 = v19;

  objc_msgSend(v11, "setFrame:", 0.0, 0.0, v18 + 15.0, v20);
  objc_msgSend(v11, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v11, "frame");
  PXSizeScale();
  PXSizeAdd();
  PXRectWithOriginAndSize();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v11, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v11);
  v32 = (void *)v31;
  if (a3 == 1)
  {
    v46 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _formattingButtonWithBackground:](self, "_formattingButtonWithBackground:", v35);
    objc_msgSend(v35, "setFrame:", 0.0, 0.0, 28.0, 28.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageByApplyingSymbolConfiguration:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "setImage:forState:", v38, 0);
    objc_msgSend(v35, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v35, "setContextMenuInteractionEnabled:", 1);
    v39 = (void *)MEMORY[0x1E0DC39D0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __58__PXPeopleCollectionViewController__rightBarItemsForMode___block_invoke_2;
    v44[3] = &unk_1E5133EC0;
    v44[4] = self;
    objc_msgSend(MEMORY[0x1E0DC36F8], "elementWithUncachedProvider:", v44);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "menuWithChildren:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMenu:", v42);

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v35);
    v47[0] = v34;
    v47[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v33;
}

- (id)_peopleSortActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "peopleHomeSortingType");

  if (v4 == 1)
    v5 = 2;
  else
    v5 = 1;
  v6 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXPeopleHomeNameActionTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__PXPeopleCollectionViewController__peopleSortActions__block_invoke;
  v19[3] = &unk_1E5133EE8;
  v19[4] = self;
  v19[5] = v5;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXPeopleHomeCustomActionTitle"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __54__PXPeopleCollectionViewController__peopleSortActions__block_invoke_2;
  v18[3] = &unk_1E513C038;
  v18[4] = self;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setState:", 0);
  objc_msgSend(v12, "setState:", 0);
  v13 = v12;
  switch(v4)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v14 = CFSTR("chevron.up");
      goto LABEL_9;
    case 2:
      v14 = CFSTR("chevron.down");
LABEL_9:
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v15);

      v13 = v9;
LABEL_10:
      objc_msgSend(v13, "setState:", 1);
      break;
  }
  v20[0] = v9;
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_leftBarItemsForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  PXPeopleInternalAnnotationFlowManager *v8;
  void *v9;
  PXPeopleInternalAnnotationFlowManager *v10;
  PXPeopleInternalAnnotationFlowManager *annotationFlowManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  UIBarButtonItem **p_annotateBarButtonItem;
  UIBarButtonItem *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id location;
  UIBarButtonItem *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
    return MEMORY[0x1E0C9AA60];
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "canShowInternalUI") & 1) == 0)
  {

    return MEMORY[0x1E0C9AA60];
  }
  +[PXPeopleDetailSettings sharedInstance](PXPeopleDetailSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showAnnotateButton");

  if (!v6)
    return MEMORY[0x1E0C9AA60];
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  if (!self->_annotationFlowManager)
  {
    v8 = [PXPeopleInternalAnnotationFlowManager alloc];
    -[PXPeopleCollectionViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __57__PXPeopleCollectionViewController__leftBarItemsForMode___block_invoke;
    v29[3] = &unk_1E5148D30;
    objc_copyWeak(&v30, &location);
    v10 = -[PXPeopleInternalAnnotationFlowManager initWithPeopleCollectionViewController:dataSource:completion:](v8, "initWithPeopleCollectionViewController:dataSource:completion:", self, v9, v29);
    annotationFlowManager = self->_annotationFlowManager;
    self->_annotationFlowManager = v10;

    objc_destroyWeak(&v30);
  }
  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v12, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeInternalAnnotationButtonTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3518];
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __57__PXPeopleCollectionViewController__leftBarItemsForMode___block_invoke_2;
  v28[3] = &unk_1E513C038;
  v28[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v13, 0, 0, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "buttonWithType:primaryAction:", 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController _formattingButtonWithBackground:](self, "_formattingButtonWithBackground:", v16);
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0DC1138];
  v34[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeWithAttributes:", v20);
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v21 + 15.0, v22);
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v16);
  p_annotateBarButtonItem = &self->_annotateBarButtonItem;
  v25 = *p_annotateBarButtonItem;
  *p_annotateBarButtonItem = (UIBarButtonItem *)v23;

  v32 = *p_annotateBarButtonItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v26;
}

- (void)_formattingButtonWithBackground:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 14.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v6);

}

- (int64_t)_changeTypeForIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 1;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(v5, "personAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (!v13)
        break;
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (BOOL)_indexPathsContainMixedSections:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = -1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "section", (_QWORD)v10);
        if (v6 == -1)
        {
          v6 = v8;
        }
        else if (v8 != v6)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
LABEL_12:

  return v4;
}

- (id)_bestTargetIndexPathGivenMergeIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  BOOL v18;
  char v19;
  void *v21;
  id obj;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = -[PXPeopleCollectionViewController _indexPathsContainMixedSections:](self, "_indexPathsContainMixedSections:", v4);
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v6 = 0;
  if (v26)
  {
    v24 = *(_QWORD *)v28;
    v7 = -1;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        objc_msgSend(v5, "personAtIndexPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "type");
        v13 = objc_msgSend(v11, "faceCount");
        v14 = 10;
        if (v12)
          v14 = 0;
        if (v12 == 1)
          v15 = 20;
        else
          v15 = v14;
        objc_msgSend(v11, "px_localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length") != 0;

        v18 = (v15 | v17) <= v7;
        v19 = (v15 | v17) != v7 || v25;
        if ((v19 & 1) == 0)
          v18 = v13 <= objc_msgSend(v5, "photoQuantityAtIndexPath:", v9);
        if (!v18)
          v21 = v10;
        else
          v21 = v9;
        v6 = v21;

        if ((v15 | v17) > v7)
          v7 = v15 | v17;

        ++v8;
        v9 = v6;
      }
      while (v26 != v8);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v26);
  }

  return v6;
}

- (void)_updateToolbarItemsForIndexPaths:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  _BOOL8 v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleCollectionViewController favoriteToolbarItem](self, "favoriteToolbarItem");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController mergeToolbarItem](self, "mergeToolbarItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController removeToolbarItem](self, "removeToolbarItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPeopleCollectionViewController _changeTypeForIndexPaths:](self, "_changeTypeForIndexPaths:", v4);
  v7 = objc_msgSend(v4, "count");
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personsAtIndexPaths:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_peoplePetsHomeVisibility");
  v12 = CFSTR("PXPeopleHomeFavoriteMultipleAssetsActionTitle");
  if (v7 == 1)
    v12 = CFSTR("PXPeopleHomeFavoriteSingleAssetActionTitle");
  v13 = CFSTR("PXPeopleHomeUnfavoriteSingleAssetActionTitle");
  if (v7 != 1)
    v13 = CFSTR("PXPeopleHomeUnfavoriteMultipleAssetsActionTitle");
  if (v6)
    v14 = (__CFString *)v12;
  else
    v14 = (__CFString *)v13;
  PXLocalizedStringForPersonOrPetAndVisibility(0, v11, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        if (!objc_msgSend(v16, "px_isSameDetectionTypeAsPerson:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)))
        {
          v22 = v7;
          v23 = (void *)v15;
          v24 = (void *)v5;
          v25 = 0;
          goto LABEL_18;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v19)
        continue;
      break;
    }
  }
  v22 = v7;
  v23 = (void *)v15;
  v24 = (void *)v5;
  v25 = 1;
LABEL_18:

  v26 = v4 != 0;
  v30 = v4;
  v27 = v22;
  v28 = v22 > 0 && v26;
  objc_msgSend(v31, "setEnabled:", v28);
  objc_msgSend(v24, "setEnabled:", v28);
  -[UIBarButtonItem setEnabled:](self->_annotateBarButtonItem, "setEnabled:", v28);
  v29 = v27 > 1 && v26;
  objc_msgSend(v32, "setEnabled:", v29 & v25);
  objc_msgSend(v24, "setTitle:", v23);

}

- (void)_updateNavTitleForIndexes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(v10, "count"))
  {
    -[PXPeopleCollectionViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personsAtIndexPaths:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPeople(v6, CFSTR("PXPeopleHomeSelectedPeopleQuantityTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "count");
    PXLocalizedStringWithValidatedFormat(v7, CFSTR("%lu"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v8, v9);

  }
  else
  {
    -[PXPeopleCollectionViewController selectionModeTitle](self, "selectionModeTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);
  }

}

- (void)_changePersonsAtIndexPaths:(id)a3 toPersonType:(int64_t)a4
{
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
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "count") != 1)
  {
    v8 = 0;
LABEL_7:
    -[PXPeopleCollectionViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController undoManager](self, "undoManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changePersonsAtIndexPaths:toPersonType:undoManager:", v16, a4, v15);

    goto LABEL_8;
  }
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 1
    || !v8
    || !+[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v8))
  {
    goto LABEL_7;
  }
  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Home/PXPeopleCollectionViewController.m"), "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v12, v13, "-[PXPeopleCollectionViewController _changePersonsAtIndexPaths:toPersonType:]", 1043);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCallerInfo:", v14);

  +[PXPeopleUtilities showBootstrapIfNeededWithContext:fromParentVC:](PXPeopleUtilities, "showBootstrapIfNeededWithContext:fromParentVC:", v9, self);
LABEL_8:

}

- (void)_changeSelectedIndexesToPersonType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedIndexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _changePersonsAtIndexPaths:toPersonType:](self, "_changePersonsAtIndexPaths:toPersonType:", v5, a3);
  -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _selectAction:](self, "_selectAction:", v7);

}

- (void)_applyChangeDetailsArrayOnCollectionView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v8 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "hasMoves"))
        {
          objc_msgSend(v5, "reloadData");
          v8 = v6;
          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v14) & 1) != 0)
        {

        }
        else
        {
          v15 = objc_msgSend(v13, "hasAnyChanges");

          v10 |= v15;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }

    if ((v10 & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__PXPeopleCollectionViewController__applyChangeDetailsArrayOnCollectionView___block_invoke;
      v16[3] = &unk_1E5148D08;
      v17 = v6;
      v18 = v5;
      objc_msgSend(v18, "performBatchUpdates:completion:", v16, 0);

      v8 = v17;
      goto LABEL_15;
    }
  }
  else
  {
LABEL_15:

  }
}

- (void)_initiatePersonRemovingWithSourceItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v4 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v5, "numberOfSections"))
  {
    v7 = 0;
    do
      v6 += objc_msgSend(v5, "numberOfPersonsInSection:", v7++);
    while (v7 < objc_msgSend(v5, "numberOfSections"));
  }
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedIndexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personsAtIndexPaths:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v13, *MEMORY[0x1E0CD1BB8], 0, 0, 0);

  PXPresentationEnvironmentForSender(self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController undoManager](self, "undoManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PXPeopleCollectionViewController__initiatePersonRemovingWithSourceItem___block_invoke;
  v17[3] = &unk_1E5148B78;
  v17[4] = self;
  +[PXPeopleRemovalUtilities presentAlertFor:totalNumberOfPeople:presentationEnvironment:undoManager:sourceItem:completion:](PXPeopleRemovalUtilities, "presentAlertFor:totalNumberOfPeople:presentationEnvironment:undoManager:sourceItem:completion:", v14, v6, v15, v16, v4, v17);

}

- (void)_handleToolbarFavoriteAction:(id)a3
{
  void *v4;
  id v5;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController _changeSelectedIndexesToPersonType:](self, "_changeSelectedIndexesToPersonType:", -[PXPeopleCollectionViewController _changeTypeForIndexPaths:](self, "_changeTypeForIndexPaths:", v5));
}

- (void)_handleToolbarMergeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location[2];

  v4 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedIndexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "personsAtIndexPaths:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PXPeopleMergeUtilities canMergeWithPeople:](PXPeopleMergeUtilities, "canMergeWithPeople:", v8))
  {
    -[PXPeopleCollectionViewController _bestTargetIndexPathGivenMergeIndexPaths:](self, "_bestTargetIndexPathGivenMergeIndexPaths:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PXPeopleCollectionViewController__handleToolbarMergeAction___block_invoke;
    v12[3] = &unk_1E5142510;
    objc_copyWeak(&v13, location);
    +[PXPeopleMergeUtilities mergeAlertControllerWithNominalPeople:targetPerson:shouldHandleMergeInternally:completion:](PXPeopleMergeUtilities, "mergeAlertControllerWithNominalPeople:targetPerson:shouldHandleMergeInternally:completion:", v8, v10, 1, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);

  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "Attempted to merge Persons of different detection type", (uint8_t *)location, 2u);
    }
  }

}

- (UIBarButtonItem)favoriteToolbarItem
{
  UIBarButtonItem *favoriteToolbarItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  favoriteToolbarItem = self->_favoriteToolbarItem;
  if (!favoriteToolbarItem)
  {
    PXLocalizedStringFromTable(CFSTR("PXPeopleHomeUnfavoriteSingleAssetActionTitle"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v4, 0, self, sel__handleToolbarFavoriteAction_);
    v6 = self->_favoriteToolbarItem;
    self->_favoriteToolbarItem = v5;

    favoriteToolbarItem = self->_favoriteToolbarItem;
  }
  return favoriteToolbarItem;
}

- (UIBarButtonItem)mergeToolbarItem
{
  UIBarButtonItem *mergeToolbarItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  mergeToolbarItem = self->_mergeToolbarItem;
  if (!mergeToolbarItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v5, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleHomeMergeActionTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, sel__handleToolbarMergeAction_);
    v8 = self->_mergeToolbarItem;
    self->_mergeToolbarItem = v7;

    mergeToolbarItem = self->_mergeToolbarItem;
  }
  return mergeToolbarItem;
}

- (UIBarButtonItem)removeToolbarItem
{
  UIBarButtonItem *removeToolbarItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  removeToolbarItem = self->_removeToolbarItem;
  if (!removeToolbarItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v5, "px_peoplePetsHomeVisibility"), CFSTR("PXPeopleRemoveTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, sel__handleToolbarRemoveAction_);
    v8 = self->_removeToolbarItem;
    self->_removeToolbarItem = v7;

    removeToolbarItem = self->_removeToolbarItem;
  }
  return removeToolbarItem;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[PXPeopleCollectionViewController _itemSizeForItemAtIndexPath:](self, "_itemSizeForItemAtIndexPath:", a5, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfSections") - 1;

  v10 = 0.0;
  v11 = 0.0;
  if (v9 == a5)
  {
    if (-[PXPeopleCollectionViewController isProgressFooterAvailable](self, "isProgressFooterAvailable")
      && -[PXPeopleCollectionViewController shouldShowProgressFooter](self, "shouldShowProgressFooter"))
    {
      objc_msgSend(v7, "bounds");
      v13 = v12;
      -[PXPeopleCollectionViewController progressFooterView](self, "progressFooterView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredHeightForWidth:", v13);
      v10 = v15 + 0.0;

    }
    objc_msgSend(v7, "bounds");
    v11 = v16;
    -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "intrinsicContentSize");
    v10 = v10 + v18 + 75.0;

  }
  v19 = v11;
  v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    v11 = 1.0;
    v10 = 1.0;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (!a5
      && -[PXPeopleCollectionViewController shouldShowMeHeader](self, "shouldShowMeHeader")
      && !-[PXPeopleCollectionViewController mode](self, "mode"))
    {
      objc_msgSend(v8, "bounds");
      v10 = v12;
      -[PXPeopleCollectionViewController meViewController](self, "meViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredHeightForWidth:", v10);
      v11 = v14;

    }
  }

  v15 = v10;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIEdgeInsets result;

  v7 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfPersonsInSection:", a5);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _bottomInsetForSection:](self, "_bottomInsetForSection:", a5);
    v12 = v11;
    -[PXPeopleCollectionViewController _itemSizeForItemAtIndexPath:](self, "_itemSizeForItemAtIndexPath:", v10);
    v14 = v13;
    v15 = objc_msgSend(v7, "numberOfItemsInSection:", a5);
    v16 = -[PXPeopleCollectionViewController _fixedColumnCountForIndexPath:](self, "_fixedColumnCountForIndexPath:", v10);
    if (v15 >= v16)
      v17 = v16;
    else
      v17 = v15;
    objc_msgSend(v7, "bounds");
    v18 = 20.0;
    v20 = (v19 - (v14 * (double)v17 + (double)(v17 - 1) * 20.0)) * 0.5;

    v21 = v20;
  }
  else
  {
    v18 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }

  v22 = v18;
  v23 = v21;
  v24 = v12;
  v25 = v20;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 40.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 20.0;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[PXPeopleCollectionViewController isInSelectionOnlyMode](self, "isInSelectionOnlyMode"))
  {
    -[PXPeopleCollectionViewController selectionHandler](self, "selectionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXPeopleCollectionViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "personAtIndexPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__PXPeopleCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v12[3] = &unk_1E5148CE0;
      v13 = v10;
      v14 = v8;
      v11 = v10;
      -[PXPeopleCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v12);

    }
  }
  else
  {
    if (-[PXPeopleCollectionViewController mode](self, "mode") != 1)
    {
      -[PXPeopleCollectionViewController showDetailsForMemberAtIndexPath:](self, "showDetailsForMemberAtIndexPath:", v7);
      goto LABEL_8;
    }
    objc_msgSend(v6, "sortedIndexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _updateToolbarItemsForIndexPaths:](self, "_updateToolbarItemsForIndexPaths:", v8);
    -[PXPeopleCollectionViewController _updateNavTitleForIndexes:](self, "_updateNavTitleForIndexes:", v8);
  }

LABEL_8:
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[PXPeopleCollectionViewController mode](self, "mode") == 1)
  {
    objc_msgSend(v6, "sortedIndexPathsForSelectedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _updateToolbarItemsForIndexPaths:](self, "_updateToolbarItemsForIndexPaths:", v5);
    -[PXPeopleCollectionViewController _updateNavTitleForIndexes:](self, "_updateNavTitleForIndexes:", v5);

  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)_addFavoritesLeadingFocusGuideForCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  void *v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIFocusGuide preferredFocusEnvironments](self->_favoritesLeadingFocusGuide, "preferredFocusEnvironments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[PXPeopleCollectionViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addLayoutGuide:", self->_favoritesLeadingFocusGuide);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UIFocusGuide leadingAnchor](self->_favoritesLeadingFocusGuide, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    -[UIFocusGuide trailingAnchor](self->_favoritesLeadingFocusGuide, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    -[UIFocusGuide topAnchor](self->_favoritesLeadingFocusGuide, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v9;
    -[UIFocusGuide bottomAnchor](self->_favoritesLeadingFocusGuide, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v13);

    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_favoritesLeadingFocusGuide, "setPreferredFocusEnvironments:", v14);

  }
}

- (void)_addFavoritesTrailingFocusGuideForCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  void *v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIFocusGuide preferredFocusEnvironments](self->_favoritesTrailingFocusGuide, "preferredFocusEnvironments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[PXPeopleCollectionViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addLayoutGuide:", self->_favoritesTrailingFocusGuide);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UIFocusGuide leadingAnchor](self->_favoritesTrailingFocusGuide, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    -[UIFocusGuide trailingAnchor](self->_favoritesTrailingFocusGuide, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    -[UIFocusGuide topAnchor](self->_favoritesTrailingFocusGuide, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v9;
    -[UIFocusGuide bottomAnchor](self->_favoritesTrailingFocusGuide, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v13);

    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_favoritesTrailingFocusGuide, "setPreferredFocusEnvironments:", v14);

  }
}

- (void)_updateFavoritesFocusGuidesForAddedCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingFavoritePersonIndexPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == v6)
  {

    goto LABEL_5;
  }
  v10 = objc_msgSend(v8, "isEqual:", v6);

  if (v10)
LABEL_5:
    -[PXPeopleCollectionViewController _addFavoritesLeadingFocusGuideForCell:](self, "_addFavoritesLeadingFocusGuideForCell:", v14);
  objc_msgSend(v7, "trailingFavoritePersonIndexPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == v6)
  {

  }
  else
  {
    v13 = objc_msgSend(v11, "isEqual:", v6);

    if (!v13)
      goto LABEL_11;
  }
  -[PXPeopleCollectionViewController _addFavoritesTrailingFocusGuideForCell:](self, "_addFavoritesTrailingFocusGuideForCell:", v14);
LABEL_11:

}

- (void)_updateFavoritesFocusGuidesForRemovedCell:(id)a3 forItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusGuide preferredFocusEnvironments](self->_favoritesLeadingFocusGuide, "preferredFocusEnvironments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v17);

  if (v7)
  {
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_favoritesLeadingFocusGuide, "setPreferredFocusEnvironments:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v5, "removeLayoutGuide:", self->_favoritesLeadingFocusGuide);
  }
  -[UIFocusGuide preferredFocusEnvironments](self->_favoritesTrailingFocusGuide, "preferredFocusEnvironments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v17);

  if (v9)
  {
    -[UIFocusGuide setPreferredFocusEnvironments:](self->_favoritesTrailingFocusGuide, "setPreferredFocusEnvironments:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v5, "removeLayoutGuide:", self->_favoritesTrailingFocusGuide);
  }
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingFavoritePersonIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "isDescendantOfView:", v5))
      -[PXPeopleCollectionViewController _addFavoritesLeadingFocusGuideForCell:](self, "_addFavoritesLeadingFocusGuideForCell:", v13);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v10, "trailingFavoritePersonIndexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && objc_msgSend(v15, "isDescendantOfView:", v5))
    -[PXPeopleCollectionViewController _addFavoritesTrailingFocusGuideForCell:](self, "_addFavoritesTrailingFocusGuideForCell:", v16);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[PXPeopleCollectionViewController _updateFavoritesFocusGuidesForAddedCell:forItemAtIndexPath:](self, "_updateFavoritesFocusGuidesForAddedCell:forItemAtIndexPath:", a4, a5);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memberAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "cellUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
      objc_msgSend(v8, "cancelImageLoadingForItem:", v10);
  }
  -[PXPeopleCollectionViewController _updateFavoritesFocusGuidesForRemovedCell:forItemAtIndexPath:](self, "_updateFavoritesFocusGuidesForRemovedCell:forItemAtIndexPath:", v14, v7);

}

- (void)collectionViewDidLayout:(id)a3
{
  id v4;
  void *v5;
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
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXPeopleCollectionViewController transitionIndices](self, "transitionIndices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v4, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAlpha:", 0.0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (-[PXPeopleCollectionViewController isProgressFooterAvailable](self, "isProgressFooterAvailable")
    && -[PXPeopleCollectionViewController needToCheckProgress](self, "needToCheckProgress"))
  {
    -[PXPeopleCollectionViewController setNeedToCheckProgress:](self, "setNeedToCheckProgress:", 0);
    -[PXPeopleCollectionViewController _startProgressMonitoring](self, "_startProgressMonitoring");
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  if (-[PXPeopleCollectionViewController ppt_shouldRunPPTCode](self, "ppt_shouldRunPPTCode", a3))
  {
    -[PXPeopleCollectionViewController setPpt_sampledCountOfFrames:](self, "setPpt_sampledCountOfFrames:", -[PXPeopleCollectionViewController ppt_sampledCountOfFrames](self, "ppt_sampledCountOfFrames") + 1);
    -[PXPeopleCollectionViewController setPpt_sampledCountOfEmptyCells:](self, "setPpt_sampledCountOfEmptyCells:", -[PXPeopleCollectionViewController ppt_sampledCountOfEmptyCells](self, "ppt_sampledCountOfEmptyCells")+ -[PXPeopleCollectionViewController ppt_countOfEmptyCells](self, "ppt_countOfEmptyCells"));
  }
}

- (void)peopleSectionedDataSourceMembersChangedNonIncrementally:(id)a3
{
  id v4;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[PXPeopleCollectionViewController mode](self, "mode"))
  {
    -[PXPeopleCollectionViewController _updateNavigationItem](self, "_updateNavigationItem");
    objc_msgSend(v4, "reloadData");
  }
  -[PXPeopleCollectionViewController _resetHomeIfNeeded](self, "_resetHomeIfNeeded");

}

- (void)peopleSectionedDataSource:(id)a3 didApplyIncrementalChanges:(id)a4
{
  -[PXPeopleCollectionViewController _applyChangeDetailsArrayOnCollectionView:](self, "_applyChangeDetailsArrayOnCollectionView:", a4);
  -[PXPeopleCollectionViewController _resetHomeIfNeeded](self, "_resetHomeIfNeeded");
  -[PXPeopleCollectionViewController _updateAddPeopleButton](self, "_updateAddPeopleButton");
}

- (void)_resetHomeIfNeeded
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "totalPersonCount"))
  {
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 1000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__PXPeopleCollectionViewController__resetHomeIfNeeded__block_invoke;
    v5[3] = &unk_1E5148D30;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)_startProgressMonitoring
{
  void *v3;
  id v4;

  if (-[PXPeopleCollectionViewController isProgressFooterAvailable](self, "isProgressFooterAvailable"))
  {
    -[PXPeopleCollectionViewController progressManager](self, "progressManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMonitoringProgress:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__progressChanged_, CFSTR("PXPeopleProgressDidChangeNotification"), v4);

    -[PXPeopleCollectionViewController _progressChanged:](self, "_progressChanged:", 0);
  }
}

- (void)_stopProgressMonitoring
{
  void *v3;
  id v4;

  -[PXPeopleCollectionViewController progressManager](self, "progressManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PXPeopleProgressDidChangeNotification"), v4);

  objc_msgSend(v4, "setMonitoringProgress:", 0);
}

- (void)_progressChanged:(id)a3
{
  -[PXPeopleCollectionViewController _updateProgressFooterStateWithForce:](self, "_updateProgressFooterStateWithForce:", 1);
}

- (void)_updateProgressFooterText
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (-[PXPeopleCollectionViewController shouldShowProgressFooter](self, "shouldShowProgressFooter"))
  {
    PXLocalizedStringFromTable(CFSTR("PXPeopleUpdatingTitle"), CFSTR("PhotosUICore"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXPeopleUpdatingMessage"), CFSTR("PhotosUICore"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E5149688;
    v8 = &stru_1E5149688;
  }
  -[PXPeopleCollectionViewController progressFooterView](self, "progressFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v8);

  objc_msgSend(v4, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v3);

  -[PXPeopleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayout");

}

- (void)collectionView:(id)a3 didBeginMergeWithDragIndexPath:(id)a4 targetIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  -[PXPeopleCollectionViewController _originalTargetIndexPathFromDragIndexPath:targetIndexPath:](self, "_originalTargetIndexPathFromDragIndexPath:targetIndexPath:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPeopleCollectionViewController collectionView:shouldMergeDragIndexPath:targetIndexPath:](self, "collectionView:shouldMergeDragIndexPath:targetIndexPath:", v8, v10, v9);

  if (v11)
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDuration:", 0.75);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimingFunction:", v14);

    objc_msgSend(v13, "setToValue:", &unk_1E53EFB70);
    LODWORD(v15) = 2139095040;
    objc_msgSend(v13, "setRepeatCount:", v15);
    objc_msgSend(v13, "setAutoreverses:", 1);
    objc_msgSend(v12, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v13, CFSTR("PXPeopleCollectionViewMergePulseAnimationKey"));

    -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__PXPeopleCollectionViewController_collectionView_didBeginMergeWithDragIndexPath_targetIndexPath___block_invoke;
    v21[3] = &unk_1E5149198;
    v22 = v18;
    v20 = v18;
    objc_msgSend(v19, "animateWithDuration:animations:", v21, 0.25);

  }
}

- (void)collectionView:(id)a3 didCancelMergeWithDragIndexPath:(id)a4 targetIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXPeopleCollectionViewController collectionView:shouldMergeDragIndexPath:targetIndexPath:](self, "collectionView:shouldMergeDragIndexPath:targetIndexPath:", v8, v11, v10);

  if (v12)
  {
    -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3F10];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __99__PXPeopleCollectionViewController_collectionView_didCancelMergeWithDragIndexPath_targetIndexPath___block_invoke;
    v18[3] = &unk_1E5149198;
    v19 = v14;
    v16 = v14;
    objc_msgSend(v15, "animateWithDuration:animations:", v18, 0.25);
    -[PXPeopleCollectionViewController _originalTargetIndexPathFromDragIndexPath:targetIndexPath:](self, "_originalTargetIndexPathFromDragIndexPath:targetIndexPath:", v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController _animateCellAtIndexPathToDefaultState:](self, "_animateCellAtIndexPathToDefaultState:", v17);

  }
}

- (void)collectionView:(id)a3 didMergeDragIndexPath:(id)a4 targetIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PXPeopleMergeContentViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _originalTargetIndexPathFromDragIndexPath:targetIndexPath:](self, "_originalTargetIndexPathFromDragIndexPath:targetIndexPath:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personAtIndexPath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personAtIndexPath:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPeopleCollectionViewController collectionView:shouldMergeDragIndexPath:targetIndexPath:](self, "collectionView:shouldMergeDragIndexPath:targetIndexPath:", v8, v11, v12))
  {
    -[PXPeopleCollectionViewController _animateCellAtIndexPathToDefaultState:](self, "_animateCellAtIndexPathToDefaultState:", v12);
    objc_msgSend(v14, "px_localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      v18 = v16;
    else
      v18 = 0;
    v44 = v13;
    if (objc_msgSend(v17, "length"))
    {
      if (v18)
        v19 = 0;
      else
        v19 = v17;
      v20 = v19;

      v18 = v20;
    }
    v45 = v11;
    v41 = v17;
    v42 = v16;
    v40 = v18;
    if (v18)
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v14, 0, CFSTR("PXPeopleHomeDragMergeNamedAlertTitle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v21, CFSTR("%@"));
      v22 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXLocalizedStringForPersonOrPetAndVisibility(v14, 0, CFSTR("PXPeopleHomeDragMergeAlertTitle"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    PXLocalizedStringForPersonOrPetAndVisibility(v14, 0, CFSTR("PXPeopleHomeDragMergeAlertMessage"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)v22;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PXPeopleMergeContentViewController initWithTargetPerson:draggedPerson:]([PXPeopleMergeContentViewController alloc], "initWithTargetPerson:draggedPerson:", v14, v15);
    v24 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXPeopleHomeMergeConfirmTitle"), CFSTR("PhotosUICore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __89__PXPeopleCollectionViewController_collectionView_didMergeDragIndexPath_targetIndexPath___block_invoke;
    v50[3] = &unk_1E5133F18;
    v50[4] = self;
    v26 = v14;
    v51 = v26;
    v43 = v15;
    v27 = v15;
    v52 = v27;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 0, v50);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v28);

    -[PXPeopleCollectionViewController traitCollection](self, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v8;
    v30 = objc_msgSend(v29, "userInterfaceIdiom") != 1 || objc_msgSend(v29, "horizontalSizeClass") != 2;
    v31 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXPeopleHomeMergeCancelTitle"), CFSTR("PhotosUICore"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __89__PXPeopleCollectionViewController_collectionView_didMergeDragIndexPath_targetIndexPath___block_invoke_2;
    v47[3] = &unk_1E5133F18;
    v47[4] = self;
    v48 = v26;
    v49 = v27;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v32, v30, v47);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v33);

    objc_msgSend(v23, "setContentViewController:", v37);
    objc_msgSend(v23, "setModalPresentationStyle:", 7);
    objc_msgSend(v23, "popoverPresentationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v46;
    objc_msgSend(v46, "cellForItemAtIndexPath:", v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSourceView:", v35);

    objc_msgSend(v34, "sourceView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    objc_msgSend(v34, "setSourceRect:");

    objc_msgSend(v34, "setDelegate:", self);
    -[PXPeopleCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

    v13 = v44;
    v11 = v45;
    v15 = v43;
  }
  else
  {
    -[PXPeopleCollectionViewController _performMerge:targetPerson:dragPerson:](self, "_performMerge:targetPerson:dragPerson:", 0, v14, v15);
  }

}

- (BOOL)collectionView:(id)a3 shouldMergeDragIndexPath:(id)a4 targetIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a5;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "px_isSameDetectionTypeAsPerson:", v10);
  if ((v11 & 1) == 0)
  {
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "Attempted to merge Persons of different detection type", v14, 2u);
    }

  }
  return v11;
}

- (id)_originalTargetIndexPathFromDragIndexPath:(id)a3 targetIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[PXPeopleCollectionViewController sourceDragIndexPath](self, "sourceDragIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "section");
  if (v9 == objc_msgSend(v7, "section"))
  {
    v10 = objc_msgSend(v6, "section");
    if (v10 != objc_msgSend(v7, "section"))
    {
      v17 = objc_msgSend(v8, "compare:", v7);
      v14 = v7;
      if (v17 == 1)
        goto LABEL_21;
      goto LABEL_17;
    }
  }
  v11 = objc_msgSend(v8, "section");
  if (v11 != objc_msgSend(v7, "section"))
  {
    v12 = objc_msgSend(v6, "section");
    if (v12 == objc_msgSend(v7, "section"))
    {
      v13 = objc_msgSend(v6, "compare:", v7);
      v14 = v7;
      if (v13 == -1)
        goto LABEL_19;
LABEL_21:
      v21 = v14;
      goto LABEL_22;
    }
  }
  v15 = objc_msgSend(v8, "section");
  if (v15 != objc_msgSend(v7, "section"))
  {
    v14 = v7;
    goto LABEL_21;
  }
  v16 = objc_msgSend(v6, "compare:", v7) == -1 && objc_msgSend(v7, "compare:", v8) != 1;
  if (objc_msgSend(v6, "compare:", v7) != 1)
  {
    v14 = v7;
    if (!v16)
      goto LABEL_21;
LABEL_19:
    v19 = (void *)MEMORY[0x1E0CB36B0];
    v20 = objc_msgSend(v7, "item") - 1;
    goto LABEL_20;
  }
  v18 = objc_msgSend(v7, "compare:", v8);
  v14 = v7;
  if (v16)
    goto LABEL_19;
  if (v18 == -1)
    goto LABEL_21;
LABEL_17:
  v19 = (void *)MEMORY[0x1E0CB36B0];
  v20 = objc_msgSend(v7, "item") + 1;
LABEL_20:
  objc_msgSend(v19, "indexPathForItem:inSection:", v20, objc_msgSend(v7, "section"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v21;
}

- (void)_animateCellAtIndexPathToDefaultState:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[8];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v4 = a3;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transform");
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
  }

  v39 = v47;
  v40 = v48;
  v41 = v49;
  v42 = v50;
  v35 = v43;
  v36 = v44;
  v37 = v45;
  v38 = v46;
  objc_msgSend(v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v39;
  v34[5] = v40;
  v34[6] = v41;
  v34[7] = v42;
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  v34[3] = v38;
  objc_msgSend(v10, "setTransform:", v34);

  objc_msgSend(v6, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAnimationForKey:", CFSTR("PXPeopleCollectionViewMergePulseAnimationKey"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", 0.25);
  v30 = v47;
  v31 = v48;
  v32 = v49;
  v33 = v50;
  v26 = v43;
  v27 = v44;
  v28 = v45;
  v29 = v46;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v13);

  v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v23 = v30;
  v31 = v24;
  v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v21 = v32;
  v33 = v22;
  v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v26 = *MEMORY[0x1E0CD2610];
  v19 = v26;
  v27 = v20;
  v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v17 = v28;
  v29 = v18;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v14);

  objc_msgSend(v12, "setRemovedOnCompletion:", 1);
  objc_msgSend(v6, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v12, CFSTR("PXPeopleCollectionViewMergePulseAnimationKey"));

  objc_msgSend(v6, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v23;
  v25[5] = v24;
  v25[6] = v21;
  v25[7] = v22;
  v25[0] = v19;
  v25[1] = v20;
  v25[2] = v17;
  v25[3] = v18;
  objc_msgSend(v16, "setTransform:", v25);

}

- (void)_performMerge:(BOOL)a3 targetPerson:(id)a4 dragPerson:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  PXPeopleCollectionViewController *v18;
  _QWORD v19[2];

  v6 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelInteractiveMovement");
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __74__PXPeopleCollectionViewController__performMerge_targetPerson_dragPerson___block_invoke;
    v16 = &unk_1E5148D08;
    v17 = v10;
    v18 = self;
    objc_msgSend(v11, "performWithoutAnimation:", &v13);
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1, v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities mergePersons:withPerson:](PXPeopleUtilities, "mergePersons:withPerson:", v12, v8);

  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  -[PXPeopleCollectionViewController _performMerge:targetPerson:dragPerson:](self, "_performMerge:targetPerson:dragPerson:", 0, 0, 0);
}

- (id)initialSelectedIndexPathsForSwipeSelectionManager:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "sortedIndexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  return v6;
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "compare:", v8);
  if (v9 == -1)
    v10 = v7;
  else
    v10 = v8;
  v24 = v8;
  v25 = v7;
  if (v9 != -1)
    v8 = v7;
  v11 = v10;
  v12 = v8;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = v11;
  v15 = objc_msgSend(v11, "section");
  v16 = objc_msgSend(v12, "section");
  if (v15 <= v16)
  {
    v17 = v16;
    v18 = v15;
    do
    {
      v19 = objc_msgSend(v13, "numberOfPersonsInSection:", v18);
      if (v18 == v15)
        v20 = objc_msgSend(v26, "item");
      else
        v20 = 0;
      if (v18 == v17)
        v21 = objc_msgSend(v12, "item");
      else
        v21 = v19 - 1;
      while (v20 <= v21)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v22);

        ++v20;
      }
      ++v18;
    }
    while (v18 <= v17);
  }

  return v14;
}

- (id)swipeSelectionManager:(id)a3 itemIndexPathAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)swipeSelectionManager:(id)a3 didSelectIndexPaths:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "sortedIndexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14++), 0, 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "minusSet:", v10);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v6, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), 0, (_QWORD)v21);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  objc_msgSend(v10, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _updateToolbarItemsForIndexPaths:](self, "_updateToolbarItemsForIndexPaths:", v20);
  -[PXPeopleCollectionViewController _updateNavTitleForIndexes:](self, "_updateNavTitleForIndexes:", v20);

}

- (void)toggleFavoriteForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController _changePersonsAtIndexPaths:toPersonType:](self, "_changePersonsAtIndexPaths:toPersonType:", v10, v9 != 1);

}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 8)
  {
    objc_msgSend(v3, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "px_isPeopleVirtualCollection");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = a3;
  v8 = -[PXPeopleCollectionViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", v7);
  objc_msgSend(v7, "sidebarBackNavigationRootDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_isPeopleVirtualCollection");

  if (v11)
  {
    -[PXPeopleCollectionViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PXPeopleCollectionViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_updateBackButtonVisibilityForTraitCollection:", v13);

  }
  if (v8 == 1)
    v14 = 1;
  else
    v14 = 2;
  v15[2](v15, v14, 0);

}

- (id)px_navigationDestination
{
  PXProgrammaticNavigationDestination *v3;
  void *v4;
  void *v5;
  void *v6;
  PXProgrammaticNavigationDestination *v7;

  v3 = [PXProgrammaticNavigationDestination alloc];
  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_virtualCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXProgrammaticNavigationDestination initWithObject:revealMode:](v3, "initWithObject:revealMode:", v6, 0);

  return v7;
}

- (void)_showPeopleViewController
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleCollectionViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
  +[PXPeopleAlbumProvider sharedInstance](PXPeopleAlbumProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", v4, 1);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_192501 == a5)
  {
    if ((v6 & 3) == 0)
      goto LABEL_9;
    v16 = v9;
    -[PXPeopleCollectionViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasSharedLibraryOrPreview");

    v9 = v16;
    if ((v13 & 1) != 0)
      goto LABEL_9;
LABEL_8:
    v17 = v9;
    -[PXPeopleCollectionViewController _showPeopleViewController](self, "_showPeopleViewController");
    v9 = v17;
    goto LABEL_9;
  }
  if ((void *)PXLibraryFilterStateObservationContext_192502 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleCollectionViewController.m"), 1734, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v15 = v9;
    -[PXPeopleCollectionViewController libraryFilterState](self, "libraryFilterState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFiltering");

    v9 = v15;
    if ((v11 & 1) != 0)
      goto LABEL_8;
  }
LABEL_9:

}

- (void)peopleMeViewControllerDidUpdateSize:(id)a3
{
  id v3;

  -[PXPeopleCollectionViewController collectionViewLayout](self, "collectionViewLayout", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (void)statusDebugRecognizerTapped:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isFaceProcessingFinished") & 1) == 0)
  {
    v4 = objc_msgSend(v14, "countOfFaceCropsToBeGenerated");
    v5 = objc_msgSend(v14, "countOfUnprocessedFaceCrops");
    v6 = objc_msgSend(v14, "countOfUnclusteredFaces");
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"Updating People…\" shows if at least one of these results is non-zero: \n\n1) Face crops needing detection: %lu\n2) Faces where vu observation id is 0 AND manual is 0: %lu\n3) Faces needing face crops to be generated: %lu"), v5, v6, v4, v13);
    }
    else
    {
      v12 = objc_msgSend(v14, "countOfDirtyFaceGroups");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"Updating People…\" shows if at least one of these results is non-zero: \n\n1) Face crops needing detection: %lu\n2) Face groups with dirty builder: %lu\n3) Faces where cluster sequence number is None AND manual is 0: %lu\n4) Faces needing face crops to be generated: %lu"), v5, v12, v6, v4);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Updating People… Debug"), v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    -[PXPeopleCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

- (id)_createAddPeopleButton
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
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 6.0);

  PXLocalizedStringFromTable(CFSTR("PXPeopleHomeAddActionTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "background");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setTitleTextAttributesTransformer:", &__block_literal_global_192484);
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0DC3518];
  v9 = (void *)MEMORY[0x1E0DC3428];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __58__PXPeopleCollectionViewController__createAddPeopleButton__block_invoke_2;
  v17 = &unk_1E5147F40;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "actionWithHandler:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttonWithConfiguration:primaryAction:", v3, v10, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_launchAddPeoplePicker
{
  PXAddUnverifiedPeopleActionPerformer *v3;
  void *v4;
  void *v5;
  PXAddUnverifiedPeopleActionPerformer *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = [PXAddUnverifiedPeopleActionPerformer alloc];
  PXPresentationEnvironmentForSender(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXAddUnverifiedPeopleActionPerformer initWithPresentationEnvironment:photoLibrary:](v3, "initWithPresentationEnvironment:photoLibrary:", v4, v5);

  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PXPeopleCollectionViewController__launchAddPeoplePicker__block_invoke;
  v11[3] = &unk_1E5147B40;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[PXActionPerformer performActionWithCompletionHandler:](v6, "performActionWithCompletionHandler:", v11);

}

- (void)_updateAddPeopleButton
{
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  -[PXPeopleCollectionViewController progressManager](self, "progressManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSubstantialProcessingRemainingForThreshold:", 1);

  if ((v4 & 1) != 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PXPeopleCollectionViewController: Cannot add people because there's substantial processing remaining.", v13, 2u);
    }
    v6 = 0;
  }
  else
  {
    -[PXPeopleCollectionViewController photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleSwiftUtilities fetchAddPeopleCandidatesIn:](PXPeopleSwiftUtilities, "fetchAddPeopleCandidatesIn:", v7);
    v5 = objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPeople(v5, CFSTR("PXPeopleHomeAddActionTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v8, 0);

    v10 = -[NSObject count](v5, "count");
    v6 = v10 != 0;
    if (!v10)
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PXPeopleCollectionViewController: Cannot add people because there are no cadidates to add.", buf, 2u);
      }

    }
  }

  -[PXPeopleCollectionViewController addPeopleButton](self, "addPeopleButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v6);

}

- (void)setRightBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItem, a3);
}

- (UIBarButtonItem)annotateBarButtonItem
{
  return self->_annotateBarButtonItem;
}

- (void)setAnnotateBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_annotateBarButtonItem, a3);
}

- (BOOL)ignoreChangeUpdates
{
  return self->_ignoreChangeUpdates;
}

- (void)setIgnoreChangeUpdates:(BOOL)a3
{
  self->_ignoreChangeUpdates = a3;
}

- (UILongPressGestureRecognizer)dragRecognizer
{
  return self->_dragRecognizer;
}

- (void)setDragRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dragRecognizer, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setRemoveToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeToolbarItem, a3);
}

- (void)setFavoriteToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteToolbarItem, a3);
}

- (void)setMergeToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_mergeToolbarItem, a3);
}

- (UIBarButtonItem)debugMenuItem
{
  return self->_debugMenuItem;
}

- (void)setDebugMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_debugMenuItem, a3);
}

- (UIFocusGuide)favoritesLeadingFocusGuide
{
  return self->_favoritesLeadingFocusGuide;
}

- (void)setFavoritesLeadingFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesLeadingFocusGuide, a3);
}

- (UIFocusGuide)favoritesTrailingFocusGuide
{
  return self->_favoritesTrailingFocusGuide;
}

- (void)setFavoritesTrailingFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesTrailingFocusGuide, a3);
}

- (PXPeopleProgressManager)progressManager
{
  return self->_progressManager;
}

- (void)setProgressManager:(id)a3
{
  objc_storeStrong((id *)&self->_progressManager, a3);
}

- (BOOL)needToCheckProgress
{
  return self->_needToCheckProgress;
}

- (void)setNeedToCheckProgress:(BOOL)a3
{
  self->_needToCheckProgress = a3;
}

- (PXPeopleProgressFooterView)progressFooterView
{
  return self->_progressFooterView;
}

- (void)setProgressFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_progressFooterView, a3);
}

- (void)setProgressFooterState:(int64_t)a3
{
  self->_progressFooterState = a3;
}

- (BOOL)shouldShowMeHeader
{
  return self->_shouldShowMeHeader;
}

- (UIButton)addPeopleButton
{
  return self->_addPeopleButton;
}

- (void)setAddPeopleButton:(id)a3
{
  objc_storeStrong((id *)&self->_addPeopleButton, a3);
}

- (BOOL)isInSelectionOnlyMode
{
  return self->_isInSelectionOnlyMode;
}

- (void)setIsInSelectionOnlyMode:(BOOL)a3
{
  self->_isInSelectionOnlyMode = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (PXPeopleMeViewController)meViewController
{
  return self->_meViewController;
}

- (void)setMeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_meViewController, a3);
}

- (UITapGestureRecognizer)statusDebugRecognizer
{
  return self->_statusDebugRecognizer;
}

- (void)setStatusDebugRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_statusDebugRecognizer, a3);
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPeopleInternalAnnotationFlowManager)annotationFlowManager
{
  return self->_annotationFlowManager;
}

- (PXPeopleSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (void)setSwipeSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_swipeSelectionManager, a3);
}

- (PXPeopleSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (NSIndexPath)sourceDragIndexPath
{
  return self->_sourceDragIndexPath;
}

- (void)setSourceDragIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDragIndexPath, a3);
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (void)setTargetIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_targetIndexPath, a3);
}

- (CGPoint)lastDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastDragPoint.x;
  y = self->_lastDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastDragPoint:(CGPoint)a3
{
  self->_lastDragPoint = a3;
}

- (BOOL)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(BOOL)a3
{
  self->_pendingChanges = a3;
}

- (BOOL)isProgressFooterAvailable
{
  return self->_progressFooterAvailable;
}

- (void)setProgressFooterAvailable:(BOOL)a3
{
  self->_progressFooterAvailable = a3;
}

- (UIViewControllerAnimatedTransitioning)transitionAnimator
{
  return (UIViewControllerAnimatedTransitioning *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setTransitionAnimator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (NSArray)transitionIndices
{
  return self->_transitionIndices;
}

- (void)setTransitionIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (int64_t)ppt_numCellsLeft
{
  return self->_ppt_numCellsLeft;
}

- (void)setPpt_numCellsLeft:(int64_t)a3
{
  self->_ppt_numCellsLeft = a3;
}

- (NSMutableDictionary)ppt_seenPeople
{
  return self->_ppt_seenPeople;
}

- (void)setPpt_seenPeople:(id)a3
{
  objc_storeStrong((id *)&self->_ppt_seenPeople, a3);
}

- (BOOL)ppt_shouldRunPPTCode
{
  return self->_ppt_shouldRunPPTCode;
}

- (void)setPpt_shouldRunPPTCode:(BOOL)a3
{
  self->_ppt_shouldRunPPTCode = a3;
}

- (id)ppt_cellsLoadedCompletionBlock
{
  return self->_ppt_cellsLoadedCompletionBlock;
}

- (void)setPpt_cellsLoadedCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (unint64_t)ppt_sampledCountOfEmptyCells
{
  return self->_ppt_sampledCountOfEmptyCells;
}

- (void)setPpt_sampledCountOfEmptyCells:(unint64_t)a3
{
  self->_ppt_sampledCountOfEmptyCells = a3;
}

- (unint64_t)ppt_sampledCountOfFrames
{
  return self->_ppt_sampledCountOfFrames;
}

- (void)setPpt_sampledCountOfFrames:(unint64_t)a3
{
  self->_ppt_sampledCountOfFrames = a3;
}

- (CGRect)ppt_visibleCollectionViewRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_ppt_visibleCollectionViewRect.origin.x;
  y = self->_ppt_visibleCollectionViewRect.origin.y;
  width = self->_ppt_visibleCollectionViewRect.size.width;
  height = self->_ppt_visibleCollectionViewRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPpt_visibleCollectionViewRect:(CGRect)a3
{
  self->_ppt_visibleCollectionViewRect = a3;
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ppt_cellsLoadedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_ppt_seenPeople, 0);
  objc_storeStrong((id *)&self->_transitionIndices, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_storeStrong((id *)&self->_sourceDragIndexPath, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_annotationFlowManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_statusDebugRecognizer, 0);
  objc_storeStrong((id *)&self->_meViewController, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_addPeopleButton, 0);
  objc_storeStrong((id *)&self->_progressFooterView, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_favoritesTrailingFocusGuide, 0);
  objc_storeStrong((id *)&self->_favoritesLeadingFocusGuide, 0);
  objc_storeStrong((id *)&self->_debugMenuItem, 0);
  objc_storeStrong((id *)&self->_mergeToolbarItem, 0);
  objc_storeStrong((id *)&self->_favoriteToolbarItem, 0);
  objc_storeStrong((id *)&self->_removeToolbarItem, 0);
  objc_storeStrong((id *)&self->_dragRecognizer, 0);
  objc_storeStrong((id *)&self->_annotateBarButtonItem, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItem, 0);
}

uint64_t __58__PXPeopleCollectionViewController__launchAddPeoplePicker__block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t result;
  void *v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v17.origin.x = v10;
  v17.origin.y = v11;
  v17.size.width = v12;
  v17.size.height = v13;
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  result = CGRectContainsRect(v16, v17);
  if ((result & 1) == 0)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(v15, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "scrollRectToVisible:animated:", 1);
  }
  return result;
}

void __58__PXPeopleCollectionViewController__createAddPeopleButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_launchAddPeoplePicker");

}

id __58__PXPeopleCollectionViewController__createAddPeopleButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

void __74__PXPeopleCollectionViewController__performMerge_targetPerson_dragPerson___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sourceDragIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cellForItemAtIndexPath:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAlpha:", 0.0);
}

uint64_t __89__PXPeopleCollectionViewController_collectionView_didMergeDragIndexPath_targetIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMerge:targetPerson:dragPerson:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __89__PXPeopleCollectionViewController_collectionView_didMergeDragIndexPath_targetIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performMerge:targetPerson:dragPerson:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __99__PXPeopleCollectionViewController_collectionView_didCancelMergeWithDragIndexPath_targetIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.15, 1.15);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __98__PXPeopleCollectionViewController_collectionView_didBeginMergeWithDragIndexPath_targetIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __54__PXPeopleCollectionViewController__resetHomeIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "totalPersonCount");

  if (!v4)
  {
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

uint64_t __76__PXPeopleCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__PXPeopleCollectionViewController__handleToolbarMergeAction___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "navigationItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rightBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_selectAction:", v2);

}

void __74__PXPeopleCollectionViewController__initiatePersonRemovingWithSourceItem___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rightBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_selectAction:", v3);

  }
}

unint64_t __77__PXPeopleCollectionViewController__applyChangeDetailsArrayOnCollectionView___block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) == 0)
      {
        objc_msgSend(v4, "removedIndexes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "insertedIndexes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "changedIndexes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v7, i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v8, i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v9, i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
          objc_msgSend(*(id *)(a1 + 40), "deleteItemsAtIndexPaths:", v10);
        if (objc_msgSend(v11, "count"))
          objc_msgSend(*(id *)(a1 + 40), "insertItemsAtIndexPaths:", v11);
        if (objc_msgSend(v12, "count"))
          objc_msgSend(*(id *)(a1 + 40), "reloadItemsAtIndexPaths:", v12);

      }
      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
  }
  return result;
}

void __57__PXPeopleCollectionViewController__leftBarItemsForMode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "navigationItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "leftBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_selectAction:", v2);

}

void __57__PXPeopleCollectionViewController__leftBarItemsForMode___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[147];
  objc_msgSend(v1, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnnotationFlowForSelectedPersonIndexPaths:", v3);

}

uint64_t __54__PXPeopleCollectionViewController__peopleSortActions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPeopleHomeSortingType:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__PXPeopleCollectionViewController__peopleSortActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPeopleHomeSortingType:", 0);
}

void __58__PXPeopleCollectionViewController__rightBarItemsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id location;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_initWeak(&location, v4);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_selectAction:", v7);

  objc_destroyWeak(&location);
}

void __58__PXPeopleCollectionViewController__rightBarItemsForMode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, id);
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_peopleSortActions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4);

}

void __50__PXPeopleCollectionViewController__selectAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPrefersToolbarVisible:", v3);
  objc_msgSend(v4, "setPrefersTabBarVisible:", *(_BYTE *)(a1 + 32) == 0);

}

void __74__PXPeopleCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void);
  id v19;

  v19 = a2;
  v11 = objc_msgSend(*(id *)(a1 + 32), "tag");
  v12 = v19;
  if (v19 && v11 == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:normalizedFaceRect:", a3, a4, a5, a6);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (objc_msgSend(WeakRetained, "ppt_shouldRunPPTCode"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setPpt_fullImageLoaded:", 1);
      if (objc_msgSend(WeakRetained, "ppt_numCellsLeft") == -1)
      {
        objc_msgSend(WeakRetained, "setPpt_numCellsLeft:", objc_msgSend(WeakRetained, "ppt_numOfCellsLoadingImages"));
        objc_msgSend(WeakRetained, "setPpt_numCellsLeft:", objc_msgSend(WeakRetained, "ppt_numCellsLeft") + 1);
      }
      objc_msgSend(WeakRetained, "ppt_seenPeople");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(a1 + 40), v15);
        objc_msgSend(WeakRetained, "setPpt_numCellsLeft:", objc_msgSend(WeakRetained, "ppt_numCellsLeft") - 1);
        if (!objc_msgSend(WeakRetained, "ppt_numCellsLeft"))
        {
          objc_msgSend(WeakRetained, "ppt_cellsLoadedCompletionBlock");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(WeakRetained, "setPpt_shouldRunPPTCode:", 0);
            objc_msgSend(WeakRetained, "ppt_cellsLoadedCompletionBlock");
            v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v18[2]();

          }
        }
      }

    }
    v12 = v19;
  }

}

void __74__PXPeopleCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __74__PXPeopleCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __72__PXPeopleCollectionViewController__updateProgressFooterStateWithForce___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;

  if (a2)
    v2 = 1;
  else
    v2 = 2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProgressFooterState:", v2);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

void __76__PXPeopleCollectionViewController__shouldShowProgressFooterWithCompletion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PXPeopleCollectionViewController__shouldShowProgressFooterWithCompletion___block_invoke_2;
  v3[3] = &unk_1E51427B0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __76__PXPeopleCollectionViewController__shouldShowProgressFooterWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __79__PXPeopleCollectionViewController__updateMeHeaderVisibilityIfNeeded_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

void __87__PXPeopleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

void __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  PXPeopleMeDataSource *v2;
  void *v3;
  PXPeopleMeDataSource *v4;
  PXPeopleMeDataSource *v5;
  _QWORD v6[5];
  PXPeopleMeDataSource *v7;

  v2 = [PXPeopleMeDataSource alloc];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPeopleMeDataSource initWithPhotoLibrary:](v2, "initWithPhotoLibrary:", v3);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_2;
  v6[3] = &unk_1E5133E28;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  -[PXPeopleMeDataSource requestSuggestedMePersonWithCompletion:](v5, "requestSuggestedMePersonWithCompletion:", v6);

}

void __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PXPeopleMeViewController *v4;
  uint64_t v5;
  PXPeopleMeViewController *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a2;
  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = [PXPeopleMeViewController alloc];
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_3;
    v7[3] = &unk_1E5142510;
    objc_copyWeak(&v8, &location);
    v6 = -[PXPeopleMeViewController initWithPerson:suggestionHandler:dismissHandler:](v4, "initWithPerson:suggestionHandler:dismissHandler:", v3, v5, v7);
    -[PXPeopleMeViewController setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setMeViewController:", v6);
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v1);
}

uint64_t __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowMeHeader:", 1);
}

void __50__PXPeopleCollectionViewController_viewDidAppear___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldShowMeHeader:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setMeViewController:", 0);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  int v7;

  v4 = a3;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v7 = objc_msgSend(v5, "interactiveMode") ^ 1;
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  LOBYTE(v5) = v5 != objc_opt_class();

  return v5;
}

- (void)handleReorderingGesture:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v13);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v13, "indexPathForItemAtPoint:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  switch(v5)
  {
    case 1:
      if (v10)
      {
        -[PXPeopleCollectionViewController dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pauseListeningForChangesWithTimeout:identifier:", CFSTR("PXPeopleCollectionViewController (UIDragging)"), 300.0);

        objc_msgSend(v13, "beginInteractiveMovementAtLocation:forItemAtIndexPath:", v10, v7, v9);
        v11 = v13;
        goto LABEL_4;
      }
      break;
    case 2:
LABEL_4:
      objc_msgSend(v11, "updateInteractiveMovementTargetPosition:", v7, v9);
      break;
    case 3:
      objc_msgSend(v13, "endInteractiveMovement");
      break;
    case 4:
      objc_msgSend(v13, "cancelInteractiveMovement");
      break;
    default:
      break;
  }

}

- (void)handleMoveFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  PXPeopleCollectionViewController *v27;

  v6 = a3;
  v7 = a4;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "movePersonAtIndexPath:toIndexPath:undoManager:shouldUpdateImmediately:", v6, v7, v10, 1);

  v11 = objc_msgSend(v7, "section");
  if (v11 != objc_msgSend(v6, "section"))
  {
    -[PXPeopleCollectionViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fetchTypeForSection:", objc_msgSend(v7, "section"));

    if (!v13)
    {
      +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSkipInitialAction:", 1);
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __84__PXPeopleCollectionViewController_UIDragging__handleMoveFromIndexPath_toIndexPath___block_invoke;
      v23 = &unk_1E513DD48;
      v24 = v9;
      v25 = v8;
      v26 = v6;
      v27 = self;
      objc_msgSend(v14, "setCancelBlock:", &v20);
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "processName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Home/Dragging/PXPeopleCollectionViewController+UIDragging.m"), "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v17, v18, "-[PXPeopleCollectionViewController(UIDragging) handleMoveFromIndexPath:toIndexPath:]", 80, v20, v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCallerInfo:", v19);

      objc_msgSend(v14, "setDidCommitPreBootstrapAction:", 1);
      +[PXPeopleUtilities showBootstrapIfNeededWithContext:fromParentVC:](PXPeopleUtilities, "showBootstrapIfNeededWithContext:fromParentVC:", v14, self);

    }
  }

}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return a5;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  -[PXPeopleCollectionViewController setSourceDragIndexPath:](self, "setSourceDragIndexPath:", a4);
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[PXPeopleCollectionViewController handleMoveFromIndexPath:toIndexPath:](self, "handleMoveFromIndexPath:toIndexPath:", a4, v8);
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "section");
  objc_msgSend(v11, "setFavorite:", v10 == 0);

}

- (void)collectionViewDidEndDrag:(id)a3
{
  -[PXPeopleCollectionViewController setSourceDragIndexPath:](self, "setSourceDragIndexPath:", 0);
}

- (void)collectionViewDidEndInteractiveMode:(id)a3
{
  id v3;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resumeListeningForChanges");

}

void __84__PXPeopleCollectionViewController_UIDragging__handleMoveFromIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "indexPathOfPerson:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movePersonAtIndexPath:toIndexPath:undoManager:shouldUpdateImmediately:", v3, v5, v6, 0);

}

- (NSDictionary)ppt_scrollingInformation
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = -[PXPeopleCollectionViewController ppt_sampledCountOfEmptyCells](self, "ppt_sampledCountOfEmptyCells");
  v4 = -[PXPeopleCollectionViewController ppt_sampledCountOfFrames](self, "ppt_sampledCountOfFrames");
  v5 = (double)v3 / (double)v4;
  v11[0] = CFSTR("frames");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("grey cells");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("grey cells per frame");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = CFSTR("unit");
  v12[2] = v8;
  v12[3] = CFSTR("grey cells per frame");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (unint64_t)ppt_countOfEmptyCells
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
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x1E0C80C00];
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController ppt_visibleCollectionViewRect](self, "ppt_visibleCollectionViewRect");
  if (CGRectIsEmpty(v47))
  {
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PXPeopleCollectionViewController tabBarController](self, "tabBarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tabBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;

    -[PXPeopleCollectionViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;

    -[PXPeopleCollectionViewController setPpt_visibleCollectionViewRect:](self, "setPpt_visibleCollectionViewRect:", v5, v7 + v19, v9, v11 - v15);
  }
  -[PXPeopleCollectionViewController ppt_visibleCollectionViewRect](self, "ppt_visibleCollectionViewRect");
  objc_msgSend(v3, "convertRect:fromView:", 0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PXPeopleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutAttributesForElementsInRect:", v21, v23, v25, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v31)
  {
    v32 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "indexPath", (_QWORD)v41);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "cellForItemAtIndexPath:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "avatarView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "image");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
          ++v33;

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v32);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)ppt_indexPathOfPersonWithMostAssets
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v17;
  uint64_t v18;
  id v19;

  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "numberOfSections");
  if (v18)
  {
    v19 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0x1E0CB3000uLL;
    do
    {
      -[PXPeopleCollectionViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfPersonsInSection:", v4);

      if (v7)
      {
        for (i = 0; i != v7; ++i)
        {
          objc_msgSend(*(id *)(v5 + 1712), "indexPathForItem:inSection:", i, v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPeopleCollectionViewController dataSource](self, "dataSource");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "personAtIndexPath:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "numberOfAssets");
          if (v12 > v3)
          {
            v13 = v12;
            v14 = v5;
            v15 = v9;

            v3 = v13;
            v19 = v15;
            v5 = v14;
          }

        }
      }
      ++v4;
    }
    while (v4 != v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int64_t)ppt_numOfCellsLoadingImages
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PXPeopleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (!objc_msgSend(v20, "representedElementCategory", (_QWORD)v25))
        {
          -[PXPeopleCollectionViewController collectionView](self, "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "indexPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cellForItemAtIndexPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v17 += objc_msgSend(v23, "ppt_fullImageLoaded") ^ 1;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)ppt_bestPersonForBootstrap
{
  PXPeopleCollectionViewController *v2;
  uint64_t v3;
  unint64_t v4;
  __objc2_class **v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PXPeopleSuggestionDataSource *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v22;
  uint64_t v23;
  PXPeopleCollectionViewController *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  PXPeopleSuggestionDataSource *v28;
  unint64_t v29;

  v2 = self;
  -[PXPeopleCollectionViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "numberOfSections");
  if (v23)
  {
    v24 = v2;
    v25 = 0;
    v29 = 0;
    v3 = 0;
    v4 = 0x1E0CB3000uLL;
    v5 = off_1E50B3000;
    while (1)
    {
      -[PXPeopleCollectionViewController dataSource](v2, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfPersonsInSection:", v3);

      if (v7)
        break;
LABEL_19:
      if (++v3 == v23)
        goto LABEL_22;
    }
    v8 = 0;
    v26 = v3;
    v27 = v7;
    while (1)
    {
      objc_msgSend(*(id *)(v4 + 1712), "indexPathForItem:inSection:", v8, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleCollectionViewController dataSource](v2, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "personAtIndexPath:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[__objc2_class shouldShowBootstrapForPerson:](v5[352], "shouldShowBootstrapForPerson:", v11))
        break;
LABEL_16:

      if (++v8 == v7)
        goto LABEL_19;
    }
    v12 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
    -[PXPeopleSuggestionDataSource fetchAndCacheMergeCandidatesForPerson:](v12, "fetchAndCacheMergeCandidatesForPerson:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    if ((unint64_t)objc_msgSend(v14, "count") <= 8)
    {
      v15 = objc_msgSend(v14, "count");
      if (!v15)
      {
        v17 = v29;
LABEL_15:
        v5 = off_1E50B3000;

        v29 = v17;
        v7 = v27;
        goto LABEL_16;
      }
    }
    else
    {
      v15 = 9;
    }
    v16 = 0;
    v17 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "numberOfAssets");

      v17 += v19;
      ++v16;
    }
    while (v15 != v16);
    if (v17 <= v29)
    {
      v17 = v29;
    }
    else
    {
      v20 = v11;

      v25 = v20;
    }
    v2 = v24;
    v3 = v26;
    v4 = 0x1E0CB3000;
    goto LABEL_15;
  }
  v25 = 0;
LABEL_22:

  return v25;
}

- (id)ppt_randomPerson
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(v3, "objectAtIndex:", arc4random_uniform(v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)ppt_namePerson:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v8;
  _QWORD v9[4];
  id v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PXPeopleCollectionViewController_PPT__ppt_namePerson___block_invoke;
  v9[3] = &unk_1E5148D08;
  v10 = v3;
  v11 = CFSTR("TEST_NAME_124");
  v5 = v3;
  objc_msgSend(v4, "performChangesAndWait:error:", v9, &v8);
  v6 = v8;

  return v6 == 0;
}

- (void)ppt_changeIndexPaths:(id)a3 toType:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = a3;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewController undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "changePersonsAtIndexPaths:toPersonType:undoManager:", v8, a4, v10);

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    v11 = v12;
  }

}

- (id)ppt_indexPathsForPeopleThatCanChangeToType:(int64_t)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;

  v3 = a3 == 1;
  -[PXPeopleCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfPersonsInSection:", v3);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

    }
  }
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

void __56__PXPeopleCollectionViewController_PPT__ppt_namePerson___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setDisplayName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPersonUri:", &stru_1E5149688);
  objc_msgSend(v2, "setContactMatchingDictionary:", MEMORY[0x1E0C9AA70]);

}

@end
