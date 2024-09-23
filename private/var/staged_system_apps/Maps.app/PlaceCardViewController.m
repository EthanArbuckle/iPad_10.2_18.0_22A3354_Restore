@implementation PlaceCardViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PlaceCardViewController)initWithVisualEffectDisabled:(BOOL)a3
{
  PlaceCardViewController *v3;
  PlaceCardViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PlaceCardViewController;
  v3 = -[PlaceCardViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v5, "setAlwaysUseDefaultContaineeLayout:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setGrabberBlurEnabled:", 1);

  }
  return v4;
}

- (PlaceCardViewController)init
{
  return -[PlaceCardViewController initWithVisualEffectDisabled:](self, "initWithVisualEffectDisabled:", 0);
}

- (PlaceCardViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PlaceCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (void)dealloc
{
  PlaceCardItem *placeCardItem;
  void *v4;
  void *v5;
  objc_super v6;

  placeCardItem = self->_placeCardItem;
  if (placeCardItem)
    -[PlaceCardItem removeObserver:forKeyPath:](placeCardItem, "removeObserver:forKeyPath:", self, CFSTR("mapItem"));
  if (self->_currentDragSession)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    objc_msgSend(v4, "setDragSession:", 0);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  -[InfoCardViewController dealloc](&v6, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlaceCardViewController;
  -[InfoCardViewController viewDidLoad](&v3, "viewDidLoad");
  -[PlaceCardViewController initPlaceCard](self, "initPlaceCard");
}

- (void)viewWillAppear:(BOOL)a3
{
  DrivePreferences *v4;
  void *v5;
  DrivePreferences *v6;
  void *v7;
  WalkPreferences *v8;
  void *v9;
  WalkPreferences *v10;
  void *v11;
  TransitPreferences *v12;
  void *v13;
  TransitPreferences *v14;
  void *v15;
  CyclePreferences *v16;
  void *v17;
  CyclePreferences *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PlaceCardViewController;
  -[ContaineeViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
  if (self->_placeViewController)
  {
    v4 = [DrivePreferences alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = -[DrivePreferences initWithDefaults:](v4, "initWithDefaults:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences automobileOptions](v6, "automobileOptions"));
    -[MUPlaceViewController setAutomobileOptions:](self->_placeViewController, "setAutomobileOptions:", v7);

    v8 = [WalkPreferences alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = -[WalkPreferences initWithDefaults:](v8, "initWithDefaults:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WalkPreferences walkingOptions](v10, "walkingOptions"));
    -[MUPlaceViewController setWalkingOptions:](self->_placeViewController, "setWalkingOptions:", v11);

    v12 = [TransitPreferences alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = -[WatchSyncedPreferences initWithDefaults:](v12, "initWithDefaults:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences transitOptions](v14, "transitOptions"));
    -[MUPlaceViewController setTransitOptions:](self->_placeViewController, "setTransitOptions:", v15);

    v16 = [CyclePreferences alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18 = -[CyclePreferences initWithDefaults:](v16, "initWithDefaults:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CyclePreferences cyclingOptions](v18, "cyclingOptions"));
    -[MUPlaceViewController setCyclingOptions:](self->_placeViewController, "setCyclingOptions:", v19);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PlaceCardViewController;
  -[InfoCardViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  if ((-[PlaceCardViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0|| sub_1002A8AA0(self) == 5)
  {
    if (self->_wantsInsertOnDismiss)
      -[PlaceCardViewController insertInHistory](self, "insertInHistory");
    -[PlaceCardViewController resetState](self, "resetState");
  }
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  -[PlaceCardViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  -[PlaceCardViewController headerSecondaryNameLabelPadding](self, "headerSecondaryNameLabelPadding");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setHeaderTransitionHeight:", v4);

  -[PlaceCardViewController _updateVerifiedBusinessHeaderIfNeeded](self, "_updateVerifiedBusinessHeaderIfNeeded");
}

- (void)_updateVerifiedBusinessHeaderIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  if (sub_1002A8AA0(self) != 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v4 = objc_msgSend(v3, "containerStyle");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v6 = v5;
    if (v4 == (id)4)
    {
      objc_msgSend(v5, "transitionProgressFromLayout:toLayout:", 1, 3);
      v8 = v7;

      if (v8 < 0.5)
        v9 = 0.0;
      else
        v9 = v8 + -0.5 + v8 + -0.5;
    }
    else
    {
      objc_msgSend(v5, "transitionProgressFromLayout:toLayout:", 2, 3);
      v9 = v10;

    }
    -[MUPlaceViewController setVerifiedHeaderExpansionProgress:](self->_placeViewController, "setVerifiedHeaderExpansionProgress:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    v12 = objc_msgSend(v11, "hideTitleLabel");

    if (v12)
    {
      v13 = -[MUPlaceViewController shouldBlurChromeHeaderButtons](self->_placeViewController, "shouldBlurChromeHeaderButtons");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v16 = v14;
      v15 = v13;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v16 = v14;
      v15 = 0;
    }
    objc_msgSend(v14, "setBlurButtons:", v15);

  }
}

- (void)copy:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v5, "placeCardViewController:requestCopyLinkToClipboard:", self, v4);

}

- (double)_mediumLayoutHeightInSAR
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  objc_msgSend(v5, "bounds");
  if (v7 == 320.0)
  {
    objc_msgSend(v5, "bounds");
    v10 = UIRoundToScreenScale(v5, v9 * 0.330000013);
  }
  else
  {
    v10 = dbl_100E35190[v8 > 750.0];
  }

  return v10;
}

- (double)heightForLayout:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (a3 == 2 && -[PlaceCardViewController isPresentedInSearchAlongTheRoute](self, "isPresentedInSearchAlongTheRoute"))
  {
    -[PlaceCardViewController _mediumLayoutHeightInSAR](self, "_mediumLayoutHeightInSAR");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PlaceCardViewController;
    -[InfoCardViewController heightForLayout:](&v6, "heightForLayout:", a3);
  }
  return result;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v10;
  void *v11;
  id v12;
  unint64_t previousLayout;
  BOOL v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  v17.receiver = self;
  v17.super_class = (Class)PlaceCardViewController;
  -[InfoCardViewController willChangeLayout:](&v17, "willChangeLayout:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = (unint64_t)objc_msgSend(v7, "containerStyle");

  v10 = v8 - 1 < 2 || (v8 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (a3 - 3 <= 1 && v10 && v6)
    -[PlaceCardViewController insertInHistory](self, "insertInHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v12 = objc_msgSend(v11, "containeeLayout");

  previousLayout = self->_previousLayout;
  if (previousLayout)
    v14 = previousLayout >= (unint64_t)v12;
  else
    v14 = 1;
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController analyticsDelegate](self, "analyticsDelegate"));
    objc_msgSend(v15, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 1, 0, 0);

    previousLayout = self->_previousLayout;
  }
  if (v12 && previousLayout > (unint64_t)v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController analyticsDelegate](self, "analyticsDelegate"));
    objc_msgSend(v16, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 2, 0, 0);

  }
  self->_previousLayout = (unint64_t)v12;
}

- (double)headerSecondaryNameLabelPadding
{
  double result;

  -[MUPlaceViewController headerSecondaryNameLabelPadding](self->_placeViewController, "headerSecondaryNameLabelPadding");
  return result;
}

- (void)didBecomeCurrent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v14;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *friendshipCoordinator;
  id v16;
  NSObject *v17;
  PlaceCardItem *placeCardItem;
  objc_super v19;
  uint8_t buf[4];
  PlaceCardItem *v21;
  __int16 v22;
  void *v23;

  v19.receiver = self;
  v19.super_class = (Class)PlaceCardViewController;
  -[ContaineeViewController didBecomeCurrent](&v19, "didBecomeCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "placeCardViewControllerWillBecomeCurrent:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v5, "placeCardViewControllerWillBecomeCurrent:", self);

  }
  -[MUPlaceViewController becomeActive](self->_placeViewController, "becomeActive");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompletePerson"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));

  if (v9)
  {
    v10 = [_TtC4Maps33SearchFindMyFriendshipCoordinator alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "handle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "handle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handleIdentifier"));
    v14 = -[SearchFindMyFriendshipCoordinator initWith:](v10, "initWith:", v13);
    friendshipCoordinator = self->_friendshipCoordinator;
    self->_friendshipCoordinator = v14;

    -[SearchFindMyFriendshipCoordinator setDelegate:](self->_friendshipCoordinator, "setDelegate:", self);
    v16 = sub_100431DCC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      placeCardItem = self->_placeCardItem;
      *(_DWORD *)buf = 138412546;
      v21 = placeCardItem;
      v22 = 2112;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Started monitoring friendship stream for PlaceCardItem: %@, person: %@", buf, 0x16u);
    }

    -[SearchFindMyFriendshipCoordinator startMonitoringHandles](self->_friendshipCoordinator, "startMonitoringHandles");
  }

}

- (void)willResignCurrent:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "placeCardViewControllerWillResignCurrent:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v6, "placeCardViewControllerWillResignCurrent:", self);

  }
}

- (void)didResignCurrent
{
  _TtC4Maps33SearchFindMyFriendshipCoordinator *friendshipCoordinator;
  objc_super v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[MUPlaceViewController resignActive](self->_placeViewController, "resignActive");
  -[PlaceCardViewController _submitInlineRatingsIfNeeded](self, "_submitInlineRatingsIfNeeded");
  objc_initWeak(&location, self);
  friendshipCoordinator = self->_friendshipCoordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100810954;
  v5[3] = &unk_1011AEAA0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  -[SearchFindMyFriendshipCoordinator stopMonitoringHandlesWithCompletionHandler:](friendshipCoordinator, "stopMonitoringHandlesWithCompletionHandler:", v5);
  v4.receiver = self;
  v4.super_class = (Class)PlaceCardViewController;
  -[ContaineeViewController didResignCurrent](&v4, "didResignCurrent");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)resetState
{
  MKMapItem *updatedCurrentLocation;
  void *v4;
  UGCSuggestionViewProvider *suggestionViewProvider;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PlaceCardOfflineMapProvider *offlineMapProvider;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *libraryOperationsCoordinator;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *collectionMembershipProvider;

  -[PlaceCardViewController setPlaceCardItem:](self, "setPlaceCardItem:", 0);
  self->_originalContent = 1;
  self->_shouldPresentSecondaryActionWhenReady = 0;
  self->_didInsertInHistory = 0;
  self->_shouldInsertInHistory = 0;
  self->_contentNeedsUpdating = 0;
  self->_shouldFetchDraggableViews = 0;
  self->_refinementFailed = 0;
  updatedCurrentLocation = self->_updatedCurrentLocation;
  self->_updatedCurrentLocation = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  objc_msgSend(v4, "setHidden:", 1);

  -[MUPlaceViewController resetAnalyticsState](self->_placeViewController, "resetAnalyticsState");
  self->_isAdditionalStop = 0;
  -[RelatedSearchSuggestionViewController resetData](self->_suggestionViewController, "resetData");
  suggestionViewProvider = self->_suggestionViewProvider;
  self->_suggestionViewProvider = 0;

  -[PlaceCardViewController setDraggableContent:](self, "setDraggableContent:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v7, "removeObserver:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "observers"));
  objc_msgSend(v9, "unregisterObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
  objc_msgSend(v10, "unregisterObserver:", self);

  offlineMapProvider = self->_offlineMapProvider;
  self->_offlineMapProvider = 0;

  libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
  self->_libraryOperationsCoordinator = 0;

  collectionMembershipProvider = self->_collectionMembershipProvider;
  self->_collectionMembershipProvider = 0;

}

- (void)prepareForPresentationWithExistingPlaceCardItem
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[MUPlaceViewController resetAnalyticsState](self->_placeViewController, "resetAnalyticsState");
  -[MUPlaceViewController setForceCaptureRevealEventOnNextBecomeActive:](self->_placeViewController, "setForceCaptureRevealEventOnNextBecomeActive:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "placeCardViewController:willReusePlaceCardItem:");

  if ((v4 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    objc_msgSend(v6, "placeCardViewController:willReusePlaceCardItem:", self, v5);

  }
}

- (void)setNeedsContentUpdate
{
  _QWORD block[5];

  if (!self->_contentNeedsUpdating)
  {
    self->_contentNeedsUpdating = 1;
    self->_shouldFetchDraggableViews = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100810CF8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)hideHeader
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v3, "setHideTitleLabel:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v4, "setHairLineAlpha:", 0.0);

}

- (void)updateContent
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
  unsigned int v12;
  unint64_t v13;
  unint64_t excludedContent;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *libraryOperationsCoordinator;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v52;
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v58;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *collectionMembershipProvider;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  UGCSuggestionViewProvider *v68;
  UGCSuggestionViewProvider *suggestionViewProvider;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  PlaceCardOfflineMapProvider *v76;
  PlaceCardOfflineMapProvider *offlineMapProvider;
  void *v78;
  void *v79;
  _BOOL4 originalContent;
  int v81;
  unint64_t v82;
  void *v83;
  void *v84;
  _QWORD v85[5];

  self->_contentNeedsUpdating = 0;
  -[PlaceCardViewController initPlaceCard](self, "initPlaceCard");
  -[PlaceCardViewController hideHeader](self, "hideHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v3, "scrollToTopAnimated:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
  objc_msgSend(v4, "setHidden:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedSearchSuggestion"));

  if (v7)
  {
    -[PlaceCardViewController _initSuggestion](self, "_initSuggestion");
    -[PlaceCardViewController _updateSuggestionVisibility](self, "_updateSuggestionVisibility");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
  if (objc_msgSend(v8, "_hasMUID") && objc_msgSend(v8, "_muid"))
  {
    v81 = 1;
  }
  else
  {
    if (!-[PlaceCardItem isDroppedPin](self->_placeCardItem, "isDroppedPin")
      && -[PlaceCardItem isIntermediateMapItem](self->_placeCardItem, "isIntermediateMapItem"))
    {
      -[PlaceCardItem setIsIntermediateMapItem:](self->_placeCardItem, "setIsIntermediateMapItem:", 0);
    }
    v81 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));

  v83 = v10;
  v84 = v8;
  if ((objc_msgSend(v10, "isCoreRoutineEnabled") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v12 = objc_msgSend(v11, "isHomeWorkSchoolAddress");

    if (v12)
      v13 = ((self->_excludedContent << 15) & 0x40000 | ((unint64_t)((self->_excludedContent & 0x408) == 0) << 19)) ^ 0x40000;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  excludedContent = self->_excludedContent;
  v82 = excludedContent >> 12;
  v15 = (8 * (excludedContent & 1)) | v13;
  if ((excludedContent & 0x20) != 0)
    v16 = 0x420001061;
  else
    v16 = 536875041;
  v17 = ~((_WORD)excludedContent << 7) & 0x100;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  if (objc_msgSend(v18, "canAddToCollections"))
    v19 = 0x8000;
  else
    v19 = 0;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  if (objc_msgSend(v20, "canAddToLibrary"))
    v21 = 0x10000000000;
  else
    v21 = 0;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  if (objc_msgSend(v22, "canAddNote"))
    v23 = 0x20000000000;
  else
    v23 = 0;

  v24 = self->_excludedContent;
  v25 = v15 & 0xFFFFFFFBFFFFFFFFLL | ((v82 & 1) << 34) | v16 | v17 | v19 | v21 | v23 | ((_DWORD)v24 << 18) & 0x4000000 | (v24 << 20) & 0x80000000 | (v24 << 23) & 0x1000000000 | ((_DWORD)v24 << 19) & 0x2000000 | (unint64_t)(~((_DWORD)v24 << 10) & 0x20000) | ~((_DWORD)v24 << 20) & 0x400000 | ~((_DWORD)v24 << 16) & 0x100000;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v27 = objc_msgSend(v26, "isInternalInstall");

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("__internal__PlaceCardLocationSimulation"));
    v30 = 0x2000;
    if (!v29)
      v30 = 0;
    v25 |= v30;

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v31, "BOOLForKey:", CFSTR("GEOPlaceShowGEOIDKey")))
    v32 = 0x1000000;
  else
    v32 = 0;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v34 = objc_msgSend(v33, "canAddToShortcuts");
  v35 = 0x10000000;
  if (!v34)
    v35 = 0;
  v36 = v32 | v25 | v35;

  v37 = v36 | ((unint64_t)self->_isAdditionalStop << 33) | ((unint64_t)self->_isPresentedInSearchAlongTheRoute << 35);
  v38 = v37 | 0x40800000;
  if (MapsFeature_IsEnabled_MapsWally(v39))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v41 = objc_msgSend(v40, "canShowOpenFindMyAction");

    if (v41)
    {
      v38 = v37 | 0x2040800000;
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v43 = objc_msgSend(v42, "canShowRequestLocation");

      if (v43)
        v38 = v37 | 0x4040800000;
    }
  }
  if (GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v45 = objc_msgSend(v44, "isUsingOfflineMaps");

    if (!v45)
      v38 |= 0x40000000000uLL;
  }
  -[MUPlaceViewController setOptions:](self->_placeViewController, "setOptions:", v38);
  if (!v81 || self->_refinementFailed)
    goto LABEL_46;
  if ((objc_msgSend(v84, "_hasResolvablePartialInformation") & 1) == 0)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "_geoMapItem"));
    if ((objc_msgSend(v78, "hasExpiredComponents") & 1) != 0
      || -[PlaceCardItem isIntermediateMapItem](self->_placeCardItem, "isIntermediateMapItem")
      || (objc_msgSend(v84, "_maps_isIncompleteVenueSearchResult") & 1) != 0)
    {

      goto LABEL_64;
    }
    if (objc_msgSend(v84, "_maps_isVenueOrBuilding"))
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "_browseCategories"));
      if (!objc_msgSend(v79, "count"))
      {
        originalContent = self->_originalContent;

        if (originalContent)
          goto LABEL_64;
LABEL_46:
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
        objc_msgSend(v46, "disableDeferLoggingUntilRefinementWithShouldInvokeReveal:", 0);
        v47 = 0;
        goto LABEL_47;
      }

    }
    goto LABEL_46;
  }
LABEL_64:
  v47 = 1;
  -[PlaceCardItem setIsIntermediateMapItem:](self->_placeCardItem, "setIsIntermediateMapItem:", 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
  objc_msgSend(v46, "setDisableDeferLoggingUntilRefinement");
LABEL_47:

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem placeItem](self->_placeCardItem, "placeItem"));
  -[MUPlaceViewController setPlaceItem:updateOriginalContact:](self->_placeViewController, "setPlaceItem:updateOriginalContact:", v48, !self->_originalContent);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "name"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v50, "setTitle:", v49);

  -[PlaceCardViewController _updateTitleHeaderViewConstraintsIfNeeded](self, "_updateTitleHeaderViewConstraintsIfNeeded");
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (-[PlaceCardItem isCurrentLocation](self->_placeCardItem, "isCurrentLocation"))
    {
      libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
      self->_libraryOperationsCoordinator = 0;
    }
    else
    {
      v52 = objc_alloc_init(_TtC4Maps37PlaceCardLibraryOperationsCoordinator);
      v53 = self->_libraryOperationsCoordinator;
      self->_libraryOperationsCoordinator = v52;

      -[PlaceCardLibraryOperationsCoordinator setViewControllerForPresentingAlert:](self->_libraryOperationsCoordinator, "setViewControllerForPresentingAlert:", self);
      -[PlaceCardLibraryOperationsCoordinator registerObserver:](self->_libraryOperationsCoordinator, "registerObserver:", self);
      libraryOperationsCoordinator = (_TtC4Maps37PlaceCardLibraryOperationsCoordinator *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
      -[PlaceCardLibraryOperationsCoordinator setMapItem:](self->_libraryOperationsCoordinator, "setMapItem:", libraryOperationsCoordinator);
    }

    -[MUPlaceViewController setLibraryAccessProvider:](self->_placeViewController, "setLibraryAccessProvider:", self->_libraryOperationsCoordinator);
    -[InfoCardViewController rebuildHeaderViewButtons](self, "rebuildHeaderViewButtons");
  }
  -[InfoCardViewController rebuildHeaderMenu](self, "rebuildHeaderMenu");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v55 = objc_msgSend(v54, "containeeLayout");

  if (v55 == (id)1)
    -[InfoCardViewController applyAlphaToContent:](self, "applyAlphaToContent:", 0.0);
  -[InfoCardViewController applyLayoutToContent:](self, "applyLayoutToContent:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
  objc_msgSend(v56, "addObserver:", self);

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
  objc_msgSend(v57, "registerObserver:", self);

  -[PlaceCardViewController _updateShortcut](self, "_updateShortcut");
  v58 = objc_alloc_init(_TtC4Maps37PlaceCardCollectionMembershipProvider);
  collectionMembershipProvider = self->_collectionMembershipProvider;
  self->_collectionMembershipProvider = v58;

  -[PlaceCardCollectionMembershipProvider setDelegate:](self->_collectionMembershipProvider, "setDelegate:", self);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "mapItem"));
  -[PlaceCardCollectionMembershipProvider setMapItem:](self->_collectionMembershipProvider, "setMapItem:", v61);

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v62, "addObserver:", self);

  -[PlaceCardViewController _updateCollectionsAnimated:](self, "_updateCollectionsAnimated:", 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "observers"));
  objc_msgSend(v64, "registerObserver:", self);

  -[PlaceCardViewController _updateRAPInReviewStatus](self, "_updateRAPInReviewStatus");
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
  objc_msgSend(v65, "registerObserver:", self);

  if (MapsFeature_IsEnabled_SydneyARP(v66, v67))
  {
    v68 = -[UGCSuggestionViewProvider initWithMapItem:]([UGCSuggestionViewProvider alloc], "initWithMapItem:", v84);
    suggestionViewProvider = self->_suggestionViewProvider;
    self->_suggestionViewProvider = v68;

    -[UGCSuggestionViewProvider setDelegate:](self->_suggestionViewProvider, "setDelegate:", self);
  }
  if (v47)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "poiSearchManager"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    v73 = objc_msgSend(v72, "newTraits");

    objc_msgSend(v73, "useOnlineToOfflineFailoverRequestModeIfAllowed");
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "_identifier"));
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100811728;
    v85[3] = &unk_1011C9E90;
    v85[4] = self;
    objc_msgSend(v71, "searchForIdentifier:allowExpired:traits:completionHandler:", v74, 0, v73, v85);

  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  objc_msgSend(v75, "setNeedsUserActivityUpdate");

  self->_shouldFetchDraggableViews = !self->_contentNeedsUpdating;
  -[PlaceCardViewController _updateCallToActionStateIfNeeded](self, "_updateCallToActionStateIfNeeded");
  -[PlaceCardViewController _updateVerifiedBusinessHeaderIfNeeded](self, "_updateVerifiedBusinessHeaderIfNeeded");
  v76 = -[PlaceCardOfflineMapProvider initWithMapItem:]([PlaceCardOfflineMapProvider alloc], "initWithMapItem:", v84);
  offlineMapProvider = self->_offlineMapProvider;
  self->_offlineMapProvider = v76;

  -[MUPlaceViewController setOfflineMapProvider:](self->_placeViewController, "setOfflineMapProvider:", self->_offlineMapProvider);
  -[PlaceCardViewController _updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:](self, "_updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:", v84);

}

- (void)_carryOverTransitDisplayInformationFromCurrentItemToNewFetchedResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_identifier"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_opt_class(_MKLabelMarkerItem);
    if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_labelMarker"));
      if ((objc_opt_respondsToSelector(v8, "_mapItemBySettingIsTransitDisplayFeature:") & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapItemBySettingIsTransitDisplayFeature:", objc_msgSend(v13, "isTransit")));
        objc_msgSend(v15, "updateWithGEOMapItem:", v14);

      }
    }
  }

}

- (id)analyticsDelegate
{
  return -[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController");
}

- (void)handleShareWithPresentationOptions:(id)a3
{
  -[MUPlaceViewController performShareActionWithPresentationOptions:](self->_placeViewController, "performShareActionWithPresentationOptions:", a3);
}

- (id)libraryAccessProvider
{
  return self->_libraryOperationsCoordinator;
}

- (void)handleAddOrRemoveFromLibraryHeaderAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator mapItem](self->_libraryOperationsCoordinator, "mapItem"));
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", objc_msgSend(v5, "_muid"), v3, 201);

  -[PlaceCardViewController handleAddOrRemovePlaceFromLibrary:](self, "handleAddOrRemovePlaceFromLibrary:", v3);
}

- (void)handleAddOrRemovePlaceFromLibrary:(BOOL)a3
{
  _TtC4Maps37PlaceCardLibraryOperationsCoordinator *libraryOperationsCoordinator;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  libraryOperationsCoordinator = self->_libraryOperationsCoordinator;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator mapItem](libraryOperationsCoordinator, "mapItem"));
    v6 = objc_msgSend(v5, "_maps_canRenameCollectionItem");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator mapItem](self->_libraryOperationsCoordinator, "mapItem"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100811C28;
      v9[3] = &unk_1011AE420;
      v9[4] = self;
      objc_msgSend(v7, "placeCardViewController:editNameOfMapItem:saveHandler:cancelHandler:", self, v8, v9, 0);

    }
    else
    {
      -[PlaceCardLibraryOperationsCoordinator addPlaceToLibraryWithCustomName:](self->_libraryOperationsCoordinator, "addPlaceToLibraryWithCustomName:", 0);
    }
  }
  else
  {
    -[PlaceCardLibraryOperationsCoordinator deletePlaceFromLibrary](libraryOperationsCoordinator, "deletePlaceFromLibrary", a3);
  }
}

- (void)updateHeaderTitle:(id)a3
{
  MUPlaceViewController *placeViewController;
  id v5;
  id v6;

  placeViewController = self->_placeViewController;
  v5 = a3;
  -[MUPlaceViewController updateHeaderTitle](placeViewController, "updateHeaderTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)setPlaceCardItem:(id)a3 withHistory:(BOOL)a4
{
  self->_shouldInsertInHistory = a4;
  self->_suppressNotifyMapItemDidChange = 1;
  -[PlaceCardViewController setPlaceCardItem:](self, "setPlaceCardItem:", a3);
  self->_suppressNotifyMapItemDidChange = 0;
}

- (void)setPlaceCardItem:(id)a3
{
  PlaceCardItem **p_placeCardItem;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_placeCardItem = &self->_placeCardItem;
  v9 = a3;
  if ((PlaceCardItemsAreEqual(*p_placeCardItem, v9) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController contentViewController](self, "contentViewController"));
    objc_msgSend(v6, "scrollToTopAnimated:", 0);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v7, "placeCardViewController:placeCardItemWillChange:", self, v9);

    if (*p_placeCardItem)
      -[PlaceCardItem removeObserver:forKeyPath:](*p_placeCardItem, "removeObserver:forKeyPath:", self, CFSTR("mapItem"));
    objc_storeStrong((id *)&self->_placeCardItem, a3);
    self->_shouldPresentSecondaryActionWhenReady = 0;
    -[PlaceCardViewController _updatePopoverCoordinate](self, "_updatePopoverCoordinate");
    if (*p_placeCardItem)
    {
      -[PlaceCardItem addObserver:forKeyPath:options:context:](*p_placeCardItem, "addObserver:forKeyPath:options:context:", self, CFSTR("mapItem"), 0, off_1014B26D8);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController"));
      objc_msgSend(v8, "registerObserver:", self);

      -[PlaceCardViewController placeCardItemMapItemDidChangeWithFailedRefinement:](self, "placeCardItemMapItemDidChangeWithFailedRefinement:", 0);
      -[PlaceCardViewController _updateCallToActionStateIfNeeded](self, "_updateCallToActionStateIfNeeded");
    }
  }

}

- (void)setExcludedContent:(int64_t)a3
{
  if (self->_excludedContent != a3)
  {
    self->_excludedContent = a3;
    -[PlaceCardViewController setNeedsContentUpdate](self, "setNeedsContentUpdate");
  }
}

- (void)setIsAdditionalStop:(BOOL)a3
{
  if (self->_isAdditionalStop != a3)
  {
    self->_isAdditionalStop = a3;
    -[PlaceCardViewController setNeedsContentUpdate](self, "setNeedsContentUpdate");
  }
}

- (void)setIsPresentedInSearchAlongTheRoute:(BOOL)a3
{
  if (self->_isPresentedInSearchAlongTheRoute != a3)
  {
    self->_isPresentedInSearchAlongTheRoute = a3;
    -[PlaceCardViewController setNeedsContentUpdate](self, "setNeedsContentUpdate");
  }
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)-[MUPlaceViewController lookAroundView](self->_placeViewController, "lookAroundView");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (off_1014B26D8 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("mapItem"), a4, a5))
      -[PlaceCardViewController placeCardItemMapItemDidChangeWithFailedRefinement:](self, "placeCardItemMapItemDidChangeWithFailedRefinement:", 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PlaceCardViewController;
    -[InfoCardViewController observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)placeCardItemMapItemDidChangeWithFailedRefinement:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  self->_refinementFailed = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  objc_msgSend(v4, "placeCardViewController:didUpdateLinkedPlacesFromPlaceCardItem:", self, v5);

  if (!self->_suppressNotifyMapItemDidChange)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    objc_msgSend(v6, "placeCardViewController:mapItemDidChange:", self, v8);

  }
  -[PlaceCardViewController setNeedsContentUpdate](self, "setNeedsContentUpdate");
}

- (void)insertInHistory
{
  PlaceCardItem *placeCardItem;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_didInsertInHistory && self->_shouldInsertInHistory)
  {
    placeCardItem = self->_placeCardItem;
    if (placeCardItem)
    {
      if (-[PlaceCardItem shouldInsertInHistory](placeCardItem, "shouldInsertInHistory"))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchToSupersedeIfRecordedInHistory"));
        +[HistoryEntryRecentsItem saveMapItem:superseedUUID:tracksRAPReportingOnly:](HistoryEntryRecentsItem, "saveMapItem:superseedUUID:tracksRAPReportingOnly:", v4, v6, -[PlaceCardItem shouldInsertInHistoryForRAPTrackingOnly](self->_placeCardItem, "shouldInsertInHistoryForRAPTrackingOnly"));

        self->_didInsertInHistory = 1;
      }
    }
  }
}

- (void)didScrollPastTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlaceCardViewController;
  -[InfoCardViewController didScrollPastTransition](&v3, "didScrollPastTransition");
  if (sub_1002A8AA0(self) == 5)
    self->_wantsInsertOnDismiss = 1;
  else
    -[PlaceCardViewController insertInHistory](self, "insertInHistory");
}

- (void)_updateTitleHeaderViewConstraintsIfNeeded
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
  void *v16;
  void *v17;
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
  _QWORD v29[4];

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController headerViewTitleLabelToTopLayoutGuide](self->_placeViewController, "headerViewTitleLabelToTopLayoutGuide"));
    if (v3)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "safeAreaLayoutGuide"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v23));
      v29[0] = v22;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safeAreaLayoutGuide"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
      v29[1] = v16;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "safeAreaLayoutGuide"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v5));
      v29[2] = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
      v10 = v3;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v9));
      v29[3] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
      objc_msgSend(v28, "addObjectsFromArray:", v12);

      v3 = v10;
      -[InfoCardViewController updateHeaderWithConstraints:](self, "updateHeaderWithConstraints:", v28);

    }
  }
}

- (void)_updateOfflineFeatureDiscoveryViewIfNeededWithMapItem:(id)a3
{
  id v4;
  uint64_t UInteger;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  ImageIconWithBackgroundConfiguration *v13;
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
  FeatureDiscoveryModel *v24;
  FeatureDiscoveryView *v25;
  void *v26;
  uint64_t v27;
  PlaceCardViewController *v28;
  void *v29;
  _QWORD v30[5];

  v4 = a3;
  UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsPlaceCardDownloadTipMaximumDisplayCount, off_1014B45C8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("OfflineMapsPlaceCardDownloadTipsShownKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (char *)objc_msgSend(v8, "integerForKey:", CFSTR("OfflineMapsPlaceCardDownloadTipsDisplayedCountKey"));

  if ((v7 & 1) == 0 && (uint64_t)v9 < UInteger)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_displayMapRegion"));
    v12 = objc_msgSend(v10, "isRegionDownloaded:requireFullyDownloaded:", v11, 0);

    if ((v12 & 1) == 0
      && ((objc_msgSend(v4, "_maps_isLargeAreaPlace") & 1) != 0
       || objc_msgSend(v4, "_isMapItemTypeSettlement")))
    {
      v13 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
      -[ImageIconWithBackgroundConfiguration setIconSize:](v13, "setIconSize:", 35.0, 35.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      -[ImageIconWithBackgroundConfiguration setTintColor:](v13, "setTintColor:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[ImageIconWithBackgroundConfiguration setBackgroundColor:](v13, "setBackgroundColor:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 34.0));
      v28 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle"), v16));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_maps_imageIconWithBackgroundConfiguration:", v13));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Offline] download tip title in placecard"), CFSTR("localized string not found"), CFSTR("Offline")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Offline] download tip subtitle in placecard"), CFSTR("localized string not found"), CFSTR("Offline")));

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100812774;
      v30[3] = &unk_1011AC860;
      v30[4] = v28;
      LOBYTE(v27) = 1;
      v24 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:]([FeatureDiscoveryModel alloc], "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v29, v21, v23, 0, 0, 0, 0, v30, v27);
      -[FeatureDiscoveryModel setIsTipMode:](v24, "setIsTipMode:", 1);
      v25 = -[FeatureDiscoveryView initWithFrame:]([FeatureDiscoveryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[FeatureDiscoveryView setModel:](v25, "setModel:", v24);
      -[MUPlaceViewController setOfflineFeatureDiscoveryView:](v28->_placeViewController, "setOfflineFeatureDiscoveryView:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v26, "setInteger:forKey:", v9 + 1, CFSTR("OfflineMapsPlaceCardDownloadTipsDisplayedCountKey"));

    }
  }

}

- (void)_clearOfflineDownloadTipIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController offlineFeatureDiscoveryView](self->_placeViewController, "offlineFeatureDiscoveryView"));

  if (v3)
    -[MUPlaceViewController setOfflineFeatureDiscoveryView:](self->_placeViewController, "setOfflineFeatureDiscoveryView:", 0);
}

- (void)initPlaceCard
{
  MUPlaceViewController *v3;
  MUPlaceViewController *placeViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC4Maps34MapsSyncPlaceItemMapStorageUpdater *v9;
  _TtC4Maps34MapsSyncPlaceItemMapStorageUpdater *mapsSyncPlaceItemMapStorageUpdater;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  if (!self->_placeViewController)
  {
    v3 = (MUPlaceViewController *)objc_msgSend(objc_alloc((Class)MUPlaceViewController), "initWithMapItem:", 0);
    placeViewController = self->_placeViewController;
    self->_placeViewController = v3;

    -[MUPlaceViewController setPlaceViewControllerDelegate:](self->_placeViewController, "setPlaceViewControllerDelegate:", self);
    -[MUPlaceViewController setMapsAppDelegate:](self->_placeViewController, "setMapsAppDelegate:", self);
    -[InfoCardViewController setContentViewController:](self, "setContentViewController:", self->_placeViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
    objc_msgSend(v7, "_setHostsLayoutEngine:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController view](self->_placeViewController, "view"));
    objc_msgSend(v8, "_maps_annotateViewWithPlaceCardViewController:", self);

    v9 = objc_alloc_init(_TtC4Maps34MapsSyncPlaceItemMapStorageUpdater);
    mapsSyncPlaceItemMapStorageUpdater = self->_mapsSyncPlaceItemMapStorageUpdater;
    self->_mapsSyncPlaceItemMapStorageUpdater = v9;

    v14 = (id)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v14, "isInternalInstall"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("EnablePlacecardImpressionLoggingVisualization"));

      if (!v12)
        return;
      v14 = (id)objc_claimAutoreleasedReturnValue(+[MapsImpressionsPlaceCardFloatingDebugViewController sharedInstance](MapsImpressionsPlaceCardFloatingDebugViewController, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController impressionsCalculator](self->_placeViewController, "impressionsCalculator"));
      objc_msgSend(v14, "setCalculator:", v13);

      if ((objc_msgSend(v14, "isAttached") & 1) == 0)
        objc_msgSend(v14, "attach");
    }

  }
}

+ (BOOL)shouldInsertRecentPOIForRouting
{
  if (qword_1014D3508 != -1)
    dispatch_once(&qword_1014D3508, &stru_1011C9EB0);
  return byte_1014D3500;
}

- (void)updateForViewMode:(int64_t)a3
{
  PlaceCardViewControllerDelegate **p_placeCardDelegate;
  id WeakRetained;
  char v7;
  id v8;

  p_placeCardDelegate = &self->_placeCardDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "placeCardViewController:didUpdateForViewMode:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_placeCardDelegate);
    objc_msgSend(v8, "placeCardViewController:didUpdateForViewMode:", self, a3);

  }
}

- (BOOL)isActive
{
  return -[MUPlaceViewController isActive](self->_placeViewController, "isActive");
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  -[RelatedSearchSuggestionViewController dismiss](self->_suggestionViewController, "dismiss", a3, a4);
}

- (void)mapView:(id)a3 didGetHikingToolTipRegionId:(unint64_t)a4
{
  NSLog(CFSTR("%llu"), a2, a3, a4);
}

- (void)placeViewController:(id)a3 launchAttributionURLs:(id)a4 withAttribution:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v21 = v10;
    v22 = v9;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15)));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("http")))
        {

LABEL_12:
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
          objc_msgSend(v20, "placeCardViewController:openURL:", self, v16);

          v10 = v21;
          v9 = v22;
          goto LABEL_13;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "scheme"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("https"));

        if (v19)
          goto LABEL_12;

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v10 = v21;
      v9 = v22;
      if (v13)
        continue;
      break;
    }
  }

  +[MKAppLaunchController launchAttributionURLs:withAttribution:completionHandler:](MKAppLaunchController, "launchAttributionURLs:withAttribution:completionHandler:", v11, v9, v10);
LABEL_13:

}

- (double)placeViewControllerPlaceCardHeaderTitleTrailingConstant:(id)a3
{
  double result;

  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled", a3))
    return 0.0;
  -[InfoCardViewController titleTrailingConstant](self, "titleTrailingConstant");
  return result;
}

- (id)traitsForPlaceViewController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v4 = objc_msgSend(v3, "newTraits");

  return v4;
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithMode:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4;
  switch(a4)
  {
    case 1uLL:
      break;
    case 2uLL:
      v4 = 2;
      break;
    case 4uLL:
      v4 = 3;
      break;
    case 8uLL:
      v4 = 5;
      break;
    default:
      v4 = 0;
      break;
  }
  -[PlaceCardViewController _routeToCurrentSearchResultWithTransportType:](self, "_routeToCurrentSearchResultWithTransportType:", v4);
}

- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationMapItem:(id)a4 transportType:(id)a5
{
  id v7;
  id v8;
  unsigned int v9;
  SearchFieldItem *v10;
  SearchResult *v11;
  void *v12;
  void *v13;
  SearchFieldItem *v14;
  SearchResult *v15;
  DirectionItem *v16;
  char *v17;
  uint64_t v18;
  DirectionItem *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[2];
  SearchFieldItem *v26;

  v7 = a4;
  if (v7)
  {
    v8 = a5;
    v9 = -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop");
    v10 = objc_alloc_init(SearchFieldItem);
    if (v9)
    {
      v11 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v7);
      -[SearchFieldItem setSearchResult:](v10, "setSearchResult:", v11);

      v26 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      -[SearchFieldItem setSearchResult:](v10, "setSearchResult:", v13);

      v14 = objc_alloc_init(SearchFieldItem);
      v15 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v7);
      -[SearchFieldItem setSearchResult:](v14, "setSearchResult:", v15);

      v25[0] = v10;
      v25[1] = v14;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

    }
    v16 = [DirectionItem alloc];
    v17 = (char *)objc_msgSend(v8, "integerValue");

    if ((unint64_t)(v17 - 1) < 4)
      v18 = (uint64_t)(v17 + 1);
    else
      v18 = 1;
    v19 = -[DirectionItem initWithItems:transportType:](v16, "initWithItems:transportType:", v12, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop", CFSTR("DirectionsRestoreCamera"), CFSTR("DirectionsSessionInitiatorKey"), CFSTR("AppendDirectionItem"), &__kCFBooleanTrue, &off_10126F100)));
    v24[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, &v23, 3));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v22, "placeCardViewController:doDirectionItem:userInfo:", self, v19, v21);

  }
}

- (void)placeViewController:(id)a3 didSelectDirectionsForDestinationAddress:(id)a4 contact:(id)a5 transportType:(id)a6
{
  id v9;
  id v10;
  id v11;
  AddressBookAddress *v12;
  SearchResult *v13;
  void *v14;
  SearchResult *v15;
  unsigned int v16;
  SearchFieldItem *v17;
  SearchResult *v18;
  void *v19;
  void *v20;
  SearchFieldItem *v21;
  SearchResult *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  DirectionItem *v28;
  char *v29;
  uint64_t v30;
  DirectionItem *v31;
  void *v32;
  void *v33;
  void *v34;
  SearchResult *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  SearchFieldItem *v39;

  v9 = a4;
  if (v9 && a5)
  {
    v10 = a6;
    v11 = a5;
    v12 = -[AddressBookAddress initWithContact:addressValue:]([AddressBookAddress alloc], "initWithContact:addressValue:", v11, v9);

    v13 = [SearchResult alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress generatedMapItem](v12, "generatedMapItem"));
    v15 = -[SearchResult initWithMapItem:](v13, "initWithMapItem:", v14);

    v16 = -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop");
    v17 = objc_alloc_init(SearchFieldItem);
    if (v16)
    {
      v18 = -[SearchResult initWithSearchResult:address:]([SearchResult alloc], "initWithSearchResult:address:", v15, v12);
      -[SearchFieldItem setSearchResult:](v17, "setSearchResult:", v18);

      v39 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      -[SearchFieldItem setSearchResult:](v17, "setSearchResult:", v20);

      v21 = objc_alloc_init(SearchFieldItem);
      v35 = v15;
      v22 = -[SearchResult initWithSearchResult:address:]([SearchResult alloc], "initWithSearchResult:address:", v15, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAutocompletePerson sharedLocationLabelIdentifier](_TtC4Maps22MapsAutocompletePerson, "sharedLocationLabelIdentifier"));
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "autocompletePerson"));
        -[SearchResult setAutocompletePerson:](v22, "setAutocompletePerson:", v27);

      }
      -[SearchFieldItem setSearchResult:](v21, "setSearchResult:", v22);
      v38[0] = v17;
      v38[1] = v21;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));

      v15 = v35;
    }

    v28 = [DirectionItem alloc];
    v29 = (char *)objc_msgSend(v10, "integerValue");

    if ((unint64_t)(v29 - 1) < 4)
      v30 = (uint64_t)(v29 + 1);
    else
      v30 = 1;
    v31 = -[DirectionItem initWithItems:transportType:](v28, "initWithItems:transportType:", v19, v30);
    v36[0] = CFSTR("DirectionsRestoreCamera");
    v36[1] = CFSTR("DirectionsSessionInitiatorKey");
    v37[0] = &__kCFBooleanTrue;
    v37[1] = &off_10126F100;
    v36[2] = CFSTR("AppendDirectionItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop")));
    v37[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v34, "placeCardViewController:doDirectionItem:userInfo:", self, v31, v33);

  }
}

- (void)placeViewController:(id)a3 didSelectRouteToCurrentSearchResultWithTransportTypePreference:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (char *)objc_msgSend(v6, "integerValue");
    if ((unint64_t)(v8 - 1) < 4)
      v9 = (uint64_t)(v8 + 1);
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[PlaceCardViewController _routeToCurrentSearchResultWithTransportType:](self, "_routeToCurrentSearchResultWithTransportType:", v9);

}

- (id)shareItemSource
{
  void *v3;
  MKMapItem *updatedCurrentLocation;
  MKMapItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchResult *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  id v33;
  void *v34;
  void *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  if (objc_msgSend(v3, "isCurrentLocation"))
  {
    updatedCurrentLocation = self->_updatedCurrentLocation;
    if (updatedCurrentLocation)
    {
      v5 = updatedCurrentLocation;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v5 = (MKMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForCurrentLocationIncludingPrintActivity:withBackingMapItem:](ShareItem, "shareItemForCurrentLocationIncludingPrintActivity:withBackingMapItem:", 1, v5));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      v10 = [SearchResult alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      v5 = -[SearchResult initWithMapItem:](v10, "initWithMapItem:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
      -[MKMapItem setAddress:](v5, "setAddress:", v13);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
    if (v14
      && (v15 = (void *)v14,
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address")),
          v16,
          v15,
          v16))
    {
      v17 = objc_alloc_init((Class)CNMutableContact);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
      objc_msgSend(v17, "setContactType:", objc_msgSend(v18, "contactType"));

      if (!objc_msgSend(v17, "contactType"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "namePrefix"));
        objc_msgSend(v17, "setNamePrefix:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "givenName"));
        objc_msgSend(v17, "setGivenName:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "familyName"));
        objc_msgSend(v17, "setFamilyName:", v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "nameSuffix"));
        objc_msgSend(v17, "setNameSuffix:", v26);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v17, 0));
      if (objc_msgSend(v17, "contactType") == (id)1 || !objc_msgSend(v27, "length"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "organizationName"));
        objc_msgSend(v17, "setOrganizationName:", v29);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "addressValue"));

      if (v31)
      {
        v36 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
        objc_msgSend(v17, "setPostalAddresses:", v32);

      }
      v33 = objc_msgSend(v17, "copy");

    }
    else
    {
      v33 = (id)objc_claimAutoreleasedReturnValue(-[MKMapItem unknownContact](v5, "unknownContact"));
    }
    if (sub_1002A8AA0(self) == 5)
      v34 = &__NSArray0__struct;
    else
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController createShareSheetFooterActions](self->_placeViewController, "createShareSheetFooterActions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:applicationActivities:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:applicationActivities:", v5, v33, 1, v34));

  }
  return v9;
}

- (id)activityViewControllerForPlaceViewController:(id)a3
{
  PlaceCardViewControllerDelegate **p_placeCardDelegate;
  id WeakRetained;
  char v6;
  id v7;
  MapsActivityViewController *v8;
  MapsActivityViewController *v9;
  void *v10;
  void *v11;
  void *v12;

  p_placeCardDelegate = &self->_placeCardDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "activityViewControllerForPlaceViewController:");

  if ((v6 & 1) == 0
    || (v7 = objc_loadWeakRetained((id *)p_placeCardDelegate),
        v8 = (MapsActivityViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityViewControllerForPlaceViewController:", self)),
        v7,
        !v8))
  {
    v9 = [MapsActivityViewController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController shareItemSource](self, "shareItemSource"));
    v8 = -[MapsActivityViewController initWithShareItem:](v9, "initWithShareItem:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
    -[MapsActivityViewController setMapsActivityDelegate:](v8, "setMapsActivityDelegate:", v12);

  }
  return v8;
}

- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3
{
  PlaceCardViewControllerDelegate **p_placeCardDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  p_placeCardDelegate = &self->_placeCardDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "overriddenInterfaceStyleForPlaceViewControllerSubviews:");

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_placeCardDelegate);
  v8 = objc_msgSend(v7, "overriddenInterfaceStyleForPlaceViewControllerSubviews:", self);

  return (int64_t)v8;
}

- (void)_routeToCurrentSearchResultWithTransportType:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  unsigned int v8;
  SearchFieldItem *v9;
  void *v10;
  void *v11;
  SearchFieldItem *v12;
  void *v13;
  SearchResult *v14;
  void *v15;
  SearchResult *v16;
  void *v17;
  SearchResult *v18;
  void *v19;
  SearchResult *v20;
  DirectionItem *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  SearchFieldItem *v28;
  uint8_t buf[4];
  const __CFString *v30;

  v5 = sub_100813C78();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4)
      v7 = CFSTR("Undefined");
    else
      v7 = *(&off_1011CA0B0 + a3 - 1);
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Routing to current search result with transport type: %@", buf, 0xCu);
  }

  v8 = -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop");
  v9 = objc_alloc_init(SearchFieldItem);
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
    if (v10)
    {
      -[SearchFieldItem setSearchResult:](v9, "setSearchResult:", v10);
    }
    else
    {
      v14 = [SearchResult alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
      v16 = -[SearchResult initWithMapItem:](v14, "initWithMapItem:", v15);
      -[SearchFieldItem setSearchResult:](v9, "setSearchResult:", v16);

    }
    v28 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v9, "setSearchResult:", v11);

    v12 = objc_alloc_init(SearchFieldItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
    if (v13)
    {
      -[SearchFieldItem setSearchResult:](v12, "setSearchResult:", v13);
    }
    else
    {
      v18 = [SearchResult alloc];
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
      v20 = -[SearchResult initWithMapItem:](v18, "initWithMapItem:", v19);
      -[SearchFieldItem setSearchResult:](v12, "setSearchResult:", v20);

    }
    v27[0] = v9;
    v27[1] = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));

  }
  v21 = -[DirectionItem initWithItems:transportType:]([DirectionItem alloc], "initWithItems:transportType:", v17, a3);
  if (+[PlaceCardViewController shouldInsertRecentPOIForRouting](PlaceCardViewController, "shouldInsertRecentPOIForRouting"))
  {
    -[PlaceCardViewController insertInHistory](self, "insertInHistory");
  }
  v25[0] = CFSTR("DirectionsRestoreCamera");
  v25[1] = CFSTR("DirectionsSessionInitiatorKey");
  v26[0] = &__kCFBooleanTrue;
  v26[1] = &off_10126F100;
  v25[2] = CFSTR("AppendDirectionItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PlaceCardViewController isAdditionalStop](self, "isAdditionalStop")));
  v26[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v24, "placeCardViewController:doDirectionItem:userInfo:", self, v21, v23);

}

- (void)_routeFromCurrentSearchResult
{
  id v3;
  NSObject *v4;
  SearchFieldItem *v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  SearchResult *v9;
  DirectionItem *v10;
  SearchFieldItem *v11;
  void *v12;
  DirectionItem *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = sub_100813C78();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Routing from current search result", v16, 2u);
  }

  v5 = objc_alloc_init(SearchFieldItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
  if (v6)
  {
    -[SearchFieldItem setSearchResult:](v5, "setSearchResult:", v6);
  }
  else
  {
    v7 = [SearchResult alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
    v9 = -[SearchResult initWithMapItem:](v7, "initWithMapItem:", v8);
    -[SearchFieldItem setSearchResult:](v5, "setSearchResult:", v9);

  }
  v10 = [DirectionItem alloc];
  v19[0] = v5;
  v11 = objc_opt_new(SearchFieldItem);
  v19[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v13 = -[DirectionItem initWithItems:transportType:](v10, "initWithItems:transportType:", v12, 0);

  if (+[PlaceCardViewController shouldInsertRecentPOIForRouting](PlaceCardViewController, "shouldInsertRecentPOIForRouting"))
  {
    -[PlaceCardViewController insertInHistory](self, "insertInHistory");
  }
  v17[0] = CFSTR("DirectionsRestoreCamera");
  v17[1] = CFSTR("DirectionsSessionInitiatorKey");
  v18[0] = &__kCFBooleanTrue;
  v18[1] = &off_10126F100;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v15, "placeCardViewController:doDirectionItem:userInfo:", self, v13, v14);

}

- (void)placeViewControllerDidUpdateHeight:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_shouldFetchDraggableViews)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v6 = objc_msgSend(v5, "isIntermediateMapItem");

    v4 = v8;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController draggableContent](self->_placeViewController, "draggableContent"));
      -[PlaceCardViewController setDraggableContent:](self, "setDraggableContent:", v7);

      v4 = v8;
    }
  }

}

- (id)secondaryButtonControllerForPlaceViewController:(id)a3
{
  return -[PlaceCardViewController _secondaryButtonController](self, "_secondaryButtonController", a3);
}

- (id)alternatePrimaryButtonControllerForPlaceViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Plan Route [Place Card]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("From Here[Place Card]"), CFSTR("localized string not found"), 0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1008140E0;
    v11[3] = &unk_1011BAB10;
    objc_copyWeak(&v12, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_MKPlaceActionButtonController actionButtonControllerWithTitle:subTitle:selectedBlock:](_MKPlaceActionButtonController, "actionButtonControllerWithTitle:subTitle:selectedBlock:", v6, v8, v11));
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)headerActionItems
{
  return -[MUPlaceViewController createMenuActions](self->_placeViewController, "createMenuActions");
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  -[MUPlaceViewController performAction:options:completion:](self->_placeViewController, "performAction:options:completion:", a3, a4, a5);
}

- (id)menuElementForActionItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id obj;
  void *v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  void *v49;
  _BYTE v50[128];

  v4 = a3;
  v33 = v4;
  if (objc_msgSend(v4, "type") == (id)16)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 1));
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "type") == (id)21)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionsNotContainingMapItem:", v32));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_initWeak(&location, self);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
          v15 = (void *)v14;
          v42[0] = _NSConcreteStackBlock;
          if (v14)
            v16 = (const __CFString *)v14;
          else
            v16 = &stru_1011EB268;
          v42[1] = 3221225472;
          v42[2] = sub_10081473C;
          v42[3] = &unk_1011ACEC0;
          objc_copyWeak(&v43, &location);
          v42[4] = v13;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v42));

          objc_msgSend(v35, "addObject:", v17);
          objc_destroyWeak(&v43);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v10);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Place Card] New Guide…"), CFSTR("localized string not found"), 0));

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10081477C;
    v39[3] = &unk_1011ACEC0;
    objc_copyWeak(&v41, &location);
    v20 = v32;
    v40 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v19, 0, 0, v39));
    v49 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v22));

    objc_msgSend(v35, "addObject:", v23);
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Library] Add to a Guide"), CFSTR("localized string not found"), 0));
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Place Card] Save to Guide"), CFSTR("localized string not found"), 0));
    }
    v29 = (void *)v25;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v29, v35));
    objc_destroyWeak(&v41);

    objc_destroyWeak(&location);
  }
  else
  {
    if (objc_msgSend(v4, "type") != (id)2)
    {
      v36.receiver = self;
      v36.super_class = (Class)PlaceCardViewController;
      v28 = -[InfoCardViewController menuElementForActionItem:](&v36, "menuElementForActionItem:", v4);
      v5 = objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_3;
    }
    objc_initWeak(&location, self);
    if (GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Placecard Menu] Report Something Missing"), CFSTR("localized string not found"), 0));
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Menu] Add to Maps"), CFSTR("localized string not found"), 0));
    }
    v30 = (void *)v27;

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10081488C;
    v37[3] = &unk_1011AF8A0;
    objc_copyWeak(&v38, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v30, 0, 0, v37));
    objc_destroyWeak(&v38);

    objc_destroyWeak(&location);
  }
LABEL_25:

  return v6;
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  -[InfoCardViewController rebuildHeaderViewButtons](self, "rebuildHeaderViewButtons", a3, a4);
  -[InfoCardViewController rebuildHeaderMenu](self, "rebuildHeaderMenu");
}

- (void)placeCardCollectionMembershipProviderDidUpdate:(id)a3
{
  -[PlaceCardViewController _updateCollectionsAnimated:](self, "_updateCollectionsAnimated:", 1);
}

- (unint64_t)_collectionsCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardCollectionMembershipProvider containingCollections](self->_collectionMembershipProvider, "containingCollections"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)placeViewController:(id)a3 collectionViewsForPlaceItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  double y;
  double width;
  double height;
  void *v14;
  void *v15;
  TwoLinesContentView *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem", a3));
  if (v5)
  {
    v21 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardCollectionMembershipProvider containingCollections](self->_collectionMembershipProvider, "containingCollections"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);
          if (sub_1002A8AA0(self) == 5)
          {
            v16 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForCollection:](TwoLinesContentViewModelComposer, "cellModelForCollection:", v15));
            -[TwoLinesContentView setViewModel:](v16, "setViewModel:", v17);

          }
          else
          {
            v16 = -[CollectionView initWithCollectionViewSize:]([CollectionView alloc], "initWithCollectionViewSize:", 0);
            -[TwoLinesContentView setCollectionInfo:](v16, "setCollectionInfo:", v15);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v18);

          v14 = (char *)v14 + 1;
        }
        while (v9 != v14);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }
    v19 = objc_msgSend(v6, "copy");

    v5 = v21;
  }
  else
  {
    v19 = &__NSDictionary0__struct;
  }

  return v19;
}

- (id)placeViewController:(id)a3 webPlacecardGuidesForPlaceItem:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  UIImage *v13;
  NSData *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem", a3));
  if (v5)
  {
    v24 = v5;
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardCollectionMembershipProvider containingCollections](self->_collectionMembershipProvider, "containingCollections"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v13 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image", v24));
          v14 = UIImagePNGRepresentation(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          v16 = objc_alloc((Class)MUPersonalGuideViewModel);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
          v19 = objc_msgSend(v12, "numberOfItems");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
          v21 = objc_msgSend(v16, "initWithGuideID:title:numberOfPlaces:image:", v17, v18, v19, v20);

          objc_msgSend(v6, "addObject:", v21);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }
    v22 = objc_msgSend(v6, "copy", v24);

    v5 = v25;
  }
  else
  {
    v22 = &__NSArray0__struct;
  }

  return v22;
}

- (void)placeViewController:(id)a3 didSelectAddToCollectionWithPlaceActionEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CollectionAddOrRemoveSession *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));

  v10 = -[CollectionSaveSession initWithMapItem:]([CollectionAddOrRemoveSession alloc], "initWithMapItem:", v9);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100814ED0;
  v14[3] = &unk_1011C9ED8;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v15 = v11;
  -[CollectionEditSession setAnalyticsHandler:](v10, "setAnalyticsHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "placeCardViewController:pickCollectionWithSession:sourceView:sourceRect:", self, v10, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)placeViewController:(id)a3 selectCollectionIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardCollectionMembershipProvider containingCollectionWithIdentifer:](self->_collectionMembershipProvider, "containingCollectionWithIdentifer:", a4));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v5, "placeCardViewController:showCollection:", self, v6);

  }
}

- (void)_addPlaceToCollection:(id)a3 editCollection:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1008151C0;
  v18[3] = &unk_1011C9F28;
  v10 = v6;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  v23 = a4;
  v12 = v9;
  v21 = v12;
  objc_copyWeak(&v22, &location);
  v13 = objc_retainBlock(v18);
  if (objc_msgSend(v11, "_maps_canRenameCollectionItem"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1008153A8;
    v15[3] = &unk_1011AFAB0;
    v16 = v11;
    v17 = v13;
    objc_msgSend(v14, "placeCardViewController:editNameOfMapItem:saveHandler:cancelHandler:", self, v16, v15, 0);

  }
  else
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_updateCollectionsAnimated:(BOOL)a3
{
  -[MUPlaceViewController updateCollectionViewsAnimated:](self->_placeViewController, "updateCollectionViewsAnimated:", a3);
  -[MUPlaceViewController setPlaceInCollections:](self->_placeViewController, "setPlaceInCollections:", -[PlaceCardViewController _collectionsCount](self, "_collectionsCount") != 0);
  -[MUPlaceViewController updateActionRowView](self->_placeViewController, "updateActionRowView");
  -[InfoCardViewController rebuildHeaderMenu](self, "rebuildHeaderMenu");
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  -[MUPlaceViewController updateCuratedCollectionsView](self->_placeViewController, "updateCuratedCollectionsView", a3);
}

- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (v8)
    -[MUPlaceViewController updatePlaceEnrichment](self->_placeViewController, "updatePlaceEnrichment");
}

- (void)_updateRAPInReviewStatus
{
  -[MUPlaceViewController setPlaceNumberOfReportsInReview:](self->_placeViewController, "setPlaceNumberOfReportsInReview:", -[PlaceCardViewController _numberOfRAPsInReview](self, "_numberOfRAPsInReview"));
  -[MUPlaceViewController updatePlaceInfo](self->_placeViewController, "updatePlaceInfo");
}

- (unint64_t)_numberOfRAPsInReview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];

  if (!_MKRAPIsAvailable(self))
    return 0;
  if ((sub_1003DDB84() & 1) != 0)
    return 0;
  if (!MapsFeature_IsEnabled_RAPSydney())
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_identifier"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rapHistory"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008155F4;
  v11[3] = &unk_1011C9F50;
  v11[4] = self;
  v7 = sub_10039E080(v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "count");

  return (unint64_t)v9;
}

- (id)placeViewControllerUserIcon:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userIcon"));

  return v4;
}

- (void)placeViewController:(id)a3 selectCuratedCollection:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v6, "placeCardViewController:showCuratedCollection:", self, v5);

}

- (void)placeViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v6, "placeCardViewController:selectExploreGuidesWithGuideLocation:", self, v5);

}

- (void)placeViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v12, "placeCardViewController:seeAllCollections:usingTitle:usingCollectionIds:", self, v11, v10, v9);

}

- (id)curatedCollectionSyncCoordinator
{
  return +[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager");
}

- (void)inlinePOIEnrichmentController:(id)a3 requestsPresentationOfPhotosWithCoordinator:(id)a4
{
  -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", a4, 0);
}

- (void)inlinePOIEnrichmentController:(id)a3 didSelectTermsOfServiceURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v6, "placeCardViewController:openURL:", self, v5);

}

- (void)callToActionViewProviderInitialLoadingStateDidChange:(id)a3
{
  -[PlaceCardViewController _updatePlacecardCallToActionAnimated:](self, "_updatePlacecardCallToActionAnimated:", 1);
}

- (void)callToActionViewProviderDidFinishResolvingEditState:(id)a3
{
  -[PlaceCardViewController _updatePlacecardCallToActionAnimated:](self, "_updatePlacecardCallToActionAnimated:", 1);
}

- (void)callToActionViewProviderDidFinishClearingExistingState:(id)a3
{
  -[PlaceCardViewController _updatePlacecardCallToActionAnimated:](self, "_updatePlacecardCallToActionAnimated:", 0);
}

- (void)_updatePlacecardCallToActionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach(self))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider submissionStatusAppearance](self->_callToActionViewProvider, "submissionStatusAppearance"));
    if (MapsFeature_IsEnabled_SydneyARP(v7, v5))
    {
      -[UGCSuggestionViewProvider setSubmissionStatus:](self->_suggestionViewProvider, "setSubmissionStatus:", v7);
      -[UGCInlinePOIEnrichmentController setSubmissionStatus:](self->_inlineRatingsController, "setSubmissionStatus:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider lookupResult](self->_callToActionViewProvider, "lookupResult"));
      -[UGCInlinePOIEnrichmentController setLookupResult:](self->_inlineRatingsController, "setLookupResult:", v6);

    }
    -[MUPlaceViewController updateViewsWithSubmissionStatus:animated:](self->_placeViewController, "updateViewsWithSubmissionStatus:animated:", v7, v3);

  }
}

- (void)callToActionViewProviderDidUpdateWithPreferredUserUploadedPhoto:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5
{
  -[MUPlaceViewController updateUserSubmissionWithPhotoURL:photoID:numberOfPhotos:](self->_placeViewController, "updateUserSubmissionWithPhotoURL:photoID:numberOfPhotos:", a3, a4, a5);
}

- (void)placeViewControllerDidSelectSeeMorePhotos:(id)a3 withStartingIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:withStartingIndex:](UGCPOIEnrichmentCoordinator, "photoThumbnailGalleryCoordinatorWithMapItem:withStartingIndex:", v6, a4));

  -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v7, 0);
}

- (void)placeViewController:(id)a3 didSelectAddPhotosWithPresentationOptions:(id)a4 entryPoint:(int64_t)a5 originTarget:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v9 = a6;
  if (MapsFeature_IsEnabled_LagunaBeach(v9))
  {
    if (a5 == 1)
      v10 = 1;
    else
      v10 = 2 * (a5 == 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:](UGCPOIEnrichmentCoordinator, "photoEmphasizedAddCoordinatorWithMapItem:preferredSourceType:originTarget:", v12, v10, v9));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sourceView"));
    objc_msgSend(v13, "setAnchoringView:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "progressObserver"));
    -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v13, v15);

  }
}

- (void)placeViewController:(id)a3 didSelectEditSubmissionWithPresentationOptions:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (MapsFeature_IsEnabled_LagunaBeach(v9))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:entryPoint:originTarget:](UGCPOIEnrichmentCoordinator, "ratingsAndPhotosCoordinatorWithMapItem:entryPoint:originTarget:", v6, 0, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "progressObserver"));
    -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v7, v8);

  }
}

- (void)placeViewController:(id)a3 didSelectAddRatingsWithPresentationOptions:(id)a4 overallState:(int64_t)a5 originTarget:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a6;
  if (MapsFeature_IsEnabled_LagunaBeach(v9))
  {
    if (a5 == 1)
      v10 = 1;
    else
      v10 = 2 * (a5 == 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:](UGCPOIEnrichmentCoordinator, "ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:", v12, v10, 0, v9));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "progressObserver"));
    -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v13, v14);

  }
}

- (void)_presentPOIEnrichmentCoordinator:(id)a3 presentingViewController:(id)a4 progressObserver:(id)a5 dismissalDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_photoViewerScene)
    +[MacPlacePhotoViewerScene teardownCurrentScene](MacPlacePhotoViewerScene, "teardownCurrentScene");
  objc_msgSend(v15, "setPresentingViewController:", v10);
  objc_msgSend(v15, "setSubmissionLookupObserver:", v11);
  objc_msgSend(v15, "setPlaceCardDismissalDelegate:", v12);
  objc_msgSend(v15, "setSubmissionStatusDelegate:", self);
  objc_msgSend(v15, "setPresentationContext:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider lookupResult](self->_callToActionViewProvider, "lookupResult"));
  objc_msgSend(v15, "setSubmissionLookupResult:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v14, "placeCardViewController:presentPOIEnrichmentWithCoordinator:", self, v15);

}

- (void)_presentPOIEnrichmentCoordinator:(id)a3 withProgressObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topMostPresentedViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDismissalDelegate](self, "placeCardDismissalDelegate"));
  -[PlaceCardViewController _presentPOIEnrichmentCoordinator:presentingViewController:progressObserver:dismissalDelegate:](self, "_presentPOIEnrichmentCoordinator:presentingViewController:progressObserver:dismissalDelegate:", v7, v8, v6, v9);

}

- (void)poiEnrichmentCoordinator:(id)a3 didUpdateUserConsent:(BOOL)a4
{
  -[UGCCallToActionViewProvider resolveForUserEdit](self->_callToActionViewProvider, "resolveForUserEdit", a3, a4);
}

- (void)poiEnrichmentCoordinatorDidUpdateUserSubmission:(id)a3
{
  -[UGCCallToActionViewProvider resolveForUserEdit](self->_callToActionViewProvider, "resolveForUserEdit", a3);
}

- (void)poiEnrichmentCoordinator:(id)a3 didFinishSubmissionLookup:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(v6, "status");
  if (v5 == (id)1)
  {
    -[UGCCallToActionViewProvider updateWithFetchedLookupResult:](self->_callToActionViewProvider, "updateWithFetchedLookupResult:", v6);
  }
  else if (v5 == (id)3)
  {
    -[UGCCallToActionViewProvider resolveForUserEdit](self->_callToActionViewProvider, "resolveForUserEdit");
  }

}

- (void)_updateCallToActionStateIfNeeded
{
  UGCCallToActionViewProvider *v3;
  UGCCallToActionViewProvider *callToActionViewProvider;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (MapsFeature_IsEnabled_LagunaBeach(self))
  {
    if (!self->_callToActionViewProvider)
    {
      v3 = -[UGCCallToActionViewProvider initWithDelegate:]([UGCCallToActionViewProvider alloc], "initWithDelegate:", self);
      callToActionViewProvider = self->_callToActionViewProvider;
      self->_callToActionViewProvider = v3;

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider mapItem](self->_callToActionViewProvider, "mapItem"));

    if (v6 != v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      -[UGCCallToActionViewProvider setMapItem:](self->_callToActionViewProvider, "setMapItem:", v9);

    }
    -[UGCCallToActionViewProvider setAlwaysRefinesUserSubmission:](self->_callToActionViewProvider, "setAlwaysRefinesUserSubmission:", self->_inlineRatingsController != 0);
  }
}

- (void)_submitInlineRatingsIfNeeded
{
  -[UGCInlinePOIEnrichmentController submitForCurrentState](self->_inlineRatingsController, "submitForCurrentState");
}

- (id)inlineRatingViewControllerForPlaceViewController:(id)a3
{
  void *v4;
  UGCInlinePOIEnrichmentController *inlineRatingsController;
  void *v6;
  void *v7;
  UGCInlinePOIEnrichmentController *v8;
  UGCInlinePOIEnrichmentController *v9;
  UGCInlinePOIEnrichmentController *v10;
  void *v11;
  UGCInlinePOIEnrichmentController *v12;
  UGCInlinePOIEnrichmentController *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem", a3));

  if (v4)
  {
    inlineRatingsController = self->_inlineRatingsController;
    if (!inlineRatingsController)
      goto LABEL_6;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController mapItem](inlineRatingsController, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));

    if (v6 != v7)
    {
      -[PlaceCardViewController _submitInlineRatingsIfNeeded](self, "_submitInlineRatingsIfNeeded");
      v8 = self->_inlineRatingsController;
      self->_inlineRatingsController = 0;

    }
    v9 = self->_inlineRatingsController;
    if (!v9)
    {
LABEL_6:
      v10 = [UGCInlinePOIEnrichmentController alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
      v12 = -[UGCInlinePOIEnrichmentController initWithMapItem:](v10, "initWithMapItem:", v11);
      v13 = self->_inlineRatingsController;
      self->_inlineRatingsController = v12;

      -[UGCInlinePOIEnrichmentController setDelegate:](self->_inlineRatingsController, "setDelegate:", self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
      -[UGCInlinePOIEnrichmentController setAnalyticsController:](self->_inlineRatingsController, "setAnalyticsController:", v14);

      -[UGCInlinePOIEnrichmentController setPresentingViewController:](self->_inlineRatingsController, "setPresentingViewController:", self);
      -[PlaceCardViewController _updateCallToActionStateIfNeeded](self, "_updateCallToActionStateIfNeeded");
      -[PlaceCardViewController _updatePlacecardCallToActionAnimated:](self, "_updatePlacecardCallToActionAnimated:", 0);
      v9 = self->_inlineRatingsController;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCInlinePOIEnrichmentController contentViewController](v9, "contentViewController"));
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)suggestionViewForPlaceViewController:(id)a3
{
  return -[UGCSuggestionViewProvider suggestionView](self->_suggestionViewProvider, "suggestionView", a3);
}

- (void)placeViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v15, "placeCardViewController:showRelatedMapItems:withTitle:originalMapItem:analyticsDelegate:", self, v14, v13, v12, v11);

}

- (void)placeViewController:(id)a3 didRequestHikingToolTipRegionIDForLocation:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  void *v7;
  char v8;
  id v9;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v8 = objc_opt_respondsToSelector(v7, "placeCardViewController:didRequestHikingToolTipRegionIDForLocation:");

  if ((v8 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v9, "placeCardViewController:didRequestHikingToolTipRegionIDForLocation:", self, latitude, longitude);

  }
}

- (id)placeViewController:(id)a3 hikingTipViewForTipModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FeatureDiscoveryModel *v10;
  void *v11;
  void *v12;
  FeatureDiscoveryModel *v13;
  FeatureDiscoveryView *v14;
  uint64_t v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes customSavedRouteDashedStyleAttributes](GEOFeatureStyleAttributes, "customSavedRouteDashedStyleAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  objc_msgSend(v8, "displayScale");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v6, 3, 0));

  v10 = [FeatureDiscoveryModel alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));

  LOBYTE(v16) = 0;
  v13 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v10, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v9, v11, v12, 0, 0, 0, 0, 0, v16);

  v14 = objc_alloc_init(FeatureDiscoveryView);
  -[FeatureDiscoveryView setModel:](v14, "setModel:", v13);

  return v14;
}

- (void)placeViewControllerDidTapHikingTip:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "placeCardViewControllerDidTapHikingTip:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v6, "placeCardViewControllerDidTapHikingTip:", self);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController analyticsDelegate](self, "analyticsDelegate"));
    objc_msgSend(v7, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 465, 0, 0);

  }
}

- (id)_shortcut
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutForMapItem:", v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "meCard"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_shortcutIncludingHiddenForMapItem:", v5));
  }
  v8 = (void *)v6;

  return v8;
}

- (void)placeViewControllerDidSelectAddShortcut:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  _TtC4Maps16MapsFavoriteItem *v10;
  ShortcutEditSession *v11;
  void *v12;
  ShortcutEditSession *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  ShortcutEditSession *v21;
  ShortcutEditSession *shortcutEditSession;
  ShortcutEditSession *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut")),
        v8 = objc_msgSend(v7, "isHidden"),
        v7,
        v6,
        v8))
  {
    if (!self->_shortcutEditSession)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut"));

      if (v9)
      {
        v10 = (_TtC4Maps16MapsFavoriteItem *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut"));
        v11 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v10));
        v12 = 0;
      }
      else
      {
        if ((id)-[PlaceCardLibraryOperationsCoordinator savedStateOfPlace](self->_libraryOperationsCoordinator, "savedStateOfPlace") != (id)1|| (v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator syncObject](self->_libraryOperationsCoordinator, "syncObject")), v15 = objc_opt_class(MSCollectionPlaceItem), isKindOfClass = objc_opt_isKindOfClass(v14, v15), v14, (isKindOfClass & 1) == 0))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
          if (objc_msgSend(v17, "isHomeWorkSchoolAddress"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
            v19 = (unint64_t)objc_msgSend(v18, "addressType");
            if (v19 > 2)
              v20 = 1;
            else
              v20 = qword_100E3BFF8[v19];

          }
          else
          {
            v20 = 1;
          }

          v10 = (_TtC4Maps16MapsFavoriteItem *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
          v13 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(-[MapsFavoriteItem mapItem](v10, "mapItem"));
          v21 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithType:mapItem:](ShortcutEditSession, "addSessionWithType:mapItem:", v20, v13));
          shortcutEditSession = self->_shortcutEditSession;
          self->_shortcutEditSession = v21;

          v12 = 0;
          goto LABEL_17;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator syncObject](self->_libraryOperationsCoordinator, "syncObject"));
        v10 = -[MapsFavoriteItem initWithCollectionItem:]([_TtC4Maps16MapsFavoriteItem alloc], "initWithCollectionItem:", v12);
        v11 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v10));
      }
      v13 = self->_shortcutEditSession;
      self->_shortcutEditSession = v11;
LABEL_17:

      objc_initWeak(&location, self);
      v23 = self->_shortcutEditSession;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1008167F8;
      v25[3] = &unk_1011AC888;
      objc_copyWeak(&v27, &location);
      v24 = v12;
      v26 = v24;
      -[ShortcutEditSession saveWithCompletion:](v23, "saveWithCompletion:", v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

    }
  }

}

- (void)placeViewControllerDidSelectRemoveShortcut:(id)a3
{
  id v4;
  void *v5;
  ShortcutEditSession *v6;
  ShortcutEditSession *shortcutEditSession;
  ShortcutEditSession *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut"));
  if (v5 && !self->_shortcutEditSession)
  {
    v6 = (ShortcutEditSession *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v5));
    shortcutEditSession = self->_shortcutEditSession;
    self->_shortcutEditSession = v6;

    objc_initWeak(&location, self);
    v8 = self->_shortcutEditSession;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100816A24;
    v9[3] = &unk_1011AD4F0;
    objc_copyWeak(&v10, &location);
    -[ShortcutEditSession removeFromShortcutsWithCompletion:](v8, "removeFromShortcutsWithCompletion:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)placeViewControllerDidSelectChangeAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut", a3));
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));
    objc_msgSend(v5, "setEditingModeType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v6, "placeCardViewController:editShortcut:", self, v5);

    v4 = v7;
  }

}

- (void)placeViewControllerDidSelectRefineLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut", a3));
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));
    objc_msgSend(v5, "setEditingModeType:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v6, "placeCardViewController:editShortcut:", self, v5);

    v4 = v7;
  }

}

- (void)_updateShortcut
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _shortcut](self, "_shortcut"));
  v5 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "isHidden") ^ 1;
  else
    v4 = 0;
  -[MUPlaceViewController setPlaceInShortcuts:](self->_placeViewController, "setPlaceInShortcuts:", v4);
  -[InfoCardViewController rebuildHeaderMenu](self, "rebuildHeaderMenu");

}

- (int)mapTypeForPlaceViewController:(id)a3
{
  void *v3;
  id v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v4 = objc_msgSend(v3, "displayedViewMode");
  if ((unint64_t)v4 + 1 > 7)
    v5 = 1;
  else
    v5 = dword_100E3C010[(_QWORD)v4 + 1];

  return v5;
}

- (void)placeViewController:(id)a3 didSelectDepartureSequence:(id)a4 mapItem:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v9, "placeCardViewController:showTransitScheduleForMapItem:departureSequence:", self, v7, v8);

}

- (BOOL)placeViewController:(id)a3 canSelectDepartureSequence:(id)a4 mapItem:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  LOBYTE(self) = objc_msgSend(v9, "placeCardViewController:shouldShowTransitScheduleForMapItem:departureSequence:", self, v7, v8);

  return (char)self;
}

- (void)placeViewController:(id)a3 didSelectTransitLine:(id)a4
{
  id v5;
  IncompleteTransitLineItem *v6;
  void *v7;
  void *v8;
  void *v9;
  IncompleteTransitLineItem *v10;

  v5 = a4;
  v6 = [IncompleteTransitLineItem alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "labelText"));

  v10 = -[IncompleteTransitLineItem initWithIdentifier:name:](v6, "initWithIdentifier:name:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v9, "placeCardViewController:selectTransitLineItem:", self, v10);

}

- (void)placeViewController:(id)a3 openURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v6, "placeCardViewController:openURL:", self, v5);

}

- (void)placeViewController:(id)a3 showTransitIncidents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v6, "placeCardViewController:showTransitIncidents:", self, v5);

}

- (void)placeViewControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v8 = a3;
  v9 = a4;
  if (!v9)
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rapPresenter"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100816FB0;
  v14[3] = &unk_1011B4160;
  v14[4] = self;
  v12 = -[PlaceCardViewController _overriddenUserInterfaceStyle](self, "_overriddenUserInterfaceStyle");
  if (a5)
    v13 = 30;
  else
    v13 = -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  objc_msgSend(v11, "presentReportAProblemFromPlaceCardViewController:editingContext:overriddenUserInterfaceStyle:sourceView:entryPoint:completion:", self, v14, v12, v9, v13, 0);

}

- (void)placeViewController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5
{
  id v7;
  id v8;
  UGCReportImageryController *v9;
  void *v10;
  UGCReportImageryController *v11;
  UGCReportImageryController *reportImageryController;
  UGCReportImageryController *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = a4;
  v9 = [UGCReportImageryController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem mapItem](self->_placeCardItem, "mapItem"));
  v11 = -[UGCReportImageryController initWithMapItem:reportedPhoto:presentingViewController:](v9, "initWithMapItem:reportedPhoto:presentingViewController:", v10, v8, v7);

  reportImageryController = self->_reportImageryController;
  self->_reportImageryController = v11;

  objc_msgSend(v7, "startAnimatingActivityIndicatorViewForRAP");
  v13 = self->_reportImageryController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100817110;
  v15[3] = &unk_1011AE140;
  v16 = v7;
  v14 = v7;
  -[UGCReportImageryController fetchLayoutAndPresentWithCompletion:](v13, "fetchLayoutAndPresentWithCompletion:", v15);

}

- (void)placeViewController:(id)a3 photoGalleryDidScroll:(id)a4
{
  UGCReportImageryController *reportImageryController;
  id v5;

  reportImageryController = self->_reportImageryController;
  v5 = a4;
  -[UGCReportImageryController cancelPresentation](reportImageryController, "cancelPresentation");
  objc_msgSend(v5, "stopAnimatingActivityIndicatorViewForRAP");

}

- (int64_t)_overriddenUserInterfaceStyle
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "overriddenInterfaceStyleForPlaceViewControllerSubviews:");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v6 = objc_msgSend(v5, "overriddenInterfaceStyleForPlaceViewControllerSubviews:", self);

  return (int64_t)v6;
}

- (void)placeViewControllerDidSelectAddAPlace:(id)a3 isQuickAction:(BOOL)a4
{
  PlaceCardItem *placeCardItem;
  id v7;
  _BOOL8 v8;
  PlaceCardItem *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PlaceCardItem *v13;
  int64_t v14;
  void *v15;
  _QWORD v16[4];
  PlaceCardItem *v17;

  placeCardItem = self->_placeCardItem;
  v7 = a3;
  v8 = -[PlaceCardItem isDroppedPin](placeCardItem, "isDroppedPin")
    || -[PlaceCardItem isCurrentLocation](self->_placeCardItem, "isCurrentLocation");
  v9 = self->_placeCardItem;
  if (a4)
    v10 = 30;
  else
    v10 = -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rapPresenter"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100817330;
  v16[3] = &unk_1011B4160;
  v17 = v9;
  v13 = v9;
  v14 = -[PlaceCardViewController _overriddenUserInterfaceStyle](self, "_overriddenUserInterfaceStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  objc_msgSend(v12, "presentAddAPlaceFromPlacecardWithEditingContext:overriddenUserInterfaceStyle:shouldShowDetailedFlow:sourceView:entryPoint:completion:", v16, v14, v8, v15, v10, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 222, v10, 0);

}

- (void)placeViewController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4
{
  PlaceCardItem *v6;
  void *v7;
  void *v8;
  PlaceCardItem *v9;
  _QWORD v10[4];
  PlaceCardItem *v11;

  v6 = self->_placeCardItem;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapPresenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10081743C;
  v10[3] = &unk_1011B4160;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "presentAddMissingDataOfType:fromPlacecardWithEditingContext:", a4, v10);

}

- (void)placeViewController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4
{
  PlaceCardItem *v6;
  void *v7;
  void *v8;
  PlaceCardItem *v9;
  _QWORD v10[4];
  PlaceCardItem *v11;

  v6 = self->_placeCardItem;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapPresenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100817548;
  v10[3] = &unk_1011B4160;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "presentEditPlaceDetailsOfType:fromPlacecardWithEditingContext:", a4, v10);

}

- (void)placeViewControllerDidSelectRAPViewReport:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapPresenter"));
  objc_msgSend(v3, "presentReportAProblemWithCompletion:", 0);

}

- (void)placeViewControllerDidSelectPlaceEnrichmentRAP:(id)a3
{
  PlaceCardItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PlaceCardItem *v8;
  _QWORD v9[4];
  PlaceCardItem *v10;

  v4 = self->_placeCardItem;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rapPresenter"));
  v7 = -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008176A8;
  v9[3] = &unk_1011B4160;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "presentPlaceEnrichmentRAPWithTarget:fromPlacecardWithEditingContext:completion:", v7, v9, 0);

}

- (void)placeViewControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider subscriptionInfo](self->_offlineMapProvider, "subscriptionInfo", a3));
  if (v12)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
      objc_msgSend(v6, "placeCardViewControllerShowOfflineMaps:", self);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      objc_msgSend(v6, "resumeDownloadForSubscriptionInfo:mode:", v12, 1);
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "offlineDownloadRegion"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v11, "placeCardViewController:showOfflineMapRegionSelectorForRegion:name:shouldShowDataManagementAfterDownload:", self, v6, v10, v4);

  }
  -[PlaceCardViewController _clearOfflineDownloadTipIfNeeded](self, "_clearOfflineDownloadTipIfNeeded");

}

- (void)placeViewControllerDidSelectPauseOfflineDownload:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardOfflineMapProvider subscriptionInfo](self->_offlineMapProvider, "subscriptionInfo", a3));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    objc_msgSend(v3, "pauseDownloadForSubscriptionInfo:", v4);

  }
}

- (void)placeViewControllerDidSelectOfflineManagement:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  objc_msgSend(v4, "placeCardViewControllerShowOfflineMaps:", self);

}

- (void)placeViewControllerDidSelectFlyover:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  objc_msgSend(v6, "placeCardViewController:enterFlyoverForMapItem:", self, v5);

}

- (void)placeViewControllerDidSelectDropPin:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  objc_msgSend(v5, "placeCardViewController:createDroppedPin:", self, v4);

}

- (void)placeViewController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v9, "placeCardViewController:enterLookAroundForMapItem:lookAroundView:", self, v8, v7);

}

- (BOOL)shouldMoveLookAroundStorefrontViewForPlaceViewController:(id)a3
{
  return !self->_contentNeedsUpdating;
}

- (void)placeViewControllerDidSelectDisplayedAddress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  objc_msgSend(v4, "placeCardViewController:selectDisplayedAddressFromPlaceCardItem:", self, v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "wantsLayout:", 1);

}

- (void)placeViewControllerDidSelectRemoveMarker:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  objc_msgSend(v5, "placeCardViewController:removeDroppedPin:", self, v6);

}

- (void)placeViewController:(id)a3 didSelectSearchCategory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  objc_msgSend(v8, "placeCardViewController:presentCategoryPlacesListForMapItem:searchCategory:", self, v7, v5);

}

- (void)placeViewController:(id)a3 didSelectParent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v5 = a4;
    if (sub_1002A8AA0(self) != 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      v7 = objc_msgSend(v6, "containerStyle");

      if (v7 == (id)1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v8, "wantsLayout:", 2);

      }
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v9, "placeCardViewController:didSelectParent:", self, v5);

  }
}

- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100817C98;
  v5[3] = &unk_1011AE218;
  v6 = a4;
  v4 = v6;
  +[UIApplication _maps_unlockApplicationWithCompletion:](UIApplication, "_maps_unlockApplicationWithCompletion:", v5);

}

- (void)placeViewControllerDidTapMiniBrowseCategory:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsLayout:", 3);

}

- (void)placeViewController:(id)a3 didSelectShareCurrentLocationWithCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  unsigned __int8 v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, uint64_t);
  id v15;
  id location;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = objc_msgSend(v8, "isAuthorizedForPreciseLocation");

  if ((v9 & 1) != 0)
  {
    v7[2](v7, 1);
  }
  else
  {
    v10 = CFSTR("AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey");
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 56, 690, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100817EF4;
    v13[3] = &unk_1011B0260;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    objc_msgSend(v12, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", v10, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)placeViewController:(id)a3 didSelectMapsExtension:(id)a4 usingAppStoreApp:(id)a5
{
  id v7;
  id v8;
  RestaurantReservationRouter *v9;
  void *v10;
  RestaurantReservationRouter *v11;
  RestaurantReservationRouter *reservationRouter;

  v7 = a5;
  v8 = a4;
  v9 = [RestaurantReservationRouter alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
  v11 = -[RestaurantReservationRouter initWithExtension:appStoreApp:mapItem:presenter:](v9, "initWithExtension:appStoreApp:mapItem:presenter:", v8, v7, v10, self);

  reservationRouter = self->_reservationRouter;
  self->_reservationRouter = v11;

  -[RestaurantReservationRouter resolve](self->_reservationRouter, "resolve");
}

- (void)presentPermissionsController:(id)a3
{
  -[PlaceCardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)placeViewController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 libraryAccessProvider:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator mapItem](self->_libraryOperationsCoordinator, "mapItem"));
  objc_msgSend(v13, "placeCardViewController:didRequestEditingNoteWithInitialText:libraryAccessProvider:placeMUID:completion:", self, v11, v10, objc_msgSend(v12, "_muid"), v9);

}

- (void)placeViewController:(id)a3 didSelectTransitConnectionInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "poiSearchManager"));

  v10 = objc_alloc((Class)MKMapItemIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifier"));
  v12 = objc_msgSend(v10, "initWithGEOMapItemIdentifier:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v14 = objc_msgSend(v13, "newTraits");

  objc_msgSend(v14, "useOnlineToOfflineFailoverRequestModeIfAllowed");
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100818484;
  v15[3] = &unk_1011C9FA0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "searchForIdentifier:allowExpired:traits:completionHandler:", v12, 0, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)placeViewController:(id)a3 didRequestAddOrRemovePlaceFromLibrary:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardLibraryOperationsCoordinator mapItem](self->_libraryOperationsCoordinator, "mapItem", a3));
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", objc_msgSend(v6, "_muid"), v4, 30);

  -[PlaceCardViewController handleAddOrRemovePlaceFromLibrary:](self, "handleAddOrRemovePlaceFromLibrary:", v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  RelatedSearchSuggestionViewController *suggestionViewController;
  id v5;
  objc_super v6;

  suggestionViewController = self->_suggestionViewController;
  v5 = a3;
  -[RelatedSearchSuggestionViewController dismiss](suggestionViewController, "dismiss");
  v6.receiver = self;
  v6.super_class = (Class)PlaceCardViewController;
  -[ContaineeViewController scrollViewWillBeginDragging:](&v6, "scrollViewWillBeginDragging:", v5);

}

- (id)_secondaryButtonController
{
  void *v3;
  int64_t excludedContent;
  void *v5;
  void *v6;
  Block_layout *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  void (*v11)(uint64_t);
  void ***v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void ***v32;
  const __CFString *v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t IsEnabled_MapsWally;
  id v58;
  uint64_t v59;
  id v60;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  _QWORD *v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  void **v81;
  uint64_t v82;
  void **v83;
  uint64_t v84;
  _QWORD v85[4];
  id v86;
  id location;
  _BYTE v88[128];

  if (-[PlaceCardViewController isPresentedInSearchAlongTheRoute](self, "isPresentedInSearchAlongTheRoute"))
  {
    v3 = 0;
    return v3;
  }
  objc_initWeak(&location, self);
  excludedContent = self->_excludedContent;
  if (-[PlaceCardViewController isContact](self, "isContact"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Contacts"), CFSTR("localized string not found"), 0));

    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10081905C;
    v85[3] = &unk_1011BAB10;
    objc_copyWeak(&v86, &location);
    v7 = objc_retainBlock(v85);
    if (MapsFeature_IsEnabled_MapsWally(v7))
    {
      if (-[PlaceCardItem canShowOpenFindMyAction](self->_placeCardItem, "canShowOpenFindMyAction"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Find My"), CFSTR("localized string not found"), 0));

        v10 = (id *)&v84;
        v83 = _NSConcreteStackBlock;
        v11 = sub_1008190B0;
        v12 = &v83;
LABEL_23:
        v6 = (void *)v9;
        v12[1] = (void **)3221225472;
        v12[2] = (void **)v11;
        v12[3] = (void **)&unk_1011BAB10;
        objc_copyWeak(v10, &location);
        v32 = objc_retainBlock(v12);

        objc_destroyWeak(v10);
        v33 = CFSTR("findmy");
        v7 = (Block_layout *)v32;
LABEL_25:
        objc_destroyWeak(&v86);
        v34 = 0;
        v35 = 0;
        goto LABEL_53;
      }
      if (-[PlaceCardItem canShowRequestLocation](self->_placeCardItem, "canShowRequestLocation"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Location"), CFSTR("localized string not found"), 0));

        v10 = (id *)&v82;
        v81 = _NSConcreteStackBlock;
        v11 = sub_1008190DC;
        v12 = &v81;
        goto LABEL_23;
      }
    }
    v33 = CFSTR("person.fill");
    goto LABEL_25;
  }
  if ((excludedContent & 8) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v14 = objc_msgSend(v13, "isDroppedPin");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Move [Marked Location in Place Card]"), CFSTR("localized string not found"), 0));

      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_100819108;
      v79[3] = &unk_1011BAB10;
      objc_copyWeak(&v80, &location);
      v7 = objc_retainBlock(v79);
      objc_destroyWeak(&v80);
LABEL_32:
      v34 = 0;
      v35 = 0;
      v33 = CFSTR("mappin.and.ellipse");
      goto LABEL_53;
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
  if (objc_msgSend(v18, "_hasFlyover"))
  {
    v19 = (self->_excludedContent & 4) == 0;

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
      v21 = objc_msgSend(v20, "supportsARMode");

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Flyover"), CFSTR("localized string not found"), 0));
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Flyover Tour"), CFSTR("localized string not found"), 0));
      }
      v6 = (void *)v23;

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1008191C4;
      v77[3] = &unk_1011BAB10;
      objc_copyWeak(&v78, &location);
      v7 = objc_retainBlock(v77);
      objc_destroyWeak(&v78);
      v34 = 0;
      v35 = 0;
      v33 = CFSTR("buildings.3d");
      goto LABEL_53;
    }
  }
  else
  {

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v25 = objc_msgSend(v24, "isCurrentLocation");

  if (v25)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Mark My Location"), CFSTR("localized string not found"), 0));
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Drop Pin"), CFSTR("localized string not found"), 0));
    }
    v6 = (void *)v27;

    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100819280;
    v75[3] = &unk_1011C9FC8;
    objc_copyWeak(&v76, &location);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10081931C;
    v73[3] = &unk_1011C9FF0;
    v73[4] = self;
    v74 = objc_retainBlock(v75);
    v44 = v74;
    v7 = objc_retainBlock(v73);

    objc_destroyWeak(&v76);
    goto LABEL_32;
  }
  if ((excludedContent & 8) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v29 = objc_msgSend(v28, "isHomeWorkSchoolAddress");

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Move [Marked Location in Place Card]"), CFSTR("localized string not found"), 0));

      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100819578;
      v71[3] = &unk_1011BAB10;
      objc_copyWeak(&v72, &location);
      v7 = objc_retainBlock(v71);
      objc_destroyWeak(&v72);
      goto LABEL_32;
    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "chargeStationWaypointInfo"));

  if (!v37)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    if (objc_msgSend(v45, "isMeCard"))
    {

    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "_quickLinks"));
      v50 = objc_msgSend(v49, "count") == 0;

      if (!v50)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController mapItem](self, "mapItem"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_quickLinks"));

        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
        if (v53)
        {
          v54 = *(_QWORD *)v68;
LABEL_44:
          v55 = 0;
          while (1)
          {
            if (*(_QWORD *)v68 != v54)
              objc_enumerationMutation(v52);
            v56 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v55);
            if (objc_msgSend(v56, "type") == (id)1)
              break;
            if (v53 == (id)++v55)
            {
              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
              if (v53)
                goto LABEL_44;
              goto LABEL_50;
            }
          }
          v34 = v56;

          if (v34)
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v34, "title"));
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1008195D4;
            v64[3] = &unk_1011B8E00;
            objc_copyWeak(&v66, &location);
            v63 = (id)v34;
            v65 = v63;
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[_MKPlaceActionButtonController actionButtonControllerWithTitle:subTitle:selectedBlock:](_MKPlaceActionButtonController, "actionButtonControllerWithTitle:subTitle:selectedBlock:", v62, 0, v64));

            objc_destroyWeak(&v66);
            v7 = 0;
            v35 = 0;
            v6 = 0;
            goto LABEL_62;
          }
          v7 = 0;
          goto LABEL_52;
        }
LABEL_50:

      }
    }
    v7 = 0;
    v34 = 0;
LABEL_52:
    v33 = 0;
    v35 = 0;
    v6 = 0;
    goto LABEL_53;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "chargeStationWaypointInfo"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "chargeInfo"));
  objc_msgSend(v40, "chargingTime");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", (unint64_t)v41, 1));

  v34 = v42 != 0;
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("EV_Routing_stop_added"), CFSTR("localized string not found"), 0));

    if (sub_1002A8AA0(self) == 5)
    {
      v35 = v42;
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("EV_Routing_charge_duration"), CFSTR("localized string not found"), 0));
      v35 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v42));

    }
    v33 = CFSTR("bolt.car.fill");
  }
  else
  {
    v33 = 0;
    v35 = 0;
    v6 = 0;
  }

  v7 = &stru_1011CA030;
LABEL_53:
  IsEnabled_MapsWally = MapsFeature_IsEnabled_MapsWally(v16);
  if ((_DWORD)IsEnabled_MapsWally)
  {
    IsEnabled_MapsWally = -[PlaceCardItem canShowOpenFindMyAction](self->_placeCardItem, "canShowOpenFindMyAction");
    if ((_DWORD)IsEnabled_MapsWally)
    {
      v58 = objc_alloc((Class)_MKPlaceActionButtonController);
      v59 = 403;
LABEL_59:
      v60 = objc_msgSend(v58, "initWithTitle:subTitle:analyticsAction:selectedBlock:disabled:symbolName:", v6, v35, v59, v7, v34, v33);
      goto LABEL_61;
    }
  }
  if (MapsFeature_IsEnabled_MapsWally(IsEnabled_MapsWally)
    && -[PlaceCardItem canShowRequestLocation](self->_placeCardItem, "canShowRequestLocation"))
  {
    v58 = objc_alloc((Class)_MKPlaceActionButtonController);
    v59 = 405;
    goto LABEL_59;
  }
  v60 = (id)objc_claimAutoreleasedReturnValue(+[_MKPlaceActionButtonController actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:](_MKPlaceActionButtonController, "actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:", v6, v35, v7, v34, v33));
LABEL_61:
  v3 = v60;
LABEL_62:
  objc_destroyWeak(&location);

  return v3;
}

- (void)_instrumentHeaderButtonAction:(int)a3 withFeedbackType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
  objc_msgSend(v6, "instrumentAction:forModuleType:usingFeedbackType:", v5, 2, v4);

}

- (void)_chromeViewControllerPresent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)viewContact
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));

  if (MapsFeature_IsEnabled_MapsWally(v6))
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "postalAddresses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011CA070));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));
    objc_msgSend(v7, "setPostalAddresses:", v10);

    v11 = objc_msgSend(v7, "copy");
    v5 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v5));
  objc_msgSend(v12, "setDelegate:", self);
  v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismissContactsViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
  objc_msgSend(v14, "setBackBarButtonItem:", v13);

  objc_msgSend(v12, "setModalPresentationStyle:", 3);
  objc_msgSend(v12, "setDisplayMode:", 1);
  v15 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v12);
  if (sub_1002A8AA0(self) == 5)
  {
    objc_msgSend(v15, "setModalPresentationStyle:", 2);
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100819A0C;
    v16[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, &location);
    v17 = v15;
    -[PlaceCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PlaceCardViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v15, 1, 0);
  }

}

- (void)openFindMy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, int);
  void *v17;
  id v18;
  id v19;
  id location[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "openFindMyURL"));

  if (v6)
  {
    objc_initWeak(location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100819C70;
    v17 = &unk_1011AC888;
    objc_copyWeak(&v19, location);
    v18 = v6;
    objc_msgSend(v7, "_maps_openURL:options:completionHandler:", v18, 0, &v14);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController analyticsDelegate](self, "analyticsDelegate", v14, v15, v16, v17));
    objc_msgSend(v8, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 403, 0, 0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    v9 = sub_100431DCC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchResult"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autocompletePerson"));
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error opening the find my app, missing handle Identifier for person: %@", (uint8_t *)location, 0xCu);

    }
  }

}

- (void)openRequestLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, int);
  void *v17;
  PlaceCardViewController *v18;
  id v19;
  id location[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestLocationURL"));

  if (v6)
  {
    objc_initWeak(location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100819F4C;
    v17 = &unk_1011AC888;
    objc_copyWeak(&v19, location);
    v18 = self;
    objc_msgSend(v7, "_maps_openURL:options:completionHandler:", v6, 0, &v14);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController analyticsDelegate](self, "analyticsDelegate", v14, v15, v16, v17));
    objc_msgSend(v8, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 405, 0, 0);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    v9 = sub_100431DCC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchResult"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autocompletePerson"));
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error opening messages app, missing request location Identifier for person: %@", (uint8_t *)location, 0xCu);

    }
  }

}

- (void)searchFindMyFriendDidRemoveHandleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autocompletePerson"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardItem searchResult](self->_placeCardItem, "searchResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "autocompletePerson"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "handle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handleIdentifier"));

    if (objc_msgSend(v4, "isEqualToString:", v11))
    {
      v12 = sub_100431DCC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found a placecard representing the handle that was removed", buf, 2u);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10081A1B8;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (void)dismissContactsViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10081A330;
    v8[3] = &unk_1011AD260;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PlaceCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)isContact
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isMeCard
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  if ((objc_msgSend(v4, "isMeCard") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v5 = objc_msgSend(v6, "isHomeWorkSchoolAddress");

  }
  return v5;
}

- (void)appStoreAppSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MUPlaceViewController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue")));
  objc_msgSend(v5, "placeCardViewController:displayStoreViewControllerForAppWithiTunesIdentifier:", self, v7);

  if (-[MUPlaceViewController conformsToProtocol:](self->_placeViewController, "conformsToProtocol:", &OBJC_PROTOCOL____MKInfoCardAnalyticsDelegate))v9 = self->_placeViewController;
  else
    v9 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iOSBundleIdentifier"));

  -[MUPlaceViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](v9, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", 45, 733, v8, 0, 0);
}

- (void)presentQuickLink:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  PlaceCardViewController *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLString"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v4);
    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
      -[NSObject placeCardViewController:openURL:](v6, "placeCardViewController:openURL:", self, v5);
    }
    else
    {
      v7 = sub_100431DCC();
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The URL associated with quicklink %@ is nil", (uint8_t *)&v8, 0xCu);
      }
    }

  }
}

- (void)presentAppClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PlaceCardViewController *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appClipURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKClipServices sharedInstance](MKClipServices, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10081A6E4;
  v8[3] = &unk_1011B2EA8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "requestAppClip:completion:", v4, v8);

}

- (void)presentExtensionFlowController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setContentUpdateDelegate:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)presentAppStoreApp:(id)a3
{
  -[PlaceCardViewController appStoreAppSelected:](self, "appStoreAppSelected:", a3);
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  -[PlaceCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  AddressBookAddress *v19;
  void *v20;
  id v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "postalAddresses"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v21 = v4;
    obj = v5;
    v8 = *(_QWORD *)v25;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "address"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addressValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
      v16 = objc_msgSend(v11, "isEqual:", v15);

      if ((v16 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          goto LABEL_3;
        v4 = v21;
        v5 = obj;
        goto LABEL_12;
      }
    }
    v17 = v10;

    v4 = v21;
    if (!v17)
      goto LABEL_13;
    v18 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithContact:", v21);
    v19 = -[AddressBookAddress initWithContact:addressValue:]([AddressBookAddress alloc], "initWithContact:addressValue:", v21, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    objc_msgSend(v20, "placeCardViewController:selectMapItem:address:", self, v18, v19);

    v5 = v17;
  }
LABEL_12:

LABEL_13:
}

- (void)setDraggableContent:(id)a3
{
  NSArray *v4;
  NSMapTable *draggableContentInteractions;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  void *v22;
  NSArray *v23;
  NSArray *draggableContent;
  NSMapTable *v25;
  NSMapTable *v26;
  NSArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSArray *v37;
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
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = (NSArray *)a3;
  if (self->_draggableContent != v4)
  {
    draggableContentInteractions = self->_draggableContentInteractions;
    if (draggableContentInteractions)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](draggableContentInteractions, "keyEnumerator"));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_draggableContentInteractions, "objectForKey:", v11));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
            objc_msgSend(v13, "removeInteraction:", v11);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v8);
      }

      -[NSMapTable removeAllObjects](self->_draggableContentInteractions, "removeAllObjects");
      v14 = self->_draggableContentInteractions;
      self->_draggableContentInteractions = 0;

    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "interactions"));

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
          objc_msgSend(v22, "removeInteraction:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v18);
    }

    v23 = (NSArray *)-[NSArray copy](v4, "copy");
    draggableContent = self->_draggableContent;
    self->_draggableContent = v23;

    if (self->_draggableContent)
    {
      v37 = v4;
      v25 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
      v26 = self->_draggableContentInteractions;
      self->_draggableContentInteractions = v25;

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v27 = self->_draggableContent;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        do
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)k);
            v33 = objc_msgSend(objc_alloc((Class)UIDragInteraction), "initWithDelegate:", self);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
            objc_msgSend(v34, "addInteraction:", v33);

            -[NSMapTable setObject:forKey:](self->_draggableContentInteractions, "setObject:forKey:", v32, v33);
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        }
        while (v29);
      }

      v4 = v37;
      if (sub_1002A8AA0(self) != 5 && -[NSArray count](self->_draggableContent, "count"))
      {
        v35 = objc_msgSend(objc_alloc((Class)UIDragInteraction), "initWithDelegate:", self);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
        objc_msgSend(v36, "addInteraction:", v35);

      }
    }
  }

}

- (void)updatePreviewDrag
{
  DragAndDropPreview *previewView;
  void *v4;
  UIDragSession *currentDragSession;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  if (self->_currentDragSession)
  {
    previewView = self->_previewView;
    if (previewView)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](previewView, "renderPreviewImage"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10081AF68;
      v9[3] = &unk_1011B28B0;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dragPreview"));
      currentDragSession = self->_currentDragSession;
      v6 = v10;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIDragSession items](currentDragSession, "items"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      objc_msgSend(v8, "setPreviewProvider:", v9);

    }
  }
}

- (id)targetedDragPreviewForInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
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
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  double MidX;
  id v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  id v43;
  CGPoint v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));

  if (v5 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    v9 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_draggableContentInteractions, "objectForKey:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v9 = objc_msgSend(v7, "isHeader");

  }
  v10 = objc_alloc_init((Class)UIDragPreviewParameters);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController theme](self, "theme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "controlBackgroundColor"));
  objc_msgSend(v10, "setBackgroundColor:", v12);

  if (v9)
  {
    if (-[InfoCardViewController isShowingFullHeader](self, "isShowingFullHeader"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController draggableHeaderView](self->_placeViewController, "draggableHeaderView"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 0));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      objc_msgSend(v15, "setHideActionButtons:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
      objc_msgSend(v16, "setHideActionButtons:", 0);

    }
    v8 = v13;
    objc_msgSend(v14, "frame");
    v18 = v17;
    objc_msgSend(v14, "frame");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v21, "_cornerRadius");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v24, "_cornerRadius");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, 0.0, 0.0, v18, v20, v23, v26));
    objc_msgSend(v10, "setVisiblePath:", v27);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotViewAfterScreenUpdates:", 0));
  }
  v28 = v14;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  if (v29)
  {
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "convertRect:toView:", v29);
    objc_msgSend(v28, "setFrame:");
    v30 = objc_alloc((Class)UIDragPreviewTarget);
    objc_msgSend(v28, "frame");
    MidX = CGRectGetMidX(v46);
    objc_msgSend(v28, "frame");
    v32 = objc_msgSend(v30, "initWithContainer:center:", v29, MidX, CGRectGetMidY(v47));
    objc_msgSend(v29, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v32, "center");
    v45.x = v41;
    v45.y = v42;
    v48.origin.x = v34;
    v48.origin.y = v36;
    v48.size.width = v38;
    v48.size.height = v40;
    if (CGRectContainsPoint(v48, v45))
      v43 = objc_msgSend(objc_alloc((Class)UITargetedDragPreview), "initWithView:parameters:target:", v28, v10, v32);
    else
      v43 = 0;

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  DragAndDropPreview *v18;
  void *v19;
  void *v20;
  DragAndDropPreview *v21;
  DragAndDropPreview *previewView;
  void *v23;
  void *v24;
  MapsAnalyticsHelper *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  PlaceCardDragContext *v38;
  MapsAnalyticsHelper *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  v7 = objc_msgSend(v6, "canStartNewDrag");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController titleHeaderView](self, "titleHeaderView"));

    if (v8 == v9)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapItem"));

      v12 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
      v14 = 0;
      v13 = 1501;
      if (v11)
        goto LABEL_4;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_draggableContentInteractions, "objectForKey:", v5));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "draggableContent"));
      v12 = v10;
      v13 = (uint64_t)objc_msgSend(v12, "analyticsTarget");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));

      if (v11)
      {
LABEL_4:
        v15 = objc_opt_class(MKMapItem);
        v41 = v14;
        if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:", v11));
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemProviderWriting"));

          v18 = [DragAndDropPreview alloc];
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "traitCollection"));
          v21 = -[DragAndDropPreview initWithDragAndDropMapItem:traitCollection:](v18, "initWithDragAndDropMapItem:traitCollection:", v16, v20);
          previewView = self->_previewView;
          self->_previewView = v21;

          -[DragAndDropPreview setContentUpdateDelegate:](self->_previewView, "setContentUpdateDelegate:", self);
          v40 = (MapsAnalyticsHelper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "analyticsHelper"));
          v11 = (void *)v17;
        }
        else
        {
          v25 = [MapsAnalyticsHelper alloc];
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapItem"));
          v40 = -[MapsAnalyticsHelper initWithMapItem:](v25, "initWithMapItem:", v26);

        }
        v27 = v13;

        v28 = objc_opt_class(NSURL);
        if ((objc_opt_isKindOfClass(v11, v28) & 1) != 0)
        {
          v29 = v11;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mapItem"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
          v33 = (id)objc_claimAutoreleasedReturnValue(+[NSItemProvider itemProviderWithURL:title:](NSItemProvider, "itemProviderWithURL:title:", v29, v32));

        }
        else
        {
          v33 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v11);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mapItem"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
        objc_msgSend(v33, "setSuggestedName:", v36);

        v37 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v33);
        v38 = objc_opt_new(PlaceCardDragContext);
        -[PlaceCardDragContext setContent:](v38, "setContent:", v12);
        -[PlaceCardDragContext setAnalyticsTarget:](v38, "setAnalyticsTarget:", v27);
        -[PlaceCardDragContext setAnalyticsHelper:](v38, "setAnalyticsHelper:", v40);
        v14 = v41;
        if (sub_1002A8AA0(self) == 5 && v41)
        {
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10081B724;
          v42[3] = &unk_1011B28B0;
          v43 = v41;
          objc_msgSend(v37, "setPreviewProvider:", v42);

        }
        objc_msgSend(v37, "setLocalObject:", v38);
        v44 = v37;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));

        goto LABEL_17;
      }
    }
    v23 = &__NSArray0__struct;
LABEL_17:

    goto LABEL_18;
  }
  v23 = &__NSArray0__struct;
LABEL_18:

  return v23;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return -[PlaceCardViewController targetedDragPreviewForInteraction:](self, "targetedDragPreviewForInteraction:", a3, a4, a5);
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10081B7AC;
  v5[3] = &unk_1011AFA20;
  v5[4] = self;
  objc_msgSend(a4, "addCompletion:", v5);
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  MapsDragLocalContext *v6;
  void *v7;
  void *v8;
  void *v9;
  MapsDragLocalContext *v10;
  UIDragSession *currentDragSession;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  v6 = [MapsDragLocalContext alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = -[MapsDragLocalContext initWithWindowScene:](v6, "initWithWindowScene:", v9);
  objc_msgSend(v5, "setLocalContext:", v10);

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v5;
  v12 = v5;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v13, "setDragSession:", v12);

  -[PlaceCardViewController updatePreviewDrag](self, "updatePreviewDrag");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "items"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localObject"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "analyticsHelper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));

  v18 = objc_msgSend(v15, "analyticsTarget");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "eventValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionDetails"));
  objc_msgSend(v17, "captureUserAction:onTarget:eventValue:placeActionDetails:", 17001, v18, v19, v20);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIDragSession *currentDragSession;
  void *v16;
  DragAndDropPreview *previewView;
  id v18;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsHelper"));
  if (a5 == 2)
  {
    v10 = 17003;
    goto LABEL_5;
  }
  if (!a5)
  {
    v10 = 17002;
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v12 = objc_msgSend(v8, "analyticsTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionDetails"));
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:placeActionDetails:", v10, v12, v13, v14);

  }
  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v16, "setDragSession:", 0);

  previewView = self->_previewView;
  self->_previewView = 0;

}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  return -[PlaceCardViewController targetedDragPreviewForInteraction:](self, "targetedDragPreviewForInteraction:", a3, a4, a5);
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2022, -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2023, -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pdSuggestion"));
  -[PlaceCardViewController _searchWithSuggestion:](self, "_searchWithSuggestion:", v4);

}

- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4 >= 3)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %lu)"), a4, v8));
  else
    v6 = *(&off_1011CA0D8 + a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 2021, -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), v6);

}

- (id)suggestionViewController
{
  RelatedSearchSuggestionViewController *suggestionViewController;
  RelatedSearchSuggestionViewController *v4;
  void *v5;
  void *v6;
  RelatedSearchSuggestionViewController *v7;

  suggestionViewController = self->_suggestionViewController;
  if (!suggestionViewController)
  {
    v4 = objc_alloc_init(RelatedSearchSuggestionViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController view](v4, "view"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RelatedSearchSuggestionViewController setDelegate:](v4, "setDelegate:", self);
    -[RelatedSearchSuggestionViewController willMoveToParentViewController:](v4, "willMoveToParentViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController view](self, "view"));
    objc_msgSend(v6, "addSubview:", v5);

    -[PlaceCardViewController addChildViewController:](self, "addChildViewController:", v4);
    -[RelatedSearchSuggestionViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
    -[PlaceCardViewController _setupConstraintsForSuggestionView:](self, "_setupConstraintsForSuggestionView:", v5);
    v7 = self->_suggestionViewController;
    self->_suggestionViewController = v4;

    suggestionViewController = self->_suggestionViewController;
  }
  return suggestionViewController;
}

- (void)_initSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedSearchSuggestion"));

  if (v11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController suggestionViewController](self, "suggestionViewController"));
    objc_msgSend(v5, "setSuggestion:", v11);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController suggestionViewController](self, "suggestionViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);

    -[PlaceCardViewController _updateSuggestionVisibility](self, "_updateSuggestionVisibility");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayString"));
    objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 2019, v9, v10);

  }
}

- (void)_searchWithSuggestion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  SearchFieldItem *v9;

  if (a3)
  {
    v4 = a3;
    v9 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSuggestion:](v9, "setSuggestion:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardDelegate);
    objc_msgSend(WeakRetained, "placeCardViewController:doSearchItem:withUserInfo:", self, v9, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = -[PlaceCardViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayString"));

    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2020, v7, v8);
  }
}

- (void)_setupConstraintsForSuggestionView:(id)a3
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = _NSDictionaryOfVariableBindings(CFSTR("suggestionView"), a3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[suggestionView]-0-|"), 0, 0, v7));
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[suggestionView]-0@250-|"), 0, 0, v7));
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
}

- (void)_updateSuggestionVisibility
{
  RelatedSearchSuggestionViewController *suggestionViewController;
  void *v3;
  _BOOL8 v4;
  RelatedSearchSuggestionViewController *v5;

  suggestionViewController = self->_suggestionViewController;
  if (suggestionViewController)
  {
    v5 = suggestionViewController;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionViewController suggestion](v5, "suggestion"));
    v4 = v3 == 0;

    -[RelatedSearchSuggestionViewController setHidden:animated:](v5, "setHidden:animated:", v4, 1);
  }
}

- (unint64_t)preferredPresentationStyle
{
  return 3;
}

- (void)_updatePopoverCoordinate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  CLLocationCoordinate2D v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    objc_msgSend(v6, "_presentCoordinate");
    v7 = CLLocationCoordinate2DIsValid(v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
    v10 = v9;
    if (v7)
      objc_msgSend(v9, "_presentCoordinate");
    else
      objc_msgSend(v9, "_coordinate");
    v13 = v11;
    v14 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController macPopoverPresentationController](self, "macPopoverPresentationController"));
    objc_msgSend(v15, "setCoordinate:", v13, v14);

    v25 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    objc_msgSend(v25, "calloutAnchorRect");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[InfoCardViewController macPopoverPresentationController](self, "macPopoverPresentationController"));
    objc_msgSend(v24, "setAnchorRect:", v17, v19, v21, v23);

  }
}

- (void)placeViewController:(id)a3 requestsDismissingPresentingViewControllerWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v9 = sub_1002A8AA0(v7);

  if (v9 == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDelegate](self, "placeCardDelegate"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10081C2E8;
    v12[3] = &unk_1011ACAD0;
    v14 = v6;
    v13 = v8;
    objc_msgSend(v10, "placeCardViewController:dismissAnimated:completion:", self, 1, v12);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topMostPresentedViewController"));
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

  }
}

- (void)placeViewController:(id)a3 didFinishDismissingViewController:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (sub_1002A8AA0(a3) == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    -[PlaceCardViewController didDismissViewController:mapItem:](self, "didDismissViewController:mapItem:", v8, v7);

  }
}

- (void)placeViewController:(id)a3 didRequestSceneActivationForPhotoGalleryViewController:(id)a4
{
  id v5;
  MacPlacePhotoViewerScene *v6;
  MacPlacePhotoViewerScene *photoViewerScene;
  MacPlacePhotoViewerConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  MacPlacePhotoViewerScene *v12;
  void *v13;
  MacPlacePhotoViewerConfiguration *v14;

  v5 = a4;
  v6 = (MacPlacePhotoViewerScene *)objc_claimAutoreleasedReturnValue(+[MacPlacePhotoViewerScene requestSceneActivation](MacPlacePhotoViewerScene, "requestSceneActivation"));
  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = v6;

  v8 = [MacPlacePhotoViewerConfiguration alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  v14 = -[MacPlacePhotoViewerConfiguration initWithMapItem:photoGalleryViewController:](v8, "initWithMapItem:photoGalleryViewController:", v10, v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCCallToActionViewProvider lookupResult](self->_callToActionViewProvider, "lookupResult"));
  -[MacPlacePhotoViewerConfiguration setUserSubmissionLookupResult:](v14, "setUserSubmissionLookupResult:", v11);

  v12 = self->_photoViewerScene;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  -[MacPlacePhotoViewerScene openPhotoGalleryWithConfiguration:sceneDelegate:delegate:](v12, "openPhotoGalleryWithConfiguration:sceneDelegate:delegate:", v14, v13, self);

}

- (void)placeViewController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator photoThumbnailGalleryCoordinatorWithMapItem:albumIndex:](UGCPOIEnrichmentCoordinator, "photoThumbnailGalleryCoordinatorWithMapItem:albumIndex:", v7, a4));

  -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v8, 0);
}

- (void)placePhotoViewerSceneWillDisconnect:(id)a3
{
  MacPlacePhotoViewerScene *photoViewerScene;

  photoViewerScene = self->_photoViewerScene;
  self->_photoViewerScene = 0;

}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardDismissalDelegate](self, "placeCardDismissalDelegate"));
  objc_msgSend(v8, "didDismissViewController:mapItem:", v7, v6);

}

- (MKMapItem)mapItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCardViewController placeCardItem](self, "placeCardItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));

  return (MKMapItem *)v3;
}

- (void)suggestionViewProviderDidUpdateView:(id)a3
{
  MUPlaceViewController *placeViewController;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach(v7))
  {
    -[MUPlaceViewController updateSuggestionView](self->_placeViewController, "updateSuggestionView");
    placeViewController = self->_placeViewController;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestionViewModelForWebPlacecard"));
    -[MUPlaceViewController updateWebPlacecardSuggestionViewWithViewModel:](placeViewController, "updateWebPlacecardSuggestionViewWithViewModel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
    objc_msgSend(v6, "instrumentAction:forModuleType:usingFeedbackType:", 339, 3, 0);

  }
}

- (void)suggestionViewProviderDidSelectAddPhotos:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach(v7))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:entryPoint:originTarget:](UGCPOIEnrichmentCoordinator, "ratingsAndPhotosCoordinatorWithMapItem:entryPoint:originTarget:", v4, 2, CFSTR("PLACECARD_ARP_SUGGESTION")));

    objc_msgSend(v5, "setEntryPointRequiresARPPrivacyScreenIfNeeded:", 1);
    -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
    objc_msgSend(v6, "instrumentAction:target:eventValue:moduleType:feedbackType:", 300, 201, CFSTR("Suggestion"), 3, 0);

  }
}

- (void)suggestionViewProviderDidSelectRateThisPlace:(id)a3 overallState:(int64_t)a4
{
  int IsEnabled_LagunaBeach;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  IsEnabled_LagunaBeach = MapsFeature_IsEnabled_LagunaBeach(v12);
  v7 = v12;
  if (IsEnabled_LagunaBeach)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentCoordinator ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:](UGCPOIEnrichmentCoordinator, "ratingsAndPhotosCoordinatorWithMapItem:initialOverallState:entryPoint:originTarget:", v8, a4, 2, CFSTR("PLACECARD_ARP_SUGGESTION")));

    -[PlaceCardViewController _presentPOIEnrichmentCoordinator:withProgressObserver:](self, "_presentPOIEnrichmentCoordinator:withProgressObserver:", v9, 0);
    if ((unint64_t)a4 > 2)
      v10 = 0;
    else
      v10 = dword_100E3C030[a4];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
    objc_msgSend(v11, "instrumentAction:target:eventValue:moduleType:feedbackType:", v10, 201, CFSTR("Suggestion"), 3, 0);

    v7 = v12;
  }

}

- (BOOL)suggestionViewProviderIsPlacePinned:(id)a3
{
  return -[PlaceCardLibraryOperationsCoordinator isPinned](self->_libraryOperationsCoordinator, "isPinned", a3);
}

- (void)instrumentDismissAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MUPlaceViewController analyticsController](self->_placeViewController, "analyticsController"));
  objc_msgSend(v2, "instrumentAction:forModuleType:usingFeedbackType:", 4, 1, 0);

}

- (PlaceCardItem)placeCardItem
{
  return self->_placeCardItem;
}

- (int64_t)excludedContent
{
  return self->_excludedContent;
}

- (PlaceCardViewControllerDelegate)placeCardDelegate
{
  return (PlaceCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeCardDelegate);
}

- (void)setPlaceCardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardDelegate, a3);
}

- (PlaceCardDismissable)placeCardDismissalDelegate
{
  return (PlaceCardDismissable *)objc_loadWeakRetained((id *)&self->_placeCardDismissalDelegate);
}

- (void)setPlaceCardDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardDismissalDelegate, a3);
}

- (BOOL)isAdditionalStop
{
  return self->_isAdditionalStop;
}

- (BOOL)isPresentedInSearchAlongTheRoute
{
  return self->_isPresentedInSearchAlongTheRoute;
}

- (BOOL)shouldPresentSecondaryActionWhenReady
{
  return self->_shouldPresentSecondaryActionWhenReady;
}

- (void)setShouldPresentSecondaryActionWhenReady:(BOOL)a3
{
  self->_shouldPresentSecondaryActionWhenReady = a3;
}

- (LookAroundActionCoordination)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void)setActionCoordinator:(id)a3
{
  self->_actionCoordinator = (LookAroundActionCoordination *)a3;
}

- (BOOL)isMapItemInFavorites
{
  return self->_isMapItemInFavorites;
}

- (void)setIsMapItemInFavorites:(BOOL)a3
{
  self->_isMapItemInFavorites = a3;
}

- (NSArray)draggableContent
{
  return self->_draggableContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggableContent, 0);
  objc_destroyWeak((id *)&self->_placeCardDismissalDelegate);
  objc_destroyWeak((id *)&self->_placeCardDelegate);
  objc_storeStrong((id *)&self->_placeCardItem, 0);
  objc_storeStrong((id *)&self->_collectionMembershipProvider, 0);
  objc_storeStrong((id *)&self->_mapsSyncPlaceItemMapStorageUpdater, 0);
  objc_storeStrong((id *)&self->_libraryOperationsCoordinator, 0);
  objc_storeStrong((id *)&self->_friendshipCoordinator, 0);
  objc_storeStrong((id *)&self->_offlineMapProvider, 0);
  objc_storeStrong((id *)&self->_inlineRatingsController, 0);
  objc_storeStrong((id *)&self->_reservationRouter, 0);
  objc_storeStrong((id *)&self->_photoViewerScene, 0);
  objc_storeStrong((id *)&self->_reportImageryController, 0);
  objc_storeStrong((id *)&self->_suggestionViewProvider, 0);
  objc_storeStrong((id *)&self->_callToActionViewProvider, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_draggableContentInteractions, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_updatedCurrentLocation, 0);
  objc_storeStrong((id *)&self->_placeViewController, 0);
}

@end
