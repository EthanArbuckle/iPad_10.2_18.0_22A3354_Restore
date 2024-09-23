@implementation SAUILayoutSpecifyingElementViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SAUIRegisterSystemApertureLogging();
}

- (NSString)description
{
  uint64_t v3;
  int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = -[SAUILayoutSpecifyingElementViewController isViewLoaded](self, "isViewLoaded");
  if (v4)
  {
    -[SAUILayoutSpecifyingElementViewController view](self, "view");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("[view not loaded]");
  }
  SAUIStringFromElementViewLayoutMode(-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SAUIStringFromElementViewLayoutMode(-[SAUILayoutSpecifyingElementViewController preferredLayoutMode](self, "preferredLayoutMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "element");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x24958F5B4]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; view: %@; layoutMode: %@; preferredLayoutMode: %@; elementViewProvider: %@; element: %@>"),
    v3,
    self,
    v5,
    v6,
    v7,
    v8,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  return (NSString *)v12;
}

- (SAUILayoutSpecifyingElementViewController)initWithElementViewProvider:(id)a3
{
  id v6;
  SAUILayoutSpecifyingElementViewController *v7;
  SAUILayoutSpecifyingElementViewController *v8;
  id *p_elementViewProvider;
  void *v10;
  void *v11;
  uint64_t v12;
  NSHashTable *observers;
  void *v15;
  objc_super v16;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUILayoutSpecifyingElementViewController.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementViewProvider"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  v7 = -[SAUILayoutSpecifyingElementViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    p_elementViewProvider = (id *)&v7->_elementViewProvider;
    objc_storeStrong((id *)&v7->_elementViewProvider, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*p_elementViewProvider, "setLayoutHost:", v8);
    objc_msgSend(*p_elementViewProvider, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setElementHost:", v8);
    objc_msgSend(*p_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addBehaviorOverridingParticipant:", v8);

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v12;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SAUILayoutSpecifyingElementViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  -[SAUILayoutSpecifyingElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  -[SAUILayoutSpecifyingElementViewController _containerView](self, "_containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addSubview:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SAUILayoutSpecifyingElementViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUILayoutSpecifyingElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingWillAppear_, v4);
}

uint64_t __60__SAUILayoutSpecifyingElementViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingWillAppear:", *(_QWORD *)(a1 + 32));
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SAUILayoutSpecifyingElementViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUILayoutSpecifyingElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingDidAppear_, v4);
}

uint64_t __59__SAUILayoutSpecifyingElementViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingDidAppear:", *(_QWORD *)(a1 + 32));
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SAUILayoutSpecifyingElementViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUILayoutSpecifyingElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingWillDisappear_, v4);
}

uint64_t __63__SAUILayoutSpecifyingElementViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingWillDisappear:", *(_QWORD *)(a1 + 32));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SAUILayoutSpecifyingElementViewController_viewDidDisappear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUILayoutSpecifyingElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingDidDisappear_, v4);
}

uint64_t __62__SAUILayoutSpecifyingElementViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingDidDisappear:", *(_QWORD *)(a1 + 32));
}

- (void)viewWillLayoutSubviews
{
  SAElementViewProviding *elementViewProvider;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    elementViewProvider = self->_elementViewProvider;
    -[SAUILayoutSpecifyingElementViewController _contentView](self, "_contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementViewProviding layoutHostContainerViewWillLayoutSubviews:](elementViewProvider, "layoutHostContainerViewWillLayoutSubviews:", v4);

  }
  -[SAUILayoutSpecifyingElementViewController _configureTransitionShadowViewIfNecessary](self, "_configureTransitionShadowViewIfNecessary");
  -[SAUILayoutSpecifyingElementViewController _layoutTransitionShadowView](self, "_layoutTransitionShadowView");
}

- (void)viewDidLayoutSubviews
{
  SAElementViewProviding *elementViewProvider;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    elementViewProvider = self->_elementViewProvider;
    -[SAUILayoutSpecifyingElementViewController _contentView](self, "_contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementViewProviding layoutHostContainerViewDidLayoutSubviews:](elementViewProvider, "layoutHostContainerViewDidLayoutSubviews:", v4);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  SAElementViewProviding *elementViewProvider;
  void *v9;
  void *previousLayoutMode;
  _QWORD v11[4];
  id v12[2];
  id location;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SAUILayoutSpecifyingElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    elementViewProvider = self->_elementViewProvider;
    -[SAUILayoutSpecifyingElementViewController _contentView](self, "_contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementViewProviding contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](elementViewProvider, "contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:", v9, v7, width, height);

  }
  previousLayoutMode = (void *)self->_previousLayoutMode;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __96__SAUILayoutSpecifyingElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_25193CD00;
  objc_copyWeak(v12, &location);
  v12[1] = previousLayoutMode;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __96__SAUILayoutSpecifyingElementViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = WeakRetained;
  if (v3 == objc_msgSend(WeakRetained, "_previousLayoutMode"))
    objc_msgSend(v4, "_setPreviousLayoutMode:", objc_msgSend(v4, "layoutMode"));

}

- (BOOL)_canShowWhileLocked
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SAElementViewProviding _canShowWhileLocked](self->_elementViewProvider, "_canShowWhileLocked");
  else
    return 0;
}

- (id)alertWithReason:(id)a3 implicitlyDismissable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  SAUILayoutSpecifyingElementViewController *v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v4 = a4;
  v6 = a3;
  -[SAElementViewProviding element](self->_elementViewProvider, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SAHasActivityBehavior();

  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_alertingActivityAssertion);
    v11 = objc_opt_class();
    v12 = WeakRetained;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    if (!v14)
    {
      -[SAUILayoutSpecifyingElementViewController _alertingActivityAssertionWithReason:implicitlyDismissable:withPreferredLayoutMode:](v9, "_alertingActivityAssertionWithReason:implicitlyDismissable:withPreferredLayoutMode:", v6, v4, -[SAUILayoutSpecifyingElementViewController maximumSupportedLayoutMode](v9, "maximumSupportedLayoutMode"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v9);
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __83__SAUILayoutSpecifyingElementViewController_alertWithReason_implicitlyDismissable___block_invoke;
      v19 = &unk_25193CD28;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v14, "addInvalidationBlock:", &v16);
      objc_storeWeak((id *)&v9->_alertingActivityAssertion, v14);
      -[SAUILayoutSpecifyingElementViewController _invalidatePreferredLayoutModeAssertionWithReason:](v9, "_invalidatePreferredLayoutModeAssertionWithReason:", 2, v16, v17, v18, v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v9);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __83__SAUILayoutSpecifyingElementViewController_alertWithReason_implicitlyDismissable___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 131);

    if (v5 == v6)
    {
      objc_storeWeak(v4 + 131, 0);
      objc_msgSend(v4, "_invalidateElementPromotionPreferences");
    }
  }

}

- (int64_t)handleElementTap:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[SAElementViewProviding handleElementViewEvent:](self->_elementViewProvider, "handleElementViewEvent:", 0) & 1) != 0)
  {
    return 2;
  }
  else
  {
    return -[SAUILayoutSpecifyingElementViewController _expandToCustomLayoutModeFromUserActionIfPossible](self, "_expandToCustomLayoutModeFromUserActionIfPossible");
  }
}

- (int64_t)handleElementLongPress:(id)a3
{
  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode", a3) != 3
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return -[SAUILayoutSpecifyingElementViewController _expandToCustomLayoutModeFromUserActionIfPossible](self, "_expandToCustomLayoutModeFromUserActionIfPossible");
  }
  if (-[SAElementViewProviding handleElementViewEvent:](self->_elementViewProvider, "handleElementViewEvent:", 4))return 2;
  return 0;
}

- (BOOL)handleTap:(id)a3
{
  return -[SAUILayoutSpecifyingElementViewController handleElementTap:](self, "handleElementTap:", a3) != 0;
}

- (BOOL)handleLongPress:(id)a3
{
  return -[SAUILayoutSpecifyingElementViewController handleElementLongPress:](self, "handleElementLongPress:", a3) != 0;
}

- (void)addElementViewControllingObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](self->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeElementViewControllingObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)setLayoutHost:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if (WeakRetained != obj)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_storeWeak((id *)&self->_layoutHost, obj);
    -[SAUILayoutSpecifyingElementViewController _configureAlertAssertionIfNecessary](self, "_configureAlertAssertionIfNecessary");
    -[SAElementViewProviding element](self->_elementViewProvider, "element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (SAHasAlertBehavior())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setAlertHost:", self);
    }
    else if (SAHasActivityBehavior() && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "setActivityHost:", self);
    }

  }
}

- (int64_t)layoutMode
{
  void *v2;
  int64_t v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutMode");

  return v3;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v6;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayoutMode:reason:", a3, a4);

}

- (int64_t)minimumSupportedLayoutMode
{
  void *v2;
  int64_t v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumSupportedLayoutMode");

  return v3;
}

- (int64_t)maximumSupportedLayoutMode
{
  void *v2;
  int64_t v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumSupportedLayoutMode");

  return v3;
}

- (int64_t)preferredLayoutMode
{
  void *v2;
  int64_t v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredLayoutMode");

  return v3;
}

- (BOOL)isInteractiveDismissalEnabled
{
  void *v2;
  char v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractiveDismissalEnabled");

  return v3;
}

- (BOOL)isMinimalPresentationPossible
{
  void *v2;
  char v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMinimalPresentationPossible");

  return v3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSDirectionalEdgeInsets result;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v9 = a4.trailing;
  v10 = a4.bottom;
  v11 = a4.leading;
  v12 = a4.top;
  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", a3, v12, v11, v10, v9, top, leading, bottom, trailing);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.trailing = v26;
  result.bottom = v25;
  result.leading = v24;
  result.top = v23;
  return result;
}

- (BOOL)isRequestingMenuPresentation
{
  void *v2;
  char v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRequestingMenuPresentation");

  return v3;
}

- (int64_t)behaviorOverridingRole
{
  return 1;
}

- (int64_t)layoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  int64_t layoutMode;
  id v9;
  SAUILayoutModePreference *v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;

  layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    v9 = a5;
    -[SAUILayoutSpecifyingElementViewController _setPreviousLayoutMode:](self, "_setPreviousLayoutMode:", layoutMode);
    self->_layoutMode = a3;
    if (a4 == 3)
    {
      if (-[SAUIPreferredLayoutModeAssertion preferredLayoutMode](self->_preferredLayoutModeAssertion, "preferredLayoutMode") != a3|| -[SAUIPreferredLayoutModeAssertion layoutModeChangeReason](self->_preferredLayoutModeAssertion, "layoutModeChangeReason") != 3)
      {
        v10 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:]([SAUILayoutModePreference alloc], "initWithPreferredLayoutMode:reason:", a3, 3);
        v11 = -[SAUILayoutSpecifyingElementViewController _updatePreferredLayoutModeAssertionWithPreference:](self, "_updatePreferredLayoutModeAssertionWithPreference:", v10);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_alertingActivityAssertion);
      objc_msgSend(WeakRetained, "invalidateWithReason:", CFSTR("layout mode changed by user interaction"));

    }
    else if (a3 <= 0)
    {
      -[SAAssertion invalidateWithReason:](self->_preferredLayoutModeAssertion, "invalidateWithReason:", CFSTR("no longer in visible layout mode"));
    }
    objc_msgSend(v9, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_setLayoutMode_reason_forTargetWithOverrider_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLayoutMode:reason:forTargetWithOverrider:", self->_layoutMode, a4, v9);

    -[SAUILayoutSpecifyingElementViewController viewIfLoaded](self, "viewIfLoaded");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (int64_t)minimumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_minimumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "minimumSupportedLayoutModeForTargetWithOverrider:isDefaultValue:", v6, a4);

  if (a4 && *a4 || v8 == -1)
  {
    SATargetElementFromBehaviorOverrider();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SAHasActivityBehavior() & 1) != 0)
    {
      v8 = 1;
    }
    else if (SAHasAlertBehavior())
    {
      if (v8 == -1)
      {
        objc_msgSend(v6, "behaviorOverridingTarget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = objc_msgSend(v10, "preferredLayoutMode");
        else
          v8 = -1;

      }
      else
      {
        v8 = 2;
      }
    }

  }
  return v8;
}

- (int64_t)maximumSupportedLayoutModeForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_maximumSupportedLayoutModeForTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumSupportedLayoutModeForTargetWithOverrider:isDefaultValue:", v6, a4);

  return v8;
}

- (BOOL)isInteractiveDismissalEnabledForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_isInteractiveDismissalEnabledForTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInteractiveDismissalEnabledForTargetWithOverrider:isDefaultValue:", v6, a4);

  if (a4 && *a4)
  {
    objc_msgSend(v6, "behaviorOverridingTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SAHasActivityBehavior() & 1) != 0)
      LOBYTE(v8) = 0;
    else
      v8 |= SAHasAlertBehavior();

  }
  return v8;
}

- (BOOL)isMinimalPresentationPossibleForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v12;

  v6 = a3;
  objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_isMinimalPresentationPossibleForTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMinimalPresentationPossibleForTargetWithOverrider:isDefaultValue:", v6, a4);

  if (a4 && *a4)
  {
    objc_msgSend(v6, "behaviorOverridingTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SAHasActivityBehavior() & 1) != 0)
    {
      v8 = 0;
    }
    else if (SAHasAlertBehavior())
    {
      v12 = 1;
      -[SAUILayoutSpecifyingElementViewController layoutModePreferenceForTargetWithOverrider:isDefaultValue:](self, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", v6, &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "preferredLayoutMode") == 2;

    }
  }

  return v8;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSDirectionalEdgeInsets result;

  if (a3 < 1)
  {
    v28 = *MEMORY[0x24BDF65E8];
    v29 = *(double *)(MEMORY[0x24BDF65E8] + 8);
    v30 = *(double *)(MEMORY[0x24BDF65E8] + 16);
    v31 = *(double *)(MEMORY[0x24BDF65E8] + 24);
  }
  else
  {
    trailing = a5.trailing;
    bottom = a5.bottom;
    leading = a5.leading;
    top = a5.top;
    v12 = a4.trailing;
    v13 = a4.bottom;
    v14 = a4.leading;
    v15 = a4.top;
    v18 = a6;
    objc_msgSend(v18, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = SAUIDirectionEdgeInsetsComponentWiseMaximum(v21, v23, v25, v27, top);
  }
  result.trailing = v31;
  result.bottom = v30;
  result.leading = v29;
  result.top = v28;
  return result;
}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SAUILayoutModePreference *v10;
  id v11;

  v6 = a3;
  -[NSPointerArray sa_lastPointer](self->_preferredLayoutModeAssertions, "sa_lastPointer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && *a4)
    {
      v10 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:]([SAUILayoutModePreference alloc], "initWithPreferredLayoutMode:reason:", 2, 0);

      v9 = v10;
    }
    v11 = -[SAUILayoutSpecifyingElementViewController _updatePreferredLayoutModeAssertionWithPreference:](self, "_updatePreferredLayoutModeAssertionWithPreference:", v9);
    -[NSPointerArray sa_lastPointer](self->_preferredLayoutModeAssertions, "sa_lastPointer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)preferredLayoutModeAssertionForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v5;
  SAUILayoutSpecifyingElementViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[NSPointerArray sa_lastPointer](v6->_preferredLayoutModeAssertions, "sa_lastPointer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  return v7;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  SAUILayoutModePreference *v6;
  void *v7;
  id v8;

  v6 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:]([SAUILayoutModePreference alloc], "initWithPreferredLayoutMode:reason:", a3, a4);
  -[SAUILayoutSpecifyingElementViewController _updatePreferredLayoutModeAssertionWithPreference:](self, "_updatePreferredLayoutModeAssertionWithPreference:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  v9 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "concentricPaddingForProvidedView:fromViewProvider:", v6, v7);
    v9 = v10;
  }

  return v9;
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  double height;
  double width;
  SAElementViewProviding *elementViewProvider;
  void *v9;
  id v10;

  height = a3.height;
  width = a3.width;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    elementViewProvider = self->_elementViewProvider;
    -[SAUILayoutSpecifyingElementViewController _contentView](self, "_contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAElementViewProviding contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](elementViewProvider, "contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:", v9, v10, width, height);

  }
}

- (BOOL)isTrackingTransition
{
  SAUILayoutSpecifyingElementViewController *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_transitionIDsToReasons, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTrackingTransitionWithReason:(id)a3
{
  id v4;
  SAUILayoutSpecifyingElementViewController *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5->_transitionIDsToReasons;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](v5->_transitionIDsToReasons, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        v8 += v12;
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
    LOBYTE(v7) = v8 != 0;
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)beginTrackingTransitionWithUniqueIdentifier:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  SAUILayoutSpecifyingElementViewController *v13;
  NSMutableDictionary *transitionIDsToReasons;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUILayoutSpecifyingElementViewController.m"), 463, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionID"));

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUILayoutSpecifyingElementViewController.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  -[SAElementViewProviding element](self->_elementViewProvider, "element");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    MEMORY[0x24958F5B4](v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v12;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_247C5B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin tracking transition with identifier '%{public}@' with reason: %{public}@", buf, 0x20u);

  }
  v13 = self;
  objc_sync_enter(v13);
  transitionIDsToReasons = v13->_transitionIDsToReasons;
  if (!transitionIDsToReasons)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = v13->_transitionIDsToReasons;
    v13->_transitionIDsToReasons = v15;

    transitionIDsToReasons = v13->_transitionIDsToReasons;
  }
  -[NSMutableDictionary setObject:forKey:](transitionIDsToReasons, "setObject:forKey:", v8, v7);
  objc_sync_exit(v13);

}

- (void)endTrackingTransitionWithUniqueIdentifier:(id)a3
{
  id v4;
  SAUILayoutSpecifyingElementViewController *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *transitionIDsToReasons;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_transitionIDsToReasons, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SAElementViewProviding element](v5->_elementViewProvider, "element");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)SAUILogElementViewControlling;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        MEMORY[0x24958F5B4](v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = v9;
        v13 = 2114;
        v14 = v4;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_247C5B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: End tracking transition with identifier '%{public}@' with reason: %{public}@", (uint8_t *)&v11, 0x20u);

      }
      -[NSMutableDictionary removeObjectForKey:](v5->_transitionIDsToReasons, "removeObjectForKey:", v4);
      if (!-[NSMutableDictionary count](v5->_transitionIDsToReasons, "count"))
      {
        transitionIDsToReasons = v5->_transitionIDsToReasons;
        v5->_transitionIDsToReasons = 0;

      }
    }

    objc_sync_exit(v5);
  }

}

- (void)_axRequestDiminishment
{
  id WeakRetained;

  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode") >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "_axLayoutSpecifierRequestsDiminishment:", self);

  }
}

- (BOOL)_axCollapseIfExpandedByUserInteraction
{
  id WeakRetained;
  char v4;

  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode") < 1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "_axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:", self);
  else
    v4 = 0;

  return v4;
}

- (id)_elementHost
{
  return objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (BOOL)_expandToCustomLayoutModeFromUserActionIfPossible
{
  SAUILayoutModePreference *v3;
  uint64_t (**v4)(_QWORD);
  char v5;

  if ((unint64_t)(-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode") - 1) > 1
    || -[SAUILayoutSpecifyingElementViewController maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode") < 3)
  {
    return 0;
  }
  v3 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:]([SAUILayoutModePreference alloc], "initWithPreferredLayoutMode:reason:", 3, 3);
  -[SAUILayoutSpecifyingElementViewController _updatePreferredLayoutModeAssertionWithPreference:](self, "_updatePreferredLayoutModeAssertionWithPreference:", v3);
  v4 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4[2](v4);
  else
    v5 = 0;

  return v5;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *v6;
  void *v7;
  id v8;
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

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }

}

- (void)_layoutTransitionShadowView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUILayoutSpecifyingElementViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sensorRegionInContentView:fromViewProvider:", v3, v4);

  }
  -[UIImageView image](self->_contentsTransitionShadowView, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  BSRectWithSize();
  -[SAUILayoutSpecifyingElementViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v16 = v7;
  UIRectCenteredIntegralRectScale();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[UIImageView setFrame:](self->_contentsTransitionShadowView, "setFrame:", v9, v11, v13, v15, v16);
}

- (void)_configureTransitionShadowViewIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  UIImageView *contentsTransitionShadowView;
  void *v9;
  id WeakRetained;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(WeakRetained, "viewProviderShouldMakeSensorShadowVisible:", v3);

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView tintColor](self->_contentsTransitionShadowView, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if (v4 != v7)
  {
    -[UIImageView removeFromSuperview](self->_contentsTransitionShadowView, "removeFromSuperview");
    contentsTransitionShadowView = self->_contentsTransitionShadowView;
    self->_contentsTransitionShadowView = 0;

  }
  if (!self->_contentsTransitionShadowView)
  {
    v9 = (void *)MEMORY[0x24BDF6F90];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __86__SAUILayoutSpecifyingElementViewController__configureTransitionShadowViewIfNecessary__block_invoke;
    v12[3] = &unk_25193CD50;
    v12[4] = self;
    v14 = v4;
    v13 = v5;
    objc_msgSend(v9, "performWithoutAnimation:", v12);

  }
}

void __86__SAUILayoutSpecifyingElementViewController__configureTransitionShadowViewIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("elementContentTransitionShadow"), v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v4 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v4;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v10);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 968);
  *(_QWORD *)(v6 + 968) = v5;

  if (*(_BYTE *)(a1 + 48))
    v8 = *(_QWORD *)(a1 + 40);
  else
    v8 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setTintColor:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setContentMode:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(*(id *)(a1 + 32), "_layoutTransitionShadowView");

}

- (void)_setPreviousLayoutMode:(int64_t)a3
{
  self->_previousLayoutMode = a3;
}

- (id)_overrideWithPreference:(id)a3
{
  id v4;
  SAUILayoutSpecifyingElementViewController *v5;
  SAUIPreferredLayoutModeAssertion *v6;
  void *v7;
  SAUIPreferredLayoutModeAssertion *v8;
  NSPointerArray *preferredLayoutModeAssertions;
  uint64_t v10;
  NSPointerArray *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [SAUIPreferredLayoutModeAssertion alloc];
  -[SAElementViewProviding element](v5->_elementViewProvider, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAUIPreferredLayoutModeAssertion initWithRepresentedElement:layoutModePreference:](v6, "initWithRepresentedElement:layoutModePreference:", v7, v4);

  objc_initWeak(&location, v5);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __69__SAUILayoutSpecifyingElementViewController__overrideWithPreference___block_invoke;
  v21 = &unk_25193CD28;
  objc_copyWeak(&v22, &location);
  -[SAAssertion addInvalidationBlock:](v8, "addInvalidationBlock:", &v18);
  preferredLayoutModeAssertions = v5->_preferredLayoutModeAssertions;
  if (!preferredLayoutModeAssertions)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray", v18, v19, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5->_preferredLayoutModeAssertions;
    v5->_preferredLayoutModeAssertions = (NSPointerArray *)v10;

    preferredLayoutModeAssertions = v5->_preferredLayoutModeAssertions;
  }
  -[NSPointerArray sa_compact](preferredLayoutModeAssertions, "sa_compact", v18, v19, v20, v21);
  v12 = 0;
  do
  {
    v13 = v12;
    if (v12 >= -[NSPointerArray count](v5->_preferredLayoutModeAssertions, "count"))
      break;
    -[NSPointerArray pointerAtIndex:](v5->_preferredLayoutModeAssertions, "pointerAtIndex:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "layoutModeChangeReason");
    v16 = -[SAUIPreferredLayoutModeAssertion layoutModeChangeReason](v8, "layoutModeChangeReason");
    ++v12;

  }
  while (v15 <= v16);
  -[NSPointerArray insertPointer:atIndex:](v5->_preferredLayoutModeAssertions, "insertPointer:atIndex:", v8, v13);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

  return v8;
}

void __69__SAUILayoutSpecifyingElementViewController__overrideWithPreference___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[123], "count"))
    {
      v5 = 0;
      while ((id)objc_msgSend(v4[123], "pointerAtIndex:", v5) != v8)
      {
        if (++v5 >= (unint64_t)objc_msgSend(v4[123], "count"))
          goto LABEL_9;
      }
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4[123], "removePointerAtIndex:", v5);
    }
LABEL_9:
    v6 = objc_msgSend(v4, "layoutMode");
    if (v6 != objc_msgSend(v4, "preferredLayoutMode"))
    {
      v7 = objc_loadWeakRetained(v4 + 134);
      objc_msgSend(v7, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", v4);

    }
  }

}

- (id)_updatePreferredLayoutModeAssertionWithPreference:(id)a3
{
  SAAutomaticallyInvalidatingAssertion *v4;
  NSObject *v5;
  SAUILayoutSpecifyingElementViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SAUIPreferredLayoutModeAssertion *preferredLayoutModeAssertion;
  SAUIPreferredLayoutModeAssertion *v14;
  NSObject *v15;
  SAAutomaticallyInvalidatingAssertion *cooldownAssertion;
  NSObject *v17;
  SAAutomaticallyInvalidatingAssertion *v18;
  SAAutomaticallyInvalidatingAssertion *v19;
  uint64_t v20;
  SAAutomaticallyInvalidatingAssertion *v21;
  SAAutomaticallyInvalidatingAssertion *v22;
  NSObject *v23;
  SAAutomaticallyInvalidatingAssertion *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  _QWORD v34[4];
  SAAutomaticallyInvalidatingAssertion *v35;
  id v36;
  uint8_t buf[4];
  SAAutomaticallyInvalidatingAssertion *v38;
  __int16 v39;
  SAAutomaticallyInvalidatingAssertion *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = (SAAutomaticallyInvalidatingAssertion *)a3;
  v5 = SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v4;
    _os_log_impl(&dword_247C5B000, v5, OS_LOG_TYPE_DEFAULT, "Update preferred layout mode assertion with layout mode preference: %{public}@", buf, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[SAAutomaticallyInvalidatingAssertion preferredLayoutMode](v4, "preferredLayoutMode");
  if (-[SAUILayoutSpecifyingElementViewController minimumSupportedLayoutMode](v6, "minimumSupportedLayoutMode") > v7)
  {
    if (!v7)
      goto LABEL_9;
LABEL_8:
    v9 = 0;
    goto LABEL_25;
  }
  v8 = -[SAUILayoutSpecifyingElementViewController maximumSupportedLayoutMode](v6, "maximumSupportedLayoutMode");
  if (v7 && v7 > v8)
    goto LABEL_8;
LABEL_9:
  v10 = -[SAAutomaticallyInvalidatingAssertion layoutModeChangeReason](v4, "layoutModeChangeReason");
  v11 = MEMORY[0x24BDAC760];
  if (v10 <= 4 && ((1 << v10) & 0x1A) != 0 || !v6->_cooldownAssertion)
  {
    -[SAUILayoutSpecifyingElementViewController _overrideWithPreference:](v6, "_overrideWithPreference:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    preferredLayoutModeAssertion = v6->_preferredLayoutModeAssertion;
    v6->_preferredLayoutModeAssertion = (SAUIPreferredLayoutModeAssertion *)v12;

    objc_initWeak(&location, v6);
    v14 = v6->_preferredLayoutModeAssertion;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_2;
    v31[3] = &unk_25193CD28;
    objc_copyWeak(&v32, &location);
    -[SAAssertion addInvalidationBlock:](v14, "addInvalidationBlock:", v31);
    if (-[SAUIPreferredLayoutModeAssertion layoutModeChangeReason](v6->_preferredLayoutModeAssertion, "layoutModeChangeReason") == 3)
    {
      if (v6->_cooldownAssertion)
      {
        v15 = SAUILogElementViewControlling;
        if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
        {
          cooldownAssertion = v6->_cooldownAssertion;
          *(_DWORD *)buf = 138543362;
          v38 = cooldownAssertion;
          _os_log_impl(&dword_247C5B000, v15, OS_LOG_TYPE_DEFAULT, "Resetting automatic invalidation timer of existing cooldown assertion: %{public}@", buf, 0xCu);
        }
        -[SAAutomaticallyInvalidatingAssertion resetAutomaticInvalidationTimer](v6->_cooldownAssertion, "resetAutomaticInvalidationTimer");
      }
      else
      {
        v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEB3688]), "initWithInvalidationInterval:", 3.0);
        v21 = v6->_cooldownAssertion;
        v6->_cooldownAssertion = (SAAutomaticallyInvalidatingAssertion *)v20;

        v22 = v6->_cooldownAssertion;
        v29[0] = v11;
        v29[1] = 3221225472;
        v29[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_109;
        v29[3] = &unk_25193CD28;
        objc_copyWeak(&v30, &location);
        -[SAAutomaticallyInvalidatingAssertion addInvalidationBlock:](v22, "addInvalidationBlock:", v29);
        -[SAAutomaticallyInvalidatingAssertion setAutomaticallyInvalidatable:](v6->_cooldownAssertion, "setAutomaticallyInvalidatable:", 1);
        v23 = SAUILogElementViewControlling;
        if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v6->_cooldownAssertion;
          *(_DWORD *)buf = 138543618;
          v38 = v24;
          v39 = 2114;
          v40 = v4;
          _os_log_impl(&dword_247C5B000, v23, OS_LOG_TYPE_DEFAULT, "Created cooldown assertion (%{public}@) for layout mode preference: %{public}@", buf, 0x16u);
        }
        objc_destroyWeak(&v30);
      }
    }
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v6->_cooldownAssertion;
      *(_DWORD *)buf = 138543362;
      v38 = v18;
      _os_log_impl(&dword_247C5B000, v17, OS_LOG_TYPE_DEFAULT, "Deferring preferred layout mode assertion update due to existing cooldown assertion: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v6);
    v19 = v6->_cooldownAssertion;
    v34[0] = v11;
    v34[1] = 3221225472;
    v34[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke;
    v34[3] = &unk_25193CD78;
    objc_copyWeak(&v36, (id *)buf);
    v35 = v4;
    -[SAAutomaticallyInvalidatingAssertion addInvalidationBlock:](v19, "addInvalidationBlock:", v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
  objc_initWeak((id *)buf, v6);
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_110;
  v27[3] = &unk_25193CDA0;
  objc_copyWeak(&v28, (id *)buf);
  v27[4] = v6;
  v9 = (void *)MEMORY[0x24958F7F4](v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
LABEL_25:
  v25 = (void *)MEMORY[0x24958F7F4](v9);

  objc_sync_exit(v6);
  return v25;
}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (id)objc_msgSend(WeakRetained, "_updatePreferredLayoutModeAssertionWithPreference:", *(_QWORD *)(a1 + 32));

}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 124) == v5)
  {
    *((_QWORD *)WeakRetained + 124) = 0;

  }
}

void __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_109(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 126) == v5)
  {
    *((_QWORD *)WeakRetained + 126) = 0;

  }
}

uint64_t __95__SAUILayoutSpecifyingElementViewController__updatePreferredLayoutModeAssertionWithPreference___block_invoke_110(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (v4 = objc_msgSend(WeakRetained, "layoutMode"), v4 != objc_msgSend(v3, "preferredLayoutMode")))
  {
    v6 = objc_loadWeakRetained(v3 + 134);
    objc_msgSend(v6, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", *(_QWORD *)(a1 + 32));

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_defaultAlertingDuration
{
  id WeakRetained;
  double v5;
  double v6;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(WeakRetained, "alertingDurationForHost:", self);
  v6 = v5;

  return v6;
}

- (id)_alertingActivityAssertionWithReason:(id)a3 implicitlyDismissable:(BOOL)a4 withPreferredLayoutMode:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  SAUILayoutSpecifyingElementViewController *v10;
  SAUIAlertingAssertion *v11;
  SAUILayoutModePreference *v12;
  uint64_t v13;
  SAUILayoutModePreference *v14;
  void *v15;
  SAUIAlertingAssertion *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSMapTable *reasonsToAlertingActivityAssertions;
  uint64_t v21;
  NSMapTable *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  SAUIAlertingAssertion *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[SAElementViewProviding element](self->_elementViewProvider, "element");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SAHasActivityBehavior())
  {
    v10 = self;
    objc_sync_enter(v10);
    -[NSMapTable objectForKey:](v10->_reasonsToAlertingActivityAssertions, "objectForKey:", v8);
    v11 = (SAUIAlertingAssertion *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = [SAUILayoutModePreference alloc];
      if (v6)
        v13 = 5;
      else
        v13 = 2;
      v14 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:](v12, "initWithPreferredLayoutMode:reason:", a5, v13);
      -[SAUILayoutSpecifyingElementViewController _overrideWithPreference:](v10, "_overrideWithPreference:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = [SAUIAlertingAssertion alloc];
      -[SAUILayoutSpecifyingElementViewController _defaultAlertingDuration](v10, "_defaultAlertingDuration");
      v11 = -[SAUIAlertingAssertion initWithPreferredLayoutModeAssertion:invalidationInterval:](v16, "initWithPreferredLayoutModeAssertion:invalidationInterval:", v15);
      v17 = (id)SAUILogElementViewControlling;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        MEMORY[0x24958F5B4](v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v11;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v18;
        _os_log_impl(&dword_247C5B000, v17, OS_LOG_TYPE_DEFAULT, "Created alerting activity assertion (%{public}@) with reason '%{public}@' for element: %{public}@", buf, 0x20u);

      }
      objc_initWeak((id *)buf, v10);
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __128__SAUILayoutSpecifyingElementViewController__alertingActivityAssertionWithReason_implicitlyDismissable_withPreferredLayoutMode___block_invoke;
      v27 = &unk_25193CD78;
      objc_copyWeak(&v29, (id *)buf);
      v19 = v8;
      v28 = v19;
      -[SAAssertion addInvalidationBlock:](v11, "addInvalidationBlock:", &v24);
      reasonsToAlertingActivityAssertions = v10->_reasonsToAlertingActivityAssertions;
      if (!reasonsToAlertingActivityAssertions)
      {
        objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable", v24, v25, v26, v27);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v10->_reasonsToAlertingActivityAssertions;
        v10->_reasonsToAlertingActivityAssertions = (NSMapTable *)v21;

        reasonsToAlertingActivityAssertions = v10->_reasonsToAlertingActivityAssertions;
      }
      -[NSMapTable setObject:forKey:](reasonsToAlertingActivityAssertions, "setObject:forKey:", v11, v19, v24, v25, v26, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
    objc_sync_exit(v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __128__SAUILayoutSpecifyingElementViewController__alertingActivityAssertionWithReason_implicitlyDismissable_withPreferredLayoutMode___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[125], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_configureAlertAssertionIfNecessary
{
  void *v3;
  id WeakRetained;
  SAUILayoutSpecifyingElementViewController *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  SAAutomaticallyInvalidatable *alertAssertion;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SAElementViewProviding element](self->_elementViewProvider, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SAHasAlertBehavior())
  {
    if (!self->_alertAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);

      if (WeakRetained)
      {
        v5 = self;
        objc_sync_enter(v5);
        v6 = objc_alloc(MEMORY[0x24BEB3688]);
        -[SAUILayoutSpecifyingElementViewController _defaultAlertingDuration](v5, "_defaultAlertingDuration");
        v7 = (void *)objc_msgSend(v6, "initWithInvalidationInterval:");
        v8 = (id)SAUILogElementViewControlling;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          MEMORY[0x24958F5B4](v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v14 = v7;
          v15 = 2114;
          v16 = v9;
          _os_log_impl(&dword_247C5B000, v8, OS_LOG_TYPE_DEFAULT, "Created alert assertion (%{public}@) for element: %{public}@", buf, 0x16u);

        }
        objc_initWeak((id *)buf, v5);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __80__SAUILayoutSpecifyingElementViewController__configureAlertAssertionIfNecessary__block_invoke;
        v11[3] = &unk_25193CD28;
        objc_copyWeak(&v12, (id *)buf);
        objc_msgSend(v7, "addInvalidationBlock:", v11);
        alertAssertion = self->_alertAssertion;
        self->_alertAssertion = (SAAutomaticallyInvalidatable *)v7;

        objc_destroyWeak(&v12);
        objc_destroyWeak((id *)buf);
        objc_sync_exit(v5);

      }
    }
  }

}

void __80__SAUILayoutSpecifyingElementViewController__configureAlertAssertionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 132) == v5)
  {
    *((_QWORD *)WeakRetained + 132) = 0;

  }
}

- (void)_invalidatePreferredLayoutModeAssertionWithReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  SAAutomaticallyInvalidatingAssertion *v7;
  SAUILayoutSpecifyingElementViewController *v8;
  SAUIPreferredLayoutModeAssertion *preferredLayoutModeAssertion;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  SAAutomaticallyInvalidatingAssertion *cooldownAssertion;
  SAAutomaticallyInvalidatingAssertion *v14;
  _QWORD v15[4];
  id v16[2];
  uint8_t buf[4];
  SAAutomaticallyInvalidatingAssertion *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)SAUILogElementViewControlling;
  if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    SAUIStringFromLayoutModeChangeReason(a3);
    v7 = (SAAutomaticallyInvalidatingAssertion *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl(&dword_247C5B000, v6, OS_LOG_TYPE_DEFAULT, "Invalidate preferred layout mode assertion with reason: %{public}@", buf, 0xCu);

  }
  v8 = self;
  objc_sync_enter(v8);
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x1A) != 0 || !v8->_cooldownAssertion)
  {
    preferredLayoutModeAssertion = v8->_preferredLayoutModeAssertion;
    SAUIStringFromLayoutModeChangeReason(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAAssertion invalidateWithReason:](preferredLayoutModeAssertion, "invalidateWithReason:", v10);

    WeakRetained = objc_loadWeakRetained((id *)&v8->_layoutHost);
    objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", v8);

  }
  else
  {
    v12 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      cooldownAssertion = v8->_cooldownAssertion;
      *(_DWORD *)buf = 138543362;
      v18 = cooldownAssertion;
      _os_log_impl(&dword_247C5B000, v12, OS_LOG_TYPE_DEFAULT, "Deferring preferred layout mode assertion invalidation due to existing cooldown assertion: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v8);
    v14 = v8->_cooldownAssertion;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __95__SAUILayoutSpecifyingElementViewController__invalidatePreferredLayoutModeAssertionWithReason___block_invoke;
    v15[3] = &unk_25193CDC8;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a3;
    -[SAAutomaticallyInvalidatingAssertion addInvalidationBlock:](v14, "addInvalidationBlock:", v15);
    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v8);

}

void __95__SAUILayoutSpecifyingElementViewController__invalidatePreferredLayoutModeAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidatePreferredLayoutModeAssertionWithReason:", *(_QWORD *)(a1 + 40));

}

- (void)_invalidateElementPromotionPreferences
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "preferredPromotionDidInvalidateForLayoutSpecifier:", self);

}

- (SAAutomaticallyInvalidatable)alertingActivityAssertion
{
  return (SAAutomaticallyInvalidatable *)objc_loadWeakRetained((id *)&self->_alertingActivityAssertion);
}

- (SAAutomaticallyInvalidatable)alertAssertion
{
  return self->_alertAssertion;
}

- (SAElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
  objc_storeStrong((id *)&self->_alertAssertion, 0);
  objc_destroyWeak((id *)&self->_alertingActivityAssertion);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cooldownAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToAlertingActivityAssertions, 0);
  objc_storeStrong((id *)&self->_preferredLayoutModeAssertion, 0);
  objc_storeStrong((id *)&self->_preferredLayoutModeAssertions, 0);
  objc_storeStrong((id *)&self->_transitionIDsToReasons, 0);
  objc_storeStrong((id *)&self->_contentsTransitionShadowView, 0);
}

- (UIView)_containerView
{
  return 0;
}

- (UIView)_contentView
{
  return 0;
}

- (BOOL)_isObstructedBySensorRegion
{
  id WeakRetained;
  void *v4;
  void *v5;
  _BOOL4 v6;
  CGRect v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sensorRegionObstructingViewProvider:inContentView:", v4, v5);
    v6 = !CGRectIsEmpty(v8);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGSize)_obstructedRegionSize
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SAUILayoutSpecifyingElementViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAUILayoutSpecifyingElementViewController elementViewProvider](self, "elementViewProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sensorRegionInContentView:fromViewProvider:", v4, v5);
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)_previousLayoutMode
{
  return self->_previousLayoutMode;
}

- (BOOL)_isNotInCustomLayoutOrTransitionFromCustomLayout
{
  return self->_previousLayoutMode <= 2
      && -[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode") < 3;
}

- (void)_setBlurProgress:(double)a3 forView:(id)a4
{
  objc_msgSend(a4, "setSauiBlurRadius:", 16.666 * a3);
}

- (void)_insertSnapshotView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAUILayoutSpecifyingElementViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:belowSubview:", v4, self->_contentsTransitionShadowView);

}

- (void)elementRequestsNegativeResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SAUILayoutSpecifyingElementViewController _elementHost](self, "_elementHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "elementRequestsNegativeResponse:", v5);

}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SAUILayoutSpecifyingElementViewController _elementHost](self, "_elementHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "elementRequestsSignificantUpdateTransition:", v5);

}

- (NSArray)temporallyOrderedAlertingActivityAssertions
{
  id v3;
  SAUILayoutSpecifyingElementViewController *v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_reasonsToAlertingActivityAssertions;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](v4->_reasonsToAlertingActivityAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_0);
  objc_sync_exit(v4);

  return (NSArray *)v3;
}

uint64_t __105__SAUILayoutSpecifyingElementViewController_SubclassSupport__temporallyOrderedAlertingActivityAssertions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  if (v7 > 0.0)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SAUILayoutSpecifyingElementViewController systemManagedAlertingActivityAssertionWithReason:preferredLayoutMode:](self, "systemManagedAlertingActivityAssertionWithReason:preferredLayoutMode:", v4, -[SAUILayoutSpecifyingElementViewController maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)systemManagedAlertingActivityAssertionWithReason:(id)a3 preferredLayoutMode:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v6 = a3;
  -[SAUILayoutSpecifyingElementViewController _alertingActivityAssertionWithReason:implicitlyDismissable:withPreferredLayoutMode:](self, "_alertingActivityAssertionWithReason:implicitlyDismissable:withPreferredLayoutMode:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __131__SAUILayoutSpecifyingElementViewController_SubclassSupport__systemManagedAlertingActivityAssertionWithReason_preferredLayoutMode___block_invoke;
  v12 = &unk_25193CD28;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "addInvalidationBlock:", &v9);
  -[SAUILayoutSpecifyingElementViewController _invalidatePreferredLayoutModeAssertionWithReason:](self, "_invalidatePreferredLayoutModeAssertionWithReason:", 4, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __131__SAUILayoutSpecifyingElementViewController_SubclassSupport__systemManagedAlertingActivityAssertionWithReason_preferredLayoutMode___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateElementPromotionPreferences");
    WeakRetained = v2;
  }

}

- (SAUILayoutModePreferring)layoutModePreference
{
  void *v2;
  void *v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutModePreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAUILayoutModePreferring *)v3;
}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  void *v2;
  void *v3;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLayoutModeAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAUIPreferredLayoutModeAssertion *)v3;
}

- (void)setPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  id v6;

  -[SAElementViewProviding systemApertureLayoutSpecifyingOverrider](self->_elementViewProvider, "systemApertureLayoutSpecifyingOverrider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredLayoutMode:reason:", a3, a4);

}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  id WeakRetained;

  -[SAUILayoutSpecifyingElementViewController _invalidatePreferredLayoutModeAssertionWithReason:](self, "_invalidatePreferredLayoutModeAssertionWithReason:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  id WeakRetained;

  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode", a3) >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  id WeakRetained;

  if (-[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode", a3) >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "menuPresentationRequestDidChangeForLayoutSpecifier:", self);

  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
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
  double v16;
  double v17;
  NSDirectionalEdgeInsets result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "edgeOutsetsForSize:", width, height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "preferredPromotionDidInvalidateForLayoutSpecifier:", v5);

}

- (double)sensorObscuringShadowProgress
{
  return self->_sensorObscuringShadowProgress;
}

- (void)setSensorObscuringShadowProgress:(double)a3
{
  double v3;
  _QWORD v4[6];

  if (self->_sensorObscuringShadowProgress != a3)
  {
    self->_sensorObscuringShadowProgress = a3;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __95__SAUILayoutSpecifyingElementViewController_SubclassSupport__setSensorObscuringShadowProgress___block_invoke;
    v4[3] = &unk_25193CE30;
    v4[4] = self;
    *(double *)&v4[5] = a3;
    LODWORD(a3) = *MEMORY[0x24BDE5430];
    LODWORD(v3) = *(_DWORD *)(MEMORY[0x24BDE5430] + 8);
    objc_msgSend(MEMORY[0x24BDF6F90], "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v4, a3, COERCE_DOUBLE((unint64_t)*(_DWORD *)(MEMORY[0x24BDE5430] + 4)), v3);
  }
}

uint64_t __95__SAUILayoutSpecifyingElementViewController_SubclassSupport__setSensorObscuringShadowProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", *(double *)(a1 + 40));
}

@end
