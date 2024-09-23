@implementation UITabBarController

- (id)childViewControllerForStatusBarHidden
{
  return self->_selectedViewController;
}

uint64_t __51__UITabBarController__setViewControllers_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v5;
  objc_super v6;

  if ((*(_BYTE *)&self->_tabBarControllerFlags & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "tabBarControllerSupportedInterfaceOrientations:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarController;
    return -[UIViewController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
  }
}

- (BOOL)_isPresentationContextByDefault
{
  return 1;
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginAppearanceTransition:animated:", 1, *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "beginAppearanceTransition:animated:", 0, *(unsigned __int8 *)(a1 + 64));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1024), *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController __viewWillDisappear:]((uint64_t)v5, v3);

  -[_UITabBarControllerVisualStyle viewWillDisappear:](self->_visualStyle, "viewWillDisappear:", v3);
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[_UITabBarControllerVisualStyle edgeInsetsForChildViewController:](self->_visualStyle, "edgeInsetsForChildViewController:", a3);
  *a4 = 0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (int64_t)_effectiveTabBarPosition
{
  if (self->_tabBarPosition <= 1uLL)
    return 1;
  else
    return self->_tabBarPosition;
}

- (void)_navigationController:(id)a3 didUpdateAndObserveScrollView:(id)a4 forEdges:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((-[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation") & a5) != 0)
    -[UITabBarController _handleObservingForScrollView:sharedWithNavigationController:](self, "_handleObservingForScrollView:sharedWithNavigationController:", v8, v9);

}

- (id)_tabBarWindowForInterfaceOrientation:(id)a3
{
  if (self->_tabBar == a3)
    -[UIViewController _window](self, "_window");
  else
    objc_msgSend(a3, "window");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleObservingForScrollView:(id)a3 sharedWithNavigationController:(id)a4
{
  _DWORD *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((_UIBarsApplyChromelessEverywhere() & 1) != 0)
  {
    if (!v6)
      goto LABEL_11;
  }
  else
  {
    v7 = _UIViewControllerUseContentScrollViewAPI();
    if (!v6 || (v7 & 1) == 0)
      goto LABEL_11;
  }
  if (((v6[92] >> 1) & 3u) - 1 <= 1)
  {
    objc_msgSend(v6, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (v10)
      {
        objc_msgSend(v6, "_viewControllerForObservableScrollView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v10, v9);

      }
      else
      {
        -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:", 0, self->_tabBar);
      }
    }
  }
LABEL_11:

}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4
{
  -[UITabBarController _updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:](self, "_updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:", a3, a4, 0);
}

- (id)childViewControllerForStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle childViewControllerForStatusBarStyle](self->_visualStyle, "childViewControllerForStatusBarStyle");
}

- (void)_updateAndObserveScrollView:(id)a3 viewController:(id)a4 updateBackgroundTransitionProgressForNilScrollView:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id WeakRetained;
  int v10;
  id v11;
  BOOL v12;
  unsigned __int8 v13;

  v5 = a5;
  v8 = a3;
  v13 = 0;
  -[UITabBarController _updateObservingScrollViewWithScrollView:viewController:getTabBarRequiresStandardBackground:](self, "_updateObservingScrollViewWithScrollView:viewController:getTabBarRequiresStandardBackground:", v8, a4, &v13);
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);

    if (WeakRetained == v8)
    {
      -[_UITabBarControllerVisualStyle adjustTabBarForContentScrollView:](self->_visualStyle, "adjustTabBarForContentScrollView:", v8);
      -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:", v8, self->_tabBar);
    }
  }
  v10 = v13;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFBFFFF | (v13 << 18));
  if (v10)
    -[UITabBar _setBackgroundTransitionProgress:](self->_tabBar, "_setBackgroundTransitionProgress:", 0.0);
  v11 = objc_loadWeakRetained((id *)&self->_observingScrollView);
  if (v11)
    v12 = 1;
  else
    v12 = !v5;
  if (v12)
  {

  }
  else if (!v13)
  {
    -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:", 0, self->_tabBar);
  }

}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5
{
  -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:forceTwoPartCrossfade:completion:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:forceTwoPartCrossfade:completion:", a3, a4, a5, 0, 0);
}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4
{
  -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:", a3, a4, 0);
}

- (void)_observeScrollViewGeometryAffectingContentBottomDidChange:(id)a3
{
  -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:", a3, self->_tabBar);
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  unint64_t v6;
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  UIViewController *v16;
  void *v18;
  id *p_isa;
  BOOL v20;
  void *v21;
  UITabBarController *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[5];
  id v30;
  BOOL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) != 0)
  {
    -[UITabBarController _tabs_rebuildTabBarItemsAnimated:](self, "_tabs_rebuildTabBarItemsAnimated:", a3);
  }
  else
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem"))
      v4 = -[NSMutableArray count](self->_moreChildViewControllers, "count") != 0;
    else
      v4 = 0;
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v4);
    -[UITabBarController _viewControllersInTabBar](self, "_viewControllersInTabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems");
    tabBarControllerFlags = self->_tabBarControllerFlags;
    v8 = objc_msgSend(v5, "count");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = v6 - (*(_BYTE *)&tabBarControllerFlags & 1);
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v9);
          v16 = *(UIViewController **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v16 != self->_transientViewController || v8 == 1)
          {
            if (v12 < v13)
            {
              -[UIViewController tabBarItem](v16, "tabBarItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITabBarController _configureTargetActionForTabBarItem:](self, "_configureTargetActionForTabBarItem:", v18);
              objc_msgSend(v28, "addObject:", v18);

            }
            ++v12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_tabBarControllerFlags & 1) != 0)
    {
      -[UITabBarController moreNavigationController](self, "moreNavigationController");
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _parentViewController](p_isa);
      v22 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

      v21 = v28;
      if (v22 != self)
      {
        -[UIViewController addChildViewController:](self, "addChildViewController:", p_isa);
        objc_msgSend(p_isa, "didMoveToParentViewController:", self);
      }
      v23 = (void *)-[NSMutableArray copy](self->_moreChildViewControllers, "copy");
      objc_msgSend(p_isa, "setMoreViewControllers:", v23);
      objc_msgSend(p_isa, "tabBarItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _configureTargetActionForTabBarItem:](self, "_configureTargetActionForTabBarItem:", v24);
      objc_msgSend(v28, "addObject:", v24);

      v20 = a3;
    }
    else
    {
      -[UIMoreNavigationController _restoreOriginalNavigationController](self->_moreNavigationController, "_restoreOriginalNavigationController");
      p_isa = (id *)&self->_moreNavigationController->super.super.super.super.isa;
      self->_moreNavigationController = 0;
      v20 = a3;
      v21 = v28;
    }

    -[UITabBarController tabBar](self, "tabBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __50__UITabBarController__rebuildTabBarItemsAnimated___block_invoke;
    v29[3] = &unk_1E16B4008;
    v29[4] = self;
    v30 = v21;
    v31 = v20;
    v26 = v21;
    -[UITabBar _performWhileIgnoringLock:]((uint64_t)v25, v29);

    -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
  }
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4
{
  -[UITabBarController _hideBarWithTransition:isExplicit:duration:reason:](self, "_hideBarWithTransition:isExplicit:duration:reason:", *(_QWORD *)&a3, a4, 1, -1.0);
}

- (void)_updateObservingScrollViewWithScrollView:(id)a3 viewController:(id)a4 getTabBarRequiresStandardBackground:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  int v14;
  id WeakRetained;
  void *v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "_isViewControllerForObservableScrollViewAmbiguous") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v8, "_splitViewControllerEnforcingClass:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (-[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10 == v11))
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(v10, "_isViewControllerForObservableScrollViewAmbiguous");
    }

  }
  if (!v21 || (_UIViewControllerUseContentScrollViewAPI() & 1) == 0)
  {
    if ((objc_msgSend(v21, "_isScrollViewScrollObserver:", self) & 1) == 0)
    {
LABEL_16:
      v14 = 0;
      goto LABEL_17;
    }
LABEL_15:
    -[UITabBarController _stopObservingScrollView:](self, "_stopObservingScrollView:", v21);
    goto LABEL_16;
  }
  v12 = -[_UITabBarControllerVisualStyle shouldTrackContentScrollView:viewController:tabBarBackgroundRequired:](self->_visualStyle, "shouldTrackContentScrollView:viewController:tabBarBackgroundRequired:", v21, v8, v9);
  v13 = objc_msgSend(v21, "_isScrollViewScrollObserver:", self);
  if (!v12)
  {
    if (!v13)
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((v13 & 1) == 0)
    objc_msgSend(v21, "_addScrollViewScrollObserver:", self);
  v14 = 1;
LABEL_17:
  WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
  if (WeakRetained)
  {
    v16 = WeakRetained;
    v17 = objc_loadWeakRetained((id *)&self->_observingScrollView);
    v18 = v17 == v21 ? v14 : 0;

    if ((v18 & 1) == 0)
    {
      v19 = objc_loadWeakRetained((id *)&self->_observingScrollView);
      -[UITabBarController _stopObservingScrollView:](self, "_stopObservingScrollView:", v19);

    }
  }
  if (v14)
    v20 = v21;
  else
    v20 = 0;
  objc_storeWeak((id *)&self->_observingScrollView, v20);
  if (a5)
    *a5 = v9;

}

- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (_overrideUISplitViewControllerToCompact_onceToken != -1)
    dispatch_once(&_overrideUISplitViewControllerToCompact_onceToken, &__block_literal_global_823);
  if (_overrideUISplitViewControllerToCompact_override
    && -[_UITabBarControllerVisualStyle overrideUISplitViewControllerToCompact](self->_visualStyle, "overrideUISplitViewControllerToCompact")&& !-[UITabBarController _isBarEffectivelyHidden](self, "_isBarEffectivelyHidden")&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& objc_msgSend(v4, "style"))
  {
    +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isBarEffectivelyHidden
{
  return -[UITabBarController _wantsBarHidden](self, "_wantsBarHidden")
      || -[_UITabBarControllerVisualStyle isTabBarEffectivelyHidden](self->_visualStyle, "isTabBarEffectivelyHidden");
}

- (void)_stopObservingScrollView:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "_isScrollViewScrollObserver:", self))
    objc_msgSend(v4, "_removeScrollViewScrollObserver:", self);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
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
  void *v19;
  id v20;

  v20 = a3;
  -[_UITabBarControllerVisualStyle overlayInsetsAdjustment](self->_visualStyle, "overlayInsetsAdjustment");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UITabBarControllerVisualStyle adjustTabBarForContentScrollView:](self->_visualStyle, "adjustTabBarForContentScrollView:", v20);
  -[_UITabBarControllerVisualStyle overlayInsetsAdjustment](self->_visualStyle, "overlayInsetsAdjustment");
  if (v7 != v15 || v5 != v12 || v11 != v14 || v9 != v13)
  {
    -[UIViewController _window](self, "_window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_noteOverlayInsetsDidChange");

  }
  -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:", v20, self->_tabBar);

}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_selectedViewController;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_selectedViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_selectedViewController;
}

- (void)_configureTargetActionForTabBarItem:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTarget:", self);
  objc_msgSend(v4, "setAction:", sel__tabBarItemClicked_);

}

- (void)_navigationControllerDidUpdateStack:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation");
  objc_msgSend(v4, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_contentOrObservableScrollViewForEdge:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UITabBarController _handleObservingForScrollView:sharedWithNavigationController:](self, "_handleObservingForScrollView:sharedWithNavigationController:", v7, v4);
}

- (void)_viewDidPerformLayout
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  -[UIViewController _viewDidPerformLayout](&v11, sel__viewDidPerformLayout);
  tabBarControllerFlags = self->_tabBarControllerFlags;
  if ((*(_WORD *)&tabBarControllerFlags & 0x1000) != 0)
  {
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFEFFF);
    if (_UIViewControllerUseContentScrollViewAPI())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
      if (!WeakRetained)
        goto LABEL_5;
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)&self->_observingScrollView);
      objc_msgSend(v6, "_viewControllerForAncestor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UITabBarController _isViewControllerContainedInSelected:](self, "_isViewControllerContainedInSelected:", v7);

      if (!v8)
      {
LABEL_5:
        -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", self->_selectedViewController);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarController _updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:](self, "_updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:", v10, v9, 1);

      }
    }
  }
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4 tvSearchController:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  id v15;

  v15 = a3;
  v7 = a4;
  -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", self->_selectedViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation");
  objc_msgSend(v8, "_contentOrObservableScrollViewForEdge:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_contentOrObservableScrollViewForEdge:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v15)
    {
      v13 = -[UITabBarController _isViewControllerContainedInSelected:](self, "_isViewControllerContainedInSelected:", v7);

      if (v13)
      {
        v14 = v15;
LABEL_7:
        *(_DWORD *)&self->_tabBarControllerFlags |= 0x20000u;
        -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v15, v8);
        v10 = v15;
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  if (v10 == v15)
    goto LABEL_7;
LABEL_8:

}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
  -[UITabBarController _viewSubtreeDidGainScrollView:enclosingViewController:tvSearchController:](self, "_viewSubtreeDidGainScrollView:enclosingViewController:tvSearchController:", a3, a4, 0);
}

- (BOOL)_isViewControllerContainedInSelected:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIViewController *v10;
  UIViewController *selectedViewController;
  BOOL v12;

  v4 = (UIViewController *)a3;
  v5 = v4;
  while (v5)
  {
    -[UIViewController parentViewController](v5, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v5;
      v5 = v6;
    }
    else
    {
      -[UIViewController presentingViewController](v5, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "_presentedViewControllerProvidesContentScrollView"))
        v10 = v8;
      else
        v10 = 0;

      v5 = v10;
    }

    selectedViewController = self->_selectedViewController;
    if (v5 == selectedViewController)
    {
      if (v5)
      {
        v12 = v5 == self->_selectedViewController;

        goto LABEL_13;
      }
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
  -[UITabBarController setViewControllers:animated:](self, "setViewControllers:animated:", viewControllers, 0);
}

- (id)_viewControllerForObservableScrollView
{
  _UITabBarControllerVisualStyle *visualStyle;
  void *v3;
  void *v4;

  visualStyle = self->_visualStyle;
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](visualStyle, "viewControllerForObservableScrollViewFromViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIViewController *v9;
  UIViewController *selectedViewControllerDuringWillAppear;
  UIViewController *v11;
  objc_super v12;

  v3 = a3;
  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    if ((v8 & 1) == 0)
      -[UITabBarController _selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:](self, "_selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:", 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  -[UIViewController viewWillAppear:](&v12, sel_viewWillAppear_, v3);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  -[UIViewController __viewWillAppear:](v9, "__viewWillAppear:", v3);
  selectedViewControllerDuringWillAppear = self->_selectedViewControllerDuringWillAppear;
  self->_selectedViewControllerDuringWillAppear = v9;
  v11 = v9;

  -[_UITabBarControllerVisualStyle viewWillAppear:](self->_visualStyle, "viewWillAppear:", v3);
  -[_UITabBarControllerVisualStyle prepare](self->_visualStyle, "prepare");

}

- (void)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(int)a5 shouldSetSelected:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  UIViewControllerAnimatedTransitioning *v13;
  UIViewControllerAnimatedTransitioning *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  UIViewControllerAnimatedTransitioning *animator;
  UIViewControllerInteractiveTransitioning *interactor;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  os_signpost_id_t v31;
  os_signpost_id_t v32;
  objc_class *v33;
  const char *Name;
  objc_class *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  os_signpost_id_t v39;
  os_signpost_id_t v40;
  objc_class *v41;
  const char *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIViewController *v48;
  id v49;
  void *v51;
  BOOL v52;
  uint64_t v53;
  UIViewController **p_selectedViewController;
  void *v55;
  UIViewController *v56;
  void *v57;
  NSObject *v58;
  id WeakRetained;
  BOOL v60;
  _UITabBarControllerVisualStyle *visualStyle;
  _UIViewControllerOneToOneTransitionContext *v62;
  _UIViewControllerOneToOneTransitionContext *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  UITabBarController *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  UIViewController *v89;
  UIViewController *v90;
  UIViewController *v91;
  unint64_t v92;
  NSObject *v93;
  os_signpost_id_t v94;
  os_signpost_id_t v95;
  unint64_t v96;
  NSObject *v97;
  unint64_t v98;
  BOOL v99;
  UIViewControllerInteractiveTransitioning *v100;
  void *v101;
  int v102;
  SEL v103;
  char v104;
  UIViewController *v106;
  void *v107;
  id v108;
  void (**v109)(void);
  void *v110;
  void *v111;
  UIViewControllerAnimatedTransitioning *v112;
  void *v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[4];
  id v119;
  UITabBarController *v120;
  _UIViewControllerOneToOneTransitionContext *v121;
  void (**v122)(void);
  _BYTE *v123;
  BOOL v124;
  _QWORD v125[5];
  id v126;
  UIViewController *v127;
  UIViewController *v128;
  id v129;
  _BYTE *v130;
  char v131;
  _QWORD v132[5];
  id v133;
  _QWORD v134[5];
  _QWORD v135[4];
  id v136;
  _QWORD aBlock[4];
  UIViewController *v138;
  id v139;
  UITabBarController *v140;
  _BYTE *v141;
  BOOL v142;
  id location[2];
  _BYTE buf[24];
  char v145;
  uint64_t v146;

  v6 = a6;
  v146 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v113 = v10;
  if (v10 == v11)
    goto LABEL_121;
  v103 = a2;
  if (-[UIViewControllerAnimatedTransitioning conformsToProtocol:](self->__animator, "conformsToProtocol:", &unk_1EDED3E98))-[UIViewControllerAnimatedTransitioning interruptTabBarControllerTransition](self->__animator, "interruptTabBarControllerTransition");
  if (-[UIViewControllerAnimatedTransitioning conformsToProtocol:](self->__animator, "conformsToProtocol:", &unk_1EDDCE3D0))
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", self->__animator);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->__animator;
    v14 = v13;
    if (v12
      && -[UIViewControllerAnimatedTransitioning shouldPreemptWithContext:](v13, "shouldPreemptWithContext:", v12))
    {
      -[UIViewControllerAnimatedTransitioning preemptWithContext:](self->__animator, "preemptWithContext:", v12);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v107 = 0;
    }
    v15 = v113;

    if (!v113)
      goto LABEL_13;
  }
  else
  {
    v107 = 0;
    v15 = v10;
    if (!v10)
    {
LABEL_13:
      v19 = 0;
      goto LABEL_16;
    }
  }
  -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v16, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasBeenCommitted");

  }
  else
  {
    v19 = 0;
  }

  v15 = v113;
LABEL_16:
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v20 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 < 2 ? v19 : 0;
    if (v20 == 1)
    {
      -[UITabBarController _customAnimatorForFromViewController:toViewController:](self, "_customAnimatorForFromViewController:toViewController:", v15, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _setAnimator:](self, "_setAnimator:", v21);

    }
  }
  if (self->__animator)
  {
    -[UITabBarController _customInteractionControllerForAnimator:](self, "_customInteractionControllerForAnimator:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _setInteractor:](self, "_setInteractor:", v22);

    animator = self->__animator;
  }
  else
  {
    animator = 0;
  }
  interactor = self->__interactor;
  v99 = interactor != 0;
  v25 = animator != 0;
  v112 = animator;
  v100 = interactor;
  if (interactor
    || (-[UIViewControllerAnimatedTransitioning conformsToProtocol:](animator, "conformsToProtocol:", &unk_1EDED3E98) & 1) != 0)
  {
    v102 = 0;
  }
  else
  {
    v102 = -[UIViewControllerAnimatedTransitioning conformsToProtocol:](self->__animator, "conformsToProtocol:", &unk_1EDDCE3D0) ^ 1;
  }
  objc_msgSend(v11, "parentModalViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tabBarItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v108 = v27;
  }
  else
  {
    objc_msgSend(v11, "tabBarItem");
    v108 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v112)
  {
    v29 = qword_1ECD7B658;
    if (!qword_1ECD7B658)
    {
      v29 = __UILogCategoryGetNode("UITabBarController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1ECD7B658);
    }
    v30 = *(id *)(v29 + 8);
    v31 = os_signpost_id_make_with_pointer(*(os_log_t *)(v29 + 8), self);
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v32 = v31;
      if (os_signpost_enabled(v30))
      {
        v33 = (objc_class *)objc_opt_class();
        Name = class_getName(v33);
        v35 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = Name;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = class_getName(v35);
        _os_signpost_emit_with_name_impl(&dword_185066000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v32, "SwitchTabs", " enableTelemetry=YES  isAnimation=YES from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x16u);
      }
    }

    -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v11);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v113);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "superview");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITabBarController _layoutViewController:](self, "_layoutViewController:", v11);
  }
  else
  {
    v37 = qword_1ECD7B660;
    if (!qword_1ECD7B660)
    {
      v37 = __UILogCategoryGetNode("UITabBarController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v37, (unint64_t *)&qword_1ECD7B660);
    }
    v38 = *(id *)(v37 + 8);
    v39 = os_signpost_id_make_with_pointer(*(os_log_t *)(v37 + 8), self);
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v40 = v39;
      if (os_signpost_enabled(v38))
      {
        v41 = (objc_class *)objc_opt_class();
        v42 = class_getName(v41);
        v43 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = class_getName(v43);
        _os_signpost_emit_with_name_impl(&dword_185066000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SwitchTabs", " enableTelemetry=YES from=%{signpost.telemetry:string1,public}s to=%{public, signpost.telemetry:string2,public}s", buf, 0x16u);
      }
    }

    -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", v108);
    -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v11);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _wrapperViewForViewController:](self, "_wrapperViewForViewController:", v11);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_contentOrObservableScrollViewForEdge:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[UIViewController navigationController](self, "navigationController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setNeedsLayout");

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v145 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke;
  aBlock[3] = &unk_1E16BFEB0;
  v48 = (UIViewController *)v11;
  v138 = v48;
  v142 = v25;
  v49 = v113;
  v139 = v49;
  v140 = self;
  v141 = buf;
  v109 = (void (**)(void))_Block_copy(aBlock);
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 3 >= 0xFFFFFFFE && v112 == 0)
    v109[2]();
  if (!v110
    || (-[UITabBarController _viewForViewController:](self, "_viewForViewController:", v48),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        v52 = v110 == v51,
        v51,
        !v52))
  {
    -[UITabBarController _wrapperViewForViewController:](self, "_wrapperViewForViewController:", v48);
    v53 = objc_claimAutoreleasedReturnValue();

    v111 = (void *)v53;
  }
  p_selectedViewController = &self->_selectedViewController;
  v106 = self->_selectedViewController;
  if (!v6)
    goto LABEL_69;
  -[UITabBarController allViewControllers](self, "allViewControllers");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "containsObject:", v48))
  {
    v56 = v48;
  }
  else
  {
    -[UIViewController presentingViewController](v48, "presentingViewController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "containsObject:", v57))
    {
      -[UIViewController presentingViewController](v48, "presentingViewController");
      v56 = (UIViewController *)(id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v56 = 0;
    }

  }
  if (dyld_program_sdk_at_least())
  {
    if (v56)
      goto LABEL_66;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v58, "handleFailureInMethod:object:file:lineNumber:description:", v103, self, CFSTR("UITabBarController.m"), 4291, CFSTR("Attempting to select a view controller that isn't a child! %@"), 0);
  }
  else
  {
    if (v56)
      goto LABEL_66;
    v98 = qword_1ECD7B668;
    if (!qword_1ECD7B668)
    {
      v98 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v98, (unint64_t *)&qword_1ECD7B668);
    }
    v58 = *(id *)(v98 + 8);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = 0;
      _os_log_impl(&dword_185066000, v58, OS_LOG_TYPE_ERROR, "Attempting to select a view controller that isn't a child! %@", (uint8_t *)location, 0xCu);
    }
  }

LABEL_66:
  objc_storeStrong((id *)&self->_selectedViewController, v56);
  -[UITabBarController _compatibility_updateViewController:forTabBarObservedScrollView:](self, "_compatibility_updateViewController:forTabBarObservedScrollView:", *p_selectedViewController, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
  v60 = WeakRetained == 0;

  if (!v60 && (_UIViewControllerUseContentScrollViewAPI() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_185066000, v97, OS_LOG_TYPE_FAULT, "Unexpected non-nil _observingScrollView only accessible on tvOS for this OS version", (uint8_t *)location, 2u);
      }
    }
    else
    {
      v96 = qword_1ECD7B670;
      if (!qword_1ECD7B670)
      {
        v96 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v96, (unint64_t *)&qword_1ECD7B670);
      }
      v97 = *(id *)(v96 + 8);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_185066000, v97, OS_LOG_TYPE_ERROR, "Unexpected non-nil _observingScrollView only accessible on tvOS for this OS version", (uint8_t *)location, 2u);
      }
    }

  }
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x1000u;

LABEL_69:
  if (dyld_program_sdk_at_least()
    && *(_BYTE *)(*(_QWORD *)&buf[8] + 24)
    && *p_selectedViewController == v48)
  {
    objc_initWeak(location, self);
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_316;
    v135[3] = &unk_1E16BFED8;
    objc_copyWeak(&v136, location);
    -[UIViewController _performAtViewIsAppearing:]((uint64_t)v48, v135);
    objc_destroyWeak(&v136);
    objc_destroyWeak(location);
    v104 = 1;
  }
  else
  {
    v104 = 0;
  }
  visualStyle = self->_visualStyle;
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2;
  v134[3] = &unk_1E16B3FD8;
  v134[4] = self;
  if (-[_UITabBarControllerVisualStyle transitionFromViewController:toViewController:animated:completion:](visualStyle, "transitionFromViewController:toViewController:animated:completion:", v49, v48, v112 != 0, v134))
  {
    v62 = 0;
  }
  else
  {
    if (v112)
    {
      v63 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      -[_UIViewControllerTransitionContext _setIsAnimated:](v63, "_setIsAnimated:", 1);
      -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v63, "_setFromViewController:", v49);
      -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v63, "_setToViewController:", v48);
      -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v49);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerOneToOneTransitionContext _setFromView:](v63, "_setFromView:", v64);

      -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v48);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIViewControllerOneToOneTransitionContext _setToView:](v63, "_setToView:", v65);

      -[_UIViewControllerTransitionContext _setContainerView:](v63, "_setContainerView:", v111);
      -[UIViewController view](v48, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "frame");
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v63, "_setToEndFrame:");

      objc_msgSend(v49, "view");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "frame");
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v63, "_setFromStartFrame:");

      v68 = *MEMORY[0x1E0C9D648];
      v69 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v70 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v71 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v63, "_setToStartFrame:", *MEMORY[0x1E0C9D648], v69, v70, v71);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v63, "_setFromEndFrame:", v68, v69, v70, v71);
      -[_UIViewControllerTransitionContext _setAnimator:](v63, "_setAnimator:", self->__animator);
      -[_UIViewControllerTransitionContext _setInteractor:](v63, "_setInteractor:", self->__interactor);
      -[UITabBarController _suspendAllTabBarBackgroundUpdates](self, "_suspendAllTabBarBackgroundUpdates");
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20000u;
      if (v102)
      {
        -[UIViewController view](self, "view");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setUserInteractionEnabled:", 0);

      }
      v73 = (void *)MEMORY[0x1E0CB3940];
      v74 = self;
      v75 = (void *)MEMORY[0x1E0CB3940];
      v76 = (objc_class *)objc_opt_class();
      NSStringFromClass(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringWithFormat:", CFSTR("<%@: %p>"), v77, v74);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v73, "stringWithFormat:", CFSTR("UITabBarControllerTransition: %@"), v78);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController view](v74, "view");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "window");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _acquireOrientationLockAssertionWithReason:](v80, v101);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
      {
        -[UITabBarController transitionCoordinator](v74, "transitionCoordinator");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v132[0] = MEMORY[0x1E0C809B0];
        v132[1] = 3221225472;
        v132[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3;
        v132[3] = &unk_1E16B2E68;
        v132[4] = v74;
        v133 = v108;
        objc_msgSend(v82, "notifyWhenInteractionChangesUsingBlock:", v132);

      }
      else
      {
        -[UITabBarController _setSelectedTabBarItem:](v74, "_setSelectedTabBarItem:", v108);
      }
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4;
      v125[3] = &unk_1E16BFF00;
      v125[4] = v74;
      v126 = v49;
      v130 = buf;
      v127 = v48;
      v128 = v106;
      v84 = v81;
      v129 = v84;
      v131 = v102;
      -[_UIViewControllerTransitionContext _setCompletionHandler:](v63, "_setCompletionHandler:", v125);
      -[UIViewControllerAnimatedTransitioning transitionDuration:](self->__animator, "transitionDuration:", v63);
      -[_UIViewControllerTransitionContext _setDuration:](v63, "_setDuration:");
      v85 = (void *)UIApp;
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_323;
      v118[3] = &unk_1E16BFF28;
      v119 = v107;
      v120 = v74;
      v62 = v63;
      v121 = v62;
      v123 = buf;
      v122 = v109;
      v124 = v99;
      objc_msgSend(v85, "_performBlockAfterCATransactionCommits:", v118);

    }
    else
    {
      -[UITabBarController _transitionView](self, "_transitionView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "transition:toView:", a5, v111);

      -[UITabBarController set_shouldFocusViewControllerAfterTransition:](self, "set_shouldFocusViewControllerAfterTransition:", 0);
      v62 = 0;
    }
    if (!a5)
    {
      objc_msgSend(v111, "frame");
      objc_msgSend(v111, "setFrame:");
    }
  }
  objc_opt_class();
  v86 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v87 = v86;
  else
    v87 = 0;
  v88 = v87;

  objc_opt_class();
  v89 = v48;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v90 = v89;
  else
    v90 = 0;
  v91 = v90;

  if (v88)
  {
    -[UIViewController _updateBottomBarHiddenStateFromOtherNavigationController:](v91, "_updateBottomBarHiddenStateFromOtherNavigationController:", v88);
    objc_msgSend(v88, "_resetBottomBarHiddenState");
    -[UITabBarController _showBarWithTransition:isExplicit:reason:](self, "_showBarWithTransition:isExplicit:reason:", 0, 0, 2);
  }
  if (v91)
    -[UIViewController _updateBottomBarHiddenState](v91, "_updateBottomBarHiddenState");
  if (!v112 && ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    if (v113 && (objc_msgSend(v86, "appearanceTransitionsAreDisabled") & 1) == 0)
    {
      objc_initWeak(location, v86);
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_5;
      v116[3] = &unk_1E16B3F40;
      objc_copyWeak(&v117, location);
      objc_msgSend(v86, "setAfterAppearanceBlock:", v116);
      if (+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions"))
        objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", v86);
      else
        objc_msgSend(v86, "_executeAfterAppearanceBlock");
      objc_destroyWeak(&v117);
      objc_destroyWeak(location);
    }
    if (v89
      && -[UIViewController _hasAppeared](self, "_hasAppeared")
      && !-[UIViewController appearanceTransitionsAreDisabled](v89, "appearanceTransitionsAreDisabled"))
    {
      objc_initWeak(location, v89);
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_6;
      v114[3] = &unk_1E16B3F40;
      objc_copyWeak(&v115, location);
      -[UIViewController setAfterAppearanceBlock:](v89, "setAfterAppearanceBlock:", v114);
      if (+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions"))
        objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", v89);
      else
        -[UIViewController _executeAfterAppearanceBlock](v89, "_executeAfterAppearanceBlock");
      objc_destroyWeak(&v115);
      objc_destroyWeak(location);
    }
  }
  if ((v104 & 1) == 0)
    -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
  if (!v112)
  {
    v92 = qword_1ECD7B678;
    if (!qword_1ECD7B678)
    {
      v92 = __UILogCategoryGetNode("UITabBarController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v92, (unint64_t *)&qword_1ECD7B678);
    }
    v93 = *(id *)(v92 + 8);
    v94 = os_signpost_id_make_with_pointer(*(os_log_t *)(v92 + 8), self);
    if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v95 = v94;
      if (os_signpost_enabled(v93))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v93, OS_SIGNPOST_INTERVAL_END, v95, "SwitchTabs", ", (uint8_t *)location, 2u);
      }
    }

  }
  _Block_object_dispose(buf, 8);

LABEL_121:
}

- (void)_layoutViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  UIViewController *v14;

  v14 = (UIViewController *)a3;
  -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _frameForWrapperViewForViewController:](self, "_frameForWrapperViewForViewController:", v14);
  objc_msgSend(v5, "setFrame:");
  -[UITabBarController _frameForViewController:](self, "_frameForViewController:", v14);
  objc_msgSend(v4, "setFrame:");
  -[UIViewController view](v14, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    objc_msgSend(v4, "frame");
    v8 = v7;
    objc_msgSend(v4, "frame");
    v10 = v9;
    -[UIViewController view](v14, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v8, v10);

  }
  -[UIViewController _bottomBarInsetGuideConstraint](v14, "_bottomBarInsetGuideConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIViewController view](v14, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

  }
  if (self->_selectedViewController == v14)
    -[UITabBarController _compatibility_updateViewController:forTabBarObservedScrollView:](self, "_compatibility_updateViewController:forTabBarObservedScrollView:", v14, 0);

}

- (id)_viewForViewController:(id)a3
{
  return (id)objc_msgSend(a3, "view");
}

- (CGRect)_frameForWrapperViewForViewController:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITabBarController _transitionView](self, "_transitionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_transitionView
{
  return self->_viewControllerTransitionView;
}

- (CGRect)_frameForViewController:(id)a3
{
  id v4;
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
  int64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  char v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  v4 = a3;
  -[UIView bounds](self->_viewControllerTransitionView, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIViewController _statusBarHeightForCurrentInterfaceOrientation](self, "_statusBarHeightForCurrentInterfaceOrientation");
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = -[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition");
    v16 = -[UITabBar _isTranslucent](self->_tabBar, "_isTranslucent");
    v17 = objc_msgSend(v4, "edgesForExtendedLayout");
    if (-[UIView isHidden](self->_tabBar, "isHidden"))
    {
      v18 = 0;
    }
    else
    {
      v19 = 4;
      if (v15 == 2)
        v19 = 1;
      v20 = (v17 & v19) == 0;
      v18 = v20;
      v21 = v20 || v16;
      if ((v21 & 1) == 0)
        v18 = objc_msgSend(v4, "extendedLayoutIncludesOpaqueBars") ^ 1;
    }
    v22 = -[UIView isHidden](self->_tabBar, "isHidden") | v18;
    if ((v18 & 1) != 0 || (v23 = 0.0, !v22))
    {
      -[UITabBar sizeThatFits:](self->_tabBar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v23 = v24;
    }
    if (-[UITabBarController _isModernTVTabBar](self, "_isModernTVTabBar"))
      v23 = 157.0;
    if (v18)
    {
      v6 = v6 + 0.0;
      v12 = v12 - (v23 + 0.0);
      if (-[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition") == 2)
        v8 = v8 + v23;
      else
        v8 = v8 + 0.0;
    }
    if (objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren"))
    {
      v25 = -0.0;
      if (v22)
        v26 = -0.0;
      else
        v26 = v23;
      if (v15 == 2)
        v25 = v26;
      v27 = v14 + v25;
      if (v15 == 2)
        v28 = 1;
      else
        v28 = v22;
      if (v28)
        v29 = 0.0;
      else
        v29 = v23;
      objc_msgSend(v4, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v27, 0.0, v29, 0.0, -1.79769313e308, -1.79769313e308);
    }
  }
  -[_UITabBarControllerVisualStyle adjustedContentViewFrame:viewController:](self->_visualStyle, "adjustedContentViewFrame:viewController:", v4, v6, v8, v10, v12);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (BOOL)_isModernTVTabBar
{
  return 0;
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  id v3;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateLayoutForStatusBarAndInterfaceOrientation");
  if ((objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren") & 1) == 0)
  {
    -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
    objc_msgSend(v3, "_updateContentOverlayInsetsFromParentIfNecessary");
  }
  -[UITabBarController _layoutViewController:](self, "_layoutViewController:", v3);

}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
  -[UITabBarController _showBarWithTransition:isExplicit:duration:reason:](self, "_showBarWithTransition:isExplicit:duration:reason:", *(_QWORD *)&a3, a4, 1, a5);
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4
{
  -[UITabBarController _showBarWithTransition:isExplicit:duration:](self, "_showBarWithTransition:isExplicit:duration:", *(_QWORD *)&a3, a4, -1.0);
}

- (void)_selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[UITabBarController viewControllers](self, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[UITabBarController viewControllers](self, "viewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3)
        objc_msgSend(v13, "setAppearanceTransitionsAreDisabled:", 1);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __87__UITabBarController__selectDefaultViewControllerIfNecessaryWithAppearanceTransitions___block_invoke;
      v19[3] = &unk_1E16B1B50;
      v19[4] = self;
      v18 = v13;
      v20 = v18;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
      if (!a3)
        objc_msgSend(v18, "setAppearanceTransitionsAreDisabled:", 0);

      goto LABEL_16;
    }
  }
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    return;
  v7 = v6;
  if ((*(_BYTE *)&self->_tabBarControllerFlags & 0x40) != 0)
  {

LABEL_14:
    -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _wrapperViewForViewController:](self, "_wrapperViewForViewController:", v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[UITabBarController _transitionView](self, "_transitionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transition:toView:", 0, v18);

    if ((*(_BYTE *)&self->_tabBarControllerFlags & 0x40) != 0)
    {
      -[UITabBarController _rebuildTabBarItemsIfNeeded](self, "_rebuildTabBarItemsIfNeeded");
      -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tabBarItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", v17);

      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x40u;
    }
LABEL_16:

    return;
  }
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_existingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_14;
}

- (NSUInteger)selectedIndex
{
  NSUInteger v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (self->_transientViewController)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[UITabBarController _viewControllersInTabBar](self, "_viewControllersInTabBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4);

  }
  -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v7 && v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_moreChildViewControllers, "indexOfObjectIdenticalTo:", v4);
    v2 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v2 = v8 + -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems") - 1;
  }

  return v2;
}

- (UIViewController)selectedViewController
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    objc_msgSend(v3, "displayedViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }

  return (UIViewController *)v3;
}

- (id)_selectedViewControllerInTabBar
{
  UIViewController *transientViewController;

  transientViewController = self->_transientViewController;
  if (!transientViewController)
    transientViewController = self->_selectedViewController;
  return transientViewController;
}

- (id)_existingMoreNavigationController
{
  if ((*(_BYTE *)&self->_tabBarControllerFlags & 1) != 0)
    return self->_moreNavigationController;
  else
    return 0;
}

- (id)allViewControllers
{
  void *v3;
  void *v4;
  id v5;
  UIMoreNavigationController *moreNavigationController;
  UIMoreNavigationController *v7;

  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_moreChildViewControllers, "count"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    v5 = v4;
    moreNavigationController = self->_moreNavigationController;
    if (moreNavigationController)
    {
      objc_msgSend(v4, "lastObject");
      v7 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();

      if (moreNavigationController != v7)
        objc_msgSend(v5, "addObject:", self->_moreNavigationController);
    }
    objc_msgSend(v5, "addObjectsFromArray:", self->_moreChildViewControllers);
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)_setSelectedTabBarItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UITabBarController tabBar](self, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__UITabBarController__setSelectedTabBarItem___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UITabBar _performWhileIgnoringLock:]((uint64_t)v5, v7);

}

- (void)transitionViewDidStart:(id)a3
{
  void *v4;
  id v5;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "_prepareForContainerTransition:", self);
    v4 = v5;
  }

}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  if (self->_viewControllerTransitionView == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isDescendantOfView:", v9);

      if (v12 != v8 && (v10 & 1) == 0)
        -[UIViewControllerWrapperView unwrapView](v12);
    }
    if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x10) != 0)
    {
      -[UIViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

    }
  }

}

- (void)set_shouldFocusViewControllerAfterTransition:(BOOL)a3
{
  self->__shouldFocusViewControllerAfterTransition = a3;
}

- (id)_wrapperViewForViewController:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  void *v18;

  v4 = a3;
  -[UITabBarController _frameForWrapperViewForViewController:](self, "_frameForWrapperViewForViewController:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITabBarController _viewForViewController:](self, "_viewForViewController:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  +[UIViewControllerWrapperView wrapperViewForView:wrapperFrame:viewFrame:](v6, v8, v10, v12, v14, v15, v16, v17, (uint64_t)UIViewControllerWrapperView, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _layoutViewController:](self, "_layoutViewController:", v4);

  return v18;
}

- (void)_setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__animator, a3);
}

- (id)_customAnimatorForFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "tabBarController:animatorForFromViewController:toViewController:", self, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_7:
      -[_UITabBarControllerVisualStyle defaultAnimatorForFromViewController:toViewController:](self->_visualStyle, "defaultAnimatorForFromViewController:toViewController:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(WeakRetained, "tabBarController:animationControllerForTransitionFromViewController:toViewController:", self, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (!v9)
    goto LABEL_7;
LABEL_8:

  return v10;
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  -[UIResponder setRestorationIdentifier:](&v4, sel_setRestorationIdentifier_, a3);
  -[UITabBarController _setMoreNavigationControllerRestorationIdentifier](self, "_setMoreNavigationControllerRestorationIdentifier");
}

- (void)updateTabBarItemForViewController:(id)a3
{
  UIViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _UITabModel *v8;
  void *v9;
  UIViewController *v10;
  uint64_t v11;
  void *v12;
  UIViewController *v13;
  void *v14;
  UIViewController *v15;
  _QWORD v16[4];
  UIViewController *v17;

  v4 = (UIViewController *)a3;
  if ((*(_BYTE *)&self->_tabBarControllerFlags & 2) == 0)
  {
    v15 = v4;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v15);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_moreChildViewControllers, "indexOfObjectIdenticalTo:", v15);
    if (self->_transientViewController != v15 || objc_msgSend(v5, "count") == 1)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UITabBarController _rebuildTabModelAnimated:](self, "_rebuildTabModelAnimated:", 1);
      }
      else
      {
        -[UIViewController _resolvedTab](v15, "_resolvedTab");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "_isMoreTab") & 1) == 0 && (*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) == 0)
        {
          v8 = self->_tabModel;
          -[_UITabModel tabItems](v8, "tabItems");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __56__UITabBarController_updateTabBarItemForViewController___block_invoke;
          v16[3] = &unk_1E16BFD48;
          v10 = v15;

          v17 = v10;
          v11 = objc_msgSend(v9, "indexOfObjectPassingTest:", v16);

          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
            -[UIViewController _existingView](self, "_existingView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setNeedsLayout");

          }
          else
          {
            -[_UITabModel replaceItemAtIndex:withItem:](self->_tabModel, "replaceItemAtIndex:withItem:", v11, v7);
          }

        }
        -[_UITabBarControllerVisualStyle updateTabForChildViewController:](self->_visualStyle, "updateTabForChildViewController:", v15);
        -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
        v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (v13 == v15)
        {
          -[UIViewController tabBarItem](v15, "tabBarItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", v14);

        }
      }
    }

    v4 = v15;
  }

}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  UITabBarController *v32;
  void *v33;
  void *v34;
  NSMutableArray *moreChildViewControllers;
  UITabBarController *v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  char v53;
  _UITabModel *tabModel;
  uint64_t v55;
  void *v56;
  _UITabModel *v57;
  void *v58;
  int v59;
  UITabBarController *v60;
  char v61;
  UIViewController *selectedViewController;
  UIViewController *v63;
  uint64_t v64;
  unint64_t v65;
  int v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  id obj;
  void *v75;
  UITabBarController *v76;
  _QWORD v77[6];
  _QWORD v78[5];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v69 = a4;
  v95 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_UITabBarControllerVisualStyle willUpdateViewControllers](self->_visualStyle, "willUpdateViewControllers");
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v89 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "_setViewHostsLayoutEngine:", 1);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v9);
  }

  -[UITabBarController transientViewController](self, "transientViewController");
  v12 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v12;
  if (v12)
  {
    v13 = objc_msgSend(v7, "indexOfObject:", v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v13;
      v15 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v15, "removeObjectAtIndex:", v14);

      v7 = v15;
    }
    -[UITabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", 0, 0);
    v69 = 0;
  }
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    v66 = -[NSMutableArray containsObject:](self->_moreChildViewControllers, "containsObject:", v16);
  else
    v66 = 0;
  v65 = -[UITabBarController selectedIndex](self, "selectedIndex");
  v17 = objc_msgSend(v6, "count");
  v73 = -[NSMutableArray count](self->_moreChildViewControllers, "count");
  v18 = -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems");
  v68 = (void *)v16;
  if (-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem"))
    v19 = objc_msgSend(v7, "count") > v18;
  else
    v19 = 0;
  v76 = self;
  if (!-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem")
    && objc_msgSend(v7, "count") > v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ is trying to set %@ view controllers when only %@ view controllers are supported on this platform. Any additional view controllers will not be shown."), v76, v20, v21);

    self = v76;
  }
  v75 = v6;
  v86 = 0u;
  v87 = 0u;
  v71 = v18 - 1;
  if (v19)
    v22 = v18 - 1;
  else
    v22 = v18;
  v84 = 0uLL;
  v85 = 0uLL;
  obj = v7;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = 0;
    v27 = *(_QWORD *)v85;
    v70 = 1 - v18;
    v72 = *(_QWORD *)v85;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v85 != v27)
          objc_enumerationMutation(obj);
        v29 = v26 + v28;
        v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v28);
        if (v26 + v28 >= v22)
        {
          if (v29 < v17 && !(v70 + v26 + v28))
          {
            objc_msgSend(v75, "objectAtIndex:", v71);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "removeObjectAtIndex:", v71);
            if (objc_msgSend(v75, "indexOfObjectIdenticalTo:", v34) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v34, "willMoveToParentViewController:", 0);
              -[UIViewController _removeChildViewController:](v76, "_removeChildViewController:", v34);
              objc_msgSend(v34, "didMoveToParentViewController:", 0);
            }

            self = v76;
            v27 = v72;
          }
          moreChildViewControllers = self->_moreChildViewControllers;
          if (v25 >= v73)
            -[NSMutableArray addObject:](moreChildViewControllers, "addObject:", v30);
          else
            -[NSMutableArray replaceObjectAtIndex:withObject:](moreChildViewControllers, "replaceObjectAtIndex:withObject:", v25, v30);
          ++v25;
        }
        else if (v29 >= v17)
        {
          -[UIMoreNavigationController restoreOriginalNavigationControllerIfNecessary:](self->_moreNavigationController, "restoreOriginalNavigationControllerIfNecessary:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v28));
          objc_msgSend(v30, "parentViewController");
          v36 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

          v37 = v36 == v76;
          self = v76;
          if (v37)
          {
            objc_msgSend(v75, "addObject:", v30);
          }
          else
          {
            -[UIViewController addChildViewController:](v76, "addChildViewController:", v30);
            objc_msgSend(v30, "didMoveToParentViewController:", v76);
          }
        }
        else
        {
          objc_msgSend(v75, "objectAtIndex:", v26 + v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30 != v31)
          {
            objc_msgSend(v75, "replaceObjectAtIndex:withObject:", v26 + v28, v30);
            -[UIMoreNavigationController restoreOriginalNavigationControllerIfNecessary:](v76->_moreNavigationController, "restoreOriginalNavigationControllerIfNecessary:", v30);
            if (objc_msgSend(obj, "indexOfObjectIdenticalTo:", v31) == 0x7FFFFFFFFFFFFFFFLL)
              -[UIViewController _removeChildViewController:](v76, "_removeChildViewController:", v31);
            objc_msgSend(v30, "parentViewController");
            v32 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

            if (v32 != v76)
            {
              objc_msgSend(v30, "parentViewController");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v30, "willMoveToParentViewController:", 0);
                objc_msgSend(v30, "removeFromParentViewController");
              }
              objc_msgSend(v30, "willMoveToParentViewController:", v76);
              -[UITabBarController _addChildViewController:](v76, "_addChildViewController:", v30);
              objc_msgSend(v30, "didMoveToParentViewController:", v76);
            }
          }

          self = v76;
          v27 = v72;
        }
        ++v28;
      }
      while (v24 != v28);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      v24 = v38;
      v26 += v28;
    }
    while (v38);
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }

  if (v26 < v17 && v26 < v22)
  {
    do
    {
      objc_msgSend(v75, "objectAtIndex:", v26);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "removeObjectAtIndex:", v26);
      if (objc_msgSend(v75, "indexOfObjectIdenticalTo:", v39) == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v39, "willMoveToParentViewController:", 0);
        -[UIViewController _removeChildViewController:](self, "_removeChildViewController:", v39);
        objc_msgSend(v39, "didMoveToParentViewController:", 0);
      }
      --v17;

    }
    while (v26 < v17);
  }
  v40 = v73 - v25;
  if (v73 > v25)
    -[NSMutableArray removeObjectsInRange:](self->_moreChildViewControllers, "removeObjectsInRange:", v25, v40);
  -[UITabBarController _rebuildTabModelAnimated:](self, "_rebuildTabModelAnimated:", v69, v40);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v41 = self->_moreChildViewControllers;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v81 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(v75, "removeObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j));
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v43);
  }

  -[UITabBarController _viewControllersInTabBar](self, "_viewControllersInTabBar");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");
  v48 = v68;
  if (!v68 || !v47)
  {
    v50 = v67;
    if (!v47)
      goto LABEL_112;
    if (!v68)
    {
      v51 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_82;
    }
LABEL_76:
    v51 = objc_msgSend(v46, "indexOfObject:", v68);
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[NSMutableArray containsObject:](self->_moreChildViewControllers, "containsObject:", v68))
        v52 = v68;
      else
        v52 = 0;
      v51 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_83;
    }
LABEL_82:
    v52 = 0;
    if (!self)
    {
      v53 = 1;
      tabModel = 0;
      goto LABEL_84;
    }
LABEL_83:
    v53 = 0;
    tabModel = self->_tabModel;
LABEL_84:
    -[_UITabModel selectedItem](tabModel, "selectedItem");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    if (v51 == 0x7FFFFFFFFFFFFFFFLL && v55)
    {
      if ((v53 & 1) != 0)
        v57 = 0;
      else
        v57 = self->_tabModel;
      -[_UITabModel tabItems](v57, "tabItems");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v58, "indexOfObject:", v56);

      self = v76;
    }
    if (!v52 && v51 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v51 = v65;
      if (v65 >= objc_msgSend(v46, "count"))
      {
        v51 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_98;
      }
      -[UITabBarController _viewControllerForSelectAtIndex:](self, "_viewControllerForSelectAtIndex:", v65);
      v52 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v52)
    {
      v59 = -[NSMutableArray containsObject:](self->_moreChildViewControllers, "containsObject:", v52);
      v60 = self;
      v61 = v59;
      if (v66 == v59)
      {
        if (!v59)
          goto LABEL_96;
      }
      else
      {
        selectedViewController = v60->_selectedViewController;
        v60->_selectedViewController = 0;

        if ((v61 & 1) == 0)
        {
LABEL_96:
          self = v76;
LABEL_101:
          if (v51 == 0x7FFFFFFFFFFFFFFFLL)
            v64 = 0;
          else
            v64 = v51;
          if (v69)
          {
            -[UITabBarController setSelectedIndex:](self, "setSelectedIndex:", v64);
          }
          else
          {
            v77[0] = MEMORY[0x1E0C809B0];
            v77[1] = 3221225472;
            v77[2] = __51__UITabBarController__setViewControllers_animated___block_invoke_2;
            v77[3] = &unk_1E16B1888;
            v77[4] = self;
            v77[5] = v64;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v77);
          }
          goto LABEL_111;
        }
      }
      if (v69)
      {
        self = v76;
        -[UITabBarController setSelectedViewController:](v76, "setSelectedViewController:", v52);
      }
      else
      {
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __51__UITabBarController__setViewControllers_animated___block_invoke;
        v78[3] = &unk_1E16B1B50;
        self = v76;
        v78[4] = v76;
        v52 = v52;
        v79 = v52;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v78);

      }
LABEL_111:

      v48 = v68;
      goto LABEL_112;
    }
LABEL_98:
    if (v66)
    {
      v63 = self->_selectedViewController;
      self->_selectedViewController = 0;

    }
    v52 = 0;
    goto LABEL_101;
  }
  -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v67;
  if (v68 != v49)
    goto LABEL_76;
LABEL_112:
  -[UITabBarController setCustomizableViewControllers:](self, "setCustomizableViewControllers:", obj);
  if (v50)
    -[UITabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", v50, 0);

}

- (id)_viewControllerForSelectAtIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL || self->_transientViewController == 0)
  {
    v4 = a3;
    v6 = -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems");
    if (v4 + 2 > v6 && (*(_BYTE *)&self->_tabBarControllerFlags & 1) != 0)
    {
      v4 = v4 - v6 + 1;
      v7 = self->_moreChildViewControllers;
    }
    else
    {
      -[UITabBarController _viewControllersInTabBar](self, "_viewControllersInTabBar");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL || v4 >= -[NSMutableArray count](v7, "count"))
    {
      v8 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)_effectiveMaxItems
{
  unint64_t customMaxItems;

  customMaxItems = self->_customMaxItems;
  if (!customMaxItems)
    return self->_defaultMaxItems;
  return customMaxItems;
}

- (id)transientViewController
{
  return self->_transientViewController;
}

- (void)setCustomizableViewControllers:(NSArray *)customizableViewControllers
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  id v8;

  if (self->_customizableViewControllers != customizableViewControllers)
  {
    v4 = customizableViewControllers;
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    v6 = self->_customizableViewControllers;
    self->_customizableViewControllers = v5;

    v7 = -[NSArray count](v4, "count");
    -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsCustomizing:", v7 != 0);

  }
}

- (BOOL)_isTabBarController
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController __viewDidDisappear:]((uint64_t)v5, v3);

  -[_UITabBarControllerVisualStyle viewDidDisappear:](self->_visualStyle, "viewDidDisappear:", v3);
  if (-[_UITabBarControllerVisualStyle removeTabBarFocusedOnViewDidDisappear](self->_visualStyle, "removeTabBarFocusedOnViewDidDisappear"))
  {
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x200u;
  }
  -[_UITabBarControllerVisualStyle teardown](self->_visualStyle, "teardown");
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  unint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set_shouldFocusViewControllerAfterTransition:", 0);
  v6 = v5;
  if ((_DWORD)a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewForViewController:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 48), "endAppearanceTransition");
      objc_msgSend(*(id *)(a1 + 40), "endAppearanceTransition");
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "_containsFirstResponder") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "_viewControllerWasSelected");
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 48), "cancelBeginAppearanceTransition");
      objc_msgSend(*(id *)(a1 + 40), "cancelBeginAppearanceTransition");
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1024), *(id *)(a1 + 40));
    }
    objc_msgSend(*(id *)(a1 + 32), "_viewForViewController:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 48), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1000), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_compatibility_updateViewController:forTabBarObservedScrollView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000), 0);
  }
  objc_msgSend(v6, "_postInteractiveCompletionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "_postInteractiveCompletionHandler");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();

    objc_msgSend(v6, "_setPostInteractiveCompletionHandler:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "animationEnded:", a3);
  objc_msgSend(v6, "_setTransitionIsInFlight:", 0);
  objc_msgSend(v6, "_setInteractor:", 0);
  objc_msgSend(v6, "_setAnimator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setAnimator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setInteractor:", 0);
  objc_msgSend(*(id *)(a1 + 64), "_invalidate");
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInteractionEnabled:", 1);

  }
  v14 = _UIInternalPreference_IgnoreFloatingTabBarLinkCheck_block_invoke___s_category;
  if (!_UIInternalPreference_IgnoreFloatingTabBarLinkCheck_block_invoke___s_category)
  {
    v14 = __UILogCategoryGetNode("UITabBarController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&_UIInternalPreference_IgnoreFloatingTabBarLinkCheck_block_invoke___s_category);
  }
  v15 = *(id *)(v14 + 8);
  v16 = os_signpost_id_make_with_pointer(*(os_log_t *)(v14 + 8), *(const void **)(a1 + 32));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v15))
    {
      v18[0] = 67109120;
      v18[1] = a3;
      _os_signpost_emit_with_name_impl(&dword_185066000, v15, OS_SIGNPOST_INTERVAL_END, v17, "SwitchTabs", "didComplete=%{attribute}d done with transition", (uint8_t *)v18, 8u);
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITabBarController;
  -[UIViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _updateLayoutForTraitCollection:](self, "_updateLayoutForTraitCollection:", v5);

  if (dyld_program_sdk_at_least())
  {
    v6 = objc_msgSend(v4, "horizontalSizeClass");
    -[UIViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");

    if (v6 != v8)
    {
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
      -[UITabBarController _prepareTabBar](self, "_prepareTabBar");
    }
  }

}

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITabBarController;
  -[UIViewController _willChangeToIdiom:onScreen:](&v10, sel__willChangeToIdiom_onScreen_, a3, a4);
  -[UIViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", a3, 0x1E1A99498);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITabBarController _updateVisualStyleForTraitCollection:](self, "_updateVisualStyleForTraitCollection:", v7);
  -[UITabBarController _updateLayoutForTraitCollection:](self, "_updateLayoutForTraitCollection:", v7);
  v8 = -[UITabBarController _wantsBarHidden](self, "_wantsBarHidden");
  v9 = ((unint64_t)self->_tabBarControllerFlags >> 2) & 3;
  if (v8)
    -[UITabBarController _hideBarWithTransition:isExplicit:reason:](self, "_hideBarWithTransition:isExplicit:reason:", 0, 0, v9);
  else
    -[UITabBarController _showBarWithTransition:isExplicit:reason:](self, "_showBarWithTransition:isExplicit:reason:", 0, 0, v9);

}

- (void)setSelectedViewController:(UIViewController *)selectedViewController
{
  void *v4;
  char v5;
  UIViewController *v6;

  v6 = selectedViewController;
  -[UITabBarController allViewControllers](self, "allViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if ((v5 & 1) != 0)
    -[UITabBarController _setSelectedViewController:](self, "_setSelectedViewController:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[UITabBarController setSelectedViewController:] only a view controller in the tab bar controller's list of view controllers can be selected."));

}

- (UITabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  UITabBarController *v4;
  UITabBarController *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *moreChildViewControllers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITabBarController;
  v4 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UITabBarController _configureTabModel](v4, "_configureTabModel");
    -[UIViewController traitCollection](v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_defaultMaxItems = _UITabBarDefaultMaxItemsForTraitCollection(v6);

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    moreChildViewControllers = v5->_moreChildViewControllers;
    v5->_moreChildViewControllers = v7;

    -[UIViewController setContainmentSupport:](v5, "setContainmentSupport:", 0);
    -[UITabBarController loadView](v5, "loadView");
    -[UITabBarController viewDidLoad](v5, "viewDidLoad");
  }
  return v5;
}

- (void)loadView
{
  -[UITabBarController _layoutContainerView](self, "_layoutContainerView");
  -[_UITabBarControllerVisualStyle updateGestureRecognizers](self->_visualStyle, "updateGestureRecognizers");
}

- (void)_updateLayoutForTraitCollection:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t defaultMaxItems;
  void *v8;
  void *v9;

  v4 = -[_UITabBarControllerVisualStyle defaultMaxItems](self->_visualStyle, "defaultMaxItems", a3);
  -[UITabBarController _setTabBarPosition:](self, "_setTabBarPosition:", -[_UITabBarControllerVisualStyle tabBarPosition](self->_visualStyle, "tabBarPosition"));
  if (v4 != self->_defaultMaxItems)
  {
    -[UITabBarController _viewControllersForTabs]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    defaultMaxItems = self->_defaultMaxItems;
    if (v4 < defaultMaxItems)
      defaultMaxItems = v4;
    self->_defaultMaxItems = v4;
    if (v6 > defaultMaxItems)
    {
      *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
      -[UITabBarController _setViewControllers:animated:](self, "_setViewControllers:animated:", v5, 0);
    }

  }
  _UINSLocalizedStringWithDefaultValue(CFSTR("More"), CFSTR("More"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMoreNavigationController moreListController](self->_moreNavigationController, "moreListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  -[_UITabBarControllerVisualStyle updateGestureRecognizers](self->_visualStyle, "updateGestureRecognizers");
  -[UIView _setFocusSpeedBumpEdges:](self->_tabBar, "_setFocusSpeedBumpEdges:", -[_UITabBarControllerVisualStyle tabBarFocusSpeedBumpEdges](self->_visualStyle, "tabBarFocusSpeedBumpEdges"));
}

- (void)_setTabBarPosition:(int64_t)a3
{
  int64_t v5;
  void *v7;

  if (self->_tabBarPosition != a3)
  {
    if ((unint64_t)a3 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 3939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UITabBarControllerBarPositionUnspecified <= position && position <= UITabBarControllerBarPositionRight"));

    }
    v5 = -[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition");
    self->_tabBarPosition = a3;
    if (v5 != -[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition"))
    {
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
      -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
    }
  }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
  void *v6;
  void *v7;

  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL || self->_transientViewController == 0)
  {
    -[UITabBarController setTransientViewController:](self, "setTransientViewController:", 0);
    -[UITabBarController _viewControllerForSelectAtIndex:](self, "_viewControllerForSelectAtIndex:", selectedIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      -[UITabBarController _setSelectedViewController:](self, "_setSelectedViewController:", v6);
      v6 = v7;
    }

  }
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v8;
  UIViewController *transientViewController;
  BOOL v10;
  void *v11;
  UIViewController *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  UIViewController *v17;
  UIViewController *selectedViewController;
  UIViewController *v19;
  UIViewController *v20;
  void *v21;
  int v22;
  void *v23;
  UIViewController *v24;
  UIViewController *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  UIViewController *v30;
  _QWORD v31[4];
  id v32;
  UITabBarController *v33;

  v4 = a4;
  v8 = (UIViewController *)a3;
  if (v4)
  {
    transientViewController = self->_transientViewController;
    if (transientViewController)
      v10 = transientViewController == v8;
    else
      v10 = 0;
    if (v10)
      goto LABEL_39;
    v30 = v8;
    v11 = (void *)_UISetCurrentFallbackEnvironment(self);
    if (self->_selectedViewController == v30)
    {
      if (!-[UIViewController _containsFirstResponder](v30, "_containsFirstResponder"))
        -[UIViewController _viewControllerWasSelected](v30, "_viewControllerWasSelected");
    }
    else
    {
      -[UITabBarController _rebuildTabBarItemsIfNeeded](self, "_rebuildTabBarItemsIfNeeded");
      if ((*(_BYTE *)&self->_tabBarControllerFlags & 1) != 0)
      {
        -[UITabBarController moreNavigationController](self, "moreNavigationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "moreViewControllers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v30);

        if (v15)
        {
          v12 = v30;
          v30 = v13;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }
      v16 = -[UIViewController view](self, "view");
      -[UIViewController childModalViewController](self->_selectedViewController, "childModalViewController");
      v17 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      selectedViewController = v17;
      if (!v17)
        selectedViewController = self->_selectedViewController;
      -[UIViewController childModalViewController](v30, "childModalViewController");
      v19 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v20 = v19;
      else
        v20 = v30;
      -[UITabBarController transitionFromViewController:toViewController:](self, "transitionFromViewController:toViewController:", selectedViewController, v20);

      if (v12)
      {
        -[UITabBarController moreNavigationController](self, "moreNavigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDisplayedViewController:", v12);

      }
      if (-[UITabBarController _isModernTVTabBar](self, "_isModernTVTabBar"))
      {
        if (-[UITabBarController _shouldFocusViewControllerAfterTransition](self, "_shouldFocusViewControllerAfterTransition"))
        {
          v22 = 0;
        }
        else
        {
          v22 = 512;
        }
        self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v22);
      }
      -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      -[UIResponder _didChangeDeepestActionResponder](self, "_didChangeDeepestActionResponder");
      if (-[UITabBarController _notifySplitViewControllerForSelectionChange](self, "_notifySplitViewControllerForSelectionChange"))
      {
        -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_tabBarControllerDidChangeSelection:", self);

      }
    }
    _UIRestorePreviousFallbackEnvironment(v11);
    objc_msgSend((id)UIApp, "_findBestActivityToMakeCurrent:", self);
  }
  else
  {
    v30 = v8;
    objc_storeStrong((id *)&self->_selectedViewController, a3);
  }
  v24 = v30;
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) == 0
    || (-[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController"),
        v25 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
        v25,
        v24 = v30,
        v30 == v25))
  {
    -[UIViewController _resolvedTab](v24, "_resolvedTab");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewController tab](v30, "tab");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 2447, CFSTR("UITabBarController inconsistency; tried selecting a view controller without a valid tab: %@"),
      v30);

  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__UITabBarController__setSelectedViewController_performUpdates___block_invoke;
  v31[3] = &unk_1E16B1B50;
  v32 = v27;
  v33 = self;
  v28 = v27;
  -[UITabBarController _performWithoutNotifyingSelectionChange:](self, "_performWithoutNotifyingSelectionChange:", v31);
  -[_UITabBarControllerVisualStyle selectedViewControllerDidChange](self->_visualStyle, "selectedViewControllerDidChange");

  v8 = v30;
LABEL_39:

}

- (void)_setSelectedViewController:(id)a3
{
  -[UITabBarController _setSelectedViewController:performUpdates:](self, "_setSelectedViewController:performUpdates:", a3, 1);
}

- (void)setTransientViewController:(id)a3
{
  -[UITabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", a3, 1);
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v8;
  id *p_transientViewController;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UIViewController *v17;
  UIViewController *v18;

  v4 = a4;
  v8 = (UIViewController *)a3;
  if (v8 && (*(_DWORD *)&self->_tabBarControllerFlags & 0x8000) != 0)
  {
    v18 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 4596, CFSTR("transientViewController isn't support with UITab."));

    v8 = v18;
  }
  p_transientViewController = (id *)&self->_transientViewController;
  if (self->_transientViewController != v8)
  {
    v17 = v8;
    v10 = (void *)_UISetCurrentFallbackEnvironment(self);
    if (v4)
      v11 = 6;
    else
      v11 = 0;
    v12 = *p_transientViewController;
    if (v17)
    {
      if (v12)
      {
        objc_msgSend(v12, "willMoveToParentViewController:", 0);
        objc_msgSend(*p_transientViewController, "removeFromParentViewController");
      }
      objc_storeStrong((id *)&self->_transientViewController, a3);
      -[UIViewController addChildViewController:](self, "addChildViewController:", *p_transientViewController);
      objc_msgSend(*p_transientViewController, "setNeedsDidMoveCleanup:", 1);
      -[UITabBarController concealTabBarSelection](self, "concealTabBarSelection");
      -[UITabBarController transitionFromViewController:toViewController:transition:shouldSetSelected:](self, "transitionFromViewController:toViewController:transition:shouldSetSelected:", self->_selectedViewController, *p_transientViewController, v11, 0);
      -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v14, v13);
    }
    else
    {
      *p_transientViewController = 0;
      v14 = v12;

      -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_contentOrObservableScrollViewForEdge:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _stopObservingScrollView:](self, "_stopObservingScrollView:", v15);

      -[UITabBarController revealTabBarSelection](self, "revealTabBarSelection");
      objc_msgSend(v14, "willMoveToParentViewController:", 0);
      -[UITabBarController transitionFromViewController:toViewController:transition:shouldSetSelected:](self, "transitionFromViewController:toViewController:transition:shouldSetSelected:", v14, self->_selectedViewController, v11, 0);
      objc_msgSend(v14, "removeFromParentViewController");
    }

    _UIRestorePreviousFallbackEnvironment(v10);
    v8 = v17;
  }

}

- (void)__viewWillLayoutSubviews
{
  id v3;

  -[UITabBarController _layoutContainerView](self, "_layoutContainerView");
  -[UITabBarController _rebuildTabBarItemsIfNeeded](self, "_rebuildTabBarItemsIfNeeded");
  -[UITabBarController _selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:](self, "_selectDefaultViewControllerIfNecessaryWithAppearanceTransitions:", 1);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _layoutViewController:](self, "_layoutViewController:", v3);

}

- (void)_rebuildTabBarItemsIfNeeded
{
  void *v3;

  if ((*(_BYTE *)&self->_tabBarControllerFlags & 2) != 0)
  {
    if (!self->_visualStyle)
    {
      -[UIViewController traitCollection](self, "traitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _updateVisualStyleForTraitCollection:](self, "_updateVisualStyleForTraitCollection:", v3);

    }
    -[UITabBarController _rebuildTabModelAnimated:](self, "_rebuildTabModelAnimated:", 0);
    *(_DWORD *)&self->_tabBarControllerFlags &= ~2u;
  }
}

- (void)transitionFromViewController:(id)a3 toViewController:(id)a4
{
  -[UITabBarController transitionFromViewController:toViewController:transition:shouldSetSelected:](self, "transitionFromViewController:toViewController:transition:shouldSetSelected:", a3, a4, 0, 1);
}

- (BOOL)_notifySplitViewControllerForSelectionChange
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 2) & 1;
}

- (void)_safeAreaInsetsDidChangeForView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBarController;
  -[UIViewController _safeAreaInsetsDidChangeForView](&v3, sel__safeAreaInsetsDidChangeForView);
  if (dyld_program_sdk_at_least())
    -[_UITabBarControllerVisualStyle updateTabBarLayout](self->_visualStyle, "updateTabBarLayout");
}

- (void)_layoutContainerView
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILayoutContainerView *v12;
  UILayoutContainerView *containerView;
  _UITabBarControllerVisualStyle *visualStyle;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _UITabBarControllerVisualStyle *v24;
  UITabBar *v25;
  UITabBar *tabBar;
  UITransitionView *v27;
  UIView *v28;
  UIView *viewControllerTransitionView;
  void *v30;
  void *v31;
  _UITabBarControllerVisualStyle *v32;
  void *v33;
  void *v34;
  void *v35;

  if (!self->_containerView)
  {
    -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v4, v6, v8, v10);
    containerView = self->_containerView;
    self->_containerView = v12;

    -[UILayoutContainerView setDelegate:](self->_containerView, "setDelegate:", self);
    -[UILayoutContainerView setFrame:](self->_containerView, "setFrame:", v5, v7, v9, v11);
    -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
    -[UITabBarController setView:](self, "setView:", self->_containerView);
    visualStyle = self->_visualStyle;
    if (visualStyle)
    {
      -[_UITabBarControllerVisualStyle loadViews](visualStyle, "loadViews");
    }
    else
    {
      -[UIViewController traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _updateVisualStyleForTraitCollection:](self, "_updateVisualStyleForTraitCollection:", v15);

    }
  }
  -[UIView bounds](self->_containerView, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = self->_visualStyle;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 962, CFSTR("_visualStyle must be created before we can layout the container view"));

    v24 = self->_visualStyle;
  }
  if (-[_UITabBarControllerVisualStyle wantsDefaultTabBar](v24, "wantsDefaultTabBar") && !self->_tabBar)
  {
    v25 = -[UITabBar initWithFrame:]([UITabBar alloc], "initWithFrame:", v17, v19, v21, v23);
    tabBar = self->_tabBar;
    self->_tabBar = v25;

  }
  -[UITabBarController _prepareTabBar](self, "_prepareTabBar");
  if (dyld_program_sdk_at_least())
    -[_UITabBarControllerVisualStyle updateTabBarLayout](self->_visualStyle, "updateTabBarLayout");
  if (!self->_viewControllerTransitionView)
  {
    v27 = [UITransitionView alloc];
    v28 = -[UITransitionView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    viewControllerTransitionView = self->_viewControllerTransitionView;
    self->_viewControllerTransitionView = v28;

    -[UITabBarController _transitionView](self, "_transitionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", self);

    -[UITabBarController _transitionView](self, "_transitionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShouldNotifyDidCompleteImmediately:", 1);

    -[UIView setAutoresizingMask:](self->_viewControllerTransitionView, "setAutoresizingMask:", 18);
    v32 = self->_visualStyle;
    -[UITabBarController _transitionView](self, "_transitionView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabBarControllerVisualStyle configureTransitionView:](v32, "configureTransitionView:", v33);

    -[_UITabBarControllerVisualStyle tabBarView](self->_visualStyle, "tabBarView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:belowSubview:](self->_containerView, "insertSubview:belowSubview:", self->_viewControllerTransitionView, v34);

  }
  -[_UITabBarControllerVisualStyle adjustedTransitionViewFrame:](self->_visualStyle, "adjustedTransitionViewFrame:", v17, v19, v21, v23);
  -[UIView setFrame:](self->_viewControllerTransitionView, "setFrame:");
}

- (void)_updateTabBarLayout
{
  -[_UITabBarControllerVisualStyle updateTabBarLayout](self->_visualStyle, "updateTabBarLayout");
}

- (void)_prepareTabBar
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  UITabBar *tabBar;
  UITabBar *v7;
  UITabBar *v8;
  UITabBar *v9;
  UILayoutContainerView *v10;
  UILayoutContainerView *containerView;
  _QWORD v12[5];

  if ((*(_BYTE *)&self->_tabBarControllerFlags & 0x20) == 0)
  {
    v3 = -[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition");
    if (v3 - 3 < 2)
      v4 = 1;
    else
      v4 = 4;
    -[UITabBar _setBarOrientation:](self->_tabBar, "_setBarOrientation:", v4);
    -[UITabBar setLocked:](self->_tabBar, "setLocked:", 0);
    -[UIView sizeToFit](self->_tabBar, "sizeToFit");
    -[_UITabBarControllerVisualStyle updateTabBarLayout](self->_visualStyle, "updateTabBarLayout");
    if (v3 > 4)
      v5 = 0;
    else
      v5 = qword_18667A178[v3];
    -[UITabBar _setAccessoryView:](self->_tabBar, "_setAccessoryView:", self->_accessoryView);
    -[UIView setAutoresizingMask:](self->_tabBar, "setAutoresizingMask:", v5);
    tabBar = self->_tabBar;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__UITabBarController__prepareTabBar__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    -[UITabBar _performWhileIgnoringLock:]((uint64_t)tabBar, v12);
    -[UITabBar _setHidesShadow:](self->_tabBar, "_setHidesShadow:", (*(_DWORD *)&self->_tabBarControllerFlags >> 13) & 1);
    -[_UITabBarControllerVisualStyle tabBarView](self->_visualStyle, "tabBarView");
    v7 = (UITabBar *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      v8 = self->_tabBar;
    v9 = v8;

    -[UIView superview](v9, "superview");
    v10 = (UILayoutContainerView *)objc_claimAutoreleasedReturnValue();
    containerView = self->_containerView;

    if (v10 != containerView)
      -[UILayoutContainerView addSubview:](self->_containerView, "addSubview:", v9);
    -[UITabBar setLocked:](self->_tabBar, "setLocked:", 1);
    *(_DWORD *)&self->_tabBarControllerFlags |= 0x22u;
    -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");

  }
}

- (void)setView:(id)a3
{
  id v4;
  UITabBarController *v5;
  UIViewController *transientViewController;
  UILayoutContainerView *containerView;
  void *v8;
  UITabBarController *v9;
  void *v10;
  UIView *viewControllerTransitionView;
  UITabBarController *v12;
  UITabBar *tabBar;
  objc_super v14;

  v4 = a3;
  if (!v4)
  {
    -[UILayoutContainerView delegate](self->_containerView, "delegate");
    v5 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
      -[UILayoutContainerView setDelegate:](self->_containerView, "setDelegate:", 0);
    transientViewController = self->_transientViewController;
    self->_transientViewController = 0;

    containerView = self->_containerView;
    self->_containerView = 0;

    -[UITabBarController _transitionView](self, "_transitionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
    {
      -[UITabBarController _transitionView](self, "_transitionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", 0);

    }
    viewControllerTransitionView = self->_viewControllerTransitionView;
    self->_viewControllerTransitionView = 0;

    -[UITabBar setLocked:](self->_tabBar, "setLocked:", 0);
    -[UITabBar delegate](self->_tabBar, "delegate");
    v12 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (v12 == self)
      -[UITabBar setDelegate:](self->_tabBar, "setDelegate:", 0);
    tabBar = self->_tabBar;
    self->_tabBar = 0;

    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFF9D | 0x42);
  }
  v14.receiver = self;
  v14.super_class = (Class)UITabBarController;
  -[UIViewController setView:](&v14, sel_setView_, v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  UIViewController *v5;
  UIViewController *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  -[UIViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self->_selectedViewControllerDuringWillAppear)
  {
    -[UIViewController __viewDidAppear:](v5, "__viewDidAppear:", v3);
    if (!-[UIViewController _containsFirstResponder](v6, "_containsFirstResponder"))
      -[UIViewController _viewControllerWasSelected](v6, "_viewControllerWasSelected");
  }
  -[_UITabBarControllerVisualStyle viewDidAppear:](self->_visualStyle, "viewDidAppear:", v3);

}

- (void)viewDidLoad
{
  int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  -[UIViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (-[_UITabBarControllerVisualStyle prefersTabBarFocusedOnViewDidLoad](self->_visualStyle, "prefersTabBarFocusedOnViewDidLoad"))
  {
    v3 = 512;
  }
  else
  {
    v3 = 0;
  }
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v3);
  -[_UITabBarControllerVisualStyle viewDidLoad](self->_visualStyle, "viewDidLoad");
}

- (id)_backdropBarGroupName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> Backdrop Group"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UINavigationController)moreNavigationController
{
  UIMoreNavigationController *moreNavigationController;
  UIMoreNavigationController *v4;
  UIMoreNavigationController *v5;
  void *v6;
  void *v7;
  UISemanticContentAttribute v8;
  void *v9;
  UISemanticContentAttribute v10;
  void *v11;
  void *v12;
  UISemanticContentAttribute v13;
  void *v14;

  moreNavigationController = self->_moreNavigationController;
  if (!moreNavigationController)
  {
    v4 = (UIMoreNavigationController *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_moreNavigationControllerClass"));
    v5 = self->_moreNavigationController;
    self->_moreNavigationController = v4;

    _UINSLocalizedStringWithDefaultValue(CFSTR("More"), CFSTR("More"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMoreNavigationController moreListController](self->_moreNavigationController, "moreListController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

    -[UITabBarController _setMoreNavigationControllerRestorationIdentifier](self, "_setMoreNavigationControllerRestorationIdentifier");
    -[UIMoreNavigationController setAllowsCustomizing:](self->_moreNavigationController, "setAllowsCustomizing:", -[UITabBarController _allowsCustomizing](self, "_allowsCustomizing"));
    v8 = -[UIView semanticContentAttribute](self->_tabBar, "semanticContentAttribute");
    -[UIViewController view](self->_moreNavigationController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSemanticContentAttribute:", v8);

    v10 = -[UIView semanticContentAttribute](self->_tabBar, "semanticContentAttribute");
    -[UINavigationController topViewController](self->_moreNavigationController, "topViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSemanticContentAttribute:", v10);

    v13 = -[UIView semanticContentAttribute](self->_tabBar, "semanticContentAttribute");
    -[UINavigationController navigationBar](self->_moreNavigationController, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSemanticContentAttribute:", v13);

    moreNavigationController = self->_moreNavigationController;
  }
  return (UINavigationController *)moreNavigationController;
}

- (void)_setMoreNavigationControllerRestorationIdentifier
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;

  if (self->_moreNavigationController)
  {
    -[UIResponder restorationIdentifier](self, "restorationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = v3;
      -[UIResponder setRestorationIdentifier:](self->_moreNavigationController, "setRestorationIdentifier:", CFSTR("_$MoreNavigationController$_"));
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v3 = v7;
      if ((isKindOfClass & 1) != 0)
      {
        -[UIMoreNavigationController moreListController](self->_moreNavigationController, "moreListController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
          objc_msgSend(v5, "setRestorationIdentifier:", CFSTR("_$MoreNavigationListController$_"));

        v3 = v7;
      }
    }

  }
}

- (BOOL)showsEditButtonOnLeft
{
  return (*(_BYTE *)&self->_tabBarControllerFlags >> 4) & 1;
}

- (BOOL)_allowsCustomizing
{
  void *v2;
  BOOL v3;

  -[UITabBarController customizableViewControllers](self, "customizableViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)customizableViewControllers
{
  return (NSArray *)(id)-[NSArray copy](self->_customizableViewControllers, "copy");
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, self->_moreNavigationController, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_observableScrollViewDidChangeFrom:(id)a3 forViewController:(id)a4 edges:(unint64_t)a5
{
  _DWORD *v8;
  unint64_t v9;
  unint64_t v10;
  id WeakRetained;
  id v12;
  id v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UITabBarController *v21;
  UITabBarController *v22;
  objc_super v23;

  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UITabBarController;
  -[UIViewController _observableScrollViewDidChangeFrom:forViewController:edges:](&v23, sel__observableScrollViewDidChangeFrom_forViewController_edges_, a3, v8, a5);
  if (v8)
  {
    if (((v8[92] >> 1) & 3u) - 1 <= 1)
    {
      v9 = -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation");
      if ((v9 & a5) != 0)
      {
        v10 = v9;
        WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
        objc_msgSend(v8, "_contentOrObservableScrollViewForEdge:", v10);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_loadWeakRetained((id *)&self->_observingScrollView);

        if (v12 != v13)
        {
          -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", self->_selectedViewController);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_contentOrObservableScrollViewForEdge:", v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15)
            v16 = v12 == v15;
          else
            v16 = 1;
          if (v16)
          {
            objc_msgSend(v12, "_viewControllerForAncestor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "presentingViewController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "tabBarController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              v21 = v19;
            }
            else
            {
              objc_msgSend(v17, "tabBarController");
              v21 = (UITabBarController *)objc_claimAutoreleasedReturnValue();
            }
            v22 = v21;

            if (v22 == self)
              -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v12, v8);

          }
        }

      }
    }
  }

}

- (id)transitionCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[UITabBarController _animator](self, "_animator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITabBarController _animator](self, "_animator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIViewController transitionCoordinator](&v8, sel_transitionCoordinator);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIViewControllerAnimatedTransitioning)_animator
{
  return self->__animator;
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
  _BOOL8 v4;
  void *v6;
  char v7;
  NSArray *v8;

  v4 = animated;
  v8 = viewControllers;
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x8000u;
  -[UITabBarController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToArray:", v8);

  if ((v7 & 1) == 0)
    -[UITabBarController _setViewControllers:animated:](self, "_setViewControllers:animated:", v8, v4);

}

- (NSArray)viewControllers
{
  void *v3;
  void *v4;

  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (self->_moreNavigationController)
      objc_msgSend(v4, "removeObject:");
    if (-[NSMutableArray count](self->_moreChildViewControllers, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", self->_moreChildViewControllers);
  }
  return (NSArray *)v4;
}

- (void)showBarWithTransition:(int)a3 duration:(double)a4
{
  -[UITabBarController _showBarWithTransition:isExplicit:duration:](self, "_showBarWithTransition:isExplicit:duration:", *(_QWORD *)&a3, 1, a4);
}

- (void)dealloc
{
  UITabBarController *v3;
  UIViewController *transientViewController;
  UILayoutContainerView *containerView;
  void *v6;
  UITabBarController *v7;
  void *v8;
  UIView *viewControllerTransitionView;
  UITabBarController *v10;
  UITabBar *tabBar;
  id tabBarItemsToViewControllers;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  UIMoreNavigationController *moreNavigationController;
  NSMutableArray *moreChildViewControllers;
  UIViewController *selectedViewController;
  NSArray *customizableViewControllers;
  UIView *accessoryView;
  _UITabBarControllerVisualStyle *visualStyle;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[UILayoutContainerView delegate](self->_containerView, "delegate");
  v3 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UILayoutContainerView setDelegate:](self->_containerView, "setDelegate:", 0);
  transientViewController = self->_transientViewController;
  self->_transientViewController = 0;

  containerView = self->_containerView;
  self->_containerView = 0;

  -[UITabBarController _transitionView](self, "_transitionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    -[UITabBarController _transitionView](self, "_transitionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

  }
  viewControllerTransitionView = self->_viewControllerTransitionView;
  self->_viewControllerTransitionView = 0;

  -[UITabBar setLocked:](self->_tabBar, "setLocked:", 0);
  -[UITabBar delegate](self->_tabBar, "delegate");
  v10 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

  if (v10 == self)
    -[UITabBar setDelegate:](self->_tabBar, "setDelegate:", 0);
  tabBar = self->_tabBar;
  self->_tabBar = 0;

  tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_tabBarItemsToViewControllers = 0;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_moreChildViewControllers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (*(UITabBarController **)(v18 + 104) == self)
          *(_QWORD *)(v18 + 104) = 0;
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  moreNavigationController = self->_moreNavigationController;
  self->_moreNavigationController = 0;

  moreChildViewControllers = self->_moreChildViewControllers;
  self->_moreChildViewControllers = 0;

  selectedViewController = self->_selectedViewController;
  self->_selectedViewController = 0;

  customizableViewControllers = self->_customizableViewControllers;
  self->_customizableViewControllers = 0;

  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

  visualStyle = self->_visualStyle;
  self->_visualStyle = 0;

  v25.receiver = self;
  v25.super_class = (Class)UITabBarController;
  -[UIViewController dealloc](&v25, sel_dealloc);
}

- (id)_effectiveInteractionActivityTrackingBaseName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;

  -[UIViewController interactionActivityTrackingBaseName](self, "interactionActivityTrackingBaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UITabBarController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[UITabBarController selectedViewController](self, "selectedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_effectiveInteractionActivityTrackingBaseName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(CFSTR("UITBC-"), "stringByAppendingString:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v5 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  int v6;
  char v7;
  int v8;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 256;
    else
      v6 = 0;
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFEFF | v6);
    v7 = objc_opt_respondsToSelector();
    v5 = obj;
    if ((v7 & 1) != 0)
      v8 = 128;
    else
      v8 = 0;
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFF7F | v8);
  }

}

- (void)_tabBarVisibilityDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;

  -[UITabBarController selectedViewController](self, "selectedViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v12, "style");

      if (!v4)
        goto LABEL_6;
      objc_msgSend(v12, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsLayout");
    }
  }

LABEL_6:
  if (_UIBarsApplyChromelessEverywhere())
  {
    -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", self->_selectedViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITabBarController _isBarEffectivelyHidden](self, "_isBarEffectivelyHidden"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
      v7 = WeakRetained;
    }
    else
    {
      objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", 4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v7 = (void *)v8;
      }
      else
      {
        -[UITabBarController _scrollViewObservedBeforeHidingBar](self, "_scrollViewObservedBeforeHidingBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9;
        if (v9)
        {
          objc_msgSend(v9, "_viewControllerForAncestor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[UITabBarController _isViewControllerContainedInSelected:](self, "_isViewControllerContainedInSelected:", v10);

          if (!v11)
          {

            WeakRetained = 0;
            v7 = 0;
            goto LABEL_12;
          }
        }
      }
      WeakRetained = 0;
    }
LABEL_12:
    -[UITabBarController _setScrollViewObservedBeforeHidingBar:](self, "_setScrollViewObservedBeforeHidingBar:", WeakRetained);
    -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v7, v5);
    -[UITabBarController _updateBarHiddenByClientStateIfNecessary](self, "_updateBarHiddenByClientStateIfNecessary");

  }
}

- (void)_setScrollViewObservedBeforeHidingBar:(id)a3
{
  objc_setAssociatedObject(self, &__previouslyObservedScrollViewKey, a3, (void *)1);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[UITabBarController selectedViewController](self, "selectedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITabBarController selectedViewController](self, "selectedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "becomeFirstResponder");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarController;
    return -[UIResponder becomeFirstResponder](&v7, sel_becomeFirstResponder);
  }
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5
{
  -[UITabBarController _hideBarWithTransition:isExplicit:duration:reason:](self, "_hideBarWithTransition:isExplicit:duration:reason:", *(_QWORD *)&a3, a4, 1, a5);
}

- (void)animationDidStop:(id)a3 finished:(id)a4 context:(id)a5
{
  char v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v7 = objc_msgSend(a4, "BOOLValue");
  v8 = -[UITabBarController _wantsBarHidden](self, "_wantsBarHidden");
  -[UITabBar setHidden:](self->_tabBar, "setHidden:", v8);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == CFSTR("UITabBarControllerShowBar"))
  {
    if ((v7 & 1) != 0)
      -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
  }
  else
  {
    if (a3 != CFSTR("UITabBarControllerHideBar"))
      goto LABEL_12;
    if ((v7 & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v18, "_tabBarControllerDidFinishShowingTabBar:isHidden:", self, v8);
      -[UITabBar setAlpha:](self->_tabBar, "setAlpha:", 1.0);
      goto LABEL_12;
    }
    -[UIView frame](self->_viewControllerTransitionView, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UIView bounds](self->_containerView, "bounds");
    v16 = v15;
    -[UIView frame](self->_tabBar, "frame");
    -[UIView setFrame:](self->_viewControllerTransitionView, "setFrame:", v10, v12, v14, v16 - v17);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "_tabBarControllerDidFinishShowingTabBar:isHidden:", self, v8);
LABEL_12:
  objc_msgSend(v18, "_updateContentOverlayInsetsForSelfAndChildren");

}

- (void)_setMaximumNumberOfItems:(unint64_t)a3
{
  unint64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  if (self->_customMaxItems != v3)
  {
    self->_customMaxItems = v3;
    *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
    -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactor, 0);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->_compactTabIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rememberedFocusedItemsByViewController, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_sidebar, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_moreChildViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllersForTabs, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_observingScrollView);
  objc_storeStrong((id *)&self->_lastUsedScrollEdgeAppearance, 0);
  objc_storeStrong((id *)&self->_transientViewController, 0);
  objc_storeStrong((id *)&self->_selectedViewControllerDuringWillAppear, 0);
  objc_storeStrong((id *)&self->_customizableViewControllers, 0);
  objc_storeStrong((id *)&self->_moreNavigationController, 0);
  objc_storeStrong((id *)&self->_selectedViewController, 0);
  objc_storeStrong(&self->_tabBarItemsToViewControllers, 0);
  objc_storeStrong((id *)&self->_viewControllerTransitionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_preferredInterfaceOrientationForPresentation, objc_opt_class());
}

+ (BOOL)_uip_isFloatingTabBarEnabled
{
  if (qword_1ECD7B638 != -1)
    dispatch_once(&qword_1ECD7B638, &__block_literal_global_128);
  return _MergedGlobals_43_0;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UITabBarController");
}

void __52__UITabBarController__registerDefaultStylesIfNeeded__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "registerVisualStyleClass:forStylableClass:", v3, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "registerVisualStyleClass:forStylableClass:", v5, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v6, "registerVisualStyleClass:forStylableClass:", v7, objc_opt_class());

  if (qword_1ECD7B638 != -1)
    dispatch_once(&qword_1ECD7B638, &__block_literal_global_128);
  if (_MergedGlobals_43_0)
  {
    +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(v9, "registerVisualStyleClass:forStylableClass:", v8, objc_opt_class());

  }
}

- (void)_updateVisualStyleForTraitCollection:(id)a3
{
  uint64_t v4;
  int64_t v5;
  _UITabBarControllerVisualStyle **p_visualStyle;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id obj;

  v4 = objc_msgSend(a3, "userInterfaceIdiom");
  v5 = v4;
  p_visualStyle = &self->_visualStyle;
  if (!self->_visualStyle || self->_visualStyleIdiom != v4)
  {
    objc_opt_self();
    if (_registerDefaultStylesIfNeeded___defaultRegistrationToken != -1)
      dispatch_once(&_registerDefaultStylesIfNeeded___defaultRegistrationToken, &__block_literal_global_22);
    +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v7, "visualStyleClassForStylableClass:", objc_opt_class());

    if (!*p_visualStyle || (-[objc_class isEqual:](v8, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      obj = (id)objc_msgSend([v8 alloc], "initWithTabBarController:", self);
      if (*p_visualStyle)
      {
        -[_UITabBarControllerVisualStyle tabBarView](*p_visualStyle, "tabBarView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");
        *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
        -[_UITabBarControllerVisualStyle teardown](*p_visualStyle, "teardown");

      }
      objc_storeStrong((id *)&self->_visualStyle, obj);
      self->_visualStyleIdiom = v5;
      -[_UITabBarControllerVisualStyle prepare](*p_visualStyle, "prepare");
      if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[_UITabBarControllerVisualStyle loadViews](*p_visualStyle, "loadViews");
        -[UIViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setNeedsLayout");

      }
    }
  }
}

- (id)_visualStyle
{
  if (a1)
    a1 = (id *)a1[135];
  return a1;
}

- (UITabBarController)initWithCoder:(id)a3
{
  id v4;
  UITabBarController *v5;
  UITabBarController *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  UITabBar *tabBar;
  uint64_t v11;
  id tabBarItemsToViewControllers;
  uint64_t v13;
  NSArray *customizableViewControllers;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *moreChildViewControllers;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t v24;
  NSMutableArray *v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *v28;
  unint64_t v29;
  BOOL v30;
  unint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  UITabBarController *v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  UITabBarController *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)UITabBarController;
  v5 = -[UIViewController initWithCoder:](&v52, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UITabBarController _configureTabModel](v5, "_configureTabModel");
    -[UIViewController traitCollection](v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_defaultMaxItems = _UITabBarDefaultMaxItemsForTraitCollection(v7);

    v8 = -[UITabBarController _effectiveMaxItems](v6, "_effectiveMaxItems");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITabBar"));
    v9 = objc_claimAutoreleasedReturnValue();
    tabBar = v6->_tabBar;
    v6->_tabBar = (UITabBar *)v9;

    -[UITabBar setLocked:](v6->_tabBar, "setLocked:", 1);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITabBarItemsToViewControllers"));
    v11 = objc_claimAutoreleasedReturnValue();
    tabBarItemsToViewControllers = v6->_tabBarItemsToViewControllers;
    v6->_tabBarItemsToViewControllers = (id)v11;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UICustomizableViewControllers"));
    v13 = objc_claimAutoreleasedReturnValue();
    customizableViewControllers = v6->_customizableViewControllers;
    v6->_customizableViewControllers = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_delegate, v15);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIViewControllers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    moreChildViewControllers = v6->_moreChildViewControllers;
    v6->_moreChildViewControllers = (NSMutableArray *)v17;

    -[UIViewController mutableChildViewControllers](v6, "mutableChildViewControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8 - 1;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6->_moreChildViewControllers);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqualToSet:", v22);

    v24 = -[NSMutableArray count](v6->_moreChildViewControllers, "count");
    v25 = v6->_moreChildViewControllers;
    if (v23)
    {
      if (v24 <= v8)
      {
        objc_msgSend(v19, "setArray:", v25);
        -[NSMutableArray removeAllObjects](v6->_moreChildViewControllers, "removeAllObjects");
      }
      else
      {
        -[NSMutableArray subarrayWithRange:](v6->_moreChildViewControllers, "subarrayWithRange:", 0, v8 - 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setArray:", v26);
        -[NSMutableArray removeObjectsInRange:](v6->_moreChildViewControllers, "removeObjectsInRange:", 0, v20);

      }
    }
    else
    {
      if (v24 <= v8)
      {
        if (v25)
        {
          -[NSMutableArray removeAllObjects](v6->_moreChildViewControllers, "removeAllObjects");
        }
        else
        {
          v27 = objc_opt_new();
          v28 = v6->_moreChildViewControllers;
          v6->_moreChildViewControllers = (NSMutableArray *)v27;

        }
      }
      else
      {
        -[NSMutableArray removeObjectsInRange:](v6->_moreChildViewControllers, "removeObjectsInRange:", 0, v8 - 1);
      }
      v29 = objc_msgSend(v19, "count");
      v30 = v29 >= v8;
      v31 = v29 - v8;
      if (v31 != 0 && v30 || !v31 && -[NSMutableArray count](v6->_moreChildViewControllers, "count"))
        objc_msgSend(v19, "removeObjectsInRange:", v20, v31 + 1);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v33 = v19;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v49 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "_resolvedTab");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v35);
    }

    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = __36__UITabBarController_initWithCoder___block_invoke;
    v45 = &unk_1E16B1B50;
    v39 = v6;
    v46 = v39;
    v47 = v32;
    v40 = v32;
    -[UITabBarController _performWithoutNotifyingSelectionChange:](v39, "_performWithoutNotifyingSelectionChange:", &v42);
    *(_DWORD *)&v39->_tabBarControllerFlags |= 2u;
    -[UIViewController setContainmentSupport:](v39, "setContainmentSupport:", 0, v42, v43, v44, v45);

  }
  return v6;
}

void __36__UITabBarController_initWithCoder___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__UITabBarController_initWithCoder___block_invoke_2;
  v2[3] = &unk_1E16B1B50;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);

}

uint64_t __36__UITabBarController_initWithCoder___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[144];
  return objc_msgSend(v1, "setTabItems:inferSelection:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  -[UIViewController _populateArchivedChildViewControllers:](&v5, sel__populateArchivedChildViewControllers_, v4);
  objc_msgSend(v4, "addObjectsFromArray:", self->_moreChildViewControllers);
  if (self->_moreNavigationController)
    objc_msgSend(v4, "removeObject:");

}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UITabBar *tabBar;
  id tabBarItemsToViewControllers;
  NSArray *customizableViewControllers;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  -[UIViewController encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  tabBar = self->_tabBar;
  if (tabBar)
    objc_msgSend(v4, "encodeObject:forKey:", tabBar, CFSTR("UITabBar"));
  tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  if (tabBarItemsToViewControllers)
    objc_msgSend(v4, "encodeObject:forKey:", tabBarItemsToViewControllers, CFSTR("UITabBarItemsToViewControllers"));
  customizableViewControllers = self->_customizableViewControllers;
  if (customizableViewControllers)
    objc_msgSend(v4, "encodeObject:forKey:", customizableViewControllers, CFSTR("UICustomizableViewControllers"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIDelegate"));
  if (-[UIViewController childViewControllersCount](self, "childViewControllersCount"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[UIViewController childViewControllersCount](self, "childViewControllersCount")+ -[NSMutableArray count](self->_moreChildViewControllers, "count"));
    -[UITabBarController _populateArchivedChildViewControllers:](self, "_populateArchivedChildViewControllers:", v9);
    if (objc_msgSend(v9, "count"))
    {
      -[UITabBarController viewControllers](self, "viewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIArrayByKeepingObjectsInSet(v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("UIViewControllers"));

    }
  }

}

- (UITabBarController)initWithTabs:(id)a3
{
  id v4;
  UITabBarController *v5;
  UITabBarController *v6;

  v4 = a3;
  v5 = -[UITabBarController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    -[UITabBarController setTabs:](v5, "setTabs:", v4);

  return v6;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[_UITabBarControllerVisualStyle preferredSidebarModeDidChange](self->_visualStyle, "preferredSidebarModeDidChange");
  }
}

- (NSArray)tabs
{
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) == 0)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[_UITabModel tabItems](self->_tabModel, "tabItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTabs:(id)a3
{
  -[UITabBarController setTabs:animated:](self, "setTabs:animated:", a3, 0);
}

- (void)setCompactTabIdentifiers:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;

  v5 = a3;
  v6 = self->_compactTabIdentifiers;
  v7 = (NSArray *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSArray isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_compactTabIdentifiers, a3);
    *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
    -[UITabBarController _rebuildTabBarItemsIfNeeded](self, "_rebuildTabBarItemsIfNeeded");
  }
LABEL_9:

}

- (void)setTabs:(id)a3 animated:(BOOL)a4
{
  id v7;
  _UITabModel *v8;
  id v9;
  _UITabModel *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _UITabModel *v14;
  id v15;
  UITabBarController *v16;
  SEL v17;
  BOOL v18;

  v7 = a3;
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x8000u;
  -[UITabBarController selectedTab](self, "selectedTab");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self->_tabModel;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__UITabBarController_setTabs_animated___block_invoke;
  v13[3] = &unk_1E16BFD20;
  v14 = v8;
  v15 = v7;
  v16 = self;
  v17 = a2;
  v18 = a4;
  v9 = v7;
  v10 = v8;
  -[UITabBarController _performWithoutNotifyingSelectionChange:](self, "_performWithoutNotifyingSelectionChange:", v13);
  -[UIViewController _existingView](self, "_existingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

}

void __39__UITabBarController_setTabs_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tabItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 != v5 && v4 != 0 && v5 != 0)
    objc_msgSend(v4, "isEqual:", v5);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v15, "_isUniquelySPI"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("UITabBarController.m"), 584, CFSTR("_UITabElement (%@) is not supported in setTabs:animated:"), v15);

        }
        objc_msgSend(v15, "_displayedViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 32), "selectedLeaf");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UITabBarController_setTabs_animated___block_invoke_2;
  aBlock[3] = &unk_1E16BFCF8;
  v26 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 48);
  v27 = v19;
  v28 = v20;
  v21 = v9;
  v29 = v21;
  v31 = *(_BYTE *)(a1 + 64);
  v22 = v18;
  v30 = v22;
  v23 = _Block_copy(aBlock);
  v24 = v23;
  if (*(_BYTE *)(a1 + 64))
    (*((void (**)(void *))v23 + 2))(v23);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);

}

void __39__UITabBarController_setTabs_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setTabItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_setViewControllers:animated:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1112), *(id *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabForIdentifier:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectElement:notifyOnReselection:", v5, 0);
    v4 = v5;
  }

}

- (UITab)selectedTab
{
  if (self)
    self = (UITabBarController *)self->_tabModel;
  return (UITab *)-[UITabBarController selectedLeaf](self, "selectedLeaf");
}

- (void)setSelectedTab:(id)a3
{
  if (self)
    self = (UITabBarController *)self->_tabModel;
  -[UITabBarController selectElement:notifyOnReselection:](self, "selectElement:notifyOnReselection:", a3, 0);
}

- (id)tabForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  -[_UITabModel tabForIdentifier:](self->_tabModel, "tabForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)customizationIdentifier
{
  if (self)
    self = (UITabBarController *)self->_tabModel;
  return (NSString *)-[UITabBarController persistenceIdentifier](self, "persistenceIdentifier");
}

- (void)setCustomizationIdentifier:(id)a3
{
  if (self)
    self = (UITabBarController *)self->_tabModel;
  -[UITabBarController setPersistenceIdentifier:](self, "setPersistenceIdentifier:", a3);
}

- (BOOL)isTabBarHidden
{
  return -[_UITabBarControllerVisualStyle isBarHidden](self->_visualStyle, "isBarHidden");
}

- (void)setTabBarHidden:(BOOL)a3
{
  -[UITabBarController setTabBarHidden:animated:](self, "setTabBarHidden:animated:", a3, 0);
}

- (void)setTabBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[_UITabBarControllerVisualStyle setBarHidden:animated:](self->_visualStyle, "setBarHidden:animated:", a3, a4);
}

- (UITabBarControllerSidebar)sidebar
{
  UITabBarControllerSidebar *sidebar;
  UITabBarControllerSidebar *v4;
  UITabBarControllerSidebar *v5;

  sidebar = self->_sidebar;
  if (!sidebar)
  {
    v4 = (UITabBarControllerSidebar *)-[UITabBarControllerSidebar _initWithTabBarController:]([UITabBarControllerSidebar alloc], (uint64_t)self);
    v5 = self->_sidebar;
    self->_sidebar = v4;

    sidebar = self->_sidebar;
  }
  return sidebar;
}

- (id)_deepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__UITabBarController__deepestActionResponder__block_invoke;
  v3[3] = &unk_1E16BE5F0;
  v3[4] = self;
  -[UIViewController _deepestPresentedActionResponderOrBlock:](self, "_deepestPresentedActionResponderOrBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__UITabBarController__deepestActionResponder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(*(id *)(a1 + 32), "_selectedViewControllerInTabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "_hasDeepestActionResponder") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_selectedViewControllerInTabBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deepestActionResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6.receiver = *(id *)(a1 + 32);
    v6.super_class = (Class)UITabBarController;
    objc_msgSendSuper2(&v6, sel__deepestActionResponder);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  char v6;
  objc_super v7;

  if (sel_toggleSidebar_ == a3)
  {
    -[UITabBarController _visualStyle]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canToggleSidebar");

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarController;
    return -[UIViewController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)validateCommand:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "action") == sel_toggleSidebar_)
  {
    -[UITabBarController sidebar](self, "sidebar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    if (v6)
      v7 = CFSTR("Show Sidebar");
    else
      v7 = CFSTR("Hide Sidebar");
    _UINSLocalizedStringWithDefaultValue(v7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v8);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITabBarController;
    -[UIResponder validateCommand:](&v9, sel_validateCommand_, v4);
  }

}

- (void)toggleSidebar:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UITabBarController _visualStyle]((id *)&self->super.super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canToggleSidebar");

  if (v5)
  {
    -[UITabBarController sidebar](self, "sidebar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UITabBarController sidebar](self, "sidebar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarControllerSidebar _setHidden:userInitiated:]((uint64_t)v7, objc_msgSend(v6, "isHidden") ^ 1, 1);

  }
}

uint64_t __87__UITabBarController__selectDefaultViewControllerIfNecessaryWithAppearanceTransitions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_setTabBarOffscreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFDFFF | v3);
}

- (BOOL)_isTabBarOffscreen
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 5) & 1;
}

uint64_t __36__UITabBarController__prepareTabBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDelegate:");
}

- (void)_setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
    -[UITabBarController _prepareTabBar](self, "_prepareTabBar");
    v5 = v6;
  }

}

- (void)setTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITabBarController;
  -[UIViewController setTitle:](&v4, sel_setTitle_, a3);
  -[_UITabBarControllerVisualStyle titleDidChange](self->_visualStyle, "titleDidChange");
}

- (void)setTabBar:(id)a3
{
  UITabBar *v5;
  UITabBar **p_tabBar;
  UITabBar *tabBar;
  UITabBar *v8;

  v5 = (UITabBar *)a3;
  p_tabBar = &self->_tabBar;
  tabBar = self->_tabBar;
  if (tabBar != v5)
  {
    v8 = v5;
    -[UITabBar setLocked:](tabBar, "setLocked:", 0);
    -[UITabBar setDelegate:](*p_tabBar, "setDelegate:", 0);
    -[UIView removeFromSuperview](*p_tabBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_tabBar, a3);
    *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
    -[UITabBarController _prepareTabBar](self, "_prepareTabBar");
    v5 = v8;
  }

}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBarController;
  -[UIViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[_UITabBarControllerVisualStyle updateConstraints](self->_visualStyle, "updateConstraints");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  v7 = a4;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__UITabBarController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E16B2E68;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __80__UITabBarController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForTraitCollection:", *(_QWORD *)(a1 + 40));
  return result;
}

void __45__UITabBarController__setSelectedTabBarItem___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tabBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedItem:", v1);

}

BOOL __56__UITabBarController_updateTabBarItemForViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "_displayedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)_reallyWantsFullScreenLayout
{
  return 1;
}

- (BOOL)_wantsBarHidden
{
  return (*(_BYTE *)&self->_tabBarControllerFlags & 0xC) != 0;
}

- (id)_viewControllersForTabs
{
  if (a1)
  {
    if ((*((_BYTE *)a1 + 1105) & 0x80) != 0)
    {
      a1 = (id *)a1[139];
    }
    else
    {
      objc_msgSend(a1, "viewControllers");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UITabBarControllerVisualStyle shouldSuppressPresses:withEvent:](self->_visualStyle, "shouldSuppressPresses:withEvent:", v6, v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UITabBarControllerVisualStyle shouldSuppressPresses:withEvent:](self->_visualStyle, "shouldSuppressPresses:withEvent:", v6, v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UITabBarControllerVisualStyle shouldSuppressPresses:withEvent:](self->_visualStyle, "shouldSuppressPresses:withEvent:", v6, v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIResponder pressesChanged:withEvent:](&v8, sel_pressesChanged_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!-[_UITabBarControllerVisualStyle shouldSuppressPresses:withEvent:](self->_visualStyle, "shouldSuppressPresses:withEvent:", v6, v7))
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)_performFocusGesture:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[UIViewController _focusSystem](self, "_focusSystem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isViewLoaded"))
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "_focusedItemIsContainedInEnvironment:includeSelf:", v6, 1);

    if (v7)
    {
      objc_msgSend(v10, "focusedItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _rememberFocusedItem:forViewController:](self, "_rememberFocusedItem:forViewController:", v8, v5);

    }
  }
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x200u;
  if (-[_UITabBarControllerVisualStyle updatesTabBarFocusHeadingOnChange](self->_visualStyle, "updatesTabBarFocusHeadingOnChange"))
  {
    -[UITabBarController tabBar](self, "tabBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setPreferredFocusHeading:", a3);

  }
  -[UIViewController _setNeedsNonDeferredFocusUpdate](self, "_setNeedsNonDeferredFocusUpdate");

}

- (id)_responderSelectionContainerViewForResponder:(id)a3
{
  UIView *v4;

  if (-[UITabBarController _isTabBarFocused](self, "_isTabBarFocused", a3))
  {
    -[UITabBarController tabBar](self, "tabBar");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_viewControllerTransitionView;
  }
  return v4;
}

- (BOOL)_isTabBarFocused
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_UITabBarControllerVisualStyle tabBarView](self->_visualStyle, "tabBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _focusSystem](self, "_focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_focusedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDescendantOfView:", v3);

  return v6;
}

- (void)_setPreferTabBarFocused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFDFF | v3);
}

- (BOOL)_preferTabBarFocused
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 1) & 1;
}

- (void)unwindForSegue:(id)a3 towardsViewController:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a4;
  -[UITabBarController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if (v6)
    -[UITabBarController setSelectedViewController:](self, "setSelectedViewController:", v7);

}

- (void)applicationWillSuspend
{
  void *v3;
  int isSidebarSupportedAnd;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController applicationWillSuspend](&v6, sel_applicationWillSuspend);
  -[UITabBarController sidebar](self, "sidebar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isSidebarSupportedAnd = -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v3);

  if (isSidebarSupportedAnd)
  {
    -[UITabBarController _viewControllersForTabs]((id *)&self->super.super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "count");
    _uip_floatingTabBar_sendAnalyticsEvent();

  }
}

- (NSArray)_tabElements
{
  return -[_UITabModel tabItems](self->_tabModel, "tabItems");
}

- (UITab)_selectedTabElement
{
  return -[_UITabModel selectedItem](self->_tabModel, "selectedItem");
}

- (void)_configureTabModel
{
  _UITabModel *v3;
  _UITabModel *tabModel;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_UITabModel);
  tabModel = self->_tabModel;
  self->_tabModel = v3;

  -[_UITabModel setTabBarController:](self->_tabModel, "setTabBarController:", self);
  v7[0] = 0x1E1A994F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v5, self, sel__validateTabSelectionIfNeeded);

}

- (uint64_t)_shouldSelectTab:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  char v6;
  id WeakRetained;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_isBridgedItem") & 1) != 0
      || (v5 = objc_loadWeakRetained((id *)(a1 + 1168)),
          v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) == 0))
    {
      a1 = 1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1168));
      a1 = objc_msgSend(WeakRetained, "tabBarController:shouldSelectTab:", a1, v3);

    }
  }

  return a1;
}

- (void)_rebuildTabModelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIViewController *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  UITabBarController *v21;
  id v22;
  id v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) != 0)
  {
    -[_UITabBarControllerVisualStyle updateViewControllers:](self->_visualStyle, "updateViewControllers:", a3);
  }
  else
  {
    -[UITabBarController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(UIViewController **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          if (v12 != self->_transientViewController)
          {
            -[UIViewController _resolvedTab](v12, "_resolvedTab");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    -[UITabBarController selectedViewController](self, "selectedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__UITabBarController__rebuildTabModelAnimated___block_invoke;
    v19[3] = &unk_1E16BD778;
    v20 = v6;
    v21 = self;
    v22 = v14;
    v23 = v7;
    v24 = v3;
    v15 = v7;
    v16 = v14;
    v17 = v6;
    -[UITabBarController _performWithoutNotifyingSelectionChange:](self, "_performWithoutNotifyingSelectionChange:", v19);
    -[_UITabBarControllerVisualStyle updateViewControllers:](self->_visualStyle, "updateViewControllers:", v3);
    -[UIViewController _existingView](self, "_existingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

  }
}

void __47__UITabBarController__rebuildTabModelAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;
  id v15;
  char v16;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 40);
  if (v3)
    v3 = (_QWORD *)v3[144];
  v4 = v3;
  objc_msgSend(v4, "tabItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 0;
  }
  else
  {
    v8 = 1;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6) ^ 1;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__UITabBarController__rebuildTabModelAnimated___block_invoke_2;
  aBlock[3] = &unk_1E16BD778;
  aBlock[4] = *(_QWORD *)(a1 + 40);
  v9 = v7;
  v13 = v9;
  v16 = v8;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (*(_BYTE *)(a1 + 64))
    (*((void (**)(void *))v10 + 2))(v10);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

}

void __47__UITabBarController__rebuildTabModelAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 1152);
  else
    v4 = 0;
  objc_msgSend(v4, "setTabItems:", v2);
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      if (objc_msgSend(*(id *)(a1 + 56), "containsObject:"))
      {
        v5 = *(void **)(a1 + 48);
        if (v5 != *(void **)(*(_QWORD *)(a1 + 32) + 1032))
        {
          objc_msgSend(v5, "_resolvedTab");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = *(_QWORD *)(a1 + 32);
          if (v7)
            v8 = *(void **)(v7 + 1152);
          else
            v8 = 0;
          v9 = (id)v6;
          objc_msgSend(v8, "selectElement:notifyOnReselection:", v6, 0);

        }
      }
    }
  }
}

- (id)_resolvedPopoverPresentationControllerSourceItemForTab:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[135], "resolvedPopoverPresentationControllerSourceItemForTab:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_selectedElementDidChange:(void *)a3 previousElement:
{
  id v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    if (v9)
    {
      objc_msgSend(a1, "_validateTabSelectionIfNeeded");
      if ((a1[1105] & 0x40) == 0)
      {
        objc_msgSend(v9, "_displayedViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          do
          {
            objc_msgSend(v6, "parentViewController");
            v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();

            if (v7 == a1)
              break;
            objc_msgSend(v6, "parentViewController");
            v8 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v8;
          }
          while (v8);
        }
        objc_msgSend(a1, "_setSelectedViewControllerAndNotify:", v6);

      }
    }
  }

}

- (void)_selectedLeafDidChange:(void *)a3 previousLeaf:
{
  id v5;
  int v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(_DWORD *)(a1 + 1104);
    if ((v6 & 0x4000) == 0)
    {
      objc_msgSend(*(id *)(a1 + 1152), "selectedItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_isGroup"))
        objc_msgSend(v7, "_updateManagingNavigationStackUsingTransition:", 2);

      v6 = *(_DWORD *)(a1 + 1104);
    }
    if (v11)
    {
      if ((v6 & 0x8000) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 1168));
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = objc_loadWeakRetained((id *)(a1 + 1168));
          objc_msgSend(v10, "tabBarController:didSelectTab:previousTab:", a1, v11, v5);

        }
      }
    }
  }

}

- (void)_performWithoutNotifyingSelectionChange:(id)a3
{
  *(_DWORD *)&self->_tabBarControllerFlags |= 0x4000u;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x4000u;
}

- (void)_validateTabSelectionIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIMoreNavigationController *v12;
  UIMoreNavigationController *v13;
  void *v14;
  void *v15;
  UIMoreNavigationController *v16;
  UIMoreNavigationController *v17;
  UIMoreNavigationController *v18;
  void *v19;
  _UITabModel *v20;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  LODWORD(v3) = -[_UITabBarControllerVisualStyle shouldEnforceChildSelectionInGroupTabs](self->_visualStyle, "shouldEnforceChildSelectionInGroupTabs");
  v20 = self->_tabModel;
  if ((_DWORD)v3)
  {
    -[_UITabModel selectedItem](v20, "selectedItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (objc_msgSend(v5, "_isGroup"))
    {
      v6 = v5;
      while (1)
      {
        v7 = v6;
        objc_msgSend(v7, "selectedChild");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          objc_msgSend(v7, "_defaultChildForSelection");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
            break;
        }

        if ((objc_msgSend(v6, "_isGroup") & 1) == 0)
          goto LABEL_9;
      }

      v6 = v7;
    }
LABEL_9:
    -[_UITabModel selectedLeaf](self->_tabModel, "selectedLeaf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v6)
    {
      if (v6)
      {
        do
        {
          objc_msgSend(v6, "_parentGroup");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "selectedChild");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v6)
            break;
          objc_msgSend(v6, "_parentGroup");
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }
        while (v11);
      }
      -[_UITabModel selectElement:notifyOnReselection:](self->_tabModel, "selectElement:notifyOnReselection:", v6, 0);
    }
    if (-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem")
      && objc_msgSend(v5, "_isMoreTab"))
    {
      v12 = self->_moreNavigationController;
      -[UIMoreNavigationController displayedViewController](v12, "displayedViewController");
      v13 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();
      if (v13 == v12)
      {
        -[UIMoreNavigationController moreViewControllers](v12, "moreViewControllers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v13 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();

      }
      -[UIMoreNavigationController _resolvedTab](v13, "_resolvedTab");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITabModel selectElement:notifyOnReselection:](v20, "selectElement:notifyOnReselection:", v15, 0);

    }
  }
  v16 = self->_moreNavigationController;
  v17 = v16;
  if (v4 != 2)
  {
    if (v16)
    {
      -[UITabBarController selectedViewController](self, "selectedViewController");
      v18 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();

      if (v18 == v17)
      {
        -[UIMoreNavigationController _resolvedTab](v17, "_resolvedTab");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITabModel selectElement:notifyOnReselection:](v20, "selectElement:notifyOnReselection:", v19, 0);

      }
    }
  }

}

- (void)_displayedViewControllerDidChangeForTab:(void *)a3 previousViewController:
{
  id v5;
  id v6;
  void *v7;
  int *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1 && (*(_BYTE *)(a1 + 1105) & 0x80) != 0)
  {
    if (objc_msgSend(v5, "_isUniquelySPI"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__displayedViewControllerDidChangeForTab_previousViewController_, a1, CFSTR("UITabBarController.m"), 1516, CFSTR("_UITabElement (%@) is not supported with displayedViewControllers"), v5);

    }
    objc_msgSend(v5, "_displayedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 1112), "mutableCopy");
    v10 = objc_msgSend(*(id *)(a1 + 1112), "indexOfObject:", v6);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL
      && (objc_msgSend((id)a1, "tabs"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v11, "indexOfObject:", v5),
          v11,
          v10 == 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v9, "removeAllObjects");
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend((id)a1, "tabs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "_displayedViewController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

      v8 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
    }
    else
    {
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v7);
    }
    objc_msgSend((id)a1, "_setViewControllers:animated:", v9, 0);
    v18 = v8[930];
    v19 = *(void **)(a1 + v18);
    *(_QWORD *)(a1 + v18) = v9;

  }
}

- (id)_displayedViewControllersForTab:(void *)a3 proposedViewControllers:
{
  id v5;
  id v6;
  id WeakRetained;
  char v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 146);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0
      || (v9 = objc_loadWeakRetained(a1 + 146),
          objc_msgSend(v9, "tabBarController:displayedViewControllersForTab:proposedViewControllers:", a1, v5, v6),
          a1 = (id *)objc_claimAutoreleasedReturnValue(),
          v9,
          !a1))
    {
      a1 = (id *)v6;
    }
  }

  return a1;
}

- (id)preferredFocusedView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 2) != 0)
  {
    -[_UITabBarControllerVisualStyle tabBarView](self->_visualStyle, "tabBarView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_3;
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)UITabBarController;
    -[UIViewController preferredFocusedView](&v8, sel_preferredFocusedView);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFocusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
LABEL_3:
  v5 = v4;
LABEL_6:
  v6 = v5;

  return v6;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v7;

  if (!qword_1ECD7B640)
  {
    qword_1ECD7B640 = +[UITabBarController instanceMethodForSelector:](UITabBarController, "instanceMethodForSelector:", sel_preferredFocusedView);
    qword_1ECD7B648 = +[UITabBarController instanceMethodForSelector:](UITabBarController, "instanceMethodForSelector:", sel_preferredFocusEnvironments);
  }
  v3 = -[UITabBarController methodForSelector:](self, "methodForSelector:", sel_preferredFocusedView);
  v4 = -[UITabBarController methodForSelector:](self, "methodForSelector:", sel_preferredFocusEnvironments);
  if (v3)
    v5 = v3 == qword_1ECD7B640;
  else
    v5 = 1;
  if (v5)
    return 0;
  if (v4)
    v7 = v4 == qword_1ECD7B648;
  else
    v7 = 1;
  if (v7)
    return 1;
  else
    return 2;
}

- (id)preferredFocusEnvironments
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabBarControllerVisualStyle tabBarView](self->_visualStyle, "tabBarView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 2) == 0)
  {
    if (v4)
      objc_msgSend(v3, "addObject:", v4);
    v7 = v6;
    if (!v6)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(v3, "addObject:", v7);
    goto LABEL_10;
  }
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  v7 = v4;
  if (v4)
    goto LABEL_9;
LABEL_10:
  v11.receiver = self;
  v11.super_class = (Class)UITabBarController;
  -[UIViewController preferredFocusEnvironments](&v11, sel_preferredFocusEnvironments, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v3, -[UITabBarController _subclassPreferredFocusedViewPrioritizationType](self, "_subclassPreferredFocusedViewPrioritizationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_rememberPresentingFocusedItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  v4 = a3;
  -[UIViewController _rememberPresentingFocusedItem:](&v6, sel__rememberPresentingFocusedItem_, v4);
  -[UITabBarController selectedViewController](self, "selectedViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController _rememberFocusedItem:forViewController:](self, "_rememberFocusedItem:forViewController:", v4, v5);

}

- (BOOL)_canRestoreFocusAfterTransitionToRecalledItem:(id)a3 inViewController:(id)a4
{
  id v6;
  id v7;
  char IsFocusedOrFocusable;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    IsFocusedOrFocusable = -[UIViewController _canRestoreFocusAfterTransitionToItem:](self, "_canRestoreFocusAfterTransitionToItem:", v6);
  }
  else if (-[UIViewController restoresFocusAfterTransition](self, "restoresFocusAfterTransition")
         && objc_msgSend(v7, "restoresFocusAfterTransition"))
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIFocusEnvironmentIsAncestorOfEnvironment(v9, v6))
      IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v6);
    else
      IsFocusedOrFocusable = 0;

  }
  else
  {
    IsFocusedOrFocusable = 0;
  }

  return IsFocusedOrFocusable;
}

- (id)_overridingPreferredFocusEnvironment
{
  id v3;
  void *v4;
  void *v5;
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UITabBarController;
  -[UIViewController _overridingPreferredFocusEnvironment](&v14, sel__overridingPreferredFocusEnvironment);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  -[UIViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    tabBarControllerFlags = self->_tabBarControllerFlags;

    if ((*(_WORD *)&tabBarControllerFlags & 0x200) != 0)
      return 0;
    -[UITabBarController selectedViewController](self, "selectedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _recallRememberedFocusedItemForViewController:](self, "_recallRememberedFocusedItemForViewController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (-[UITabBarController _canRestoreFocusAfterTransitionToRecalledItem:inViewController:](self, "_canRestoreFocusAfterTransitionToRecalledItem:inViewController:", v7, v4))
      {
        v3 = v7;
LABEL_17:

        goto LABEL_18;
      }
      -[UITabBarController _forgetFocusedItemForViewController:](self, "_forgetFocusedItemForViewController:", v4);
    }
    else if (-[UITabBarController _isModernTVTabBar](self, "_isModernTVTabBar")
           && -[UITabBarController _shouldFocusViewControllerAfterTransition](self, "_shouldFocusViewControllerAfterTransition"))
    {
      objc_msgSend(v4, "preferredFocusEnvironments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController _focusSystem](self, "_focusSystem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "focusedItem");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (!v10
        || v10 == (void *)v12
        || objc_msgSend(v11, "_focusedItemIsContainedInEnvironment:includeSelf:", v10, 1))
      {
        -[UITabBarController set_shouldFocusViewControllerAfterTransition:](self, "set_shouldFocusViewControllerAfterTransition:", 0);
        v3 = 0;
      }
      else
      {
        v3 = v10;
      }

      goto LABEL_17;
    }
    v3 = 0;
    goto LABEL_17;
  }
  v3 = 0;
LABEL_18:

  return v3;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 IsAncestorOfEnvironment;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  -[UIViewController _didUpdateFocusInContext:](&v12, sel__didUpdateFocusInContext_, v5);
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFocusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v8);

  if (-[_UITabBarControllerVisualStyle shouldForgetRememberedFocusItemForSelectedViewController:context:](self->_visualStyle, "shouldForgetRememberedFocusItemForSelectedViewController:context:", v6, v5))
  {
    -[UITabBarController _forgetFocusedItemForViewController:](self, "_forgetFocusedItemForViewController:", v6);
  }
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 1669, CFSTR("Received call to _didUpdateFocusInContext: outside of a focus update."));

  }
  -[UITabBarController _setPreferTabBarFocused:](self, "_setPreferTabBarFocused:", -[UITabBarController _isTabBarFocused](self, "_isTabBarFocused"));
  -[_UITabBarControllerVisualStyle didUpdateFocusInContext:withAnimationCoordinator:](self->_visualStyle, "didUpdateFocusInContext:withAnimationCoordinator:", v5, v10);
  if (IsAncestorOfEnvironment)
    -[UITabBarController set_shouldFocusViewControllerAfterTransition:](self, "set_shouldFocusViewControllerAfterTransition:", 0);

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  UITabBarController *v20;
  void *v21;
  UITabBarController *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UITabBarController;
  if (!-[UIViewController shouldUpdateFocusInContext:](&v30, sel_shouldUpdateFocusInContext_, v4))
  {
    v5 = 0;
    goto LABEL_33;
  }
  if ((objc_msgSend(v4, "focusHeading") & 0x330) == 0)
  {
    objc_msgSend(v4, "nextFocusedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController tabBar](self, "tabBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    objc_msgSend(v4, "previouslyFocusedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController tabBar](self, "tabBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

    v12 = 0;
    if (((v8 ^ 1) & 1) == 0 && (v11 & 1) == 0)
      v12 = (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 5) & 1;
    v13 = (v8 ^ 1) & v11;
    if ((v12 & 1) != 0 || v13)
    {
      switch(-[UITabBarController _effectiveTabBarPosition](self, "_effectiveTabBarPosition"))
      {
        case 1:
          v14 = objc_msgSend(v4, "focusHeading");
          v15 = 1;
          if (v12)
            v15 = 2;
          goto LABEL_22;
        case 2:
          v14 = objc_msgSend(v4, "focusHeading");
          v15 = 1;
          if (!v12)
            v15 = 2;
          goto LABEL_22;
        case 3:
          v14 = objc_msgSend(v4, "focusHeading");
          v16 = v12 == 0;
          v15 = 8;
          v17 = 4;
          goto LABEL_20;
        case 4:
          v14 = objc_msgSend(v4, "focusHeading");
          v16 = v12 == 0;
          v15 = 4;
          v17 = 8;
LABEL_20:
          if (!v16)
            v15 = v17;
LABEL_22:
          v5 = (v14 & v15) != 0;
          break;
        default:
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v5 = 1;
    }
    -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewControllers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "viewControllers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (!v13 || (objc_msgSend(v4, "focusHeading") & 2) != 0)
      goto LABEL_32;
    -[UIViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "effectiveUserInterfaceLayoutDirection");

    if (v20 == self)
    {
      v25 = objc_msgSend(v4, "focusHeading");
      v26 = v24 == 1;
      v27 = 8;
      v28 = 4;
    }
    else
    {
      if (v22 != self)
      {
LABEL_32:

        goto LABEL_33;
      }
      v25 = objc_msgSend(v4, "focusHeading");
      v26 = v24 == 1;
      v27 = 4;
      v28 = 8;
    }
    if (v26)
      v27 = v28;
    v5 = (v25 & v27) != 0;
    goto LABEL_32;
  }
  v5 = 1;
LABEL_33:

  return v5;
}

- (NSMapTable)_rememberedFocusedItemsByViewController
{
  NSMapTable *rememberedFocusedItemsByViewController;
  NSMapTable *v4;
  NSMapTable *v5;

  rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  if (!rememberedFocusedItemsByViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rememberedFocusedItemsByViewController;
    self->_rememberedFocusedItemsByViewController = v4;

    rememberedFocusedItemsByViewController = self->_rememberedFocusedItemsByViewController;
  }
  return rememberedFocusedItemsByViewController;
}

- (void)_rememberFocusedItem:(id)a3 forViewController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UITabBarController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)_forgetFocusedItemForViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITabBarController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)_recallRememberedFocusedItemForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITabBarController _rememberedFocusedItemsByViewController](self, "_rememberedFocusedItemsByViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isFocusedTabVisible
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[UITabBar _focusedIndex](self->_tabBar, "_focusedIndex");
  -[UITabBarController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = -[UITabBarController selectedIndex](self, "selectedIndex");
  return v3 == v6;
}

- (void)_compatibility_updateViewController:(id)a3 forTabBarObservedScrollView:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  if (-[_UITabBarControllerVisualStyle isScrollViewObservationInCompatibilityMode](self->_visualStyle, "isScrollViewObservationInCompatibilityMode"))
  {
    if (_UIViewControllerUseContentScrollViewAPI())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 1788, CFSTR("Invalid code path for new API. This is a UIKit problem."));

    }
    v6 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained((id *)&self->_observingScrollView);

      if (v9 != v6)
      {
        v10 = objc_loadWeakRetained((id *)&self->_observingScrollView);
        objc_msgSend(v10, "_removeScrollViewScrollObserver:", self);

      }
    }
    objc_storeWeak((id *)&self->_observingScrollView, v6);
    if (v6)
      objc_msgSend(v6, "_addScrollViewScrollObserver:", self);
    -[_UITabBarControllerVisualStyle adjustTabBarForContentScrollView:](self->_visualStyle, "adjustTabBarForContentScrollView:", v6);

  }
}

- (void)_addChildViewController:(id)a3
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  -[UIViewController _addChildViewController:](&v5, sel__addChildViewController_, a3);
  tabBarControllerFlags = self->_tabBarControllerFlags;
  if ((*(_WORD *)&tabBarControllerFlags & 0x8000) == 0)
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags | 2);
}

- (id)_tabs_compactTabs
{
  UITabBarController *v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x1E0C80C00];
  v3 = &OBJC_IVAR____UIKeyboardStateManager_m_deferredDidSetDelegateAction;
  if (self)
    self = (UITabBarController *)self->_tabModel;
  -[UITabBarController tabItems](self, "tabItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarController compactTabIdentifiers](v2, "compactTabIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v20 = v4;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v11 = v3;
          v12 = v3[931];
          objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v12), "tabItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __39__UITabBarController__tabs_compactTabs__block_invoke;
          v23[3] = &unk_1E16BFD48;
          v23[4] = v10;
          v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v23);

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + v12), "tabItems");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "addObject:", v16);
          }
          v3 = v11;
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

    v17 = objc_msgSend(v21, "copy");
    v4 = (void *)v17;
    v5 = v19;
  }

  return v4;
}

uint64_t __39__UITabBarController__tabs_compactTabs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  return v8;
}

- (void)_tabs_rebuildTabBarItemsAnimated:(BOOL)a3
{
  id v5;
  _BOOL4 v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id *p_isa;
  UITabBarController *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  _QWORD v22[5];
  id v23;
  unint64_t v24;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem"))
    v6 = -[NSMutableArray count](self->_moreChildViewControllers, "count") != 0;
  else
    v6 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v6);
  v7 = -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems")
     - (*(_DWORD *)&self->_tabBarControllerFlags & 1);
  -[UITabBarController _tabs_compactTabs](self, "_tabs_compactTabs");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "count");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke;
  v22[3] = &unk_1E16BFD70;
  v24 = v7;
  v22[4] = self;
  v10 = v5;
  v23 = v10;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);
  if (-[_UITabBarControllerVisualStyle supportsShowingMoreItem](self->_visualStyle, "supportsShowingMoreItem")
    && -[NSMutableArray count](self->_moreChildViewControllers, "count"))
  {
    -[UITabBarController moreNavigationController](self, "moreNavigationController");
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _parentViewController](p_isa);
    v12 = (UITabBarController *)objc_claimAutoreleasedReturnValue();

    if (v12 != self)
    {
      -[UIViewController addChildViewController:](self, "addChildViewController:", p_isa);
      objc_msgSend(p_isa, "didMoveToParentViewController:", self);
    }
    v13 = (void *)-[NSMutableArray copy](self->_moreChildViewControllers, "copy");
    objc_msgSend(p_isa, "setMoreViewControllers:", v13);
    objc_msgSend(p_isa, "tabBarItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _configureTargetActionForTabBarItem:](self, "_configureTargetActionForTabBarItem:", v14);
    objc_msgSend(v10, "addObject:", v14);

    v15 = 1;
  }
  else
  {
    -[UIMoreNavigationController _restoreOriginalNavigationController](self->_moreNavigationController, "_restoreOriginalNavigationController");
    v15 = 0;
    p_isa = (id *)&self->_moreNavigationController->super.super.super.super.isa;
    self->_moreNavigationController = 0;
  }

  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFC | v15);
  -[UITabBarController tabBar](self, "tabBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke_2;
  v19[3] = &unk_1E16B4008;
  v19[4] = self;
  v20 = v10;
  v21 = a3;
  v17 = v10;
  -[UITabBar _performWhileIgnoringLock:]((uint64_t)v16, v19);

  -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
}

void __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v5;

  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(a2, "_linkedTabBarItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_configureTargetActionForTabBarItem:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

void __55__UITabBarController__tabs_rebuildTabBarItemsAnimated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tabBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __50__UITabBarController__rebuildTabBarItemsAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tabBar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

uint64_t __51__UITabBarController__setViewControllers_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedViewController:", *(_QWORD *)(a1 + 40));
}

void __64__UITabBarController__setSelectedViewController_performUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_tabModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(void **)(v4 + 1152);
  else
    v5 = 0;

  if (v3 == v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isGroup"))
      objc_msgSend(*(id *)(a1 + 32), "_updateManagingNavigationStackUsingTransition:", 0);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(void **)(v6 + 1152);
    else
      v7 = 0;
    objc_msgSend(v7, "selectElement:notifyOnReselection:", *(_QWORD *)(a1 + 32), 0);
  }
}

- (int64_t)preferredLeadingStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle preferredLeadingStatusBarStyle](self->_visualStyle, "preferredLeadingStatusBarStyle");
}

- (int64_t)preferredCenterStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle preferredCenterStatusBarStyle](self->_visualStyle, "preferredCenterStatusBarStyle");
}

- (int64_t)preferredTrailingStatusBarStyle
{
  return -[_UITabBarControllerVisualStyle preferredTrailingStatusBarStyle](self->_visualStyle, "preferredTrailingStatusBarStyle");
}

- (id)childViewControllerForUserInterfaceStyle
{
  return self->_selectedViewController;
}

- (id)childViewControllerForPointerLock
{
  return self->_selectedViewController;
}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return self->_selectedViewController;
}

- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations
{
  return self->_selectedViewController;
}

- (BOOL)_transitionsChildViewControllers
{
  return 0;
}

- (BOOL)_uip_isSidebarVisible
{
  void *v2;
  char v3;

  -[UITabBarController sidebar](self, "sidebar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)_uip_setSidebarVisible:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[UITabBarController sidebar](self, "sidebar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", !v3);

}

- (int64_t)_uip_preferredSidebarMode
{
  int64_t result;

  result = -[UITabBarController mode](self, "mode");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (void)_uip_setPreferredSidebarMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    a3 = 0;
  -[UITabBarController setMode:](self, "setMode:", a3);
}

- (void)_tab:(void *)a3 operationForAcceptingItemsFromDropSession:
{
  id v5;
  id v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  int v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "_isUniquelySPI");
    objc_msgSend(a1, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_uip_tabBarController:tab:operationForAcceptingItemsFromDropSession:", a1, v5, v6);
LABEL_7:
        a1 = (void *)v11;

        goto LABEL_9;
      }
    }
    else
    {
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "tabBarController:tab:operationForAcceptingItemsFromDropSession:", a1, v5, v6);
        goto LABEL_7;
      }
    }
    a1 = 0;
  }
LABEL_9:

  return a1;
}

- (void)_tab:(void *)a3 acceptItemsFromDropSession:
{
  id v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(v11, "_isUniquelySPI");
    objc_msgSend(a1, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_uip_tabBarController:tab:acceptItemsFromDropSession:", a1, v11, v5);
LABEL_7:

      }
    }
    else
    {
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tabBarController:tab:acceptItemsFromDropSession:", a1, v11, v5);
        goto LABEL_7;
      }
    }
  }

}

- (void)_tabDropSessionDidUpdate:(void *)a3 withDestinationTab:
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_uip_tabBarController:dropSessionDidUpdate:withDestinationTab:", a1, v9, v5);

    }
  }

}

- (BOOL)_isInSidebarTransition
{
  return *((_BYTE *)&self->_tabBarControllerFlags + 2) & 1;
}

- (double)_sidebarOverlapAmount
{
  void *v1;
  double Width;
  void *v3;
  CGRect v5;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "sidebar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  Width = 0.0;
  if (-[UITabBarControllerSidebar _resolvedLayout]((uint64_t)v1) == 1
    && -[UITabBarControllerSidebar _isSidebarSupportedAndVisible](v1))
  {
    objc_msgSend(v1, "_outlineView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    Width = CGRectGetWidth(v5);

  }
  return Width;
}

- (void)beginCustomizingTabBar:(id)a3
{
  void *v4;
  id tabBarItemsToViewControllers;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_tabBarItemsToViewControllers = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UITabBarController viewControllers](self, "viewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "tabBarItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(self->_tabBarItemsToViewControllers, "setObject:forKey:", v12, v13);
        -[UITabBarController customizableViewControllers](self, "customizableViewControllers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend(v14, "containsObject:", v12);

        if ((_DWORD)v12)
          objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[UITabBarController tabBar](self, "tabBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLocked:", 0);

  -[UITabBarController tabBar](self, "tabBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginCustomizingItems:", v6);

  -[UITabBarController tabBar](self, "tabBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocked:", 1);

}

- (void)tabBar:(id)a3 willBeginCustomizingItems:(id)a4
{
  void *v5;
  id v6;

  -[UITabBarController delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITabBarController viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabBarController:willBeginCustomizingViewControllers:", self, v5);

  }
}

- (void)tabBarSizingDidChange:(id)a3
{
  void *v4;

  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
  -[UIViewController _existingView](self, "_existingView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UITabBarController _prepareTabBar](self, "_prepareTabBar");
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController _viewsWithDisabledInteractionGivenTransitionContext:](&v6, sel__viewsWithDisabledInteractionGivenTransitionContext_, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_tabBar)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (void)tabBar:(id)a3 willEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id tabBarItemsToViewControllers;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v5)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __61__UITabBarController_tabBar_willEndCustomizingItems_changed___block_invoke;
  v32[3] = &unk_1E16BFD98;
  v32[4] = self;
  v9 = v8;
  v33 = v9;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v9;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v25)
    goto LABEL_20;
  v26 = 0;
  v23 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v29 != v23)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v24, "objectAtIndex:", v26 + i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v26 + i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v11)
      {
        *(_DWORD *)&self->_tabBarControllerFlags |= 2u;
        v14 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_moreChildViewControllers, "indexOfObjectIdenticalTo:", v11);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(obj, "indexOfObjectIdenticalTo:", v13) == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSMutableArray addObject:](self->_moreChildViewControllers, "addObject:", v13);
            goto LABEL_15;
          }
        }
        else
        {
          v15 = v14;
          objc_msgSend(v11, "willMoveToParentViewController:", self);
          -[UITabBarController _addChildViewController:](self, "_addChildViewController:", v11);
          objc_msgSend(v11, "didMoveToParentViewController:", self);
          if (objc_msgSend(obj, "indexOfObjectIdenticalTo:", v13) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = (id)objc_msgSend(v13, "popToRootViewControllerAnimated:", 0);
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_moreChildViewControllers, "replaceObjectAtIndex:withObject:", v15, v13);
LABEL_15:
            objc_msgSend(v13, "willMoveToParentViewController:", 0);
            -[UIViewController _removeChildViewController:](self, "_removeChildViewController:", v13);
            objc_msgSend(v13, "didMoveToParentViewController:", 0);
          }
          else
          {
            -[NSMutableArray removeObjectAtIndex:](self->_moreChildViewControllers, "removeObjectAtIndex:", v15);
          }
        }
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v26 + i, v11);
        -[UITabBarController _configureTargetActionForTabBarItem:](self, "_configureTargetActionForTabBarItem:", v12);
      }

    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    v26 += i;
  }
  while (v25);
LABEL_20:

  v17 = objc_msgSend(v7, "count");
  if (v17 > -[UITabBarController _effectiveMaxItems](self, "_effectiveMaxItems"))
  {
    -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMoreViewControllersChanged:", 1);

    -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMoreViewControllers:", self->_moreChildViewControllers);

  }
  tabBarItemsToViewControllers = self->_tabBarItemsToViewControllers;
  self->_tabBarItemsToViewControllers = 0;

  -[UITabBarController _rebuildTabBarItemsIfNeeded](self, "_rebuildTabBarItemsIfNeeded");
  v5 = v5;
LABEL_23:
  -[UITabBarController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITabBarController viewControllers](self, "viewControllers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tabBarController:willEndCustomizingViewControllers:changed:", self, v22, v5);

  }
}

void __61__UITabBarController_tabBar_willEndCustomizingItems_changed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)tabBar:(id)a3 didEndCustomizingItems:(id)a4 changed:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  -[UITabBarController delegate](self, "delegate", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITabBarController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabBarController:didEndCustomizingViewControllers:changed:", self, v7, v5);

  }
}

- (id)_scrollViewObservedBeforeHidingBar
{
  return objc_getAssociatedObject(self, &__previouslyObservedScrollViewKey);
}

- (void)_updateBarHiddenByClientStateIfNecessary
{
  int v3;

  if (qword_1ECD7B650 != -1)
    dispatch_once(&qword_1ECD7B650, &__block_literal_global_200);
  if (byte_1ECD7B631)
  {
    if (-[UIView isHidden](self->_tabBar, "isHidden"))
      v3 = 4;
    else
      v3 = 0;
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFFB | v3);
  }
}

void __62__UITabBarController__updateBarHiddenByClientStateIfNecessary__block_invoke()
{
  id v0;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1ECD7B631 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.zhiliaoapp.musically"));

  }
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6
{
  _BOOL4 v8;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _UITabBarControllerVisualStyle *visualStyle;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  char v37;
  id v38;
  void (**v39)(_QWORD);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  double v45;
  void (**v46)(void *, _QWORD);
  UITabBar *tabBar;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  unint64_t v56;
  BOOL v57;
  char v58;
  char v59;
  _QWORD v60[4];
  void (**v61)(_QWORD);
  _QWORD v62[5];
  _QWORD v63[5];
  id v64;
  void (**v65)(_QWORD);
  unint64_t v66;
  BOOL v67;
  char v68;
  char v69;
  _QWORD aBlock[5];
  id v71;
  int v72;
  _QWORD v73[5];
  BOOL v74;

  v8 = a4;
  v11 = -[UITabBarController _wantsBarHidden](self, "_wantsBarHidden");
  *(_DWORD *)&self->_tabBarControllerFlags |= 4 * (a6 & 3);
  if (v11)
    return;
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v53 = (void *)v12;
  v13 = objc_opt_isKindOfClass() & 1;
  if (a6 == 2)
  {
    v15 = MEMORY[0x1E0C809B0];
  }
  else
  {
    visualStyle = self->_visualStyle;
    v15 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke;
    v73[3] = &unk_1E16B1B78;
    v73[4] = self;
    v74 = a3 != 0;
    -[_UITabBarControllerVisualStyle performWithoutNotifyingTabBarController:](visualStyle, "performWithoutNotifyingTabBarController:", v73);
  }
  if (-[_UITabBarControllerVisualStyle canDisplayUITabBar](self->_visualStyle, "canDisplayUITabBar"))
    v16 = a3;
  else
    v16 = 0;
  -[UIView frame](self->_viewControllerTransitionView, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_viewControllerTransitionView, "setFrame:", v18, v20, v22);
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v24;
  if ((v16 - 1) <= 1)
  {
    v25 = v13;
    objc_msgSend(v24, "_mainContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_animator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v26, "_animator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "resizedFromContainerView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView frame](self->_tabBar, "frame");
        v32 = v31;
        v34 = v33;
        v51 = v30;
        objc_msgSend(v30, "bounds");
        -[UITabBar setFrame:](self->_tabBar, "setFrame:", 0.0, v35 - v34, v32, v34);
        v36 = 0;
        goto LABEL_16;
      }
    }
    else
    {

      v29 = 0;
    }
    v51 = 0;
    v36 = 1;
LABEL_16:
    LOBYTE(v13) = v25;
    if (v25)
      goto LABEL_17;
LABEL_13:
    v37 = 0;
    goto LABEL_21;
  }
  v29 = 0;
  v51 = 0;
  v36 = 1;
  if (!(_DWORD)v13)
    goto LABEL_13;
LABEL_17:
  v37 = objc_msgSend(v53, "_didExplicitlyHideTabBar");
  if (v8)
    objc_msgSend(v53, "_setDidExplicitlyHideTabBar:", 1);
  if ((_DWORD)v16 == 6)
    objc_msgSend(v53, "_setCrossfadingOutTabBar:", 1);
LABEL_21:
  aBlock[0] = v15;
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_2;
  aBlock[3] = &unk_1E16B5C50;
  aBlock[4] = self;
  v38 = v29;
  v71 = v38;
  v72 = v16;
  v39 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((v36 & 1) != 0
    || (-[UIView superview](self->_tabBar, "superview"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        v40,
        !v40))
  {
    if ((_DWORD)v16)
    {
      v44 = v37;
      if (a5 < 0.0)
      {
        objc_msgSend((id)objc_opt_class(), "durationForTransition:", v16);
        a5 = v45;
      }
      v43 = v52;
      if (v52)
      {
        v60[0] = v15;
        v60[1] = 3221225472;
        v60[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_6;
        v60[3] = &unk_1E16B1CC8;
        v61 = v39;
        v46 = (void (**)(void *, _QWORD))_Block_copy(v60);
        tabBar = self->_tabBar;
        v54[0] = v15;
        v54[1] = 3221225472;
        v54[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_8;
        v54[3] = &unk_1E16BFDE8;
        v54[4] = self;
        v56 = a6;
        v57 = a6 != 2;
        v58 = v13;
        v55 = v53;
        v59 = v44;
        if ((objc_msgSend(v52, "animateAlongsideTransitionInView:animation:completion:", tabBar, v46, v54) & 1) == 0)
          v46[2](v46, 0);

      }
      else
      {
        v62[0] = v15;
        v62[1] = 3221225472;
        v62[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_5;
        v62[3] = &unk_1E16B3FD8;
        v62[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v39, v62, a5, 0.0);
      }
      v42 = v51;
      goto LABEL_36;
    }
    v39[2](v39);
    v42 = v51;
    v43 = v52;
    goto LABEL_33;
  }
  -[UIView superview](self->_tabBar, "superview");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBar set_expectedSuperviewFollowingAnimation:](self->_tabBar, "set_expectedSuperviewFollowingAnimation:", v41);

  v42 = v51;
  objc_msgSend(v51, "addSubview:", self->_tabBar);
  v63[0] = v15;
  v63[1] = 3221225472;
  v63[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_3;
  v63[3] = &unk_1E16BFDC0;
  v63[4] = self;
  v65 = v39;
  v66 = a6;
  v67 = a6 != 2;
  v68 = v13;
  v64 = v53;
  v69 = v37;
  v43 = v52;
  objc_msgSend(v52, "animateAlongsideTransition:completion:", 0, v63);

  if (!(_DWORD)v16)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController animationDidStop:finished:context:](self, "animationDidStop:finished:context:", CFSTR("UITabBarControllerHideBar"), v48, 0);

  }
LABEL_36:
  -[UIViewController traitCollection](self, "traitCollection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "userInterfaceIdiom");

  if (v50 == 6)
    -[UITabBarController _rebuildTabModelAnimated:](self, "_rebuildTabModelAnimated:", 1);

}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:animated:", 1, *(unsigned __int8 *)(a1 + 40));
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
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

  v2 = transitionGapGivenTabController(*(void **)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "frame", v2);
    v4 = v3;
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8 - v6;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
    v11 = 0.0;
    v12 = v9;
    v13 = v4;
    v14 = v6;
LABEL_3:
    objc_msgSend(v10, "setFrame:", v11, v12, v13, v14);
  }
  else
  {
    v15 = v2;
    switch(*(_DWORD *)(a1 + 48))
    {
      case 1:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "frame");
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
        v11 = v16 - (v15 + v13);
        goto LABEL_3;
      case 2:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "frame");
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
        v11 = v17 + v15 + v13;
        goto LABEL_3;
      case 6:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", 0.0);
        break;
      case 7:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "frame");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "bounds");
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
        v12 = v21 + v26;
        v11 = v19;
        v13 = v23;
        v14 = v25;
        goto LABEL_3;
      default:
        return;
    }
  }
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_expectedSuperviewFollowingAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "set_expectedSuperviewFollowingAnimation:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (objc_msgSend(v8, "isCancelled"))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) & 0xFFFFFFF3 | (4 * (((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) & (4 * ~*(_DWORD *)(a1 + 56))) >> 2) & 3));
    if (*(_BYTE *)(a1 + 64))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 1080);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_4;
      v9[3] = &unk_1E16B1B28;
      v9[4] = v4;
      objc_msgSend(v5, "performWithoutNotifyingTabBarController:", v9);
    }
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 40), "_setDidExplicitlyHideTabBar:", *(unsigned __int8 *)(a1 + 66));
      objc_msgSend(*(id *)(a1 + 40), "_setCrossfadingOutTabBar:", 0);
    }
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isCancelled") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationDidStop:finished:context:", CFSTR("UITabBarControllerHideBar"), v7, 0);

}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:", objc_msgSend(*(id *)(a1 + 32), "_wantsBarHidden"));
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationDidStop:finished:context:", CFSTR("UITabBarControllerHideBar"), v3, 0);

}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "isInteractive"))
    v4 = 196704;
  else
    v4 = 0;
  objc_msgSend(v3, "transitionDuration");
  v6 = v5;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_7;
  v7[3] = &unk_1E16B1BF8;
  v8 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v4, v7, 0, v6, 0.0);

}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  if (objc_msgSend(v7, "isCancelled"))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) & 0xFFFFFFF3 | (4 * (((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) & (4 * ~*(_DWORD *)(a1 + 48))) >> 2) & 3));
    if (*(_BYTE *)(a1 + 56))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 1080);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_9;
      v8[3] = &unk_1E16B1B28;
      v8[4] = v3;
      objc_msgSend(v4, "performWithoutNotifyingTabBarController:", v8);
    }
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "_setDidExplicitlyHideTabBar:", *(unsigned __int8 *)(a1 + 58));
      objc_msgSend(*(id *)(a1 + 40), "_setCrossfadingOutTabBar:", 0);
    }
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isCancelled") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationDidStop:finished:context:", CFSTR("UITabBarControllerHideBar"), v6, 0);

}

uint64_t __72__UITabBarController__hideBarWithTransition_isExplicit_duration_reason___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:", objc_msgSend(*(id *)(a1 + 32), "_wantsBarHidden"));
}

- (void)hideBarWithTransition:(int)a3
{
  -[UITabBarController _hideBarWithTransition:isExplicit:](self, "_hideBarWithTransition:isExplicit:", *(_QWORD *)&a3, 1);
}

- (void)hideBarWithTransition:(int)a3 duration:(double)a4
{
  -[UITabBarController _hideBarWithTransition:isExplicit:duration:](self, "_hideBarWithTransition:isExplicit:duration:", *(_QWORD *)&a3, 1, a4);
}

- (void)_hideBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5
{
  -[UITabBarController _hideBarWithTransition:isExplicit:duration:reason:](self, "_hideBarWithTransition:isExplicit:duration:reason:", *(_QWORD *)&a3, a4, a5, -1.0);
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 reason:(unint64_t)a5
{
  -[UITabBarController _showBarWithTransition:isExplicit:duration:reason:](self, "_showBarWithTransition:isExplicit:duration:reason:", *(_QWORD *)&a3, a4, a5, -1.0);
}

- (void)_showBarWithTransition:(int)a3 isExplicit:(BOOL)a4 duration:(double)a5 reason:(unint64_t)a6
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  int v8;
  int v9;
  _BOOL4 v11;
  void *v14;
  _UITabBarControllerVisualStyle *visualStyle;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  char v23;
  uint64_t v24;
  double v25;
  char v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  UITabBar *tabBar;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void (**v38)(void *, _QWORD);
  UITabBar *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  unint64_t v55;
  char v56;
  char v57;
  _QWORD v58[4];
  void (**v59)(_QWORD);
  _QWORD v60[5];
  _QWORD v61[5];
  id v62;
  void (**v63)(_QWORD);
  unint64_t v64;
  char v65;
  char v66;
  char v67;
  _QWORD aBlock[5];
  int v69;
  _QWORD v70[5];
  BOOL v71;

  tabBarControllerFlags = self->_tabBarControllerFlags;
  v8 = (*(unsigned int *)&tabBarControllerFlags >> 2) & 3;
  v9 = v8 & ~(_DWORD)a6;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFFFF3 | (4 * (v9 & 3)));
  if (v8 != v9)
  {
    v11 = a4;
    if (!-[UITabBarController _wantsBarHidden](self, "_wantsBarHidden"))
    {
      -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v51 = objc_opt_isKindOfClass() & 1;
      visualStyle = self->_visualStyle;
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke;
      v70[3] = &unk_1E16B1B78;
      v70[4] = self;
      v71 = a3 != 0;
      -[_UITabBarControllerVisualStyle performWithoutNotifyingTabBarController:](visualStyle, "performWithoutNotifyingTabBarController:", v70);
      -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transitionCoordinator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a3 - 1) > 1)
      {
        v18 = v17;
      }
      else
      {
        v18 = v17;
        objc_msgSend(v17, "_mainContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_animator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v19, "_animator");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v50 = v22;
            objc_msgSend(v22, "resizedToContainerView");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 0;
            goto LABEL_10;
          }
        }
        else
        {

        }
      }
      v50 = 0;
      v52 = 0;
      v23 = 1;
LABEL_10:
      -[UITabBar setHidden:](self->_tabBar, "setHidden:", 0);
      if (-[_UITabBarControllerVisualStyle canDisplayUITabBar](self->_visualStyle, "canDisplayUITabBar"))
        v24 = a3;
      else
        v24 = 0;
      v25 = transitionGapGivenTabController(self);
      v26 = 0;
      v27 = v18;
      v28 = v14;
      if (v51)
      {
        v26 = objc_msgSend(v14, "_didExplicitlyHideTabBar");
        if (v11)
          objc_msgSend(v14, "_setDidExplicitlyHideTabBar:", 0);
      }
      if ((v23 & 1) != 0)
      {
        switch((int)v24)
        {
          case 1:
            -[UIView frame](self->_tabBar, "frame");
            v30 = v25 + v29;
            tabBar = self->_tabBar;
            goto LABEL_20;
          case 2:
            -[UIView frame](self->_tabBar, "frame");
            -[UIView superview](self->_tabBar, "superview");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "frame");
            v43 = v42;
            -[UIView bounds](self->_tabBar, "bounds");
            v45 = v43 - v44 - v25;

            tabBar = self->_tabBar;
            v30 = v45;
            goto LABEL_20;
          case 3:
            -[UIView frame](self->_tabBar, "frame");
            v47 = v46;
            -[UIView superview](self->_tabBar, "superview");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "bounds");

            tabBar = self->_tabBar;
            v30 = v47;
            goto LABEL_20;
          case 6:
            if (v51)
              objc_msgSend(v14, "_setCrossfadingInTabBar:", 1);
            -[UITabBar setAlpha:](self->_tabBar, "setAlpha:", 0.0);
            -[UIView frame](self->_tabBar, "frame");
            -[UIView superview](self->_tabBar, "superview");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "bounds");

            tabBar = self->_tabBar;
            v30 = 0.0;
            goto LABEL_20;
          default:
            break;
        }
      }
      else
      {
        -[UIView frame](self->_tabBar, "frame");
        objc_msgSend(v52, "bounds");
        tabBar = self->_tabBar;
        v30 = 0.0;
LABEL_20:
        -[UITabBar setFrame:](tabBar, "setFrame:", v30);
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_2;
      aBlock[3] = &unk_1E16BFE10;
      v69 = v24;
      aBlock[4] = self;
      v32 = (void (**)(_QWORD))_Block_copy(aBlock);
      if ((v23 & 1) != 0
        || (-[UIView superview](self->_tabBar, "superview"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v33,
            !v33))
      {
        if ((_DWORD)v24)
        {
          if (a5 < 0.0)
          {
            objc_msgSend((id)objc_opt_class(), "durationForTransition:", v24);
            a5 = v36;
          }
          if (v27)
          {
            v37 = MEMORY[0x1E0C809B0];
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_6;
            v58[3] = &unk_1E16B1CC8;
            v59 = v32;
            v38 = (void (**)(void *, _QWORD))_Block_copy(v58);
            v39 = self->_tabBar;
            v53[0] = v37;
            v53[1] = 3221225472;
            v53[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_8;
            v53[3] = &unk_1E16BFE38;
            v53[4] = self;
            v55 = a6;
            v56 = v51;
            v54 = v28;
            v57 = v26;
            if ((objc_msgSend(v27, "animateAlongsideTransitionInView:animation:completion:", v39, v38, v53) & 1) == 0)
              v38[2](v38, 0);

          }
          else
          {
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_5;
            v60[3] = &unk_1E16B3FD8;
            v60[4] = self;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v32, v60, a5, 0.0);
          }
          v35 = v50;
          goto LABEL_36;
        }
        v32[2](v32);
        v35 = v50;
      }
      else
      {
        -[UIView superview](self->_tabBar, "superview");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBar set_expectedSuperviewFollowingAnimation:](self->_tabBar, "set_expectedSuperviewFollowingAnimation:", v34);

        LOBYTE(v34) = -[UIView _safeAreaInsetsFrozen](self->_tabBar, "_safeAreaInsetsFrozen");
        -[UIView _setSafeAreaInsetsFrozen:](self->_tabBar, "_setSafeAreaInsetsFrozen:", 1);
        objc_msgSend(v52, "addSubview:", self->_tabBar);
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_3;
        v61[3] = &unk_1E16BFDC0;
        v61[4] = self;
        v65 = (char)v34;
        v63 = v32;
        v64 = a6;
        v66 = v51;
        v62 = v28;
        v67 = v26;
        objc_msgSend(v27, "animateAlongsideTransition:completion:", 0, v61);

        v35 = v50;
        if ((_DWORD)v24)
        {
LABEL_36:

          return;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController animationDidStop:finished:context:](self, "animationDidStop:finished:context:", CFSTR("UITabBarControllerShowBar"), v40, 0);

      goto LABEL_36;
    }
  }
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:animated:", 0, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  if (v2 == 6)
    return objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10 - v8;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setFrame:", 0.0, v11, v6, v8);
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_expectedSuperviewFollowingAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "set_expectedSuperviewFollowingAnimation:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_setSafeAreaInsetsFrozen:", *(unsigned __int8 *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (objc_msgSend(v8, "isCancelled"))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) |= 4 * (*(_DWORD *)(a1 + 56) & 3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1080);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_4;
    v9[3] = &unk_1E16B1B28;
    v9[4] = v4;
    objc_msgSend(v5, "performWithoutNotifyingTabBarController:", v9);
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 40), "_setDidExplicitlyHideTabBar:", *(unsigned __int8 *)(a1 + 66));
      objc_msgSend(*(id *)(a1 + 40), "_setCrossfadingInTabBar:", 0);
    }
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isCancelled") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationDidStop:finished:context:", CFSTR("UITabBarControllerShowBar"), v7, 0);

}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:", objc_msgSend(*(id *)(a1 + 32), "_wantsBarHidden"));
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationDidStop:finished:context:", CFSTR("UITabBarControllerShowBar"), v3, 0);

}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "isInteractive"))
    v4 = 196704;
  else
    v4 = 0;
  objc_msgSend(v3, "transitionDuration");
  v6 = v5;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_7;
  v7[3] = &unk_1E16B1BF8;
  v8 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v4, v7, 0, v6, 0.0);

}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  if (objc_msgSend(v7, "isCancelled"))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1104) |= 4 * (*(_DWORD *)(a1 + 48) & 3);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1080);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_9;
    v8[3] = &unk_1E16B1B28;
    v8[4] = v3;
    objc_msgSend(v4, "performWithoutNotifyingTabBarController:", v8);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "_setDidExplicitlyHideTabBar:", *(unsigned __int8 *)(a1 + 57));
      objc_msgSend(*(id *)(a1 + 40), "_setCrossfadingInTabBar:", 0);
    }
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isCancelled") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationDidStop:finished:context:", CFSTR("UITabBarControllerShowBar"), v6, 0);

}

uint64_t __72__UITabBarController__showBarWithTransition_isExplicit_duration_reason___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setBarHidden:", objc_msgSend(*(id *)(a1 + 32), "_wantsBarHidden"));
}

- (void)showBarWithTransition:(int)a3
{
  -[UITabBarController _showBarWithTransition:isExplicit:](self, "_showBarWithTransition:isExplicit:", *(_QWORD *)&a3, 1);
}

- (unint64_t)_relevantEdgeForScrollViewObservation
{
  int64_t v2;

  v2 = -[_UITabBarControllerVisualStyle tabBarPosition](self->_visualStyle, "tabBarPosition");
  if ((_UIViewControllerUseContentScrollViewAPI() & (v2 == 2)) != 0)
    return 1;
  else
    return 4;
}

- (id)_observingScrollView
{
  return objc_loadWeakRetained((id *)&self->_observingScrollView);
}

- (void)_forceUpdateScrollViewIfNecessary
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  void *v4;
  id v5;

  if (_UIViewControllerUseContentScrollViewAPI())
  {
    tabBarControllerFlags = self->_tabBarControllerFlags;
    if ((*(_DWORD *)&tabBarControllerFlags & 0x20000) == 0)
    {
      self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags | 0x20000);
      -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", self->_selectedViewController);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:](self, "_updateAndObserveScrollView:viewController:updateBackgroundTransitionProgressForNilScrollView:", v4, v5, 1);

    }
  }
}

- (void)_viewControllerObservableScrollViewAmbiguityStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (((*((_DWORD *)v4 + 92) >> 1) & 3u) - 1 <= 1)
    {
      v10 = v4;
      if ((_UIBarsApplyChromelessEverywhere() & 1) != 0
        || (v6 = _UIViewControllerUseContentScrollViewAPI(), v5 = v10, v6))
      {
        v7 = -[UITabBarController _relevantEdgeForScrollViewObservation](self, "_relevantEdgeForScrollViewObservation");
        -[_UITabBarControllerVisualStyle viewControllerForObservableScrollViewFromViewController:](self->_visualStyle, "viewControllerForObservableScrollViewFromViewController:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_contentOrObservableScrollViewForEdge:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarController _updateAndObserveScrollView:viewController:](self, "_updateAndObserveScrollView:viewController:", v9, v8);

        v5 = v10;
      }
    }
  }

}

- (void)_setSuspendBarBackgroundUpdating:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_suspendBarBackgroundUpdating
{
  return (*((unsigned __int8 *)&self->_tabBarControllerFlags + 1) >> 3) & 1;
}

- (void)_suspendAllTabBarBackgroundUpdates
{
  int64_t backgroundUpdatesSuspendCount;

  backgroundUpdatesSuspendCount = self->_backgroundUpdatesSuspendCount;
  self->_backgroundUpdatesSuspendCount = backgroundUpdatesSuspendCount + 1;
  if (!backgroundUpdatesSuspendCount)
    -[UITabBar _setSuspendBackgroundUpdates:](self->_tabBar, "_setSuspendBackgroundUpdates:", 1);
}

- (void)_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:(BOOL)a3 animated:(BOOL)a4
{
  int64_t backgroundUpdatesSuspendCount;
  int64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location[2];

  backgroundUpdatesSuspendCount = self->_backgroundUpdatesSuspendCount;
  if (backgroundUpdatesSuspendCount)
  {
    v6 = backgroundUpdatesSuspendCount - 1;
    self->_backgroundUpdatesSuspendCount = v6;
    if (!v6)
    {
      if (!a3 || (*((_BYTE *)&self->_tabBarControllerFlags + 2) & 4) != 0)
      {
        -[UITabBar _setSuspendBackgroundUpdates:](self->_tabBar, "_setSuspendBackgroundUpdates:", 0, a4);
      }
      else
      {
        v7 = a4;
        objc_initWeak(location, self);
        -[UITabBarController _observingScrollView](self, "_observingScrollView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarController tabBar](self, "tabBar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __85__UITabBarController__resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated___block_invoke;
        v13[3] = &unk_1E16B44C0;
        objc_copyWeak(&v14, location);
        -[UITabBarController _updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:forceTwoPartCrossfade:completion:](self, "_updateBackgroundTransitionProgressForScrollView:tabBar:isNavigationTransitionUpdate:forceTwoPartCrossfade:completion:", v8, v9, 0, v7, v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(location);
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Over-release of backgorund updates on tab bar controller.", (uint8_t *)location, 2u);
    }

  }
  else
  {
    v10 = _resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated____s_category;
    if (!_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Over-release of backgorund updates on tab bar controller.", (uint8_t *)location, 2u);
    }
  }
}

void __85__UITabBarController__resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[137])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[121], "_setSuspendBackgroundUpdates:", 0);
    WeakRetained = v2;
  }

}

- (void)_updateBackgroundTransitionProgressForScrollView:(id)a3 tabBar:(id)a4 isNavigationTransitionUpdate:(BOOL)a5 forceTwoPartCrossfade:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  double v34;
  int v35;
  _QWORD v36[4];
  id v37;
  double v38;
  char v39;
  double v40;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!self->_backgroundUpdatesSuspendCount)
  {
    tabBarControllerFlags = self->_tabBarControllerFlags;
    if ((*(_WORD *)&tabBarControllerFlags & 0x800) == 0 || v9)
    {
      if ((*(_WORD *)&tabBarControllerFlags & 0x800) != 0 && v9)
        self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&tabBarControllerFlags & 0xFFFFF7FF);
      v40 = 0.0;
      if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v12, v13, &v40))
      {
        objc_msgSend(v13, "_backgroundTransitionProgress");
        v17 = v16;
        if (v40 == 1.0)
        {
          objc_msgSend(v13, "selectedItem", v40);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "scrollEdgeAppearance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v19;
          }
          else
          {
            objc_msgSend(v13, "scrollEdgeAppearance");
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v23 = v21;

          if (v17 == 1.0)
          {
            objc_msgSend(v23, "_backgroundData");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIBarAppearance _backgroundData](self->_lastUsedScrollEdgeAppearance, "_backgroundData");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v24;
            v27 = v25;
            v28 = v27;
            if (v26 == v27)
            {
              v22 = 0;
            }
            else
            {
              v22 = 1;
              if (v26 && v27)
                v22 = objc_msgSend(v26, "isEqual:", v27) ^ 1;
            }

          }
          else
          {
            v22 = 0;
          }
        }
        else
        {
          v22 = 0;
          v23 = 0;
        }
        v29 = v17 != v40 && v9;
        if ((v29 || v8)
          && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
        {
          -[UITabBar selectedItem](self->_tabBar, "selectedItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "scrollEdgeAppearance");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = (void *)v31;

          }
          else
          {
            -[UITabBar scrollEdgeAppearance](self->_tabBar, "scrollEdgeAppearance");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
LABEL_34:
              v34 = v40;
              v36[0] = MEMORY[0x1E0C809B0];
              v36[1] = 3221225472;
              v36[2] = __140__UITabBarController__updateBackgroundTransitionProgressForScrollView_tabBar_isNavigationTransitionUpdate_forceTwoPartCrossfade_completion___block_invoke;
              v36[3] = &unk_1E16BFE60;
              v37 = v13;
              v38 = v34;
              v39 = v22;
              _UIBarsTwoPartCrossfadeTransitionProgress(v36, v14, v34);

LABEL_37:
              if (v17 == 1.0)
                v35 = v22;
              else
                v35 = 1;
              if (v40 == 1.0 && v35)
                objc_storeStrong((id *)&self->_lastUsedScrollEdgeAppearance, v23);

              goto LABEL_13;
            }
          }
          v33 = objc_msgSend(v32, "_hasTransparentBackground");

          if (v33)
            goto LABEL_34;
        }
        objc_msgSend(v13, "_setBackgroundTransitionProgress:forceUpdate:animated:", v22, 0, v40);
        if (v14)
          (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
        goto LABEL_37;
      }
    }
  }
  if (v14)
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
LABEL_13:

}

uint64_t __140__UITabBarController__updateBackgroundTransitionProgressForScrollView_tabBar_isNavigationTransitionUpdate_forceTwoPartCrossfade_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundTransitionProgress:forceUpdate:animated:", *(unsigned __int8 *)(a1 + 48), 1, *(double *)(a1 + 40));
}

- (BOOL)_tvTabBarShouldTrackScrollView:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "_viewControllerForAncestor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "_tvShouldScrollWithObservedScrollViewIfPossible");
  else
    v7 = 1;

  return v7;
}

- (void)_viewControllerDidBeginDismissal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(void *, _QWORD);
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  id WeakRetained;
  double v16;
  unsigned __int8 v17;
  _QWORD aBlock[5];
  id v19;
  id v20;

  v4 = a3;
  if (_UIBarsApplyChromelessEverywhere())
  {
    objc_msgSend(v4, "_viewControllerForObservableScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UITabBarController _isViewControllerContainedInSelected:](self, "_isViewControllerContainedInSelected:", v5))
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UITabBarController__viewControllerDidBeginDismissal___block_invoke;
    aBlock[3] = &unk_1E16BF9D0;
    aBlock[4] = self;
    v7 = v6;
    v19 = v7;
    v8 = v4;
    v20 = v8;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(v8, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
    -[UITabBar _backgroundTransitionProgress](self->_tabBar, "_backgroundTransitionProgress");
    v12 = v11;
    v13 = v11 == 1.0;
    v17 = 0;
    -[UITabBarController _updateObservingScrollViewWithScrollView:viewController:getTabBarRequiresStandardBackground:](self, "_updateObservingScrollViewWithScrollView:viewController:getTabBarRequiresStandardBackground:", v7, v8, &v17);
    v14 = 0;
    if (!v17)
    {
      if (v7)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_observingScrollView);

        v14 = v13;
        if (v7 == WeakRetained)
        {
          v16 = 0.0;
          if (_UIBarsGetBottomBarBackgroundTransitionProgressForScrollView(v7, self->_tabBar, &v16))
            v14 = v16 == 1.0;
          else
            v14 = v12 == 1.0;
        }
      }
      else
      {
        v14 = v13;
      }
    }
    self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFBFFFF | (v17 << 18));
    if ((v12 == 1.0) == v14)
      goto LABEL_8;
    if (v12 != 1.0)
      objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v9);
    else
LABEL_7:
      v9[2](v9, 0);
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __55__UITabBarController__viewControllerDidBeginDismissal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAndObserveScrollView:viewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setNotifySplitViewControllerForSelectionChange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFBFF | v3);
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

- (id)_internalTabBar
{
  if (a1)
    a1 = (id *)a1[121];
  return a1;
}

- (int64_t)_tabBarPosition
{
  return self->_tabBarPosition;
}

- (id)_viewControllerForTabBarItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;

  v5 = a3;
  -[UITabBarController tabBar](self, "tabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITabBarController _viewControllersInTabBar](self, "_viewControllersInTabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __51__UITabBarController__viewControllerForTabBarItem___block_invoke;
  v22 = &unk_1E16BFE88;
  v10 = v5;
  v23 = v10;
  objc_msgSend(v9, "predicateWithBlock:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 3964, CFSTR("Inconsistency in UITabBar items and view controllers detected. No view controller matches the UITabBarItem '%@'."), v10, v19, v20, v21, v22);

  }
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tabBarItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "containsObject:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 3968, CFSTR("Inconsistency in UITabBar items and view controllers detected. The matching UITabBarItem '%@' is not available in the UITabBar."), v10);

  }
  return v13;
}

uint64_t __51__UITabBarController__viewControllerForTabBarItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_tabBarItemClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[UITabBarController _viewControllerForTabBarItem:](self, "_viewControllerForTabBarItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 0x80) == 0)
    goto LABEL_4;
  objc_msgSend(v4, "tab");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v9, "tab"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[UITabBarController _shouldSelectTab:]((uint64_t)self, v6),
        v6,
        v8 = v9,
        v7))
  {
LABEL_4:
    -[UITabBarController _setSelectedViewControllerAndNotify:](self, "_setSelectedViewControllerAndNotify:", v9);
    v8 = v9;
  }

}

- (void)_setSelectedViewControllerAndNotify:(id)a3
{
  $BD46499A0F4D7D3F2887BDC393DB39C9 tabBarControllerFlags;
  void *v5;
  UIViewController *v6;
  void *v7;
  UIViewController *v8;
  void *v9;
  UIViewController *v10;
  _QWORD v11[4];
  UIViewController *v12;
  UITabBarController *v13;

  v10 = (UIViewController *)a3;
  tabBarControllerFlags = self->_tabBarControllerFlags;
  -[UITabBarController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&tabBarControllerFlags & 0x8000) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "tabBarController:shouldSelectViewController:", self, v10) & 1) == 0)
  {
    -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v8)
    {
      -[UIViewController tabBarItem](v8, "tabBarItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", v9);

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__UITabBarController__setSelectedViewControllerAndNotify___block_invoke;
      v11[3] = &unk_1E16B1B50;
      v12 = v6;
      v13 = self;
      -[UITabBarController _performWithoutNotifyingSelectionChange:](self, "_performWithoutNotifyingSelectionChange:", v11);

    }
    -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    goto LABEL_15;
  }
  if (self->_transientViewController != v10)
  {
    -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v6 == v10)
      -[_UITabBarControllerVisualStyle updateViewControllerForReselection:](self->_visualStyle, "updateViewControllerForReselection:", v10);
    -[_UITabBarControllerVisualStyle updateFocusForSelectedViewControllerChange](self->_visualStyle, "updateFocusForSelectedViewControllerChange");
    if ((*(_WORD *)&tabBarControllerFlags & 0x8000) != 0)
    {
      -[UITabBarController _setSelectedViewController:performUpdates:](self, "_setSelectedViewController:performUpdates:", v10, 1);
    }
    else
    {
      -[UITabBarController setTransientViewController:](self, "setTransientViewController:", 0);
      -[UITabBarController setSelectedViewController:](self, "setSelectedViewController:", v10);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UITabBarController selectedViewController](self, "selectedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "tabBarController:didSelectViewController:", self, v7);

      }
    }
LABEL_15:

    goto LABEL_16;
  }
  -[UITabBarController concealTabBarSelection](self, "concealTabBarSelection");
LABEL_16:

}

void __58__UITabBarController__setSelectedViewControllerAndNotify___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_resolvedTab");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 1152);
  else
    v4 = 0;
  v5 = (id)v2;
  objc_msgSend(v4, "selectElement:notifyOnReselection:", v2, 0);

}

- (id)_containerView
{
  return self->_containerView;
}

- (double)_leftContentMargin
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  -[UIViewController _leftContentMargin](&v7, sel__leftContentMargin);
  v4 = v3;
  -[_UITabBarControllerVisualStyle additionalContentMargins](self->_visualStyle, "additionalContentMargins");
  return v4 + v5;
}

- (double)_rightContentMargin
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITabBarController;
  -[UIViewController _rightContentMargin](&v7, sel__rightContentMargin);
  v4 = v3;
  -[_UITabBarControllerVisualStyle additionalContentMargins](self->_visualStyle, "additionalContentMargins");
  return v4 + v5;
}

- (id)_customInteractionControllerForAnimator:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "tabBarController:interactionControllerForAnimationController:", self, v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "tabBarController:interactionControllerUsingAnimator:", self, v4);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = (void *)v6;
LABEL_8:

  return v7;
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_316(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[UIViewController _invalidatePreferences:excluding:](WeakRetained, -1, 0);
    WeakRetained = v2;
  }

}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set_shouldFocusViewControllerAfterTransition:", 0);
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_setSelectedTabBarItem:", *(_QWORD *)(a1 + 40));
  return result;
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_323(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;

  if (*(_QWORD *)(a1 + 32)
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1192), "conformsToProtocol:", &unk_1EDDCE3D0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1192), "willBeginAfterPreemptionWithContext:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2_324;
  v10 = &unk_1E16B1B50;
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = v2;
  v12 = v3;
  +[UIView _setAlongsideAnimations:](UIView, "_setAlongsideAnimations:", &v7);
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(v5 + 1200), "startInteractiveTransition:", v4, v7, v8, v9, v10);
  else
    objc_msgSend(*(id *)(v5 + 1192), "animateTransition:", v4, v7, v8, v9, v10);
  +[UIView _alongsideAnimations](UIView, "_alongsideAnimations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "__runAlongsideAnimations");
    objc_msgSend(*(id *)(a1 + 40), "_forceUpdateScrollViewIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:animated:", 1, 0);
    +[UIView _setAlongsideAnimations:](UIView, "_setAlongsideAnimations:", 0);
  }
  objc_msgSend(*(id *)(a1 + 48), "_setTransitionIsInFlight:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 48), "_setInterruptible:", 1);

}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_2_324(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  objc_msgSend(*(id *)(a1 + 40), "_forceUpdateScrollViewIfNecessary");
  objc_msgSend(*(id *)(a1 + 40), "_observingScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return objc_msgSend(*(id *)(a1 + 40), "_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:animated:", 1, 1);
  +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3_325;
  v5[3] = &unk_1E16B1888;
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v4;
  return objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v5);
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_3_325(uint64_t a1)
{
  double v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_forceUpdateScrollViewIfNecessary");
  v2 = *(double *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4_326;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, v2);
}

uint64_t __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_4_326(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeAllTabBarBackgroundUpdatesAndUpdateIfNecessary:animated:", 1, 1);
}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endAppearanceTransition");

}

void __97__UITabBarController_transitionFromViewController_toViewController_transition_shouldSetSelected___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endAppearanceTransition");
  if ((objc_msgSend(WeakRetained, "_containsFirstResponder") & 1) == 0)
    objc_msgSend(WeakRetained, "_viewControllerWasSelected");

}

- (void)concealTabBarSelection
{
  -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", 0);
}

- (void)revealTabBarSelection
{
  void *v3;
  void *v4;
  id v5;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "tabBarItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _setSelectedTabBarItem:](self, "_setSelectedTabBarItem:", v4);

    v3 = v5;
  }

}

- (void)setShowsEditButtonOnLeft:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_tabBarControllerFlags = ($BD46499A0F4D7D3F2887BDC393DB39C9)(*(_DWORD *)&self->_tabBarControllerFlags & 0xFFFFFFEF | v3);
}

- (void)_setSelectedViewControllerNeedsLayout
{
  -[UIView setNeedsLayout](self->_containerView, "setNeedsLayout");
}

- (void)_childViewController:(id)a3 updatedObservedScrollView:(id)a4
{
  if (self->_selectedViewController == a3)
    -[UITabBarController _compatibility_updateViewController:forTabBarObservedScrollView:](self, "_compatibility_updateViewController:forTabBarObservedScrollView:");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITabBarController;
  -[UIViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3, a4);
  -[_UITabModel setEditing:](self->_tabModel, "setEditing:", v4);
}

- (void)_notifyEditingStateChange:(id *)a1
{
  id WeakRetained;
  char v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  if (a1)
  {
    if (a2)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 146);
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        v5 = objc_loadWeakRetained(a1 + 146);
        objc_msgSend(v5, "tabBarControllerWillBeginEditing:", a1);
      }
      else
      {
        objc_msgSend(a1, "sidebar");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITabBarControllerSidebar _editingStateDidChange:]((uint64_t)v5, 1);
      }

      objc_msgSend(a1, "setEditing:", 1);
      objc_msgSend(a1[135], "editingStateDidChange");
    }
    else
    {
      objc_msgSend(a1, "setEditing:", 0);
      objc_msgSend(a1[135], "editingStateDidChange");
      v6 = objc_loadWeakRetained(a1 + 146);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained(a1 + 146);
        objc_msgSend(v8, "tabBarControllerDidEndEditing:", a1);
      }
      else
      {
        objc_msgSend(a1, "sidebar");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[UITabBarControllerSidebar _editingStateDidChange:]((uint64_t)v8, 0);
      }

    }
  }
}

- (void)_notifyVisibilityChangesForTabs:(id *)a1
{
  id WeakRetained;
  char v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 146);
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(v7, "allObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_loadWeakRetained(a1 + 146);
      objc_msgSend(v6, "tabBarController:visibilityDidChangeForTabs:", a1, v5);

    }
    else
    {
      objc_msgSend(a1, "sidebar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITabBarControllerSidebar _visibilityDidChangeForTabs:]((uint64_t)v5, v7);
    }

  }
}

- (void)_notifyDisplayOrderChangesForGroup:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 1168));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 1168));
      objc_msgSend(v5, "tabBarController:displayOrderDidChangeForGroup:", a1, v6);

    }
  }

}

- (BOOL)_allowsAutorotation
{
  unsigned int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITabBarController;
  v3 = -[UIViewController _allowsAutorotation](&v9, sel__allowsAutorotation);
  -[UITabBarController tabBar](self, "tabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 & (objc_msgSend(v4, "isCustomizing") ^ 1);

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v5 &= objc_msgSend(v6, "_allowsAutorotation");

  return v5;
}

- (BOOL)_doAllViewControllersSupportInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UITabBarController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_isSupportedInterfaceOrientation:", a3))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  if (-[UIViewController _hasPreferredInterfaceOrientationForPresentation](&v5, sel__hasPreferredInterfaceOrientationForPresentation))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = dyld_program_sdk_at_least();
    if (v3)
      LOBYTE(v3) = *((_BYTE *)&self->_tabBarControllerFlags + 1) & 1;
  }
  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v5;
  objc_super v6;

  if ((*((_BYTE *)&self->_tabBarControllerFlags + 1) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "tabBarControllerPreferredInterfaceOrientationForPresentation:", self);

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarController;
    return -[UIViewController preferredInterfaceOrientationForPresentation](&v6, sel_preferredInterfaceOrientationForPresentation);
  }
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if (objc_msgSend((id)objc_opt_class(), "_doesOverrideLegacyShouldAutorotateMethod"))
    return -[UITabBarController shouldAutorotateToInterfaceOrientation:](self, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    return -[UITabBarController _doAllViewControllersSupportInterfaceOrientation:](self, "_doAllViewControllersSupportInterfaceOrientation:", a3);
}

- (id)rotatingHeaderView
{
  void *v2;
  void *v3;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rotatingHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rotatingFooterView
{
  void *v3;
  void *v4;

  if (-[UITabBarController _wantsBarHidden](self, "_wantsBarHidden"))
  {
    -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotatingFooterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITabBarController tabBar](self, "tabBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  void *v2;
  char v3;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldUseOnePartRotation");

  return v3;
}

- (void)_getRotationContentSettings:(id *)a3
{
  id v4;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_getRotationContentSettings:", a3);

}

- (BOOL)_isBarLayoutValid
{
  return (*(_BYTE *)&self->_tabBarControllerFlags >> 5) & 1;
}

- (void)_invalidateBarLayout
{
  *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
}

- (void)_invalidateBarLayoutIfNecessary
{
  int v3;
  id v4;

  -[UIView traitCollection](self->_tabBar, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {

  }
  else
  {
    v3 = dyld_program_sdk_at_least();

    if (v3)
      *(_DWORD *)&self->_tabBarControllerFlags &= ~0x20u;
  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v7;

  -[UITabBarController _invalidateBarLayoutIfNecessary](self, "_invalidateBarLayoutIfNecessary");
  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willRotateToInterfaceOrientation:duration:", a3, a4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[UITabBarController _invalidateBarLayoutIfNecessary](self, "_invalidateBarLayoutIfNecessary");
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);

}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "_existingView"), (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v12 = (void *)v11,
        -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v10 == v13))
  {
    -[UIViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;

    objc_msgSend(v10, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;
    v29 = v28;

    v15 = width - v22 + v27;
    v17 = height - v24 + v29;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)UITabBarController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v30, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    v15 = v14;
    v17 = v16;
  }

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:", a3, a4);

}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  id v4;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAnimateFirstHalfOfRotationToInterfaceOrientation:", a3);

}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:", a3, a4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRotateFromInterfaceOrientation:", a3);

}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  void *v3;
  void *v4;

  -[UITabBarController _selectedViewControllerInTabBar](self, "_selectedViewControllerInTabBar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setBadgeValue:(id)a3 forTabBarItem:(id)a4
{
  id v5;

  if (a4)
  {
    objc_msgSend(a4, "setBadgeValue:", a3);
    -[UITabBarController _existingMoreNavigationController](self, "_existingMoreNavigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_redisplayMoreTableView");

  }
}

- (NSMutableArray)moreChildViewControllers
{
  return self->_moreChildViewControllers;
}

- (void)setMoreChildViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_moreChildViewControllers, a3);
}

- (UIView)_accessoryView
{
  return self->_accessoryView;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)compactTabIdentifiers
{
  return self->_compactTabIdentifiers;
}

- (UIViewControllerInteractiveTransitioning)_interactor
{
  return self->__interactor;
}

- (void)_setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->__interactor, a3);
}

- (BOOL)_shouldFocusViewControllerAfterTransition
{
  return self->__shouldFocusViewControllerAfterTransition;
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 0;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  UIMoreNavigationController *v12;
  UIMoreNavigationController *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = -[UITabBarController _ignoreUnselectedTabsForStateRestoration](self, "_ignoreUnselectedTabsForStateRestoration");
  -[UITabBarController tabBar](self, "tabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCustomizing");

  if (v7)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("kTabBarIsCustomizingKey"));
    objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
  }
  if (!v5)
  {
    -[UITabBarController allViewControllers](self, "allViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UISaveReferencedChildViewControllers(v8, 0);

  }
  -[UITabBarController selectedViewController](self, "selectedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_restorationIdentifierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _UIStateRestorationDebugLogEnabled();
  if (v10)
  {
    if (v11)
      NSLog(CFSTR("%s: Selected view controller for tab bar controller is %@: %@"), "-[UITabBarController(StateRestoration) encodeRestorableStateWithCoder:]", v10, v9);
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kTabBarSelectedViewControllerKey"));
    if (v5)
      goto LABEL_20;
LABEL_13:
    if (v9
      && self->_moreNavigationController
      && (-[NSMutableArray containsObject:](self->_moreChildViewControllers, "containsObject:", v9) & 1) == 0)
    {
      -[UIMoreNavigationController displayedViewController](self->_moreNavigationController, "displayedViewController");
      v12 = (UIMoreNavigationController *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 != self->_moreNavigationController)
      {
        -[UIResponder restorationIdentifier](v12, "restorationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kTabBarMoreDisplayedViewControllerKey"));
      }

    }
    goto LABEL_20;
  }
  if (v11)
    NSLog(CFSTR("%s: Selected view controller for tab bar controller doesn't have restoration identifier, skipping: %@"), "-[UITabBarController(StateRestoration) encodeRestorableStateWithCoder:]", v9);
  objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
  if (!v5)
    goto LABEL_13;
LABEL_20:
  v15.receiver = self;
  v15.super_class = (Class)UITabBarController;
  -[UIViewController encodeRestorableStateWithCoder:](&v15, sel_encodeRestorableStateWithCoder_, v4);

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTabBarSelectedViewControllerKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Tab bar controller decoded selected view controller %@"), "-[UITabBarController(StateRestoration) decodeRestorableStateWithCoder:]", v5);
  if (v5)
  {
    -[UITabBarController allViewControllers](self, "allViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      -[UITabBarController setSelectedViewController:](self, "setSelectedViewController:", v5);
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(CFSTR("%s: TabBarController's selected view controller from State Restoration isn't contained in Tab Controller, skipping: %@"), "-[UITabBarController(StateRestoration) decodeRestorableStateWithCoder:]", v5);
    }
  }
  if (self->_moreNavigationController)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTabBarMoreDisplayedViewControllerKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UITabBarController selectedViewController](self, "selectedViewController");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = -[NSMutableArray containsObject:](self->_moreChildViewControllers, "containsObject:", v8);

        if (v11)
          -[UIMoreNavigationController setDisplayedViewController:](self->_moreNavigationController, "setDisplayedViewController:", v8);
      }
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)UITabBarController;
  -[UIResponder decodeRestorableStateWithCoder:](&v12, sel_decodeRestorableStateWithCoder_, v4);

}

- (UIAction)_overrideTidebarButtonAction
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UITabBarControllerVisualStyle overrideTidebarButtonAction](self->_visualStyle, "overrideTidebarButtonAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIAction *)v3;
}

- (void)_setOverrideTidebarButtonAction:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  _UIMainBundleIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DocumentsApp")) & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.DocumentManagerUICore.Service"));

    if ((v7 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarController.m"), 5080, CFSTR("This may only be used by Files."));
  }

LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_UITabBarControllerVisualStyle setOverrideTidebarButtonAction:](self->_visualStyle, "setOverrideTidebarButtonAction:", v8);

}

@end
