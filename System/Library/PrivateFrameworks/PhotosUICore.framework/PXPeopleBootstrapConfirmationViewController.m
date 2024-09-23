@implementation PXPeopleBootstrapConfirmationViewController

- (PXPeopleBootstrapConfirmationViewController)initWithContext:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  id v9;
  PXPeopleBootstrapConfirmationViewController *v10;
  PXPeopleBootstrapConfirmationViewController *v11;
  PXPeopleSuggestionManager *v12;
  void *v13;
  uint64_t v14;
  PXPeopleSuggestionManager *suggestionManager;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v9, "setSectionInset:", 0.0, 5.0, 5.0, 5.0);
  objc_msgSend(v9, "setMinimumLineSpacing:", 5.0);
  objc_msgSend(v9, "setMinimumInteritemSpacing:", 5.0);
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  v10 = -[PXPeopleBootstrapConfirmationViewController initWithCollectionViewLayout:](&v17, sel_initWithCollectionViewLayout_, v9);
  v11 = v10;
  if (v10)
  {
    v10->_viewState = 0;
    v12 = [PXPeopleSuggestionManager alloc];
    objc_msgSend(v7, "sourcePerson");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXPeopleSuggestionManager initWithPerson:](v12, "initWithPerson:", v13);
    suggestionManager = v11->_suggestionManager;
    v11->_suggestionManager = (PXPeopleSuggestionManager *)v14;

    -[PXPeopleSuggestionManager setMute:](v11->_suggestionManager, "setMute:", 1);
    -[PXPeopleSuggestionManager setDelegate:](v11->_suggestionManager, "setDelegate:", v11);
    v11->_type = objc_msgSend(v7, "bootstrapType");
    v11->_willAppear = 0;
    objc_storeStrong((id *)&v11->_bootstrapContext, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setInitialPageLimit:", 9);
    -[PXPeopleSuggestionManager setDataSource:](v11->_suggestionManager, "setDataSource:", v8);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v11, CFSTR("nameSelection"), 0, 0);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("nameSelection"));

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  -[PXPeopleBootstrapConfirmationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  -[PXPeopleBootstrapConfirmationViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PXPeopleBootstrapConfirmationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PXPeopleBootstrapConfirmationViewController setLastSize:](self, "setLastSize:", v4, v5);
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v6, "setContentInsetAdjustmentBehavior:", 0);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PXPeopleBootstrapCell"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("PXPeopleBootstrapHeader"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("PXPeopleBootstrapFooter"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
  objc_msgSend(v6, "addInteraction:", v8);
  v9 = -[PXPeopleBootstrapConfirmationViewController viewState](self, "viewState");
  if (v9)
    -[PXPeopleBootstrapConfirmationViewController _updateViewWithViewState:](self, "_updateViewWithViewState:", v9);
  -[PXPeopleBootstrapConfirmationViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "px_loadRepresentativeFacesForPersons:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  -[PXPeopleBootstrapConfirmationViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_keyFaceUpdated_, CFSTR("PXPeopleSuggestionManagerKeyFaceUpdateNotification"), 0);

    objc_msgSend(v5, "startListeningForLibraryChanges");
  }
  -[PXPeopleBootstrapConfirmationViewController _cacheCurrentSuggestions](self, "_cacheCurrentSuggestions");
  -[PXPeopleBootstrapConfirmationViewController setWillAppear:](self, "setWillAppear:", 1);
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    -[PXPeopleBootstrapConfirmationViewController _evaluateIfSuggestionPresentationFinished](self, "_evaluateIfSuggestionPresentationFinished");
  v9 = -[PXPeopleBootstrapConfirmationViewController viewState](self, "viewState");
  if (v9 != 1)
  {
    if (v9 == 4)
      -[PXPeopleBootstrapConfirmationViewController _startLoadingTimer](self, "_startLoadingTimer");
    -[PXPeopleBootstrapConfirmationViewController actionDelegate](self, "actionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdvanceButtonEnabled:", 0);

  }
  -[PXPeopleBootstrapConfirmationViewController _updateHeaderContent](self, "_updateHeaderContent");
  -[PXPeopleBootstrapConfirmationViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  -[PXPeopleBootstrapConfirmationViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PXPeopleSuggestionManagerKeyFaceUpdateNotification"), 0);

    objc_msgSend(v5, "stopListeningForLibraryChanges");
  }
  if ((-[PXPeopleBootstrapConfirmationViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PXPeopleBootstrapConfirmationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[PXPeopleBootstrapConfirmationViewController configControllerDelegate](self, "configControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerWillBePopped:", self);

  }
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
  v9.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  v7 = a4;
  -[PXPeopleBootstrapConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__PXPeopleBootstrapConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5148240;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  v4 = a3;
  -[PXPeopleBootstrapConfirmationViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PXPeopleBootstrapConfirmationViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection", v9.receiver, v9.super_class);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleBootstrapConfirmationViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (NSArray)presentationStatuses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationViewController _sortedIndexPathsForVisibleCells](self, "_sortedIndexPathsForVisibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "count");
  if (objc_msgSend(v6, "count") == v7)
  {
    v17 = v3;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
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
          objc_msgSend(v5, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "presentationStatus"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v3 = v17;
  }
  else
  {
    for (; v7; --v7)
      objc_msgSend(v4, "addObject:", &unk_1E53EED18);
  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v15;
}

- (void)setViewState:(unint64_t)a3
{
  if (-[PXPeopleBootstrapConfirmationViewController viewState](self, "viewState") != a3)
  {
    self->_viewState = a3;
    -[PXPeopleBootstrapConfirmationViewController _updateViewWithViewState:](self, "_updateViewWithViewState:", a3);
  }
}

- (void)_updateViewWithViewState:(unint64_t)a3
{
  void *v4;
  id v5;

  switch(a3)
  {
    case 1uLL:
      -[PXPeopleBootstrapConfirmationViewController actionDelegate](self, "actionDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAdvanceButtonEnabled:", 1);

      -[PXPeopleBootstrapConfirmationViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");
      break;
    case 5uLL:
      -[PXPeopleBootstrapConfirmationViewController actionDelegate](self, "actionDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAdvanceButtonEnabled:", 1);

      break;
    case 2uLL:
      -[PXPeopleBootstrapConfirmationViewController _badgeLoadingCells](self, "_badgeLoadingCells");
      break;
  }
}

- (void)_finishedPresentingSuggestions
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PXPeopleBootstrapConfirmationViewController loadingDelayTimer](self, "loadingDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXPeopleBootstrapConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", 0);
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[PXPeopleBootstrapConfirmationViewController setViewState:](self, "setViewState:", 1);
  else
    -[PXPeopleBootstrapConfirmationViewController _noSuggestionsFound](self, "_noSuggestionsFound");
  -[PXPeopleBootstrapConfirmationViewController setSuggestionsPresented:](self, "setSuggestionsPresented:", 1);
}

- (void)_evaluateIfSuggestionPresentationFinished
{
  id v3;

  -[PXPeopleBootstrapConfirmationViewController presentationStatuses](self, "presentationStatuses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", &unk_1E53EED18) & 1) == 0
    && (objc_msgSend(v3, "containsObject:", &unk_1E53EED30) & 1) == 0
    && !-[PXPeopleBootstrapConfirmationViewController suggestionsPresented](self, "suggestionsPresented"))
  {
    -[PXPeopleBootstrapConfirmationViewController _finishedPresentingSuggestions](self, "_finishedPresentingSuggestions");
  }

}

- (void)_markSkippedSuggestions
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[PXPeopleBootstrapConfirmationViewController presentationStatuses](self, "presentationStatuses");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      if (v7 == 3)
        objc_msgSend(v4, "addIndex:", v5);
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nameSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = (id)objc_msgSend(v8, "arrayByAddingObject:", v11);
  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markSuggestionsAsSkipped:", v8);

}

- (void)_noSuggestionsFound
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[PXPeopleBootstrapConfirmationViewController suggestionsPresented](self, "suggestionsPresented"))
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315138;
      v6 = "-[PXPeopleBootstrapConfirmationViewController _noSuggestionsFound]";
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", (uint8_t *)&v5, 0xCu);
    }

    -[PXPeopleBootstrapConfirmationViewController loadingDelayTimer](self, "loadingDelayTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[PXPeopleBootstrapConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", 0);
    -[PXPeopleBootstrapConfirmationViewController setViewState:](self, "setViewState:", 5);
  }
}

- (void)_toggleConfirmedForCollectionViewCellAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self.collectionView cellForItemAtIndexPath:indexPath]"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self.collectionView cellForItemAtIndexPath:indexPath]"), v16);
  }

LABEL_3:
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "isSuggestionConfirmed:", v11) ^ 1;
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markSuggestions:confirmed:wantsSound:", v13, v12, 1);

    objc_msgSend(v7, "setConfirmed:", v12);
    -[PXPeopleBootstrapConfirmationViewController setHasSelectionEverChanged:](self, "setHasSelectionEverChanged:", 1);

  }
}

- (void)_startLoadingTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  -[PXPeopleBootstrapConfirmationViewController loadingDelayTimer](self, "loadingDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "invalidate");
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke;
  v7[3] = &unk_1E5138F60;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleBootstrapConfirmationViewController setLoadingDelayTimer:](self, "setLoadingDelayTimer:", v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __92__PXPeopleBootstrapConfirmationViewController__updateNavigationBarForCurrentTraitCollection__block_invoke;
  v2[3] = &unk_1E5149198;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)_badgeLoadingCells
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v8, "presentationStatus"))
          objc_msgSend(v8, "setPresentationStatus:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_sortedIndexPathsForVisibleCells
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_cacheCurrentSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v6, "containsObject:", v4))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObject:", v4);

    v6 = v7;
  }
  -[PXPeopleBootstrapConfirmationViewController setCurrentSuggestions:](self, "setCurrentSuggestions:", v6);

}

- (id)_descriptionForFooterView
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 449, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 449, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v12);
  }

LABEL_3:
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, CFSTR("PXPeopleBootstrapHeaderDescriptionNamed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, CFSTR("PXPeopleBootstrapHeaderDescriptionUnnamed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_titleForHeaderView
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 464, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 464, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v12);
  }

LABEL_3:
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, CFSTR("PXPeopleBootstrapHeaderTitleNamed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, CFSTR("PXPeopleBootstrapHeaderTitleUnnamed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_keyAssetForPersonAtIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 478, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("suggestion"), v21);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 478, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("suggestion"), v21, v23);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludedDetectionTypes:", v11);

  objc_msgSend(v10, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceForPerson:options:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CD1390];
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchAssetsForFaces:options:", v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_titleForPreviewForAsset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D716B0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedGeoDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v6 = a3;
  -[PXPeopleBootstrapConfirmationViewController _titleForHeaderView](self, "_titleForHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = v8;

  +[PXPeopleConfirmationHeaderView sizeForTitle:boundingSize:](PXPeopleConfirmationHeaderView, "sizeForTitle:boundingSize:", v7, v9, 0.0);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  objc_msgSend(a3, "frame");
  v7 = v6;
  v9 = v8;
  -[PXPeopleBootstrapConfirmationViewController _descriptionForFooterView](self, "_descriptionForFooterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleBootstrapFooterView sizeForBoundingSize:descriptionText:](PXPeopleBootstrapFooterView, "sizeForBoundingSize:descriptionText:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 0, v5);
  v7 = v6 * 0.5;
  v8 = ceilf(v7);
  v9 = v6;
  v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = (id)*MEMORY[0x1E0DC48A8];
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
    v10 = CFSTR("PXPeopleBootstrapHeader");
  else
    v10 = CFSTR("PXPeopleBootstrapFooter");
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v8)
  {
    -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourcePerson");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPerson:", v14);

    -[PXPeopleBootstrapConfirmationViewController _titleForHeaderView](self, "_titleForHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);
    goto LABEL_8;
  }
  if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    -[PXPeopleBootstrapConfirmationViewController _descriptionForFooterView](self, "_descriptionForFooterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDescriptionText:", v12);
LABEL_8:

  }
  return v11;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  PXPersonImageRequest *v22;
  void *v23;
  double v24;
  double v25;
  PXPeopleFaceCropFetchOptions *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  PXPersonImageRequest *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  PXPersonImageRequest *v39;
  id v40;
  id v41;
  id v42;
  PXPeopleBootstrapConfirmationViewController *v43;
  CGRect v44;
  CGRect v45;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PXPeopleBootstrapCell"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  v19 = CGRectGetWidth(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v20 = CGRectGetHeight(v45);
  if (v19 >= v20)
    v21 = v20;
  else
    v21 = v19;
  v22 = -[PXPersonImageRequest initWithPerson:]([PXPersonImageRequest alloc], "initWithPerson:", v12);
  objc_msgSend(v8, "setImageRequest:", v22);
  objc_msgSend(v8, "setIsMergeCandidate:", objc_msgSend(v12, "isPersonModel"));
  objc_msgSend(v8, "setIsVerified:", objc_msgSend(v12, "isVerified"));
  objc_msgSend(v7, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "displayScale");
  v25 = v24;

  v26 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, v21, v21, v25);
  -[PXPeopleFaceCropFetchOptions setCropFactor:](v26, "setCropFactor:", 0);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v26, "setCornerStyle:", 1);
  -[PXPeopleFaceCropFetchOptions setUseLowMemoryMode:](v26, "setUseLowMemoryMode:", -[PXPeopleBootstrapConfirmationViewController useLowMemoryMode](self, "useLowMemoryMode"));
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E5138FB0;
  v39 = v22;
  v28 = v8;
  v40 = v28;
  v41 = v10;
  v42 = v12;
  v43 = self;
  v29 = v12;
  v30 = v10;
  v31 = v22;
  v36[0] = v27;
  v36[1] = 3221225472;
  v36[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v36[3] = &unk_1E5147AB8;
  v37 = _Block_copy(aBlock);
  v32 = v37;
  -[PXPersonImageRequest requestFaceCropWithOptions:timeout:resultHandler:](v31, "requestFaceCropWithOptions:timeout:resultHandler:", v26, v36, 30.0);
  v33 = v37;
  v34 = v28;

  return v34;
}

- (void)updateImageForCell:(id)a3 withPerson:(id)a4
{
  id v6;
  id v7;
  PXPersonImageRequest *v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  PXPeopleFaceCropFetchOptions *v20;
  id v21;
  id v22;
  id v23;
  PXPersonImageRequest *v24;
  _QWORD v25[4];
  PXPersonImageRequest *v26;
  id v27;
  id v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v6 = a3;
  v7 = a4;
  v8 = -[PXPersonImageRequest initWithPerson:]([PXPersonImageRequest alloc], "initWithPerson:", v7);
  objc_msgSend(v6, "setImageRequest:", v8);
  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v14 = CGRectGetWidth(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v15 = CGRectGetHeight(v31);
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  objc_msgSend(v6, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayScale");
  v19 = v18;

  v20 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v7, v16, v16, v19);
  -[PXPeopleFaceCropFetchOptions setCropFactor:](v20, "setCropFactor:", 0);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v20, "setCornerStyle:", 1);
  -[PXPeopleFaceCropFetchOptions setUseLowMemoryMode:](v20, "setUseLowMemoryMode:", -[PXPeopleBootstrapConfirmationViewController useLowMemoryMode](self, "useLowMemoryMode"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke;
  v25[3] = &unk_1E5138FD8;
  v26 = v8;
  v27 = v6;
  v28 = v9;
  v29 = v7;
  v21 = v7;
  v22 = v9;
  v23 = v6;
  v24 = v8;
  -[PXPersonImageRequest requestFaceCropWithOptions:timeout:resultHandler:](v24, "requestFaceCropWithOptions:timeout:resultHandler:", v20, v25, 30.0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[PXPeopleBootstrapConfirmationViewController _toggleConfirmedForCollectionViewCellAtIndexPath:](self, "_toggleConfirmedForCollectionViewCellAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  -[PXPeopleBootstrapConfirmationViewController _toggleConfirmedForCollectionViewCellAtIndexPath:](self, "_toggleConfirmedForCollectionViewCellAtIndexPath:", a4);
}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PXPeopleBootstrapConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[PXPeopleBootstrapConfirmationViewController willLoadMoreSuggestionsForSuggestionManager:]";
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", buf, 0xCu);
  }

  if (-[PXPeopleBootstrapConfirmationViewController willAppear](self, "willAppear"))
  {
    -[PXPeopleBootstrapConfirmationViewController _startLoadingTimer](self, "_startLoadingTimer");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PXPeopleBootstrapConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  _QWORD v5[4];
  id v6;
  id location;

  -[PXPeopleBootstrapConfirmationViewController _cacheCurrentSuggestions](self, "_cacheCurrentSuggestions", a3, a4);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__PXPeopleBootstrapConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  +[PXPeopleBootstrap preferredBootstrapSize](PXPeopleBootstrap, "preferredBootstrapSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (void)willTransitionToNextInFlow
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315138;
    v7 = "-[PXPeopleBootstrapConfirmationViewController willTransitionToNextInFlow]";
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", (uint8_t *)&v6, 0xCu);
  }

  -[PXPeopleBootstrapConfirmationViewController _markSkippedSuggestions](self, "_markSkippedSuggestions");
  -[PXPeopleBootstrapConfirmationViewController suggestionManager](self, "suggestionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationViewController bootstrapContext](self, "bootstrapContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuggestionManager:", v4);

}

- (BOOL)shouldConfirmAdvancement
{
  return !-[PXPeopleBootstrapConfirmationViewController hasSelectionEverChanged](self, "hasSelectionEverChanged");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("nameSelection"), a4, a5, a6))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PXPeopleBootstrapConfirmationViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)keyFaceUpdated:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[7];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PXPeopleUpdatedKeyFacePersonsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v30 = 0u;
  obj = v4;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "visibleCells");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v13, "image");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                objc_msgSend(v13, "imageRequest");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "person");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "px_localIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "px_localIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "isEqualToString:", v18);

                if (v19)
                {
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __62__PXPeopleBootstrapConfirmationViewController_keyFaceUpdated___block_invoke;
                  block[3] = &unk_1E51457C8;
                  block[4] = self;
                  block[5] = v13;
                  block[6] = v6;
                  dispatch_async(MEMORY[0x1E0C80D38], block);
                }

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v10);
        }

        v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  PXPeopleBootstrapConfirmationViewController *v40;

  y = a4.y;
  x = a4.x;
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 854, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[collectionView cellForItemAtIndexPath:indexPath]"), v25, v27);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 854, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[collectionView cellForItemAtIndexPath:indexPath]"), v25);
    }

LABEL_4:
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v21 = 0;
      goto LABEL_10;
    }
    v12 = objc_msgSend(v9, "item");
    -[PXPeopleBootstrapConfirmationViewController _keyAssetForPersonAtIndex:](self, "_keyAssetForPersonAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapConfirmationViewController currentSuggestions](self, "currentSuggestions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15;
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        v17 = MEMORY[0x1E0C809B0];
        v18 = (void *)MEMORY[0x1E0DC36B8];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
        v37[3] = &unk_1E5139000;
        v38 = v16;
        v39 = v13;
        v40 = self;
        v33[0] = v17;
        v33[1] = 3221225472;
        v33[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
        v33[3] = &unk_1E5139050;
        v33[4] = self;
        v34 = v16;
        v35 = v9;
        v36 = v39;
        v19 = v39;
        v20 = v16;
        objc_msgSend(v18, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v37, v33);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_descriptionForAssertionMessage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 859, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("suggestion"), v30, v32);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationViewController.m"), 859, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("suggestion"), v30);
    }

    goto LABEL_7;
  }
  v21 = 0;
LABEL_11:

  return v21;
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
  -[PXPeopleBootstrapConfirmationViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "indexPathForItemAtPoint:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (PXPeopleFlowViewControllerActionDelegate)actionDelegate
{
  return (PXPeopleFlowViewControllerActionDelegate *)objc_loadWeakRetained((id *)&self->actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->actionDelegate, a3);
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  return (PXPeoplePickerConfigurationControllerDelegate *)objc_loadWeakRetained((id *)&self->_configControllerDelegate);
}

- (void)setConfigControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configControllerDelegate, a3);
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (NSArray)currentSuggestions
{
  return self->_currentSuggestions;
}

- (void)setCurrentSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_currentSuggestions, a3);
}

- (NSTimer)loadingDelayTimer
{
  return self->_loadingDelayTimer;
}

- (void)setLoadingDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, a3);
}

- (BOOL)suggestionsPresented
{
  return self->_suggestionsPresented;
}

- (void)setSuggestionsPresented:(BOOL)a3
{
  self->_suggestionsPresented = a3;
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)willAppear
{
  return self->_willAppear;
}

- (void)setWillAppear:(BOOL)a3
{
  self->_willAppear = a3;
}

- (CGSize)lastSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastSize.width;
  height = self->_lastSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (BOOL)hasSelectionEverChanged
{
  return self->_hasSelectionEverChanged;
}

- (void)setHasSelectionEverChanged:(BOOL)a3
{
  self->_hasSelectionEverChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_destroyWeak((id *)&self->actionDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

PXPeopleBootstrapConfirmationPreviewViewController *__101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return -[PXPeopleBootstrapConfirmationPreviewViewController initWithPerson:keyAsset:useLowMemoryMode:]([PXPeopleBootstrapConfirmationPreviewViewController alloc], "initWithPerson:keyAsset:useLowMemoryMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "useLowMemoryMode"));
}

id __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSuggestionConfirmed:", *(_QWORD *)(a1 + 40)))
    v5 = CFSTR("PXPeopleBootstrapPreviewDeselect");
  else
    v5 = CFSTR("PXPeopleBootstrapPreviewSelect");
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v15[3] = &unk_1E5139028;
  objc_copyWeak(&v17, &location);
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, v8, 0, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_titleForPreviewForAsset:", *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithTitle:children:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_toggleConfirmedForCollectionViewCellAtIndexPath:", *(_QWORD *)(a1 + 32));

}

uint64_t __62__PXPeopleBootstrapConfirmationViewController_keyFaceUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateImageForCell:withPerson:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__PXPeopleBootstrapConfirmationViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cacheCurrentSuggestions");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

void __92__PXPeopleBootstrapConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSuggestionsPresented:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

uint64_t __91__PXPeopleBootstrapConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewState:", 4);
}

uint64_t __94__PXPeopleBootstrapConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noSuggestionsFound");
}

void __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke_2;
  v9[3] = &unk_1E51393C8;
  v10 = a1[4];
  v11 = a1[5];
  v12 = v6;
  v13 = v5;
  v14 = a1[6];
  v15 = a1[7];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "CGRectValue");
    objc_msgSend(v5, "setImage:contentsRect:", v6);
    if (*(_QWORD *)(a1 + 56))
    {
      v7 = *(void **)(a1 + 64);
      v9[0] = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "markSuggestions:confirmed:wantsSound:", v8, 1, 1);

      objc_msgSend(*(id *)(a1 + 40), "setConfirmed:", 1);
    }

  }
}

void __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5138F88;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v17 = v7;
  v18 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "CGRectValue");
    objc_msgSend(v7, "setImage:contentsRect:", v8);
    if (!v4 || v5)
    {
      if (!v4)
      {
        v11 = *(void **)(a1 + 64);
        v13 = *(_QWORD *)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "markSuggestionsAsSkipped:", v12);

      }
    }
    else
    {
      v9 = *(void **)(a1 + 64);
      v14[0] = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "markSuggestions:confirmed:wantsSound:", v10, 1, 1);

      objc_msgSend(*(id *)(a1 + 40), "setConfirmed:", 1);
    }
    objc_msgSend(*(id *)(a1 + 80), "_evaluateIfSuggestionPresentationFinished");

  }
}

void __92__PXPeopleBootstrapConfirmationViewController__updateNavigationBarForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "currentSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    v4 = CFSTR("PXPeopleBootstrapNewConfirmationTitle");
  else
    v4 = CFSTR("PXPeopleBootstrapConfirmationTitle");
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v5);

}

void __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke_2;
  block[3] = &unk_1E5147B18;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  char v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "loadingDelayTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Bootstrap UI: Display loading UI (Timer Valid)", buf, 2u);
    }

    v8 = objc_loadWeakRetained(v2);
    v9 = objc_msgSend(v8, "suggestionsPresented");

    if ((v9 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "setViewState:", 2);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Bootstrap UI: Do not display loading UI (Timer Invalid)", v10, 2u);
    }

  }
}

void __98__PXPeopleBootstrapConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

@end
