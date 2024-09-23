@implementation OBWelcomeController

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id v7;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[OBWelcomeController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:animated:", v4, x, y);

}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v9;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[OBWelcomeController scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollRectToVisible:animated:", v4, x, y, width, height);

}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:image:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:image:tintColor:linkButton:", a3, a4, a5, 0, 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 linkButton:(id)a6
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:image:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:image:tintColor:linkButton:", a3, a4, a5, 0, a6);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:image:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:image:tintColor:linkButton:", a3, a4, a5, a6, 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") != 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Bulleted lists can only be positioned below the header, normal width."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[OBWelcomeController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[OBWelcomeController setupBulletedListIfNeeded](self, "setupBulletedListIfNeeded");
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addItemWithTitle:description:image:tintColor:linkButton:", v18, v12, v13, v14, v15);

}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:", a3, a4, a5, 0, 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 linkButton:(id)a6
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:", a3, a4, a5, 0, a6);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
  -[OBWelcomeController addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:](self, "addBulletedListItemWithTitle:description:symbolName:tintColor:linkButton:", a3, a4, a5, a6, 0);
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") != 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Bulleted lists can only be positioned below the header, normal width."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[OBWelcomeController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[OBWelcomeController setupBulletedListIfNeeded](self, "setupBulletedListIfNeeded");
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addItemWithTitle:description:symbolName:tintColor:linkButton:", v18, v12, v13, v14, v15);

}

- (void)_animatePushTransitionForViews:(id)a3 transitionSubtype:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v8);

  objc_msgSend(v7, "setDuration:", 0.2);
  objc_msgSend(v7, "setType:", CFSTR("push"));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  v11 = CFSTR("fromRight");
  if (v10 == 1)
    v11 = CFSTR("fromLeft");
  if (!v6)
    v6 = (__CFString *)v11;
  objc_msgSend(v7, "setSubtype:", v6);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    v16 = *MEMORY[0x1E0CD3168];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v18, "layer", (_QWORD)v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeAllAnimations");

        objc_msgSend(v18, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAnimation:forKey:", v7, v16);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  return -[OBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](self, "initWithTitle:detailText:symbolName:contentLayout:", a3, a4, a5, 2);
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  return -[OBWelcomeController initWithTitle:detailText:icon:contentLayout:](self, "initWithTitle:detailText:icon:contentLayout:", a3, a4, a5, 2);
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  OBWelcomeController *v13;
  OBHeaderView *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBWelcomeController;
  v13 = -[OBWelcomeController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v13)
  {
    v14 = -[OBHeaderView initWithTitle:detailText:symbolName:]([OBHeaderView alloc], "initWithTitle:detailText:symbolName:", v10, v11, v12);
    -[OBWelcomeController setHeaderView:](v13, "setHeaderView:", v14);

    -[OBWelcomeController headerView](v13, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBWelcomeController _commonInitWithContentLayout:](v13, "_commonInitWithContentLayout:", a6);
  }

  return v13;
}

- (OBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  OBWelcomeController *v13;
  OBHeaderView *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBWelcomeController;
  v13 = -[OBWelcomeController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v13)
  {
    v14 = -[OBHeaderView initWithTitle:detailText:icon:]([OBHeaderView alloc], "initWithTitle:detailText:icon:", v10, v11, v12);
    -[OBWelcomeController setHeaderView:](v13, "setHeaderView:", v14);

    -[OBWelcomeController headerView](v13, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBWelcomeController _commonInitWithContentLayout:](v13, "_commonInitWithContentLayout:", a6);
  }

  return v13;
}

- (void)_commonInitWithContentLayout:(int64_t)a3
{
  OBButtonTray *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  OBButtonTray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  OBContentView *v16;
  void *v17;
  OBContentView *v18;
  UIView *secondaryContentView;

  self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen = 1;
  v5 = [OBButtonTray alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[OBButtonTray initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  -[OBWelcomeController setButtonTray:](self, "setButtonTray:", v10);

  -[OBWelcomeController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParentViewController:", self);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
  -[OBWelcomeController setButtonTrayScrollContainerView:](self, "setButtonTrayScrollContainerView:", v13);

  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = a3 == 4 || a3 == 1;
  v16 = -[OBContentView initWithFrame:aboveHeaderLayout:]([OBContentView alloc], "initWithFrame:aboveHeaderLayout:", v15, v6, v7, v8, v9);
  -[OBWelcomeController setContentView:](self, "setContentView:", v16);

  -[OBWelcomeController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (a3 == 4)
  {
    v18 = -[OBContentView initWithFrame:]([OBContentView alloc], "initWithFrame:", v6, v7, v8, v9);
    secondaryContentView = self->_secondaryContentView;
    self->_secondaryContentView = &v18->super;

  }
  -[OBWelcomeController setContentViewLayout:](self, "setContentViewLayout:", a3);
  -[OBWelcomeController setIncludePaddingAboveContentView:](self, "setIncludePaddingAboveContentView:", 1);
}

- (id)setupHeaderViewIfNeeded:(id)a3 detailedText:(id)a4 icon:(id)a5
{
  OBHeaderView *headerView;
  id v9;
  id v10;
  id v11;
  OBHeaderView *v12;
  OBHeaderView *v13;

  headerView = self->_headerView;
  if (!headerView)
  {
    v9 = a5;
    v10 = a4;
    v11 = a3;
    v12 = -[OBHeaderView initWithTitle:detailText:icon:]([OBHeaderView alloc], "initWithTitle:detailText:icon:", v11, v10, v9);

    v13 = self->_headerView;
    self->_headerView = v12;

    -[OBHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  -[OBBaseWelcomeController loadView](&v3, sel_loadView);
  -[OBWelcomeController _setupScrollView](self, "_setupScrollView");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[OBWelcomeController _appearState](self, "_appearState") != 3)
  {
    if (-[OBWelcomeController _appearState](self, "_appearState"))
    {
      -[OBWelcomeController _inlineButtonTrayIfNeeded](self, "_inlineButtonTrayIfNeeded");
      -[OBWelcomeController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
      -[OBWelcomeController _updateHeaderTopOffsetConstraint](self, "_updateHeaderTopOffsetConstraint");
      -[OBWelcomeController _updateButtonTrayBackdrop](self, "_updateButtonTrayBackdrop");
      -[OBWelcomeController _updateScrollViewInsets](self, "_updateScrollViewInsets");
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OBWelcomeController;
  -[OBWelcomeController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  -[OBWelcomeController _registerForKeyboardNotifications](self, "_registerForKeyboardNotifications");
  -[OBWelcomeController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController setRetainedNavigationController:](self, "setRetainedNavigationController:", v4);

  -[OBWelcomeController cachedBarState](self, "cachedBarState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[OBWelcomeController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBNavigationBarDisplayState displayStateForNavigationBar:](OBNavigationBarDisplayState, "displayStateForNavigationBar:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController setCachedBarState:](self, "setCachedBarState:", v8);

  }
  -[OBWelcomeController updateDirectionalLayoutMargins](self, "updateDirectionalLayoutMargins");
  -[OBWelcomeController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsUpdateConstraints");

  -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
  if (+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout"))
  {
    -[OBWelcomeController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
  if (-[OBWelcomeController disableButtonsUntilAllContentWasVisable](self, "disableButtonsUntilAllContentWasVisable"))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buttons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_6);

  }
}

uint64_t __38__OBWelcomeController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OBWelcomeController;
  -[OBBaseWelcomeController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  if (-[OBWelcomeController _scrollViewContentIsUnderTray](self, "_scrollViewContentIsUnderTray"))
  {
    -[OBWelcomeController scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flashScrollIndicators");

  }
  -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
  v6 = v5;
  -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  -[OBWelcomeController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _enableTrayButtonsForScrollToBottom:](self, "_enableTrayButtonsForScrollToBottom:", v8);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  -[OBWelcomeController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[OBWelcomeController _unregisterForKeyboardNotifications](self, "_unregisterForKeyboardNotifications");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  -[OBWelcomeController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBWelcomeController restoreNavigationBarAppearance](self, "restoreNavigationBarAppearance");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
    return 6;
  v6.receiver = self;
  v6.super_class = (Class)OBWelcomeController;
  return -[OBWelcomeController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBWelcomeController;
  -[OBWelcomeController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") == 1
    || -[OBWelcomeController contentViewLayout](self, "contentViewLayout") == 4)
  {
    -[OBWelcomeController _contentViewHeight](self, "_contentViewHeight");
    v5 = v4;
    -[OBWelcomeController contentViewHeightConstraint](self, "contentViewHeightConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", v5);

  }
  -[OBWelcomeController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[10];
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)OBWelcomeController;
  v7 = a4;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[OBWelcomeController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", v8);

  -[OBWelcomeController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v19[3] = &unk_1E37AAEC8;
  v19[4] = self;
  v19[5] = v9;
  v19[6] = v12;
  v19[7] = v14;
  v19[8] = v16;
  v19[9] = v18;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v19);

}

void __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
  CGRect v20;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "updateDirectionalLayoutMargins");
  if (objc_msgSend(*v2, "contentViewLayout") == 1 || objc_msgSend(*v2, "contentViewLayout") == 4)
  {
    objc_msgSend(*v2, "_contentViewHeight");
    v4 = v3;
    objc_msgSend(*v2, "contentViewHeightConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*v2, "contentViewsTopPaddingFromBottomOfHeader");
    v4 = v6;
    objc_msgSend(*v2, "contentViewTopOffsetConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "setConstant:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", v8);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10 != v9 && ((unint64_t)(v10 - 3) < 2 || (unint64_t)(v9 - 3) <= 1))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1 && objc_msgSend(*v2, "contentViewLayout") != 2)
    {
      _OBLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_cold_1(v2, v13);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v20.origin.x = v15;
  v20.origin.y = v16;
  v20.size.width = v17;
  v20.size.height = v18;
  v19 = CGRectEqualToRect(*(CGRect *)(a1 + 48), v20);

  if (!v19)
    objc_msgSend(*v2, "_layoutButtonTray");
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
  -[OBWelcomeController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
}

- (void)setScrollingDisabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  if (self->_scrollingDisabled != a3)
  {
    v3 = a3;
    self->_scrollingDisabled = a3;
    -[OBWelcomeController scrollView](self, "scrollView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScrollEnabled:", !v3);

  }
}

- (int64_t)preferredUserInterfaceStyle
{
  objc_super v3;

  if (self->_darkMode)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  return -[OBWelcomeController preferredUserInterfaceStyle](&v3, sel_preferredUserInterfaceStyle);
}

- (double)availableContentViewHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (-[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
  {
    -[OBWelcomeController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v5 - v7;
    -[OBWelcomeController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v8 - v10;
    -[OBWelcomeController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaInsets");
    v14 = fmax(v11 - v13, 0.0);

  }
  else
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v16 = v15;
    -[OBWelcomeController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v18 = v16 - v17;
    -[OBWelcomeController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v14 = fmax(v18 - v19, 0.0);
  }

  return v14;
}

- (void)_setupNavigationBarBleed
{
  void *v3;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBWelcomeController setBleedView:](self, "setBleedView:", v5);

  -[OBWelcomeController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController bleedView](self, "bleedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBleedView:", v7);

  -[OBWelcomeController bleedView](self, "bleedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController bleedView](self, "bleedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertSubview:atIndex:", v10, 0);

  v23 = (void *)MEMORY[0x1E0CB3718];
  -[OBWelcomeController bleedView](self, "bleedView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  -[OBWelcomeController bleedView](self, "bleedView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leftAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v22;
  -[OBWelcomeController bleedView](self, "bleedView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v13, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v14;
  -[OBWelcomeController bleedView](self, "bleedView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v20);

}

- (void)_setupScrollView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  OBScrollViewWeakLayoutObserver *v21;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
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
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  _QWORD v223[4];
  _QWORD v224[4];
  void *v225;
  _QWORD v226[5];
  _QWORD v227[4];
  _QWORD v228[5];
  _QWORD v229[12];

  v229[10] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[OBWelcomeController setScrollView:](self, "setScrollView:", v8);

  -[OBWelcomeController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[OBWelcomeController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInsetAdjustmentBehavior:", 2);

  -[OBWelcomeController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setIndicatorInsetAdjustmentBehavior:", 2);

  v13 = *MEMORY[0x1E0DC49E8];
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[OBWelcomeController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInset:", v13, v14, v15, v16);

  v18 = -[OBWelcomeController isScrollingDisabled](self, "isScrollingDisabled") ^ 1;
  -[OBWelcomeController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEnabled:", v18);

  -[OBWelcomeController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[OBScrollViewWeakLayoutObserver initWithLayoutObserver:]([OBScrollViewWeakLayoutObserver alloc], "initWithLayoutObserver:", self);
  objc_msgSend(v20, "_setLayoutObserver:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  -[OBWelcomeController setScrollContentView:](self, "setScrollContentView:", v22);

  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[OBWelcomeController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController setButtonTrayScrollContainerHeightConstraint:](self, "setButtonTrayScrollContainerHeightConstraint:", v36);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollView](self, "scrollView");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "bottomAnchor");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "bottomAnchor");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "constraintEqualToAnchor:constant:", v198, 0.0);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v229[0] = v192;
  -[OBWelcomeController scrollView](self, "scrollView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "topAnchor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "topAnchor");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "constraintEqualToAnchor:constant:", v175, 0.0);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v229[1] = v171;
  -[OBWelcomeController scrollView](self, "scrollView");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "bottomAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "bottomAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToAnchor:constant:", v159, 0.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v229[2] = v156;
  -[OBWelcomeController scrollView](self, "scrollView");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "leftAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "leftAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "constraintEqualToAnchor:constant:", v148, 0.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v229[3] = v146;
  -[OBWelcomeController scrollView](self, "scrollView");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "rightAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "rightAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:constant:", v142, 0.0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v229[4] = v141;
  -[OBWelcomeController scrollView](self, "scrollView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "frameLayoutGuide");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "widthAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "widthAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToAnchor:constant:", v136, 0.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v229[5] = v135;
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "centerXAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "centerXAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintEqualToAnchor:", v131);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v229[6] = v130;
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "widthAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "constraintEqualToAnchor:multiplier:", v37, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v229[7] = v38;
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v229[8] = v43;
  -[OBWelcomeController buttonTrayScrollContainerHeightConstraint](self, "buttonTrayScrollContainerHeightConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v229[9] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v229, 10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "addObjectsFromArray:", v45);

  -[OBWelcomeController scrollView](self, "scrollView");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "topAnchor");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v211, "safeAreaLayoutGuide");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "topAnchor");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "constraintEqualToAnchor:constant:", v193, 0.0);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = v188;
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "layoutMarginsGuide");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "leftAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "leftAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "constraintEqualToAnchor:constant:", v169, 0.0);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v228[1] = v166;
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "layoutMarginsGuide");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "rightAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "rightAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:constant:", v153, 0.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v228[2] = v151;
  -[OBWelcomeController scrollView](self, "scrollView");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "leftAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToAnchor:constant:", v47, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v228[3] = v48;
  -[OBWelcomeController scrollView](self, "scrollView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v228[4] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v228, 5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "addObjectsFromArray:", v54);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v222);
  switch(-[OBWelcomeController contentViewLayout](self, "contentViewLayout"))
  {
    case 1:
    case 4:
      -[OBWelcomeController contentView](self, "contentView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "topAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 0.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController setContentViewTopOffsetConstraint:](self, "setContentViewTopOffsetConstraint:", v59);

      -[OBWelcomeController contentView](self, "contentView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "heightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController _contentViewHeight](self, "_contentViewHeight");
      objc_msgSend(v61, "constraintEqualToConstant:");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController setContentViewHeightConstraint:](self, "setContentViewHeightConstraint:", v62);

      v194 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v227[0] = v218;
      -[OBWelcomeController contentView](self, "contentView");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "leftAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "leftAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "constraintEqualToAnchor:constant:", v63, 0.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v227[1] = v64;
      -[OBWelcomeController contentView](self, "contentView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "widthAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "widthAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:multiplier:", v68, 1.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v227[2] = v69;
      -[OBWelcomeController contentViewHeightConstraint](self, "contentViewHeightConstraint");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v227[3] = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v227, 4);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "activateConstraints:", v71);

      -[OBWelcomeController _setupNavigationBarBleed](self, "_setupNavigationBarBleed");
      if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") == 4)
      {
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[OBWelcomeController scrollContentView](self, "scrollContentView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "addSubview:", v74);

        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "topAnchor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController headerView](self, "headerView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "bottomAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
        objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController setSecondaryContentViewTopOffsetConstraint:](self, "setSecondaryContentViewTopOffsetConstraint:", v79);

        v177 = (void *)MEMORY[0x1E0CB3718];
        -[OBWelcomeController secondaryContentViewTopOffsetConstraint](self, "secondaryContentViewTopOffsetConstraint");
        v213 = objc_claimAutoreleasedReturnValue();
        v226[0] = v213;
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v219, "leftAnchor");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController scrollContentView](self, "scrollContentView");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "layoutMarginsGuide");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "leftAnchor");
        v189 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "constraintEqualToAnchor:constant:", v189, 0.0);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v226[1] = v186;
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "widthAnchor");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController headerView](self, "headerView");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "widthAnchor");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "constraintEqualToAnchor:multiplier:", v167, 1.0);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v226[2] = v164;
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "bottomAnchor");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "topAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "constraintEqualToAnchor:constant:", v81, 0.0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v226[3] = v82;
        -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "topAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "bottomAnchor");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "constraintEqualToAnchor:constant:", v86, 0.0);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v226[4] = v87;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v226, 5);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "activateConstraints:", v88);

        v89 = (void *)v189;
        v90 = (void *)v213;

        v91 = v195;
        v92 = v207;

        v93 = v201;
        v94 = v219;

        v95 = v181;
        goto LABEL_7;
      }
      v124 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "topAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "bottomAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92, 0.0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = v91;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v225, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "activateConstraints:", v89);
      goto LABEL_9;
    case 2:
      -[OBWelcomeController contentView](self, "contentView");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "topAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "bottomAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
      objc_msgSend(v97, "constraintEqualToAnchor:constant:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController setContentViewTopOffsetConstraint:](self, "setContentViewTopOffsetConstraint:", v100);

      v182 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
      v214 = objc_claimAutoreleasedReturnValue();
      v224[0] = v214;
      -[OBWelcomeController contentView](self, "contentView");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "leftAnchor");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "layoutMarginsGuide");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "leftAnchor");
      v190 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "constraintEqualToAnchor:constant:", v190, 0.0);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v224[1] = v186;
      -[OBWelcomeController contentView](self, "contentView");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "widthAnchor");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "widthAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "constraintEqualToAnchor:multiplier:", v102, 1.0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v224[2] = v103;
      -[OBWelcomeController contentView](self, "contentView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "bottomAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "topAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "constraintEqualToAnchor:constant:", v107, 0.0);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v224[3] = v108;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v224, 4);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "activateConstraints:", v109);

      v89 = (void *)v190;
      v91 = v196;

      v92 = v208;
      v93 = v202;

      v94 = v220;
      v90 = (void *)v214;

      goto LABEL_6;
    case 3:
      -[OBWelcomeController contentView](self, "contentView");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "topAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController headerView](self, "headerView");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "bottomAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
      objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController setContentViewTopOffsetConstraint:](self, "setContentViewTopOffsetConstraint:", v114);

      v191 = (void *)MEMORY[0x1E0CB3718];
      -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
      v215 = objc_claimAutoreleasedReturnValue();
      v223[0] = v215;
      -[OBWelcomeController contentView](self, "contentView");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "leftAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "leftAnchor");
      v197 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "constraintEqualToAnchor:constant:", v197, 0.0);
      v115 = objc_claimAutoreleasedReturnValue();
      v223[1] = v115;
      -[OBWelcomeController contentView](self, "contentView");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "widthAnchor");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController scrollContentView](self, "scrollContentView");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "widthAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "constraintEqualToAnchor:multiplier:", v116, 1.0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v223[2] = v117;
      -[OBWelcomeController contentView](self, "contentView");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "bottomAnchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "topAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "constraintEqualToAnchor:constant:", v121, 0.0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v223[3] = v122;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v223, 4);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "activateConstraints:", v123);

      v89 = (void *)v115;
      v91 = (void *)v197;

      v92 = v209;
      v93 = v203;

      v94 = v221;
      v90 = (void *)v215;
LABEL_6:
      v95 = v178;
LABEL_7:

LABEL_9:
      break;
    default:
      break;
  }
  -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
  -[OBWelcomeController _updateHeaderTopOffsetConstraint](self, "_updateHeaderTopOffsetConstraint");
  -[OBWelcomeController tabBarController](self, "tabBarController");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
  {
    -[OBWelcomeController scrollView](self, "scrollView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v126, 4);

  }
}

- (void)setupBulletedListIfNeeded
{
  void *v3;
  OBBulletedList *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeController bulletedList](self, "bulletedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(OBBulletedList);
    -[OBWelcomeController setBulletedList:](self, "setBulletedList:", v4);

    -[OBWelcomeController bulletedList](self, "bulletedList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = -[OBWelcomeController templateType](self, "templateType");
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTemplateType:", v6);

    -[OBWelcomeController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[OBWelcomeController contentViewsTopPaddingFromBottomOfHeader](self, "contentViewsTopPaddingFromBottomOfHeader");
    v11 = v10;
    -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 0);

    -[OBWelcomeController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController setContentViewTopOffsetConstraint:](self, "setContentViewTopOffsetConstraint:", v17);

    -[OBWelcomeController contentViewTopOffsetConstraint](self, "contentViewTopOffsetConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[OBWelcomeController contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLeadingConstraint:", v23);

    -[OBWelcomeController contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTrailingConstraint:", v29);

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v45;
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v43;
    -[OBWelcomeController contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v34;
    -[OBWelcomeController contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController bulletedList](self, "bulletedList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v40);

  }
}

- (double)contentViewsTopPaddingFromBottomOfHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;

  -[OBWelcomeController bulletedList](self, "bulletedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "supportedInterfaceOrientationsForWindow:", v6);

    v9 = v7 == 3 || (v7 & 0xFFFFFFFFFFFFFFF7) == 16;
    -[OBWelcomeController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[OBWelcomeController _landscapeiPhone](self, "_landscapeiPhone") || !v11 || (v12 = 24.0, !v9))
    {
      +[OBDevice currentDevice](OBDevice, "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "templateType");

      v12 = 0.0;
      if (v14 <= 9)
      {
        if (((1 << v14) & 0x24E) != 0)
        {
          v15 = MGGetProductType();
          if (v15 == 1895344378 || v15 == 2903084588)
            return 37.0;
          else
            return 57.0;
        }
        else if (((1 << v14) & 0x1B0) != 0)
        {
          return 37.0;
        }
      }
    }
  }
  else
  {
    v12 = 0.0;
    if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") != 1
      && -[OBWelcomeController contentViewLayout](self, "contentViewLayout") != 4)
    {
      if (-[OBWelcomeController includePaddingAboveContentView](self, "includePaddingAboveContentView"))
        return 20.0;
      else
        return 0.0;
    }
  }
  return v12;
}

- (int64_t)navigationBarScrollToEdgeBehavior
{
  objc_super v4;

  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") == 1)
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeController;
  return -[OBBaseWelcomeController navigationBarScrollToEdgeBehavior](&v4, sel_navigationBarScrollToEdgeBehavior);
}

- (BOOL)contentViewUnderButtonTray
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  double MaxY;
  void *v7;
  double v8;
  void *v9;
  BOOL v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v3 = -[OBWelcomeController contentViewLayout](self, "contentViewLayout");
  if ((unint64_t)(v3 - 2) < 2)
  {
    -[OBWelcomeController contentView](self, "contentView");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 4 && v3 != 1)
    {
      v5 = 0;
      goto LABEL_8;
    }
    -[OBWelcomeController secondaryContentView](self, "secondaryContentView");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:
  objc_msgSend(v5, "frame");
  MaxY = CGRectGetMaxY(v12);
  -[OBWelcomeController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v8 = CGRectGetMaxY(v13);
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v10 = MaxY >= v8 - CGRectGetHeight(v14);

  return v10;
}

- (BOOL)isContentCenterAligned
{
  return !+[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout");
}

- (double)_contentViewHeight
{
  int64_t v3;
  double result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  objc_super v26;

  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") == 1
    || (v3 = -[OBWelcomeController contentViewLayout](self, "contentViewLayout"), result = 0.0, v3 == 4))
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    if (v6 == 2)
    {
      -[OBWelcomeController presentingViewController](self, "presentingViewController");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_11;
      v8 = (void *)v7;
      -[OBWelcomeController presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "modalPresentationStyle");

      if (v11)
      {
        v26.receiver = self;
        v26.super_class = (Class)OBWelcomeController;
        -[OBBaseWelcomeController preferredContentSize](&v26, sel_preferredContentSize);
      }
      else
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v22 = v21;

        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bounds");
        v25 = v24;

        if (v22 >= v25)
          v12 = v22;
        else
          v12 = v25;
      }
      return v12 * 0.36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;

      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17;

      if (v15 >= v18)
        v19 = v15;
      else
        v19 = v18;
      return v19 * 0.36;
    }
  }
  return result;
}

- (void)_updateHeaderTopOffsetConstraint
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  -[OBWelcomeController headerTopOffsetConstraint](self, "headerTopOffsetConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v6 = -[OBWelcomeController contentViewLayout](self, "contentViewLayout");
    if ((unint64_t)(v6 - 2) < 2)
    {
      -[OBWelcomeController scrollView](self, "scrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topAnchor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 != 4 && v6 != 1)
        goto LABEL_9;
      -[OBWelcomeController contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bottomAnchor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
    -[OBWelcomeController headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController _headerTopOffset](self, "_headerTopOffset");
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController setHeaderTopOffsetConstraint:](self, "setHeaderTopOffsetConstraint:", v13);

LABEL_9:
    -[OBWelcomeController headerTopOffsetConstraint](self, "headerTopOffsetConstraint");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);
    goto LABEL_10;
  }
  -[OBWelcomeController _headerTopOffset](self, "_headerTopOffset");
  v5 = -v4;
  -[OBWelcomeController headerTopOffsetConstraint](self, "headerTopOffsetConstraint");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v5);
LABEL_10:

}

- (double)_headerTopOffset
{
  double v2;
  int64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  float v17;

  v4 = -[OBWelcomeController contentViewLayout](self, "contentViewLayout");
  if ((unint64_t)(v4 - 2) < 2)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 2)
    {
      -[OBWelcomeController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v2 = v9 * 0.09;
    }
    else
    {
      -[OBWelcomeController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;

      -[OBWelcomeController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v15, "isHidden");

      if ((_DWORD)v11)
        v13 = 0.0;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v17 = -(v13 - v16 * 0.09);
      v2 = fmaxf(v17, 0.0);
    }

  }
  else if (v4 == 4 || v4 == 1)
  {
    -[OBWelcomeController _contentViewHeight](self, "_contentViewHeight");
    return v5 * 0.09;
  }
  return v2;
}

- (BOOL)_shouldDetachButtonTray
{
  CGRect v3;

  -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
  return !CGRectEqualToRect(v3, *MEMORY[0x1E0C9D648]);
}

- (BOOL)shouldInlineButtonTray
{
  _BOOL4 v3;
  int64_t v4;
  _BOOL4 v5;
  void *v6;
  double MaxY;
  void *v8;
  double v9;
  void *v10;
  void *v12;
  char v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double MinY;
  CGFloat v47;
  double v48;
  CGFloat rect;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v3 = +[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout");
  v4 = -[OBWelcomeController contentViewLayout](self, "contentViewLayout");
  if ((unint64_t)(v4 - 2) >= 3)
  {
    if (v4 != 1)
      goto LABEL_6;
    -[OBWelcomeController headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    MaxY = CGRectGetMaxY(v50);
    -[OBWelcomeController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = CGRectGetMaxY(v51);
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v5 = MaxY >= v9 - CGRectGetHeight(v52);

  }
  else
  {
    v5 = -[OBWelcomeController contentViewUnderButtonTray](self, "contentViewUnderButtonTray");
  }
  if (v3 && v5)
    return 1;
LABEL_6:
  if (-[OBWelcomeController _shouldInlineButtontray](self, "_shouldInlineButtontray"))
    return 1;
  if (!-[OBWelcomeController shouldAdjustButtonTrayForKeyboard](self, "shouldAdjustButtonTrayForKeyboard"))
    return -[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray");
  if (!-[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray"))
    return -[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray");
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHidden");

  if ((v13 & 1) != 0)
    return -[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray");
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (-[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray"))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "detachedSize");
    v20 = v24;
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "detachedSize");
    v22 = v26;
    v16 = 0.0;

    rect = 0.0;
  }
  else
  {
    rect = v18;
  }
  -[OBWelcomeController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[OBWelcomeController headerView](self, "headerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "convertRect:fromView:", v37, v30, v32, v34, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
  MinY = CGRectGetMinY(v53);
  v54.origin.x = v16;
  v54.origin.y = rect;
  v54.size.width = v20;
  v54.size.height = v22;
  v47 = MinY - CGRectGetHeight(v54);
  v55.origin.x = v39;
  v55.origin.y = v41;
  v55.size.width = v43;
  v55.size.height = v45;
  v48 = CGRectGetMaxY(v55);
  v56.origin.x = v16;
  v56.origin.y = v47;
  v56.size.width = v20;
  v56.size.height = v22;
  return v48 > CGRectGetMinY(v56);
}

- (BOOL)_scrollViewContentIsUnderTray
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  CGRect v26;

  -[OBWelcomeController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[OBWelcomeController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentSize");
  v24 = v23;
  v26.origin.x = v15;
  v26.origin.y = v17;
  v26.size.width = v19;
  v26.size.height = v21;
  LOBYTE(v3) = v24 > CGRectGetMinY(v26);

  return (char)v3;
}

- (void)_updateButtonTrayBackdrop
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  id v6;

  if (-[OBWelcomeController shouldInlineButtonTray](self, "shouldInlineButtonTray"))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  v4 = -[OBWelcomeController _scrollViewContentIsUnderTray](self, "_scrollViewContentIsUnderTray");
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (!v4)
    goto LABEL_5;
  v5 = 2;
LABEL_6:
  objc_msgSend(v3, "setBackdropStyle:", v5);

}

- (void)_updateScrollContentViewLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;

  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;

  v6 = -[OBWelcomeController _landscapeiPhone](self, "_landscapeiPhone");
  -[OBWelcomeController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "directionalLayoutMargins");
  v9 = v8;
  if (v6)
  {
    -[OBWelcomeController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v9 = v9 - v11;

    -[OBWelcomeController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "directionalLayoutMargins");
    v14 = v13;
    -[OBWelcomeController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeAreaInsets");
    v17 = v14 - v16;

  }
  else
  {

    -[OBWelcomeController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "directionalLayoutMargins");
    v17 = v18;
  }

  v19 = 0.0;
  if (!-[OBWelcomeController shouldInlineButtonTray](self, "shouldInlineButtonTray"))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v19 = v21;

  }
  -[OBWelcomeController scrollContentView](self, "scrollContentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDirectionalLayoutMargins:", v5, v9, v19, v17);

}

- (void)_updateScrollViewInsets
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
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  _BOOL4 IsEmpty;
  double Height;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[OBWelcomeController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[OBWelcomeController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[OBWelcomeController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "verticalScrollIndicatorInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = -[OBWelcomeController shouldAdjustScrollViewInsetForKeyboard](self, "shouldAdjustScrollViewInsetForKeyboard");
  if (-[OBWelcomeController shouldAdjustButtonTrayForKeyboard](self, "shouldAdjustButtonTrayForKeyboard"))
  {
    if (!-[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
      goto LABEL_8;
  }
  else if (!v18)
  {
    goto LABEL_8;
  }
  -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
  v40.origin.x = v19;
  v40.origin.y = v20;
  v40.size.width = v21;
  v40.size.height = v22;
  if (!CGRectEqualToRect(*MEMORY[0x1E0C9D648], v40))
  {
    -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
    Height = CGRectGetHeight(v39);
    goto LABEL_16;
  }
LABEL_8:
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "hasContent") & 1) == 0)
  {

    goto LABEL_13;
  }
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  IsEmpty = CGRectIsEmpty(v38);

  if (IsEmpty)
  {
LABEL_13:
    -[OBWelcomeController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaInsets");
    Height = v33;
    goto LABEL_14;
  }
  Height = 0.0;
  if (!-[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
  {
    -[OBWelcomeController _currentContainerView](self, "_currentContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");
    objc_msgSend(v28, "convertPoint:toView:", v27);
    v31 = v30;

    objc_msgSend(v27, "bounds");
    Height = v32 - v31;
LABEL_14:

  }
LABEL_16:
  if (-[OBWelcomeController _landscapeiPhone](self, "_landscapeiPhone"))
  {
    if (Height == 0.0)
    {
      -[OBWelcomeController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "safeAreaInsets");
      Height = v35;

    }
  }
  -[OBWelcomeController scrollView](self, "scrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentInset:", v6, v8, Height, v10);

  -[OBWelcomeController scrollView](self, "scrollView");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setScrollIndicatorInsets:", v13, v15, Height, v17);

}

- (id)_currentContainerView
{
  void *v3;
  void *v4;
  void *v5;

  -[OBWelcomeController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[OBWelcomeController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[OBWelcomeController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (void)_inlineButtonTray
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[7];

  v34[5] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[OBWelcomeController buttonTrayScrollContainerHeightConstraint](self, "buttonTrayScrollContainerHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v29;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v18;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v8;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](self, "buttonTrayScrollContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v15);

}

- (void)_floatButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  _QWORD v41[5];
  CGRect v42;
  CGRect v43;

  v41[4] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBWelcomeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[OBWelcomeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[OBWelcomeController shouldAdjustButtonTrayForKeyboard](self, "shouldAdjustButtonTrayForKeyboard")
    && (-[OBWelcomeController keyboardFrame](self, "keyboardFrame"),
        v43.origin.x = v8,
        v43.origin.y = v9,
        v43.size.width = v10,
        v43.size.height = v11,
        !CGRectEqualToRect(*MEMORY[0x1E0C9D648], v43)))
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "buttonLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v22, CGRectGetHeight(v42));
    v19 = objc_claimAutoreleasedReturnValue();

    -[OBWelcomeController buttonTray](self, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buttonLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[OBWelcomeController tabBarController](self, "tabBarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[OBWelcomeController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeAreaLayoutGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v15;
    }
    v16 = (uint64_t)v7;
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buttonLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v16);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v19;
  v36 = (void *)v16;

  v35 = (void *)MEMORY[0x1E0CB3718];
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v16, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v38;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v24, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v25;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v30;
  v41[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v31);

  -[OBWelcomeController buttonTrayScrollContainerHeightConstraint](self, "buttonTrayScrollContainerHeightConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

}

- (void)_layoutButtonTray
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
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
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  if (-[OBWelcomeController shouldInlineButtonTray](self, "shouldInlineButtonTray"))
  {
    -[OBWelcomeController _inlineButtonTray](self, "_inlineButtonTray");
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0;
  }
  else
  {
    -[OBWelcomeController _floatButtonTray](self, "_floatButtonTray");
    v7 = -[OBWelcomeController _shouldDetachButtonTray](self, "_shouldDetachButtonTray");
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = v7;
  }
  objc_msgSend(v4, "setDetached:", v6);

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") != 2 && !-[OBWelcomeController _landscapeiPhone](self, "_landscapeiPhone"))
  {

    goto LABEL_11;
  }
  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = objc_msgSend(v9, "templateTypeForBoundsWidth:", v11);

  if (v12 == 7)
  {
LABEL_11:
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "buttonLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v28;
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "buttonLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v35);

    v26 = v36;
    v25 = v38;

    v24 = v37;
    v23 = v40;

    v22 = v42;
    goto LABEL_12;
  }
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "buttonLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buttonLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 360.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController buttonTray](self, "buttonTray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "buttonLayoutGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWidthConstraint:", v19);

  }
  v41 = (void *)MEMORY[0x1E0CB3718];
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "buttonLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v24;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "buttonLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v30);
LABEL_12:

  -[OBWelcomeController _updateScrollViewInsets](self, "_updateScrollViewInsets");
}

- (BOOL)_buttonTrayInlined
{
  OBWelcomeController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[OBWelcomeController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController buttonTrayScrollContainerView](v2, "buttonTrayScrollContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)_inlineButtonTrayIfNeeded
{
  _BOOL4 v3;

  v3 = -[OBWelcomeController shouldInlineButtonTray](self, "shouldInlineButtonTray");
  if (v3 != -[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
    -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
}

- (void)updateDirectionalLayoutMargins
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeController;
  -[OBBaseWelcomeController updateDirectionalLayoutMargins](&v3, sel_updateDirectionalLayoutMargins);
  -[OBWelcomeController _updateScrollContentViewLayoutMargins](self, "_updateScrollContentViewLayoutMargins");
  -[OBWelcomeController _updateScrollViewInsets](self, "_updateScrollViewInsets");
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  if (-[OBWelcomeController contentViewLayout](self, "contentViewLayout") != 1)
  {
    if (-[OBWelcomeController shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen](self, "shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen"))
    {
      -[OBWelcomeController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EE390370);

      if (v7)
      {
        -[OBBaseWelcomeController navigationItem](self, "navigationItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController headerView](self, "headerView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBWelcomeController scrollView](self, "scrollView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[OBViewUtilities shouldUpdateNavigationBarWithNavigationItem:forHeaderView:inScrollView:](OBViewUtilities, "shouldUpdateNavigationBarWithNavigationItem:forHeaderView:inScrollView:", v8, v9, v10);

        if (v11 != -[OBWelcomeController shouldShowHeaderCachedState](self, "shouldShowHeaderCachedState"))
        {
          -[OBWelcomeController setShouldShowHeaderCachedState:](self, "setShouldShowHeaderCachedState:", v11);
          -[OBBaseWelcomeController navigationItem](self, "navigationItem");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          -[OBWelcomeController headerView](self, "headerView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBWelcomeController scrollView](self, "scrollView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[OBViewUtilities updateNavigationBarWithNavigationItem:forHeaderView:inScrollView:animated:](OBViewUtilities, "updateNavigationBarWithNavigationItem:forHeaderView:inScrollView:animated:", v14, v12, v13, v3);

        }
      }
    }
  }
}

- (void)_enableTrayButtonsForScrollToBottom:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  double v9;
  unint64_t v10;
  void *v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  id v15;

  v4 = -[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined", a3);
  -[OBWelcomeController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = (unint64_t)v6;
  -[OBWelcomeController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = (unint64_t)v9 + v7;

  -[OBWelcomeController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v10 >= (unint64_t)v12 - 1;

  if (!v4)
    v13 = !-[OBWelcomeController _scrollViewContentIsUnderTray](self, "_scrollViewContentIsUnderTray");
  if (-[OBWelcomeController disableButtonsUntilAllContentWasVisable](self, "disableButtonsUntilAllContentWasVisable"))
  {
    if (v13)
    {
      -[OBWelcomeController buttonTray](self, "buttonTray");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "buttons");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_88);

    }
  }
}

void __59__OBWelcomeController__enableTrayButtonsForScrollToBottom___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_msgSend(v2, "isEnabled") & 1) == 0)
    objc_msgSend(v2, "setEnabled:", 1);

}

- (void)_registerForKeyboardNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  v12 = (id)*MEMORY[0x1E0DC4FE8];
  -[OBWelcomeController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[OBWelcomeController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "modalPresentationStyle") != 2;

  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !v7)
  {
    v10 = (id)*MEMORY[0x1E0DC4E70];

    v12 = v10;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleKeyboardPresentation_, v12, 0);

}

- (void)_unregisterForKeyboardNotifications
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);

}

- (void)_keyboardWillHide:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect v9;

  -[OBWelcomeController keyboardFrame](self, "keyboardFrame", a3);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  if (!CGRectEqualToRect(v8, v9))
  {
    -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", v4, v5, v6, v7);
    -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
    if (-[OBWelcomeController shouldAdjustScrollViewInsetForKeyboard](self, "shouldAdjustScrollViewInsetForKeyboard"))
      -[OBWelcomeController _updateScrollViewInsets](self, "_updateScrollViewInsets");
  }
}

- (void)_handleKeyboardPresentation:(id)a3
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
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double x;
  double y;
  double width;
  double height;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (v13 != 0.0 && v11 != 0.0)
  {
    -[OBWelcomeController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertRect:fromView:", 0, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[OBWelcomeController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v35.origin.x = v16;
    v35.origin.y = v18;
    v35.size.width = v20;
    v35.size.height = v22;
    v33 = CGRectIntersection(v32, v35);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;

    -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
    v36.origin.x = v28;
    v36.origin.y = v29;
    v36.size.width = v30;
    v36.size.height = v31;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    if (!CGRectEqualToRect(v34, v36))
      -[OBWelcomeController setKeyboardFrame:](self, "setKeyboardFrame:", x, y, width, height);
    if (-[OBWelcomeController shouldAdjustButtonTrayForKeyboard](self, "shouldAdjustButtonTrayForKeyboard"))
      -[OBWelcomeController _layoutButtonTray](self, "_layoutButtonTray");
    if (-[OBWelcomeController shouldAdjustScrollViewInsetForKeyboard](self, "shouldAdjustScrollViewInsetForKeyboard"))
      -[OBWelcomeController _updateScrollViewInsets](self, "_updateScrollViewInsets");
  }
}

- (void)setTemplateType:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[OBWelcomeController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemplateType:", a3);

  -[OBWelcomeController bulletedList](self, "bulletedList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTemplateType:", a3);

  self->_templateType = a3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  -[OBWelcomeController _updateButtonTrayBackdrop](self, "_updateButtonTrayBackdrop");
  -[OBWelcomeController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 1);
  -[OBWelcomeController _enableTrayButtonsForScrollToBottom:](self, "_enableTrayButtonsForScrollToBottom:", v4);

}

- (void)restoreNavigationBarAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  OBWelcomeController *v13;
  _QWORD v14[5];
  id v15;

  -[OBWelcomeController retainedNavigationController](self, "retainedNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE390370))
    {
      v7 = v6;
      -[OBWelcomeController cachedBarState](self, "cachedBarState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCurrentNavigationBarDisplayState:", v8);

    }
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke;
    v14[3] = &unk_1E37AABD0;
    v14[4] = self;
    v15 = v3;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke_2;
    v11[3] = &unk_1E37AABD0;
    v12 = v15;
    v13 = self;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", v14, v11);

  }
  else
  {
    -[OBWelcomeController cachedBarState](self, "cachedBarState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyState:", v10);

  }
  -[OBWelcomeController setRetainedNavigationController:](self, "setRetainedNavigationController:", 0);

}

void __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cachedBarState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyState:", v2);

}

void __53__OBWelcomeController_restoreNavigationBarAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  int v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v4 = objc_msgSend(a2, "isCancelled");
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_backgroundHidden");
    if ((v7 & 1) != 0)
    {
      v8 = 0.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "cachedBarState");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "backgroundOpacity");
      v8 = v10;
    }
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setBackgroundOpacity:", v8);

    if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "navigationItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_titleOpacity");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setTitleOpacity:", v13);

  }
  else
  {
    objc_msgSend(v5, "cachedBarState");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applyState:", v9);
  }

}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = -[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined", a3);
  -[OBWelcomeController _inlineButtonTrayIfNeeded](self, "_inlineButtonTrayIfNeeded");
  -[OBWelcomeController _updateButtonTrayBackdrop](self, "_updateButtonTrayBackdrop");
  if (v4 != -[OBWelcomeController _buttonTrayInlined](self, "_buttonTrayInlined"))
  {
    -[OBWelcomeController scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[OBWelcomeController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

  }
  -[OBWelcomeController scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _enableTrayButtonsForScrollToBottom:](self, "_enableTrayButtonsForScrollToBottom:", v7);

}

- (BOOL)_landscapeiPhone
{
  void *v3;
  void *v4;
  BOOL v5;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    -[OBWelcomeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)(+[OBViewUtilities activeInterfaceOrientationForView:](OBViewUtilities, "activeInterfaceOrientationForView:", v4)- 3) < 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (OBHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (OBContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)secondaryContentView
{
  return self->_secondaryContentView;
}

- (void)setSecondaryContentView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryContentView, a3);
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIView)bleedView
{
  return self->_bleedView;
}

- (void)setBleedView:(id)a3
{
  objc_storeStrong((id *)&self->_bleedView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollContentView, a3);
}

- (UIView)buttonTrayScrollContainerView
{
  return self->_buttonTrayScrollContainerView;
}

- (void)setButtonTrayScrollContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerView, a3);
}

- (NSLayoutConstraint)buttonTrayScrollContainerHeightConstraint
{
  return self->_buttonTrayScrollContainerHeightConstraint;
}

- (void)setButtonTrayScrollContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)headerTopOffsetConstraint
{
  return self->_headerTopOffsetConstraint;
}

- (void)setHeaderTopOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerTopOffsetConstraint, a3);
}

- (NSLayoutConstraint)contentViewTopOffsetConstraint
{
  return self->_contentViewTopOffsetConstraint;
}

- (void)setContentViewTopOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewTopOffsetConstraint, a3);
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, a3);
}

- (NSLayoutConstraint)secondaryContentViewTopOffsetConstraint
{
  return self->_secondaryContentViewTopOffsetConstraint;
}

- (void)setSecondaryContentViewTopOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryContentViewTopOffsetConstraint, a3);
}

- (OBBulletedList)bulletedList
{
  return self->_bulletedList;
}

- (void)setBulletedList:(id)a3
{
  objc_storeStrong((id *)&self->_bulletedList, a3);
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (OBNavigationBarDisplayState)cachedBarState
{
  return self->_cachedBarState;
}

- (void)setCachedBarState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedBarState, a3);
}

- (UINavigationController)retainedNavigationController
{
  return self->_retainedNavigationController;
}

- (void)setRetainedNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_retainedNavigationController, a3);
}

- (BOOL)_shouldInlineButtontray
{
  return self->__shouldInlineButtontray;
}

- (void)set_shouldInlineButtontray:(BOOL)a3
{
  self->__shouldInlineButtontray = a3;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (BOOL)shouldAdjustScrollViewInsetForKeyboard
{
  return self->_shouldAdjustScrollViewInsetForKeyboard;
}

- (void)setShouldAdjustScrollViewInsetForKeyboard:(BOOL)a3
{
  self->_shouldAdjustScrollViewInsetForKeyboard = a3;
}

- (BOOL)shouldAdjustButtonTrayForKeyboard
{
  return self->_shouldAdjustButtonTrayForKeyboard;
}

- (void)setShouldAdjustButtonTrayForKeyboard:(BOOL)a3
{
  self->_shouldAdjustButtonTrayForKeyboard = a3;
}

- (BOOL)disableButtonsUntilAllContentWasVisable
{
  return self->_disableButtonsUntilAllContentWasVisable;
}

- (void)setDisableButtonsUntilAllContentWasVisable:(BOOL)a3
{
  self->_disableButtonsUntilAllContentWasVisable = a3;
}

- (BOOL)shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen
{
  return self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen;
}

- (void)setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:(BOOL)a3
{
  self->_shouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen = a3;
}

- (BOOL)includePaddingAboveContentView
{
  return self->_includePaddingAboveContentView;
}

- (void)setIncludePaddingAboveContentView:(BOOL)a3
{
  self->_includePaddingAboveContentView = a3;
}

- (void)setAvailableContentViewHeight:(double)a3
{
  self->_availableContentViewHeight = a3;
}

- (BOOL)shouldShowHeaderCachedState
{
  return self->_shouldShowHeaderCachedState;
}

- (void)setShouldShowHeaderCachedState:(BOOL)a3
{
  self->_shouldShowHeaderCachedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedNavigationController, 0);
  objc_storeStrong((id *)&self->_cachedBarState, 0);
  objc_storeStrong((id *)&self->_bulletedList, 0);
  objc_storeStrong((id *)&self->_secondaryContentViewTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_headerTopOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTrayScrollContainerView, 0);
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_bleedView, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_secondaryContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

void __74__OBWelcomeController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "contentViewLayout");
  v4 = 134217984;
  v5 = v3;
  _os_log_fault_impl(&dword_199FE5000, a2, OS_LOG_TYPE_FAULT, "The contentLayoutType currently in use does not support landscape rotation layout:%li", (uint8_t *)&v4, 0xCu);
}

@end
