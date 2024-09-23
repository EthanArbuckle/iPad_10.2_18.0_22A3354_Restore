@implementation BSUIFeedViewController

- (BSUIFeedViewController)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BSUIFeedViewController *v7;
  BSUIDynamicValue *v8;
  BSUIDynamicValue *v9;
  BSUIDynamicValue *currentStackName;
  JSAFeedController *v11;
  JSAFeedController *jsFeedController;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BSUIContextMenuProviding *contextMenuProvider;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BSUIAsyncContextMenuProviding *asyncContextMenuProvider;
  BSUIFeedTriggerBlockObserver *v21;
  BSUIFeedTriggerBlockObserver *feedTriggerObserver;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  BSUICardAuxiliaryNavigationBarManager *v28;
  BSUICardAuxiliaryNavigationBarManager *cardAuxiliaryNavigationBarManager;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  dispatch_queue_attr_t v34;
  NSObject *v35;
  dispatch_queue_attr_t v36;
  NSObject *v37;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v39;
  dispatch_queue_t v40;
  OS_dispatch_queue *deferredReloadsQueue;
  uint64_t v42;
  NSMutableSet *deferredEngagementMessageIdentifiers;
  void *v44;
  id v45;
  objc_super v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate factory](BSUITemplate, "factory"));
  v47.receiver = self;
  v47.super_class = (Class)BSUIFeedViewController;
  v7 = -[BSUIFeedViewController initWithFeedContent:manager:factory:](&v47, "initWithFeedContent:manager:factory:", 0, v5, v6);

  if (v7)
  {
    v8 = [BSUIDynamicValue alloc];
    v9 = -[BSUIDynamicValue initWithValue:options:](v8, "initWithValue:options:", TUIFeedContentDefaultStackName, &off_2FBAC8);
    currentStackName = v7->_currentStackName;
    v7->_currentStackName = v9;

    v7->_contentInsetAdjustmentBehavior = 0;
    v11 = (JSAFeedController *)objc_msgSend(objc_alloc(-[BSUIFeedViewController jsaFeedControllerClass](v7, "jsaFeedControllerClass")), "initWithOptions:completion:", v4, 0);
    jsFeedController = v7->_jsFeedController;
    v7->_jsFeedController = v11;

    -[JSAFeedController setDataSource:](v7->_jsFeedController, "setDataSource:", v7);
    -[JSAFeedController setDelegate:](v7->_jsFeedController, "setDelegate:", v7);
    v7->_preferredLargeTitleDisplayMode = -[JSAFeedController isRootFeed](v7->_jsFeedController, "isRootFeed");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextMenuProvider")));
    v14 = BUProtocolCast(&OBJC_PROTOCOL___BSUIContextMenuProviding, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    contextMenuProvider = v7->_contextMenuProvider;
    v7->_contextMenuProvider = (BSUIContextMenuProviding *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextMenuProvider")));
    v18 = BUProtocolCast(&OBJC_PROTOCOL___BSUIAsyncContextMenuProviding, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    asyncContextMenuProvider = v7->_asyncContextMenuProvider;
    v7->_asyncContextMenuProvider = (BSUIAsyncContextMenuProviding *)v19;

    if (v7->_contextMenuProvider && v7->_asyncContextMenuProvider)
      -[BSUIFeedViewController setContextMenuConfigurationProvider:](v7, "setContextMenuConfigurationProvider:", v7);
    v21 = objc_alloc_init(BSUIFeedTriggerBlockObserver);
    feedTriggerObserver = v7->_feedTriggerObserver;
    v7->_feedTriggerObserver = v21;

    -[BSUIFeedViewController setDelegate:](v7, "setDelegate:", v7);
    -[BSUIFeedViewController _feedMetadataDidUpdate](v7, "_feedMetadataDidUpdate");
    v23 = objc_opt_class(NSNumber);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInCard")));
    v25 = BUDynamicCast(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_msgSend(v26, "BOOLValue");

    -[BSUIFeedViewController setIsInCard:](v7, "setIsInCard:", v27);
    if ((v27 & 1) != 0)
    {
      v28 = objc_alloc_init(BSUICardAuxiliaryNavigationBarManager);
      cardAuxiliaryNavigationBarManager = v7->_cardAuxiliaryNavigationBarManager;
      v7->_cardAuxiliaryNavigationBarManager = v28;

    }
    else
    {
      -[BSUIFeedViewController loadEntries](v7, "loadEntries");
    }
    v30 = objc_opt_class(NSNumber);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deferUIUpdateUntilInitialContentReady")));
    v32 = BUDynamicCast(v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v7->_deferUIUpdateUntilInitialContentReady = objc_msgSend(v33, "BOOLValue");

    if (-[BSUIFeedViewController deferUIUpdateUntilInitialContentReady](v7, "deferUIUpdateUntilInitialContentReady"))
    {
      v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v36 = dispatch_queue_attr_make_with_qos_class(v35, QOS_CLASS_USER_INITIATED, 0);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      initially_inactive = dispatch_queue_attr_make_initially_inactive(v37);
      v39 = objc_claimAutoreleasedReturnValue(initially_inactive);
      v40 = dispatch_queue_create("com.apple.iBooks.BSUIFeedVC.deferredReloads", v39);
      deferredReloadsQueue = v7->_deferredReloadsQueue;
      v7->_deferredReloadsQueue = (OS_dispatch_queue *)v40;

      v42 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      deferredEngagementMessageIdentifiers = v7->_deferredEngagementMessageIdentifiers;
      v7->_deferredEngagementMessageIdentifiers = (NSMutableSet *)v42;

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v45 = -[BSUIFeedViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v44, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v7;
}

+ (void)createAsync:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_40CC4;
  v13[3] = &unk_2E5A28;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v16 = a1;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_41138;
      v11[3] = &unk_2E3F88;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

}

+ (void)createAsyncWithNavigationController:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_41264;
  v13[3] = &unk_2E5A28;
  v16 = a1;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_41384;
      v11[3] = &unk_2E3F88;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }

}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  unsigned int v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  char v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "bc_userInterfaceStyleDark");

  if (v5)
    v6 = 1;
  else
    v6 = 3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBarTintColor"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navigationBar"));
    objc_msgSend(v12, "_titleOpacity");
    v14 = v13;

    if (v14 <= 0.5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationBar"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tintColor"));
      objc_msgSend(v17, "bc_brightness");
      v19 = v18;

      if (v19 > 0.7)
        v6 = 1;
      else
        v6 = 3;
    }
  }
  else
  {

  }
  v20 = _os_feature_enabled_impl("Books", "unifiedProductPage");
  if (-[BSUIFeedViewController isInCard](self, "isInCard"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "viewControllers"));
    if (objc_msgSend(v22, "count") != (char *)&dword_0 + 1)
      v20 = 0;

    if ((v20 & 1) != 0)
      return 0;
  }
  return v6;
}

- (void)viewDidLoad
{
  int64_t contentInsetAdjustmentBehavior;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *notificationObservers;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;
  void *v25;

  v24.receiver = self;
  v24.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewDidLoad](&v24, "viewDidLoad");
  if (!-[BSUIFeedViewController isInCard](self, "isInCard"))
    -[BSUIFeedViewController showLoadingViewForFeedController:]_0(self);
  contentInsetAdjustmentBehavior = self->_contentInsetAdjustmentBehavior;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", contentInsetAdjustmentBehavior);

  if (self->_wantsTransparentNavigationBar)
    sub_4184C(self);
  if (self->_deferredAdjustBottomContentInset)
    -[BSUIFeedViewController _manuallyAdjustBottomContentInset](self, "_manuallyAdjustBottomContentInset");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
  objc_msgSend(v5, "addContentObserver:", self);

  -[BSUIFeedViewController setupAMSEngagementObservers](self, "setupAMSEngagementObservers");
  -[BSUIFeedViewController loadEntries](self, "loadEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardContentScrollManager](self, "cardContentScrollManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "cardContentViewController:initializeManagerWithScrollView:", self, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  -[BSUIFeedViewController setViewSizeWhenNotifiedBottomReached:](self, "setViewSizeWhenNotifiedBottomReached:", v9, v10);

  -[BSUIFeedViewController _updateBackgroundColor:](self, "_updateBackgroundColor:", 0);
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_418E4;
  v21 = &unk_2E5A50;
  objc_copyWeak(&v22, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", UIApplicationWillEnterForegroundNotification, 0, v12, &v18));

  v25 = v13;
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1, v18, v19, v20, v21));
  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
  -[BSUIFeedViewController setLastTwoLineTitleFixed:](self, "setLastTwoLineTitleFixed:", v17);

  -[BSUIFeedViewController _feedMetadataDidUpdate](self, "_feedMetadataDidUpdate");
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (_BYTE)showLoadingViewForFeedController:(_BYTE *)result
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "isViewLoaded") & 1) == 0)
      BUHaltDebugger();
    v1[24] = 1;
    return objc_msgSend(v1, "setNeedsUpdateContentUnavailableConfiguration");
  }
  return result;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (-[BSUIFeedViewController isInCard](self, "isInCard", a3, a4))
  {
    v5 = objc_opt_class(BSUICardNavigationController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v7 = BUDynamicCast(v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);

    if (objc_msgSend(v8, "isCurrentCard"))
      -[BSUIFeedViewController didBecomeVisibleContentScrollView](self, "didBecomeVisibleContentScrollView");

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewSafeAreaInsetsDidChange](&v5, "viewSafeAreaInsetsDidChange");
  if ((char *)-[BSUIFeedViewController navigationBarStyle](self, "navigationBarStyle") == (char *)&dword_0 + 2)
    -[BSUIFeedViewController _manuallyAdjustBottomContentInset](self, "_manuallyAdjustBottomContentInset");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController bcSafeAreaInsetsObserver](self, "bcSafeAreaInsetsObserver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v4, "safeAreaInsets");
  objc_msgSend(v3, "bcSafeAreaInsetsObservableViewController:safeAreaInsetsDidChange:", self);

}

- (void)updateNavigationBarOpacity
{
  void *v3;
  BSUIFeedViewController *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v4 = (BSUIFeedViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  if (v4 == self)
  {
    v5.receiver = self;
    v5.super_class = (Class)BSUIFeedViewController;
    -[BSUIFeedViewController updateNavigationBarOpacity](&v5, "updateNavigationBarOpacity");
  }

}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)setFeedLiveResizeOptions:(int64_t)a3
{
  self->_feedLiveResizeOptions = a3;
  if ((unint64_t)a3 <= 3)
    -[BSUIFeedViewController setLiveResizeOptions:](self, "setLiveResizeOptions:", qword_255E90[a3]);
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p [fid:%lu] >"), objc_opt_class(self), self, -[BSUIFeedViewController feedId](self, "feedId"));
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p [fid:%lu] >"), objc_opt_class(self), self, -[BSUIFeedViewController feedId](self, "feedId"));
}

- (void)cardSetViewController:(id)a3 willUpdateWithNavigationType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)a4 <= 3)
  {
    v7 = v6;
    -[BSUIFeedViewController setParentCardNavigationType:](self, "setParentCardNavigationType:", off_2E5EE8[a4]);
    v6 = v7;
  }

}

- (void)cardStackViewController:(id)a3 parentCardWillDismissWithReason:(int64_t)a4 targetViewController:(id)a5
{
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((unint64_t)a4 > 2)
    v6 = 0;
  else
    v6 = off_2E5F08[a4];
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BSUIFeedViewControllerHosting, a5);
  v12 = (id)objc_claimAutoreleasedReturnValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentFeedViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "feed"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v11, "notifyParentCardWillDismissWithReason:targetFeed:", v6, v10);

}

- (void)setMetadataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_metadataDelegate, a3);
  -[BSUIFeedViewController _feedMetadataDidUpdate](self, "_feedMetadataDidUpdate");
}

- (void)_feedMetadataDidUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));

  v4 = v16;
  if (!v16)
    goto LABEL_15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController metadataDelegate](self, "metadataDelegate"));
  objc_msgSend(v5, "bsuiFeedViewControllerNavigationBarStyle:", objc_msgSend(v16, "navigationBarStyle"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trackerName"));
  if (objc_msgSend(v6, "length"))
    -[BSUIFeedViewController setTrackerName:](self, "setTrackerName:", v6);
  -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", objc_msgSend(v16, "navigationBarVisible"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v8 = objc_msgSend(v7, "isRootFeed");

  v9 = v16;
  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v16, "navigationBarStyle") == (char *)&dword_0 + 2)
    {
      -[BSUIFeedViewController _updateNavigationItemWithTitle:](self, "_updateNavigationItemWithTitle:", &stru_2F6710);
LABEL_9:
      v9 = v16;
      goto LABEL_10;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));

    v9 = v16;
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
      -[BSUIFeedViewController _updateNavigationItemWithTitle:](self, "_updateNavigationItemWithTitle:", v11);

      goto LABEL_9;
    }
  }
LABEL_10:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backTitle"));
  v13 = v12;
  if (!v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setBackButtonTitle:", v13);

  if (!v12)
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v15, "_setSupportsTwoLineLargeTitles:", 1);

  -[BSUIFeedViewController _configureNavigationBarWithStyle:](self, "_configureNavigationBarWithStyle:", objc_msgSend(v16, "navigationBarStyle"));
  -[BSUIFeedViewController _updateBackgroundColor:](self, "_updateBackgroundColor:", 1);
  -[BSUIFeedViewController _fixTwoLineLargeTitleLayoutIfNeeded](self, "_fixTwoLineLargeTitleLayoutIfNeeded");
  -[BSUIFeedViewController _updateNavigationLayoutMetrics](self, "_updateNavigationLayoutMetrics");
  -[BSUIFeedViewController setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", objc_msgSend(v16, "showsVerticalScrollIndicator"));

  v4 = v16;
LABEL_15:

}

- (void)_manuallyAdjustBottomContentInset
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
    objc_msgSend(v4, "contentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
    objc_msgSend(v14, "setContentInset:", v6, v8, v13, v10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
    objc_msgSend(v15, "setScrollIndicatorInsets:", v6, v8, v13, v10);

    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  self->_deferredAdjustBottomContentInset = v16;
}

- (void)_configureNavigationBarWithStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  BSUIFeedViewController *v10;
  uint64_t v11;
  _QWORD v12[5];

  if (-[BSUIFeedViewController navigationBarStyle](self, "navigationBarStyle") != a3)
  {
    -[BSUIFeedViewController setNavigationBarStyle:](self, "setNavigationBarStyle:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBarTintColor"));

    if (v7)
      -[BSUIFeedViewController setNavigationBarTintColorWhenLayoutReady:](self, "setNavigationBarTintColorWhenLayoutReady:", v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_42168;
    v12[3] = &unk_2E4608;
    v12[4] = self;
    v8 = objc_retainBlock(v12);
    v9 = v8;
    switch(a3)
    {
      case 4uLL:
        ((void (*)(_QWORD *))v8[2])(v8);
        sub_4184C(self);
        self->_wantsTransparentNavigationBar = 1;
        break;
      case 2uLL:
        ((void (*)(_QWORD *))v8[2])(v8);
        goto LABEL_12;
      case 0uLL:
        v10 = self;
        v11 = 1;
LABEL_10:
        sub_421CC(v10, v11);
LABEL_12:

        return;
    }
    v10 = self;
    v11 = 2;
    goto LABEL_10;
  }
}

- (void)_updateNavigationLayoutMetrics
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = objc_opt_class(BSUINavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  objc_msgSend(v6, "updateLayoutMetrics");
}

- (void)_updateBackgroundColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v3 = a3;
  if (-[BSUIFeedViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController traitCollection](self, "traitCollection"));
    v6 = (char *)objc_msgSend(v5, "userInterfaceStyle");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dayBackgroundColor"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nightBackgroundColor"));

    if (v9 && v12)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v9, v12));
    }
    else
    {
      if (v6 == (_BYTE *)&dword_0 + 2 && v12)
      {
        v14 = v12;
        goto LABEL_10;
      }
      v13 = v9;
    }
    v14 = v13;
    if (!v13)
    {
LABEL_14:

      return;
    }
LABEL_10:
    if (v3
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController viewIfLoaded](self, "viewIfLoaded")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window")),
          v16,
          v15,
          v16))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_42450;
      v17[3] = &unk_2E40C8;
      v17[4] = self;
      v14 = v14;
      v18 = v14;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.2);

    }
    else
    {
      -[BSUIFeedViewController _updateViewWithBackgroundColor:](self, "_updateViewWithBackgroundColor:", v14);
    }
    goto LABEL_14;
  }
}

- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4
{
  -[BSUIFeedViewController setNavBarBackgroundOpacity:withTitle:manualScrollEdgeAppearanceEnabled:](self, "setNavBarBackgroundOpacity:withTitle:manualScrollEdgeAppearanceEnabled:", 1, a4, a3);
}

- (UINavigationItem)navigationItem
{
  UINavigationItem *navigationItem;
  BSUIFeedNavigationItem *v4;
  UINavigationItem *v5;

  navigationItem = self->_navigationItem;
  if (!navigationItem)
  {
    v4 = objc_opt_new(BSUIFeedNavigationItem);
    -[BSUIFeedNavigationItem setAllowsTitle:](v4, "setAllowsTitle:", 1);
    -[BSUIFeedNavigationItem _dci_setPreferredSearchBarPlacement:](v4, "_dci_setPreferredSearchBarPlacement:", 2);
    v5 = self->_navigationItem;
    self->_navigationItem = &v4->super.super;

    navigationItem = self->_navigationItem;
  }
  return navigationItem;
}

- (void)_updateNavigationItemWithTitle:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = objc_msgSend(v5, "isEqualToString:", v11);

  if ((v6 & 1) == 0)
  {
    v7 = objc_opt_class(BSUIFeedNavigationItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    objc_msgSend(v10, "setAllowsTitle:", 1);
    objc_msgSend(v10, "setTitle:", v11);
    objc_msgSend(v10, "setAllowsTitle:", objc_msgSend(v11, "length") != 0);

  }
}

- (void)_fixTwoLineLargeTitleLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v21 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  if (!objc_msgSend(v3, "length")
    || objc_msgSend(v21, "largeTitleDisplayMode") == (char *)&dword_0 + 2
    || objc_msgSend(v21, "_largeTitleTwoLineMode") != (char *)&dword_0 + 1)
  {
    goto LABEL_11;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController lastTwoLineTitleFixed](self, "lastTwoLineTitleFixed"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController lastTwoLineTitleFixed](self, "lastTwoLineTitleFixed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = -[BSUIFeedViewController lastTwoLineTitleFixHadSearchController](self, "lastTwoLineTitleFixHadSearchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchController"));
      v9 = v7 ^ (v8 != 0);

      if ((v9 & 1) == 0)
        goto LABEL_12;
      goto LABEL_10;
    }

  }
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
  -[BSUIFeedViewController setLastTwoLineTitleFixed:](self, "setLastTwoLineTitleFixed:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "searchController"));
  -[BSUIFeedViewController setLastTwoLineTitleFixHadSearchController:](self, "setLastTwoLineTitleFixHadSearchController:", v11 != 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
  objc_msgSend(v13, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationBar"));
  objc_msgSend(v17, "frame");
  v19 = -(v15 + v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v20, "setContentOffset:", 0.0, v19);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setContentOffset:", 0.0, v19);
LABEL_11:

LABEL_12:
}

- (void)setNavBarBackgroundOpacity:(double)a3 withTitle:(BOOL)a4 manualScrollEdgeAppearanceEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  char *v13;
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
  void *v29;
  objc_super v30;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v10 = objc_msgSend(v9, "isRootFeed");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
    v13 = (char *)objc_msgSend(v12, "navigationBarStyle");

    if (v13 == (_BYTE *)&dword_0 + 2)
    {
      if (fabs(a3) >= 2.22044605e-16)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));

        if (v16 && v6)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metadata"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
          -[BSUIFeedViewController _updateNavigationItemWithTitle:](self, "_updateNavigationItemWithTitle:", v19);

        }
      }
      else
      {
        -[BSUIFeedViewController _updateNavigationItemWithTitle:](self, "_updateNavigationItemWithTitle:", &stru_2F6710);
      }
    }
  }
  if (a3 > 0.5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "navigationBar"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    objc_msgSend(v21, "setTintColor:", v22);
    goto LABEL_13;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "metadata"));
  if (objc_msgSend(v24, "navigationBarStyle") != (char *)&dword_0 + 2)
  {

    goto LABEL_16;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metadata"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "navigationBarTintColor"));

  if (v27)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadata"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationBarTintColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "navigationBar"));
    objc_msgSend(v29, "setTintColor:", v22);

LABEL_13:
    if ((-[BSUIFeedViewController runningInExtension](self, "runningInExtension") & 1) == 0)
      -[BSUIFeedViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
LABEL_16:
  v30.receiver = self;
  v30.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:](&v30, "setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:", v5, a3);
}

- (UIColor)preferredNavigationBarTintColor
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  v4 = objc_msgSend(v3, "_isManualScrollEdgeAppearanceEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "_manualScrollEdgeAppearanceProgress");
    if (v6 > 0.5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBarTintColor"));

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  }
  return (UIColor *)v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;

  v3 = a3;
  if (-[BSUIFeedViewController avoidSyncTransactionInViewWillAppear](self, "avoidSyncTransactionInViewWillAppear"))
  {
    v5 = BSUIFeedViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v32 = -[BSUIFeedViewController feedId](self, "feedId");
      v33 = 1024;
      v34 = -[BSUIFeedViewController performantForScrolling](self, "performantForScrolling");
      v35 = 1024;
      v36 = -[BSUIFeedViewController performantForReadingExperience](self, "performantForReadingExperience");
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillAppear skips sync transaction because either Scrolling=%{BOOL}d or ReadingExperience=%{BOOL}d", buf, 0x18u);
    }

  }
  v30.receiver = self;
  v30.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewWillAppear:](&v30, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v7, "notifyOnAppear");

  if ((-[BSUIFeedViewController isBeingPresented](self, "isBeingPresented") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
    -[BSUIFeedViewController _configureNavigationBarWithStyle:](self, "_configureNavigationBarWithStyle:", objc_msgSend(v9, "navigationBarStyle"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentedViewController](self, "presentedViewController"));
  if (v10)
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v12 = objc_msgSend(v11, "isNavigationBarHidden");
  v13 = -[BSUIFeedViewController bc_navBarVisible](self, "bc_navBarVisible");

  if (v12 == v13)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "setNavigationBarHidden:animated:", objc_msgSend(v14, "isNavigationBarHidden") ^ 1, v3);

LABEL_10:
  }
  if (self->_trackerName)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", self->_trackerName));
      -[BSUIFeedViewController _setEffectiveAnalyticsTracker:](self, "_setEffectiveAnalyticsTracker:", v16);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController transitionCoordinator](self, "transitionCoordinator"));
  v18 = objc_msgSend(v17, "isAnimated");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController transitionCoordinator](self, "transitionCoordinator"));
    v28[4] = self;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_42F00;
    v29[3] = &unk_2E3FB0;
    v29[4] = self;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_42F08;
    v28[3] = &unk_2E3FB0;
    objc_msgSend(v19, "animateAlongsideTransition:completion:", v29, v28);

  }
  v20 = -[BSUIFeedViewController waitForVisibleImageResourcesToLoadAssertionWithTimeout:completion:](self, "waitForVisibleImageResourcesToLoadAssertionWithTimeout:completion:", 0, 0.2);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController metadataDelegate](self, "metadataDelegate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "metadata"));
  objc_msgSend(v21, "bsuiFeedViewControllerNavigationBarStyle:", objc_msgSend(v23, "navigationBarStyle"));

  if (-[BSUIFeedViewController isInCard](self, "isInCard"))
  {
    v24 = objc_opt_class(BSUICardNavigationController);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v26 = BUDynamicCast(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (objc_msgSend(v27, "isCurrentCard"))
      -[BSUIFeedViewController didBecomeVisibleContentScrollView](self, "didBecomeVisibleContentScrollView");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  UIAccessibilityNotifications v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentingViewController](self, "presentingViewController"));
  -[BSUIFeedViewController setIsPresented:](self, "setIsPresented:", v4 != 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v5, "notifyDidAppear");

  -[BSUIFeedViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
  if (-[BSUIFeedViewController isPresented](self, "isPresented"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      v9 = UIAccessibilityScreenChangedNotification;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
      UIAccessibilityPostNotification(v9, v10);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewWillDisappear:](&v9, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  if (objc_msgSend(v4, "isNavigationBarHidden"))
  {
    v5 = -[BSUIFeedViewController bc_navBarVisible](self, "bc_navBarVisible");

    if (!v5)
      goto LABEL_5;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    objc_msgSend(v4, "setNavigationBarHidden:animated:", 0, 0);
  }

LABEL_5:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentPopOverViewController](self, "currentPopOverViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentPopOverViewController](self, "currentPopOverViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[BSUIFeedViewController setIsPresented:](self, "setIsPresented:", 0);
  -[BSUIFeedViewController setWasPresentingCards:](self, "setWasPresentingCards:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v8, "notifyOnDisappear");

  -[BSUIFeedViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;

  v8.receiver = self;
  v8.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  v4 = BSUIFeedViewControllerLog(-[BSUIFeedViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[BSUIFeedViewController feedId](self, "feedId");
    *(_DWORD *)buf = 134217984;
    v10 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewDidDisappear: Sending BSUIFeedViewControllerDidDisappearNotification", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("BSUIFeedViewControllerDidDisappearNotification"), 0);

}

- (void)bc_analyticsVisibilityDidAppear
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController bc_analyticsVisibilityDidAppear](&v4, "bc_analyticsVisibilityDidAppear");
  -[BSUIFeedViewController updateVisibility](self, "updateVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  objc_msgSend(v3, "notifyAnalyticsVisibilityDidAppear");

  -[BSUIFeedViewController _updateEngagementMessagesToDisplay](self, "_updateEngagementMessagesToDisplay");
}

- (void)bc_analyticsVisibilityWillDisappear
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController bc_analyticsVisibilityWillDisappear](&v4, "bc_analyticsVisibilityWillDisappear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  objc_msgSend(v3, "notifyAnalyticsVisibilityWillDisappear");

}

- (void)bc_analyticsVisibilityDidDisappear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController bc_analyticsVisibilityDidDisappear](&v3, "bc_analyticsVisibilityDidDisappear");
  -[BSUIFeedViewController updateVisibility](self, "updateVisibility");
}

- (void)setPerformantForScrolling:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_performantForScrolling != a3)
  {
    v3 = a3;
    self->_performantForScrolling = a3;
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController suspendLayout](self, "suspendLayout"));
      -[BSUIFeedViewController setSuspendLayoutForScrolling:](self, "setSuspendLayoutForScrolling:", v5);

    }
    else
    {
      -[BSUIFeedViewController setSuspendLayoutForScrolling:](self, "setSuspendLayoutForScrolling:", 0);
    }
    -[BSUIFeedViewController setDisallowLoadingView:](self, "setDisallowLoadingView:", v3);
    -[BSUIFeedViewController _updateSyncTransactionBehaviorInViewWillAppear](self, "_updateSyncTransactionBehaviorInViewWillAppear");
  }
}

- (void)setPerformantForReadingExperience:(BOOL)a3
{
  if (self->_performantForReadingExperience != a3)
  {
    self->_performantForReadingExperience = a3;
    -[BSUIFeedViewController _updateSyncTransactionBehaviorInViewWillAppear](self, "_updateSyncTransactionBehaviorInViewWillAppear");
  }
}

- (void)didBecomeVisibleContentScrollView
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = -[BSUIFeedViewController isInCard](self, "isInCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardStackViewController](self, "cardStackViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topCardSetViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCardViewController"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));

  if ((v3 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentingViewController](self, "presentingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabBarController"));

    v9 = (id)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
    if (v15 == v9)
    {
      objc_msgSend(v8, "bc_setPreferredTabBarScrollEdgeAppearance:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedViewController"));
      objc_msgSend(v13, "setContentScrollView:forEdge:", 0, 4);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
      objc_msgSend(v12, "setContentScrollView:forEdge:", v14, 4);

      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tabBar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "standardAppearance"));
    objc_msgSend(v8, "bc_setPreferredTabBarScrollEdgeAppearance:", v11);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController tabBarController](self, "tabBarController"));
    objc_msgSend(v8, "bc_setPreferredTabBarScrollEdgeAppearance:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedViewController"));
  objc_msgSend(v12, "setContentScrollView:forEdge:", 0, 4);
LABEL_7:

}

- (void)didSetCurrentCardState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentingViewController](self, "presentingViewController"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tabBarController"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
  if (v6 == v4)
  {
    objc_msgSend(v11, "bc_setPreferredTabBarScrollEdgeAppearance:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
    objc_msgSend(v9, "setContentScrollView:forEdge:", v10, 4);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tabBar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "standardAppearance"));
    objc_msgSend(v11, "bc_setPreferredTabBarScrollEdgeAppearance:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedViewController"));
    objc_msgSend(v9, "setContentScrollView:forEdge:", 0, 4);
  }

}

- (void)didBecomeCurrentFeed
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = BSUIFeedViewControllerLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = -[BSUIFeedViewController feedId](self, "feedId");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[fid:%lu] didBecomeCurrentFeed", (uint8_t *)&v5, 0xCu);
  }

}

- (void)loadEntries
{
  os_unfair_lock_s *p_stateLock;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  id buf[2];
  _QWORD v15[2];
  uint64_t (*v16)(uint64_t);
  void *v17;
  BSUIFeedViewController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  p_stateLock = &self->_stateLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_438F4;
  v17 = &unk_2E42F8;
  v18 = self;
  v19 = &v20;
  v4 = v15;
  os_unfair_lock_lock(p_stateLock);
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_stateLock);

  if (*((_BYTE *)v21 + 24))
  {
    v5 = BCSignpostFeedViewController();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (char *)os_signpost_id_generate(v6);

    v8 = BCSignpostFeedViewController();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "Load Entries", ", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_43924;
    v12[3] = &unk_2E5A78;
    objc_copyWeak(v13, buf);
    v13[1] = v7;
    objc_msgSend(v11, "requestEntriesWithCompletion:", v12);

    objc_destroyWeak(v13);
    objc_destroyWeak(buf);
  }
  _Block_object_dispose(&v20, 8);
}

- (id)_createFeedContentFromDictionaries:(id)a3 initialContentReadyEntryIndex:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = BSUIFixRelativeURLInEntryDictionary(*(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = objc_alloc((Class)TUIFeedEntry);
        v16 = objc_msgSend(v15, "initWithDictionary:", v14, (_QWORD)v20);
        objc_msgSend(v16, "setDelegate:", self);
        -[NSMutableArray addObject:](v7, "addObject:", v16);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentStackName](self, "currentStackName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFeedContent feedContentWithEntries:stackName:initialContentReadyEntryIndex:](TUIFeedContent, "feedContentWithEntries:stackName:initialContentReadyEntryIndex:", v7, v17, a4));

  return v18;
}

- (void)_feedContentDidLoad:(id)a3 signpost:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint8_t v30[8];
  _QWORD block[4];
  NSObject *v32;
  _BYTE *v33;
  unint64_t v34;
  _QWORD v35[2];
  void (*v36)(uint64_t);
  void *v37;
  BSUIFeedViewController *v38;
  _BYTE *v39;
  _BYTE buf[24];
  id (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isInitialFeed")));
  v11 = BUDynamicCast(v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "environment"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("App")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "invokeMethod:withArguments:", CFSTR("initialContentReadySection"), 0));
    v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toNumber"));

    if (v19)
    {
      v20 = BSUIFeedViewControllerLog(objc_msgSend(v19, "doubleValue"));
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = -[BSUIFeedViewController feedId](self, "feedId");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "[fid:%lu] Obtained initialContentReadySection=%@ from JS", buf, 0x16u);
      }
    }
    else
    {

      v24 = BSUIFeedViewControllerLog(v23);
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_238C68(self, v21);
      v19 = &off_2FB9D8;
    }

    v22 = (uint64_t)objc_msgSend(v19, "unsignedIntegerValue");
  }
  else
  {
    v19 = 0;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _createFeedContentFromDictionaries:initialContentReadyEntryIndex:](self, "_createFeedContentFromDictionaries:initialContentReadyEntryIndex:", v6, v22));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = sub_43EEC;
  v42 = sub_43F14;
  v43 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v36 = sub_43F1C;
  v37 = &unk_2E5AA0;
  v38 = self;
  v39 = buf;
  v26 = v35;
  os_unfair_lock_lock(&self->_stateLock);
  v36((uint64_t)v26);
  os_unfair_lock_unlock(&self->_stateLock);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_43F80;
    block[3] = &unk_2E5AC8;
    v33 = buf;
    v32 = v25;
    v34 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v27 = v32;
  }
  else
  {
    v28 = BCSignpostFeedViewController(-[BSUIFeedViewController setContent:](self, "setContent:", v25));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v27 = v29;
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v30 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v27, OS_SIGNPOST_INTERVAL_END, a4, "Load Entries", ", v30, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)setCardContentScrollManager:(id)a3
{
  BCCardContentScrollManager *v4;
  void *v5;
  void *v6;
  BCCardContentScrollManager *v7;

  v4 = (BCCardContentScrollManager *)a3;
  if (self->_cardContentScrollManager != v4)
  {
    self->_cardContentScrollManager = v4;
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));

    v4 = v7;
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
      -[BCCardContentScrollManager cardContentViewController:initializeManagerWithScrollView:](v7, "cardContentViewController:initializeManagerWithScrollView:", self, v6);

      v4 = v7;
    }
  }

}

- (int64_t)feedContentLoadingState
{
  os_unfair_lock_s *p_stateLock;
  _QWORD *v3;
  int64_t v4;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t);
  void *v8;
  BSUIFeedViewController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  p_stateLock = &self->_stateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_44188;
  v8 = &unk_2E42F8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_stateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_stateLock);

  v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)setFeedContentLoadingState:(int64_t)a3
{
  os_unfair_lock_s *p_stateLock;
  _QWORD v4[6];

  p_stateLock = &self->_stateLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_44224;
  v4[3] = &unk_2E5AF0;
  v4[4] = self;
  v4[5] = a3;
  os_unfair_lock_lock(&self->_stateLock);
  sub_44224((uint64_t)v4);
  os_unfair_lock_unlock(p_stateLock);
}

- (id)feedContentCompletion
{
  os_unfair_lock_s *p_stateLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  BSUIFeedViewController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_43EEC;
  v15 = sub_43F14;
  v16 = 0;
  p_stateLock = &self->_stateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_4432C;
  v8 = &unk_2E42F8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_stateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_stateLock);

  v4 = objc_retainBlock((id)v12[5]);
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)setLoadPriority:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  __int128 v6;
  double v7;
  id v8;

  if (self->_loadPriority != a3)
  {
    self->_loadPriority = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    *((_QWORD *)&v6 + 1) = self->_loadPriority;
    *(_QWORD *)&v6 = *((_QWORD *)&v6 + 1) + 8;
    v5 = v6 >> 2;
    LODWORD(v7) = 0.5;
    if (v5 <= 4)
      LODWORD(v7) = dword_255EB0[v5];
    v8 = v4;
    objc_msgSend(v4, "setFeedDataRequestPriority:", v7);

  }
}

- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSUIFeedViewController *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v4 = a4;
  if (-[BSUIFeedViewController _appearState](self, "_appearState", a3))
  {
    if (v4)
    {
      -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", 1);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
        -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", objc_msgSend(v9, "navigationBarVisible"));

      }
      else
      {
        -[BSUIFeedViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", 1);
      }

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v11 = (BSUIFeedViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));

    if (v11 == self)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));

      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
        objc_msgSend(v15, "_verticalVelocity");
        v17 = v16;

        v14 = 0.15;
        if (v17 < -3.5)
          v14 = 0.0;
        if (v17 >= -2.0)
          v18 = 0.2;
        else
          v18 = v14;
      }
      else
      {
        v18 = 0.0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController", v14));
      objc_msgSend(v19, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", 0, v18);

      -[BSUIFeedViewController _fixTwoLineLargeTitleLayoutIfNeeded](self, "_fixTwoLineLargeTitleLayoutIfNeeded");
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentedViewController](self, "presentedViewController"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___BCOrientationControlling))
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");
  else
    v5 = -[BSUIFeedViewController supportedInterfaceOrientationsForSelf](self, "supportedInterfaceOrientationsForSelf");
  v6 = (unint64_t)v5;

  return v6;
}

- (unint64_t)supportedInterfaceOrientationsForSelf
{
  if (isPad(self, a2))
    return 30;
  else
    return 2;
}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  _BYTE *v29;
  id v30;
  id location;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  os_signpost_id_t v35;
  _BYTE buf[24];
  uint64_t v37;

  v7 = a3;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));

    if (v9)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v11 = BCSignpostFeedViewController(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = os_signpost_id_generate(v12);

      v35 = v13;
      v15 = BCSignpostFeedViewController(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = v16;
      v18 = v33[3];
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uid"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "templateURL"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        _os_signpost_emit_with_name_impl(&dword_0, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Request Entry Data", "Entry: %{public}@, Template: %{public}@", buf, 0x16u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = -1;
      objc_initWeak(&location, self);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uid"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_44908;
      v25[3] = &unk_2E5B40;
      objc_copyWeak(&v30, &location);
      v28 = &v32;
      v29 = buf;
      v26 = v7;
      v27 = v8;
      objc_msgSend(v22, "requestCompleteDataForEntry:completion:", v23, v25);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v32, 8);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
  }

  return 0;
}

- (BOOL)feedEntry:(id)a3 handleBehavior:(id)a4 name:(id)a5 arguments:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  if (!a3 || !a5)
    return 0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uid"));

  LOBYTE(v11) = objc_msgSend(v12, "executeBehaviorNamed:forEntry:withArguments:", v10, v13, v9);
  return (char)v11;
}

- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  BSUIItemDescription *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  BSUIItemDescription *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int *v38;
  _BOOL8 v39;
  id v40;
  id v41;
  void *v42;
  BSUIItemDescription *v43;
  id v44;
  void *v45;
  void *v46;

  v6 = a5;
  v7 = objc_opt_class(NSDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("item")));

  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_opt_class(NSString);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetID")));
  v13 = BUDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = objc_opt_class(NSString);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("storeID")));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (objc_msgSend(v18, "length"))
  {
    v19 = objc_opt_class(NSNumber);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isRestricted")));
    v21 = BUDynamicCast(v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v22, "BOOLValue");

    if ((v23 & 1) == 0)
    {
      v24 = -[BSUIItemDescription initWithDragInfo:]([BSUIItemDescription alloc], "initWithDragInfo:", v10);
      v25 = objc_opt_class(NSNumber);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kind")));
      v27 = BUDynamicCast(v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = objc_msgSend(v28, "integerValue");

      v30 = (BSUIItemDescription *)objc_alloc_init((Class)BCAssetDragInfo);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription title](v24, "title"));
      -[BSUIItemDescription setTitle:](v30, "setTitle:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription author](v24, "author"));
      -[BSUIItemDescription setAuthor:](v30, "setAuthor:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription productURL](v24, "productURL"));
      -[BSUIItemDescription setStoreURL:](v30, "setStoreURL:", v33);

      -[BSUIItemDescription setAssetID:](v30, "setAssetID:", v14);
      -[BSUIItemDescription setStoreID:](v30, "setStoreID:", v18);
      -[BSUIItemDescription setContentType:](v30, "setContentType:", v29);
      v34 = objc_opt_class(NSNumber);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isSample")));
      v36 = BUDynamicCast(v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      -[BSUIItemDescription setIsSample:](v30, "setIsSample:", objc_msgSend(v37, "BOOLValue"));

      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!objc_msgSend(v14, "length"))
  {
LABEL_6:
    v30 = 0;
    goto LABEL_7;
  }
  v30 = (BSUIItemDescription *)objc_msgSend(objc_alloc((Class)BCAssetDragInfo), "initWithDragInfo:", v10);
LABEL_7:
  v24 = 0;
LABEL_8:
  v38 = (int *)-[BSUIItemDescription contentType](v30, "contentType");
  if ((unint64_t)v38 - 2 < 2)
    goto LABEL_16;
  if (v38 == &dword_4 || v38 == (int *)((char *)&dword_0 + 1))
  {
    if (objc_msgSend(v18, "length"))
    {
      if (!objc_msgSend(v14, "length") || (-[BSUIItemDescription isSample](v30, "isSample") & 1) != 0)
        goto LABEL_14;
      v44 = BSUIGetLibraryItemStateProvider();
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "itemStateWithIdentifier:", v14));

      v39 = objc_msgSend(v46, "library") != (char *)&dword_0 + 3;
      if (v30)
        goto LABEL_17;
LABEL_22:
      v42 = 0;
      goto LABEL_23;
    }
LABEL_16:
    v39 = 1;
    if (v30)
      goto LABEL_17;
    goto LABEL_22;
  }
LABEL_14:
  v39 = 0;
  if (!v30)
    goto LABEL_22;
LABEL_17:
  v40 = objc_alloc_init((Class)NSItemProvider);
  v41 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v40);
  v42 = v41;
  if (v24)
    v43 = v24;
  else
    v43 = v30;
  objc_msgSend(v41, "setLocalObject:", v43);
  +[BCDragRepresentationFactory registerRepresentationsFromAssetDragInfo:withProvider:canDragToNewCanvas:](BCDragRepresentationFactory, "registerRepresentationsFromAssetDragInfo:withProvider:canDragToNewCanvas:", v30, v40, v39);

LABEL_23:
  return v42;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController im_ancestorViewControllerConformingToProtocol:](self, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___BSUIFeedViewControllerDropHandler));
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "performDropWithSession:behavior:", v9, v6);

}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController im_ancestorViewControllerConformingToProtocol:](self, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___BSUIFeedViewControllerDropHandler));
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "canHandleDropSession:behavior:", v6, v7);
  else
    v10 = 0;

  return v10;
}

- (void)setTrackerName:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD block[4];
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  BSUIFeedViewController *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_454E4;
  v9[3] = &unk_2E48F8;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = objc_retainBlock(v9);
  if (v6)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v6[2])(v6);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_45650;
      block[3] = &unk_2E3F88;
      v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (JSValue)feed
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "feed"));

  return (JSValue *)v3;
}

- (void)renderSharableImageWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_43EEC;
    v15 = sub_43F14;
    v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_457A0;
    v10[3] = &unk_2E5B90;
    v10[4] = self;
    v10[5] = &v11;
    v8 = objc_retainBlock(v10);
    v9 = (void *)v12[5];
    v12[5] = (uint64_t)v8;

    (*(void (**)(void))(v12[5] + 16))();
    _Block_object_dispose(&v11, 8);

  }
}

- (id)metricsForFeedController:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;

  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController parentCardNavigationType](self, "parentCardNavigationType"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController parentCardNavigationType](self, "parentCardNavigationType"));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, CFSTR("navigationType"));

  }
  else if (-[BSUIFeedViewController wasPresentingCards](self, "wasPresentingCards"))
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", CFSTR("pop"), CFSTR("navigationType"));
  }
  return v4;
}

- (id)newAnalyticsSessionAssertionForFeedController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController effectiveAnalyticsTracker](self, "effectiveAnalyticsTracker", a3));
  v4 = objc_msgSend(v3, "newSessionAssertion");

  return v4;
}

- (id)newAnalyticsSessionExtendingAssertionForFeedController:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController effectiveAnalyticsTracker](self, "effectiveAnalyticsTracker", a3));
  v4 = objc_msgSend(v3, "newSessionExtendingAssertion");

  return v4;
}

- (void)coverAnimationHostUpdateItemVisibility:(BOOL)a3 refId:(id)a4 refInstance:(id)a5
{
  if (a3)
    -[BSUIFeedViewController _removeAlphaOverrideFromRefId:refInstance:animated:duration:](self, "_removeAlphaOverrideFromRefId:refInstance:animated:duration:", a4, a5, 0, 0.0);
  else
    -[BSUIFeedViewController _addAlphaOverrideToRefId:refInstance:alpha:animated:duration:](self, "_addAlphaOverrideToRefId:refInstance:alpha:animated:duration:", a4, a5, 0, 0.0, 0.0);
}

- (void)_addAlphaOverrideToRefId:(id)a3 refInstance:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSMutableSet *v19;
  NSMutableSet *activeRenderOverrides;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  NSObject *v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _overrideMatchingRefId:refInstance:](self, "_overrideMatchingRefId:refInstance:", v12, v13));
  if (!v14)
  {
    if (!self->_activeRenderOverrides)
    {
      v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      activeRenderOverrides = self->_activeRenderOverrides;
      self->_activeRenderOverrides = v19;

    }
    v17 = objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, 0, v12, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceOverride overrideWithQuery:alpha:](TUIRenderReferenceOverride, "overrideWithQuery:alpha:", v17, a5));
    -[BSUIFeedViewController addRenderOverride:animated:duration:](self, "addRenderOverride:animated:duration:", v15, v8, a7);
    v21 = BSUIFeedViewControllerLog(-[NSMutableSet addObject:](self->_activeRenderOverrides, "addObject:", v15));
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
      v23 = 138412802;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v22;
      _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "_addAlphaOverride: added - refId: %@, refInstance: %@, alpha: %@", (uint8_t *)&v23, 0x20u);

    }
    goto LABEL_8;
  }
  v15 = (void *)v14;
  v16 = BSUIFeedViewControllerLog(v14);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
    v23 = 138412802;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "_addAlphaOverride: override exists - refId: %@, refInstance: %@, alpha: %@", (uint8_t *)&v23, 0x20u);
LABEL_8:

  }
}

- (void)_removeAlphaOverrideFromRefId:(id)a3 refInstance:(id)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _overrideMatchingRefId:refInstance:](self, "_overrideMatchingRefId:refInstance:", v10, v11));
  if (v12)
  {
    -[BSUIFeedViewController removeRenderOverride:animated:duration:](self, "removeRenderOverride:animated:duration:", v12, v7, a6);
    v13 = BSUIFeedViewControllerLog(-[NSMutableSet removeObject:](self->_activeRenderOverrides, "removeObject:", v12));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412802;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "_removeAlphaOverride: removed - refId: %@, refInstance: %@, override: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    v15 = BSUIFeedViewControllerLog(0);
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_238D34();
  }

}

- (id)_overrideMatchingRefId:(id)a3 refInstance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, 0, v7, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _overrideMatchingQuery:](self, "_overrideMatchingQuery:", v8));
  v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("currentBook"));

  if (v10 && !v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, 0, CFSTR("cover"), v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _overrideMatchingQuery:](self, "_overrideMatchingQuery:", v11));
    v8 = (void *)v11;
  }

  return v9;
}

- (id)_overrideMatchingQuery:(id)a3
{
  id v4;
  NSMutableSet *activeRenderOverrides;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_458E0;
  v16 = sub_458F0;
  v17 = 0;
  activeRenderOverrides = self->_activeRenderOverrides;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_46348;
  v9[3] = &unk_2E5BB8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableSet enumerateObjectsUsingBlock:](activeRenderOverrides, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)feedControllerIsOnScreen:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[BSUIFeedViewController isViewLoaded](self, "isViewLoaded", a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = v5 != 0;

  return v6;
}

- (void)feedViewController:(id)val didTransitionToLayoutState:
{
  _QWORD v1[4];
  id v2;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_4B96C;
    v1[3] = &unk_2E48C8;
    objc_copyWeak(&v2, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v1);
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

- (void)feedController:(id)a3 wantsToCreateNewFeedWithOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(id, BSUIFeedViewController *, _QWORD);
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  BSUINavigationContext *v25;
  id v26;
  void *v27;
  BSUIFeedViewController *v28;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(NSNumber);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("useSwiftUI")));
  v12 = BUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    v15 = objc_opt_class(NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "metrics"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("navigationType")));
    v18 = BUDynamicCast(v15, v17);
    v19 = (void (**)(id, BSUIFeedViewController *, _QWORD))objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_opt_class(NSNumber);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shouldReportFigaro")));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_msgSend(v23, "BOOLValue");

    v25 = [BSUINavigationContext alloc];
    v26 = -[BSUIFeedViewController bc_isPresentedInCardViewController](self, "bc_isPresentedInCardViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController presentingViewController](self, "presentingViewController"));
    v28 = -[BSUINavigationContext initWithIsInCard:isInModal:](v25, "initWithIsInCard:isInModal:", v26, v27 != 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    +[BSUIFeedViewController createSeriesViewControllerFromOptions:withParentTracker:navigationTypeValue:navigationContext:shouldReportFigaro:completion:](BSUIFeedViewController, "createSeriesViewControllerFromOptions:withParentTracker:navigationTypeValue:navigationContext:shouldReportFigaro:completion:", v8, v29, v19, v28, v24, v9);

LABEL_5:
    goto LABEL_6;
  }
  v19 = (void (**)(id, BSUIFeedViewController *, _QWORD))objc_retainBlock(v9);
  if (v19)
  {
    v28 = -[BSUIFeedViewController initWithOptions:]([BSUIFeedViewController alloc], "initWithOptions:", v8);
    v19[2](v19, v28, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)feedController:(id)a3 wantsToUpdateNavBarBackgroundOpacity:(double)a4
{
  -[BSUIFeedViewController setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:](self, "setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:", 0, a4);
}

- (void)feedController:(id)a3 wantsToUpdateContentWithData:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _createFeedContentFromDictionaries:initialContentReadyEntryIndex:](self, "_createFeedContentFromDictionaries:initialContentReadyEntryIndex:", a4, 0x7FFFFFFFFFFFFFFFLL));
  -[BSUIFeedViewController setContent:](self, "setContent:", v5);

}

- (void)feedController:(id)a3 wantsToPushViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  objc_msgSend(v8, "pushViewController:animated:", v7, v5);

}

- (void)feedController:(id)a3 wantsToReplaceCurrentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
    v10 = (char *)objc_msgSend(v9, "count") - 1;
  else
    v10 = 0;
  objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  objc_msgSend(v11, "setViewControllers:animated:", v9, v5);

}

- (void)feedController:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5 params:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  BSUIFeedNavigationController *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  BSUIFeedNavigationController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BSUIFeedNavigationController *v29;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  v11 = (BSUIFeedNavigationController *)v9;
  v12 = objc_opt_class(NSNumber);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("noNavigationController")));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = v11;
  if ((v16 & 1) == 0)
  {
    v17 = -[BSUIFeedNavigationController initWithOptions:]([BSUIFeedNavigationController alloc], "initWithOptions:", v10);
    v29 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    -[BSUINavigationController setViewControllers:animated:](v17, "setViewControllers:animated:", v18, 0);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("presentationStyle")));

  if (v19)
  {
    v20 = objc_opt_class(NSNumber);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("presentationStyle")));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[BSUIFeedNavigationController setModalPresentationStyle:](v17, "setModalPresentationStyle:", objc_msgSend(v23, "integerValue"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transitionStyle")));

  if (v24)
  {
    v25 = objc_opt_class(NSNumber);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("transitionStyle")));
    v27 = BUDynamicCast(v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[BSUIFeedNavigationController setModalTransitionStyle:](v17, "setModalTransitionStyle:", objc_msgSend(v28, "integerValue"));

  }
  -[BSUIFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, v7, 0);

}

- (void)feedController:(id)a3 wantsToSlideInFeedViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "bsui_setPrefersExtraCompactNavBarMargin:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)feedController:(id)a3 wantsToPresentViewControllerInPopover:(id)a4 withParams:(id)a5
{
  -[BSUIFeedViewController showPopoverWithViewController:params:](self, "showPopoverWithViewController:params:", a4, a5);
}

- (void)feedController:(id)a3 wantsToPopViewController:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UNKNOWN **v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 < 2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardStackViewController](self, "cardStackViewController"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardStackViewController](self, "cardStackViewController"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_46DD8;
      v23[3] = &unk_2E4608;
      v24 = v7;
      objc_msgSend(v17, "popAllCardsAnimated:completion:", v5, v23);

      v15 = v24;
      goto LABEL_6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v19 = v18;
    v20 = &off_2FBB38;
    v21 = v7;
    v22 = 1753;
LABEL_9:
    objc_msgSend(v18, "enqueueValueCall:arguments:file:line:", v21, v20, CFSTR("BSUIFeedViewController.m"), v22);

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v12 = objc_msgSend(v11, "popViewControllerAnimated:", v5);

  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v19 = v18;
    v20 = &off_2FBAF0;
    v21 = v7;
    v22 = 1742;
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transitionCoordinator"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_46D80;
  v25[3] = &unk_2E3FB0;
  v26 = v7;
  objc_msgSend(v14, "animateAlongsideTransition:completion:", 0, v25);

  v15 = v26;
LABEL_6:

LABEL_10:
}

- (void)feedController:(id)a3 wantsToPopToRootViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  BOOL v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;

  v5 = a4;
  v22 = a5;
  v7 = dispatch_group_create();
  v8 = objc_opt_class(BCCardStackViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  v11 = BUDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = v12 != 0;
  if (v12)
  {
    dispatch_group_enter(v7);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_4705C;
    v28[3] = &unk_2E4608;
    v29 = v7;
    objc_msgSend(v12, "popAllCardsAnimated:prefersCrossfade:completion:", v5, 1, v28);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllers"));
  v16 = objc_msgSend(v15, "count");

  if ((unint64_t)v16 >= 2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    v18 = objc_msgSend(v17, "popToRootViewControllerAnimated:", v5);

    if (v5)
    {
      dispatch_group_enter(v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitionCoordinator"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_47064;
      v26[3] = &unk_2E3FB0;
      v27 = v7;
      objc_msgSend(v20, "animateAlongsideTransition:completion:", 0, v26);

    }
    v13 = 1;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4706C;
  block[3] = &unk_2E54E0;
  v24 = v22;
  v25 = v13;
  v21 = v22;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)feedController:(id)a3 wantsToDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_471C4;
  v8[3] = &unk_2E4608;
  v9 = a5;
  v7 = v9;
  -[BSUIFeedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, v8);

}

- (void)feedController:(id)a3 wantsToAppendCards:(id)a4 options:(id)a5
{
  -[BSUIFeedViewController appendFeedsInCards:options:](self, "appendFeedsInCards:options:", a4, a5);
}

- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;

  v9 = a6;
  v13 = a8;
  v14 = a7;
  v15 = a4;
  -[BSUIFeedViewController setWasPresentingCards:](self, "setWasPresentingCards:", 1);
  -[BSUIFeedViewController presentFeedsInCards:focusedIndex:animated:options:completion:](self, "presentFeedsInCards:focusedIndex:animated:options:completion:", v15, a5, v9, v14, v13);

}

- (void)feedController:(id)a3 didLoadCardResource:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_47344;
  v8[3] = &unk_2E5BE0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "viewControllerWhenAvailable:", v8);

}

- (void)feedController:(id)a3 collectAndFlush:(BOOL)a4 accumulatedImpressionsWithCompletion:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController impressionController](self, "impressionController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_473F0;
  v10[3] = &unk_2E5C08;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "collectAndFlush:accumulatedImpressionsWithCompletion:", v5, v10);

}

- (void)feedController:(id)a3 collectVisibleImpressionsWithCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController impressionController](self, "impressionController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_47618;
  v8[3] = &unk_2E5C08;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "collectVisibleImpressionsWithCompletion:", v8);

}

- (void)resetImpressionsForFeedController:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController impressionController](self, "impressionController", a3));
  objc_msgSend(v3, "reset");

}

- (void)feedController:(id)a3 collectStatsWithCompletion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_47854;
  v6[3] = &unk_2E5C30;
  v7 = a4;
  v5 = v7;
  -[BSUIFeedViewController collectStatsWithCompletion:](self, "collectStatsWithCompletion:", v6);

}

- (void)feedController:(id)a3 dismissKeyboard:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view", a3, a4));
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)feedController:(id)a3 scrollToItem:(id)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  BSUIFeedViewController *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v44 = a6;
  v6 = a5;
  v8 = a4;
  v9 = objc_opt_class(NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refId")));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_opt_class(NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refInstance")));
  v15 = BUDynamicCast(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = objc_opt_class(NSString);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entryID")));
  v19 = BUDynamicCast(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = objc_opt_class(NSNumber);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entryIndex")));
  v23 = BUDynamicCast(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  v45 = self;
  if (v20)
  {
    v46 = v16;
    v42 = v6;
    v43 = v12;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "entries"));

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uid"));
          v33 = objc_msgSend(v32, "isEqualToString:", v20);

          if (v33)
          {
            v16 = v46;
            v12 = v43;
            -[BSUIFeedViewController scrollToRefId:refInstance:onEntry:animated:skipVoiceOverFocus:](v45, "scrollToRefId:refInstance:onEntry:animated:skipVoiceOverFocus:", v43, v46, v31, v42, v44);

            goto LABEL_17;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v28)
          continue;
        break;
      }
    }

    v12 = v43;
    goto LABEL_16;
  }
  if (v24)
  {
    v34 = (unint64_t)objc_msgSend(v24, "integerValue");
    if ((v34 & 0x8000000000000000) == 0)
    {
      v35 = v34;
      v46 = v16;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "entries"));
      v38 = objc_msgSend(v37, "count");

      v16 = v46;
      if (v35 < (unint64_t)v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "entries"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndexedSubscript:", v35));
        -[BSUIFeedViewController scrollToRefId:refInstance:onEntry:animated:skipVoiceOverFocus:](self, "scrollToRefId:refInstance:onEntry:animated:skipVoiceOverFocus:", v12, v46, v41, v6, v44);

LABEL_16:
        v16 = v46;
      }
    }
  }
LABEL_17:

}

- (void)feedControllerWillHotReload:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchController"));
  objc_msgSend(v3, "setActive:", 0);

}

- (void)feedController:(id)a3 requestToSetNavigationBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem"));
  if (!objc_msgSend(v11, "state")
    && objc_msgSend(v11, "isHidden") != v6
    && (objc_msgSend(v9, "_isManualScrollEdgeAppearanceEnabled") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
    objc_msgSend(v10, "setNavigationBarHidden:animated:", v6, v5);

  }
}

- (void)feedController:(id)a3 requestToRenderSharableImage:(id)a4 completion:(id)a5
{
  -[BSUIFeedViewController renderSharableImageWithOptions:completion:](self, "renderSharableImageWithOptions:completion:", a4, a5);
}

- (void)feedController:(id)a3 addAlphaOverrideToItem:(id)a4 alpha:(double)a5 animated:(BOOL)a6 duration:(double)a7
{
  _BOOL8 v8;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a6;
  v11 = a4;
  v12 = objc_opt_class(NSString);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("refId")));
  v14 = BUDynamicCast(v12, v13);
  v19 = (id)objc_claimAutoreleasedReturnValue(v14);

  v15 = objc_opt_class(NSString);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("refInstance")));

  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v19)
    -[BSUIFeedViewController _addAlphaOverrideToRefId:refInstance:alpha:animated:duration:](self, "_addAlphaOverrideToRefId:refInstance:alpha:animated:duration:", v19, v18, v8, a5, a7);

}

- (void)feedController:(id)a3 removeAlphaOverrideFromItem:(id)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL8 v7;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a5;
  v9 = a4;
  v10 = objc_opt_class(NSString);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("refId")));
  v12 = BUDynamicCast(v10, v11);
  v17 = (id)objc_claimAutoreleasedReturnValue(v12);

  v13 = objc_opt_class(NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("refInstance")));

  v15 = BUDynamicCast(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v17)
    -[BSUIFeedViewController _removeAlphaOverrideFromRefId:refInstance:animated:duration:](self, "_removeAlphaOverrideFromRefId:refInstance:animated:duration:", v17, v16, v7, a6);

}

- (void)feedController:(id)a3 addObserver:(id)a4 forTrigger:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BSUIFeedTriggerBlockObserver *feedTriggerObserver;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (objc_msgSend(v9, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController triggerStateManager](self, "triggerStateManager"));

      if (v11)
      {
        feedTriggerObserver = self->_feedTriggerObserver;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController triggerStateManager](self, "triggerStateManager"));
        -[BSUIFeedTriggerBlockObserver addObserver:forTrigger:inStateManager:](feedTriggerObserver, "addObserver:forTrigger:inStateManager:", v8, v10, v13);

      }
    }
  }

}

- (void)feedController:(id)a3 removeObserver:(id)a4 forTrigger:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BSUIFeedTriggerBlockObserver *feedTriggerObserver;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (objc_msgSend(v9, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController triggerStateManager](self, "triggerStateManager"));

      if (v11)
      {
        feedTriggerObserver = self->_feedTriggerObserver;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController triggerStateManager](self, "triggerStateManager"));
        -[BSUIFeedTriggerBlockObserver removeObserver:forTrigger:inStateManager:](feedTriggerObserver, "removeObserver:forTrigger:inStateManager:", v8, v10, v13);

      }
    }
  }

}

- (void)feedController:(id)a3 wantsToPerformRawActionModel:(id)a4 shouldReportFigaro:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jetActionHandlerInContext](self, "jetActionHandlerInContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  objc_msgSend(v9, "performRawActionModel:withParentTracker:shouldReportFigaro:sourceViewController:completion:", v7, v8, v5, self, &stru_2E5C70);

}

- (CGRect)getSourceRectFromOptions:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect result;

  v4 = a3;
  v5 = v4;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefId")));

    if (v10)
    {
      v11 = objc_opt_class(NSString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefId")));
      v13 = BUDynamicCast(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      v15 = objc_opt_class(NSString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefInstance")));
      v17 = BUDynamicCast(v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v19 = objc_opt_class(NSString);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorEntryID")));
      v21 = BUDynamicCast(v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if (v14 && v18 && v22)
      {
        -[BSUIFeedViewController _frameOfElementWithEntryID:refId:refInstance:](self, "_frameOfElementWithEntryID:refId:refInstance:", v22, v14, v18);
        x = v23;
        y = v24;
        width = v25;
        height = v26;
      }
LABEL_14:

      goto LABEL_15;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceRect")));

    if (v27)
    {
      v28 = objc_opt_class(NSDictionary);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceRect")));
      v30 = BUDynamicCast(v28, v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v30);

      v31 = objc_opt_class(NSNumber);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("x")));
      v33 = BUDynamicCast(v31, v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v33);

      v34 = objc_opt_class(NSNumber);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("y")));
      v36 = BUDynamicCast(v34, v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v36);

      v37 = objc_opt_class(NSNumber);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("width")));
      v39 = BUDynamicCast(v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

      v41 = objc_opt_class(NSNumber);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("height")));
      v43 = BUDynamicCast(v41, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

      if (v18 && v22 && v40 && v44)
      {
        objc_msgSend(v18, "doubleValue");
        x = v45;
        objc_msgSend(v22, "doubleValue");
        y = v46;
        objc_msgSend(v40, "doubleValue");
        width = v47;
        objc_msgSend(v44, "doubleValue");
        height = v48;
      }

      goto LABEL_14;
    }
  }
LABEL_15:

  v49 = x;
  v50 = y;
  v51 = width;
  v52 = height;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (id)_getBarButtonItemFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefId"))),
        v6,
        v6))
  {
    v7 = objc_opt_class(NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefId")));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = objc_opt_class(NSString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorRefInstance")));
    v13 = BUDynamicCast(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = objc_opt_class(NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("popoverAnchorEntryID")));
    v17 = BUDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = 0;
    if (v10 && v14 && v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, v18, v10, v14));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationBarItemMatchingQuery:](self, "navigationBarItemMatchingQuery:", v20));

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)getTintColorFromOptions:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;

  v3 = a3;
  v4 = objc_opt_class(NSDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tintColor")));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = objc_opt_class(NSDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tintColor")));
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = objc_opt_class(NSNumber);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("red")));
    v14 = BUDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = objc_opt_class(NSNumber);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("green")));
    v18 = BUDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_opt_class(NSNumber);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("blue")));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = objc_opt_class(NSNumber);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("alpha")));
    v26 = BUDynamicCast(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v28 = 0;
    if (v15 && v19 && v23 && v27)
    {
      objc_msgSend(v15, "floatValue");
      v30 = v29;
      objc_msgSend(v19, "floatValue");
      v32 = v31;
      objc_msgSend(v23, "floatValue");
      v34 = v33;
      objc_msgSend(v27, "floatValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v30, v32, v34, v35));
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)showPopoverWithViewController:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  BSUINavigationController *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  BSUINavigationController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  float v28;
  double v29;
  uint64_t v30;
  void *v31;
  id v32;
  BSUINavigationController *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  float v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  void *v48;
  void *v49;
  BSUINavigationController *v50;

  v6 = a3;
  v7 = a4;
  v8 = (BSUINavigationController *)v6;
  v9 = objc_opt_class(NSNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("noNavigationController")));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = v8;
  if ((v13 & 1) == 0)
  {
    v14 = -[BSUINavigationController initWithOptions:]([BSUINavigationController alloc], "initWithOptions:", v7);
    v50 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
    -[BSUINavigationController setViewControllers:animated:](v14, "setViewControllers:animated:", v15, 0);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentPopOverViewController](self, "currentPopOverViewController"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentPopOverViewController](self, "currentPopOverViewController"));
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("arrowDirection")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("arrowDirection")));
      v21 = objc_msgSend(v20, "integerValue");

    }
    else
    {
      v21 = &dword_0 + 1;
    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("width")));
    if (v22)
    {
      v23 = (void *)v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("height")));

      if (v24)
      {
        v25 = objc_opt_class(NSNumber);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("width")));
        v26 = BUDynamicCast(v25, v49);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        objc_msgSend(v27, "floatValue");
        v29 = v28;
        v30 = objc_opt_class(NSNumber);
        v31 = v18;
        v32 = v21;
        v33 = v8;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("height")));
        v35 = BUDynamicCast(v30, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        objc_msgSend(v36, "floatValue");
        -[BSUINavigationController setPreferredContentSize:](v14, "setPreferredContentSize:", v29, v37);

        v8 = v33;
        v21 = v32;
        v18 = v31;

      }
    }
  }
  else
  {
    v21 = &dword_0 + 1;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentationStyle")));

  if (v38)
  {
    v39 = objc_opt_class(NSNumber);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("presentationStyle")));
    v41 = BUDynamicCast(v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    -[BSUINavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", objc_msgSend(v42, "integerValue"));

  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v40, "horizontalSizeClass") == (char *)&dword_0 + 1)
      v43 = 2;
    else
      v43 = 7;
    -[BSUINavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", v43);
  }

  -[BSUIFeedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINavigationController popoverPresentationController](v14, "popoverPresentationController"));
  objc_msgSend(v44, "setPermittedArrowDirections:", v21);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(v44, "setBackgroundColor:", v45);

  objc_msgSend(v44, "setSourceView:", v18);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController traitCollection](self, "traitCollection"));
  v47 = (char *)objc_msgSend(v46, "horizontalSizeClass");

  if (v47 == (_BYTE *)&dword_0 + 2)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _getBarButtonItemFromOptions:](self, "_getBarButtonItemFromOptions:", v7));
    if (v48)
    {
      objc_msgSend(v44, "setBarButtonItem:", v48);
    }
    else
    {
      -[BSUIFeedViewController getSourceRectFromOptions:](self, "getSourceRectFromOptions:", v7);
      objc_msgSend(v44, "setSourceRect:");
    }

  }
  -[BSUIFeedViewController setCurrentPopOverViewController:](self, "setCurrentPopOverViewController:", v14);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController alertController](self, "alertController"));
  objc_msgSend(v5, "dismiss");

  -[BSUIFeedViewController setAlertController:](self, "setAlertController:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController currentPopOverViewController](self, "currentPopOverViewController"));
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  -[BSUIFeedViewController setCurrentPopOverViewController:](self, "setCurrentPopOverViewController:", 0);
  v7 = objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
      objc_msgSend(v14, "bounds");
      objc_msgSend(v13, "sizeThatFits:", v15, v16);

    }
  }
}

- (BOOL)shouldNotifyScrollViewReachedTheBottom
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  void *v22;
  double v23;
  double v24;

  -[BSUIFeedViewController viewSizeWhenNotifiedBottomReached](self, "viewSizeWhenNotifiedBottomReached");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "bounds");
  v10 = v6 == v9 && v4 == v8;

  if (v10 && -[BSUIFeedViewController alreadyNotifiedBottomReached](self, "alreadyNotifiedBottomReached"))
    return 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "contentOffset");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v15, "bounds");
  v17 = v14 + v16 + 50.0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v18, "contentSize");
  v20 = v19;

  v11 = v17 > v20;
  v21 = v17 <= v20 || v10;
  if ((v21 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController scrollView](self, "scrollView"));
    objc_msgSend(v22, "bounds");
    -[BSUIFeedViewController setViewSizeWhenNotifiedBottomReached:](self, "setViewSizeWhenNotifiedBottomReached:", v23, v24);

  }
  return v11;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[BSUIFeedViewController setAlreadyNotifiedBottomReached:](self, "setAlreadyNotifiedBottomReached:", 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController scrollViewDidScroll:](&v5, "scrollViewDidScroll:", a3);
  if (-[BSUIFeedViewController shouldNotifyScrollViewReachedTheBottom](self, "shouldNotifyScrollViewReachedTheBottom"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
    objc_msgSend(v4, "notifyScrollViewReachedTheBottom");

    -[BSUIFeedViewController setAlreadyNotifiedBottomReached:](self, "setAlreadyNotifiedBottomReached:", 1);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v6;
  unsigned int v7;
  id v8;

  if (a4.y < -3.5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController", a3, a5));
    v7 = objc_msgSend(v6, "isNavigationBarHidden");

    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
      objc_msgSend(v8, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", 0, 0.0);

    }
  }
}

- (id)coverAnimationHostSourceForUUID:(id)a3 uid:(id)a4 refId:(id)a5 refInstance:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BSUICoverAnimatingSource *v24;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", a3, a4, a5, v10));
  v12 = objc_claimAutoreleasedReturnValue(+[BSUICoverAnimatingSource renderReferenceMatchingQuery:inFeedViewController:](BSUICoverAnimatingSource, "renderReferenceMatchingQuery:inFeedViewController:", v11, self));
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, 0, CFSTR("cover"), v10));

    v15 = objc_claimAutoreleasedReturnValue(+[BSUICoverAnimatingSource renderReferenceMatchingQuery:inFeedViewController:](BSUICoverAnimatingSource, "renderReferenceMatchingQuery:inFeedViewController:", v14, self));
    if (!v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uid"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v13, v20, CFSTR("audiobook-control"), v10));
      goto LABEL_6;
    }
    v13 = (void *)v15;
    v11 = v14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v16, v17, v18, v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uid"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v20, v21, CFSTR("audiobook-control"), v22));

LABEL_6:
  v24 = -[BSUICoverAnimatingSource initWithFeedViewController:query:audioBookControlQuery:]([BSUICoverAnimatingSource alloc], "initWithFeedViewController:query:audioBookControlQuery:", self, v14, v23);

  return v24;
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  return 0;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  id v4;
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  BOOL v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v4, "coverAnimationSourceFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coverAnimationSourceReferenceView"));

  objc_msgSend(v5, "convertRect:fromView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
  objc_msgSend(v24, "layoutFrame");
  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  v32 = CGRectIntersection(v31, v34);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;

  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (CGRectIsEmpty(v33))
    return 0;
  v30 = vabdd_f64(width, v20) < 0.01;
  return vabdd_f64(height, v22) < 0.01 && v30;
}

- (void)coverAnimationHostScrollToMakeVisible:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  v12 = a3;
  v4 = objc_opt_class(BSUICoverAnimatingSource);
  v5 = BUDynamicCast(v4, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "query"));
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "coverAnimationSourceFrame");
      v14.origin.x = CGRectZero.origin.x;
      v14.origin.y = CGRectZero.origin.y;
      v14.size.width = CGRectZero.size.width;
      v14.size.height = CGRectZero.size.height;
      v10 = CGRectEqualToRect(v13, v14);

      if (!v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));
        -[BSUIFeedViewController scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:](self, "scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:", v11, 18, 0, 0);

        objc_msgSend(v12, "coverAnimationSourceInvalidateFrame");
      }
    }
  }

}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  UIView *v8;
  UIView *popoverArrowBackgroundView;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  if (-[BSUIFeedViewController modalPresentationStyle](self, "modalPresentationStyle") == (char *)&dword_4 + 3
    && !self->_popoverArrowBackgroundView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;

    if (v5 > 0.0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
      v7 = objc_alloc((Class)UIView);
      objc_msgSend(v6, "frame");
      v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0);
      popoverArrowBackgroundView = self->_popoverArrowBackgroundView;
      self->_popoverArrowBackgroundView = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
      -[UIView setBackgroundColor:](self->_popoverArrowBackgroundView, "setBackgroundColor:", v10);

      objc_msgSend(v6, "addSubview:", self->_popoverArrowBackgroundView);
    }
  }
}

- (void)coverAnimationHostPrepareWithCompletion:(id)a3
{
  id v3;

  v3 = -[BSUIFeedViewController waitForVisibleImageResourcesToLoadAssertionWithTimeout:completion:](self, "waitForVisibleImageResourcesToLoadAssertionWithTimeout:completion:", a3, 0.2);
}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (char *)&dword_0 + 2;

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (id)_coverSourceQueryForRepresentedObject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;

  v3 = a3;
  v4 = objc_opt_class(NSDictionary);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id")));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instanceId")));
  v9 = (void *)v8;
  if (v8)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10)
    v11 = v7;
  else
    v11 = (void *)v8;
  v12 = v11;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entryID")));
  v14 = (void *)v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v16 = 0;
  }
  else
  {
    v17 = objc_opt_class(NSNumber);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("columnIndex")));
    v19 = BUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (!v20 || ((unint64_t)objc_msgSend(v20, "integerValue") & 0x8000000000000000) != 0)
      v21 = CFSTR("cover");
    else
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, v14, v21, v12));

  }
  return v16;
}

- (id)coverSourceForRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BSUICardStackTransitioningCoverSource *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _coverSourceQueryForRepresentedObject:](self, "_coverSourceQueryForRepresentedObject:", v4));
  if (!v5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!+[BSUICardStackTransitioningCoverSource isValidSourceWithFeedViewController:query:](BSUICardStackTransitioningCoverSource, "isValidSourceWithFeedViewController:query:", self, v5))
  {
    v12 = BCCardModelLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_238E20(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_7;
  }
  v6 = objc_opt_class(NSDictionary);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isInNonHorizontalLayout")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = -[BSUICardStackTransitioningCoverSource initWithFeedViewController:query:isInNonHorizontalLayout:]([BSUICardStackTransitioningCoverSource alloc], "initWithFeedViewController:query:isInNonHorizontalLayout:", self, v5, v10);
LABEL_8:

  return v11;
}

- (unint64_t)visibilityOfCoverSource:(id)a3 ignoringYAxis:(BOOL)a4
{
  int v4;
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
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  unsigned int v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v6, "cardStackTransitioningCoverSourceFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardStackTransitioningCoverSourceReferenceView"));

  objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v25, "bounds");
  v35.origin.x = v18;
  v35.origin.y = v20;
  v35.size.width = v22;
  v35.size.height = v24;
  v33 = CGRectIntersection(v32, v35);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;

  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (CGRectIsEmpty(v34))
    return 2;
  v31 = (vabdd_f64(height, v24) >= 0.01) & ~v4;
  if (vabdd_f64(width, v22) >= 0.01)
    return 1;
  else
    return v31;
}

- (void)revealCoverForRepresentedObject:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _coverSourceQueryForRepresentedObject:](self, "_coverSourceQueryForRepresentedObject:", a3));
  if (v4)
  {
    v5 = v4;
    -[BSUIFeedViewController scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:](self, "scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:", v4, 0, 0, 0);
    v4 = v5;
  }

}

- (void)updateFeedContentSynchronously
{
  -[BSUIFeedViewController flushPendingTransactionsWithTimeout:](self, "flushPendingTransactionsWithTimeout:", 2.0);
}

- (void)updateFeedContentWithCompletion:(id)a3
{
  -[BSUIFeedViewController flushPendingTransactionsWithCompletion:](self, "flushPendingTransactionsWithCompletion:", a3);
}

- (BCCardStackTransitioningCoverSource)cardStackTransitioningCardContentCoverSource
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BSUICardStackTransitioningCoverSource *v19;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "options"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id")));
  v9 = objc_opt_class(NSNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isInNonHorizontalLayout")));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entries"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v17, 0, CFSTR("cover"), v8));
    v19 = -[BSUICardStackTransitioningCoverSource initWithFeedViewController:query:isInNonHorizontalLayout:]([BSUICardStackTransitioningCoverSource alloc], "initWithFeedViewController:query:isInNonHorizontalLayout:", self, v18, v13);

  }
  else
  {
    v19 = 0;
  }

  return (BCCardStackTransitioningCoverSource *)v19;
}

- (void)cardStackTransitioningCardContentFinalizePreparationForOpen
{
  if (!self->_openFinalized)
    -[BSUIFeedViewController pauseUpdates](self, "pauseUpdates");
}

- (void)cardStackTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 index:(unint64_t)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v13 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[BSUIFeedViewController setPerformanceIdentifier:](self, "setPerformanceIdentifier:", v12);

  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v13, 0, 1, v11, width, height);
}

- (void)_prepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  void (*v24)(uint64_t);
  void *v25;
  BSUIFeedViewController *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37[4];
  id location;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_4A2C4;
  v33[3] = &unk_2E5CE8;
  objc_copyWeak(v37, &location);
  v16 = v13;
  v34 = v16;
  v17 = v14;
  v35 = v17;
  v37[1] = *(id *)&width;
  v37[2] = *(id *)&height;
  v37[3] = (id)a6;
  v18 = v15;
  v36 = v18;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v24 = sub_4A554;
  v25 = &unk_2E5D10;
  v28 = &v29;
  v26 = self;
  v19 = objc_retainBlock(v33);
  v27 = v19;
  v20 = v23;
  os_unfair_lock_lock(&self->_stateLock);
  v24((uint64_t)v20);
  os_unfair_lock_unlock(&self->_stateLock);

  v21 = v30[3];
  if (!v21)
  {
    -[BSUIFeedViewController loadEntries](self, "loadEntries");
    v21 = v30[3];
  }
  if (v21 == 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
    ((void (*)(_QWORD *, void *))v19[2])(v19, v22);

  }
  _Block_object_dispose(&v29, 8);

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);

}

- (void)cardStackTransitioningCardContentFinalizeForOpen
{
  -[BSUIFeedViewController resumeUpdates](self, "resumeUpdates");
  -[BSUIFeedViewController layoutIfNeeded](self, "layoutIfNeeded");
  self->_openFinalized = 1;
  -[BSUIFeedViewController setPerformanceIdentifier:](self, "setPerformanceIdentifier:", 0);
}

- (void)cardStackTransitioningCardContentPrepareForDismiss
{
  -[BSUIFeedViewController pauseUpdates](self, "pauseUpdates");
}

- (id)cardStackTransitionSuspendUpdatesAssertion
{
  return -[BSUIFeedViewController suspendUpdates](self, "suspendUpdates");
}

- (void)cardStackTransitionSuspendUpdatesUntilEndOfTransaction
{
  -[BSUIFeedViewController suspendUpdatesUntilEndOfTransaction:](self, "suspendUpdatesUntilEndOfTransaction:", 0);
}

- (id)artworkSourceInEntryWithIndex:(unint64_t)a3 refId:(id)a4 refInstance:(id)a5 isCover:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BSUISheetTransitioningArtworkSource *v17;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController content](self, "content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entries"));

  if ((unint64_t)objc_msgSend(v13, "count") <= a3)
  {
    v17 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v15, 0, v10, v11));
    v17 = 0;
    if (+[BSUISheetTransitioningArtworkSource isValidSourceWithFeedViewController:query:](BSUISheetTransitioningArtworkSource, "isValidSourceWithFeedViewController:query:", self, v16))
    {
      v17 = -[BSUISheetTransitioningArtworkSource initWithFeedViewController:query:isCover:]([BSUISheetTransitioningArtworkSource alloc], "initWithFeedViewController:query:isCover:", self, v16, v6);
    }

  }
  return v17;
}

- (unint64_t)visibilityOfArtworkSource:(id)a3
{
  id v4;
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  _BOOL4 v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "referenceView"));

  objc_msgSend(v5, "convertRect:fromView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v23, "bounds");
  v33.origin.x = v16;
  v33.origin.y = v18;
  v33.size.width = v20;
  v33.size.height = v22;
  v31 = CGRectIntersection(v30, v33);
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;

  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectIsEmpty(v32))
    return 2;
  v29 = vabdd_f64(width, v20) >= 0.01;
  return vabdd_f64(height, v22) >= 0.01 || v29;
}

- (id)sheetTransitioningCardContentArtworkSourceInEntryWithIndex:(unint64_t)a3
{
  return -[BSUIFeedViewController artworkSourceInEntryWithIndex:refId:refInstance:isCover:](self, "artworkSourceInEntryWithIndex:refId:refInstance:isCover:", a3, CFSTR("cover"), 0, 1);
}

- (void)sheetTransitioningCardContentPrepareForOpenWithViewController:(id)a3 viewSize:(CGSize)a4 overrideTraitsBlock:(id)a5 numEntries:(int64_t)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a5;
  v15 = a3;
  -[BSUIFeedViewController setPerformanceIdentifier:](self, "setPerformanceIdentifier:", &off_2FB9F0);
  self->_openFinalized = 0;
  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v15, v14, a6, v13, width, height);

}

- (void)preloadAugmentedExperienceContentWithViewController:(id)a3 numEntries:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  id v36[2];
  _QWORD v37[4];
  id v38;
  os_signpost_id_t v39;
  uint8_t buf[4];
  BSUIFeedViewController *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int64_t v47;
  CGSize v48;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  v15 = BCAugmentedExperienceLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v48.width = v12;
    v48.height = v14;
    v17 = NSStringFromCGSize(v48);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138413058;
    v41 = self;
    v42 = 2112;
    v43 = v8;
    v44 = 2112;
    v45 = v18;
    v46 = 2048;
    v47 = a4;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%@: preloadAugmentedExperienceContent _prepareForOpen (vc: %@, viewSize: %@, numEntries: %ld)", buf, 0x2Au);

  }
  v19 = BCAugmentedExperienceSignpost();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = os_signpost_id_generate(v20);

  v22 = BCAugmentedExperienceSignpost();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "BSUIFeedVC.AugExp.preload", ", buf, 2u);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_4AC74;
  v37[3] = &unk_2E5D38;
  v39 = v21;
  v25 = v9;
  v38 = v25;
  v26 = objc_retainBlock(v37);
  v27 = BCAugmentedExperienceSignpost();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = (char *)os_signpost_id_generate(v28);

  v30 = BCAugmentedExperienceSignpost();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = v31;
  if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v29, "BSUIFeedVC.AugExp.prepareForOpen", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_4AD98;
  v34[3] = &unk_2E5D88;
  objc_copyWeak(v36, (id *)buf);
  v36[1] = v29;
  v34[4] = self;
  v33 = v26;
  v35 = v33;
  -[BSUIFeedViewController _prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:](self, "_prepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v8, 0, a4, v34, v12, v14);

  objc_destroyWeak(v36);
  objc_destroyWeak((id *)buf);

}

- (id)accessibilityCardContentSummary
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilitySummary"));

  return v4;
}

- (BOOL)shouldOnlyAllowDismiss
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController contentUnavailableConfiguration](self, "contentUnavailableConfiguration"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)prefersAdditionalSafeAreaInsetsForInsetting
{
  return 0;
}

- (void)auxiliaryNavigationBarViewControllerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4B34C;
  v7[3] = &unk_2E5DD8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "createViewControllerForFeedViewController:shouldReportFigaro:completionHandler:", self, 1, v7);

}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerIfAvailable"));
  objc_msgSend(v6, "suspendAndTeardown");

  v7.receiver = self;
  v7.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController suspendAndTeardownForReason:](&v7, "suspendAndTeardownForReason:", v4);

}

- (id)resumeAndRebuildForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BSUIFeedViewController;
  v4 = -[BSUIFeedViewController resumeAndRebuildForReason:](&v10, "resumeAndRebuildForReason:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerIfAvailable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController triggerStateManager](self, "triggerStateManager"));
  objc_msgSend(v7, "resumeAndRebuildWithTriggerStateManager:", v8);

  return v5;
}

- (void)_customizePresentationUsingViewController:(id)a3 environment:(id)a4
{
  id v6;
  unsigned int v7;
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
  BSUIFeedViewController *v21;

  v21 = (BSUIFeedViewController *)a3;
  v6 = a4;
  if (v21 == self)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController traitCollection](v21, "traitCollection"));
    v7 = objc_msgSend(v8, "bc_userInterfaceStyleDark");

  }
  else
  {
    v7 = objc_msgSend(v6, "style") == (char *)&dword_0 + 2;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dayBackgroundColor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController jsFeedController](self, "jsFeedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nightBackgroundColor"));

  if (v11 && v14)
  {
    if (v7)
      v15 = v14;
    else
      v15 = v11;
    -[BSUIFeedViewController _updateViewWithBackgroundColor:](self, "_updateViewWithBackgroundColor:", v15);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    -[BSUIFeedViewController _updateViewWithBackgroundColor:](self, "_updateViewWithBackgroundColor:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.1804, 0.1804, 0.1804, 1.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v17, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDragController sharedInstance](TUIDragController, "sharedInstance"));
  objc_msgSend(v20, "setDragBackgroundColor:", v19);

}

- (void)feedViewController:(id)a3 customizeEnvironment:(id)a4
{
  -[BSUIFeedViewController _customizePresentationUsingViewController:environment:](self, "_customizePresentationUsingViewController:environment:", self, a4);
}

- (UIEdgeInsets)feedViewController:(id)a3 contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardContentScrollManager](self, "cardContentScrollManager", a3));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardContentScrollManager](self, "cardContentScrollManager"));
    objc_msgSend(v10, "cardContentViewController:contentInsetsForScrollingToRectWithContentInsets:", self, top, left, bottom, right);
    top = v11;
    left = v12;
    bottom = v13;
    right = v14;

  }
  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)feedViewController:(id)a3 willTransitionToLayoutState:(unint64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4B828;
  block[3] = &unk_2E5E00;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)feedViewControllerInitialContentReady:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[16];

  v4 = kdebug_trace(725353856, 0, 0, 0, 0);
  v5 = BSUIFeedViewControllerLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "feedViewControllerInitialContentReady: Sending BSUIFeedInitialContentReadyNotification", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("BSUIFeedInitialContentReadyNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v8, "notifyInitialContentReady");

  if (-[BSUIFeedViewController deferUIUpdateUntilInitialContentReady](self, "deferUIUpdateUntilInitialContentReady"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4BBC0;
    block[3] = &unk_2E4608;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4BC7C;
    v9[3] = &unk_2E4608;
    v9[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  }
}

- (void)feedViewControllerAllContentReady:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController", a3));
  objc_msgSend(v3, "allContentReady");

}

- (unint64_t)statsModeForFeedViewController:(id)a3
{
  return 4;
}

- (void)hideLoadingViewForFeedController:(id)a3
{
  if (self)
  {
    self->_showLoadingView = 0;
    -[BSUIFeedViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration", a3);
  }
}

- (BOOL)feedViewControllerIsConsideredVisible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[BSUIFeedViewController bc_analyticsVisibility](self, "bc_analyticsVisibility", a3))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = objc_msgSend(v6, "activationState") == 0;

  return v7;
}

- (void)didEndDragSession:(id)a3 dropOperation:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  NSMutableDictionary *v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BSUIFeedViewController;
  v21 = a4;
  -[BSUIFeedViewController didEndDragSession:dropOperation:](&v26, "didEndDragSession:dropOperation:", v6, a4);
  v7 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(BSUIItemDescription);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localObject"));
        v16 = BUDynamicCast(v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storeID"));
        if (objc_msgSend(v18, "length"))
          -[NSMutableArray addObject:](v7, "addObject:", v18);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  if (v21 - 1 > 2)
    v19 = CFSTR("cancel");
  else
    v19 = off_2E5F20[v21 - 1];
  v20 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", JSARecordEventTypeDragAndDrop, JSARecordKeyEventType);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, JSARecordKeyResult);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v7, JSARecordKeyItems);
  +[JSAApplication recordNativeEvent:](JSAApplication, "recordNativeEvent:", v20);

}

- (void)hostingController:(id)a3 didChangeContentIdentifiers:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a4;
  v6 = objc_opt_class(BSUICardNavigationController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationController](self, "navigationController"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9 || objc_msgSend(v9, "isCurrentCard"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", self));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "type"));
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("message"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
            objc_msgSend(v10, "addObject:", v19);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(v20, "_scheduleUpdateEngagementMessagesToDisplay:", v10);
    v5 = v21;
  }

}

- (void)removeProviderForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
  objc_msgSend(v5, "removeProviderForIdentifier:", v4);

}

- (void)hostedMessageViewDidTriggerAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  objc_msgSend(v5, "notifyOnMessageActionTriggered:", v4);

}

- (void)hostedMessageViewDidBecomeVisible:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[BSUIFeedViewController isInCard](self, "isInCard"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardStackViewController](self, "cardStackViewController"));
    objc_msgSend(v4, "viewController:didDisplayMessageWithId:", self, v5);

  }
}

- (void)setupAMSEngagementObservers
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc((Class)AMSEngagement);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v4 = objc_msgSend(v3, "initWithBag:", v5);
  -[BSUIFeedViewController setAmsEngagement:](self, "setAmsEngagement:", v4);

}

- (void)addEngagementObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController amsEngagement](self, "amsEngagement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  objc_msgSend(v6, "addObserver:placement:serviceType:", self, v5, CFSTR("books"));
}

- (void)removeEngagementObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController amsEngagement](self, "amsEngagement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  objc_msgSend(v6, "removeObserver:placement:serviceType:", self, v5, CFSTR("books"));
}

- (void)_updateEngagementMessagesToDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messagePlacements"));
  v6 = (void *)v5;
  v7 = &__NSArray0__struct;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v20 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v8));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifiers"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "type"));
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("message"));

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  -[BSUIFeedViewController _scheduleUpdateEngagementMessagesToDisplay:](self, "_scheduleUpdateEngagementMessagesToDisplay:", v9);
}

- (void)_scheduleUpdateEngagementMessagesToDisplay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (self->_deferredEngagementMessageIdentifiers)
  {
    v6 = BSUIFeedViewControllerLog(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "_scheduleUpdateEngagementMessagesToDisplay: deferring updating engagement messages for: %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSMutableSet unionSet:](self->_deferredEngagementMessageIdentifiers, "unionSet:", v5);
  }
  else
  {
    -[BSUIFeedViewController _updateEngagementMessagesToDisplay:](self, "_updateEngagementMessagesToDisplay:", v4);
  }

}

- (void)_updateEngagementMessagesToDisplay:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id inited;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _localIdentifiers](self, "_localIdentifiers"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = v8;

    objc_msgSend(v9, "unionSet:", v5);
    v10 = objc_msgSend(v9, "copy");

    v4 = v10;
  }
  if (objc_msgSend(v4, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController bc_effectiveEngagementProvider](self, "bc_effectiveEngagementProvider"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
      inited = objc_initWeak(&location, self);
      v14 = BSUIFeedViewControllerLog(inited);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "_updateEngagementMessagesToDisplay: fetchDialogRequestsFor: %@", buf, 0xCu);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_4C96C;
      v17[3] = &unk_2E5E50;
      objc_copyWeak(&v20, &location);
      v16 = v12;
      v18 = v16;
      v19 = v5;
      objc_msgSend(v11, "fetchDialogRequestsFor:completion:", v4, v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

    }
  }

}

- (id)_localIdentifiers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BSUIFeedViewController isInCard](self, "isInCard"))
    objc_msgSend(v3, "addObject:", CFSTR("product_page_want_to_read_bubble_tip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return v4;
}

- (void)_handleEngagementMessageRequest:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BSUIHostedMessageViewProvider *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if ((char *)objc_msgSend(v6, "style") - 3 <= (_BYTE *)&dword_0 + 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
    v9 = -[BSUIHostedMessageViewProvider initWithRequest:identifier:delegate:]([BSUIHostedMessageViewProvider alloc], "initWithRequest:identifier:delegate:", v6, v7, self);
    objc_msgSend(v8, "addProvider:forIdentifier:", v9, v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_4D02C;
    v11[3] = &unk_2E5E78;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "viewControllerWhenAvailable:", v11);

  }
}

- (void)_displayBottomBannerForRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));

  if (!v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)BCMessageViewControllerProvider), "initWithRequest:placement:", v9, CFSTR("store_page_bottom_banner"));
    -[BSUIFeedViewController setMessageViewControllerProvider:](self, "setMessageViewControllerProvider:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewController"));
    -[BSUIFeedViewController _displayBottomBanner:animated:](self, "_displayBottomBanner:animated:", v8, 1);

  }
}

- (void)_displayBottomBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat Height;
  double v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "sizeThatFits:", CGRectGetWidth(v30), 1.79769313e308);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v31);
  v14 = Height - v12;
  objc_msgSend(v8, "setFrame:", 0.0, Height - v12, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v15, "setCornerRadius:", 0.0);

  objc_msgSend(v8, "setAutoresizingMask:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", v8);

  -[BSUIFeedViewController addChildViewController:](self, "addChildViewController:", v6);
  if (v4)
  {
    v32.origin.x = 0.0;
    v32.origin.y = v14;
    v32.size.width = v10;
    v32.size.height = v12;
    objc_msgSend(v8, "setFrame:", 0.0, v14 + CGRectGetHeight(v32), v10, v12);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_4D378;
    v24[3] = &unk_2E5EA0;
    v25 = v8;
    v26 = 0;
    v27 = v14;
    v28 = v10;
    v29 = v12;
    v17 = objc_retainBlock(v24);
    v18 = BUProtocolCast(&OBJC_PROTOCOL___AMSUIMessageViewController, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "loadPromise"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_4D420;
      v22[3] = &unk_2E4FB8;
      v23 = v17;
      objc_msgSend(v21, "addFinishBlock:", v22);

    }
    else
    {
      ((void (*)(_QWORD *))v17[2])(v17);
    }

  }
}

- (void)_dismissBanner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BSUIFeedViewController *v20;
  _QWORD v21[4];
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGRect v27;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = v7;
  if (v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));

    objc_msgSend(v11, "frame");
    x = v27.origin.x;
    width = v27.size.width;
    height = v27.size.height;
    v15 = CGRectGetHeight(v27) + v27.origin.y;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_4D5E4;
    v21[3] = &unk_2E5EA0;
    v22 = v11;
    v23 = x;
    v24 = v15;
    v25 = width;
    v26 = height;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_4D5F4;
    v17[3] = &unk_2E5EC8;
    v18 = v22;
    v19 = v6;
    v20 = self;
    v16 = v22;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v21, v17, 0.3, 0.0);

  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");
    objc_msgSend(v6, "removeFromParentViewController");
    -[BSUIFeedViewController setMessageViewControllerProvider:](self, "setMessageViewControllerProvider:", 0);
  }

}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD block[4];
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_4D7B8;
  v19[3] = &unk_2E48F8;
  objc_copyWeak(&v22, &location);
  v14 = v12;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v16 = objc_retainBlock(v19);
  if (v16)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v16[2])(v16);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4D91C;
      block[3] = &unk_2E3F88;
      v18 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));

  objc_msgSend(v7, "notifyOnMessageActionTriggered:", v6);
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD block[4];
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController messageViewControllerProvider](self, "messageViewControllerProvider"));

  if (v5 == v4)
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4DAD8;
    v9[3] = &unk_2E48C8;
    objc_copyWeak(&v10, &location);
    v6 = objc_retainBlock(v9);
    if (v6)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v6[2])(v6);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_4DB08;
        block[3] = &unk_2E3F88;
        v8 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (a3 != self)
  {
    v5 = a4;
    v7 = objc_msgSend(objc_alloc((Class)TUIHostingIdentifier), "initWithType:identifier:", CFSTR("message"), v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController hostingController](self, "hostingController"));
    objc_msgSend(v6, "removeProviderForIdentifier:", v7);

  }
}

- (void)setDistanceFromFocusedCard:(int64_t)a3
{
  unint64_t v3;

  if (self->_distanceFromFocusedCard != a3)
  {
    self->_distanceFromFocusedCard = a3;
    if (a3 >= 0)
      v3 = a3;
    else
      v3 = -a3;
    if (v3 > 2)
      -[BSUIFeedViewController setLoadPriority:](self, "setLoadPriority:", -8);
    else
      -[BSUIFeedViewController setLoadPriority:](self, "setLoadPriority:", qword_255EC8[v3]);
  }
}

- (id)menuElementsWithData:(id)a3
{
  BSUIContextMenuProviding *contextMenuProvider;
  void *v5;
  void *v6;

  contextMenuProvider = self->_contextMenuProvider;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _dataModelWithData:](self, "_dataModelWithData:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIContextMenuProviding menuElementsForViewController:dataModel:](contextMenuProvider, "menuElementsForViewController:dataModel:", self, v5));

  return v6;
}

- (void)menuElementsWithData:(id)a3 completion:(id)a4
{
  BSUIAsyncContextMenuProviding *asyncContextMenuProvider;
  id v7;
  id v8;

  asyncContextMenuProvider = self->_asyncContextMenuProvider;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _dataModelWithData:](self, "_dataModelWithData:", a3));
  -[BSUIAsyncContextMenuProviding menuElementsWithDataModel:viewController:completion:](asyncContextMenuProvider, "menuElementsWithDataModel:viewController:completion:", v8, self, v7);

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4
{
  NSDate *v5;
  NSDate *contextMenuAppearDate;

  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3, a4));
  contextMenuAppearDate = self->_contextMenuAppearDate;
  self->_contextMenuAppearDate = v5;

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSDate *contextMenuAppearDate;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDate *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_contextMenuProvider && objc_msgSend(v9, "count"))
  {
    contextMenuAppearDate = self->_contextMenuAppearDate;
    if (contextMenuAppearDate)
      v12 = contextMenuAppearDate;
    else
      v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController _dataModelWithData:](self, "_dataModelWithData:", v10));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIContextMenuProviding analyticsAssetPropertyProviderForDataModel:](self->_contextMenuProvider, "analyticsAssetPropertyProviderForDataModel:", v14));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
      objc_msgSend(v16, "emitContextualActionSheetExposureEventWithTracker:startDate:propertyProvider:", v17, v13, v15);

    }
    v18 = self->_contextMenuAppearDate;
    self->_contextMenuAppearDate = 0;

  }
}

- (id)_dataModelWithData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BSUIContextActionDataAssetModel *v19;
  void *v20;
  BSUIContextActionDataAssetModel *v21;
  char *v22;
  BSUIContextActionDataModel *v23;
  BSUIContextActionDataModel *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BSUIContextActionDataModel *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];

  v3 = a3;
  v4 = objc_opt_class(NSArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("assets")));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v9 = (void *)v8;
  if (v7)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
          v16 = objc_opt_class(NSDictionary);
          v17 = BUDynamicCast(v16, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = sub_4E3C0((uint64_t)v18, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          if (v20)
            objc_msgSend(v9, "addObject:", v20, (_QWORD)v68);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v12);
    }
  }
  else
  {
    v21 = sub_4E3C0(v8, v3);
    v10 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
  }

  v22 = (char *)objc_msgSend(v9, "count");
  v23 = [BSUIContextActionDataModel alloc];
  v24 = v23;
  if (v22 == (_BYTE *)&dword_0 + 1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v26 = objc_opt_class(UIView);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sourceView")));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[BSUIContextActionDataModel initWithAssetModel:sourceView:](v24, "initWithAssetModel:sourceView:", v25, v29);

  }
  else
  {
    v30 = -[BSUIContextActionDataModel initWithAssetModels:](v23, "initWithAssetModels:", v9);
  }
  v31 = objc_opt_class(NSString);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("animateFromRefId")));
  v33 = BUDynamicCast(v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[BSUIContextActionDataModel setPresentationRefID:](v30, "setPresentationRefID:", v34);

  v35 = objc_opt_class(NSString);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("animateFromRefInstance")));
  v37 = BUDynamicCast(v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[BSUIContextActionDataModel setPresentationRefInstance:](v30, "setPresentationRefInstance:", v38);

  v39 = objc_opt_class(NSString);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryID")));
  v41 = BUDynamicCast(v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[BSUIContextActionDataModel setPresentationUID:](v30, "setPresentationUID:", v42);

  v43 = objc_opt_class(NSString);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("location")));
  v45 = BUDynamicCast(v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  -[BSUIContextActionDataModel setOriginatingLocation:](v30, "setOriginatingLocation:", v46);

  v47 = objc_opt_class(NSNumber);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isAnODPRecommendation")));
  v49 = BUDynamicCast(v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  -[BSUIContextActionDataModel setIsAnODPRecommendation:](v30, "setIsAnODPRecommendation:", objc_msgSend(v50, "BOOLValue"));

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsSuggestionContextMenu")));
  if (v51)
  {
    v52 = objc_opt_class(NSNumber);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsSuggestionContextMenu")));
    v54 = BUDynamicCast(v52, v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    -[BSUIContextActionDataModel setSupportsSuggestionContextMenu:](v30, "setSupportsSuggestionContextMenu:", objc_msgSend(v55, "BOOLValue"));

  }
  else
  {
    -[BSUIContextActionDataModel setSupportsSuggestionContextMenu:](v30, "setSupportsSuggestionContextMenu:", -[BSUIContextActionDataModel isAnODPRecommendation](v30, "isAnODPRecommendation"));
  }

  v56 = objc_opt_class(NSNumber);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldRecordMetrics")));
  v58 = BUDynamicCast(v56, v57);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  -[BSUIContextActionDataModel setShouldReportFigaro:](v30, "setShouldReportFigaro:", objc_msgSend(v59, "BOOLValue"));

  v60 = objc_opt_class(NSValue);
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sourcePoint")));
  v62 = BUDynamicCast(v60, v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  -[BSUIContextActionDataModel setSourcePoint:](v30, "setSourcePoint:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey));
  v65 = BUProtocolCast(&OBJC_PROTOCOL___BCTransaction, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  -[BSUIContextActionDataModel setTransaction:](v30, "setTransaction:", v66);

  if (-[BSUIContextActionDataModel isAnODPRecommendation](v30, "isAnODPRecommendation"))
    -[BSUIContextActionDataModel setODPAnalyticsWithAttributes:](v30, "setODPAnalyticsWithAttributes:", v3);

  return v30;
}

- (void)_setEffectiveAnalyticsTracker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[BSUIFeedViewController setEffectiveAnalyticsTracker:](self, "setEffectiveAnalyticsTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController cardAuxiliaryNavigationBarManager](self, "cardAuxiliaryNavigationBarManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4E5E0;
  v7[3] = &unk_2E5BE0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "viewControllerWhenAvailable:", v7);

}

- (CGRect)_frameOfElementWithEntryID:(id)a3 refId:(id)a4 refInstance:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  CGFloat x;
  double v20;
  CGFloat y;
  double v22;
  CGFloat width;
  double v24;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", 0, a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController renderReferencesMatchingQuery:](self, "renderReferencesMatchingQuery:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (v9
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9)),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject")),
        v10,
        v11))
  {
    objc_msgSend(v11, "center");
    v13 = v12;
    v15 = v14;
    v16 = objc_msgSend(v11, "size");
    x = CGRectMakeWithCenterAndSize(v16, v13, v15, v17, v18);
    y = v20;
    width = v22;
    height = v24;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)dealloc
{
  NSObject *deferredReloadsQueue;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  deferredReloadsQueue = self->_deferredReloadsQueue;
  if (deferredReloadsQueue)
    dispatch_activate(deferredReloadsQueue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_notificationObservers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v10, "removeObserver:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[JSAFeedController setAbandoned:](self->_jsFeedController, "setAbandoned:", 1);
  -[JSAFeedController tearDownWithCompletion:](self->_jsFeedController, "tearDownWithCompletion:", 0);
  v11.receiver = self;
  v11.super_class = (Class)BSUIFeedViewController;
  -[BSUIFeedViewController dealloc](&v11, "dealloc");
}

- (Class)jsaFeedControllerClass
{
  return (Class)objc_opt_class(JSAFeedController, a2);
}

- (void)_updateViewWithBackgroundColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[BSUIFeedViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t preferredLargeTitleDisplayMode;
  void *v8;
  id v9;

  if (self->_showLoadingView)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration loadingConfiguration](UIContentUnavailableConfiguration, "loadingConfiguration", a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "background"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[BSUIFeedViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v9);
  }
  else
  {
    preferredLargeTitleDisplayMode = self->_preferredLargeTitleDisplayMode;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController navigationItem](self, "navigationItem", a3));
    objc_msgSend(v8, "setLargeTitleDisplayMode:", preferredLargeTitleDisplayMode);

    -[BSUIFeedViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
  }
}

- (void)_updateSyncTransactionBehaviorInViewWillAppear
{
  if (self->_performantForScrolling)
    -[BSUIFeedViewController setAvoidSyncTransactionInViewWillAppear:](self, "setAvoidSyncTransactionInViewWillAppear:", 1);
  else
    -[BSUIFeedViewController setAvoidSyncTransactionInViewWillAppear:](self, "setAvoidSyncTransactionInViewWillAppear:", self->_performantForReadingExperience);
}

- (UIEdgeInsets)navigationBarMetricsLayoutMargins
{
  void *v2;
  void *v3;
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
  double v14;
  double v15;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedViewController feedController](self, "feedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metadata"));
  objc_msgSend(v3, "navigationBarLayoutInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BCCardContentDelegate)cardContentDelegate
{
  return (BCCardContentDelegate *)objc_loadWeakRetained((id *)&self->cardContentDelegate);
}

- (void)setCardContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->cardContentDelegate, a3);
}

- (NSString)trackerName
{
  return self->_trackerName;
}

- (int64_t)distanceFromFocusedCard
{
  return self->_distanceFromFocusedCard;
}

- (BCSafeAreaInsetsObserver)bcSafeAreaInsetsObserver
{
  return (BCSafeAreaInsetsObserver *)objc_loadWeakRetained((id *)&self->_bcSafeAreaInsetsObserver);
}

- (void)setBcSafeAreaInsetsObserver:(id)a3
{
  objc_storeWeak((id *)&self->_bcSafeAreaInsetsObserver, a3);
}

- (BOOL)avoidSyncTransactionInViewWillAppear
{
  return self->_avoidSyncTransactionInViewWillAppear;
}

- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3
{
  self->_avoidSyncTransactionInViewWillAppear = a3;
}

- (BCCardContentScrollManager)cardContentScrollManager
{
  return self->_cardContentScrollManager;
}

- (int64_t)loadPriority
{
  return self->_loadPriority;
}

- (TUIAssertion)assertionForSuspendingLayoutUpdates
{
  return self->_assertionForSuspendingLayoutUpdates;
}

- (void)setAssertionForSuspendingLayoutUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_assertionForSuspendingLayoutUpdates, a3);
}

- (BOOL)disallowLoadingView
{
  return self->_disallowLoadingView;
}

- (void)setDisallowLoadingView:(BOOL)a3
{
  self->_disallowLoadingView = a3;
}

- (BSUIFeedViewControllerFeedMetadataDelegate)metadataDelegate
{
  return (BSUIFeedViewControllerFeedMetadataDelegate *)objc_loadWeakRetained((id *)&self->_metadataDelegate);
}

- (int64_t)feedLiveResizeOptions
{
  return self->_feedLiveResizeOptions;
}

- (BOOL)performantForReadingExperience
{
  return self->_performantForReadingExperience;
}

- (JSAFeedController)jsFeedController
{
  return self->_jsFeedController;
}

- (void)setJsFeedController:(id)a3
{
  objc_storeStrong((id *)&self->_jsFeedController, a3);
}

- (BSUIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BSUIFeedTriggerBlockObserver)feedTriggerObserver
{
  return self->_feedTriggerObserver;
}

- (void)setFeedTriggerObserver:(id)a3
{
  objc_storeStrong((id *)&self->_feedTriggerObserver, a3);
}

- (CGSize)viewSizeWhenNotifiedBottomReached
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSizeWhenNotifiedBottomReached.width;
  height = self->_viewSizeWhenNotifiedBottomReached.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSizeWhenNotifiedBottomReached:(CGSize)a3
{
  self->_viewSizeWhenNotifiedBottomReached = a3;
}

- (BOOL)alreadyNotifiedBottomReached
{
  return self->_alreadyNotifiedBottomReached;
}

- (void)setAlreadyNotifiedBottomReached:(BOOL)a3
{
  self->_alreadyNotifiedBottomReached = a3;
}

- (BOOL)dismissOnViewDisappear
{
  return self->_dismissOnViewDisappear;
}

- (void)setDismissOnViewDisappear:(BOOL)a3
{
  self->_dismissOnViewDisappear = a3;
}

- (unint64_t)navigationBarStyle
{
  return self->_navigationBarStyle;
}

- (void)setNavigationBarStyle:(unint64_t)a3
{
  self->_navigationBarStyle = a3;
}

- (BSUIDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (void)setCurrentStackName:(id)a3
{
  objc_storeStrong((id *)&self->_currentStackName, a3);
}

- (NSArray)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_notificationObservers, a3);
}

- (BOOL)openFinalized
{
  return self->_openFinalized;
}

- (void)setOpenFinalized:(BOOL)a3
{
  self->_openFinalized = a3;
}

- (BOOL)performantForScrolling
{
  return self->_performantForScrolling;
}

- (TUIAssertion)suspendLayoutForScrolling
{
  return self->_suspendLayoutForScrolling;
}

- (void)setSuspendLayoutForScrolling:(id)a3
{
  objc_storeStrong((id *)&self->_suspendLayoutForScrolling, a3);
}

- (void)setNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItem, a3);
}

- (UIViewController)currentPopOverViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_currentPopOverViewController);
}

- (void)setCurrentPopOverViewController:(id)a3
{
  objc_storeWeak((id *)&self->_currentPopOverViewController, a3);
}

- (UIColor)navigationBarTintColorWhenLayoutReady
{
  return self->_navigationBarTintColorWhenLayoutReady;
}

- (void)setNavigationBarTintColorWhenLayoutReady:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTintColorWhenLayoutReady, a3);
}

- (NSString)lastTwoLineTitleFixed
{
  return self->_lastTwoLineTitleFixed;
}

- (void)setLastTwoLineTitleFixed:(id)a3
{
  objc_storeStrong((id *)&self->_lastTwoLineTitleFixed, a3);
}

- (BOOL)lastTwoLineTitleFixHadSearchController
{
  return self->_lastTwoLineTitleFixHadSearchController;
}

- (void)setLastTwoLineTitleFixHadSearchController:(BOOL)a3
{
  self->_lastTwoLineTitleFixHadSearchController = a3;
}

- (NSMutableSet)activeRenderOverrides
{
  return self->_activeRenderOverrides;
}

- (void)setActiveRenderOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_activeRenderOverrides, a3);
}

- (UIView)popoverArrowBackgroundView
{
  return self->_popoverArrowBackgroundView;
}

- (void)setPopoverArrowBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_popoverArrowBackgroundView, a3);
}

- (BOOL)isInCard
{
  return self->_isInCard;
}

- (void)setIsInCard:(BOOL)a3
{
  self->_isInCard = a3;
}

- (BOOL)deferUIUpdateUntilInitialContentReady
{
  return self->_deferUIUpdateUntilInitialContentReady;
}

- (OS_dispatch_queue)deferredReloadsQueue
{
  return self->_deferredReloadsQueue;
}

- (NSMutableSet)deferredEngagementMessageIdentifiers
{
  return self->_deferredEngagementMessageIdentifiers;
}

- (NSString)parentCardNavigationType
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setParentCardNavigationType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)wasPresentingCards
{
  return self->_wasPresentingCards;
}

- (void)setWasPresentingCards:(BOOL)a3
{
  self->_wasPresentingCards = a3;
}

- (_TtC13BookAnalytics9BATracker)effectiveAnalyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEffectiveAnalyticsTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (AMSEngagement)amsEngagement
{
  return self->_amsEngagement;
}

- (void)setAmsEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_amsEngagement, a3);
}

- (BCMessageViewControllerProvider)messageViewControllerProvider
{
  return self->_messageViewControllerProvider;
}

- (void)setMessageViewControllerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewControllerProvider, a3);
}

- (BSUICardAuxiliaryNavigationBarManager)cardAuxiliaryNavigationBarManager
{
  return self->_cardAuxiliaryNavigationBarManager;
}

- (void)setCardAuxiliaryNavigationBarManager:(id)a3
{
  objc_storeStrong((id *)&self->_cardAuxiliaryNavigationBarManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAuxiliaryNavigationBarManager, 0);
  objc_storeStrong((id *)&self->_messageViewControllerProvider, 0);
  objc_storeStrong((id *)&self->_amsEngagement, 0);
  objc_storeStrong((id *)&self->_effectiveAnalyticsTracker, 0);
  objc_storeStrong((id *)&self->_parentCardNavigationType, 0);
  objc_storeStrong((id *)&self->_deferredEngagementMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_deferredReloadsQueue, 0);
  objc_storeStrong((id *)&self->_popoverArrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_activeRenderOverrides, 0);
  objc_storeStrong((id *)&self->_lastTwoLineTitleFixed, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColorWhenLayoutReady, 0);
  objc_destroyWeak((id *)&self->_currentPopOverViewController);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_suspendLayoutForScrolling, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_currentStackName, 0);
  objc_storeStrong((id *)&self->_feedTriggerObserver, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_jsFeedController, 0);
  objc_destroyWeak((id *)&self->_metadataDelegate);
  objc_storeStrong((id *)&self->_assertionForSuspendingLayoutUpdates, 0);
  objc_destroyWeak((id *)&self->_bcSafeAreaInsetsObserver);
  objc_storeStrong(&self->_feedContentCompletion, 0);
  objc_storeStrong((id *)&self->_trackerName, 0);
  objc_destroyWeak((id *)&self->cardContentDelegate);
  objc_storeStrong((id *)&self->_asyncContextMenuProvider, 0);
  objc_storeStrong((id *)&self->_contextMenuProvider, 0);
  objc_storeStrong((id *)&self->_contextMenuAppearDate, 0);
}

+ (void)createSeriesViewControllerFromOptions:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 navigationTypeValue:(NSString *)a5 navigationContext:(BSUINavigationContext *)a6 shouldReportFigaro:(BOOL)a7 completion:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  NSDictionary *v23;
  _TtC13BookAnalytics9BATracker *v24;
  NSString *v25;
  BSUINavigationContext *v26;
  uint64_t v27;
  uint64_t v28;

  v15 = sub_5C154(&qword_329740);
  __chkstk_darwin(v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = swift_allocObject(&unk_2ECB88, 72, 7);
  *(_QWORD *)(v19 + 16) = a3;
  *(_QWORD *)(v19 + 24) = a4;
  *(_QWORD *)(v19 + 32) = a5;
  *(_QWORD *)(v19 + 40) = a6;
  *(_BYTE *)(v19 + 48) = a7;
  *(_QWORD *)(v19 + 56) = v18;
  *(_QWORD *)(v19 + 64) = a1;
  v20 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject(&unk_2ECBB0, 48, 7);
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_3247E8;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject(&unk_2ECBD8, 48, 7);
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_3206B0;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = sub_174AF8((uint64_t)v17, (uint64_t)&unk_3206B8, (uint64_t)v22);
  swift_release(v27);
}

@end
