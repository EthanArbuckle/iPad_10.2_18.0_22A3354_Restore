@implementation BCCardStackViewController

- (BCCardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BCCardStackViewController *v4;
  BCCardStackViewController *v5;
  uint64_t v6;
  NSMapTable *dataSourceMap;
  BCLayoutConfigurationEnvironment *v8;
  BCCardStackConfiguration *v9;
  BCCardStackConfiguration *configuration;
  uint64_t v11;
  NSMapTable *unhideBlocksByCardSet;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *transitionSetupQueue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BCCardStackViewController;
  v4 = -[BCCardStackViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_presentingViewControllerIsFullScreen = 1;
    v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    dataSourceMap = v5->_dataSourceMap;
    v5->_dataSourceMap = (NSMapTable *)v6;

    -[BCCardStackViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 6);
    -[BCCardStackViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v5);
    v8 = -[BCLayoutConfigurationEnvironment initWithViewController:]([BCLayoutConfigurationEnvironment alloc], "initWithViewController:", v5);
    v9 = -[BCCardStackConfiguration initWithEnvironment:]([BCCardStackConfiguration alloc], "initWithEnvironment:", v8);
    configuration = v5->_configuration;
    v5->_configuration = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    unhideBlocksByCardSet = v5->_unhideBlocksByCardSet;
    v5->_unhideBlocksByCardSet = (NSMapTable *)v11;

    v5->_ignoreChildStatusBarStyle = 0;
    -[BCCardStackViewController bc_setNavBarVisible:](v5, "bc_setNavBarVisible:", 0);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("BCCardStackViewController.transitionSetupQueue", v16);
    transitionSetupQueue = v5->_transitionSetupQueue;
    v5->_transitionSetupQueue = (OS_dispatch_queue *)v17;

  }
  return v5;
}

- (void)viewDidLoad
{
  BCCardStackBarBackgroundContainingView *v3;
  void *v4;
  BCCardStackBarBackgroundContainingView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIScrollView *v11;
  UIScrollView *backgroundView;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BCCardStackViewController;
  -[BCCardStackViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = [BCCardStackBarBackgroundContainingView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController"));
  v5 = -[BCCardStackBarBackgroundContainingView initWithStatusBarBackgroundController:](v3, "initWithStatusBarBackgroundController:", v4);

  -[BCCardStackViewController initialFrame](self, "initialFrame");
  -[BCCardStackBarBackgroundContainingView setFrame:](v5, "setFrame:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  -[BCCardStackBarBackgroundContainingView setAutoresizingMask:](v5, "setAutoresizingMask:", objc_msgSend(v6, "autoresizingMask"));

  -[BCCardStackViewController setView:](self, "setView:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = objc_alloc((Class)UIScrollView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v11 = (UIScrollView *)objc_msgSend(v9, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v11;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_backgroundView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.7));
  -[UIScrollView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;

  -[UIScrollView setContentSize:](self->_backgroundView, "setContentSize:", v16, v18 + 100.0);
  -[UIScrollView setContentOffset:](self->_backgroundView, "setContentOffset:", 0.0, 100.0);
  -[UIScrollView setDelegate:](self->_backgroundView, "setDelegate:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  -[BCCardStackViewController _addAdornmentViewsToParentView:](self, "_addAdornmentViewsToParentView:", v19);

  -[BCCardStackViewController setModalPresentationCapturesStatusBarAppearance:](self, "setModalPresentationCapturesStatusBarAppearance:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCCardStackViewController;
  -[BCCardStackViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BCCardStackViewController _updateStatusBarBackgroundOpacity](self, "_updateStatusBarBackgroundOpacity");
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCCardStackViewController;
  -[BCCardStackViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = UIAccessibilityLayoutChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController topCardSetViewController](self, "topCardSetViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCardViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "auxiliaryNavigationBarView"));
  UIAccessibilityPostNotification(v4, v7);

}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  int64_t v4;

  if (!_os_feature_enabled_impl("Books", "unifiedProductPage"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "cardsCanExpand") ^ 1;

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad())
    return 30;
  else
    return 2;
}

- (void)lockChildForStatusBarStyle
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllerForStatusBarStyle](self, "childViewControllerForStatusBarStyle"));
  -[BCCardStackViewController setLockedChildForStatusBarStyle:](self, "setLockedChildForStatusBarStyle:", v3);

}

- (void)unlockChildForStatusBarStyle
{
  -[BCCardStackViewController setLockedChildForStatusBarStyle:](self, "setLockedChildForStatusBarStyle:", 0);
}

- (id)childViewControllerForStatusBarStyle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BCCardStackViewController ignoreChildStatusBarStyle](self, "ignoreChildStatusBarStyle"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController lockedChildForStatusBarStyle](self, "lockedChildForStatusBarStyle"));

    if (v4)
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController lockedChildForStatusBarStyle](self, "lockedChildForStatusBarStyle"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

      if (objc_msgSend(v6, "expanded"))
        v7 = v6;
      else
        v7 = 0;
      v3 = v7;

    }
  }
  return v3;
}

- (void)_invalidateConfiguration
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "cardsCanExpand");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v7 = v4 ^ objc_msgSend(v6, "cardsCanExpand");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", v7, v8, v9);

}

- (void)viewWillAppearFromTabChange
{
  void *v3;
  void *v4;
  id v5;

  -[BCCardStackViewController _invalidateConfiguration](self, "_invalidateConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  objc_msgSend(v5, "resumeAndRebuildForReason:", CFSTR("card stack: card set will appear from tab change"));
  -[BCCardStackViewController _updateStatusBarBackgroundOpacity](self, "_updateStatusBarBackgroundOpacity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController"));
  objc_msgSend(v4, "updateParentViewOfCardStackBackgroundViewWithParentViewController:", self);

}

- (void)viewWillDisappearFromTabChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController"));
  objc_msgSend(v2, "setOpacity:", 0.0);

}

- (void)presentingViewControllerSafeAreaInsetsDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = isPad();
  v12 = 0.0;
  if (v11)
    v12 = 22.0;
  -[BCCardStackViewController setContentInset:](self, "setContentInset:", 0.0, v6, v8 + v12, v10);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (!self->_transitionInProgress
    && (self->_lastLayoutStackSize.width != v5 || self->_lastLayoutStackSize.height != v7))
  {
    self->_lastLayoutStackSize.width = v5;
    self->_lastLayoutStackSize.height = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    v10 = objc_msgSend(v9, "cardsCanExpand");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    objc_msgSend(v11, "invalidate");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    v13 = v10 ^ objc_msgSend(v12, "cardsCanExpand");

    -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", v13, v5, v7);
  }
  v14.receiver = self;
  v14.super_class = (Class)BCCardStackViewController;
  -[BCCardStackViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
}

- (BOOL)scrollCardForFeedOptionsVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned __int8 v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

    v9 = objc_msgSend(v8, "cardIndexForFeedOptions:", v4);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v11 = (unint64_t)v9;
      v12 = (char *)objc_msgSend(v6, "focusedIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
      if (objc_msgSend(v13, "cardsCanExpand"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCardViewController"));
        v15 = objc_msgSend(v14, "itemPushedOnCard");

      }
      else
      {
        v15 = 0;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
      v17 = 0;
      if (objc_msgSend(v16, "cardsCanExpand") && (char *)v11 != v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCardViewController"));
        v17 = objc_msgSend(v18, "expanded");

      }
      v19 = objc_msgSend(v6, "itemPushedOnCardAtIndex:", v11);
      v10 = 0;
      if (((v15 | v17) & 1) == 0
        && (v19 & 1) == 0
        && v11 >= (unint64_t)(v12 - 1)
        && v11 <= (unint64_t)(v12 + 1))
      {
        objc_msgSend(v6, "clearSavedContentOffsetsForCardAtIndex:", v11);
        v10 = 1;
        objc_msgSend(v6, "setFocusedIndex:animated:", v11, 1);
        objc_msgSend(v6, "scrollToTopCardAtIndex:animated:", v11, 1);
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  _QWORD v18[7];
  unsigned __int8 v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  CGSize v25;
  CGSize v26;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)BCCardStackViewController;
  v7 = a4;
  -[BCCardStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = BCCardModelLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v25.width = width;
    v25.height = height;
    v10 = NSStringFromCGSize(v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    objc_msgSend(v12, "size");
    v13 = NSStringFromCGSize(v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BCCardStack viewWillTransitionToSize: %@ from: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v16 = objc_msgSend(v15, "cardsCanExpand");

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2AC18;
  v18[3] = &unk_28C8E8;
  *(double *)&v18[5] = width;
  *(double *)&v18[6] = height;
  v18[4] = self;
  v19 = v16;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v18, &stru_28C908);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  objc_msgSend(v17, "invalidate");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  BCCardStackViewController *v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    v11 = BCCardModelLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "contentInset updated on BCCardStackViewController: %@", (uint8_t *)&v14, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController topCardSetViewController](self, "topCardSetViewController"));
    objc_msgSend(v13, "setContentInset:", top, left, bottom, right);

  }
}

- (void)setToolbarHeight:(double)a3
{
  void *v5;
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
  id v16;

  if (self->_toolbarHeight != a3)
  {
    self->_toolbarHeight = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v5, "additionalSafeAreaInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v12, "setAdditionalSafeAreaInsets:", a3, v7, v9, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    objc_msgSend(v13, "setToolbarHeight:", a3);

    if (!-[BCCardStackViewController transitionInProgress](self, "transitionInProgress"))
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
      objc_msgSend(v16, "bounds");
      -[BCCardStackViewController _layoutStackByChangingMode:newViewSize:](self, "_layoutStackByChangingMode:newViewSize:", 1, v14, v15);

    }
  }
}

- (unint64_t)cardStackDepth
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

+ (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4 fromViewController:(id)a5
{
  _objc_msgSend(a1, "pushCardsWithDataSource:focusedIndex:animated:fromViewController:completion:", a3, 0, a4, a5, 0);
}

+ (id)_pendingCardStackViewControllers
{
  if (qword_30D540 != -1)
    dispatch_once(&qword_30D540, &stru_28C928);
  return (id)qword_30D538;
}

+ (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 fromViewController:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unsigned __int8 v49;
  id v50;
  __int16 v51;
  _QWORD v52[4];
  _QWORD *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  unint64_t v60;
  BOOL v61;
  BOOL v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v9 = a5;
  v11 = a3;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "bc_effectiveCardPresentingViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentingViewController"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentingViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
    v17 = (char *)objc_msgSend(v16, "modalPresentationStyle");

    v18 = (unint64_t)(v17 - 3) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v18 = 1;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstResponder"));
  objc_msgSend(v21, "resignFirstResponder");

  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_2B50C;
  v67 = sub_2B51C;
  v68 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardStackViewController"));
  v22 = (void *)v64[5];
  if (!v22)
  {
    v23 = objc_msgSend(v13, "bc_firstVisibleChildViewControllerOfClass:includePresented:", objc_opt_class(BCCardStackViewController), 1);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)v64[5];
    v64[5] = v24;

    v22 = (void *)v64[5];
  }
  if (v22)
    v26 = v22;
  else
    v26 = v13;
  objc_msgSend(v26, "bc_dismissIfSafeAnimated:", 0);
  v27 = (void *)v64[5];
  if (v27)
  {
    if ((objc_msgSend(v27, "transitionInProgress") & 1) != 0)
    {
      v28 = BCCardModelLog();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v51 = 0;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Failed to push cards - the existing BCCardStackViewController has a transition in progress", (uint8_t *)&v51, 2u);
      }

      v30 = objc_retainBlock(v12);
      v31 = v30;
      if (v30)
        (*((void (**)(id))v30 + 2))(v30);
      goto LABEL_34;
    }
    if (objc_msgSend(v11, "numberOfCards:", v64[5]) == (char *)&dword_0 + 1)
    {
      v38 = objc_opt_class(NSDictionary);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representedObjectForCardAtIndex:", 0));
      v40 = BUDynamicCast(v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

      if ((objc_msgSend(v11, "alwaysPresentNewCardSetForFeedOptions:", v41) & 1) != 0)
      {

      }
      else
      {
        v49 = objc_msgSend((id)v64[5], "scrollCardForFeedOptionsVisible:", v41);

        if ((v49 & 1) != 0)
          goto LABEL_29;
      }
    }
    objc_msgSend((id)v64[5], "pushCardsWithDataSource:focusedIndex:animated:", v11, a4, v9);
LABEL_29:
    v50 = objc_retainBlock(v12);
    v31 = v50;
    if (v50)
      (*((void (**)(id))v50 + 2))(v50);
    goto LABEL_34;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardStackViewController _pendingCardStackViewControllers](BCCardStackViewController, "_pendingCardStackViewControllers"));
  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v13));
  v33 = (void *)v64[5];
  v64[5] = v32;

  if (v64[5])
  {
    v34 = BCCardModelLog();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v51 = 0;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Failed to push cards - a pending BCCardStackViewController exists", (uint8_t *)&v51, 2u);
    }

    v36 = objc_retainBlock(v12);
    v37 = v36;
    if (v36)
      (*((void (**)(id))v36 + 2))(v36);
  }
  else
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_2B524;
    v54[3] = &unk_28C9A0;
    v59 = &v63;
    v42 = v13;
    v55 = v42;
    v61 = v18;
    v56 = v11;
    v60 = a4;
    v62 = v9;
    v57 = v31;
    v58 = v12;
    v43 = objc_retainBlock(v54);
    if (isPhone())
    {
      v44 = objc_opt_class(_BCWindowScene);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bc_windowForViewController"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "windowScene"));
      v47 = BUDynamicCast(v44, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

      if (v48)
      {
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_2B8D8;
        v52[3] = &unk_28C140;
        v53 = v43;
        objc_msgSend(v48, "attemptRotateToPortraitWithCompletion:", v52);

      }
    }
    else
    {
      ((void (*)(_QWORD *))v43[2])(v43);
    }

    v37 = v55;
  }

LABEL_34:
  _Block_object_dispose(&v63, 8);

}

- (void)pushCardsWithDataSource:(id)a3 animated:(BOOL)a4
{
  -[BCCardStackViewController pushCardsWithDataSource:focusedIndex:animated:](self, "pushCardsWithDataSource:focusedIndex:animated:", a3, 0, a4);
}

- (void)pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController _pushCardsWithDataSource:focusedIndex:animated:presentingViewController:](self, "_pushCardsWithDataSource:focusedIndex:animated:presentingViewController:", v8, a4, v5, v9));

  objc_msgSend(v10, "waitUntilReadyThenAnimate");
}

+ (void)appendCardsWithData:(id)a3 fromViewController:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bc_effectiveCardPresentingViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardStackViewController"));
  if (!v13)
  {
    v14 = objc_msgSend(v12, "bc_firstVisibleChildViewControllerOfClass:includePresented:", objc_opt_class(BCCardStackViewController), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "childViewControllers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataSourceMap"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  if ((objc_msgSend(v10, "length") || objc_msgSend(v19, "length"))
    && (objc_msgSend(v19, "isEqualToString:", v10) & 1) == 0)
  {

  }
  else if (v13)
  {
    objc_msgSend(v18, "appendNewDataToExistingDataSource:cardStackViewController:", v9, v13);
    objc_msgSend(v16, "updateWithAppendedCards");
    v20 = objc_retainBlock(v11);
    v21 = v20;
    if (v20)
      (*((void (**)(id))v20 + 2))(v20);

    goto LABEL_15;
  }
  v22 = BCCardModelLog();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_1B4294();

  v24 = objc_retainBlock(v11);
  v13 = v24;
  if (v24)
    (*((void (**)(id))v24 + 2))(v24);
LABEL_15:

}

- (void)popCardsAnimated:(BOOL)a3
{
  -[BCCardStackViewController popCardsAnimated:reason:](self, "popCardsAnimated:reason:", a3, 0);
}

- (void)popCardsAnimated:(BOOL)a3 reason:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  v9 = -[BCCardStackViewController _animationTypeForDismissingCardSetViewController:distanceToCoverSource:](self, "_animationTypeForDismissingCardSetViewController:distanceToCoverSource:", v8, 0);

  -[BCCardStackViewController _popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:](self, "_popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:", v5, 0, v9, 0, a4, 0, 0.0);
}

- (void)popAllCardsAnimated:(BOOL)a3 prefersCrossfade:(BOOL)a4 completion:(id)a5
{
  -[BCCardStackViewController _popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:](self, "_popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:", a3, 1, 2, a4, 0, a5, 0.0);
}

- (void)popAllCardsAnimated:(BOOL)a3 completion:(id)a4
{
  -[BCCardStackViewController popAllCardsAnimated:prefersCrossfade:completion:](self, "popAllCardsAnimated:prefersCrossfade:completion:", a3, 0, a4);
}

- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 velocity:(double)a6 completion:(id)a7
{
  -[BCCardStackViewController _popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:](self, "_popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:", a3, a4, a5, 0, 0, a7, a6);
}

- (void)_popCardsAnimated:(BOOL)a3 popAll:(BOOL)a4 animationType:(int64_t)a5 prefersCrossfade:(BOOL)a6 velocity:(double)a7 reason:(int64_t)a8 completion:(id)a9
{
  _BOOL8 v11;
  _BOOL4 v13;
  _BOOL4 v14;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  BCCardStackCoverSourceController *v43;
  uint64_t v44;
  void *v45;
  BCCardStackCoverSourceController *v46;
  __int128 v47;
  uint64_t v48;
  BCCardStackTransitionAnimator *v49;
  void *v50;
  BCCardStackTransitionAnimator *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  BCCardStackCoverSourceController *v64;
  BCCardStackCoverSourceController *v65;
  BCCardStackTransitionContext *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  BCCardStackTransitionAnimator *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  BCCardStackTransitionAnimatorWrapper *v102;
  BCCardStackTransitionAnimatorWrapper *v103;
  void *v104;
  id v105;
  id v106;
  BCCardStackCoverSourceController *v107;
  id v108;
  void *v109;
  int64_t v110;
  void *v111;
  void *v112;
  BOOL v113;
  _BOOL4 v114;
  _QWORD *v115;
  _QWORD *v116;
  id v117;
  void *v118;
  void *v119;
  unsigned int v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[5];
  id v127;
  id v128;
  _OWORD v129[3];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  id v135;
  _QWORD v136[4];
  id v137;
  BCCardStackCoverSourceController *v138;
  NSObject *v139;
  id v140;
  BCCardStackViewController *v141;
  id v142;
  BCCardStackTransitionAnimator *v143;
  id v144;
  id v145;
  BOOL v146;
  _QWORD v147[4];
  BCCardStackCoverSourceController *v148;
  _QWORD v149[4];
  id v150;
  BCCardStackCoverSourceController *v151;
  id location[2];
  __int128 v153;
  __int128 v154;
  _QWORD v155[4];
  BCCardStackCoverSourceController *v156;
  _QWORD v157[4];
  id v158;
  id v159;
  id v160;

  v11 = a6;
  v13 = a4;
  v14 = a3;
  v16 = a9;
  if (self->_transitionInProgress)
  {
    v17 = BCCardModelLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_1B42EC();
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v110 = a8;
      v118 = v16;
      -[BCCardStackViewController _resumeAndRebuildChildViewControllerAsNeeded](self, "_resumeAndRebuildChildViewControllerAsNeeded");
      self->_transitionInProgress = 1;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v22 = objc_msgSend(v21, "count") == (char *)&dword_0 + 1 || v13;
      v120 = v22;

      if (v13)
        v23 = 2;
      else
        v23 = a5;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v113 = v13;
      v114 = v14;
      if ((unint64_t)objc_msgSend(v26, "count") < 2)
      {
        v29 = 0;
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", (char *)objc_msgSend(v28, "count") - 2));

      }
      v119 = (void *)v29;
      if (v120)
        v31 = 0;
      else
        v31 = (void *)v29;
      v32 = v31;
      objc_msgSend(v32, "setLastNavigationType:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardStackCoverSourceController coverHostFromPresentingViewController:previousCardSetViewController:](BCCardStackCoverSourceController, "coverHostFromPresentingViewController:previousCardSetViewController:", v33, v32));

      v35 = objc_opt_class(UINavigationController);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
      v37 = BUDynamicCast(v35, v36);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v37);

      if ((v120 & 1) != 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
        v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectAtIndexedSubscript:", 0));

      }
      else
      {
        v39 = v25;
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v39));

      v109 = v39;
      v42 = objc_msgSend(v39, "focusedIndex");
      objc_msgSend(v25, "prepareForDismiss");
      objc_msgSend(v25, "willMoveToParentViewController:", 0);
      v43 = -[BCCardStackCoverSourceController initWithCardStackViewController:isDismiss:cardSetViewController:focusedIndex:coverHost:dataSource:]([BCCardStackCoverSourceController alloc], "initWithCardStackViewController:isDismiss:cardSetViewController:focusedIndex:coverHost:dataSource:", self, 1, v25, v42, v34, v41);
      -[BCCardStackCoverSourceController setIsDismissingCardStack:](v43, "setIsDismissingCardStack:", v120);
      -[BCCardStackCoverSourceController setPreferSlideForDismiss:](v43, "setPreferSlideForDismiss:", v23 == 2);
      if (v32)
        v44 = objc_msgSend(v32, "expanded") ^ 1;
      else
        v44 = 0;
      -[BCCardStackCoverSourceController setCoversNeedClipping:](v43, "setCoversNeedClipping:", v44);
      if (v120)
        v45 = v119;
      else
        v45 = 0;
      -[BCCardStackCoverSourceController setUnderlyingCardSetViewController:](v43, "setUnderlyingCardSetViewController:", v45);
      v157[0] = _NSConcreteStackBlock;
      v157[1] = 3221225472;
      v157[2] = sub_2C8EC;
      v157[3] = &unk_28C9C8;
      v160 = v42;
      v108 = v41;
      v158 = v108;
      v117 = v34;
      v159 = v117;
      v155[0] = _NSConcreteStackBlock;
      v155[1] = 3221225472;
      v155[2] = sub_2C904;
      v155[3] = &unk_28B960;
      v46 = v43;
      v156 = v46;
      v47 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)location = *(_OWORD *)&CGAffineTransformIdentity.a;
      v153 = v47;
      v154 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[BCCardStackCoverSourceController prepareForCoverSourceCapturingWithToViewController:toViewTransform:revealCoverBlock:captureCoverFrameBlock:](v46, "prepareForCoverSourceCapturingWithToViewController:toViewTransform:revealCoverBlock:captureCoverFrameBlock:", v32, location, v157, v155);
      if (-[BCCardStackCoverSourceController canUseCoverTransition](v46, "canUseCoverTransition"))
        v48 = v23;
      else
        v48 = 2;
      v49 = [BCCardStackTransitionAnimator alloc];
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
      v51 = -[BCCardStackTransitionAnimator initWithType:allowsCardExpansion:](v49, "initWithType:allowsCardExpansion:", v48, objc_msgSend(v50, "cardsCanExpand"));

      -[BCCardStackTransitionAnimator setPrefersCrossfade:](v51, "setPrefersCrossfade:", v11);
      -[BCCardStackTransitionAnimator setVelocityForPop:](v51, "setVelocityForPop:", a7);
      if (v48 == 3)
      {
        v52 = -[BCCardStackCoverSourceController rangeRequiringCards](v46, "rangeRequiringCards");
        objc_msgSend(v25, "beginTransitionUpdateModeForCardsAtRange:", v52, v53);
        -[BCCardStackCoverSourceController performSecondHalfOfProcessing](v46, "performSecondHalfOfProcessing");
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController coverMoveItems](v46, "coverMoveItems"));
        -[BCCardStackTransitionAnimator setCoverMoveItems:](v51, "setCoverMoveItems:", v54);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardMoveItems](v46, "cardMoveItems"));
        -[BCCardStackTransitionAnimator setCardMoveItems:](v51, "setCardMoveItems:", v55);
      }
      else
      {
        -[BCCardStackCoverSourceController performSecondHalfOfProcessing](v46, "performSecondHalfOfProcessing");
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSlideItems](v46, "cardSlideItems"));
        -[BCCardStackTransitionAnimator setCardSlideItems:](v51, "setCardSlideItems:", v55);
      }

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController coverFadeItems](v46, "coverFadeItems"));
      -[BCCardStackTransitionAnimator setCoverFadeItems:](v51, "setCoverFadeItems:", v56);

      v57 = (char *)objc_msgSend(v25, "visibleCardRange");
      v59 = v58;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v58));
      if (v57 < &v57[v59])
      {
        do
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cardViewControllerAtIndex:", v57));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "transitioningCardContent"));

          if (v62)
            objc_msgSend(v60, "addObject:", v62);

          ++v57;
          --v59;
        }
        while (v59);
      }
      v149[0] = _NSConcreteStackBlock;
      v149[1] = 3221225472;
      v149[2] = sub_2C90C;
      v149[3] = &unk_28C9F0;
      v63 = v60;
      v150 = v63;
      v64 = v46;
      v151 = v64;
      v116 = objc_retainBlock(v149);
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_2CA38;
      v147[3] = &unk_28B960;
      v65 = v64;
      v148 = v65;
      v115 = objc_retainBlock(v147);
      v66 = -[BCCardStackTransitionContext initWithFromViewController:toViewController:push:]([BCCardStackTransitionContext alloc], "initWithFromViewController:toViewController:push:", v25, v32, 0);
      -[BCCardStackTransitionContext setAnimated:](v66, "setAnimated:", v114);
      -[BCCardStackTransitionContext setInteractive:](v66, "setInteractive:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
      -[BCCardStackTransitionContext setBackgroundView:](v66, "setBackgroundView:", v67);

      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "containerViewForHostingCoversDuringAnimation"));
      -[BCCardStackTransitionContext setInnerContainerView:](v66, "setInnerContainerView:", v68);

      objc_initWeak(location, self);
      v136[0] = _NSConcreteStackBlock;
      v136[1] = 3221225472;
      v136[2] = sub_2CA40;
      v136[3] = &unk_28CA18;
      objc_copyWeak(&v145, location);
      v106 = v63;
      v137 = v106;
      v107 = v65;
      v138 = v107;
      v18 = v25;
      v139 = v18;
      v69 = v32;
      v140 = v69;
      v141 = self;
      v70 = v111;
      v142 = v70;
      v71 = v51;
      v143 = v71;
      v146 = v113;
      v105 = v118;
      v144 = v105;
      -[BCCardStackTransitionContext setCompletionBlock:](v66, "setCompletionBlock:", v136);
      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472;
      v133[2] = sub_2CCA8;
      v133[3] = &unk_28CA40;
      objc_copyWeak(&v135, location);
      v72 = v69;
      v134 = v72;
      -[BCCardStackTransitionAnimator addAnimations:](v71, "addAnimations:", v133);
      v112 = v70;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
      LOBYTE(v70) = objc_msgSend(v73, "cardsCanExpand") | v120;

      if ((v70 & 1) == 0)
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
        v75 = objc_msgSend(v74, "count");

        if ((unint64_t)v75 < 3)
        {
          v78 = 0;
        }
        else
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndexedSubscript:", (char *)objc_msgSend(v77, "count") - 3));

          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "view"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "superview"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "view"));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "view"));
          objc_msgSend(v80, "insertSubview:belowSubview:", v81, v82);

          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "view"));
          objc_msgSend(v83, "setHidden:", 0);

          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "view"));
          v85 = v84;
          if (v84)
          {
            objc_msgSend(v84, "transform");
          }
          else
          {
            v131 = 0u;
            v132 = 0u;
            v130 = 0u;
          }
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "view"));
          v129[0] = v130;
          v129[1] = v131;
          v129[2] = v132;
          objc_msgSend(v86, "setTransform:", v129);

          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "view"));
          objc_msgSend(v87, "center");
          v89 = v88;
          v91 = v90;
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "view"));
          objc_msgSend(v92, "setCenter:", v89, v91);

          -[BCCardStackViewController _applyCardSetViewController:withTransform:](self, "_applyCardSetViewController:withTransform:", v78, 1);
        }
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_2CD04;
        v126[3] = &unk_28CA68;
        v126[4] = self;
        v127 = v72;
        v93 = v78;
        v128 = v93;
        -[BCCardStackTransitionAnimator addAnimations:](v71, "addAnimations:", v126);

      }
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_2CD3C;
      v124[3] = &unk_28CA90;
      v94 = (id)objc_claimAutoreleasedReturnValue(-[NSObject currentCardViewController](v18, "currentCardViewController"));
      v125 = v94;
      -[BCCardStackTransitionAnimator addAnimations:](v71, "addAnimations:", v124);
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
      objc_msgSend(v95, "setObject:forKeyedSubscript:", 0, v18);

      -[NSObject setDataSource:](v18, "setDataSource:", 0);
      -[NSObject setDelegate:](v18, "setDelegate:", 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentCardViewController](v18, "currentCardViewController"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "topContentViewController"));
      v98 = BUProtocolCast(&OBJC_PROTOCOL___BCCardCycleObserving, v97);
      v99 = (void *)objc_claimAutoreleasedReturnValue(v98);

      if (v119)
      {
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "currentCardViewController"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topContentViewController"));

      }
      else
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
      }
      objc_msgSend(v99, "cardStackViewController:parentCardWillDismissWithReason:targetViewController:", self, v110, v101);
      v102 = -[BCCardStackTransitionAnimatorWrapper initWithAnimator:context:waitUntilReadyBlock:setupBeforeAnimationBlock:]([BCCardStackTransitionAnimatorWrapper alloc], "initWithAnimator:context:waitUntilReadyBlock:setupBeforeAnimationBlock:", v71, v66, v116, v115);
      v103 = v102;
      if (v120)
      {
        -[BCCardStackViewController setPendingWrapper:](self, "setPendingWrapper:", v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController pendingWrapper](self, "pendingWrapper"));
        v121[0] = _NSConcreteStackBlock;
        v121[1] = 3221225472;
        v121[2] = sub_2CE10;
        v121[3] = &unk_28BD10;
        objc_copyWeak(&v123, location);
        v122 = v105;
        objc_msgSend(v104, "waitUntilReady:", v121);

        objc_destroyWeak(&v123);
      }
      else
      {
        -[BCCardStackTransitionAnimatorWrapper waitUntilReadyThenAnimate](v102, "waitUntilReadyThenAnimate");
      }

      objc_destroyWeak(&v135);
      objc_destroyWeak(&v145);
      objc_destroyWeak(location);

      v16 = v118;
    }
    else
    {
      v30 = BCCardModelLog();
      v18 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_1B42C0();
    }
  }

}

- (void)_layoutStackByChangingMode:(BOOL)a3 newViewSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _BOOL4 v6;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  char *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  void *v29;
  id v30;
  char *j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  unsigned int v43;
  void *v44;
  double v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[6];
  BOOL v50;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v9 = (char *)objc_msgSend(v8, "count");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_2D3EC;
  v49[3] = &unk_28CAD8;
  *(CGFloat *)&v49[4] = width;
  *(CGFloat *)&v49[5] = height;
  v50 = v6;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v49);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v12 = objc_msgSend(v11, "count");

  if ((unint64_t)v12 >= 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    v14 = objc_msgSend(v13, "cardsCanExpand");

    if ((v14 & 1) != 0)
    {
      if (!v6)
        goto LABEL_14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v16 = v9 - 2;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v9 - 2));

      objc_msgSend(v17, "setCovered:animated:duration:", 0, 0, 0.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));

      if (v16)
      {
        for (i = 0; i != v16; ++i)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", i));

          objc_msgSend(v22, "setCovered:animated:duration:", 0, 0, 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
          objc_msgSend(v23, "setAlpha:", 1.0);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
          objc_msgSend(v24, "setHidden:", 0);

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
          objc_msgSend(v19, "insertSubview:belowSubview:", v25, v26);

        }
      }

    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
      v28 = v9 - 2;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v9 - 2));

      -[BCCardStackViewController _applyCardSetViewController:withTransform:](self, "_applyCardSetViewController:withTransform:", v17, 1);
      objc_msgSend(v17, "setCovered:animated:duration:", 1, 0, 0.0);
      if (v6)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
        v30 = objc_msgSend(v29, "count");

        if ((unint64_t)v30 >= 3)
        {
          if (v28)
          {
            for (j = 0; j != v28; ++j)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", j));

              objc_msgSend(v33, "setCovered:animated:duration:", 1, 0, 0.0);
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
              objc_msgSend(v34, "setAlpha:", 0.0);

              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
              objc_msgSend(v35, "removeFromSuperview");

            }
          }
        }
      }
    }

  }
LABEL_14:
  v36 = objc_opt_class(BCCardSetViewController);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastObject"));
  v39 = BUDynamicCast(v36, v38);
  v47 = (id)objc_claimAutoreleasedReturnValue(v39);

  v40 = v47;
  if (v6)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
    v42 = 0.0;
    if (objc_msgSend(v41, "cardsCanExpand"))
    {
      v43 = objc_msgSend(v47, "expanded");

      if (!v43)
      {
LABEL_19:
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController", v47));
        objc_msgSend(v46, "setOpacity:", v42);

        -[BCCardStackViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
        -[BCCardStackViewController _layoutAdornmentViews](self, "_layoutAdornmentViews");
        v40 = v48;
        goto LABEL_20;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "currentCardViewController"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "currentState"));
      objc_msgSend(v44, "cardViewControllerStatusBarBackgroundOpacity:", v41);
      v42 = v45;

    }
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_layoutAdornmentViews
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
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
  _QWORD v41[4];
  _QWORD v42[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v5 = objc_msgSend(v4, "cardsCanExpand");

  if ((v5 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    objc_msgSend(v25, "insertSubview:atIndex:", v26, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leftAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:"));
    v42[0] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rightAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v36 = v27;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "rightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:"));
    v42[1] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v31 = v28;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v14));
    v42[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    v42[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    objc_msgSend(v9, "insertSubview:belowSubview:", v10, v8);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leftAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v40 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leftAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:"));
    v41[0] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "rightAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v35 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "rightAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:"));
    v41[1] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v30 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v41[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
    v41[3] = v21;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    v8 = v22;
    v24 = v29;
LABEL_5:

  }
}

- (void)_addAdornmentViewsToParentView:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v4, "insertSubview:atIndex:", v6, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leftAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v24[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v24[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v24[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v24[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

+ (BOOL)_alwaysUseSlideAnimation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BCCardStackTransitionForceSlideAnimation"));

  return v3;
}

- (void)_scaleBackCardSetViewController:(id)a3 shiftUp:(BOOL)a4 cumulative:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "center");
  v10 = v9;

  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v20, 0, sizeof(v20));
    CGAffineTransformTranslate(&v21, &v20, 0.0, -v10);

  }
  else
  {
    CGAffineTransformMakeTranslation(&v21, 0.0, -v10);
  }
  v18 = v21;
  CGAffineTransformScale(&v19, &v18, 0.95, 0.95);
  v21 = v19;
  v14 = -9.0;
  if (v6)
    v14 = 9.0;
  v18 = v19;
  CGAffineTransformTranslate(&v19, &v18, 0.0, v14 + v10);
  v21 = v19;
  v17 = v19;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v16 = v17;
  objc_msgSend(v15, "setTransform:", &v16);

}

- (id)_pushCardsWithDataSource:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 presentingViewController:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BCCardStackTransitionAnimatorWrapper *v14;
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
  BOOL v26;
  BCCardSetViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  unsigned int v47;
  BCCardStackCoverSourceController *v48;
  void *v49;
  BCCardSetViewController *v50;
  unsigned int v51;
  uint64_t v52;
  BCCardStackTransitionAnimator *v53;
  void *v54;
  NSMutableArray *v55;
  NSMutableArray *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSMutableArray *v69;
  NSMutableArray *v70;
  id v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  os_signpost_id_t v75;
  id v76;
  NSObject *v77;
  NSObject *v78;
  BCCardStackCoverSourceController *v79;
  BCCardStackTransitionAnimator *v80;
  BCCardStackTransitionContext *v81;
  void *v82;
  BCCardSetViewController *v83;
  BCCardStackTransitionAnimator *v84;
  void *v85;
  unsigned __int8 v86;
  char v87;
  id v88;
  BCCardStackCoverSourceController *v90;
  void *v91;
  id v92;
  _QWORD *v93;
  BOOL v94;
  _QWORD *v95;
  BCCardStackTransitionAnimator *v96;
  char v97;
  _BOOL4 v98;
  NSMutableArray *v99;
  void *v100;
  void *v101;
  void *v102;
  unint64_t v103;
  id v104;
  id v105;
  NSMutableArray *v106;
  BCCardStackCoverSourceController *v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  NSObject *v111;
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  NSMutableArray *v117;
  id v118;
  BCCardStackCoverSourceController *v119;
  BCCardSetViewController *v120;
  BCCardStackTransitionAnimator *v121;
  BCCardStackViewController *v122;
  NSObject *v123;
  id v124;
  char v125;
  id buf[2];
  _QWORD v127[4];
  BCCardStackCoverSourceController *v128;
  _QWORD v129[4];
  id v130;
  id v131;
  BCCardStackViewController *v132;
  BCCardSetViewController *v133;
  BCCardStackCoverSourceController *v134;
  BCCardStackTransitionAnimator *v135;
  os_signpost_id_t v136;
  BOOL v137;
  _QWORD block[4];
  NSMutableArray *v139;
  NSMutableArray *v140;
  _QWORD v141[4];
  NSObject *v142;
  _QWORD v143[4];
  BCCardSetViewController *v144;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (self->_transitionInProgress)
  {
    v12 = BCCardModelLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1B4318();
    v14 = 0;
    goto LABEL_49;
  }
  -[BCCardStackViewController lockChildForStatusBarStyle](self, "lockChildForStatusBarStyle");
  self->_transitionInProgress = 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCStatusBarBackgroundController backgroundControllerForViewController:](BCStatusBarBackgroundController, "backgroundControllerForViewController:", v11));
  -[BCCardStackViewController setStatusBarBackgroundController:](self, "setStatusBarBackgroundController:", v15);

  v98 = v7;
  if (-[BCCardStackViewController presentingViewControllerIsFullScreen](self, "presentingViewControllerIsFullScreen"))
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  else
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bc_windowForViewController"));
  v17 = v16;
  objc_msgSend(v16, "bounds");
  -[BCCardStackViewController setInitialFrame:](self, "setInitialFrame:");

  objc_msgSend(v11, "additionalSafeAreaInsets");
  -[BCCardStackViewController setToolbarHeight:](self, "setToolbarHeight:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
    objc_msgSend(v21, "setUserInteractionEnabled:", 0);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "configuration"));
  v103 = a4;
  if (objc_msgSend(v22, "cardsCanExpand"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentCardViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));

    v26 = v24 == v25;
    a4 = v103;
    if (v26)
      goto LABEL_14;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentCardViewController"));
    objc_msgSend(v22, "goExpanded");
  }

LABEL_14:
  objc_msgSend(v19, "bc_analyticsVisibilitySubtreeWillDisappear");
  v27 = objc_alloc_init(BCCardSetViewController);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v28, "bounds");
  -[BCCardSetViewController setInitialFrame:](v27, "setInitialFrame:");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  -[BCCardSetViewController setConfiguration:](v27, "setConfiguration:", v29);

  -[BCCardStackViewController contentInset](self, "contentInset");
  -[BCCardSetViewController setContentInset:](v27, "setContentInset:");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  if ((objc_msgSend(v30, "cardsCanExpand") & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v33 = objc_msgSend(v32, "count");

    if ((unint64_t)v33 < 2)
    {
      v31 = 0;
      goto LABEL_20;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", (char *)objc_msgSend(v34, "count") - 2));

  }
LABEL_20:
  v94 = v19 == 0;
  -[BCCardStackViewController addChildViewController:](self, "addChildViewController:", v27);
  -[BCCardSetViewController setDataSource:](v27, "setDataSource:", self);
  -[BCCardSetViewController setDelegate:](v27, "setDelegate:", self);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v10, v27);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController"));
  -[BCCardSetViewController setStatusBarBackgroundController:](v27, "setStatusBarBackgroundController:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController view](self, "view"));
  objc_msgSend(v37, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController view](v27, "view"));
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[BCCardSetViewController setFocusedIndex:](v27, "setFocusedIndex:", a4);
  if ((v19
     || -[BCCardStackViewController presentingViewControllerIsFullScreen](self, "presentingViewControllerIsFullScreen")
     || objc_msgSend(v11, "bc_alwaysUseCoverTransitionForCardPresenting"))
    && (objc_msgSend((id)objc_opt_class(self), "_alwaysUseSlideAnimation") & 1) == 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardStackCoverSourceController coverHostFromPresentingViewController:previousCardSetViewController:](BCCardStackCoverSourceController, "coverHostFromPresentingViewController:previousCardSetViewController:", v11, v19));
    if (v49)
    {
      v143[0] = _NSConcreteStackBlock;
      v143[1] = 3221225472;
      v143[2] = sub_2EA04;
      v143[3] = &unk_28B960;
      v50 = v27;
      v144 = v50;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v143);
      -[BCCardSetViewController setLastNavigationType:](v50, "setLastNavigationType:", 1);
      v48 = -[BCCardStackCoverSourceController initWithCardStackViewController:isDismiss:cardSetViewController:focusedIndex:coverHost:dataSource:]([BCCardStackCoverSourceController alloc], "initWithCardStackViewController:isDismiss:cardSetViewController:focusedIndex:coverHost:dataSource:", self, 0, v50, v103, v49, v10);
      -[BCCardStackCoverSourceController performFirstHalfOfProcessing](v48, "performFirstHalfOfProcessing");
      v47 = -[BCCardStackCoverSourceController canUseCoverTransition](v48, "canUseCoverTransition");
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "containerViewForHostingCoversDuringAnimation"));

    }
    else
    {
      v102 = 0;
      v47 = 0;
      v48 = 0;
    }

  }
  else
  {
    v102 = 0;
    v47 = 0;
    v48 = 0;
  }
  v92 = v10;
  v51 = v47;
  v52 = v47;
  v53 = [BCCardStackTransitionAnimator alloc];
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v96 = -[BCCardStackTransitionAnimator initWithType:allowsCardExpansion:](v53, "initWithType:allowsCardExpansion:", v52, objc_msgSend(v54, "cardsCanExpand"));

  v106 = objc_opt_new(NSMutableArray);
  v97 = v51;
  v100 = (void *)v31;
  v101 = v11;
  if (v51)
  {
    v91 = v19;
    v55 = objc_opt_new(NSMutableArray);
    v56 = objc_opt_new(NSMutableArray);
    v57 = dispatch_group_create();
    v90 = v48;
    v58 = -[BCCardStackCoverSourceController rangeRequiringCards](v48, "rangeRequiringCards");
    -[BCCardSetViewController beginTransitionUpdateModeForCardsAtRange:](v27, "beginTransitionUpdateModeForCardsAtRange:", v58, v59);
    -[BCCardSetViewController didBecomeTopCardSet](v27, "didBecomeTopCardSet");
    v60 = (char *)-[BCCardSetViewController visibleCardRange](v27, "visibleCardRange");
    v62 = v61;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v61));
    if (v60 < &v60[v62])
    {
      do
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController cardViewControllerAtIndex:](v27, "cardViewControllerAtIndex:", v60));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "transitioningCardContent"));

        if (v65)
        {
          objc_msgSend(v63, "addObject:", v65);
          dispatch_group_enter(v57);
          v141[0] = _NSConcreteStackBlock;
          v141[1] = 3221225472;
          v141[2] = sub_2EA34;
          v141[3] = &unk_28B960;
          v142 = v57;
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cardStackTransitionSuspendUpdatesAssertionUntilContentExceedsHeightWithCompletion:", v141));
          -[NSMutableArray addObject:](v55, "addObject:", v66);

          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cardStackTransitionSuspendLayoutAssertion"));
          -[NSMutableArray addObject:](v106, "addObject:", v67);

          if ((char *)v103 != v60)
          {
            -[NSMutableArray addObject:](v56, "addObject:", v65);
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cardStackTransitionSuspendUpdatesAssertion"));
            -[NSMutableArray addObject:](v55, "addObject:", v68);

          }
        }

        ++v60;
        --v62;
      }
      while (v62);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2EA3C;
    block[3] = &unk_28B808;
    v139 = v56;
    v140 = v55;
    v69 = v55;
    v70 = v56;
    dispatch_group_notify(v57, (dispatch_queue_t)&_dispatch_main_q, block);
    v71 = BCCardStackSignpost();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_signpost_enabled(v72))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v72, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Display product cards", ", (uint8_t *)buf, 2u);
    }

    v73 = BCCardStackSignpost();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    v75 = os_signpost_id_generate(v74);

    v76 = BCCardStackSignpost();
    v77 = objc_claimAutoreleasedReturnValue(v76);
    v78 = v77;
    if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v78, OS_SIGNPOST_INTERVAL_BEGIN, v75, "Timeout: Display product cards", ", (uint8_t *)buf, 2u);
    }

    kdebug_trace(725354448, 0, 0, 0, 0);
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_2EBFC;
    v129[3] = &unk_28CB50;
    v104 = v63;
    v130 = v104;
    v137 = v94;
    v131 = v101;
    v132 = self;
    v133 = v27;
    v136 = v75;
    v48 = v90;
    v79 = v90;
    v134 = v79;
    v80 = v96;
    v135 = v96;
    v95 = objc_retainBlock(v129);
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_2F3C8;
    v127[3] = &unk_28B960;
    v128 = v79;
    v93 = objc_retainBlock(v127);

    v19 = v91;
  }
  else
  {
    v104 = 0;
    v93 = 0;
    v95 = 0;
    v80 = v96;
  }
  v81 = -[BCCardStackTransitionContext initWithFromViewController:toViewController:push:]([BCCardStackTransitionContext alloc], "initWithFromViewController:toViewController:push:", v19, v27, 1);
  -[BCCardStackTransitionContext setAnimated:](v81, "setAnimated:", v98);
  -[BCCardStackTransitionContext setInteractive:](v81, "setInteractive:", 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  -[BCCardStackTransitionContext setBackgroundView:](v81, "setBackgroundView:", v82);

  -[BCCardStackTransitionContext setInnerContainerView:](v81, "setInnerContainerView:", v102);
  objc_initWeak(buf, self);
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_2F3D4;
  v116[3] = &unk_28CB78;
  v99 = v106;
  v117 = v99;
  objc_copyWeak(&v124, buf);
  v125 = v97;
  v105 = v104;
  v118 = v105;
  v107 = v48;
  v119 = v107;
  v83 = v27;
  v120 = v83;
  v84 = v80;
  v121 = v84;
  v122 = self;
  v13 = v19;
  v123 = v13;
  -[BCCardStackTransitionContext setCompletionBlock:](v81, "setCompletionBlock:", v116);
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_2F590;
  v114[3] = &unk_28CBA0;
  objc_copyWeak(&v115, buf);
  -[BCCardStackTransitionAnimator addAnimations:](v84, "addAnimations:", v114);
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  v86 = objc_msgSend(v85, "cardsCanExpand");
  if (v19)
    v87 = v86;
  else
    v87 = 1;

  if ((v87 & 1) == 0)
  {
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_2F5E8;
    v110[3] = &unk_28CBC8;
    objc_copyWeak(&v113, buf);
    v111 = v13;
    v112 = v100;
    -[BCCardStackTransitionAnimator addAnimations:](v84, "addAnimations:", v110);

    objc_destroyWeak(&v113);
  }
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_2F644;
  v108[3] = &unk_28CA90;
  v88 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetViewController currentCardViewController](v83, "currentCardViewController"));
  v109 = v88;
  -[BCCardStackTransitionAnimator addAnimations:](v84, "addAnimations:", v108);
  v14 = -[BCCardStackTransitionAnimatorWrapper initWithAnimator:context:waitUntilReadyBlock:setupBeforeAnimationBlock:]([BCCardStackTransitionAnimatorWrapper alloc], "initWithAnimator:context:waitUntilReadyBlock:setupBeforeAnimationBlock:", v84, v81, v95, v93);

  objc_destroyWeak(&v115);
  objc_destroyWeak(&v124);

  objc_destroyWeak(buf);
  v10 = v92;
  v11 = v101;
LABEL_49:

  return v14;
}

- (id)_pushCardBackAnimatorForCardSet:(id)a3 cardSetViewControllerToFade:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.2, 1.0);
  v10 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v9, 0.28);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_2F8A0;
  v16[3] = &unk_28C5F0;
  v16[4] = self;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "addAnimations:", v16);
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2F914;
    v14[3] = &unk_28CBF0;
    v15 = v12;
    objc_msgSend(v10, "addCompletion:", v14);

  }
  return v10;
}

- (void)_applyCardSetViewController:(id)a3 withTransform:(unint64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  void *v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "center");
  v8 = v7;

  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v25.c = v9;
  *(_OWORD *)&v25.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (a4 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v21, 0, sizeof(v21));
    CGAffineTransformTranslate(&v25, &v21, 0.0, -v8);

    goto LABEL_12;
  }
  if (a4 != 2)
  {
    CGAffineTransformMakeTranslation(&v25, 0.0, -v8);
LABEL_12:
    v22 = v25;
    CGAffineTransformScale(&v23, &v22, 0.95, 0.95);
    v15 = *(_OWORD *)&v23.c;
    v14 = *(_OWORD *)&v23.tx;
    v25 = v23;
    v16 = *(_OWORD *)&v23.a;
    v17 = -9.0;
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v24, 0, sizeof(v24));
  CGAffineTransformTranslate(&v25, &v24, 0.0, -v8);

  v22 = v25;
  CGAffineTransformScale(&v23, &v22, 1.05263158, 1.05263158);
  v15 = *(_OWORD *)&v23.c;
  v14 = *(_OWORD *)&v23.tx;
  v25 = v23;
  v16 = *(_OWORD *)&v23.a;
  v17 = 9.0;
LABEL_13:
  *(_OWORD *)&v22.a = v16;
  *(_OWORD *)&v22.c = v15;
  *(_OWORD *)&v22.tx = v14;
  CGAffineTransformTranslate(&v23, &v22, 0.0, v8 + v17);
  v25 = v23;
  v20 = v23;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v19 = v20;
  objc_msgSend(v18, "setTransform:", &v19);

}

- (void)_layoutUnderlyingCardSetViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[BCCardStackViewController _applyCardSetViewController:withTransform:](self, "_applyCardSetViewController:withTransform:", v6, 0);
  objc_msgSend(v6, "setCovered:animated:duration:", 1, v4, 0.28);

}

- (id)_popCardFrontAnimatorForCardSet:(id)a3 cardSetViewControllerToUnfade:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BCCardStackViewController *v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.2, 1.0);
  v10 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v9, 0.28);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2FCB0;
  v14[3] = &unk_28C5F0;
  v15 = v7;
  v16 = v8;
  v17 = self;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "addAnimations:", v14);

  return v10;
}

- (id)_navigationControllerForViewController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(BCCardSetViewController);
    v6 = BUDynamicCast(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "expandedCardViewController"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardNavigationController"));

LABEL_8:
      v8 = (void *)v10;
      goto LABEL_9;
    }
    v14 = v4;
LABEL_7:
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationController"));
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
  v12 = objc_opt_class(UINavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
  v8 = v14;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
LABEL_9:

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController pendingWrapper](self, "pendingWrapper", a3));

  if (!v4)
  {
    v5 = BCCardModelLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1B43BC();

  }
  return (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController pendingWrapper](self, "pendingWrapper"));
}

- (unint64_t)cardCountForCardSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = objc_msgSend(v6, "numberOfCards:", self);
  return (unint64_t)v7;
}

- (BOOL)isTopCardSetViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  return v6 == v4;
}

- (id)contentViewControllerForCardSet:(id)a3 index:(unint64_t)a4 cardContentScrollManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentViewControllerForCardAtIndex:cardContentScrollManager:", a4, v8));
  v13 = objc_opt_class(UIViewController);
  v14 = BUClassAndProtocolCast(v12, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (Class)cardNavigationControllerForCardSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardNavigationControllerClass:", self));
  return (Class)v7;
}

- (void)cardSetViewController:(id)a3 prepareForNavigationTransitionWithContext:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "containerView", a3));
  -[BCCardStackViewController _addAdornmentViewsToParentView:](self, "_addAdornmentViewsToParentView:", v5);

  self->_transitionInProgress = 1;
}

- (void)cardSetViewControllerNavigiationTransitionCompleted:(id)a3
{
  self->_transitionInProgress = 0;
  -[BCCardStackViewController _layoutAdornmentViews](self, "_layoutAdornmentViews", a3);
}

- (void)cardSetViewController:(id)a3 animatorForExpanding:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "duration");
  v9 = v8;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_301DC;
  v10[3] = &unk_28CC68;
  v11[1] = v9;
  objc_copyWeak(v11, &location);
  objc_msgSend(v7, "addAnimations:", v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)cardSetViewController:(id)a3 animatorForUnexpanding:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13[2];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "duration");
  v9 = v8;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_30540;
  v12[3] = &unk_28CC68;
  v13[1] = v9;
  objc_copyWeak(v13, &location);
  objc_msgSend(v7, "addAnimations:", v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_306C4;
  v10[3] = &unk_28CCD0;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  objc_msgSend(v7, "addCompletion:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)cardSetViewController:(id)a3 animatorForInteractiveDismiss:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;

  v11 = NAN;
  v6 = a4;
  objc_msgSend(v6, "setFinalAnimationType:", -[BCCardStackViewController _animationTypeForDismissingCardSetViewController:distanceToCoverSource:](self, "_animationTypeForDismissingCardSetViewController:distanceToCoverSource:", a3, &v11));
  objc_msgSend(v6, "setDistanceToCoverSource:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v6, "setBackgroundView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v9 = (unint64_t)objc_msgSend(v8, "count") > 1;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController configuration](self, "configuration"));
  objc_msgSend(v6, "setShouldRetainBackgroundAndTitleState:", v9 & ~objc_msgSend(v10, "cardsCanExpand"));

}

- (int64_t)_animationTypeForDismissingCardSetViewController:(id)a3 distanceToCoverSource:(double *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  int64_t v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", (char *)objc_msgSend(v9, "count") - 2));

    if (v10)
      goto LABEL_8;
  }
  if (!-[BCCardStackViewController presentingViewControllerIsFullScreen](self, "presentingViewControllerIsFullScreen"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
    v12 = objc_msgSend(v11, "bc_alwaysUseCoverTransitionForCardPresenting");

    if (!v12)
    {
      v21 = 2;
      goto LABEL_12;
    }
  }
  v10 = 0;
LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController presentingViewController](self, "presentingViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardStackCoverSourceController coverHostFromPresentingViewController:previousCardSetViewController:](BCCardStackCoverSourceController, "coverHostFromPresentingViewController:previousCardSetViewController:", v13, v10));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCardViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController dataSourceMap](self, "dataSourceMap"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));
  v20 = +[BCCardStackCoverSourceController canUseCoverTransitionForDismissingCardSetViewController:dataSource:coverHost:coverYOffset:inCoordinatesOfView:](BCCardStackCoverSourceController, "canUseCoverTransitionForDismissingCardSetViewController:dataSource:coverHost:coverYOffset:inCoordinatesOfView:", v6, v19, v14, a4, v17);

  if (objc_msgSend((id)objc_opt_class(self), "_alwaysUseSlideAnimation") | v20 ^ 1)
    v21 = 2;
  else
    v21 = 3;

LABEL_12:
  return v21;
}

- (void)cardSetViewController:(id)a3 didCommitDismissWithVelocity:(double)a4 interactiveAnimator:(id)a5
{
  -[BCCardStackViewController _popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:](self, "_popCardsAnimated:popAll:animationType:prefersCrossfade:velocity:reason:completion:", 1, 0, objc_msgSend(a5, "finalAnimationType", a3), 0, 2, 0, a4);
}

- (id)topCardSetViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)effectiveAnalyticsTrackerForTopCard
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController topCardSetViewController](self, "topCardSetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentCardViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ba_effectiveAnalyticsTracker"));

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(a3, "setContentOffset:", 0.0, 100.0);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  objc_msgSend(a3, "setContentOffset:", 0.0, 100.0);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (id)im_visibleChildViewControllers
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  return v6 == v4;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)_updateStatusBarBackgroundOpacity
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController topCardSetViewController](self, "topCardSetViewController"));
  -[BCCardStackViewController _updateStatusBarBackgroundOpacityForCardSetViewController:](self, "_updateStatusBarBackgroundOpacityForCardSetViewController:", v3);

}

- (void)_updateStatusBarBackgroundOpacityForCardSetViewController:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = _os_feature_enabled_impl("Books", "unifiedProductPage");
  if (v14 && (v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentCardViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardNavigationController"));
    v7 = objc_msgSend(v6, "isNavigationBarHidden");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentCardViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));

    if (v9 == v10)
      v11 = v7;
    else
      v11 = 0;
    v12 = (double)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController statusBarBackgroundController](self, "statusBarBackgroundController"));
    objc_msgSend(v13, "setOpacity:", v12);

  }
}

- (unint64_t)_indexOfChildViewControllerToSuspendOrResume
{
  void *v2;
  id v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v3 = objc_msgSend(v2, "count");
  if ((unint64_t)v3 <= 2)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = (unint64_t)v3 - 3;

  return v4;
}

- (void)_suspendAndTeardownChildViewControllerAsNeeded
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = -[BCCardStackViewController _indexOfChildViewControllerToSuspendOrResume](self, "_indexOfChildViewControllerToSuspendOrResume");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = objc_opt_class(BCCardSetViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v4));
    v8 = BUDynamicCast(v5, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);

    objc_msgSend(v9, "suspendAndTeardownForReason:", CFSTR("card stack: card set not displayed"));
  }
}

- (void)_resumeAndRebuildChildViewControllerAsNeeded
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = -[BCCardStackViewController _indexOfChildViewControllerToSuspendOrResume](self, "_indexOfChildViewControllerToSuspendOrResume");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v5 = objc_opt_class(BCCardSetViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v4));
    v8 = BUDynamicCast(v5, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);

    objc_msgSend(v9, "resumeAndRebuildForReason:", CFSTR("card stack: card set will display"));
  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCCardStackViewController;
  -[BCCardStackViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  -[BCCardStackViewController _suspendAndTeardownChildViewControllerAsNeeded](self, "_suspendAndTeardownChildViewControllerAsNeeded");
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "_dismissCardStack:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)_dismissCardStack:(id)a3
{
  -[BCCardStackViewController popCardsAnimated:](self, "popCardsAnimated:", 1);
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (BOOL)presentingViewControllerIsFullScreen
{
  return self->_presentingViewControllerIsFullScreen;
}

- (void)setPresentingViewControllerIsFullScreen:(BOOL)a3
{
  self->_presentingViewControllerIsFullScreen = a3;
}

- (NSMapTable)dataSourceMap
{
  return self->_dataSourceMap;
}

- (void)setDataSourceMap:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceMap, a3);
}

- (BOOL)transitionInProgress
{
  return self->_transitionInProgress;
}

- (void)setTransitionInProgress:(BOOL)a3
{
  self->_transitionInProgress = a3;
}

- (UIScrollView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (BCCardStackTransitionAnimatorWrapper)pendingWrapper
{
  return self->_pendingWrapper;
}

- (void)setPendingWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWrapper, a3);
}

- (UIViewController)lockedChildForStatusBarStyle
{
  return self->_lockedChildForStatusBarStyle;
}

- (void)setLockedChildForStatusBarStyle:(id)a3
{
  objc_storeStrong((id *)&self->_lockedChildForStatusBarStyle, a3);
}

- (BOOL)ignoreChildStatusBarStyle
{
  return self->_ignoreChildStatusBarStyle;
}

- (void)setIgnoreChildStatusBarStyle:(BOOL)a3
{
  self->_ignoreChildStatusBarStyle = a3;
}

- (BCCardStackConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGSize)lastLayoutStackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLayoutStackSize.width;
  height = self->_lastLayoutStackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLayoutStackSize:(CGSize)a3
{
  self->_lastLayoutStackSize = a3;
}

- (NSMapTable)unhideBlocksByCardSet
{
  return self->_unhideBlocksByCardSet;
}

- (void)setUnhideBlocksByCardSet:(id)a3
{
  objc_storeStrong((id *)&self->_unhideBlocksByCardSet, a3);
}

- (void)setStatusBarBackgroundController:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_unhideBlocksByCardSet, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lockedChildForStatusBarStyle, 0);
  objc_storeStrong((id *)&self->_pendingWrapper, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dataSourceMap, 0);
  objc_storeStrong((id *)&self->_transitionSetupQueue, 0);
}

- (NSSet)messagesAlreadyDisplayed
{
  uint64_t v3;
  id AssociatedObject;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSSet, a2);
  AssociatedObject = objc_getAssociatedObject(self, off_308248);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSSet *)v7;
}

- (void)setMessagesAlreadyDisplayed:(id)a3
{
  objc_setAssociatedObject(self, off_308248, a3, (char *)&dword_0 + 3);
}

- (void)viewController:(id)a3 didDisplayMessageWithId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController messagesAlreadyDisplayed](self, "messagesAlreadyDisplayed"));
  if (!v8)
    v8 = objc_alloc_init((Class)NSSet);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setByAddingObject:", v6));

  -[BCCardStackViewController setMessagesAlreadyDisplayed:](self, "setMessagesAlreadyDisplayed:", v9);
  -[BCCardStackViewController notifyAllCardsAboutMessageDisplayed:from:](self, "notifyAllCardsAboutMessageDisplayed:from:", v6, v7);

}

- (void)notifyAllCardsAboutMessageDisplayed:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackViewController childViewControllers](self, "childViewControllers"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(BCCardSetViewController);
        v14 = BUDynamicCast(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_3B538;
        v17[3] = &unk_28D268;
        v18 = v7;
        v19 = v6;
        objc_msgSend(v15, "enumerateAllCardsUsingBlock:", v17);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

@end
