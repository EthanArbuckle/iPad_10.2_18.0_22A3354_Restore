@implementation MFTransferStackViewController

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B8960;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA430 != -1)
    dispatch_once(&qword_1005AA430, block);
  return (id)qword_1005AA428;
}

- (MFTransferStackViewController)initWithScene:(id)a3
{
  id v4;
  MFTransferStackViewController *v5;
  MFTransferStackViewController *v6;
  StackController *v7;
  StackController *stackController;
  NSMutableDictionary *v9;
  NSMutableDictionary *contentRequests;
  uint64_t v11;
  EFScheduler *messageLoadScheduler;
  uint64_t v13;
  UIColor *conversationColor;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFTransferStackViewController;
  v5 = -[MFTransferStackViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = objc_alloc_init(StackController);
    stackController = v6->_stackController;
    v6->_stackController = v7;

    -[StackController setDelegate:](v6->_stackController, "setDelegate:", v6);
    -[StackController setDataSource:](v6->_stackController, "setDataSource:", v6);
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentRequests = v6->_contentRequests;
    v6->_contentRequests = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.mobilemail.transferStack.messagePreview")));
    messageLoadScheduler = v6->_messageLoadScheduler;
    v6->_messageLoadScheduler = (EFScheduler *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[UIColor mailTransferConversationViewBackgroundColor](UIColor, "mailTransferConversationViewBackgroundColor"));
    conversationColor = v6->_conversationColor;
    v6->_conversationColor = (UIColor *)v13;

  }
  return v6;
}

- (void)displayStackedViewsForItemsWithIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *stackedItemIDs;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v13 = a3;
  v12 = -[NSMutableOrderedSet mutableCopy](self->_stackedItemIDs, "mutableCopy");
  objc_msgSend(v12, "removeObjectsInArray:", v13);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v12;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v8));
        objc_msgSend(v9, "cancel");
        -[NSMutableDictionary removeObjectForKey:](self->_contentRequests, "removeObjectForKey:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v10 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithArray:", v13);
  stackedItemIDs = self->_stackedItemIDs;
  self->_stackedItemIDs = v10;

  -[MFTransferStackViewController _updateStackController](self, "_updateStackController");
  -[MFTransferStackViewController _updateBackgroundColor](self, "_updateBackgroundColor");

}

- (void)removeStackedViewsAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  id removeStackedViewsAnimationCompletionBlock;
  _QWORD v9[5];
  BOOL v10;

  v6 = (void (**)(_QWORD))a4;
  if (-[StackController hasStackedItems](self->_stackController, "hasStackedItems"))
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "copy");
      removeStackedViewsAnimationCompletionBlock = self->_removeStackedViewsAnimationCompletionBlock;
      self->_removeStackedViewsAnimationCompletionBlock = v7;

    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B8DE4;
    v9[3] = &unk_10051C6A8;
    v9[4] = self;
    v10 = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.3);
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)addStackedItemsWithItemIDs:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableOrderedSet addObjectsFromArray:](self->_stackedItemIDs, "addObjectsFromArray:");
  -[MFTransferStackViewController _updateStackController](self, "_updateStackController");
  -[MFTransferStackViewController _updateBackgroundColor](self, "_updateBackgroundColor");

}

- (void)removeStackedItemsWithItemIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v8, (_QWORD)v10));
        if ((objc_msgSend(v9, "isFinished") & 1) == 0)
          objc_msgSend(v9, "cancel");
        -[NSMutableDictionary removeObjectForKey:](self->_contentRequests, "removeObjectForKey:", v8);
        -[NSMutableOrderedSet removeObject:](self->_stackedItemIDs, "removeObject:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[MFTransferStackViewController _updateStackController](self, "_updateStackController");
  -[MFTransferStackViewController _updateBackgroundColor](self, "_updateBackgroundColor");

}

- (void)_updateStackController
{
  void *v3;
  void *v4;
  id v5;

  if (-[MFTransferStackViewController isStackControllerVisible](self, "isStackControllerVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController dataSource](self, "dataSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_stackedItemIDs, "array"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transferStackViewController:itemIDsToDisplayFromItemIDs:", self, v4));

    -[StackController displayStackedViewsForItems:animated:](self->_stackController, "displayStackedViewsForItems:animated:", v5, 1);
  }
}

- (BOOL)wantsDesktopClassNavigationBar
{
  return +[UINavigationBar mf_canUseDesktopClassNavigationBar](UINavigationBar, "mf_canUseDesktopClassNavigationBar");
}

- (ConversationViewController)conversationViewController
{
  ConversationViewController **p_conversationViewController;
  id WeakRetained;
  void *v5;
  void *v6;

  p_conversationViewController = &self->_conversationViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_conversationViewController);
  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController mailSplitViewController](self, "mailSplitViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageDetailNavController"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationViewController"));

    objc_storeWeak((id *)p_conversationViewController, WeakRetained);
  }
  return (ConversationViewController *)WeakRetained;
}

- (id)_titleForTransferOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((a3 & 2) != 0)
  {
    if ((a3 & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SINGLE_MESSAGE_MOVE_TITLE"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v7 = -[NSMutableDictionary count](self->_contentRequests, "count");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v8;
      if (v7 == (id)1)
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SINGLE_MESSAGE_MOVE_TITLE"), &stru_100531B00, CFSTR("Main")));
      else
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MULTIPE_MESSAGES_MOVE_TITLE"), &stru_100531B00, CFSTR("Main")));
    }
  }
  else if ((a3 & 0x10) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SELECTION_ARCHIVE_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    if ((v3 & 0x20) != 0)
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SELECTION_TRASH_TITLE"), &stru_100531B00, CFSTR("Main")));
    else
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGE_SELECTION_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  v9 = (void *)v6;

  return v9;
}

- (void)_updateTitleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController splitViewController](self, "splitViewController"));
  -[MFTransferStackViewController _updateTitleForDisplayMode:animated:](self, "_updateTitleForDisplayMode:animated:", objc_msgSend(v5, "displayMode"), v3);

}

- (void)_updateTitleForDisplayMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  BarLabelItem *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[2];

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController splitViewController](self, "splitViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController traitCollection](self, "traitCollection"));
  v9 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:](UINavigationBar, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v8);

  if (v9)
  {
    -[MFTransferStackViewController setTitle:](self, "setTitle:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController _titleForTransferOptions:](self, "_titleForTransferOptions:", -[MFTransferStackViewController transferOptions](self, "transferOptions")));
    v11 = v10;
    if (a3 == 5 || a3 == 3)
    {
      v12 = -[BarLabelItem initWithTitle:style:]([BarLabelItem alloc], "initWithTitle:style:", v10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
      objc_msgSend(v13, "frame");
      v15 = v14;
      objc_msgSend(v7, "primaryColumnWidth");
      v17 = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BarLabelItem customView](v12, "customView"));
      objc_msgSend(v18, "frame");
      v20 = v19;

      v21 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      objc_msgSend(v21, "setWidth:", (v15 - v17 - v20) * 0.5);
      v25[0] = v21;
      v25[1] = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

      v23 = 0;
    }
    else
    {
      v23 = v10;
      v22 = &__NSArray0__struct;
    }
    -[MFTransferStackViewController setTitle:](self, "setTitle:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v24, "setRightBarButtonItems:animated:", v22, v4);

  }
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  _MFStackContainerView *v5;
  void *v6;
  _MFStackContainerView *v7;
  _MFStackContainerView *stackContainerView;
  void *v9;
  void *v10;
  void *v11;
  _MFStackContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
  _MFStackContainerView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  const __CFString *v24;
  _MFStackContainerView *v25;
  const __CFString *v26;
  _MFStackContainerView *v27;

  v23.receiver = self;
  v23.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v3, "configureWithDefaultBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setScrollEdgeAppearance:", v3);

  v5 = [_MFStackContainerView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = -[_MFStackContainerView initWithFrame:](v5, "initWithFrame:");
  stackContainerView = self->_stackContainerView;
  self->_stackContainerView = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[_MFStackContainerView setBackgroundColor:](self->_stackContainerView, "setBackgroundColor:", v9);

  -[_MFStackContainerView setDelegate:](self->_stackContainerView, "setDelegate:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", self->_stackContainerView);

  -[_MFStackContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  v12 = self->_stackContainerView;
  v26 = CFSTR("_container");
  v27 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_container]|"), 0, 0, v13));
  objc_msgSend(v11, "addConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  v16 = self->_stackContainerView;
  v24 = CFSTR("_container");
  v25 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_container]|"), 0, 0, v17));
  objc_msgSend(v15, "addConstraints:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v21, "setUserInteractionEnabled:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "_splitViewStateChanged:", CFSTR("MailSplitViewControllerViewStateChangedNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewWillAppear:](&v6, "viewWillAppear:");
  -[MFTransferStackViewController setIsStackControllerVisible:](self, "setIsStackControllerVisible:", 1);
  -[MFTransferStackViewController stackContainerViewEdgeInsetsForStackController:](self, "stackContainerViewEdgeInsetsForStackController:", self->_stackController);
  -[_MFStackContainerView setLayoutInsets:](self->_stackContainerView, "setLayoutInsets:");
  -[_MFStackContainerView setNeedsLayout](self->_stackContainerView, "setNeedsLayout");
  -[MFTransferStackViewController _updateStackController](self, "_updateStackController");
  -[MFTransferStackViewController _updateTitleAnimated:](self, "_updateTitleAnimated:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController splitViewController](self, "splitViewController"));
  -[MFTransferStackViewController _updateDisplayModeButtonItemForDisplayMode:isCollapsed:](self, "_updateDisplayModeButtonItemForDisplayMode:isCollapsed:", objc_msgSend(v5, "displayMode"), objc_msgSend(v5, "isCollapsed"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController stackController](self, "stackController"));
  objc_msgSend(v4, "updateStackedViewsFrame");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController conversationViewController](self, "conversationViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barItemsManager"));
  objc_msgSend(v5, "setShowSupplementaryButtonItem:", 0);

  objc_msgSend(v4, "_updateBarButtonsAnimated:force:", 0, 1);
  -[MFTransferStackViewController setIsStackControllerVisible:](self, "setIsStackControllerVisible:", 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  if (-[MFTransferStackViewController isStackControllerVisible](self, "isStackControllerVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController stackController](self, "stackController"));
    objc_msgSend(v3, "updateStackedViewsFrame");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[MFTransferStackViewController _updateTitleAnimated:](self, "_updateTitleAnimated:", objc_msgSend(v7, "isAnimated"));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == (id)2)
    -[MFTransferStackViewController _updateStackController](self, "_updateStackController");

}

- (void)_updateBackgroundColor
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[NSMutableOrderedSet count](self->_stackedItemIDs, "count"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor mailTransferStackViewBackgroundColor](UIColor, "mailTransferStackViewBackgroundColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor"));
  v5 = (id)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)updateForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4
{
  -[MFTransferStackViewController _updateDisplayModeButtonItemForDisplayMode:isCollapsed:isShowingTitle:](self, "_updateDisplayModeButtonItemForDisplayMode:isCollapsed:isShowingTitle:", a3, a4, 0);
  -[MFTransferStackViewController _updateTitleForDisplayMode:animated:](self, "_updateTitleForDisplayMode:animated:", a3, 1);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFTransferStackViewController;
  -[MFTransferStackViewController dealloc](&v4, "dealloc");
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
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
  v9.super_class = (Class)MFTransferStackViewController;
  v3 = -[MFTransferStackViewController splitViewController](&v9, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController presentingViewController](self, "presentingViewController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));

  }
  return v6;
}

- (void)_splitViewStateChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController splitViewController](self, "splitViewController"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MailSplitViewControllerNewDisplayModeKey")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MailSplitViewControllerIsCollapsedKey")));
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTransferStackViewController.m"), 491, CFSTR("Notification is missing information: %@, %@"), v8, v10);

    }
    -[MFTransferStackViewController updateForDisplayMode:isCollapsed:](self, "updateForDisplayMode:isCollapsed:", objc_msgSend(v8, "integerValue"), objc_msgSend(v10, "BOOLValue"));

  }
}

- (MailSplitViewController)mailSplitViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  MailSplitViewController *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController splitViewController](self, "splitViewController"));
  v3 = objc_opt_class(MailSplitViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4
{
  -[MFTransferStackViewController _updateDisplayModeButtonItemForDisplayMode:isCollapsed:isShowingTitle:](self, "_updateDisplayModeButtonItemForDisplayMode:isCollapsed:isShowingTitle:", a3, a4, 0);
}

- (void)_updateDisplayModeButtonItemForDisplayMode:(int64_t)a3 isCollapsed:(BOOL)a4 isShowingTitle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  void *v16;
  id v17;

  v5 = a5;
  v6 = a4;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController mailSplitViewController](self, "mailSplitViewController"));
  if (+[UINavigationBar mf_canUseDesktopClassNavigationBar](UINavigationBar, "mf_canUseDesktopClassNavigationBar"))
  {
    v9 = a3 == 1 || v6;
    if (v17)
      v10 = v9;
    else
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController conversationViewController](self, "conversationViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "barItemsManager"));
    objc_msgSend(v12, "setShowSupplementaryButtonItem:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController traitCollection](self, "traitCollection"));
    v14 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:](UINavigationBar, "mf_shouldUseDesktopClassNavigationBarForTraitCollection:", v13);

    if (v14)
      objc_msgSend(v11, "_updateBarButtonsAnimated:withDisplayMode:isCollapsed:isShowingTitle:", 1, a3, v6, v5);
  }
  else
  {
    v15 = !v6;
    if (a3 == 1)
      v15 = 0;
    if (v15 || !v17)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v11, "setLeftBarButtonItem:", 0);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "supplementaryButtonItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v16, "setLeftBarButtonItem:", v11);

    }
  }

}

- (CGRect)_stackItemRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v3, "bounds");

  v4 = UIRectInset(-[MFTransferStackViewController stackContainerViewEdgeInsetsForStackController:](self, "stackContainerViewEdgeInsetsForStackController:", self->_stackController));
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)stackContainerViewForStackController:(id)a3
{
  return self->_stackContainerView;
}

- (UIEdgeInsets)stackContainerViewEdgeInsetsForStackController:(id)a3
{
  void *v4;
  void *v5;
  double Height;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  UIEdgeInsets result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController scene](self, "scene", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusBarManager"));
  objc_msgSend(v5, "statusBarFrame");
  Height = CGRectGetHeight(v15);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = Height + v10;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)stackController:(id)a3 viewForItem:(id)a4
{
  void *v5;
  _MFStackWrapperView *v6;
  _MFStackWrapperView *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MFConversationItemHeaderBlock *v16;
  void *v17;
  double y;
  double width;
  double height;
  MFConversationItemHeaderBlock *v21;
  void *v22;
  MessageHeaderSubjectBlock *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController scene](self, "scene", a3, a4));
  v6 = [_MFStackWrapperView alloc];
  -[MFTransferStackViewController _stackItemRect](self, "_stackItemRect");
  v7 = -[_MFStackWrapperView initWithFrame:](v6, "initWithFrame:");
  v8 = objc_alloc((Class)MFMessageContentView);
  -[_MFStackWrapperView bounds](v7, "bounds");
  v9 = objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(v9, "setMessageBlockingReason:", 4);
  objc_msgSend(v9, "setShowsBanners:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mailboxProvider"));
  objc_msgSend(v9, "setMailboxProvider:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  objc_msgSend(v9, "setDaemonInterface:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "brandIndicatorProvider"));
  objc_msgSend(v9, "setBrandIndicatorProvider:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountsProvider"));

  v16 = [MFConversationItemHeaderBlock alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController contactStore](self, "contactStore"));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v21 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v16, "initWithFrame:contactStore:accountsProvider:", v17, v15, CGRectZero.origin.x, y, width, height);

  -[MFConversationItemHeaderBlock setDisplayOptions:](v21, "setDisplayOptions:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerView"));
  objc_msgSend(v22, "addHeaderBlock:animated:", v21, 0);

  v23 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerView"));
  objc_msgSend(v24, "addHeaderBlock:animated:", v23, 0);

  -[_MFStackWrapperView addWrappedView:](v7, "addWrappedView:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController traitCollection](self, "traitCollection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v26, "layoutMargins");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController view](self, "view"));
  objc_msgSend(v35, "safeAreaInsets");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v25, objc_msgSend(v5, "interfaceOrientation"), v28, v30, v32, v34, v36, v37, v38, v39));

  objc_msgSend(v9, "setLayoutMargins:", v28, v30, v32, v34);
  objc_msgSend(v9, "setDisplayMetrics:", v40);

  return v7;
}

- (void)_messageContentRepresentationRequestForItemWithItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, void *);
  id v19;
  _QWORD v20[4];
  id v21;
  _BYTE buf[24];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v6));
    v7[2](v7, v9);

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MFTransferStackViewController log](MFTransferStackViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request display message for message: %{public}@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transferStackViewController:displayMessageForMessageListItemWithItemID:", self, v6));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001BADC8;
    v20[3] = &unk_100522ED8;
    v13 = v6;
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "map:", v20));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001BAE80;
    v16[3] = &unk_100522F00;
    objc_copyWeak(&v19, (id *)buf);
    v17 = v13;
    v18 = v7;
    objc_msgSend(v14, "onScheduler:addSuccessBlock:", v15, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)stackController:(id)a3 isDataLoadedForItem:(id)a4 inView:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(_MFStackWrapperView);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
    v12 = objc_msgSend(v11, "isAvailableLocally");

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)stackController:(id)a3 loadDataForItem:(id)a4 inView:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  uint8_t buf[4];
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(_MFStackWrapperView);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = v8;
    if ((objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___EMCollectionItemID) & 1) != 0)
    {
      v11 = v7;
      v12 = objc_claimAutoreleasedReturnValue(+[MFTransferStackViewController log](MFTransferStackViewController, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Load data for message: %{public}@", buf, 0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001BB230;
      v18[3] = &unk_100522F28;
      v19 = v10;
      v13 = v11;
      v20 = v13;
      -[MFTransferStackViewController _messageContentRepresentationRequestForItemWithItemID:completionHandler:](self, "_messageContentRepresentationRequestForItemWithItemID:completionHandler:", v13, v18);

    }
    else
    {
      v14 = objc_opt_self(MFTransferStackViewController);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = (objc_class *)objc_opt_class(v7);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        sub_100394D34(v17, (uint64_t)buf, v13);
      }
    }

  }
}

- (void)stackControllerWillStartStackingViews:(id)a3
{
  -[_MFStackContainerView setAlpha:](self->_stackContainerView, "setAlpha:", a3, 1.0);
}

- (void)stackControllerDidStopStackingViews:(id)a3
{
  void (**removeStackedViewsAnimationCompletionBlock)(id, SEL, id);
  id v5;

  removeStackedViewsAnimationCompletionBlock = (void (**)(id, SEL, id))self->_removeStackedViewsAnimationCompletionBlock;
  if (removeStackedViewsAnimationCompletionBlock)
  {
    removeStackedViewsAnimationCompletionBlock[2](removeStackedViewsAnimationCompletionBlock, a2, a3);
    v5 = self->_removeStackedViewsAnimationCompletionBlock;
    self->_removeStackedViewsAnimationCompletionBlock = 0;

  }
}

- (void)stackController:(id)a3 willDisplayView:(id)a4 forItem:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    -[MFTransferStackViewController _stackItemRect](self, "_stackItemRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v8, "frame");
    v25.origin.x = v18;
    v25.origin.y = v19;
    v25.size.width = v20;
    v25.size.height = v21;
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    if (!CGRectEqualToRect(v24, v25))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFTransferStackViewController stackController](self, "stackController"));
      objc_msgSend(v22, "updateStackedViewFrameForItem:", v9);

    }
  }

}

- (void)stackController:(id)a3 willRemoveViewForItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  if (v5)
  {
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_contentRequests, "objectForKeyedSubscript:", v5));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "cancel");
    -[NSMutableDictionary removeObjectForKey:](self->_contentRequests, "removeObjectForKey:", v8);

    v5 = v8;
  }

}

- (void)stackContainerViewWillBecomeVisible:(id)a3
{
  -[MFTransferStackViewController setIsStackControllerVisible:](self, "setIsStackControllerVisible:", 1);
}

- (void)stackContainerViewDidBecomeInvisible:(id)a3
{
  -[MFTransferStackViewController setIsStackControllerVisible:](self, "setIsStackControllerVisible:", 0);
}

- (StackController)stackController
{
  return self->_stackController;
}

- (MFTransferStackControllerDataSource)dataSource
{
  return (MFTransferStackControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (_MFStackContainerView)stackContainerView
{
  return self->_stackContainerView;
}

- (void)setStackContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_stackContainerView, a3);
}

- (MessageListSelectionModel)messageListSelectionModel
{
  return self->_messageListSelectionModel;
}

- (void)setMessageListSelectionModel:(id)a3
{
  objc_storeStrong((id *)&self->_messageListSelectionModel, a3);
}

- (unint64_t)transferOptions
{
  return self->_transferOptions;
}

- (void)setTransferOptions:(unint64_t)a3
{
  self->_transferOptions = a3;
}

- (UIColor)conversationColor
{
  return self->_conversationColor;
}

- (void)setConversationColor:(id)a3
{
  objc_storeStrong((id *)&self->_conversationColor, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (MessageDisplayCapable)scene
{
  return (MessageDisplayCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (BOOL)isStackControllerVisible
{
  return self->_isStackControllerVisible;
}

- (void)setIsStackControllerVisible:(BOOL)a3
{
  self->_isStackControllerVisible = a3;
}

- (void)setConversationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_conversationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_conversationViewController);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_conversationColor, 0);
  objc_storeStrong((id *)&self->_messageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_stackContainerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stackController, 0);
  objc_storeStrong(&self->_removeStackedViewsAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_stackedItemIDs, 0);
  objc_storeStrong((id *)&self->_contentRequests, 0);
  objc_storeStrong((id *)&self->_messageLoadScheduler, 0);
}

@end
