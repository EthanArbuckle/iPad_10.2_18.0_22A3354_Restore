@implementation MessageListSearchViewController

- (MessageListSearchViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  MessageListSearchViewController *v15;
  MessageListSearchViewController *v16;
  MFSearchTokenTransformer *v17;
  MFSearchTokenTransformer *searchTokenTransformer;
  void *v19;
  void *v20;
  id v21;
  EFDebouncer *v22;
  EFDebouncer *indexingStatusDebouncer;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)MessageListSearchViewController;
  v15 = -[MessageListViewController initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:](&v28, "initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:", v11, v12, v13, 0, v14, 0);
  v16 = v15;
  if (v15)
  {
    *(_BYTE *)&v15->_flags |= 8u;
    v17 = objc_alloc_init(MFSearchTokenTransformer);
    searchTokenTransformer = v16->_searchTokenTransformer;
    v16->_searchTokenTransformer = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "daemonInterface"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "senderRepository"));
    -[MessageListSearchViewController setSenderRepository:](v16, "setSenderRepository:", v20);

    -[MessageListSearchViewController _scheduleIndexStateStatistics](v16, "_scheduleIndexStateStatistics");
    -[MessageListSearchViewController setInSearchSession:](v16, "setInSearchSession:", 0);
    -[MessageListSearchViewController setDidNotifyExtendedLaunchTracker:](v16, "setDidNotifyExtendedLaunchTracker:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v21 = objc_alloc((Class)EFDebouncer);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100113308;
    v25[3] = &unk_10051DEC8;
    objc_copyWeak(&v26, &location);
    v22 = (EFDebouncer *)objc_msgSend(v21, "initWithTimeInterval:scheduler:startAfter:block:", 0, 1, v25, 5.0);
    indexingStatusDebouncer = v16->_indexingStatusDebouncer;
    v16->_indexingStatusDebouncer = v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)setSenderRepository:(id)a3
{
  objc_storeStrong((id *)&self->_senderRepository, a3);
}

- (void)setInSearchSession:(BOOL)a3
{
  self->_inSearchSession = a3;
}

- (BOOL)isSearchViewController
{
  return 1;
}

- (void)_scheduleIndexStateStatistics
{
  _QWORD *v2;
  _QWORD v3[4];
  id v4;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011B6AC;
  v3[3] = &unk_10051F5C0;
  objc_copyWeak(&v4, &location);
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register("com.apple.mobilemail.indexState", &stru_10051F598, v2);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113298;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9FB8 != -1)
    dispatch_once(&qword_1005A9FB8, block);
  return (OS_os_log *)(id)qword_1005A9FB0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NSTimer invalidate](self->_beginSearchTimer, "invalidate");
  -[MUISearchSuggestionsGenerator cancel](self->_suggestionsGenerator, "cancel");
  -[EFDebouncer cancel](self->_indexingStatusDebouncer, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchInitialLoadPromise](self, "localSearchInitialLoadPromise"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchRemotePromise](self, "localSearchRemotePromise"));
  objc_msgSend(v4, "cancel");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchInitialLoadPromise](self, "remoteSearchInitialLoadPromise"));
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
  objc_msgSend(v6, "cancel");

  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController dealloc](&v7, "dealloc");
}

- (void)loadView
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _TtC10MobileMail31SearchSuggestionsViewController *v11;
  void *v12;
  _TtC10MobileMail31SearchSuggestionsViewController *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MessageListSearchViewController;
  -[MessageListSearchViewController loadView](&v14, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v3, "BOOLForKey:", kMUILocalMailboxSearchOnlyKey))
    v4 = 2;
  else
    v4 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v4;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion emptySuggestion](CSSuggestion, "emptySuggestion"));
  -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:", v5);

  v6 = objc_alloc_init((Class)EMCoreAnalyticsCollector);
  -[MessageListSearchViewController setAnalyticsCollector:](self, "setAnalyticsCollector:", v6);

  v7 = sub_100113640(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(objc_alloc((Class)MUISearchSuggestionsGenerator), "initWithSuggesters:delegate:", v8, self);
  -[MessageListSearchViewController setSuggestionsGenerator:](self, "setSuggestionsGenerator:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v11 = [_TtC10MobileMail31SearchSuggestionsViewController alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController contactStore](self, "contactStore"));
  v13 = -[SearchSuggestionsViewController initWithMailScene:contactStore:delegate:](v11, "initWithMailScene:contactStore:delegate:", v10, v12, self);
  -[MessageListSearchViewController setSuggestionsViewController:](self, "setSuggestionsViewController:", v13);

  -[MessageListSearchViewController _updateIndexStatisticsIfNeeded](self, "_updateIndexStatisticsIfNeeded");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);
  objc_msgSend(v3, "setSelectionFollowsFocus:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  unint64_t v9;

  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (!-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible"))
    -[MessageListSearchViewController reportSearchDidBecomeActive](self, "reportSearchDidBecomeActive");
  if (_os_feature_enabled_impl("Mail", "SearchIndexing"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController indexStatus](self, "indexStatus"));

    if (v4)
    {
      v5 = -[MessageListSearchViewController _computeBGSystemTaskFeatureCheckpoint](self, "_computeBGSystemTaskFeatureCheckpoint");
      v6 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reporting Search Indexer feature checkpoint: %ld", buf, 0xCu);
      }

      +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:](BGSystemTaskCheckpoints, "reportFeatureCheckpoint:forFeature:error:", v5, 302, 0);
    }
  }
}

- (void)setIndexStatistics:(id)a3
{
  MessageListSearchViewController *v4;
  NSDictionary *v5;
  NSDictionary *indexStatistics;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (NSDictionary *)objc_msgSend(v7, "copy");
  indexStatistics = v4->_indexStatistics;
  v4->_indexStatistics = v5;

  objc_sync_exit(v4);
}

- (NSDictionary)indexStatistics
{
  MessageListSearchViewController *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_indexStatistics;
  objc_sync_exit(v2);

  return v3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  -[MessageListSearchViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "layoutMargins");
  objc_msgSend(v3, "updateLayoutMargins:");

}

- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController _configureLayoutListConfiguration:atSection:](&v18, "_configureLayoutListConfiguration:atSection:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController dataSource](self, "dataSource"));
  v8 = objc_msgSend(v7, "isSection:atIndex:", MessageListSectionIndexedSearch, a4);
  v9 = objc_msgSend(v7, "isSection:atIndex:", MessageListSectionServerSearch, a4);
  v10 = _os_feature_enabled_impl("Mail", "SearchIndexing");
  v11 = objc_msgSend(v7, "shouldDisplaySupplementaryKind:forSectionAtIndex:", UICollectionElementKindSectionHeader, a4);
  v12 = (uint64_t)objc_msgSend(v7, "shouldDisplaySupplementaryKind:forSectionAtIndex:", UICollectionElementKindSectionFooter, a4);
  objc_msgSend(v6, "setFooterMode:", 0);
  if (!v10)
    goto LABEL_8;
  if (v9)
  {
    objc_msgSend(v6, "setHeaderMode:", v11);
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    if ((_DWORD)v12)
      goto LABEL_9;
    goto LABEL_14;
  }
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController indexStatus](self, "indexStatus"));
    v14 = objc_msgSend(v13, "isVisible");

    if (v14)
      objc_msgSend(v6, "setFooterMode:", 1);
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchProgressView](self, "searchProgressView"));
    if ((objc_msgSend(v15, "isAnimating") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController indexStatus](self, "indexStatus"));
      v17 = objc_msgSend(v16, "isVisible");

      if ((v17 & 1) == 0)
      {
        v12 = 1;
        objc_msgSend(v6, "setFooterMode:", 1);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v12 = 0;
  }
LABEL_14:
  -[MessageListSearchViewController setIsSearchingFooterVisible:](self, "setIsSearchingFooterVisible:", v12);

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController conversationViewController](self, "conversationViewController", a3));
  objc_msgSend(v5, "setDelegate:", self);

  -[MessageListSearchViewController setGenerateCannedSuggestions:](self, "setGenerateCannedSuggestions:", 1);
  *(_BYTE *)&self->_flags &= ~0x10u;
  -[MessageListSearchViewController setSearching:](self, "setSearching:", 0);
  -[MessageListSearchViewController _preheatCoreSpotlightModel](self, "_preheatCoreSpotlightModel");
  -[MessageListSearchViewController _resetGlobalScopeTitles](self, "_resetGlobalScopeTitles");
  -[MessageListSearchViewController _startSearchSession](self, "_startSearchSession");
  -[MessageListSearchViewController setSnapshotViewForDismissal:](self, "setSnapshotViewForDismissal:", 0);
  -[MessageListSearchViewController setEnablePresentationAnimation:](self, "setEnablePresentationAnimation:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionForInitialSearch](self, "suggestionForInitialSearch"));

  if (v4)
    -[MessageListSearchViewController _beginSearchWithRepresentedObjectsForInitialSearch](self, "_beginSearchWithRepresentedObjectsForInitialSearch");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController userActivity](self, "userActivity"));
  objc_msgSend(v6, "becomeCurrent");

}

- (void)_preheatCoreSpotlightModel
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];
  NSFileProtectionType v5;

  v2 = objc_claimAutoreleasedReturnValue(+[MessageListViewController log](MessageListViewController, "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "In MessageListSearchViewController, call +[CSUserQuery prepare] to preheat models and resources for semantic search", v4, 2u);
  }

  v5 = NSFileProtectionComplete;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  +[CSUserQuery prepareProtectionClasses:](CSUserQuery, "prepareProtectionClasses:", v3);

}

- (void)_startSearchSession
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSession sharedSession](MSParsecSearchSession, "sharedSession"));
  -[MessageListViewController setSession:](self, "setSession:", v3);

  -[MessageListSearchViewController _updateIndexStatisticsIfNeeded](self, "_updateIndexStatisticsIfNeeded");
  -[MessageListSearchViewController reportSearchViewAppeared:currentMailboxScope:](self, "reportSearchViewAppeared:currentMailboxScope:", 1, (*(_BYTE *)&self->_flags >> 1) & 1);
  -[MessageListSearchViewController setUpAppSwitcherObserver](self, "setUpAppSwitcherObserver");
}

- (void)viewWillAppear:(BOOL)a3
{
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
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[9];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController viewWillAppear:](&v22, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v4, "registerKeyboardAvoidable:", self);

  -[MessageListSearchViewController setLastSelectedTopHitItemID:](self, "setLastSelectedTopHitItemID:", 0);
  if (-[MessageListSearchViewController enablePresentationAnimation](self, "enablePresentationAnimation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController navigationController](self, "navigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationBar"));
    objc_msgSend(v15, "frame");
    v17 = v9 + v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
    objc_msgSend(v18, "setFrame:", v7, v17, v11, v13);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController transitionCoordinator](self, "transitionCoordinator"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001141F0;
    v21[3] = &unk_10051F318;
    v21[4] = self;
    *(double *)&v21[5] = v7;
    *(double *)&v21[6] = v9;
    *(double *)&v21[7] = v11;
    *(double *)&v21[8] = v13;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100114264;
    v20[3] = &unk_10051C0B8;
    v20[4] = self;
    objc_msgSend(v19, "animateAlongsideTransition:completion:", v21, v20);

    -[MessageListSearchViewController setEnablePresentationAnimation:](self, "setEnablePresentationAnimation:", 0);
  }
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  -[MessageListSearchViewController _prepareSnapshotViewForDismissal](self, "_prepareSnapshotViewForDismissal", a3);
  -[MessageListSearchViewController setGenerateCannedSuggestions:](self, "setGenerateCannedSuggestions:", 0);
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 0);
  *(_BYTE *)&self->_flags &= ~0x10u;
  -[MessageListSearchViewController setSearching:](self, "setSearching:", 0);
  -[MessageListSearchViewController setLastSelectedTopHitItemID:](self, "setLastSelectedTopHitItemID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion emptySuggestion](CSSuggestion, "emptySuggestion"));
  -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:", v4);

  -[MessageListViewController setCurrentUserTypedPhrase:](self, "setCurrentUserTypedPhrase:", 0);
  v5 = objc_alloc((Class)MessageListDataSourceUpdateRequest);
  v11[0] = MessageListSectionIndexedSearch;
  v11[1] = MessageListSectionServerSearch;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v7 = objc_msgSend(v5, "initWithSectionUpdates:sectionsToRemove:startsWithEmptySnapshot:", 0, v6, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController dataSource](self, "dataSource"));
  objc_msgSend(v8, "applyMessageListDataSourceUpdate:", v7);

  -[MessageListSearchViewController _endSearchSession](self, "_endSearchSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController beginSearchTimer](self, "beginSearchTimer"));
  objc_msgSend(v9, "invalidate");

  -[MessageListSearchViewController setBeginSearchTimer:](self, "setBeginSearchTimer:", 0);
  -[MessageListSearchViewController setLocalSearchInitialLoadPromise:](self, "setLocalSearchInitialLoadPromise:", 0);
  -[MessageListSearchViewController setLocalSearchRemotePromise:](self, "setLocalSearchRemotePromise:", 0);
  -[MessageListSearchViewController setRemoteSearchInitialLoadPromise:](self, "setRemoteSearchInitialLoadPromise:", 0);
  -[MessageListSearchViewController setRemoteSearchServerPromise:](self, "setRemoteSearchServerPromise:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController userActivity](self, "userActivity"));
  objc_msgSend(v10, "resignCurrent");

}

- (void)_endSearchSession
{
  -[MessageListSearchViewController reportSearchEndedEvent:](self, "reportSearchEndedEvent:", 2);
  -[MessageListSearchViewController removeObservers](self, "removeObservers");
}

- (void)didDismissSearchController:(id)a3
{
  -[MessageListSearchViewController setSnapshotViewForDismissal:](self, "setSnapshotViewForDismissal:", 0);
}

- (void)setSnapshotViewForDismissal:(id)a3
{
  UIView **p_snapshotViewForDismissal;
  UIView *v5;

  p_snapshotViewForDismissal = &self->_snapshotViewForDismissal;
  v5 = (UIView *)a3;
  if (*p_snapshotViewForDismissal != v5)
  {
    -[UIView removeFromSuperview](*p_snapshotViewForDismissal, "removeFromSuperview");
    objc_storeStrong((id *)p_snapshotViewForDismissal, a3);
  }

}

- (void)_prepareSnapshotViewForDismissal
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
  id v15;
  id v16;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "snapshotViewAfterScreenUpdates:", 0));
  -[MessageListSearchViewController setSnapshotViewForDismissal:](self, "setSnapshotViewForDismissal:", v3);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
  objc_msgSend(v15, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController snapshotViewForDismissal](self, "snapshotViewForDismissal"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController snapshotViewForDismissal](self, "snapshotViewForDismissal"));
  objc_msgSend(v16, "addSubview:", v13);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[9];
  objc_super v24;

  v3 = a3;
  -[MessageListSearchViewController setInSearchSession:](self, "setInSearchSession:", 0);
  v24.receiver = self;
  v24.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController viewWillDisappear:](&v24, "viewWillDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v5, "unregisterKeyboardAvoidable:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v6, "resignFirstResponder");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController snapshotViewForDismissal](self, "snapshotViewForDismissal"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController navigationController](self, "navigationController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationBar"));
    objc_msgSend(v18, "frame");
    v20 = v12 + v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController transitionCoordinator](self, "transitionCoordinator"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001148AC;
    v23[3] = &unk_10051F318;
    v23[4] = self;
    v23[5] = v10;
    *(double *)&v23[6] = v20;
    v23[7] = v14;
    v23[8] = v16;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100114920;
    v22[3] = &unk_10051F318;
    v22[4] = self;
    v22[5] = v10;
    *(double *)&v22[6] = v12;
    v22[7] = v14;
    v22[8] = v16;
    objc_msgSend(v21, "animateAlongsideTransition:completion:", v23, v22);

  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  -[MessageListSearchViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:", v4);
  if (!v4)
    -[MessageListSearchViewController _generateSuggestionsForPhrase:](self, "_generateSuggestionsForPhrase:", 0);

}

- (id)splitViewController
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MessageListSearchViewController;
  v3 = -[MessageListSearchViewController splitViewController](&v9, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController presentingViewController](self, "presentingViewController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));

  }
  return v6;
}

- (id)navigationController
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MessageListSearchViewController;
  v3 = -[MessageListSearchViewController navigationController](&v9, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController presentingViewController](self, "presentingViewController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));

  }
  return v6;
}

- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController presentingViewController](self, "presentingViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetViewControllerForAction:sender:", a3, v6));
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MessageListSearchViewController;
    v11 = -[MessageListSearchViewController targetViewControllerForAction:sender:](&v14, "targetViewControllerForAction:sender:", a3, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  v12 = v10;

  return v12;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v6, "setToolbarItems:animated:", v7, v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "toolbarItems"));

  return v3;
}

- (id)searchBar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController parentViewController](self, "parentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));

  return v3;
}

- (id)_currentEditingStringForSearchBar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController inputLanguages](self, "inputLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:", v6));

  return v7;
}

- (unint64_t)_countOfSuggestionAtomsInSearchbar:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "representedSuggestionTokens"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (void)_resetGlobalScopeTitles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v4 = v3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(v3, "setScopeButtonTitles:", 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ALL_MAILBOXES"), &stru_100531B00, CFSTR("Main")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CURRENT_MAILBOX"), &stru_100531B00, CFSTR("Main")));
    v10[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v4, "setScopeButtonTitles:", v9);

    objc_msgSend(v4, "setSelectedScopeButtonIndex:", ((unint64_t)*(_BYTE *)&self->_flags >> 1) & 1);
  }

}

- (void)globalSearchScopeChanged:(int64_t)a3
{
  void *v4;

  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | (2 * (a3 == 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", (*(_BYTE *)&self->_flags >> 1) & 1, kMUILocalMailboxSearchOnlyKey);

  -[MessageListSearchViewController _reportSearchQueryStateForScopeChange](self, "_reportSearchQueryStateForScopeChange");
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 2);
}

- (void)searchTokenScopeChanged:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _objectFromSelectionInSearchTextField:](self, "_objectFromSelectionInSearchTextField:", v6));

  v8 = objc_opt_class(MUISuggestionToken);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v9, "setSelectedScopeIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "csToken"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion updatedSuggestionWithCurrentSuggestion:token:scopeSelection:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:token:scopeSelection:", v10, v11, a3));

    -[MessageListSearchViewController redrawSearchBarWithSuggestion:](self, "redrawSearchBarWithSuggestion:", v12);
    v13 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userQueryString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "suggestionTokens"));
      v17 = 138412802;
      v18 = v12;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Suggestion was updated. Reason: Scope changed. Suggestion: %@ UserQueryString: %@ SuggestionTokens: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  -[MessageListSearchViewController _reportSearchQueryStateForScopeChange](self, "_reportSearchQueryStateForScopeChange");
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 2);

}

- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion mui_suggestionForSpotlightQueryWithString:](CSSuggestion, "mui_suggestionForSpotlightQueryWithString:", a3));
  -[MessageListSearchViewController beginSearchWithSuggestion:scope:](self, "beginSearchWithSuggestion:scope:", v6, v7);

}

- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "beginSearchWithSuggestion suggestion=%@, scope=%@", (uint8_t *)&v12, 0x16u);
  }

  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF3 | 4;
  -[MessageListSearchViewController setSuggestionForInitialSearch:](self, "setSuggestionForInitialSearch:", v6);
  v9 = +[MFSearchScope indexFromScopeKey:](MFSearchScope, "indexFromScopeKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v10, "setSelectedScopeButtonIndex:", v9);

  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | (2 * (v9 == 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchController](self, "searchController"));
  LODWORD(v10) = objc_msgSend(v11, "isActive");

  if ((_DWORD)v10)
    -[MessageListSearchViewController _beginSearchWithRepresentedObjectsForInitialSearch](self, "_beginSearchWithRepresentedObjectsForInitialSearch");

}

- (void)_beginSearchWithRepresentedObjectsForInitialSearch
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100115600;
  block[3] = &unk_10051AA98;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionForInitialSearch](self, "suggestionForInitialSearch"));
  if (v4)
  {
    -[MessageListSearchViewController redrawSearchBarWithSuggestion:](self, "redrawSearchBarWithSuggestion:", v4);
    -[MessageListSearchViewController _addSuggestionToRecentSuggester:](self, "_addSuggestionToRecentSuggester:", v4);
  }
  -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", 0);
  *(_BYTE *)&self->_flags |= 8u;
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 1);
  -[MessageListSearchViewController setSuggestionForInitialSearch:](self, "setSuggestionForInitialSearch:", 0);

}

- (id)_objectFromSelectionInSearchTextField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedTextRange"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tokensInRange:", v4));
    if (objc_msgSend(v5, "count") == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedObject"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_scopeTitlesForSearchAtom:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "suggestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scopes"));

  if ((unint64_t)objc_msgSend(v5, "count") < 2)
    v6 = &__NSArray0__struct;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_map:", &stru_10051F358));

  return v6;
}

- (void)_addSuggestionToRecentSuggester:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController recentSuggester](self, "recentSuggester"));
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchAtomSuggestion suggestionFromSpotlightSuggestion:shouldShowAvaters:](MUISearchAtomSuggestion, "suggestionFromSpotlightSuggestion:shouldShowAvaters:", v5, 0));
  objc_msgSend(v4, "addSuggestion:", v6);

}

- (id)_allExcludedMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  _QWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox predicateForMailboxType:](EMMailbox, "predicateForMailboxType:", 1));
  v21[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailbox predicateForMailboxType:](EMMailbox, "predicateForMailboxType:", 3));
  v21[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v8 = objc_msgSend(objc_alloc((Class)EMQuery), "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(EMMailbox), v6, &__NSArray0__struct);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxRepository](self, "mailboxRepository"));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100115AD4;
  v19 = &unk_10051E288;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v9, "performQuery:completionHandler:", v8, &v16);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "future", v16, v17, v18, v19));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "result:", 0));

  if (v12)
    v13 = v12;
  else
    v13 = &__NSArray0__struct;
  v14 = v13;

  return v14;
}

- (id)_excludedMailboxes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _allExcludedMailboxes](self, "_allExcludedMailboxes"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100115BB0;
  v8[3] = &unk_10051B028;
  v5 = v3;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_filter:", v8));

  return v6;
}

- (void)_getDefaultPersonScopeIdentifier:(id *)a3 alternativeScopeIdentifier:(id *)a4
{
  void *v6;
  unsigned int v7;
  id v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
  v7 = objc_msgSend(v6, "ef_any:", &stru_10051F378);

  if (v7)
  {
    v8 = objc_retainAutorelease(MFSearchSuggestionPeopleCategoryToScope);
    v9 = 0;
    *a3 = v8;
  }
  else
  {
    *a3 = objc_retainAutorelease(MFSearchSuggestionPeopleCategoryFromScope);
    v9 = objc_retainAutorelease(MFSearchSuggestionPeopleCategoryToScope);
  }
  *a4 = v9;
}

- (id)_scopeIdentifierForPeopleSuggestions
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  -[MessageListSearchViewController _getDefaultPersonScopeIdentifier:alternativeScopeIdentifier:](self, "_getDefaultPersonScopeIdentifier:alternativeScopeIdentifier:", &v7, &v6);
  v2 = v7;
  v3 = v6;
  v4 = v2;

  return v4;
}

- (id)_phraseManagerForPhrase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v4 = a3;
  if (-[MessageListSearchViewController _shouldSearchCurrentMailboxOnly](self, "_shouldSearchCurrentMailboxOnly")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchMailboxSuggestion suggestionForMailboxes:](SearchMailboxSuggestion, "suggestionForMailboxes:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "category"));
    v10 = objc_msgSend(v9, "indexOfScopeWithIdentifier:", MFSearchSuggestionMailboxCategoryScope);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchScopedSuggestion scopedSuggestion:selectedScopeIndex:](MUISearchScopedSuggestion, "scopedSuggestion:selectedScopeIndex:", v8, v10));
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _excludedMailboxes](self, "_excludedMailboxes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController inputLanguages](self, "inputLanguages"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController session](self, "session"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MFSearchSuggestionPhraseManager phraseManagerWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:filterQuery:implicitSuggestions:excludedMailboxes:inputLanguages:feedbackQueryID:](MFSearchSuggestionPhraseManager, "phraseManagerWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:filterQuery:implicitSuggestions:excludedMailboxes:inputLanguages:feedbackQueryID:", v4, 0, v13, v14, 0, v12, v15, v16, objc_msgSend(v17, "feedbackQueryID")));

  return v18;
}

- (void)_generateSuggestionsForPhrase:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsGenerator](self, "suggestionsGenerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsIdentifier](self, "suggestionsIdentifier"));
  objc_msgSend(v4, "stopGeneratingSuggestionsWithIdentifier:", v5);

  -[MessageListSearchViewController setSuggestionsIdentifier:](self, "setSuggestionsIdentifier:", 0);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    *(_BYTE *)&self->_flags &= ~4u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _phraseManagerForPhrase:](self, "_phraseManagerForPhrase:", v12));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastPhrase](self, "lastPhrase"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
  if (objc_msgSend(v12, "length"))
  {
    if (!v7
      || objc_msgSend(v12, "localizedStandardRangeOfString:", v7)
      && objc_msgSend(v7, "localizedStandardRangeOfString:", v12))
    {
      objc_msgSend(v8, "clearSuggestions");
      v9 = v12;
    }
    else
    {
      objc_msgSend(v8, "beginUpdatingSuggestions");
      v9 = v12;
    }
  }
  else
  {
    objc_msgSend(v8, "clearSuggestions");
    v9 = 0;
  }
  -[MessageListSearchViewController setLastPhrase:](self, "setLastPhrase:", v9);
  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsGenerator](self, "suggestionsGenerator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startGeneratingSuggestionsUsingPhraseManager:", v6));
    -[MessageListSearchViewController setSuggestionsIdentifier:](self, "setSuggestionsIdentifier:", v11);

  }
}

- (void)setGenerateCannedSuggestions:(BOOL)a3
{
  if (self->_generateCannedSuggestions != a3)
  {
    self->_generateCannedSuggestions = a3;
    if (a3 && (*(_BYTE *)&self->_flags & 8) != 0)
    {
      -[MessageListSearchViewController _generateSuggestionsForPhrase:](self, "_generateSuggestionsForPhrase:", 0);
      -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", 1);
    }
  }
}

- (void)waitForLocalAndRemoteSearchCompletion:(id)a3
{
  id v4;
  NSObject *v5;
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
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[8];
  _QWORD v29[4];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for local and remote search to complete", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchInitialLoadPromise](self, "localSearchInitialLoadPromise"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "future"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchRemotePromise](self, "localSearchRemotePromise"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchInitialLoadPromise](self, "remoteSearchInitialLoadPromise"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "future"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future"));

  if (v7 && v9 && v11 && v13)
  {
    v29[0] = v7;
    v29[1] = v9;
    v29[2] = v11;
    v29[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture combine:](EFFuture, "combine:", v14));

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10011657C;
    v21 = &unk_10051F3A0;
    objc_copyWeak(&v27, (id *)buf);
    v22 = v7;
    v23 = v9;
    v24 = v11;
    v25 = v13;
    v26 = v4;
    objc_msgSend(v15, "onScheduler:addSuccessBlock:", v16, &v18);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", v18, v19, v20, v21));
    objc_msgSend(v15, "onScheduler:addFailureBlock:", v17, &stru_10051F3C0);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
}

- (BOOL)isSearchSuggestionsVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable parentViewController](self->_suggestionsViewController, "parentViewController"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasSuggestions
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
  v3 = objc_msgSend(v2, "hasSuggestions");

  return v3;
}

- (void)setSearchSuggestionsVisible:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v3 = a3;
  v5 = -[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible");
  if (v3 || !v5)
  {
    v9 = !v3;
    if (!(v9 | v5))
    {
      if (self->_suggestionsViewController)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
        objc_msgSend(v10, "setScrollsToTop:", 0);

        -[MessageListSearchViewController addChildViewController:](self, "addChildViewController:", self->_suggestionsViewController);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable observableScrollView](self->_suggestionsViewController, "observableScrollView"));
        -[MessageListSearchViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v11, 5);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable view](self->_suggestionsViewController, "view"));
        objc_msgSend(v12, "setAutoresizingMask:", 18);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
        objc_msgSend(v13, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable view](self->_suggestionsViewController, "view"));
        objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable view](self->_suggestionsViewController, "view"));
        objc_msgSend(v23, "addSubview:", v24);

        -[MFSearchSuggestionsViewControllable didMoveToParentViewController:](self->_suggestionsViewController, "didMoveToParentViewController:", self);
        -[MessageListViewController updateBarButtons](self, "updateBarButtons");
      }
      else
      {
        v25 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_100393308(v25, v26, v27, v28, v29, v30, v31, v32);

      }
      v9 = 0;
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "setScrollsToTop:", 1);

    -[MFSearchSuggestionsViewControllable willMoveToParentViewController:](self->_suggestionsViewController, "willMoveToParentViewController:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewControllable viewIfLoaded](self->_suggestionsViewController, "viewIfLoaded"));
    objc_msgSend(v7, "removeFromSuperview");

    -[MFSearchSuggestionsViewControllable removeFromParentViewController](self->_suggestionsViewController, "removeFromParentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
    -[MessageListSearchViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v8, 5);

    -[MessageListViewController updateBarButtons](self, "updateBarButtons");
    -[MessageListSearchViewController setLastSelectedTopHitItemID:](self, "setLastSelectedTopHitItemID:", 0);
    v9 = !v3;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v33, "setShowsProgress:", v9);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  _BOOL4 v16;
  unsigned int v17;
  unsigned __int8 v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;

  v21 = a3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _currentEditingStringForSearchBar:](self, "_currentEditingStringForSearchBar:"));
  v5 = objc_msgSend(v4, "length");
  v6 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController currentUserTypedPhrase](self, "currentUserTypedPhrase"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[EMCSLoggingAdditions publicDescriptionForSuggestion:](EMCSLoggingAdditions, "publicDescriptionForSuggestion:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionTokens"));
    *(_DWORD *)buf = 138412802;
    v24 = v8;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Searching with userString: %@ suggestion: %@ suggestionTokens: %@", buf, 0x20u);

  }
  if (v5
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion")),
        v14 = objc_msgSend(v13, "mui_isEmpty"),
        v13,
        !v14))
  {
    v16 = 0;
  }
  else if (-[MessageListSearchViewController inSearchSession](self, "inSearchSession"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastPhrase](self, "lastPhrase"));
    v16 = v15 != 0;

  }
  else
  {
    v16 = 1;
  }
  if (!-[MessageListSearchViewController inSearchSession](self, "inSearchSession"))
    -[MessageListSearchViewController setInSearchSession:](self, "setInSearchSession:", 1);
  if (v5)
    v17 = objc_msgSend(v4, "isEqualToString:", self->_lastPhrase) ^ 1;
  else
    v17 = 0;
  if ((v16 | v17) == 1)
  {
    v18 = -[MessageListSearchViewController generateCannedSuggestions](self, "generateCannedSuggestions");
    if (v5)
      v19 = 1;
    else
      v19 = v18;
    if ((v19 & 1) == 0)
    {
      *(_BYTE *)&self->_flags |= 4u;
      -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", 0);
    }
    -[MessageListSearchViewController _generateSuggestionsForPhrase:](self, "_generateSuggestionsForPhrase:", v4);
  }
  if (-[MessageListSearchViewController _shouldUpdateSearchForOptions:](self, "_shouldUpdateSearchForOptions:", 2))
  {
    v20 = -[MessageListSearchViewController _countOfSuggestionAtomsInSearchbar:](self, "_countOfSuggestionAtomsInSearchbar:", v22);
    if (v20)
    {
      if ((void *)-[MessageListSearchViewController countOfAtomsInLastSearch](self, "countOfAtomsInLastSearch") != v20)
        -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 2);
    }
  }

}

- (BOOL)_shouldUpdateSearchForOptions:(int64_t)a3
{
  if (-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible"))
    return 0;
  if (a3 == 2)
    return (*(_BYTE *)&self->_flags & 0x10) != 0;
  return 0;
}

- (void)_notePredicateUpdated:(int64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  int64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  -[MessageListSearchViewController _updateIndexStatisticsIfNeeded](self, "_updateIndexStatisticsIfNeeded");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  *(_BYTE *)&self->_flags &= ~1u;
  v5 = -[MessageListSearchViewController _shouldUpdateSearchForOptions:](self, "_shouldUpdateSearchForOptions:", a3);
  v6 = v5;
  v7 = a3 == 1 || v5;
  -[MessageListSearchViewController setSearching:](self, "setSearching:", 0);
  if (-[MessageListSearchViewController _shouldSearchCurrentMailboxOnly](self, "_shouldSearchCurrentMailboxOnly"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchPredicateForMailboxes:](self, "searchPredicateForMailboxes:", v8));
  v10 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromBOOL(v6);
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromBOOL(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = NSStringFromBOOL(v9 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 134218754;
    v29 = a3;
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v14;
    v34 = 2114;
    v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "notePredicateUpdated options:%lu shouldUpdateSearch:%{public}@ shouldStartSearch:%{public}@ hasCriterion:%{public}@", buf, 0x2Au);

  }
  if (v9)
    v17 = v7;
  else
    v17 = 0;
  if (v17 == 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchInitialLoadPromise](self, "localSearchInitialLoadPromise"));
    objc_msgSend(v18, "cancel");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchRemotePromise](self, "localSearchRemotePromise"));
    objc_msgSend(v19, "cancel");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchInitialLoadPromise](self, "remoteSearchInitialLoadPromise"));
    objc_msgSend(v20, "cancel");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
    objc_msgSend(v21, "cancel");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    -[MessageListSearchViewController setLocalSearchInitialLoadPromise:](self, "setLocalSearchInitialLoadPromise:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    -[MessageListSearchViewController setLocalSearchRemotePromise:](self, "setLocalSearchRemotePromise:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    -[MessageListSearchViewController setRemoteSearchInitialLoadPromise:](self, "setRemoteSearchInitialLoadPromise:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    -[MessageListSearchViewController setRemoteSearchServerPromise:](self, "setRemoteSearchServerPromise:", v25);

    v26 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (int64_t)self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "noteCriterionUpdated startingSearch: %@", buf, 0xCu);
    }

    -[MessageListSearchViewController reloadDataSourceWithSearchPredicate:](self, "reloadDataSourceWithSearchPredicate:", v9);
    -[MessageListSearchViewController setSearching:](self, "setSearching:", 1);
    *(_BYTE *)&self->_flags |= 0x10u;
    -[MessageListSearchViewController setSearchStartAbsoluteTime:](self, "setSearchStartAbsoluteTime:", mach_absolute_time());
    -[MessageListSearchViewController setCountOfAtomsInLastSearch:](self, "setCountOfAtomsInLastSearch:", -[MessageListSearchViewController _countOfSuggestionAtomsInSearchbar:](self, "_countOfSuggestionAtomsInSearchbar:", v27));
    -[MessageListSearchViewController _initializeSearchUserActivity](self, "_initializeSearchUserActivity");
  }
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    -[MessageListSearchViewController _resetGlobalScopeTitles](self, "_resetGlobalScopeTitles");

}

- (void)_initializeSearchUserActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController accountRepository](self, "accountRepository"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountForIdentifier:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchActivityPayloadDictionary](self, "searchActivityPayloadDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController continuityMailboxActivityPayloadFromMailboxes:account:currentActivityPayload:](self, "continuityMailboxActivityPayloadFromMailboxes:account:currentActivityPayload:", v11, v6, v7));

  -[MessageListSearchViewController setSearchActivityPayloadDictionary:](self, "setSearchActivityPayloadDictionary:", 0);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v8);
    -[MessageListSearchViewController setSearchActivityPayloadDictionary:](self, "setSearchActivityPayloadDictionary:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchActivityPayloadDictionary](self, "searchActivityPayloadDictionary"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MSMailActivityHandoffTypeSearch, MSMailActivityHandoffTypeKey);

  }
}

- (void)reloadDataSource
{
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 2);
}

- (void)updateUserActivityState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchActivityPayloadDictionary](self, "searchActivityPayloadDictionary"));
  objc_msgSend(v5, "setUserInfo:", v4);

}

- (id)_localMailboxPredicate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController mailboxes](self, "mailboxes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForMessagesInMailboxes:", v2));

  return v3;
}

- (BOOL)_shouldSearchCurrentMailboxOnly
{
  return (*(_BYTE *)&self->_flags & 3) == 2;
}

- (MFSearchProgressView)searchProgressView
{
  MFSearchProgressView *searchProgressView;
  MFSearchProgressView *v4;
  MFSearchProgressView *v5;

  searchProgressView = self->_searchProgressView;
  if (!searchProgressView)
  {
    v4 = (MFSearchProgressView *)objc_alloc_init((Class)MFSearchProgressView);
    v5 = self->_searchProgressView;
    self->_searchProgressView = v4;

    -[MFSearchProgressView setAutoresizingMask:](self->_searchProgressView, "setAutoresizingMask:", 2);
    searchProgressView = self->_searchProgressView;
  }
  return searchProgressView;
}

- (void)setSearching:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  if (self->_searching != a3)
  {
    v3 = a3;
    v5 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("No");
      if (v3)
        v6 = CFSTR("Yes");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating searching to %@", (uint8_t *)&v7, 0xCu);
    }

    self->_searching = v3;
    -[MessageListSearchViewController _updateFooter](self, "_updateFooter");
  }
}

- (void)_updateFooter
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t v21[16];
  _BYTE buf[24];

  v3 = -[MessageListSearchViewController isSearching](self, "isSearching");
  if (v3 != -[MessageListSearchViewController isSearchingFooterVisible](self, "isSearchingFooterVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchProgressViewDisplayCancellable](self, "searchProgressViewDisplayCancellable"));
    objc_msgSend(v4, "cancel");

    v5 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("remove");
      if (v3)
        v6 = CFSTR("add");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating footer to %@ the searching label.", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchProgressView](self, "searchProgressView"));
    v8 = v7;
    if (v3)
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      if ((objc_msgSend(v8, "isAnimating") & 1) != 0)
      {
        v9 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Searching label currently exists and is animated, nothing to do here.", v21, 2u);
        }

      }
      else
      {
        v10 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Queuing animation of 'searching...' label", v21, 2u);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
        v15 = _NSConcreteStackBlock;
        v16 = 3221225472;
        v17 = sub_100117A48;
        v18 = &unk_10051B9A0;
        objc_copyWeak(&v20, (id *)buf);
        v19 = v8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "afterDelay:performBlock:", &v15, 1.0));
        -[MessageListSearchViewController setSearchProgressViewDisplayCancellable:](self, "setSearchProgressViewDisplayCancellable:", v12, v15, v16, v17, v18);

        objc_destroyWeak(&v20);
      }
      objc_destroyWeak((id *)buf);

    }
    else
    {
      objc_msgSend(v7, "setAnimating:fade:", 0, 0);

      -[MessageListSearchViewController setSearchProgressViewDisplayCancellable:](self, "setSearchProgressViewDisplayCancellable:", 0);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionViewLayout"));
    objc_msgSend(v14, "invalidateLayout");

  }
}

- (void)_updateSearchingCompletionState
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
  BOOL v15;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchInitialLoadPromise](self, "localSearchInitialLoadPromise"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "future"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultIfAvailable"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchRemotePromise](self, "localSearchRemotePromise"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "future"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resultIfAvailable"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "future"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultIfAvailable"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resultIfAvailable"));

  if (v5)
    v15 = v8 == 0;
  else
    v15 = 1;
  v17 = v15 || v14 == 0 || v11 == 0;
  v18 = !v17;
  if (!v17)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100117D4C;
    v21[3] = &unk_10051AA98;
    v21[4] = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v19, "performBlock:", v21);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastSelectedTopHitItemID](self, "lastSelectedTopHitItemID"));

  if (!v20)
    -[MessageListSearchViewController reportMessageListResultsFetchedIsFinished:](self, "reportMessageListResultsFetchedIsFinished:", v18);

}

- (void)messageListSectionDataSource:(id)a3 collectionFinishedSearching:(id)a4 remote:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  MessageListSearchViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _QWORD v23[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "section"));
  v11 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134218754;
    v19 = self;
    v20 = 2114;
    v21 = v10;
    v22 = 1024;
    LODWORD(v23[0]) = v5;
    WORD2(v23[0]) = 2114;
    *(_QWORD *)((char *)v23 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p: Did finish search with section %{public}@ remote=%{BOOL}d collection %{public}@ ", (uint8_t *)&v18, 0x26u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageListForSection:", v10));
  v14 = objc_msgSend(v13, "isEqual:", v9);

  if ((v14 & 1) != 0)
  {
    if (objc_msgSend(v10, "isEqual:", MessageListSectionIndexedSearch))
    {
      if (v5)
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchRemotePromise](self, "localSearchRemotePromise"));
      else
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController localSearchInitialLoadPromise](self, "localSearchInitialLoadPromise"));
    }
    else
    {
      if (!objc_msgSend(v10, "isEqual:", MessageListSectionServerSearch))
        goto LABEL_16;
      if (v5)
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchServerPromise](self, "remoteSearchServerPromise"));
      else
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController remoteSearchInitialLoadPromise](self, "remoteSearchInitialLoadPromise"));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v15, "finishWithResult:", v16);

LABEL_16:
    -[MessageListSearchViewController _updateSearchingCompletionState](self, "_updateSearchingCompletionState");
    goto LABEL_17;
  }
  v17 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = 134218498;
    v19 = self;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23[0] = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p: Attempting to update section %{public}@ with outdated collection %{public}@", (uint8_t *)&v18, 0x20u);
  }

LABEL_17:
}

- (void)searchSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  *(_BYTE *)&self->_flags |= 4u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController recentSuggester](self, "recentSuggester"));
  objc_msgSend(v5, "addSuggestion:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "spotlightSuggestion"));
  -[MessageListSearchViewController redrawSearchBarWithSuggestion:](self, "redrawSearchBarWithSuggestion:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _parsecSuggestionForSuggestion:](self, "_parsecSuggestionForSuggestion:", v8));
  -[MessageListSearchViewController reportSuggestionSelected:](self, "reportSuggestionSelected:", v7);
  -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", 0);
  -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 1);
  -[MessageListSearchViewController reportSearchQueryStateWithTriggerEvent:searchType:](self, "reportSearchQueryStateWithTriggerEvent:searchType:", 8, 3);

}

- (void)searchSuggestionsViewController:(id)a3 deleteRecentSuggestion:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController recentSuggester](self, "recentSuggester"));
  objc_msgSend(v5, "deleteSuggestion:", v6);

}

- (id)_parsecSuggestionForSuggestion:(id)a3
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
  id v16;
  void *v17;
  id v18;
  id v19;
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
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *i;
  unsigned int v41;
  uint64_t v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory topHitsCategory](MUISearchSuggestionCategory, "topHitsCategory"));

  if (v5 == v6)
  {
    v19 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForTopHitItemID:](self, "_identifierForTopHitItemID:", v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mailRankingSignals"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "message"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "date"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mailRankingSignals"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionTopHit topHitWithIdentifier:date:mailRankingSignals:](MSParsecSearchSessionTopHit, "topHitWithIdentifier:date:mailRankingSignals:", v21, v24, v25));

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "message"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "date"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionTopHit resultWithIdentifier:date:](MSParsecSearchSessionTopHit, "resultWithIdentifier:date:", v21, v24));
    }
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory instantAnswersCategory](MUISearchSuggestionCategory, "instantAnswersCategory"));

  if (v7 == v8)
  {
    v19 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForInstantAnswerItemID:](self, "_identifierForInstantAnswerItemID:", v27));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instantAnswer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "flightInfoIsLive"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "message"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "date"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "feedbackInlineCard"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:](MSParsecSearchSessionInstantAnswer, "instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:", v21, v24, v30, v29 != 0));

LABEL_11:
    goto LABEL_26;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory documentCategory](MUISearchSuggestionCategory, "documentCategory"));
  v11 = v9;
  if (v9 == v10)
  {
LABEL_13:

    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory locationCategory](MUISearchSuggestionCategory, "locationCategory"));
  if (v12 == v13)
  {

    v11 = v10;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory linkCategory](MUISearchSuggestionCategory, "linkCategory"));

  if (v14 == v15)
  {
LABEL_14:
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));
    v18 = 0;
    goto LABEL_15;
  }
  v16 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "atomTitle"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p"), v17, v16));

  v18 = objc_msgSend(v16, "option");
LABEL_15:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy fullyRedactedStringForString:](EFPrivacy, "fullyRedactedStringForString:", v44));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController categoryForSuggestion:](self, "categoryForSuggestion:", v4));
  v33 = objc_alloc_init((Class)SFMailResultDetails);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "spotlightSuggestion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "score"));
  objc_msgSend(v33, "setSuggestionScore:", v35);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "spotlightSuggestion"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "suggestionDataSources"));

  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(v37);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "integerValue") - 1;
        if (v41 >= 4)
          v42 = 0;
        else
          v42 = dword_1004C9720[v41];
        objc_msgSend(v33, "setDataSources:", v42);
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v38);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionSuggestion suggestionWithIdentifier:category:option:resultDetails:](MSParsecSearchSessionSuggestion, "suggestionWithIdentifier:category:option:resultDetails:", v31, v32, v18, v33));
LABEL_26:

  return v26;
}

- (void)redrawSearchBarWithSuggestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userQueryString"));
  -[MessageListViewController setCurrentUserTypedPhrase:](self, "setCurrentUserTypedPhrase:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTokens"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_map:", &stru_10051F400));

  -[MessageListSearchViewController setLastPhrase:](self, "setLastPhrase:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  objc_msgSend(v7, "replaceSearchBarWithTokens:userQueryString:", v6, v4);

}

- (BOOL)canGenerateTopHitsForSearchSuggestionsViewController:(id)a3
{
  return 1;
}

- (void)_updateSearchBarUsingSuggestionToken:(id)a3
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
  uint64_t v16;
  char isKindOfClass;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userQueryString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion emptySuggestion](CSSuggestion, "emptySuggestion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "csToken"));
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion updatedSuggestionWithCurrentSuggestion:userString:tokens:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v9, v8, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion mui_mergeCurrentSuggestion:suggestion:](CSSuggestion, "mui_mergeCurrentSuggestion:suggestion:", v13, v12));

  -[MessageListSearchViewController redrawSearchBarWithSuggestion:](self, "redrawSearchBarWithSuggestion:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userQueryString"));
  v16 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);
  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userQueryString"));
    v18 = objc_msgSend(v11, "length") != 0;
  }
  else
  {
    v18 = 0;
  }
  -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", v18);
  if ((isKindOfClass & 1) != 0)

  if (-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "userQueryString"));
    -[MessageListSearchViewController _generateSuggestionsForPhrase:](self, "_generateSuggestionsForPhrase:", v20);

  }
  else
  {
    -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 2);
  }

}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6 topHitSuggestion:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  void *v22;
  unsigned int v23;
  int v24;
  MessageListSearchViewController *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v10 = a4;
  v11 = a5;
  v12 = a7;
  -[MessageListSearchViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v11, MessageListSectionIndexedSearch);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForTopHitItemID:](self, "_identifierForTopHitItemID:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailRankingSignals"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailRankingSignals"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionTopHit topHitWithIdentifier:date:mailRankingSignals:](MSParsecSearchSessionTopHit, "topHitWithIdentifier:date:mailRankingSignals:", v13, v16, v17));

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForTopHitItemID:](self, "_identifierForTopHitItemID:", v10));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionTopHit resultWithIdentifier:](MSParsecSearchSessionTopHit, "resultWithIdentifier:", v15));
  }

  -[MessageListSearchViewController reportTopHitSelected:](self, "reportTopHitSelected:", v18);
  v19 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134218498;
    v25 = self;
    v26 = 2114;
    v27 = v10;
    v28 = 2048;
    v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "searchSuggestionsController: %p, didSelectItemID: %{public}@, messageList: %p", (uint8_t *)&v24, 0x20u);
  }

  v20 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastSelectedTopHitItemID](self, "lastSelectedTopHitItemID"));
  v21 = v20 == v10;

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v23 = objc_msgSend(v22, "isInExpandedEnvironment");

    -[MessageListViewController didSelectTopHitWithItemID:messageList:animated:](self, "didSelectTopHitWithItemID:messageList:animated:", v10, v11, v23 ^ 1);
    -[MessageListSearchViewController setLastSelectedTopHitItemID:](self, "setLastSelectedTopHitItemID:", v10);
  }

}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  void *v15;
  unsigned int v16;
  int v17;
  MessageListSearchViewController *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v8 = a4;
  v9 = a5;
  -[MessageListSearchViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v9, MessageListSectionIndexedSearch);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForTopHitItemID:](self, "_identifierForTopHitItemID:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionTopHit resultWithIdentifier:](MSParsecSearchSessionTopHit, "resultWithIdentifier:", v10));

  -[MessageListSearchViewController reportTopHitSelected:](self, "reportTopHitSelected:", v11);
  v12 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218498;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "searchSuggestionsController: %p, didSelectItemID: %{public}@, messageList: %p", (uint8_t *)&v17, 0x20u);
  }

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastSelectedTopHitItemID](self, "lastSelectedTopHitItemID"));
  v14 = v13 == v8;

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
    v16 = objc_msgSend(v15, "isInExpandedEnvironment");

    -[MessageListViewController didSelectTopHitWithItemID:messageList:animated:](self, "didSelectTopHitWithItemID:messageList:animated:", v8, v9, v16 ^ 1);
    -[MessageListSearchViewController setLastSelectedTopHitItemID:](self, "setLastSelectedTopHitItemID:", v8);
  }

}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 instantAnswerSuggestion:(id)a5 cardSectionID:(id)a6 command:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a5;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForInstantAnswerItemID:](self, "_identifierForInstantAnswerItemID:", a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "instantAnswer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flightInfoIsLive"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "message"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "feedbackInlineCard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:](MSParsecSearchSessionInstantAnswer, "instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:", v13, v17, v18, v15 != 0));

  -[MessageListSearchViewController reportInstantAnswerButtonSelected:cardSectionID:command:](self, "reportInstantAnswerButtonSelected:cardSectionID:command:", v19, v11, v12);
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 instantAnswerSuggestion:(id)a6 cardSectionID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  -[MessageListSearchViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v11, MessageListSectionIndexedSearch);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _identifierForInstantAnswerItemID:](self, "_identifierForInstantAnswerItemID:", v23));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instantAnswer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flightInfoIsLive"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "message"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "feedbackInlineCard"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:](MSParsecSearchSessionInstantAnswer, "instantAnswerWithIdentifier:date:inlineCard:isInstantAnswerUpdated:", v14, v18, v19, v16 != 0));

  -[MessageListSearchViewController reportInstantAnswerCardSelected:cardSectionID:](self, "reportInstantAnswerCardSelected:cardSectionID:", v20, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v22 = objc_msgSend(v21, "isInExpandedEnvironment") ^ 1;

  -[MessageListViewController didSelectTopHitWithItemID:messageList:animated:](self, "didSelectTopHitWithItemID:messageList:animated:", v23, v11, v22);
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[MessageListSearchViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v7, MessageListSectionIndexedSearch);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v9 = objc_msgSend(v8, "isInExpandedEnvironment") ^ 1;

  -[MessageListViewController didSelectTopHitWithItemID:messageList:animated:](self, "didSelectTopHitWithItemID:messageList:animated:", v10, v7, v9);
}

- (id)_identifierForTopHitItemID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tophit:%@"), a3));
}

- (id)_identifierForInstantAnswerItemID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("instantAnswer:%@"), a3));
}

- (void)reportSuggestionsFetched:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  MessageListSearchViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001196D8;
  v5[3] = &unk_10051F450;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v5);

}

- (void)reportSuggestionsVisible:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  MessageListSearchViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001199D0;
  v5[3] = &unk_10051F450;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v5);

}

- (void)suggestionsGenerator:(id)a3 didProduceResult:(id)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsIdentifier](self, "suggestionsIdentifier"));
  v7 = objc_msgSend(v5, "isEqualToID:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "suggestions"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
      -[MessageListSearchViewController setSuggestersGeneratedSuggestions:](self, "setSuggestersGeneratedSuggestions:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
    objc_msgSend(v10, "updateSuggestionsWithResult:", v16);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
    v12 = objc_msgSend(v11, "hasSuggestions");

    if (v12)
    {
      -[MessageListViewController supressNoContentViewAnimated:](self, "supressNoContentViewAnimated:", 0);
      if (objc_msgSend(v16, "phraseKind") == 1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
        v14 = objc_opt_respondsToSelector(v13, "scrollToHideIndexStatus");

        if ((v14 & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
          objc_msgSend(v15, "scrollToHideIndexStatus");

        }
      }
    }
    else if (objc_msgSend(v16, "phraseKind") == 1)
    {
      -[MessageListViewController updateNoContentViewAnimated:](self, "updateNoContentViewAnimated:", 0);
    }
    -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", (*(_BYTE *)&self->_flags & 4) == 0);
  }

}

- (void)suggestionsGenerator:(id)a3 didCompleteRequestID:(id)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsIdentifier](self, "suggestionsIdentifier"));
  v6 = objc_msgSend(v11, "isEqualToID:", v5);

  if ((v6 & 1) != 0)
  {
    -[MessageListSearchViewController setSuggestionsIdentifier:](self, "setSuggestionsIdentifier:", 0);
    if (!-[MessageListSearchViewController suggestersGeneratedSuggestions](self, "suggestersGeneratedSuggestions"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
      objc_msgSend(v7, "clearSuggestions");

    }
    -[MessageListSearchViewController setSuggestersGeneratedSuggestions:](self, "setSuggestersGeneratedSuggestions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
    objc_msgSend(v8, "endUpdatingSuggestions");

    *(_BYTE *)&self->_flags |= 8u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController beginSearchTimer](self, "beginSearchTimer"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "invalidate");
      -[MessageListSearchViewController setBeginSearchTimer:](self, "setBeginSearchTimer:", 0);
      -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 1);
    }

  }
}

- (void)textFieldDidChangeSelection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  char v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _objectFromSelectionInSearchTextField:](self, "_objectFromSelectionInSearchTextField:", v12));
  v6 = objc_opt_class(MUISuggestionToken);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scopeNames"));
  v9 = objc_msgSend(v7, "selectedScopeIndex");
  v10 = objc_msgSend(v7, "hasMultipleScopes");

  if (!v10)
  {
LABEL_5:
    -[MessageListSearchViewController _resetGlobalScopeTitles](self, "_resetGlobalScopeTitles");
    v11 = *(_BYTE *)&self->_flags & 0xDF;
    goto LABEL_6;
  }
  objc_msgSend(v4, "setScopeButtonTitles:", v8);
  objc_msgSend(v4, "setSelectedScopeButtonIndex:", v9);
  v11 = *(_BYTE *)&self->_flags | 0x20;
LABEL_6:
  *(_BYTE *)&self->_flags = v11;

}

- (id)searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v6 = objc_alloc_init((Class)NSItemProvider);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011A03C;
  v13[3] = &unk_10051F4A0;
  v13[4] = self;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.mobilemail.searchAtom"), 3, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011A0D8;
  v11[3] = &unk_10051F4C8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v6, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v8, 0, v11);

  return v6;
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  MessageListSearchViewController *v24;
  _QWORD v25[5];
  id v26;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchTextField"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "representedSuggestionTokens"));
  v11 = (char *)objc_msgSend(v10, "count");

  if (objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.mobilemail.searchAtom")))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10011A4B4;
    v25[3] = &unk_10051F4F0;
    v25[4] = self;
    v26 = v5;
    v12 = objc_msgSend(v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.mobilemail.searchAtom"), v25);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
    v14 = objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", v13);
    if (v11)
      v15 = v14;
    else
      v15 = 0;

    if (v15 == 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedTextRange"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionOfTokenAtIndex:", v11 - 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "end"));
      v19 = objc_msgSend(v8, "comparePosition:toPosition:", v18, v17);

      if (v19 == (id)1)
      {
        objc_msgSend(v5, "setDefaultResult");
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10011A820;
        v22[3] = &unk_10051F4F0;
        v23 = v5;
        v24 = self;
        v21 = objc_msgSend(v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", v20, v22);

      }
    }
    else
    {
      objc_msgSend(v5, "setDefaultResult");
    }
  }

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;

  *(_BYTE *)&self->_flags |= 4u;
  -[MessageListSearchViewController setSearchSuggestionsVisible:](self, "setSearchSuggestionsVisible:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedObjects"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    -[MessageListSearchViewController _addSuggestionToRecentSuggester:](self, "_addSuggestionToRecentSuggester:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsIdentifier](self, "suggestionsIdentifier"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = 0x4000000000000000;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Waiting for suggestions to search with interval: %f", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10011ADD0;
    v11[3] = &unk_10051F518;
    v11[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 2.0));
    -[MessageListSearchViewController setBeginSearchTimer:](self, "setBeginSearchTimer:", v10);

  }
  else
  {
    -[MessageListSearchViewController _notePredicateUpdated:](self, "_notePredicateUpdated:", 1);
  }
  -[MessageListSearchViewController reportDidGoToCommittedSearch](self, "reportDidGoToCommittedSearch");
  -[MessageListSearchViewController reportSearchQueryStateWithTriggerEvent:searchType:](self, "reportSearchQueryStateWithTriggerEvent:searchType:", 23, 3);
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    -[MessageListSearchViewController searchTokenScopeChanged:](self, "searchTokenScopeChanged:", a4);
  else
    -[MessageListSearchViewController globalSearchScopeChanged:](self, "globalSearchScopeChanged:", a4);
  if (-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _currentEditingStringForSearchBar:](self, "_currentEditingStringForSearchBar:", v6));

    if (objc_msgSend(v7, "length"))
      -[MessageListSearchViewController _generateSuggestionsForPhrase:](self, "_generateSuggestionsForPhrase:", v7);

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedObjects"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchBar](self, "searchBar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "representedSuggestionTokens"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MUISuggestionToken csTokensFromMailSuggestionTokens:](MUISuggestionToken, "csTokensFromMailSuggestionTokens:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion updatedSuggestionWithCurrentSuggestion:userString:tokens:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v12, v5, v11));

    v14 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[EMCSLoggingAdditions publicDescriptionForSuggestion:](EMCSLoggingAdditions, "publicDescriptionForSuggestion:", v13));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userQueryString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringForString:](EFPrivacy, "partiallyRedactedStringForString:", v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "suggestionTokens"));
      v20 = 138412802;
      v21 = v15;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Suggestion was updated. Reason: Text changed. Suggestion: %@ UserQueryString: %@ SuggestionTokens: %@", (uint8_t *)&v20, 0x20u);

    }
    -[MessageListViewController setCurrentUserTypedPhrase:](self, "setCurrentUserTypedPhrase:", v5);
    -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:", v13);
    -[MessageListSearchViewController reportSearchQueryStateWithTriggerEvent:searchType:](self, "reportSearchQueryStateWithTriggerEvent:searchType:", 1, 2);

  }
  else
  {
    -[MessageListViewController setCurrentUserTypedPhrase:](self, "setCurrentUserTypedPhrase:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSSuggestion emptySuggestion](CSSuggestion, "emptySuggestion"));
    -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:", v19);

    -[MessageListSearchViewController reportQueryClearedEvent:](self, "reportQueryClearedEvent:", 0);
    -[MessageListSearchViewController reportSearchQueryStateWithTriggerEvent:searchType:](self, "reportSearchQueryStateWithTriggerEvent:searchType:", 9, 1);
  }

}

- (id)_additionalBarButtonItems
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController _searchTapToRadarButtonItem](self, "_searchTapToRadarButtonItem"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)_searchTapToRadarButtonItem
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;

  if (!qword_1005A9FC0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
    if (!objc_msgSend(v3, "isInternal"))
    {
LABEL_5:

      return (id)qword_1005A9FC0;
    }
    v4 = +[MSRadarURLBuilder canOpenRadar](MSRadarURLBuilder, "canOpenRadar");

    if (v4)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:textStyle:scale:weight:](UIImage, "mf_systemImageNamed:textStyle:scale:weight:", MFImageGlyphTapToRadar, UIFontTextStyleFootnote, 2, 5));
      v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v3, 0, self, "_searchTapToRadarButtonSelected:");
      v6 = (void *)qword_1005A9FC0;
      qword_1005A9FC0 = (uint64_t)v5;

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.643137255, 0.0, 0.97254902, 1.0));
      objc_msgSend((id)qword_1005A9FC0, "setTintColor:", v7);

      goto LABEL_5;
    }
  }
  return (id)qword_1005A9FC0;
}

- (void)_searchTapToRadarButtonSelected:(id)a3
{
  -[MessageListSearchViewController invokeTapToRadar](self, "invokeTapToRadar", a3);
}

- (void)invokeTapToRadar
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[MSRadarInteraction interactionWithTitle:message:builder:](MSRadarInteraction, "interactionWithTitle:message:builder:", CFSTR("Mail Search Problem?"), CFSTR("Having trouble with search? We've got a Tap-to-Radar template ready to go."), &stru_10051F558));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController scene](self, "scene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_rootViewController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v11, "collectionView:willDisplayCell:forItemAtIndexPath:", v8, v9, v10);
  -[MessageListSearchViewController reportVisibleMessageListResultsAlwaysReportItems:](self, "reportVisibleMessageListResultsAlwaysReportItems:", 0);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v11, "collectionView:didEndDisplayingCell:forItemAtIndexPath:", v8, v9, v10);
  -[MessageListSearchViewController reportVisibleMessageListResultsAlwaysReportItems:](self, "reportVisibleMessageListResultsAlwaysReportItems:", 0);

}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return -[MessageListSearchViewController isEditing](self, "isEditing", a3, a4) ^ 1;
}

- (void)_sendAnalyticsForIndexState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v6 = EMUserDefaultIndexStatusCollectAfterDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", EMUserDefaultIndexStatusCollectAfterDate));

  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
        v9 = objc_msgSend(v7, "ef_isEarlierThanDate:", v8),
        v8,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    objc_msgSend(v13, "setObject:forKey:", v12, v6);

    v19[0] = CFSTR("percentMessagesIndexed");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "percentMessagesIndexed")));
    v19[1] = CFSTR("percentAttachmentsIndexed");
    v20[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "percentAttachmentsIndexed")));
    v20[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

    v17 = objc_msgSend(objc_alloc((Class)EMCoreAnalyticsEvent), "initWithEventName:collectionData:", CFSTR("com.apple.mail.searchableIndex.indexStatus"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController analyticsCollector](self, "analyticsCollector"));
    objc_msgSend(v18, "logOneTimeEvent:", v17);

  }
}

- (void)_updateIndexStatisticsIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController indexingStatusDebouncer](self, "indexingStatusDebouncer"));
  objc_msgSend(v2, "debounceResult:", 0);

}

- (void)_updateIndexStatistics
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemonInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "diagnosticInfoGatherer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011BB24;
  v5[3] = &unk_10051C488;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "searchableIndexDatabaseStatisticsWithCompletionHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (unint64_t)_computeBGSystemTaskFeatureCheckpoint
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  float v15;
  BOOL v16;
  unint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController indexStatistics](self, "indexStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", EMPersistenceStatisticsKeyMessagesIndexed));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController indexStatistics](self, "indexStatistics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", EMPersistenceStatisticsKeyRemoteMessagesIndexed));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController indexStatistics](self, "indexStatistics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", EMPersistenceStatisticsKeyIndexableMessages));
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController indexStatistics](self, "indexStatistics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", EMPersistenceStatisticsKeyIndexableRemoteMessages));
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  v15 = 1.0;
  if (v11)
    v15 = (float)(unint64_t)v5 / (float)(unint64_t)v11;
  if (v14)
    v16 = (float)((float)(unint64_t)v8 / (float)(unint64_t)v14) <= kDefaultMaxIndexedToTotalRatio;
  else
    v16 = 1;
  v17 = 40;
  if (!v16)
    v17 = 60;
  if (v15 <= kDefaultMaxIndexedToTotalRatio)
    return 10;
  else
    return v17;
}

- (id)searchScopeForSuggestionCategoryScope:(id)a3
{
  void *v3;
  id *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if ((objc_msgSend(v3, "isEqualToString:", MFSearchSuggestionSubjectCategoryScope) & 1) != 0)
  {
    v4 = (id *)&MSSearchScopeSubject;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", MUISearchSuggestionCategoryContentScope) & 1) != 0)
  {
    v4 = (id *)&MSSearchScopeMessage;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", MFSearchSuggestionPeopleCategoryFromScope) & 1) != 0)
  {
    v4 = (id *)&MSSearchScopeFrom;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", MFSearchSuggestionPeopleCategoryToScope) & 1) != 0)
  {
    v4 = (id *)&MSSearchScopeTo;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", MFSearchSuggestionMailboxCategoryScope))
    {
      v5 = 0;
      goto LABEL_12;
    }
    v4 = (id *)&MSSearchScopeMailbox;
  }
  v5 = *v4;
LABEL_12:

  return v5;
}

- (id)SectionCategoryForSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class(SearchTopHitsSuggestion);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (id *)&MSSearchSuggestionCategoryTopHit;
  }
  else
  {
    v7 = objc_opt_class(MUISearchInstantAnswersSuggestion);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      v6 = (id *)&MSSearchSuggestionCategoryInstantAnswer;
    }
    else
    {
      v8 = objc_opt_class(MUISearchAtomSuggestion);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController categoryForSuggestion:](self, "categoryForSuggestion:", v4));
        goto LABEL_8;
      }
      v6 = (id *)&MSSearchSuggestionCategorySuggestion;
    }
  }
  v9 = *v6;
LABEL_8:
  v10 = v9;

  return v10;
}

- (id)categoryForSuggestion:(id)a3
{
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
  void *v15;
  void *v16;
  id v17;
  id *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory"));

  if (v6 == v7)
  {
    v18 = (id *)&MSSearchSuggestionCategoryMailboxes;
    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory topHitsCategory](MUISearchSuggestionCategory, "topHitsCategory"));

  if (v6 == v8)
  {
    v18 = (id *)&MSSearchSuggestionCategoryTopHit;
    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory instantAnswersCategory](MUISearchSuggestionCategory, "instantAnswersCategory"));

  if (v6 == v9)
  {
    v18 = (id *)&MSSearchSuggestionCategoryInstantAnswer;
    goto LABEL_18;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory contactCategory](MUISearchSuggestionCategory, "contactCategory"));

  if (v6 == v10)
  {
    v18 = (id *)&MSSearchSuggestionCategoryContact;
    goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory documentCategory](MUISearchSuggestionCategory, "documentCategory"));

  if (v6 == v11)
  {
    v18 = (id *)&MSSearchSuggestionCategoryDocument;
    goto LABEL_18;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory locationCategory](MUISearchSuggestionCategory, "locationCategory"));

  if (v6 == v12)
  {
    v18 = (id *)&MSSearchSuggestionCategoryLocation;
    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory linkCategory](MUISearchSuggestionCategory, "linkCategory"));

  if (v6 == v13)
  {
    v18 = (id *)&MSSearchSuggestionCategoryLink;
LABEL_18:
    v17 = *v18;
    if (v17)
      goto LABEL_19;
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory genericCategory](MUISearchSuggestionCategory, "genericCategory"));
  if (v6 == v14)
  {

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory recentGenericCategory](MUISearchSuggestionCategory, "recentGenericCategory"));

    if (v6 != v15)
    {
LABEL_10:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListSearchViewController.m"), 1655, CFSTR("No corresponding MSSearchSuggestionCategory for MUISearchAtomSuggestion %@"), v5);

      v17 = 0;
      goto LABEL_19;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spotlightSuggestion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentToken"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spotlightSuggestion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentToken"));

    v17 = (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController categoryForTokenKind:](self, "categoryForTokenKind:", objc_msgSend(v23, "tokenKind")));
  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(+[MessageListSearchViewController log](MessageListSearchViewController, "log"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10039333C(v24, v25, v26, v27, v28, v29, v30, v31);

    v17 = MSSearchSuggestionCategoryGeneric;
  }
LABEL_19:

  return v17;
}

- (void)setUpAppSwitcherObserver
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "reportSearchDidBecomeActive", UISceneWillEnterForegroundNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "reportSearchWillTerminate", UIApplicationWillTerminateNotification, 0);

}

- (void)removeObservers
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UISceneWillEnterForegroundNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationWillTerminateNotification, 0);

}

- (id)categoryForTokenKind:(int64_t)a3
{
  id *v3;

  v3 = (id *)&MSSearchSuggestionCategorySubject;
  switch(a3)
  {
    case 0:
      v3 = (id *)&MSSearchSuggestionCategoryFreeText;
      break;
    case 1:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_6;
    case 2:
      v3 = (id *)&MSSearchSuggestionCategoryAttachment;
      break;
    case 5:
      v3 = (id *)&MSSearchSuggestionCategoryDates;
      break;
    case 12:
      v3 = (id *)&MSSearchSuggestionCategoryMailboxes;
      break;
    case 14:
      v3 = (id *)&MSSearchSuggestionCategorySubjectContains;
      break;
    case 16:
      v3 = (id *)&MSSearchSuggestionCategoryPeople;
      break;
    case 19:
      v3 = (id *)&MSSearchSuggestionCategoryReadStatus;
      break;
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      v3 = (id *)&MSSearchSuggestionCategoryFlagColor;
      break;
    case 33:
      v3 = (id *)&MSSearchSuggestionCategoryFlagStatus;
      break;
    case 34:
      return *v3;
    default:
      if (a3 == 46)
        v3 = (id *)&MSSearchSuggestionCategorySenderContains;
      else
LABEL_6:
        v3 = (id *)&MSSearchSuggestionCategoryOther;
      break;
  }
  return *v3;
}

- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  BOOL v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011C82C;
  v6[3] = &unk_10051F5E8;
  v8 = a3;
  v9 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController inputLanguages](self, "inputLanguages"));
  v5 = v7;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v6);

}

- (void)reportSearchDidBecomeActive
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  id (*v7)(uint64_t, void *);
  void *v8;
  MessageListSearchViewController *v9;
  id v10;

  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_10011C920;
  v8 = &unk_10051F450;
  v9 = self;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MessageListViewController inputLanguages](self, "inputLanguages"));
  v10 = v3;
  -[MessageListViewController parsecEventQueuePerformBlock:](v9, "parsecEventQueuePerformBlock:", &v5);
  if (-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible", v5, v6, v7, v8, v9))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController suggestionsViewController](self, "suggestionsViewController"));
    objc_msgSend(v4, "reportVisibleSuggestionResults");

  }
  else
  {
    -[MessageListSearchViewController reportVisibleMessageListResultsAlwaysReportItems:](self, "reportVisibleMessageListResultsAlwaysReportItems:", 1);
  }

}

- (void)_sceneDidEnterBackground
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController _sceneDidEnterBackground](&v5, "_sceneDidEnterBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (v4)
    -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", &stru_10051F628);
}

- (void)reportSearchWillTerminate
{
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", &stru_10051F648);
}

- (void)reportSearchEndedEvent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011CA44;
  v3[3] = &unk_10051F668;
  v3[4] = a3;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v3);
}

- (void)reportTopHitSelected:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011CAE0;
  v5[3] = &unk_10051F690;
  v6 = a3;
  v4 = v6;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v5);

}

- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011CBB0;
  v8[3] = &unk_10051F450;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v8);

}

- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011CCB8;
  v11[3] = &unk_10051F6B8;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v8 = v14;
  v9 = v13;
  v10 = v12;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v11);

}

- (void)reportSuggestionSelected:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011CD58;
  v5[3] = &unk_10051F690;
  v6 = a3;
  v4 = v6;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v5);

}

- (void)reportDidGoToCommittedSearch
{
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", &stru_10051F6D8);
}

- (void)reportMessageListResultsFetchedIsFinished:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011CE4C;
  v7[3] = &unk_10051F740;
  v7[4] = self;
  v8 = a3;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v7);
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10011D040;
    v6[3] = &unk_10051AA98;
    v6[4] = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (void)reportVisibleMessageListResultsAlwaysReportItems:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController initialLoadCompletedFuture](self, "initialLoadCompletedFuture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultIfAvailable"));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForVisibleItems"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011D29C;
    v19[3] = &unk_10051F768;
    v19[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_filter:", v19));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));

    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController lastVisibleIndexPaths](self, "lastVisibleIndexPaths"));
      v13 = objc_msgSend(v11, "isEqualToArray:", v12);

      if (!v13 || v3)
      {
        v14 = objc_msgSend(v11, "copy");
        -[MessageListSearchViewController setLastVisibleIndexPaths:](self, "setLastVisibleIndexPaths:", v14);

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10011D318;
        v18[3] = &unk_10051F790;
        v18[4] = self;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10011D460;
        v16[3] = &unk_10051F690;
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_compactMap:", v18));
        v15 = v17;
        -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v16);

      }
    }
    -[MessageListSearchViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

  }
  else
  {
    -[MessageListSearchViewController setLastVisibleIndexPaths:](self, "setLastVisibleIndexPaths:", 0);
  }
}

- (void)_reportSearchQueryStateForScopeChange
{
  uint64_t v3;

  if (-[MessageListSearchViewController isSearchSuggestionsVisible](self, "isSearchSuggestionsVisible"))
    v3 = 2;
  else
    v3 = 3;
  -[MessageListSearchViewController reportSearchQueryStateWithTriggerEvent:searchType:](self, "reportSearchQueryStateWithTriggerEvent:searchType:", 27, v3);
}

- (void)reportSearchQueryStateWithTriggerEvent:(unint64_t)a3 searchType:(unint64_t)a4
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[3];
  id location;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListViewController inputLanguages](self, "inputLanguages"));
  if (pthread_main_np() != 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListSearchViewController.m"), 1843, CFSTR("Current thread must be main"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController currentSuggestion](self, "currentSuggestion"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011D634;
  v13[3] = &unk_10051F7E0;
  objc_copyWeak(v16, &location);
  v14 = v9;
  v16[1] = (id)a3;
  v16[2] = (id)a4;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)reportQueryClearedEvent:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10011DA9C;
  v3[3] = &unk_10051F668;
  v3[4] = a3;
  -[MessageListViewController parsecEventQueuePerformBlock:](self, "parsecEventQueuePerformBlock:", v3);
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController collectionView](self, "collectionView", a3));
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  return 0;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect v9;
  CGRect v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[MessageListSearchViewController currentKeyboardOverlap](self, "currentKeyboardOverlap", a3);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    -[MessageListSearchViewController setCurrentKeyboardOverlap:](self, "setCurrentKeyboardOverlap:", x, y, width, height);
    -[MessageListSearchViewController reportVisibleMessageListResultsAlwaysReportItems:](self, "reportVisibleMessageListResultsAlwaysReportItems:", 0);
  }
}

- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v11, "isEqualToString:", MessageListSectionIndexedSearch) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", MessageListSectionServerSearch))
  {
    v14 = objc_alloc((Class)MessageListSearchSectionDataSource);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController sectionDataSourceConfigurationWithIdentifier:section:messageList:](self, "sectionDataSourceConfigurationWithIdentifier:section:messageList:", v12, v11, v13));
    v16 = objc_msgSend(v14, "initWithConfiguration:", v15);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)MessageListSearchViewController;
    v17 = -[MessageListSearchViewController messageListDataSource:sectionDataSourceForSection:objectID:messageList:](&v19, "messageListDataSource:sectionDataSourceForSection:objectID:messageList:", v10, v11, v12, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue(v17);
  }

  return v16;
}

- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MessageListSearchViewController;
  v6 = -[MessageListSearchViewController sectionDataSourceConfigurationWithIdentifier:section:messageList:](&v10, "sectionDataSourceConfigurationWithIdentifier:section:messageList:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListSearchViewController searchProgressView](self, "searchProgressView"));
  objc_msgSend(v7, "setSearchProgressView:", v8);

  return v7;
}

- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MessageListSearchViewController _updateFooter](self, "_updateFooter");
  v13.receiver = self;
  v13.super_class = (Class)MessageListSearchViewController;
  -[MessageListViewController messageListDataSource:didUpdateWithChange:section:animated:](&v13, "messageListDataSource:didUpdateWithChange:section:animated:", v10, v11, v12, v6);

}

- (BOOL)generateCannedSuggestions
{
  return self->_generateCannedSuggestions;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCollector, a3);
}

- (UIView)snapshotViewForDismissal
{
  return self->_snapshotViewForDismissal;
}

- (BOOL)enablePresentationAnimation
{
  return self->_enablePresentationAnimation;
}

- (void)setEnablePresentationAnimation:(BOOL)a3
{
  self->_enablePresentationAnimation = a3;
}

- (CSSuggestion)suggestionForInitialSearch
{
  return self->_suggestionForInitialSearch;
}

- (void)setSuggestionForInitialSearch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (MUISearchSuggestionsGenerator)suggestionsGenerator
{
  return self->_suggestionsGenerator;
}

- (void)setSuggestionsGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsGenerator, a3);
}

- (MUISearchRequestID)suggestionsIdentifier
{
  return self->_suggestionsIdentifier;
}

- (void)setSuggestionsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsIdentifier, a3);
}

- (NSString)lastPhrase
{
  return self->_lastPhrase;
}

- (void)setLastPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (unint64_t)countOfAtomsInLastSearch
{
  return self->_countOfAtomsInLastSearch;
}

- (void)setCountOfAtomsInLastSearch:(unint64_t)a3
{
  self->_countOfAtomsInLastSearch = a3;
}

- (MFSearchSuggestionsViewControllable)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsViewController, a3);
}

- (MUISearchRecentSuggester)recentSuggester
{
  return self->_recentSuggester;
}

- (void)setRecentSuggester:(id)a3
{
  objc_storeStrong((id *)&self->_recentSuggester, a3);
}

- (EMCollectionItemID)lastSelectedTopHitItemID
{
  return (EMCollectionItemID *)objc_loadWeakRetained((id *)&self->_lastSelectedTopHitItemID);
}

- (void)setLastSelectedTopHitItemID:(id)a3
{
  objc_storeWeak((id *)&self->_lastSelectedTopHitItemID, a3);
}

- (unint64_t)searchStartAbsoluteTime
{
  return self->_searchStartAbsoluteTime;
}

- (void)setSearchStartAbsoluteTime:(unint64_t)a3
{
  self->_searchStartAbsoluteTime = a3;
}

- (NSTimer)beginSearchTimer
{
  return self->_beginSearchTimer;
}

- (void)setBeginSearchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_beginSearchTimer, a3);
}

- (MFSearchTokenTransformer)searchTokenTransformer
{
  return self->_searchTokenTransformer;
}

- (void)setSearchTokenTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_searchTokenTransformer, a3);
}

- (NSMutableDictionary)searchActivityPayloadDictionary
{
  return self->_searchActivityPayloadDictionary;
}

- (void)setSearchActivityPayloadDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_searchActivityPayloadDictionary, a3);
}

- (void)setSearchProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_searchProgressView, a3);
}

- (EFCancelable)searchProgressViewDisplayCancellable
{
  return self->_searchProgressViewDisplayCancellable;
}

- (void)setSearchProgressViewDisplayCancellable:(id)a3
{
  objc_storeStrong((id *)&self->_searchProgressViewDisplayCancellable, a3);
}

- (EFPromise)localSearchInitialLoadPromise
{
  return self->_localSearchInitialLoadPromise;
}

- (void)setLocalSearchInitialLoadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_localSearchInitialLoadPromise, a3);
}

- (EFPromise)localSearchRemotePromise
{
  return self->_localSearchRemotePromise;
}

- (void)setLocalSearchRemotePromise:(id)a3
{
  objc_storeStrong((id *)&self->_localSearchRemotePromise, a3);
}

- (EFPromise)remoteSearchInitialLoadPromise
{
  return self->_remoteSearchInitialLoadPromise;
}

- (void)setRemoteSearchInitialLoadPromise:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSearchInitialLoadPromise, a3);
}

- (EFPromise)remoteSearchServerPromise
{
  return self->_remoteSearchServerPromise;
}

- (void)setRemoteSearchServerPromise:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSearchServerPromise, a3);
}

- (BOOL)suggestersGeneratedSuggestions
{
  return self->_suggestersGeneratedSuggestions;
}

- (void)setSuggestersGeneratedSuggestions:(BOOL)a3
{
  self->_suggestersGeneratedSuggestions = a3;
}

- (NSArray)lastVisibleIndexPaths
{
  return self->_lastVisibleIndexPaths;
}

- (void)setLastVisibleIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, a3);
}

- (CGRect)currentKeyboardOverlap
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentKeyboardOverlap.origin.x;
  y = self->_currentKeyboardOverlap.origin.y;
  width = self->_currentKeyboardOverlap.size.width;
  height = self->_currentKeyboardOverlap.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentKeyboardOverlap:(CGRect)a3
{
  self->_currentKeyboardOverlap = a3;
}

- (EMSenderRepository)senderRepository
{
  return self->_senderRepository;
}

- (BOOL)inSearchSession
{
  return self->_inSearchSession;
}

- (BOOL)isSearchingFooterVisible
{
  return self->_isSearchingFooterVisible;
}

- (void)setIsSearchingFooterVisible:(BOOL)a3
{
  self->_isSearchingFooterVisible = a3;
}

- (EFDebouncer)indexingStatusDebouncer
{
  return self->_indexingStatusDebouncer;
}

- (void)setIndexingStatusDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_indexingStatusDebouncer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingStatusDebouncer, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_remoteSearchServerPromise, 0);
  objc_storeStrong((id *)&self->_remoteSearchInitialLoadPromise, 0);
  objc_storeStrong((id *)&self->_localSearchRemotePromise, 0);
  objc_storeStrong((id *)&self->_localSearchInitialLoadPromise, 0);
  objc_storeStrong((id *)&self->_searchProgressViewDisplayCancellable, 0);
  objc_storeStrong((id *)&self->_searchProgressView, 0);
  objc_storeStrong((id *)&self->_searchActivityPayloadDictionary, 0);
  objc_storeStrong((id *)&self->_searchTokenTransformer, 0);
  objc_storeStrong((id *)&self->_beginSearchTimer, 0);
  objc_destroyWeak((id *)&self->_lastSelectedTopHitItemID);
  objc_storeStrong((id *)&self->_recentSuggester, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_lastPhrase, 0);
  objc_storeStrong((id *)&self->_suggestionsIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionsGenerator, 0);
  objc_storeStrong((id *)&self->_suggestionForInitialSearch, 0);
  objc_storeStrong((id *)&self->_snapshotViewForDismissal, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_indexStatistics, 0);
}

@end
