@implementation NCNotificationStructuredListViewController

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification section settings for section %{public}@", (uint8_t *)&v13, 0x16u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateNotificationSectionSettings:previousSectionSettings:", v6, v7);

}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationsLoadedForSectionIdentifier:", v4);

}

- (void)notifyContentObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NCNotificationStructuredListViewController countIndicatorViewController](self, "countIndicatorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCount:", objc_msgSend(v4, "incomingCount"));

  -[NCNotificationStructuredListViewController countIndicatorViewController](self, "countIndicatorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncomingTitle:", v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NCNotificationStructuredListViewController observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "structuredListContentChanged:", -[NCNotificationStructuredListViewController hasVisibleContent](self, "hasVisibleContent"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (unint64_t)visibleNotificationCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleNotificationCount");

  return v3;
}

- (BOOL)hasVisibleContent
{
  void *v2;
  BOOL v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationCount") != 0;

  return v3;
}

- (id)_logDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Notification List [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NCNotificationStructuredListViewController)init
{
  NCNotificationStructuredListViewController *v2;
  NCNotificationStructuredListViewController *v3;
  double v4;
  NCNotificationManagementViewPresenter *v5;
  NCNotificationManagementViewPresenter *managementViewPresenter;
  NCModeManager *v7;
  NCModeManager *modeManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationStructuredListViewController;
  v2 = -[NCNotificationStructuredListViewController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_backgroundBlurred = 1;
    v2->_itemSpacing = 8.0;
    v4 = _NCNotificationListInsetMarginHorizontal();
    v3->_insetMargins.top = 0.0;
    v3->_insetMargins.left = v4;
    v3->_insetMargins.bottom = 0.0;
    v3->_insetMargins.right = v4;
    v5 = objc_alloc_init(NCNotificationManagementViewPresenter);
    managementViewPresenter = v3->_managementViewPresenter;
    v3->_managementViewPresenter = v5;

    -[NCNotificationManagementViewPresenter setDelegate:](v3->_managementViewPresenter, "setDelegate:", v3);
    v7 = objc_alloc_init(NCModeManager);
    modeManager = v3->_modeManager;
    v3->_modeManager = v7;

  }
  return v3;
}

- (void)loadView
{
  NCNotificationStructuredListView *v3;
  NCNotificationStructuredListView *v4;

  v3 = [NCNotificationStructuredListView alloc];
  v4 = -[NCNotificationStructuredListView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCNotificationStructuredListView setDelegate:](v4, "setDelegate:", self);
  -[NCNotificationStructuredListViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  NCNotificationListCountIndicatorViewController *v3;
  NCNotificationListCountIndicatorViewController *countIndicatorViewController;
  void *v5;
  void *v6;
  NCMaterialDisplayingCaptureOnlyViewController *v7;
  NCMaterialDisplayingCaptureOnlyViewController *captureOnlyMaterialViewController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewDidLoad](&v9, sel_viewDidLoad);
  +[NCSupplementaryViewPrototypeRecipe registerRecipeWithDelegate:](NCSupplementaryViewPrototypeRecipe, "registerRecipeWithDelegate:", self);
  v3 = objc_alloc_init(NCNotificationListCountIndicatorViewController);
  countIndicatorViewController = self->_countIndicatorViewController;
  self->_countIndicatorViewController = v3;

  -[NCNotificationListCountIndicatorViewController setDelegate:](self->_countIndicatorViewController, "setDelegate:", self);
  -[NCNotificationStructuredListViewController addChildViewController:](self, "addChildViewController:", self->_countIndicatorViewController);
  -[NCNotificationListCountIndicatorViewController didMoveToParentViewController:](self->_countIndicatorViewController, "didMoveToParentViewController:", self);
  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListCountIndicatorViewController view](self->_countIndicatorViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFooterView:", v6);

  -[NCNotificationStructuredListViewController _loadListViewAndModelIfNecessary](self, "_loadListViewAndModelIfNecessary");
  -[NCNotificationStructuredListViewController _listenToUserDefaultsToSwitchListViewAndModelIfNecessary](self, "_listenToUserDefaultsToSwitchListViewAndModelIfNecessary");
  v7 = objc_alloc_init(NCMaterialDisplayingCaptureOnlyViewController);
  captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
  self->_captureOnlyMaterialViewController = v7;

  -[NCModeManager addObserver:](self->_modeManager, "addObserver:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[NCNotificationStructuredListViewController _resetListStateBeforeUIAppears](self, "_resetListStateBeforeUIAppears");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  NCNotificationListTouchEaterManager *v9;
  void *v10;
  NCNotificationListTouchEaterManager *v11;
  NCNotificationListTouchEaterManager *touchEaterManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[NCNotificationStructuredListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", v5, v6);

  if (!self->_touchEaterManager)
  {
    -[NCNotificationStructuredListViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [NCNotificationListTouchEaterManager alloc];
      -[NCNotificationStructuredListViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NCNotificationListTouchEaterManager initForView:](v9, "initForView:", v10);
      touchEaterManager = self->_touchEaterManager;
      self->_touchEaterManager = v11;

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[NCNotificationStructuredListViewController managementViewPresenter](self, "managementViewPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissManagementViewIfPresentedAnimated:", v3);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NCModalNavigationController dismissViewControllerAnimated:completion:](self->_modalNavigationController, "dismissViewControllerAnimated:completion:", v3, 0);
  -[NCNotificationStructuredListViewController optionsMenu](self, "optionsMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissMenu");

}

- (void)viewDidDisappear:(BOOL)a3
{
  NCNotificationListTouchEaterManager *touchEaterManager;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", 0);
  -[NCNotificationListTouchEaterManager removeTouchGestureRecognizer](self->_touchEaterManager, "removeTouchGestureRecognizer");
  touchEaterManager = self->_touchEaterManager;
  self->_touchEaterManager = 0;

}

- (void)viewWillMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!a3)
  {
    -[NCNotificationStructuredListViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_alwaysOnEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NCNotificationListTouchEaterManager *v9;
  void *v10;
  NCNotificationListTouchEaterManager *v11;
  NCNotificationListTouchEaterManager *touchEaterManager;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v15, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (!self->_touchEaterManager)
  {
    -[NCNotificationStructuredListViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [NCNotificationListTouchEaterManager alloc];
      -[NCNotificationStructuredListViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NCNotificationListTouchEaterManager initForView:](v9, "initForView:", v10);
      touchEaterManager = self->_touchEaterManager;
      self->_touchEaterManager = v11;

    }
  }
  if (v6)
  {
    objc_msgSend(v6, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_alwaysOnEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", self);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCNotificationRootList)listModel
{
  NCNotificationRootList *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_listModel;
  else
    v3 = 0;
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", width, height);
}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *allNotificationRequests;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v8;
    v30 = 2114;
    v31 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting notification request %{public}@", (uint8_t *)&v28, 0x16u);

  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](allNotificationRequests, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = self->_allNotificationRequests;
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "sectionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);

    }
    v17 = self->_allNotificationRequests;
    objc_msgSend(v4, "sectionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v17, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v4, v20);

    -[NCNotificationStructuredListViewController _updateDebugHUD](self, "_updateDebugHUD");
  }
  if (-[NCNotificationStructuredListViewController _forwarNotificationRequestToLongLookIfNecessary:](self, "_forwarNotificationRequestToLongLookIfNecessary:", v4))
  {
    v21 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "un_logDigest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v24;
      v30 = 2114;
      v31 = v26;
      _os_log_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_INFO, "%{public}@ forwarded insert notification request %{public}@ to long look", (uint8_t *)&v28, 0x16u);

    }
  }
  else
  {
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertNotificationRequest:", v4);

  }
}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *allNotificationRequests;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v8;
    v37 = 2114;
    v38 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@", (uint8_t *)&v35, 0x16u);

  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](allNotificationRequests, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = self->_allNotificationRequests;
      objc_msgSend(v4, "sectionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", v19);

      v20 = self->_allNotificationRequests;
      objc_msgSend(v4, "sectionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v20, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (!v23)
      {
        v24 = self->_allNotificationRequests;
        objc_msgSend(v4, "sectionIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v24, "removeObjectForKey:", v25);

      }
      -[NCNotificationStructuredListViewController _updateDebugHUD](self, "_updateDebugHUD");
    }
  }
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "notificationRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "matchesRequest:", v4);

  if (v28)
  {
    v29 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "un_logDigest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v31;
      v37 = 2114;
      v38 = v33;
      _os_log_impl(&dword_1CFC3D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring removal of notification request %{public}@ since it is presented in long look", (uint8_t *)&v35, 0x16u);

    }
    -[NCNotificationStructuredListViewController setNotificationRequestRemovedWhilePresentingLongLook:](self, "setNotificationRequestRemovedWhilePresentingLongLook:", v4);
  }
  else
  {
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeNotificationRequest:", v4);

  }
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *allNotificationRequests;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v8;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@", (uint8_t *)&v21, 0x16u);

  }
  allNotificationRequests = self->_allNotificationRequests;
  if (allNotificationRequests)
  {
    objc_msgSend(v4, "sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](allNotificationRequests, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v4, v14);

  }
  if (-[NCNotificationStructuredListViewController _forwarNotificationRequestToLongLookIfNecessary:](self, "_forwarNotificationRequestToLongLookIfNecessary:", v4))
  {
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v19;
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_INFO, "%{public}@ forwarded modify notification request %{public}@ to long look", (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "modifyNotificationRequest:", v4);

  }
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification system settings = %@", (uint8_t *)&v12, 0x16u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateNotificationSystemSettings:previousSystemSettings:", v6, v7);

  -[NCNotificationStructuredListViewController _toggleDigestOnboardingSuggestionIfNecessary](self, "_toggleDigestOnboardingSuggestionIfNecessary");
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_deviceAuthenticated != a3)
  {
    v3 = a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting device authenticated to %{BOOL}d", (uint8_t *)&v9, 0x12u);

    }
    self->_deviceAuthenticated = v3;
    if (!v3)
      -[NCNotificationStructuredListViewController _handleDeviceUnauthenticated](self, "_handleDeviceUnauthenticated");
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceAuthenticated:", v3);

    -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", 1);
  }
}

- (void)_handleDeviceUnauthenticated
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[NCNotificationStructuredListViewController isPresentingNotificationInLongLook](self, "isPresentingNotificationInLongLook"))
  {
    -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "contentPreviewSetting");

    if (v5)
      -[NCNotificationStructuredListViewController dismissModalFullScreenAnimated:](self, "dismissModalFullScreenAnimated:", 0);

  }
}

- (UIScrollView)scrollView
{
  -[NCNotificationStructuredListViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UIScrollView *)self->_listView;
}

- (BOOL)hasVisibleContentToReveal
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVisibleContentToReveal");

  return v3;
}

- (BOOL)hasVisibleUrgentBreakthroughContent
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVisibleUrgentBreakthroughContent");

  return v3;
}

- (void)migrateNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notification requests", (uint8_t *)&v7, 0xCu);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrateNotificationsFromIncomingSectionToHistorySection");

}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _BYTE v12[22];
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("OFF");
    *(_DWORD *)v12 = 138543874;
    *(_QWORD *)&v12[4] = v9;
    if (v4)
      v10 = CFSTR("ON");
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v10;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ turning filtering %@ for section %{public}@", v12, 0x20u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel", *(_OWORD *)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toggleFilteringForSectionIdentifier:shouldFilter:", v6, v4);

}

- (CGSize)effectiveContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NCNotificationStructuredListViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)dismissModalFullScreenAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  NCModalNavigationController *v26;
  NCModalNavigationController *modalNavigationController;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController headerViewInForceTouchState](self, "headerViewInForceTouchState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController coalescingControlsHandlerInForceTouchState](self, "coalescingControlsHandlerInForceTouchState");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
  {
    v9 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "notificationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "un_logDigest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v11;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing presented long look for notification request %{public}@", (uint8_t *)&v33, 0x16u);

    }
    v15 = objc_msgSend(v5, "dismissPresentedViewControllerAnimated:", v3);
    goto LABEL_14;
  }
  if (v6)
  {
    v16 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sectionIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v18;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing header view in force touch state for section %{public}@", (uint8_t *)&v33, 0x16u);

    }
    v20 = v6;
LABEL_13:
    v15 = objc_msgSend(v20, "dismissModalFullScreenIfNeeded");
LABEL_14:
    v24 = v15;
    goto LABEL_15;
  }
  if (v7)
  {
    v21 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v23;
      _os_log_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing coalescing controls in force touch state", (uint8_t *)&v33, 0xCu);

    }
    v20 = v8;
    goto LABEL_13;
  }
  if (self->_modalNavigationController
    && (-[NCNotificationStructuredListViewController presentedViewController](self, "presentedViewController"),
        v26 = (NCModalNavigationController *)objc_claimAutoreleasedReturnValue(),
        modalNavigationController = self->_modalNavigationController,
        v26,
        v26 == modalNavigationController))
  {
    v28 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v30;
      v35 = 2114;
      v36 = v32;
      _os_log_impl(&dword_1CFC3D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing navigation controller of type '%{public}@'.", (uint8_t *)&v33, 0x16u);

    }
    -[NCNotificationStructuredListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
    v24 = 1;
  }
  else
  {
    v24 = 0;
  }
LABEL_15:

  return v24;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isContentExtensionVisible:", v4);

  return v6;
}

- (BOOL)isPresentingNotificationInLongLook
{
  void *v2;
  BOOL v3;

  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("HIDING");
    if (v5)
      v11 = CFSTR("REVEALING");
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ notification history", (uint8_t *)&v15, 0x16u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNotificationHistoryRevealed:", v5);

  if (!v5)
  {
    -[NCNotificationStructuredListViewController managementViewPresenter](self, "managementViewPresenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissManagementViewIfPresentedAnimated:", 0);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NCModalNavigationController dismissViewControllerAnimated:completion:](self->_modalNavigationController, "dismissViewControllerAnimated:completion:", v4, 0);
    -[NCNotificationStructuredListViewController optionsMenu](self, "optionsMenu");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissMenu");

    -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", 0);
  }
  -[NCNotificationStructuredListViewController notifyContentObservers](self, "notifyContentObservers");
}

- (BOOL)isHomeAffordanceVisible
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCustomContentHomeAffordanceVisible");

  return v3;
}

- (void)setHomeAffordanceVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomContentHomeAffordanceVisible:", v3);

}

- (UIPanGestureRecognizer)homeAffordancePanGesture
{
  void *v2;
  void *v3;

  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customContentHomeAffordanceGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIPanGestureRecognizer *)v3;
}

- (void)setHomeAffordancePanGesture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomContentHomeAffordanceGestureRecognizer:", v4);

}

- (void)listViewControllerPresentedByUserAction
{
  id v2;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listViewControllerPresentedByUserAction");

}

- (void)handleTapToWake
{
  id v2;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleTapToWake");

}

- (id)newCaptureOnlyMaterialViewController
{
  return self->_captureOnlyMaterialViewController;
}

- (NSString)backgroundGroupNameBase
{
  return (NSString *)CFSTR("NCNotificationListGroupName");
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  NCNotificationListViewProtocol *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NCNotificationListViewProtocol *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (NCNotificationListViewProtocol *)a3;
  if (v4
    && (-[NCNotificationStructuredListViewController view](self, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[NCNotificationListViewProtocol isDescendantOfView:](v4, "isDescendantOfView:", v5),
        v5,
        v6)
    && self->_listView != v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NCNotificationStructuredListViewController listModel](self, "listModel", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "listView");
          v13 = (NCNotificationListViewProtocol *)objc_claimAutoreleasedReturnValue();

          if (v13 == v4)
          {
            v14 = 0;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_16:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5
{
  id v8;
  id v9;
  NCNotificationListSupplementaryViewsSection *v10;
  void *v11;
  NCNotificationListSupplementaryViewsSection *v12;
  NCNotificationListSupplementaryViewsSection *v13;
  NCNotificationListSupplementaryViewsSection *v14;

  v8 = a5;
  v9 = a4;
  -[NCNotificationStructuredListViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v10 = -[NCNotificationListSupplementaryViewsSection initWithPosition:]([NCNotificationListSupplementaryViewsSection alloc], "initWithPosition:", a3);
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:", a3, v9, v8);
  v12 = (NCNotificationListSupplementaryViewsSection *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = v10;
  v14 = v13;

  return v14;
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", a3, v8, v5);

}

- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeOverrideNotificationListDisplayStyleSettingForReason:", v4);

}

- (CGPoint)scrollViewVisibleContentLayoutOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[NCNotificationRootList scrollViewVisibleContentLayoutOffsetY](self->_listModel, "scrollViewVisibleContentLayoutOffsetY");
  v3 = v2;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (BOOL)isScrollingListContent
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollingListContent");

  return v3;
}

- (BOOL)isOverlayFooterContentVisible
{
  return 0;
}

- (BOOL)notificationListExpandsVisibleRegionOnSignificantScroll
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expandsVisibleRegionOnSignificantScroll");

  return v3;
}

- (void)setNotificationListExpandsVisibleRegionOnSignificantScroll:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NCNotificationRootList *listModel;
  double v7;
  double v8;
  id v9;

  v3 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpandsVisibleRegionOnSignificantScroll:", v3);

  listModel = self->_listModel;
  -[NCNotificationStructuredListViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  -[NCNotificationRootList updateListViewVisibleRectForSize:](listModel, "updateListViewVisibleRectForSize:", v7, v8);

}

- (CGRect)visibleContentExtent
{
  void *v2;
  double v3;
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
  CGRect result;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aggregatedVisibleContentExtent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)addContentObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeContentObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:"))
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (unint64_t)requestsUnrevealedCountForNotificationStructuredListView:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NCNotificationStructuredListViewController listModel](self, "listModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "historyCount");

  return v4;
}

- (void)notificationStructuredListView:(id)a3 didChangeFooterCenterY:(double)a4
{
  double v5;
  void *v6;
  id v7;

  -[NCNotificationStructuredListViewController listView](self, "listView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFooterCenterY:", v6);

}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustForLegibilitySettingsChange:", v4);

  -[NCNotificationStructuredListViewController countIndicatorViewController](self, "countIndicatorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustForLegibilitySettingsChange:", v4);

  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustForLegibilitySettingsChange:", v4);

}

- (id)containerViewForPreviewInteractionPresentedContentForNotificationListBaseComponent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[UIViewController nc_presentationContextDefiningViewController](self, "nc_presentationContextDefiningViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldHintDefaultActionForNotificationListBaseComponent:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "notificationStructuredListViewControllerShouldHintForDefaultAction:", self);
  else
    v5 = 0;

  return v5;
}

- (id)legibilitySettingsForNotificationListBaseComponent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "legibilitySettingsForNotificationStructuredListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notificationListBaseComponentDidSignificantUserInteraction:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationStructuredListViewControllerDidSignificantUserInteraction:", self);
      v5 = v7;
    }
  }

}

- (void)notificationListBaseComponent:(id)a3 didBeginUserInteractionWithViewController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationStructuredListViewController:didBeginUserInteractionWithViewController:", self, v6);

}

- (void)notificationListBaseComponent:(id)a3 didEndUserInteractionWithViewController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationStructuredListViewController:didEndUserInteractionWithViewController:", self, v6);

}

- (void)notificationListBaseComponent:(id)a3 didAddViewController:(id)a4
{
  id v6;
  NCNotificationStructuredListViewController *v7;
  NCMaterialDisplayingCaptureOnlyViewController *captureOnlyMaterialViewController;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "parentViewController");
  v7 = (NCNotificationStructuredListViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    objc_msgSend((id)objc_opt_class(), "presentableTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCMaterialDisplayingCaptureOnlyViewController registerMaterialDisplaying:persistent:](captureOnlyMaterialViewController, "registerMaterialDisplaying:persistent:", v6, objc_msgSend(v9, "containsObject:", objc_opt_class()));

    -[NCNotificationStructuredListViewController addChildViewController:](self, "addChildViewController:", v6);
    objc_msgSend(v6, "didMoveToParentViewController:", self);
  }

}

- (void)notificationListBaseComponent:(id)a3 didRemoveViewController:(id)a4
{
  NCNotificationStructuredListViewController *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "parentViewController");
  v5 = (NCNotificationStructuredListViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v6, "removeFromParentViewController");
    objc_msgSend(v6, "didMoveToParentViewController:", 0);
    -[NCMaterialDisplayingCaptureOnlyViewController unregisterMaterialDisplaying:](self->_captureOnlyMaterialViewController, "unregisterMaterialDisplaying:", v6);
  }

}

- (void)notificationListBaseComponent:(id)a3 requestsModalPresentationOfNavigationController:(id)a4 sender:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v13, "setPresenterDelegate:", self);
  -[NCNotificationStructuredListViewController _presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:](self, "_presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:", v13, v12, v7, v11);

}

- (void)notificationListBaseComponent:(id)a3 willUpdateViewController:(id)a4
{
  NCNotificationStructuredListViewController *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "parentViewController");
  v5 = (NCNotificationStructuredListViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[NCMaterialDisplayingCaptureOnlyViewController unregisterMaterialDisplaying:](self->_captureOnlyMaterialViewController, "unregisterMaterialDisplaying:", v6);

}

- (void)notificationListBaseComponent:(id)a3 didUpdateViewController:(id)a4
{
  id v6;
  NCNotificationStructuredListViewController *v7;
  NCMaterialDisplayingCaptureOnlyViewController *captureOnlyMaterialViewController;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "parentViewController");
  v7 = (NCNotificationStructuredListViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    objc_msgSend((id)objc_opt_class(), "presentableTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCMaterialDisplayingCaptureOnlyViewController registerMaterialDisplaying:persistent:](captureOnlyMaterialViewController, "registerMaterialDisplaying:persistent:", v6, objc_msgSend(v9, "containsObject:", objc_opt_class()));

  }
}

- (void)notificationListBaseComponent:(id)a3 requestsClearingPresentables:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__NCNotificationStructuredListViewController_notificationListBaseComponent_requestsClearingPresentables___block_invoke;
  v12[3] = &unk_1E8D1E548;
  v11 = v7;
  v13 = v11;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (objc_msgSend(v11, "count") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "notificationStructuredListViewController:requestsClearingNotificationRequests:", self, v11);
    if (objc_msgSend(v9, "count") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "notificationStructuredListViewController:requestsClearingSupplementaryViewControllers:", self, v9);
  }

}

void __105__NCNotificationStructuredListViewController_notificationListBaseComponent_requestsClearingPresentables___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(v5, "hostedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

    }
  }

}

- (void)notificationListBaseComponent:(id)a3 didTransitionActionsForSwipeInteraction:(id)a4 revealed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a5;
  v7 = a4;
  -[NCNotificationStructuredListViewController touchEaterManager](self, "touchEaterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v5)
    v9 = v7;
  else
    v9 = 0;
  objc_msgSend(v8, "setSwipeInteractionInRevealedState:", v9);

}

- (void)notificationListBaseComponent:(id)a3 closeSwipeInteractions:(BOOL)a4
{
  -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", a4);
}

- (void)notificationListBaseComponent:(id)a3 didTransitionCoalescingControlsHandler:(id)a4 toClearState:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a5;
  v7 = a4;
  -[NCNotificationStructuredListViewController touchEaterManager](self, "touchEaterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v5)
    v9 = v7;
  else
    v9 = 0;
  objc_msgSend(v8, "setCoalescingControlsHandlerInClearState:", v9);

}

- (void)notificationListBaseComponent:(id)a3 didPresentCoalescingControlsHandler:(id)a4 inForceTouchState:(BOOL)a5
{
  if (!a5)
    a4 = 0;
  objc_storeWeak((id *)&self->_coalescingControlsHandlerInForceTouchState, a4);
}

- (void)notificationListComponent:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationStructuredListViewController:requestsClearingNotificationRequestsInSections:", self, v6);

}

- (void)notificationListComponent:(id)a3 didTransitionSectionHeaderView:(id)a4 toClearState:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a5;
  v7 = a4;
  -[NCNotificationStructuredListViewController touchEaterManager](self, "touchEaterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v5)
    v9 = v7;
  else
    v9 = 0;
  objc_msgSend(v8, "setHeaderViewInClearState:", v9);

}

- (void)notificationListComponent:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "un_logDigest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests permission to execute action %{public}@ for notification request %{public}@", (uint8_t *)&v22, 0x20u);

  }
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "notificationStructuredListViewController:requestPermissionToExecuteAction:forNotificationRequest:withParameters:completion:", self, v11, v12, v13, v14);

}

- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v10 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v24 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "un_logDigest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v19;
    v27 = 2114;
    v28 = v20;
    v29 = 2114;
    v30 = v22;
    _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ requests executing action %{public}@ for notification request %{public}@", buf, 0x20u);

    v10 = v24;
  }
  -[NCNotificationManagementViewPresenter dismissManagementViewIfPresentedAnimated:](self->_managementViewPresenter, "dismissManagementViewIfPresentedAnimated:", 1);
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "notificationStructuredListViewController:requestsExecuteAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v13, v14, v10, v15, v16);

}

- (void)notificationListComponent:(id)a3 willDismissLongLookForCancelActionForViewController:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss long look for cancel action for view controller %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[NCNotificationManagementViewPresenter dismissManagementViewIfPresentedAnimated:](self->_managementViewPresenter, "dismissManagementViewIfPresentedAnimated:", 1);

}

- (id)notificationListComponent:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[NCNotificationStructuredListViewController _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a4);
}

- (BOOL)notificationListComponent:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "notificationStructuredListViewController:shouldAllowInteractionsForNotificationRequest:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (id)notificationListComponent:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "notificationStructuredListViewController:containerViewProviderForExpandedContentForViewController:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)notificationListComponent:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationStructuredListViewController:shouldFinishLongLookTransitionForNotificationRequest:trigger:withCompletionBlock:", self, v10, a5, v9);

}

- (void)notificationListComponent:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
    goto LABEL_17;
  v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v9)
      goto LABEL_8;
    v10 = v8;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 138543618;
    *(_QWORD *)&v24[4] = v11;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v14;
    v15 = "%{public}@ presenting long look for notification request %{public}@";
  }
  else
  {
    if (!v9)
      goto LABEL_8;
    v10 = v8;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 138543618;
    *(_QWORD *)&v24[4] = v11;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v14;
    v15 = "%{public}@ dismissed long look for notification request %{public}@";
  }
  _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, v15, v24, 0x16u);

LABEL_8:
  -[NCNotificationStructuredListViewController setNotificationViewControllerPresentingLongLook:](self, "setNotificationViewControllerPresentingLongLook:", v5, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25);
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "notificationStructuredListViewController:isPresentingLongLookForViewController:", self, v5);
  -[NCNotificationStructuredListViewController notificationRequestRemovedWhilePresentingLongLook](self, "notificationRequestRemovedWhilePresentingLongLook");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v5 && v17)
  {
    v19 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "notificationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "un_logDigest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 138543618;
      *(_QWORD *)&v24[4] = v21;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v23;
      _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ on long look dismissal", v24, 0x16u);

    }
    -[NCNotificationStructuredListViewController removeNotificationRequest:](self, "removeNotificationRequest:", v18);
    -[NCNotificationStructuredListViewController setNotificationRequestRemovedWhilePresentingLongLook:](self, "setNotificationRequestRemovedWhilePresentingLongLook:", 0);
  }

LABEL_17:
}

- (void)notificationListComponent:(id)a3 didPresentSectionHeaderView:(id)a4 inForceTouchState:(BOOL)a5
{
  if (!a5)
    a4 = 0;
  objc_storeWeak((id *)&self->_headerViewInForceTouchState, a4);
}

- (void)notificationListComponent:(id)a3 requestsPresentingManagementViewForNotificationRequest:(id)a4 managementViewType:(unint64_t)a5 withPresentingView:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "un_logDigest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v17;
    v31 = 2114;
    v32 = v19;
    v33 = 2114;
    v34 = v20;
    v35 = 2048;
    v36 = a5;
    _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting management view for notification request %{public}@ for section %{public}@ with type %ld", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingManagementViewForNotificationRequest_managementViewType_withPresentingView_completion___block_invoke;
  v25[3] = &unk_1E8D1E570;
  objc_copyWeak(v28, (id *)buf);
  v28[1] = (id)a5;
  v21 = v12;
  v26 = v21;
  v22 = v13;
  v27 = v22;
  -[NCNotificationStructuredListViewController _requestAuthenticationAndPerformBlock:](self, "_requestAuthenticationAndPerformBlock:", v25);
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "notificationStructuredListViewControllerDidSignificantUserInteraction:", self);

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);

}

void __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingManagementViewForNotificationRequest_managementViewType_withPresentingView_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "managementViewPresenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "bs_topPresentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentNotificationManagementViewType:forNotificationRequest:withPresentingViewController:withPresentingView:", v4, v5, v6, *(_QWORD *)(a1 + 40));

  }
}

- (void)notificationListComponent:(id)a3 requestsPresentingOptionsMenuForNotificationRequest:(id)a4 presentingViewProvider:(id)a5 optionsForSection:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v8 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v26 = a7;
  v15 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notificationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "un_logDigest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v17;
    v36 = 2114;
    v37 = v19;
    v38 = 2114;
    v39 = v20;
    v40 = 1024;
    v41 = v8;
    _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting options menu for notification request %{public}@ for section %{public}@ [optionsForSection=%{BOOL}d]", buf, 0x26u);

  }
  objc_initWeak((id *)buf, self);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke;
  v27[3] = &unk_1E8D1E5C0;
  objc_copyWeak(&v32, (id *)buf);
  v33 = v8;
  v21 = v12;
  v28 = v21;
  v22 = v14;
  v30 = v22;
  v23 = v13;
  v29 = v23;
  v24 = v26;
  v31 = v24;
  -[NCNotificationStructuredListViewController _requestAuthenticationAndPerformBlock:](self, "_requestAuthenticationAndPerformBlock:", v27);
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v25, "notificationStructuredListViewControllerDidSignificantUserInteraction:", self);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

uint64_t __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[5];
  id v9;
  char v10;

  if ((_DWORD)a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v5 = WeakRetained;
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(WeakRetained, "setNotificationListComponentPresentingOptionsMenu:", *(_QWORD *)(a1 + 32));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke_2;
    v8[3] = &unk_1E8D1E598;
    v8[4] = v5;
    v6 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    v10 = *(_BYTE *)(a1 + 72);
    (*(void (**)(uint64_t, _QWORD *))(v6 + 16))(v6, v8);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __176__NCNotificationStructuredListViewController_notificationListComponent_requestsPresentingOptionsMenuForNotificationRequest_presentingViewProvider_optionsForSection_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned __int8 *)(a1 + 48);
  v8 = a2;
  objc_msgSend(v5, "_presentOptionsMenuForNotificationRequest:withPresentingView:optionsForSection:", v6, a3, v7);
  objc_msgSend(*(id *)(a1 + 32), "touchEaterManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "swipeInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSwipeInteractionInRevealedState:", v10);
  objc_msgSend(*(id *)(a1 + 32), "touchEaterManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 0);

}

- (void)notificationListComponent:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a4;
  v14 = a5;
  v11 = a6;
  v12 = a7;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "notificationStructuredListViewController:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v14, v11, v12);

}

- (void)notificationListComponent:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationStructuredListViewController:setScheduledDelivery:forSectionIdentifier:", self, v5, v8);

}

- (void)notificationListComponent:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationStructuredListViewController:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v8);

}

- (void)notificationListComponent:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "notificationStructuredListViewController:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v8);

}

- (id)notificationListComponent:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "notificationStructuredListViewController:notificationRequestForUUID:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)notificationListComponentRequestsCurrentModeConfiguration:(id)a3
{
  return -[NCModeManager currentModeConfiguration](self->_modeManager, "currentModeConfiguration", a3);
}

- (void)notificationListComponent:(id)a3 setModeConfiguration:(id)a4
{
  -[NCModeManager setModeConfiguration:](self->_modeManager, "setModeConfiguration:", a4);
}

- (BOOL)notificationListComponent:(id)a3 isClockNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "notificationStructuredListViewController:isClockNotificationRequest:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (void)notificationListComponent:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationStructuredListViewController:requestsAuthenticationAndPerformBlock:", self, v5);

}

- (id)notificationUsageTrackingStateForNotificationListComponent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "notificationUsageTrackingStateForNotificationStructuredListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (id)notificationListComponent:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "notificationStructuredListViewController:keyboardAssertionForGestureWindow:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "hideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationListComponent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "unhideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationListComponent:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "settleHomeAffordanceAnimationBehaviorDescriptionForNotificationStructuredListViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)notificationListComponentShouldAllowLongPressGesture:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "notificationStructuredListViewControllerShouldAllowLongPressGesture:", self);
  else
    v5 = 1;

  return v5;
}

- (void)notificationListComponent:(id)a3 acceptedSummaryOnboarding:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0DC5F90];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      v9 = v7;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v10;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting digest onboarding flow", (uint8_t *)&v24, 0xCu);

    }
    -[NCNotificationStructuredListViewController digestOnboardingSuggestionClient](self, "digestOnboardingSuggestionClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredListViewController digestOnboardingSuggestion](self, "digestOnboardingSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userAcceptedDigestOnboardingSuggestion:", v12);

    -[NCNotificationStructuredListViewController digestOnboardingSuggestionLogging](self, "digestOnboardingSuggestionLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredListViewController digestOnboardingSuggestionPresentationTime](self, "digestOnboardingSuggestionPresentationTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v15);
    objc_msgSend(v13, "logDigestOnboardingSuggestionWithOutcome:timeToResolution:", 1);

    NCUserNotificationsUIKitFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_INTRODUCTION_DISMISS_BUTTON"), &stru_1E8D21F60, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCDigestOnboardingNavigationController navigationControllerWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:](NCDigestOnboardingNavigationController, "navigationControllerWithOnboardingDelegate:deferButtonText:previousBundleIdentifiersSelection:previousDeliveryTimesSelection:", self, v17, self->_digestOnboardingLastBundleIdentifiersSelection, self->_digestOnboardingLastScheduledDeliveryTimesSelection);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationStructuredListViewController _presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:](self, "_presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:", v18, v6, 1, 0);
  }
  else
  {
    if (v8)
    {
      v19 = v7;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v20;
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing digest onboarding suggestion", (uint8_t *)&v24, 0xCu);

    }
    -[NCNotificationStructuredListViewController digestOnboardingSuggestionLogging](self, "digestOnboardingSuggestionLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredListViewController digestOnboardingSuggestionPresentationTime](self, "digestOnboardingSuggestionPresentationTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceDate:", v23);
    objc_msgSend(v21, "logDigestOnboardingSuggestionWithOutcome:timeToResolution:", 0);

    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOnboardingSummaryVisible:", 0);
  }

}

- (void)notificationRootList:(id)a3 displayStyleSettingChanged:(int64_t)a4
{
  -[NCNotificationListCountIndicatorViewController setDisplayStyleSetting:](self->_countIndicatorViewController, "setDisplayStyleSetting:", a4);
}

- (Class)notificationRootListNotificationViewControllerClass:(id)a3
{
  id WeakRetained;
  void *v5;
  objc_class *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend(WeakRetained, "notificationStructuredListViewControllerNotificationViewControllerClass:", self);
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)notificationRootList:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationStructuredListViewController:requestsClearingFromIncomingSectionNotificationRequests:", self, v5);

}

- (void)notificationRootListDidUpdateVisibleContentExtent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  -[NCNotificationStructuredListViewController listModel](self, "listModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregatedVisibleContentExtent");
  +[NCListDebugHUDModelBridge plotRect:label:](NCListDebugHUDModelBridge, "plotRect:label:", CFSTR("aggregatedVisibleContentExtent"));

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "notificationStructuredListViewControllerDidUpdateVisibleContentExtent:", self);
      v6 = v8;
    }
  }

}

- (BOOL)notificationRootListShouldAllowNotificationHistoryReveal:(id)a3
{
  void *v4;
  char v5;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:", self);
  else
    v5 = 1;

  return v5;
}

- (void)notificationRootListDidScrollToRevealNotificationHistory:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationStructuredListViewControllerDidScrollToRevealNotificationHistory:", self);
      v5 = v7;
    }
  }

}

- (void)notificationRootList:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "scrollViewWillBeginDragging:", v6);

}

- (void)notificationRootList:(id)a3 scrollViewDidScroll:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isTracking") && v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "notificationStructuredListViewControllerDidSignificantUserInteraction:", self);
  }
  else if (!v5)
  {
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "scrollViewDidScroll:", v11);
LABEL_8:
  v6 = objc_msgSend(v11, "isTracking");
  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    -[NCNotificationStructuredListViewController listView](self, "listView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "distanceScrolledBeyondBottomOfContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDistanceScrolledBeyondBottomOfContent:", v10);

  }
  else
  {
    objc_msgSend(v7, "setDistanceScrolledBeyondBottomOfContent:", 0);
  }

}

- (void)notificationRootList:(id)a3 scrollViewWillEndDragging:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;

  y = a5.y;
  x = a5.x;
  v12 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a6, x, y);
  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDistanceScrolledBeyondBottomOfContent:", 0);

}

- (BOOL)notificationRootList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "notificationStructuredListViewController:shouldFilterNotificationRequest:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)notificationRootListAreHighlightsEnabled:(id)a3
{
  void *v3;
  char v4;

  -[NCNotificationStructuredListViewController _notificationSystemSettings](self, "_notificationSystemSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areHighlightsEnabled");

  return v4;
}

- (void)notificationListComponent:(id)a3 setNotificationSystemSettings:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationStructuredListViewController:setNotificationSystemSettings:", self, v6);

}

- (void)notificationRootListWillExpandNotificationListCount:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "notificationStructuredListViewControllerWillExpandNotificationListCount:", self);
      v5 = v7;
    }
  }

}

- (void)notificationOptionsMenuWillDismiss:(id)a3
{
  -[NCNotificationListTouchEaterManager setEnabled:](self->_touchEaterManager, "setEnabled:", 1);
  -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", 1);
}

- (id)notificationOptionsMenu:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[NCNotificationStructuredListViewController _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a4);
}

- (void)notificationOptionsMenu:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suggestionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logResponseForNotificationRequest:allowsNotifications:", v11, v8);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "notificationStructuredListViewController:setAllowsNotifications:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationOptionsMenu:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v15;
    v21 = 1024;
    v22 = v8;
    v23 = 2114;
    v24 = v17;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows critical alerts = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v19, 0x26u);

  }
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "notificationStructuredListViewController:setAllowsCriticalAlerts:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationOptionsMenu:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a4;
  v15 = a5;
  v12 = a7;
  v13 = a8;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "notificationStructuredListViewController:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v10, v15, v12, v13);

}

- (void)notificationOptionsMenu:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows time sensitive notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suggestionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logResponseForNotificationRequest:allowsTimeSensitive:", v11, v8);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "notificationStructuredListViewController:setAllowsTimeSensitive:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationOptionsMenu:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a6;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "notificationStructuredListViewController:setScheduledDelivery:forSectionIdentifier:", self, v6, v9);

}

- (void)notificationOptionsMenu:(id)a3 addSenderToContactsForNotificationRequest:(id)a4 withSectionIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "contentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC6030], "imageDataForContentURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v13, "topLevelSectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCCreateContactNavigationViewController navigationControllerWithContact:bundleIdentifier:imageData:presenterDelegate:](NCCreateContactNavigationViewController, "navigationControllerWithContact:bundleIdentifier:imageData:presenterDelegate:", v8, v11, v10, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationStructuredListViewController _presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:](self, "_presentNavigationControllerAndBeginModalInteraction:sender:animated:completion:", v12, v8, 1, 0);
  }

}

- (id)notificationOptionsMenuRequestsCurrentModeConfiguration:(id)a3
{
  return -[NCModeManager currentModeConfiguration](self->_modeManager, "currentModeConfiguration", a3);
}

- (void)notificationOptionsMenu:(id)a3 setModeConfiguration:(id)a4
{
  -[NCModeManager setModeConfiguration:](self->_modeManager, "setModeConfiguration:", a4);
}

- (void)notificationOptionsMenu:(id)a3 requestsClearingSectionWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NCNotificationStructuredListViewController notificationListComponentPresentingOptionsMenu](self, "notificationListComponentPresentingOptionsMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v16;
        _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing all notifications for app section %{public}@ triggered from options menu", (uint8_t *)&v17, 0x16u);

      }
      objc_msgSend(v10, "clearAll");
      -[NCNotificationStructuredListViewController setNotificationListComponentPresentingOptionsMenu:](self, "setNotificationListComponentPresentingOptionsMenu:", 0);
    }

  }
}

- (BOOL)notificationOptionsMenu:(id)a3 isDisplayingStackSummaryForNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionForNotificationRequest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isShowingSummarizedStackForNotificationRequest:", v5);
  return (char)v6;
}

- (void)modalNavigationControllerDidDismiss:(id)a3
{
  NCModalNavigationController *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NCModalNavigationController *modalNavigationController;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NCModalNavigationController *)a3;
  if (self->_modalNavigationController == v4)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ending lock screen interaction for dismissed navigation navigation controller of type '%{public}@'.", (uint8_t *)&v12, 0x16u);

    }
    -[NCNotificationStructuredListViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "notificationStructuredListViewControllerDidEndUserInteraction:", self);
    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;

  }
}

- (void)createContactNavigationControllerDidComplete:(id)a3
{
  void *v3;
  id v4;

  -[NCNotificationStructuredListViewController listModel](self, "listModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadContactSuggestions");

}

- (id)notificationManagementViewPresenter:(id)a3 sectionSettingsForSectionIdentifier:(id)a4
{
  return -[NCNotificationStructuredListViewController _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", a4);
}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsNotifications:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suggestionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logResponseForNotificationRequest:allowsNotifications:", v11, v8);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "notificationStructuredListViewController:setAllowsNotifications:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationManagementViewPresenter:(id)a3 setDeliverQuietly:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set deliver quietly = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suggestionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logResponseForNotificationRequest:deliveryQuietly:", v11, v8);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "notificationStructuredListViewController:setDeliverQuietly:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v15;
    v21 = 1024;
    v22 = v8;
    v23 = 2114;
    v24 = v17;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows critical alerts = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v19, 0x26u);

  }
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "notificationStructuredListViewController:setAllowsCriticalAlerts:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a4;
  v14 = a5;
  v11 = a6;
  v12 = a7;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "notificationStructuredListViewController:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v14, v11, v12);

}

- (void)notificationManagementViewPresenter:(id)a3 setScheduledDelivery:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v13 = a6;
  v9 = a5;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logResponseForNotificationRequest:scheduledDelivery:", v9, v7);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "notificationStructuredListViewController:setScheduledDelivery:forSectionIdentifier:", self, v7, v13);

}

- (void)notificationManagementViewPresenterWillPresentManagementView:(id)a3
{
  void *v4;
  id v5;

  -[NCNotificationStructuredListViewController bs_topPresentedViewController](self, "bs_topPresentedViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "preserveInputViews");
  -[NCNotificationStructuredListViewController touchEaterManager](self, "touchEaterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void)notificationManagementViewPresenterDidDismissManagementView:(id)a3
{
  void *v4;
  id v5;

  -[NCNotificationStructuredListViewController bs_topPresentedViewController](self, "bs_topPresentedViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "restoreInputViews");
  -[NCNotificationStructuredListViewController touchEaterManager](self, "touchEaterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)notificationManagementViewPresenter:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forNotificationRequest:(id)a5 withSectionIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v15;
    v23 = 1024;
    v24 = v8;
    v25 = 2114;
    v26 = v17;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ set allows time sensitive notifications = %{BOOL}d for notification request %{public}@ and section identifier %{public}@", (uint8_t *)&v21, 0x26u);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suggestionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logResponseForNotificationRequest:allowsTimeSensitive:", v11, v8);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "notificationStructuredListViewController:setAllowsTimeSensitive:forSectionIdentifier:", self, v8, v12);

}

- (void)notificationManagementViewPresenter:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forNotificationRequest:(id)a6 withSectionIdentifier:(id)a7 threadIdentifier:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v12 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v29 = v12;
    v21 = v15;
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notificationIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "un_logDigest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v23;
    v32 = 2114;
    v33 = v25;
    v34 = 2114;
    v35 = v17;
    v36 = 2114;
    v37 = v18;
    _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ mute notifications for request %{public}@, section identifier %{public}@, thread identifier %{public}@", buf, 0x2Au);

    v14 = v22;
    v15 = v21;
    v12 = v29;

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "suggestionManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "logResponseForNotificationRequest:muted:", v16, v12);

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v28, "notificationStructuredListViewController:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v12, v15, v17, v18);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationStructuredListViewController;
  -[NCNotificationStructuredListViewController traitCollectionDidChange:](&v19, sel_traitCollectionDidChange_, v4);
  -[NCNotificationStructuredListViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[NCNotificationStructuredListViewController _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  v8 = objc_msgSend(v4, "_backlightLuminance") != 1;
  -[NCNotificationStructuredListViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_backlightLuminance");

  if (((v8 ^ (v10 == 1)) & 1) == 0)
  {
    v11 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("on");
      if (v10 == 1)
        v12 = CFSTR("off");
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "AOD traitsDidChange. display: %@", buf, 0xCu);
    }
    if (v10 == 1)
    {
      if (!-[NCNotificationStructuredListViewController showNotificationsInAlwaysOn](self, "showNotificationsInAlwaysOn"))
      {
        -[NCNotificationStructuredListViewController listModel](self, "listModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 2;
        v18 = 1;
        goto LABEL_13;
      }
      -[NCNotificationStructuredListViewController _notificationSystemSettings](self, "_notificationSystemSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "listDisplayStyleSetting");

      if (!v14)
      {
        -[NCNotificationStructuredListViewController listModel](self, "listModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = 1;
        v18 = 0;
LABEL_13:
        objc_msgSend(v15, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", v17, CFSTR("NCNotificationListDisplayStyleReasonOverrideDeviceLocked"), v18);

      }
    }
  }

}

- (void)_didExitAlwaysOn
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_DEFAULT, "NCStructuredListVC didExitAlwaysOn", v8, 2u);
  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeOverrideNotificationListDisplayStyleSettingForReason:", CFSTR("NCNotificationListDisplayStyleReasonOverrideDeviceLocked"));

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_29);

  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didExitAlwaysOn");

}

uint64_t __62__NCNotificationStructuredListViewController__didExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didExitAlwaysOn");
}

- (void)toolsOverlayViewRequestsBeginUserInteraction:(id)a3
{
  id v4;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationStructuredListViewControllerDidBeginUserInteraction:", self);

}

- (void)toolsOverlayViewRequestsEndUserInteraction:(id)a3
{
  id v4;

  -[NCNotificationStructuredListViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationStructuredListViewControllerDidEndUserInteraction:", self);

}

- (void)notificationListCountIndicatorViewControllerTapped:(id)a3
{
  id v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapCountIndicator");

}

- (void)notificationListCountIndicatorViewControllerLongPressed:(id)a3 presentingView:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "notificationStructuredListViewController:requestsPresentingFocusActivityPickerFromView:", self, v6);

}

- (void)notificationListCountIndicatorViewController:(id)a3 didChangeVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "notificationStructuredListViewController:didUpdateOverlayFooterContentVisibility:", self, v4);
      v7 = v9;
    }
  }

}

- (void)digestOnboardingSuggestionClient:(id)a3 didSuggestOnboarding:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ digest onboarding suggestion client did suggest onboarding", (uint8_t *)&v11, 0xCu);

  }
  if (-[NCNotificationStructuredListViewController _shouldPresentDigestOnboardingSuggestion](self, "_shouldPresentDigestOnboardingSuggestion"))
  {
    -[NCNotificationStructuredListViewController _setDigestOnboardingSuggestionVisible:](self, "_setDigestOnboardingSuggestionVisible:", 1);
    -[NCNotificationStructuredListViewController setDigestOnboardingSuggestion:](self, "setDigestOnboardingSuggestion:", v7);
  }

}

- (void)modeManager:(id)a3 didUpdateCurrentModeConfiguration:(id)a4 previousModeConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "mode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(v9, "modeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(v10, "modeIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressionType");

  objc_msgSend(v8, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "suppressionType");
  v19 = (void *)*MEMORY[0x1E0DC5F90];
  v45 = (void *)v14;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v21;
    v48 = 2114;
    v49 = v12;
    v50 = 2114;
    v51 = v45;
    _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ received DND mode update with current mode %{public}@ and previous mode %{public}@", buf, 0x20u);

    v14 = (uint64_t)v45;
  }
  if (objc_msgSend(v12, "isEqualToString:", v14))
  {
    v22 = v11;
    if (v16 == 2 && v18 != 2)
    {
      v23 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v25;
        v48 = 2114;
        v49 = v12;
        _os_log_impl(&dword_1CFC3D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section active for DND mode %{public}@ on suppression type changed to delay delivery", buf, 0x16u);

      }
      -[NCNotificationStructuredListViewController listModel](self, "listModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 1;
      v29 = v11;
      v30 = 1;
LABEL_27:
      objc_msgSend(v26, "toggleMissedSectionActive:forDNDMode:hideVisibleNotifications:", v28, v29, v30);

      goto LABEL_28;
    }
    if (v16 != 2 && v18 == 2)
    {
      v36 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        v48 = 2114;
        v49 = v45;
        _os_log_impl(&dword_1CFC3D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section inactive for DND mode %{public}@ on suppression type changed from delay delivery", buf, 0x16u);

      }
      -[NCNotificationStructuredListViewController listModel](self, "listModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 0;
      v29 = v13;
      v30 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v22 = v11;
    if (v8 && v18 == 2)
    {
      v31 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v33;
        v48 = 2114;
        v49 = v45;
        v50 = 2114;
        v51 = v12;
        _os_log_impl(&dword_1CFC3D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section inactive for DND mode %{public}@ on mode change to %{public}@", buf, 0x20u);

      }
      -[NCNotificationStructuredListViewController listModel](self, "listModel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "toggleMissedSectionActive:forDNDMode:hideVisibleNotifications:", 0, v13, 0);

    }
    if (v7 && v16 == 2)
    {
      if (v8)
        v35 = objc_msgSend(v7, "dimsLockScreen") != 0;
      else
        v35 = 1;
      v39 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v40 = v39;
        -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v41;
        v48 = 2114;
        v49 = v12;
        v50 = 1024;
        LODWORD(v51) = v35;
        _os_log_impl(&dword_1CFC3D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ setting missed section active for DND mode %{public}@ and hiding visible notifications = %{BOOL}d", buf, 0x1Cu);

      }
      -[NCNotificationStructuredListViewController listModel](self, "listModel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 1;
      v29 = v11;
      v30 = v35;
      goto LABEL_27;
    }
  }
LABEL_28:
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "reloadRemoteSuggestions");

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActiveDNDModeConfiguration:", v7);

  -[NCNotificationStructuredListViewController countIndicatorViewController](self, "countIndicatorViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActiveDNDModeConfiguration:", v7);

}

- (void)digestOnboardingNavigationController:(id)a3 didScheduleDigestDeliveryTimes:(id)a4 forAppBundleIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *digestOnboardingLastBundleIdentifiersSelection;
  NSArray *digestOnboardingLastScheduledDeliveryTimesSelection;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v13;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received updated scheduled delivery settings from onboarding view controller with delivery times %@", buf, 0x16u);

  }
  -[NCNotificationStructuredListViewController _setDigestOnboardingSuggestionVisible:](self, "_setDigestOnboardingSuggestionVisible:", 0);
  v14 = (void *)objc_msgSend(v9, "copy");
  -[NCNotificationStructuredListViewController _setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:](self, "_setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", 1, v14);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        -[NCNotificationStructuredListViewController _setScheduledDeliveryEnabledForSectionIdentifier:](self, "_setScheduledDeliveryEnabledForSectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19++), (_QWORD)v22);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  digestOnboardingLastBundleIdentifiersSelection = self->_digestOnboardingLastBundleIdentifiersSelection;
  self->_digestOnboardingLastBundleIdentifiersSelection = 0;

  digestOnboardingLastScheduledDeliveryTimesSelection = self->_digestOnboardingLastScheduledDeliveryTimesSelection;
  self->_digestOnboardingLastScheduledDeliveryTimesSelection = 0;

}

- (void)digestOnboardingNavigationController:(id)a3 didChangeDeliveryTimesActiveSelection:(id)a4 appBundleIdentifiersActiveSelection:(id)a5
{
  NSArray *v7;
  NSArray *digestOnboardingLastScheduledDeliveryTimesSelection;
  id v9;

  v7 = (NSArray *)a4;
  objc_storeStrong((id *)&self->_digestOnboardingLastBundleIdentifiersSelection, a5);
  v9 = a5;
  digestOnboardingLastScheduledDeliveryTimesSelection = self->_digestOnboardingLastScheduledDeliveryTimesSelection;
  self->_digestOnboardingLastScheduledDeliveryTimesSelection = v7;

}

- (void)digestOnboardingNavigationControllerDidDeferSetup:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NCNotificationStructuredListViewController _setDigestOnboardingSuggestionVisible:](self, "_setDigestOnboardingSuggestionVisible:", 0);
  v4 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ User deferred digest setup. Onboarding navigation controller dismissed", (uint8_t *)&v7, 0xCu);

  }
}

- (BOOL)_isPresentingDigestOnboardingSuggestion
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnboardingSummaryVisible");

  return v3;
}

- (void)_toggleDigestOnboardingSuggestionIfNecessary
{
  if (-[NCNotificationStructuredListViewController _shouldPresentDigestOnboardingSuggestion](self, "_shouldPresentDigestOnboardingSuggestion"))
  {
    if (!self->_digestOnboardingSuggestionClient)
      -[NCNotificationStructuredListViewController _scheduleDigestOnboardingSuggestion](self, "_scheduleDigestOnboardingSuggestion");
  }
  else if (-[NCNotificationStructuredListViewController _isPresentingDigestOnboardingSuggestion](self, "_isPresentingDigestOnboardingSuggestion"))
  {
    -[NCNotificationStructuredListViewController _setDigestOnboardingSuggestionVisible:](self, "_setDigestOnboardingSuggestionVisible:", 0);
  }
}

- (void)_presentNavigationControllerAndBeginModalInteraction:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  NCModalNavigationController *modalNavigationController;
  const __CFString *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (self->_modalNavigationController)
  {
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
  else
  {
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = CFSTR("<null>");
    }
    v15 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v16 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      v34 = 2114;
      v35 = v20;
      v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning lock screen interaction with navigation controller of type '%{public}@' from sender of type: '%{public}@'", buf, 0x20u);

    }
    v21 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v23;
      v34 = 2114;
      v35 = v25;
      v36 = 2114;
      v37 = v28;
      _os_log_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting navigation controller of type '%{public}@' from sender of type: '%{public}@'", buf, 0x20u);

    }
    -[NCNotificationStructuredListViewController delegate](self, "delegate", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "notificationStructuredListViewControllerDidBeginUserInteraction:", self);
    objc_storeStrong((id *)&self->_modalNavigationController, a3);
    modalNavigationController = self->_modalNavigationController;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __126__NCNotificationStructuredListViewController__presentNavigationControllerAndBeginModalInteraction_sender_animated_completion___block_invoke;
    v30[3] = &unk_1E8D1B808;
    v31 = v13;
    -[NCNotificationStructuredListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", modalNavigationController, 1, v30);

  }
}

uint64_t __126__NCNotificationStructuredListViewController__presentNavigationControllerAndBeginModalInteraction_sender_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_setDigestOnboardingSuggestionVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  ATXDigestOnboardingSuggestionLogging *v9;
  ATXDigestOnboardingSuggestionLogging *digestOnboardingSuggestionLogging;
  NSDate *v11;
  NSDate *digestOnboardingSuggestionPresentationTime;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[NCNotificationStructuredListViewController _isPresentingDigestOnboardingSuggestion](self, "_isPresentingDigestOnboardingSuggestion");
  if (v3)
  {
    if (v5)
      return;
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v8;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ presenting digest onboarding suggestion on lock screen", (uint8_t *)&v18, 0xCu);

    }
    v9 = (ATXDigestOnboardingSuggestionLogging *)objc_opt_new();
    digestOnboardingSuggestionLogging = self->_digestOnboardingSuggestionLogging;
    self->_digestOnboardingSuggestionLogging = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    digestOnboardingSuggestionPresentationTime = self->_digestOnboardingSuggestionPresentationTime;
    self->_digestOnboardingSuggestionPresentationTime = v11;

    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOnboardingSummaryVisible:", 1);
  }
  else
  {
    if (!v5)
      return;
    v14 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ removing digest onboarding suggestion from lock screen", (uint8_t *)&v18, 0xCu);

    }
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOnboardingSummaryVisible:", 0);

    v13 = self->_digestOnboardingSuggestionLogging;
    self->_digestOnboardingSuggestionLogging = 0;
  }

}

- (BOOL)_shouldPresentDigestOnboardingSuggestion
{
  void *v2;
  char v3;

  -[NCNotificationStructuredListViewController _notificationSystemSettings](self, "_notificationSystemSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScheduledDeliveryUninitialized");

  return v3;
}

- (void)_scheduleDigestOnboardingSuggestion
{
  void *v3;
  NSObject *v4;
  void *v5;
  ATXDigestOnboardingSuggestionClient *v6;
  ATXDigestOnboardingSuggestionClient *digestOnboardingSuggestionClient;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_digestOnboardingSuggestionClient)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling digest onboarding suggestion", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CF8DC0], "sharedInstance");
    v6 = (ATXDigestOnboardingSuggestionClient *)objc_claimAutoreleasedReturnValue();
    digestOnboardingSuggestionClient = self->_digestOnboardingSuggestionClient;
    self->_digestOnboardingSuggestionClient = v6;

    -[ATXDigestOnboardingSuggestionClient registerObserver:](self->_digestOnboardingSuggestionClient, "registerObserver:", self);
    -[ATXDigestOnboardingSuggestionClient registerForOnboardingSuggestions](self->_digestOnboardingSuggestionClient, "registerForOnboardingSuggestions");
  }
}

- (void)_setSystemScheduledDeliveryEnabled:(BOOL)a3 scheduledDeliveryTimes:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "notificationStructuredListViewController:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", self, v4, v7);

}

- (void)_setScheduledDeliveryEnabledForSectionIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "notificationStructuredListViewController:setScheduledDelivery:forSectionIdentifier:", self, 1, v5);

}

- (void)_presentOptionsMenuForNotificationRequest:(id)a3 withPresentingView:(id)a4 optionsForSection:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NCNotificationOptionsMenu *v10;
  NCNotificationOptionsMenu *optionsMenu;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NCNotificationOptionsMenu initWithNotificationRequest:presentingView:settingsDelegate:optionsForSection:]([NCNotificationOptionsMenu alloc], "initWithNotificationRequest:presentingView:settingsDelegate:optionsForSection:", v9, v8, self, v5);

  optionsMenu = self->_optionsMenu;
  self->_optionsMenu = v10;

  -[NCNotificationOptionsMenu presentMenu](self->_optionsMenu, "presentMenu");
}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "notificationStructuredListViewController:requestsSectionSettingsForSectionIdentifier:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_notificationSystemSettings
{
  void *v3;
  void *v4;

  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "notificationStructuredListViewControllerRequestsSystemSettings:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_requestAuthenticationAndPerformBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationStructuredListViewController:requestsAuthenticationAndPerformBlock:", self, v4);

}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ adjusting for content size change", buf, 0xCu);

  }
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustForContentSizeCategoryChange");

  -[NCNotificationListViewProtocol updateBottomViewsRollUnder](self->_listView, "updateBottomViewsRollUnder");
  -[NCNotificationListCountIndicatorViewController adjustForContentSizeCategoryChange](self->_countIndicatorViewController, "adjustForContentSizeCategoryChange");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NCNotificationStructuredListViewController childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "adjustForContentSizeCategoryChange");
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)_forwarNotificationRequestToLongLookIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationStructuredListViewController notificationViewControllerPresentingLongLook](self, "notificationViewControllerPresentingLongLook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "notificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isUniqueThreadIdentifier")
      || !objc_msgSend(v7, "isUniqueThreadIdentifier")
      || !objc_msgSend(v4, "matchesThreadForRequest:", v7))
    {
      goto LABEL_13;
    }
    v8 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_INFO, "%{public}@ forwarding request %{public}@ to a presented long look", (uint8_t *)&v20, 0x16u);

    }
    if (objc_msgSend(v6, "didForwardNotificationRequestToCustomContent:", v4))
    {
      if (objc_msgSend(v4, "matchesRequest:", v7))
      {
        v13 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          -[NCNotificationStructuredListViewController _logDescription](self, "_logDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "notificationIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "un_logDigest");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543618;
          v21 = v15;
          v22 = 2114;
          v23 = v17;
          _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification view presenting long look on receiving forwarded request %{public}@", (uint8_t *)&v20, 0x16u);

        }
        objc_msgSend(v6, "setNotificationRequest:", v4);
      }
      v18 = 1;
    }
    else
    {
LABEL_13:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_resetSwipeInteractionWithRevealedActionsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[NCNotificationListTouchEaterManager swipeInteractionInRevealedState](self->_touchEaterManager, "swipeInteractionInRevealedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "hideActionsAnimated:fastAnimation:completion:", v3, 1, 0);
    -[NCNotificationListTouchEaterManager setSwipeInteractionInRevealedState:](self->_touchEaterManager, "setSwipeInteractionInRevealedState:", 0);
    v5 = v6;
  }

}

- (void)_loadListViewAndModelIfNecessary
{
  void *v3;
  int v4;
  int isKindOfClass;
  NCNotificationListView *v6;
  __objc2_class **v7;
  NCNotificationListView *v8;
  NCNotificationRootList *v9;
  NCNotificationListViewProtocol *listView;
  NCNotificationListView *v11;
  NCNotificationRootList *listModel;
  NCNotificationRootList *v13;
  void *v14;
  id v15;

  if (_NCReactiveListUI())
  {
    +[NCUserNotificationsUIKitDefaults standardDefaults](NCUserNotificationsUIKitDefaults, "standardDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "shouldUseReactiveList"))
    {
      if (self->_listView)
      {
        objc_opt_class();
        v4 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        v4 = 1;
      }
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  isKindOfClass = _NCReactiveListUI() ^ 1;
  if ((isKindOfClass & 1) != 0 || (v4 & 1) != 0)
  {
LABEL_13:
    if (((v4 | isKindOfClass) & 1) == 0)
      return;
    goto LABEL_14;
  }
  if (self->_listModel)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_13;
  }
LABEL_14:
  v6 = [NCNotificationListView alloc];
  if ((v4 & 1) != 0)
  {
    v7 = off_1E8D1A068;
    v8 = -[NCNotificationListView initWithModelType:purpose:](v6, "initWithModelType:purpose:", objc_opt_class(), CFSTR("TopLevel"));
    -[NCNotificationListView setSupportsBottomViewsRollUnder:](v8, "setSupportsBottomViewsRollUnder:", 0);
  }
  else
  {
    v8 = -[NCNotificationListView initWithModelType:purpose:](v6, "initWithModelType:purpose:", objc_opt_class(), CFSTR("TopLevel"));
    v7 = off_1E8D1A058;
  }
  v9 = (NCNotificationRootList *)objc_msgSend(objc_alloc(*v7), "initWithListView:", v8);
  -[NCNotificationRootList setDelegate:](v9, "setDelegate:", self);
  -[NCNotificationStructuredListViewController _notificationSystemSettings](self, "_notificationSystemSettings");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
    -[NCNotificationRootList updateNotificationSystemSettings:previousSystemSettings:](v9, "updateNotificationSystemSettings:previousSystemSettings:", v15, 0);
  listView = self->_listView;
  self->_listView = (NCNotificationListViewProtocol *)v8;
  v11 = v8;

  listModel = self->_listModel;
  self->_listModel = v9;
  v13 = v9;

  -[NCNotificationListViewProtocol setScrollEnabled:](self->_listView, "setScrollEnabled:", 1);
  -[NCNotificationListViewProtocol setContentInsetAdjustmentBehavior:](self->_listView, "setContentInsetAdjustmentBehavior:", 2);
  +[NCListDebugHUDModelBridge trackListView:](NCListDebugHUDModelBridge, "trackListView:", self->_listView);
  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setListView:", self->_listView);

}

- (void)_updateDebugHUD
{
  NSMutableDictionary *allNotificationRequests;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  allNotificationRequests = self->_allNotificationRequests;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__NCNotificationStructuredListViewController__updateDebugHUD__block_invoke;
  v3[3] = &unk_1E8D1E608;
  v3[4] = &v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](allNotificationRequests, "enumerateKeysAndObjectsUsingBlock:", v3);
  +[NCListDebugHUDModelBridge updateNotificationCount:](NCListDebugHUDModelBridge, "updateNotificationCount:", v5[3]);
  _Block_object_dispose(&v4, 8);
}

uint64_t __61__NCNotificationStructuredListViewController__updateDebugHUD__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)_listenToUserDefaultsToSwitchListViewAndModelIfNecessary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *allNotificationRequests;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (_NCReactiveListUI())
  {
    if (MEMORY[0x1D17DCDFC]("-[NCNotificationStructuredListViewController _listenToUserDefaultsToSwitchListViewAndModelIfNecessary]"))
    {
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      allNotificationRequests = self->_allNotificationRequests;
      self->_allNotificationRequests = v3;

      objc_initWeak(&location, self);
      +[NCUserNotificationsUIKitDefaults standardDefaults](NCUserNotificationsUIKitDefaults, "standardDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __102__NCNotificationStructuredListViewController__listenToUserDefaultsToSwitchListViewAndModelIfNecessary__block_invoke;
      v9[3] = &unk_1E8D1B278;
      objc_copyWeak(&v10, &location);
      v8 = (id)objc_msgSend(v5, "observeDefault:onQueue:withBlock:", CFSTR("shouldUseReactiveList"), v6, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __102__NCNotificationStructuredListViewController__listenToUserDefaultsToSwitchListViewAndModelIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "switchViews");
    WeakRetained = v2;
  }

}

- (void)switchViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  NSMutableDictionary *allNotificationRequests;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  -[NCNotificationListViewProtocol frame](self->_listView, "frame");
  v4 = v3;
  v6 = v5;
  -[NCNotificationStructuredListViewController _loadListViewAndModelIfNecessary](self, "_loadListViewAndModelIfNecessary");
  -[NCNotificationStructuredListViewController _resetListStateBeforeUIAppears](self, "_resetListStateBeforeUIAppears");
  -[NCNotificationStructuredListViewController _updateListVisibleAreaForSize:](self, "_updateListVisibleAreaForSize:", v4, v6);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  allNotificationRequests = self->_allNotificationRequests;
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke;
  v12[3] = &unk_1E8D1E658;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](allNotificationRequests, "enumerateKeysAndObjectsUsingBlock:", v12);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke_3;
  v11[3] = &unk_1E8D1E680;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __57__NCNotificationStructuredListViewController_switchViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NCNotificationStructuredListViewController_switchViews__block_invoke_2;
  v5[3] = &unk_1E8D1E630;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __57__NCNotificationStructuredListViewController_switchViews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  v5 = a3;
  objc_msgSend(v4, "insertNotificationRequest:", v5);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "sectionIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

uint64_t __57__NCNotificationStructuredListViewController_switchViews__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "notificationsLoadedForSectionIdentifier:", a2);
}

- (void)_resetListStateBeforeUIAppears
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[NCNotificationStructuredListViewController _resetSwipeInteractionWithRevealedActionsAnimated:](self, "_resetSwipeInteractionWithRevealedActionsAnimated:", 0);
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationStructuredListViewController legibilitySettingsForNotificationListBaseComponent:](self, "legibilitySettingsForNotificationListBaseComponent:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationStructuredListViewController adjustForLegibilitySettingsChange:](self, "adjustForLegibilitySettingsChange:", v8);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) > 1)
  {
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeOverrideNotificationListDisplayStyleSettingForReason:", CFSTR("NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation"));
  }
  else
  {
    -[NCNotificationStructuredListViewController listModel](self, "listModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 0, CFSTR("NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation"), 0);
  }

  -[NCNotificationListViewProtocol updateBottomViewsRollUnder](self->_listView, "updateBottomViewsRollUnder");
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForUIAppear");

}

- (void)_updateListVisibleAreaForSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[NCNotificationRootList updateListViewVisibleRectForSize:](self->_listModel, "updateListViewVisibleRectForSize:");
  -[NCNotificationStructuredListViewController _updateListEdgeInsetsForSize:](self, "_updateListEdgeInsetsForSize:", width, height);
}

- (UIEdgeInsets)_overlayFooterViewEdgeInsetsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  height = a3.height;
  width = a3.width;
  -[NCNotificationStructuredListViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (width <= height)
      v7 = 1;
    else
      v7 = 3;
    objc_msgSend(v6, "notificationStructuredListViewControllerRequestsEdgeInsetsForOverlayFooterView:forOrientation:", self, v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v11 = 0.0;
    *(double *)&v13 = 55.0;
    *(double *)&v9 = 110.0;
    v15 = 0.0;
  }

  v16 = *(double *)&v9;
  v17 = v11;
  v18 = *(double *)&v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_updateListEdgeInsetsForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[NCNotificationStructuredListViewController _overlayFooterViewEdgeInsetsForSize:](self, "_overlayFooterViewEdgeInsetsForSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NCNotificationStructuredListViewController _listViewContainer](self, "_listViewContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFooterInsets:", v5, v7, v9, v11);

  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVisibleRectBottomMarginForRollUnder:", v5 + 20.0);

}

- (NCNotificationListSupplementaryViewsContaining)testRecipeSupplementaryViewsContainer
{
  NCNotificationListSupplementaryViewsContaining *testRecipeSupplementaryViewsContainer;
  void *v4;

  testRecipeSupplementaryViewsContainer = self->_testRecipeSupplementaryViewsContainer;
  if (!testRecipeSupplementaryViewsContainer)
  {
    -[NCNotificationStructuredListViewController insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:](self, "insertSupplementaryViewsContainerAtListPosition:identifier:withDescription:", 0, CFSTR("prototype-section"), CFSTR("Test Recipe Supplementary Views Section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredListViewController setTestRecipeSupplementaryViewsContainer:](self, "setTestRecipeSupplementaryViewsContainer:", v4);

    testRecipeSupplementaryViewsContainer = self->_testRecipeSupplementaryViewsContainer;
  }
  return testRecipeSupplementaryViewsContainer;
}

- (NCNotificationStructuredListViewControllerDelegate)delegate
{
  return (NCNotificationStructuredListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (UIEdgeInsets)insetMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insetMargins.top;
  left = self->_insetMargins.left;
  bottom = self->_insetMargins.bottom;
  right = self->_insetMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (NCMaterialDisplayingCaptureOnlyViewController)captureOnlyMaterialViewController
{
  return self->_captureOnlyMaterialViewController;
}

- (void)setCaptureOnlyMaterialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_captureOnlyMaterialViewController, a3);
}

- (BOOL)showNotificationsInAlwaysOn
{
  return self->_showNotificationsInAlwaysOn;
}

- (void)setShowNotificationsInAlwaysOn:(BOOL)a3
{
  self->_showNotificationsInAlwaysOn = a3;
}

- (void)setListModel:(id)a3
{
  objc_storeStrong((id *)&self->_listModel, a3);
}

- (NCNotificationListViewProtocol)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (NCNotificationListTouchEaterManager)touchEaterManager
{
  return self->_touchEaterManager;
}

- (void)setTouchEaterManager:(id)a3
{
  objc_storeStrong((id *)&self->_touchEaterManager, a3);
}

- (NCNotificationManagementViewPresenter)managementViewPresenter
{
  return self->_managementViewPresenter;
}

- (void)setManagementViewPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_managementViewPresenter, a3);
}

- (NCNotificationOptionsMenu)optionsMenu
{
  return self->_optionsMenu;
}

- (void)setOptionsMenu:(id)a3
{
  objc_storeStrong((id *)&self->_optionsMenu, a3);
}

- (NCModeManager)modeManager
{
  return self->_modeManager;
}

- (void)setModeManager:(id)a3
{
  objc_storeStrong((id *)&self->_modeManager, a3);
}

- (NCModalNavigationController)modalNavigationController
{
  return self->_modalNavigationController;
}

- (void)setModalNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_modalNavigationController, a3);
}

- (BOOL)backgroundBlurred
{
  return self->_backgroundBlurred;
}

- (void)setBackgroundBlurred:(BOOL)a3
{
  self->_backgroundBlurred = a3;
}

- (NCNotificationRequest)notificationRequestRemovedWhilePresentingLongLook
{
  return self->_notificationRequestRemovedWhilePresentingLongLook;
}

- (void)setNotificationRequestRemovedWhilePresentingLongLook:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRequestRemovedWhilePresentingLongLook, a3);
}

- (NCNotificationViewController)notificationViewControllerPresentingLongLook
{
  return (NCNotificationViewController *)objc_loadWeakRetained((id *)&self->_notificationViewControllerPresentingLongLook);
}

- (void)setNotificationViewControllerPresentingLongLook:(id)a3
{
  objc_storeWeak((id *)&self->_notificationViewControllerPresentingLongLook, a3);
}

- (NCNotificationListSectionHeaderView)headerViewInForceTouchState
{
  return (NCNotificationListSectionHeaderView *)objc_loadWeakRetained((id *)&self->_headerViewInForceTouchState);
}

- (void)setHeaderViewInForceTouchState:(id)a3
{
  objc_storeWeak((id *)&self->_headerViewInForceTouchState, a3);
}

- (NCNotificationListCoalescingControlsHandler)coalescingControlsHandlerInForceTouchState
{
  return (NCNotificationListCoalescingControlsHandler *)objc_loadWeakRetained((id *)&self->_coalescingControlsHandlerInForceTouchState);
}

- (void)setCoalescingControlsHandlerInForceTouchState:(id)a3
{
  objc_storeWeak((id *)&self->_coalescingControlsHandlerInForceTouchState, a3);
}

- (NCNotificationListComponent)notificationListComponentPresentingOptionsMenu
{
  return (NCNotificationListComponent *)objc_loadWeakRetained((id *)&self->_notificationListComponentPresentingOptionsMenu);
}

- (void)setNotificationListComponentPresentingOptionsMenu:(id)a3
{
  objc_storeWeak((id *)&self->_notificationListComponentPresentingOptionsMenu, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (ATXDigestOnboardingSuggestionClient)digestOnboardingSuggestionClient
{
  return self->_digestOnboardingSuggestionClient;
}

- (void)setDigestOnboardingSuggestionClient:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionClient, a3);
}

- (ATXDigestOnboardingSuggestion)digestOnboardingSuggestion
{
  return self->_digestOnboardingSuggestion;
}

- (void)setDigestOnboardingSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestion, a3);
}

- (ATXDigestOnboardingSuggestionLogging)digestOnboardingSuggestionLogging
{
  return self->_digestOnboardingSuggestionLogging;
}

- (void)setDigestOnboardingSuggestionLogging:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionLogging, a3);
}

- (NSDate)digestOnboardingSuggestionPresentationTime
{
  return self->_digestOnboardingSuggestionPresentationTime;
}

- (void)setDigestOnboardingSuggestionPresentationTime:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionPresentationTime, a3);
}

- (NSArray)digestOnboardingLastBundleIdentifiersSelection
{
  return self->_digestOnboardingLastBundleIdentifiersSelection;
}

- (void)setDigestOnboardingLastBundleIdentifiersSelection:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingLastBundleIdentifiersSelection, a3);
}

- (NSArray)digestOnboardingLastScheduledDeliveryTimesSelection
{
  return self->_digestOnboardingLastScheduledDeliveryTimesSelection;
}

- (void)setDigestOnboardingLastScheduledDeliveryTimesSelection:(id)a3
{
  objc_storeStrong((id *)&self->_digestOnboardingLastScheduledDeliveryTimesSelection, a3);
}

- (NCNotificationListCountIndicatorViewController)countIndicatorViewController
{
  return self->_countIndicatorViewController;
}

- (void)setCountIndicatorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_countIndicatorViewController, a3);
}

- (void)setTestRecipeSupplementaryViewsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_testRecipeSupplementaryViewsContainer, a3);
}

- (NCInternalToolsOverlayView)internalToolsOverlayView
{
  return self->_internalToolsOverlayView;
}

- (void)setInternalToolsOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_internalToolsOverlayView, a3);
}

- (NSMutableDictionary)allNotificationRequests
{
  return self->_allNotificationRequests;
}

- (void)setAllNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_allNotificationRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNotificationRequests, 0);
  objc_storeStrong((id *)&self->_internalToolsOverlayView, 0);
  objc_storeStrong((id *)&self->_testRecipeSupplementaryViewsContainer, 0);
  objc_storeStrong((id *)&self->_countIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLastScheduledDeliveryTimesSelection, 0);
  objc_storeStrong((id *)&self->_digestOnboardingLastBundleIdentifiersSelection, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionPresentationTime, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionLogging, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestion, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_notificationListComponentPresentingOptionsMenu);
  objc_destroyWeak((id *)&self->_coalescingControlsHandlerInForceTouchState);
  objc_destroyWeak((id *)&self->_headerViewInForceTouchState);
  objc_destroyWeak((id *)&self->_notificationViewControllerPresentingLongLook);
  objc_storeStrong((id *)&self->_notificationRequestRemovedWhilePresentingLongLook, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
  objc_storeStrong((id *)&self->_modeManager, 0);
  objc_storeStrong((id *)&self->_optionsMenu, 0);
  objc_storeStrong((id *)&self->_managementViewPresenter, 0);
  objc_storeStrong((id *)&self->_touchEaterManager, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_listModel, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationRequestWithNotificationIdentifier:sectionIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expandGroupForNotificationRequest:withCompletion:", v7, v6);

}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NCNotificationStructuredListViewController listModel](self, "listModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collapseGroupForNotificationRequest:withCompletion:", v7, v6);

}

@end
