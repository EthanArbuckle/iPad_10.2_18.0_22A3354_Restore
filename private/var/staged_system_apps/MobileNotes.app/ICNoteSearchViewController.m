@implementation ICNoteSearchViewController

- (void)updateCollectionViewForCurrentViewMode
{
  void *v3;
  ICNoteSearchCollectionView *v4;
  void *v5;
  void *v6;
  void *v7;
  ICNoteSearchCollectionView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICNoteSearchDataSource *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICNoteSearchDataSource *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  _BOOL8 v28;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));

  if (!v3)
  {
    v4 = [ICNoteSearchCollectionView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](self, "legacyViewContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v8 = -[ICNoteBrowseCollectionView initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:](v4, "initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:", self, v5, v6, v7);
    -[ICNoteResultsViewController setCollectionView:](self, "setCollectionView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController collectionViewDelegate](self, "collectionViewDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v11, "addSubview:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v13, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 1, 0, 0.0, 0.0);

  }
  v14 = [ICNoteSearchDataSource alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v16 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](self, "legacyViewContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchContext](self, "searchContext"));
  v21 = -[ICNoteSearchDataSource initWithCollectionView:noteContainerViewMode:viewControllerManager:legacyViewContext:modernViewContext:searchContext:](v14, "initWithCollectionView:noteContainerViewMode:viewControllerManager:legacyViewContext:modernViewContext:searchContext:", v15, v16, v17, v18, v19, v20);
  -[ICNoteSearchViewController setSearchDataSource:](self, "setSearchDataSource:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v22, "setDelegate:", self);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController dataSource](self, "dataSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "collectionViewDiffableDataSource"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v25, "setDiffableDataSource:", v24);

  v26 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v27, "setNoteContainerViewMode:", v26);

  v28 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == 0;
  v29 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v29, "setSelectionFollowsFocus:", v28);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICNoteSearchViewController;
  -[ICNoteResultsViewController viewDidLoad](&v13, "viewDidLoad");
  -[ICNoteSearchViewController updateCollectionViewForCurrentViewMode](self, "updateCollectionViewForCurrentViewMode");
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crossProcessChangeCoordinator"));
  v5 = ICLockedNotesModeMigratorDidMigrateNoteNotification;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10005162C;
  v10 = &unk_10054FF58;
  objc_copyWeak(&v11, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "registerForCrossProcessNotificationName:block:", v5, &v7));
  -[ICNoteSearchViewController setNoteMigrationObserver:](self, "setNoteMigrationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setSearchDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_searchDataSource, a3);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (void)setSearchBar:(id)a3
{
  UISearchBar **p_searchBar;
  id v5;
  id v6;

  p_searchBar = &self->_searchBar;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_searchBar, v6);
  objc_msgSend(v6, "setDelegate:", self);

}

- (ICNoteSearchDataSource)searchDataSource
{
  return self->_searchDataSource;
}

- (ICSearchSuggestionsContext)searchContext
{
  ICSearchSuggestionsContext *v3;
  ICSearchSuggestionsContext *searchContext;

  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions")&& !self->_searchContext)
  {
    v3 = (ICSearchSuggestionsContext *)objc_alloc_init((Class)ICSearchSuggestionsContext);
    searchContext = self->_searchContext;
    self->_searchContext = v3;

  }
  return self->_searchContext;
}

- (ICNoteSearchViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4
{
  id v6;
  ICNoteSearchViewController *v7;
  id v8;
  void *v9;
  ICNASearchResultExposureReporter *v10;
  ICNASearchResultExposureReporter *searchResultExposureReporter;
  ICSearchSuggestionController *v12;
  void *v13;
  ICSearchSuggestionController *v14;
  ICSearchSuggestionController *suggestionsController;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICNoteSearchViewController;
  v7 = -[ICNoteResultsViewController initWithViewMode:viewControllerManager:viewControllerType:](&v17, "initWithViewMode:viewControllerManager:viewControllerType:", a3, v6, 1);
  if (v7)
  {
    v8 = objc_alloc((Class)ICNASearchResultExposureReporter);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v10 = (ICNASearchResultExposureReporter *)objc_msgSend(v8, "initWithWindow:", v9);
    searchResultExposureReporter = v7->_searchResultExposureReporter;
    v7->_searchResultExposureReporter = v10;

    if ((+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions") & 1) == 0)
    {
      v12 = [ICSearchSuggestionController alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController view](v7, "view"));
      v14 = -[ICSearchSuggestionController initWithParentView:delegate:](v12, "initWithParentView:delegate:", v13, v7);
      suggestionsController = v7->_suggestionsController;
      v7->_suggestionsController = v14;

    }
    v7->_showCompactFloatingSuggestions = 0;
    -[ICNoteSearchViewController registerForTraitChanges](v7, "registerForTraitChanges");
  }

  return v7;
}

- (ICNoteSearchViewControllerCollectionViewDelegate)collectionViewDelegate
{
  ICNoteSearchViewControllerCollectionViewDelegate *collectionViewDelegate;
  ICNoteSearchViewControllerCollectionViewDelegate *v4;
  ICNoteSearchViewControllerCollectionViewDelegate *v5;

  collectionViewDelegate = self->_collectionViewDelegate;
  if (!collectionViewDelegate)
  {
    v4 = -[ICNoteSearchViewControllerCollectionViewDelegate initWithNoteSearchViewController:]([ICNoteSearchViewControllerCollectionViewDelegate alloc], "initWithNoteSearchViewController:", self);
    v5 = self->_collectionViewDelegate;
    self->_collectionViewDelegate = v4;

    collectionViewDelegate = self->_collectionViewDelegate;
  }
  return collectionViewDelegate;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNoteSearchViewController;
  -[ICNoteResultsViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification"), 0);

  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
    -[ICNoteSearchViewController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController eventReporter](self, "eventReporter"));
  objc_msgSend(v6, "submitSearchAttemptEvent");

  -[ICNoteSearchViewController updateSearchResultsVisibility](self, "updateSearchResultsVisibility");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  objc_msgSend(v7, "refreshNotesIfNeededForCollection:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100404C54(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v13, "cancelSearchQuery");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification"), 0);

  v15.receiver = self;
  v15.super_class = (Class)ICNoteSearchViewController;
  -[ICNoteSearchViewController viewWillDisappear:](&v15, "viewWillDisappear:", v3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crossProcessChangeCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController noteMigrationObserver](self, "noteMigrationObserver"));
  objc_msgSend(v4, "removeCrossProcessNotificationObserver:", v5);

  v6.receiver = self;
  v6.super_class = (Class)ICNoteSearchViewController;
  -[ICNoteResultsViewController dealloc](&v6, "dealloc");
}

- (void)registerForTraitChanges
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection ic_traitsAffectingSizeAndColor](UITraitCollection, "ic_traitsAffectingSizeAndColor"));
  v3 = -[ICNoteSearchViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, "updateSearchResultsVisibility");

}

- (BOOL)isActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_accountIdentifier, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  -[ICNoteSearchViewController updateSearchAccountIdentifierWithSelectedScope:](self, "updateSearchAccountIdentifierWithSelectedScope:", objc_msgSend(v4, "selectedScopeButtonIndex"));

}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteSearchViewController;
  -[ICBaseViewController setNoteContainerViewMode:](&v4, "setNoteContainerViewMode:", a3);
  -[ICNoteSearchViewController updateCollectionViewForCurrentViewMode](self, "updateCollectionViewForCurrentViewMode");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (-[ICNoteSearchViewController searchBarContainsQuery](self, "searchBarContainsQuery", a3))
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100404C84(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
    objc_msgSend(v14, "cancelSearchQuery");

  }
  -[ICNoteSearchViewController updateSearchAccountIdentifierWithSelectedScope:](self, "updateSearchAccountIdentifierWithSelectedScope:", a4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  objc_msgSend(v4, "switchToMode:", 2);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, a3);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
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
  void *v31;
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
  id v43;
  _QWORD v44[4];
  id v45;

  v43 = a3;
  if (!objc_msgSend(v43, "isBeingPresented")
    || -[ICNoteSearchViewController searchBarContainsQuery](self, "searchBarContainsQuery")
    || +[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "searchBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "searchBar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchTextField"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tokens"));

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100051FF8;
    v44[3] = &unk_100550FF0;
    v9 = objc_alloc_init((Class)NSMutableArray);
    v45 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textInputMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryLanguage"));

    v13 = objc_msgSend(objc_alloc((Class)ICSearchUserInput), "initWithSearchString:tokens:keyboardLanguage:", v5, v9, v12);
    +[ICSearchProfiler resetProfileTimer](ICSearchProfiler, "resetProfileTimer");
    +[ICSearchProfiler logProfilingWithMessage:](ICSearchProfiler, "logProfilingWithMessage:", CFSTR("ICNotesSearchresultsController updateSearchResultsForSearchController:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteEditorViewController"));
    v16 = objc_msgSend(v15, "ic_isViewVisible");

    if (v16)
    {
      if (objc_msgSend(v5, "length"))
        v17 = objc_msgSend(objc_alloc((Class)ICSearchResultRegexMatchFinder), "initWithSearchString:", v5);
      else
        v17 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "noteEditorViewController"));
      objc_msgSend(v19, "highlightSearchMatchesForRegexFinder:", v17);

    }
    if (objc_msgSend(v13, "isEmpty"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchResultExposureReporter](self, "searchResultExposureReporter"));
      objc_msgSend(v20, "submitEventIfApplicable");

      -[ICNoteSearchViewController setSearchSessionID:](self, "setSearchSessionID:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchResultExposureReporter](self, "searchResultExposureReporter"));
      objc_msgSend(v21, "invalidateSearchSessionID");

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legacyNoteEditorViewController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "eventReporter"));
      objc_msgSend(v24, "popSearchData");

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "noteEditorViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "eventReporter"));
      objc_msgSend(v27, "popSearchData");
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));

      if (v28)
      {
LABEL_14:
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchResultExposureReporter](self, "searchResultExposureReporter"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchString"));
        objc_msgSend(v40, "startTrackingNewSearchString:", v41);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
        objc_msgSend(v42, "searchWithUserInput:updateHandler:", v13, 0);

        -[ICNoteSearchViewController updateSearchResultsVisibility](self, "updateSearchResultsVisibility");
        goto LABEL_15;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUIDString"));
      -[ICNoteSearchViewController setSearchSessionID:](self, "setSearchSessionID:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchResultExposureReporter](self, "searchResultExposureReporter"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));
      objc_msgSend(v31, "updateSearchSessionID:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController eventReporter](self, "eventReporter"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));
      objc_msgSend(v33, "submitSearchInitiateEventWithSearchSessionID:searchSuggestionType:", v34, +[ICSearchToken suggestionTypeOfFirstItemInTokens:](ICSearchToken, "suggestionTypeOfFirstItemInTokens:", v9));

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "legacyNoteEditorViewController"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "eventReporter"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));
      objc_msgSend(v37, "pushSearchDataWithSearchSessionID:", v38);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "noteEditorViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "eventReporter"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));
      objc_msgSend(v27, "pushSearchDataWithSearchSessionID:", v39);

    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)_dci_updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = objc_opt_class(ICSearchSuggestion);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedObject"));

  v8 = ICDynamicCast(v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v10;
  if (v10)
  {
    -[ICNoteSearchViewController processSelectedSearchSuggestion:](self, "processSelectedSearchSuggestion:", v10);
    v9 = v10;
  }

}

- (void)searchDataSourceDidUpdateSuggestions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSuggestions"));
    -[ICNoteSearchViewController setSuggestions:](self, "setSuggestions:", v5);

  }
}

- (void)setSuggestions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (-[ICNoteSearchViewController showCompactFloatingSuggestions](self, "showCompactFloatingSuggestions"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_map:", &stru_100551030));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
    objc_msgSend(v5, "_dci_setSearchSuggestions:", v4);

LABEL_5:
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_dci_searchSuggestions"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
    objc_msgSend(v4, "_dci_setSearchSuggestions:", &__NSArray0__struct);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)searchBarContainsQuery
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (unint64_t)objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchTextField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tokens"));
  v9 = (unint64_t)objc_msgSend(v8, "count");

  return (v5 | v9) != 0;
}

- (BOOL)showsFloatingSuggestions
{
  void *v3;
  unsigned int v4;

  if ((id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController view](self, "view"));
    v4 = objc_msgSend(v3, "ic_hasCompactSize") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)updateSearchResultsVisibility
{
  unsigned int v3;
  _BOOL8 v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  const __CFString *v29;
  void *v30;

  v3 = -[ICNoteSearchViewController queryDidExist](self, "queryDidExist");
  v4 = -[ICNoteSearchViewController searchBarContainsQuery](self, "searchBarContainsQuery");
  if (v4)
    v5 = +[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions");
  else
    v5 = 1;
  -[ICNoteSearchViewController setQueryDidExist:](self, "setQueryDidExist:", v4);
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))v6 = -[ICNoteSearchViewController showsFloatingSuggestions](self, "showsFloatingSuggestions") & !v4;
  else
    v6 = v4 ^ 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setHidden:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
  if (!objc_msgSend(v8, "isActive"))
  {

    if (!-[ICNoteSearchViewController showsFloatingSuggestions](self, "showsFloatingSuggestions"))
      goto LABEL_14;
    v11 = 0;
LABEL_13:
    -[ICNoteSearchViewController setShowCompactFloatingSuggestions:](self, "setShowCompactFloatingSuggestions:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController suggestionsController](self, "suggestionsController"));
    objc_msgSend(v15, "hide");

    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
  v10 = objc_msgSend(v9, "showsSearchResultsController");

  v11 = v10 & v5;
  if (-[ICNoteSearchViewController showsFloatingSuggestions](self, "showsFloatingSuggestions"))
    goto LABEL_13;
  if (!(_DWORD)v11)
  {
LABEL_14:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController suggestionsController](self, "suggestionsController"));
    objc_msgSend(v12, "hide");
    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController suggestionsController](self, "suggestionsController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController transitionCoordinator](self, "transitionCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v14, "frame");
  objc_msgSend(v12, "showWithAnimated:transitionCoordinator:searchBarFrame:", 1, v13);

LABEL_15:
  -[ICNoteSearchViewController setShowCompactFloatingSuggestions:](self, "setShowCompactFloatingSuggestions:", 0);
LABEL_16:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController suggestionsController](self, "suggestionsController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collectionView"));

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    if (-[ICNoteSearchViewController ic_behavior](self, "ic_behavior") == (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController view](self, "view"));
      objc_msgSend(v19, "setBackgroundColor:", v18);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      if (objc_msgSend(v18, "isHidden"))
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      else
        v20 = objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
      v19 = (void *)v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController view](self, "view"));
      objc_msgSend(v21, "setBackgroundColor:", v19);

    }
  }
  if (v3 != v4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v29 = CFSTR("ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v30 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("ICNoteSearchViewControllerQueryDidChangeNotification"), self, v24);

  }
  if (!v4)
  {
    if (-[ICNoteSearchViewController showsFloatingSuggestions](self, "showsFloatingSuggestions"))
      v28 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController observableScrollView](self, "observableScrollView"));
    else
      v28 = v17;
    v25 = v28;
    -[ICNoteSearchViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v28, 15);
    goto LABEL_33;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  -[ICNoteSearchViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v25, 15);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v27 = objc_msgSend(v26, "isHidden");

  if (!v27)
  {
LABEL_33:
    -[ICNoteSearchViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
    goto LABEL_34;
  }
  -[ICNoteSearchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "setNeedsUpdateContentUnavailableConfiguration", 0, 0.8);
LABEL_34:

}

- (void)updateSearchAccountIdentifierWithSelectedScope:(unint64_t)a3
{
  void *v4;
  id v5;

  if (a3 == 1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController accountIdentifier](self, "accountIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
    objc_msgSend(v4, "setAccountIdentifier:", v5);

  }
  else
  {
    if (a3)
      return;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
    objc_msgSend(v5, "setAccountIdentifier:", 0);
  }

}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4;
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
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  switch(-[ICNoteSearchViewController state](self, "state"))
  {
    case 0uLL:
    case 2uLL:
      -[ICNoteSearchViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
      if (-[ICNoteSearchViewController showsFloatingSuggestions](self, "showsFloatingSuggestions"))
        v4 = -[ICNoteSearchViewController searchBarContainsQuery](self, "searchBarContainsQuery") ^ 1;
      else
        v4 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      objc_msgSend(v5, "setHidden:", v4);
      goto LABEL_14;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration loadingConfiguration](UIContentUnavailableConfiguration, "loadingConfiguration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Searching…"), &stru_1005704B8, 0));
      objc_msgSend(v5, "setText:", v7);

      -[ICNoteSearchViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      objc_msgSend(v8, "setHidden:", 1);

      goto LABEL_14;
    case 3uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration searchConfiguration](UIContentUnavailableConfiguration, "searchConfiguration"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updatedConfigurationForState:", v23));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
      objc_msgSend(v5, "setImage:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchText"));
      if (objc_msgSend(v11, "length"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("No results for “%@”"), &stru_1005704B8, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchText"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v14));

      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("No results"), &stru_1005704B8, 0));
      }

      objc_msgSend(v5, "setText:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "customStateForKey:", CFSTR("ICNoteEmptyStateActualSearchStringLengthKey")));
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = v18;
      if (v17)
        v20 = CFSTR("Check spelling or try a new search.");
      else
        v20 = CFSTR("Try a new search.");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1005704B8, 0));
      objc_msgSend(v5, "setSecondaryText:", v21);

      -[ICNoteSearchViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      objc_msgSend(v22, "setHidden:", 1);

LABEL_14:
      break;
    default:
      break;
  }

}

- (id)contentUnavailableConfigurationState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICNoteSearchViewController;
  v3 = -[ICNoteSearchViewController contentUnavailableConfigurationState](&v13, "contentUnavailableConfigurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSearchUserInput"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayString"));
  objc_msgSend(v4, "setSearchText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSearchUserInput"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length")));
  objc_msgSend(v4, "setCustomState:forKey:", v11, CFSTR("ICNoteEmptyStateActualSearchStringLengthKey"));

  return v4;
}

- (void)startSearchBecomeFirstResponder:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100052C00;
  v3[3] = &unk_100550360;
  v3[4] = self;
  v4 = a3;
  -[ICNoteSearchViewController ic_performBlockAfterActiveTransition:](self, "ic_performBlockAfterActiveTransition:", v3);
}

- (void)cancelSearch
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchTextField"));
    objc_msgSend(v7, "setText:", &stru_1005704B8);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
  v9 = objc_msgSend(v8, "isActive");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchController](self, "searchController"));
    objc_msgSend(v10, "setActive:", 0);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchTextField"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tokens"));
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchTextField"));
    objc_msgSend(v15, "setTokens:", &__NSArray0__struct);

  }
}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 diffableDataSourceSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  char *v10;
  void ***v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void **v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (char *)objc_msgSend(v7, "indexOfItemIdentifier:", v6);
    if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9 + 1;
      v20 = _NSConcreteStackBlock;
      v21 = 3221225472;
      v22 = sub_100052FEC;
      v23 = &unk_100551058;
      v24 = v8;
      v11 = objc_retainBlock(&v20);
      v12 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, CFSTR("ICNoteSearchDataSourceTopHitsSectionIdentifier"));
      v13 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, CFSTR("ICNoteSearchDataSourceNoteSectionIdentifier"));
      v14 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, CFSTR("ICNoteSearchDataSourceAttachmentSectionIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchResultExposureReporter](self, "searchResultExposureReporter"));
      objc_msgSend(v15, "updateSearchResultWasSelected:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController eventReporter](self, "eventReporter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchSessionID](self, "searchSessionID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
      v19 = objc_msgSend(v18, "searchStringLength");
      objc_msgSend(v16, "submitSearchResultSelectEventWithSearchResult:searchSessionID:queryLength:topHitResultCount:noteResultCount:attachmentResultCount:gmRank:", v6, v17, v19, v12, v13, v14, v10, v20, v21, v22, v23);

    }
  }

}

- (unint64_t)state
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[ICNoteSearchViewController searchBarContainsQuery](self, "searchBarContainsQuery"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  v4 = objc_msgSend(v3, "didUpdateForCurrentSearchUserInput");

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSnapshot"));
  v8 = objc_msgSend(v7, "numberOfItems");

  if (v8)
    return 2;
  else
    return 3;
}

- (void)setShowCompactFloatingSuggestions:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_showCompactFloatingSuggestions == a3)
  {
    if (!+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))return;
  }
  else
  {
    self->_showCompactFloatingSuggestions = a3;
  }
  if (-[ICNoteSearchViewController queryDidExist](self, "queryDidExist"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchDataSource](self, "searchDataSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSuggestions"));
    -[ICNoteSearchViewController setSuggestions:](self, "setSuggestions:", v5);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[ICSearchSuggestion orderedDefaultSearchSuggestions](ICSearchSuggestion, "orderedDefaultSearchSuggestions"));
    -[ICNoteSearchViewController setSuggestions:](self, "setSuggestions:", v6);
  }

}

- (void)processSelectedSearchSuggestion:(id)a3
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
  unsigned __int8 v16;
  void *v17;
  id v18;

  v18 = a3;
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions")&& (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "csSuggestion")), v4, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchContext](self, "searchContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "csSuggestion"));
    objc_msgSend(v5, "updateSearchSuggestion:interaction:", v6, 1);

    -[ICNoteSearchViewController updateFromSearchContext](self, "updateFromSearchContext");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "token"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchSuggestion iconImageForToken:](ICSearchSuggestion, "iconImageForToken:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UISearchToken tokenWithIcon:text:](UISearchToken, "tokenWithIcon:text:", v8, v9));

    objc_msgSend(v10, "setRepresentedObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchTextField"));

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedTextRange"));
    if (v13
      && (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedTextRange")),
          v16 = objc_msgSend(v15, "isEmpty"),
          v15,
          v14,
          (v16 & 1) == 0))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedTextRange"));
      objc_msgSend(v12, "replaceTextualPortionOfRange:withToken:atIndex:", v17, v10, 0);

    }
    else
    {
      objc_msgSend(v12, "insertToken:atIndex:", v10, 0);
    }

  }
  -[ICNoteSearchViewController updateSearchResultsVisibility](self, "updateSearchResultsVisibility");

}

- (void)updateFromSearchContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchBar](self, "searchBar"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchTextField"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tokens"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_objectsPassingTest:", &stru_100551098));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchContext](self, "searchContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchSuggestion"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userQueryString"));
    v9 = (void *)v8;
    v10 = &stru_1005704B8;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewController searchContext](self, "searchContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchSuggestion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentTokens"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_map:", &stru_1005510D8));

    objc_msgSend(v17, "setText:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v15));
    objc_msgSend(v17, "setTokens:", v16);

  }
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (UISearchController)searchController
{
  return (UISearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setShowsFloatingSuggestions:(BOOL)a3
{
  self->_showsFloatingSuggestions = a3;
}

- (UIScrollView)observableScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_observableScrollView);
}

- (void)setObservableScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_observableScrollView, a3);
}

- (NSString)searchSessionID
{
  return self->_searchSessionID;
}

- (void)setSearchSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (ICNASearchResultExposureReporter)searchResultExposureReporter
{
  return self->_searchResultExposureReporter;
}

- (void)setSearchResultExposureReporter:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultExposureReporter, a3);
}

- (void)setCollectionViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDelegate, a3);
}

- (ICSearchSuggestionController)suggestionsController
{
  return self->_suggestionsController;
}

- (void)setSuggestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsController, a3);
}

- (void)setSearchContext:(id)a3
{
  objc_storeStrong((id *)&self->_searchContext, a3);
}

- (BOOL)showCompactFloatingSuggestions
{
  return self->_showCompactFloatingSuggestions;
}

- (BOOL)queryDidExist
{
  return self->_queryDidExist;
}

- (void)setQueryDidExist:(BOOL)a3
{
  self->_queryDidExist = a3;
}

- (NSObject)noteMigrationObserver
{
  return self->_noteMigrationObserver;
}

- (void)setNoteMigrationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_noteMigrationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteMigrationObserver, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong((id *)&self->_collectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_searchResultExposureReporter, 0);
  objc_storeStrong((id *)&self->_searchSessionID, 0);
  objc_destroyWeak((id *)&self->_observableScrollView);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_destroyWeak((id *)&self->_searchController);
  objc_destroyWeak((id *)&self->_searchBar);
}

@end
