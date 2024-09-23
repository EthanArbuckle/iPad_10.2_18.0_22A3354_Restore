@implementation _UITabBarControllerVisualStyle_Pad

- (_UITabBarControllerVisualStyle_Pad)initWithTabBarController:(id)a3
{
  _UITabBarControllerVisualStyle_Pad *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  v3 = -[_UITabBarControllerVisualStyle initWithTabBarController:](&v5, sel_initWithTabBarController_, a3);
  if (v3)
    +[_UIFloatingTabBar registerPlatformMetrics](_UIFloatingTabBar, "registerPlatformMetrics");
  return v3;
}

- (UIAction)overrideTidebarButtonAction
{
  void *v2;
  void *v3;

  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideTidebarButtonAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAction *)v3;
}

- (void)setOverrideTidebarButtonAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideTidebarButtonAction:", v4);

}

- (unint64_t)defaultMaxItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7.receiver = self;
  v7.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  return -[_UITabBarControllerVisualStyle_iOS defaultMaxItems](&v7, sel_defaultMaxItems);
}

- (BOOL)wantsDefaultTabBar
{
  return 0;
}

- (void)loadViews
{
  id *v3;
  void *v4;
  _UITabContainerView *v5;
  void *v6;
  _UITabContainerView *v7;
  _UITabContainerView *tabContainerView;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_tabContainerView)
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _internalTabBar](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = [_UITabContainerView alloc];
    objc_msgSend(v12, "sidebar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UITabContainerView initWithSidebar:tabBar:](v5, "initWithSidebar:tabBar:", v6, v4);
    tabContainerView = self->_tabContainerView;
    self->_tabContainerView = v7;

    -[_UITabContainerView setDelegate:](self->_tabContainerView, "setDelegate:", self);
    if (!v4)
    {
      -[_UITabContainerView tabBar](self->_tabContainerView, "tabBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTabBar:", v9);

    }
  }
  if (dyld_program_sdk_at_least())
  {
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

  }
}

- (void)_updateNavigationBarHostingWithSelectedViewController:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _viewControllersForTabs](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "_hostingNavigationBar", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (objc_msgSend(v12, "_shouldOverlayTabBar"))
          {
            objc_msgSend(v13, "_setActiveTabBarHost:", v12 == v4);
            -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_setTabBarHostedView:", v14);

          }
          else
          {
            objc_msgSend(v13, "_setTabBarHostedView:", 0);
          }
        }
        else if (objc_msgSend(v12, "_isSplitViewController"))
        {
          v15 = v12;
          -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_setTabBarHostedView:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_updateContentOverlayInsetsForSelfAndChildren");

}

- (void)updateTabBarLayout
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[13];
  CGRect v25;
  CGRect v26;

  -[UIView frame](self->_tabContainerView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[_UITabContainerView setFrame:](self->_tabContainerView, "setFrame:", v14, v16, v18, v20);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  if (!CGRectEqualToRect(v25, v26))
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56___UITabBarControllerVisualStyle_Pad_updateTabBarLayout__block_invoke;
    v24[3] = &unk_1E16B5328;
    *(CGFloat *)&v24[5] = v4;
    *(CGFloat *)&v24[6] = v6;
    *(CGFloat *)&v24[7] = v8;
    *(CGFloat *)&v24[8] = v10;
    *(double *)&v24[9] = v14;
    *(double *)&v24[10] = v16;
    *(double *)&v24[11] = v18;
    *(double *)&v24[12] = v20;
    v24[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
  }
  -[_UITabBarControllerVisualStyle_Pad _updateSidebarResolvedLayout](self, "_updateSidebarResolvedLayout");
  -[_UITabBarControllerVisualStyle_Pad _updateContentLayoutForSidebarAppearanceIfNeeded](self, "_updateContentLayoutForSidebarAppearanceIfNeeded");
  -[_UITabBarControllerVisualStyle_Pad _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:](self, "_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:", 1);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "selectedViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle_Pad _updateNavigationBarHostingWithSelectedViewController:](self, "_updateNavigationBarHostingWithSelectedViewController:", v22);

  v23.receiver = self;
  v23.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle updateTabBarLayout](&v23, sel_updateTabBarLayout);
}

- (void)willUpdateViewControllers
{
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle willUpdateViewControllers](&v16, sel_willUpdateViewControllers);
  -[_UITabBarControllerVisualStyle_Pad _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:](self, "_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:", 0);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _viewControllersForTabs](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "_hostingNavigationBar", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setTabBarHostedView:", 0);

        if (objc_msgSend(v10, "_isSplitViewController"))
          objc_msgSend(v10, "_setTabBarHostedView:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (void)updateViewControllers:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle_iOS updateViewControllers:](&v5, sel_updateViewControllers_);
  -[_UITabBarControllerVisualStyle_Pad _updateBarAvailabilityAnimated:](self, "_updateBarAvailabilityAnimated:", v3);
  -[_UITabBarControllerVisualStyle_Pad _updateHostedNavigationBarsWithWantsHostedTabBarMetrics:](self, "_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:", 1);
}

- (void)selectedViewControllerDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle selectedViewControllerDidChange](&v5, sel_selectedViewControllerDidChange);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle_Pad _updateNavigationBarHostingWithSelectedViewController:](self, "_updateNavigationBarHostingWithSelectedViewController:", v4);

}

- (void)titleDidChange
{
  void *v3;
  void *v4;
  id *v5;
  id v6;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle_Pad sidebar](self, "sidebar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_outlineView");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineView setTitle:](v5, v3);

}

- (void)updateViewControllerForReselection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  objc_super v9;

  v4 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_selectedTabElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isGroup");

  v8 = -[_UITabBarControllerVisualStyle_Pad shouldEnforceChildSelectionInGroupTabs](self, "shouldEnforceChildSelectionInGroupTabs");
  if (!v7 || !v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    -[_UITabBarControllerVisualStyle updateViewControllerForReselection:](&v9, sel_updateViewControllerForReselection_, v4);
  }

}

- (void)_updateHostedNavigationBarsWithWantsHostedTabBarMetrics:(BOOL)a3
{
  _BOOL4 v3;
  id *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _viewControllersForTabs](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canShowFloatingUI"))
  {
    v8 = -[_UITabBarControllerVisualStyle_Pad _canDisplayTabBarAlongsideSidebar](self, "_canDisplayTabBarAlongsideSidebar");

    if (v8)
      goto LABEL_6;
  }
  else
  {

  }
  v3 = 0;
LABEL_6:
  if (-[_UITabBarControllerVisualStyle isBarHidden](self, "isBarHidden"))
  {
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_overrideTidebarButtonAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      v3 = 0;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "_hostingNavigationBar", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setWantsHostedTabBarMetrics:", v3 & objc_msgSend(v16, "_shouldOverlayTabBar"));

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  return -[_UITabContainerView resolvedPopoverPresentationControllerSourceItemForTab:](self->_tabContainerView, "resolvedPopoverPresentationControllerSourceItemForTab:", a3);
}

- (void)tabContentDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "_isBridgedItem"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    -[_UITabBarControllerVisualStyle_iOS tabContentDidChange:](&v5, sel_tabContentDidChange_, v4);
  }

}

- (BOOL)shouldEnforceChildSelectionInGroupTabs
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2;

  return v4;
}

- (id)sidebar
{
  void *v2;
  void *v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canDisplayTabBar
{
  void *v2;
  BOOL v3;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode") != 3;

  return v3;
}

- (BOOL)canDisplayUITabBar
{
  void *v2;
  char v3;

  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowFloatingUI") ^ 1;

  return v3;
}

- (BOOL)canDisplaySidebar
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    goto LABEL_14;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  if ((unint64_t)(v4 - 2) < 2)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (v4)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tabElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_isGroup") & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_17;
        }
      }
      v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_17:

  return v5;
}

- (BOOL)canToggleSidebar
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  return v5 == 2 && -[_UITabBarControllerVisualStyle_Pad canDisplaySidebar](self, "canDisplaySidebar");
}

- (BOOL)supportsTabBar
{
  return 1;
}

- (void)setBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[_UITabBarControllerVisualStyle isBarHidden](self, "isBarHidden");
  v8.receiver = self;
  v8.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
  -[_UITabBarControllerVisualStyle setBarHidden:animated:](&v8, sel_setBarHidden_animated_, v5, v4);
  if (v7 != v5)
    -[_UITabBarControllerVisualStyle_Pad _updateBarAvailabilityAnimated:](self, "_updateBarAvailabilityAnimated:", v4);
}

- (void)preferredSidebarModeDidChange
{
  -[_UITabBarControllerVisualStyle_Pad _updateBarAvailabilityAnimated:](self, "_updateBarAvailabilityAnimated:", 0);
  -[_UITabBarControllerVisualStyle_Pad _setNeedsContentLayout](self, "_setNeedsContentLayout");
  -[_UITabBarControllerVisualStyle_Pad _updateContentLayoutForSidebarAppearanceIfNeeded](self, "_updateContentLayoutForSidebarAppearanceIfNeeded");
}

- (void)sidebarLayoutDidChange
{
  -[_UITabBarControllerVisualStyle_Pad _setNeedsContentLayout](self, "_setNeedsContentLayout");
  -[_UITabBarControllerVisualStyle_Pad _updateContentLayoutForSidebarAppearanceIfNeeded](self, "_updateContentLayoutForSidebarAppearanceIfNeeded");
}

- (void)sidebarVisibilityDidChangeWithAnimator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  -[_UITabContainerView updateSidebarAppearanceStateAnimated:animator:](self->_tabContainerView, "updateSidebarAppearanceStateAnimated:animator:", v7, v8);
}

- (void)editingStateDidChange
{
  id v2;

  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEditModeAppearanceAnimated:", 1);

}

- (BOOL)overrideUISplitViewControllerToCompact
{
  return 0;
}

- (BOOL)_canDisplayTabBarAlongsideSidebar
{
  if (qword_1ECD824A0 != -1)
    dispatch_once(&qword_1ECD824A0, &__block_literal_global_645);
  return !_MergedGlobals_1320 && -[_UITabBarControllerVisualStyle_Pad canDisplayTabBar](self, "canDisplayTabBar");
}

- (void)_updateBarAvailabilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a3;
  v5 = -[_UITabBarControllerVisualStyle_Pad canDisplaySidebar](self, "canDisplaySidebar");
  if (v5)
    v6 = 2;
  else
    v6 = 0;
  v7 = v6;
  if (-[_UITabBarControllerVisualStyle_Pad canDisplayTabBar](self, "canDisplayTabBar"))
  {
    if (-[_UITabBarControllerVisualStyle isBarHidden](self, "isBarHidden"))
      v7 = v6;
    else
      v7 = v6 | 1;
    v6 |= 1uLL;
  }
  v8 = v5
    && !-[_UITabBarControllerVisualStyle_Pad _canDisplayTabBarAlongsideSidebar](self, "_canDisplayTabBarAlongsideSidebar")&& -[_UITabBarControllerVisualStyle_Pad supportsTabBar](self, "supportsTabBar");
  -[_UITabContainerView setWantsOverlaySidebarButton:](self->_tabContainerView, "setWantsOverlaySidebarButton:", v8);
  -[_UITabContainerView setSupportedComponent:](self->_tabContainerView, "setSupportedComponent:", v6);
  -[_UITabContainerView setAvailableComponent:animated:](self->_tabContainerView, "setAvailableComponent:animated:", v7, v3);
}

- (void)updateContentLayoutForSidebarAppearanceWithTransitionCoordinator:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  -[_UITabBarControllerVisualStyle_Pad adjustedTransitionViewFrame:](self, "adjustedTransitionViewFrame:");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    v16 = (uint64_t)v18;
    if (!v18)
    {
      objc_msgSend(v4, "_definiteTransitionCoordinator");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (id)v16;
    objc_msgSend(v4, "_selectedViewControllerInTabBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewWillTransitionToSize:withTransitionCoordinator:", v18, v12, v14);

  }
  -[_UITabBarControllerVisualStyle_Pad _setNeedsContentLayout](self, "_setNeedsContentLayout");
  -[_UITabBarControllerVisualStyle_Pad _updateContentLayoutForSidebarAppearanceIfNeeded](self, "_updateContentLayoutForSidebarAppearanceIfNeeded");

}

- (void)didUpdateVisibleAppearance
{
  void *v3;
  char v4;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isInSidebarTransition");

  if ((v4 & 1) == 0)
  {
    -[_UITabBarControllerVisualStyle_Pad _setNeedsContentLayout](self, "_setNeedsContentLayout");
    -[_UITabBarControllerVisualStyle_Pad _updateContentLayoutForSidebarAppearanceIfNeeded](self, "_updateContentLayoutForSidebarAppearanceIfNeeded");
  }
}

- (void)_setNeedsContentLayout
{
  void *v2;
  id v3;

  if (!self->_needsContentLayout)
  {
    self->_needsContentLayout = 1;
    -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_existingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (void)_updateSidebarResolvedLayout
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[_UITabBarControllerVisualStyle_Pad sidebar](self, "sidebar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)v4);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabBarControllerVisualStyle_Pad.m"), 467, CFSTR("Resolved sidebar layout cannot be automatic."));

  }
  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  if (v7 <= v9)
    v10 = 1194.0;
  else
    v10 = 1024.0;

  if (v8 <= v10 && -[_UITabBarControllerVisualStyle_Pad supportsOverlaySidebarMode](self, "supportsOverlaySidebarMode"))
  {
    v11 = 2;
  }
  else
  {
    v12 = 1;
    if (v5 != 2)
      v12 = 2;
    if (v5 == 1)
      v11 = 0;
    else
      v11 = v12;
  }
  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSidebarLayout:", v11);

}

- (BOOL)supportsOverlaySidebarMode
{
  return 1;
}

- (void)_updateContentLayoutForSidebarAppearanceIfNeeded
{
  void *v3;
  void *v4;
  _DWORD *v5;
  _DWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsContentLayout)
  {
    v8 = v3;
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v8;
    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke;
      v9[3] = &unk_1E16B1B50;
      v9[4] = self;
      v5 = v8;
      v10 = v5;
      if (v5)
      {
        v6 = v5;
        v5[276] |= 0x10000u;
        __86___UITabBarControllerVisualStyle_Pad__updateContentLayoutForSidebarAppearanceIfNeeded__block_invoke((uint64_t)v9);
        v6[276] &= ~0x10000u;
        v7 = v10;
      }
      else
      {
        v7 = 0;
      }

      v3 = v8;
    }
  }

}

- (CGRect)adjustedTransitionViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
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
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITabBarControllerVisualStyle_Pad tabContainerView](self, "tabContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedFrameForContentTransitionViewFrame:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  void *v4;
  objc_super v6;

  -[_UITabBarControllerVisualStyle_Pad sidebar](self, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    -[_UITabBarControllerVisualStyle childViewControllerForStatusBarStyle](&v6, sel_childViewControllerForStatusBarStyle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  void *v3;
  int isSidebarSupportedAnd;
  void *v5;
  void *v6;
  uint64_t v7;

  -[_UITabBarControllerVisualStyle_Pad sidebar](self, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3);

  if (!isSidebarSupportedAnd)
    return -[_UITabBarControllerVisualStyle_Pad _effectivePartStyleForEdge:](self, "_effectivePartStyleForEdge:", 0);
  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 == 2)
    return 1;
  else
    return 2;
}

- (int64_t)preferredCenterStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle_Pad _effectivePartStyleForEdge:](self, "_effectivePartStyleForEdge:", 1);
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle_Pad _effectivePartStyleForEdge:](self, "_effectivePartStyleForEdge:", 2);
}

- (int64_t)_effectivePartStyleForEdge:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;

  -[_UITabBarControllerVisualStyle tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_selectedViewControllerInTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveStatusBarStyleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _viewControllerIfStatusBarPartStyleProviding(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  switch(a3)
  {
    case 2:
      v9 = objc_msgSend(v7, "preferredTrailingStatusBarStyle");
      goto LABEL_8;
    case 1:
      v9 = objc_msgSend(v7, "preferredCenterStatusBarStyle");
LABEL_8:
      v10 = v9;
      if (v9 != 4)
        goto LABEL_12;
      break;
    case 0:
      v9 = objc_msgSend(v7, "preferredLeadingStatusBarStyle");
      goto LABEL_8;
  }
LABEL_9:
  v11 = objc_msgSend(v6, "preferredStatusBarStyle");
  if (v11 == 1)
    v10 = 1;
  else
    v10 = 2 * (v11 == 3);
LABEL_12:

  return v10;
}

- (UIEdgeInsets)edgeInsetsForChildViewController:(id)a3
{
  _UITabContainerView *tabContainerView;
  id v5;
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
  objc_super v18;
  UIEdgeInsets result;

  tabContainerView = self->_tabContainerView;
  v5 = a3;
  if (-[_UITabContainerView canShowFloatingUI](tabContainerView, "canShowFloatingUI"))
  {
    -[_UITabContainerView edgeInsetsForChildViewController:](self->_tabContainerView, "edgeInsetsForChildViewController:", v5);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    -[_UITabBarControllerVisualStyle edgeInsetsForChildViewController:](&v18, sel_edgeInsetsForChildViewController_, v5);
  }
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)additionalContentMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[_UITabContainerView canShowFloatingUI](self->_tabContainerView, "canShowFloatingUI"))
  {
    -[_UITabContainerView additionalContentMargins](self->_tabContainerView, "additionalContentMargins");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UITabBarControllerVisualStyle_Pad;
    -[_UITabBarControllerVisualStyle additionalContentMargins](&v7, sel_additionalContentMargins);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (_UITabContainerView)tabContainerView
{
  return self->_tabContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabContainerView, 0);
}

@end
