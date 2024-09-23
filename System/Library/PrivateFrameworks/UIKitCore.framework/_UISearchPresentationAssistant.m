@implementation _UISearchPresentationAssistant

- (_UISearchPresentationAssistant)initWithSearchPresentationController:(id)a3
{
  _UISearchPresentationAssistant *v4;
  _UISearchPresentationAssistant *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISearchPresentationAssistant;
  v4 = -[_UISearchPresentationAssistant init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_searchPresentationController = (UIPresentationController *)a3;
    objc_opt_class();
    v5->_isFormSheetPresentation = objc_opt_isKindOfClass() & 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_searchBarContainerView = 0;
  self->_dimmingView = 0;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationAssistant;
  -[_UISearchPresentationAssistant dealloc](&v3, sel_dealloc);
}

- (id)_searchControllerPresenting
{
  if (-[UIPresentationController conformsToProtocol:](self->_searchPresentationController, "conformsToProtocol:", &unk_1EDFF9E08))return self->_searchPresentationController;
  else
    return 0;
}

- (BOOL)presentationIsPopoverToOverFullScreenAdaptation
{
  UIPresentationController *v2;

  v2 = -[UIViewController _originalPresentationController](-[UIViewController presentingViewController](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "presentingViewController"), "_originalPresentationController");
  if (v2)
  {
    objc_opt_class();
    LOBYTE(v2) = objc_opt_isKindOfClass();
  }
  return v2 & 1;
}

- (CGRect)optimalFrameForSearchBar:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  if (-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    objc_msgSend(a3, "frame");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v11 = -[_UISearchPresentationAssistant _searchBarContainerSuperview](self, "_searchBarContainerSuperview");
    if (!v11)
      v11 = +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    objc_msgSend(v11, "bounds");
    Width = CGRectGetWidth(v17);
    objc_msgSend(a3, "bounds");
    objc_msgSend(a3, "sizeThatFits:", Width, CGRectGetHeight(v18));
    v8 = v13;
    v10 = v14;
    objc_msgSend(a3, "frame");
  }
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)ensureAppropriatelySizedSearchBar:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;

  -[_UISearchPresentationAssistant optimalFrameForSearchBar:](self, "optimalFrameForSearchBar:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a3, "_defaultHeightForOrientation:", objc_msgSend(a3, "_expectedInterfaceOrientation"));
  v11 = v10;
  objc_msgSend(a3, "frame");
  v17.origin.x = v12;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v15;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  if (!CGRectEqualToRect(v16, v17))
  {
    objc_msgSend(a3, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(a3, "layoutIfNeeded");
  }
}

- (CGRect)_containerFrame
{
  UIView *v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _BOOL4 v25;
  UIWindow *v26;
  uint64_t v27;
  double v28;
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
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  CGRect result;
  CGRect v50;
  CGRect v51;

  v3 = -[_UISearchPresentationAssistant _searchBarContainerSuperview](self, "_searchBarContainerSuperview");
  v4 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar");
  v6 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v39 = v8;
  v41 = v7;
  v43 = v5;
  v45 = *MEMORY[0x1E0C9D648];
  if (objc_msgSend(v4, "window"))
  {
    if (!-[UIView window](v3, "window"))
      v3 = -[UIView superview](-[UIViewController view](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "view"), "superview");
    objc_msgSend(v4, "bounds", *(_QWORD *)&v8, *(_QWORD *)&v7, *(_QWORD *)&v5, v45);
    objc_msgSend(v4, "convertRect:toView:", v3);
    v6 = v9;
    v5 = v10;
    v7 = v11;
    v8 = v12;
  }
  objc_msgSend(v4, "frame", *(_QWORD *)&v39, *(_QWORD *)&v41, *(_QWORD *)&v43, v45);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[_UISearchPresentationAssistant ensureAppropriatelySizedSearchBar:](self, "ensureAppropriatelySizedSearchBar:", v4);
  objc_msgSend(v4, "frame");
  v50.origin.x = v21;
  v50.origin.y = v22;
  v50.size.width = v23;
  v50.size.height = v24;
  v47.origin.x = v14;
  v47.origin.y = v16;
  v47.size.width = v18;
  v47.size.height = v20;
  v25 = CGRectEqualToRect(v47, v50);
  v48.origin.x = v6;
  v48.origin.y = v5;
  v48.size.width = v7;
  v48.size.height = v8;
  v51.origin.y = v44;
  v51.origin.x = v46;
  v51.size.height = v40;
  v51.size.width = v42;
  if (CGRectEqualToRect(v48, v51) || !v25)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v4, "bounds");
    v7 = v30;
    v29 = v31;
  }
  else
  {
    v26 = -[UIView window](-[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), "window");
    v27 = -[UIWindow interfaceOrientation](v26, "interfaceOrientation");
    if (-[_UISearchPresentationAssistant _currentTransitionIsRotating](self, "_currentTransitionIsRotating"))
      v27 = -[UIWindow _toWindowOrientation](v26, "_toWindowOrientation");
    objc_msgSend(v4, "_barHeightForBarMetrics:", objc_msgSend(v4, "_barMetricsForOrientation:", v27));
    v29 = v28;
  }
  if (-[_UISearchPresentationAssistant searchBarWillResizeForScopeBar](self, "searchBarWillResizeForScopeBar"))
  {
    objc_msgSend(v4, "_scopeBarHeight");
    v29 = v29 + v32;
  }
  if (objc_msgSend(v4, "barPosition") == 3)
  {
    -[_UISearchPresentationAssistant statusBarAdjustment](self, "statusBarAdjustment");
    v34 = v33;
    if (fabs(v33) >= 2.22044605e-16)
      v34 = (double)((int)(v5 - v33) & ~((int)(v5 - v33) >> 31));
    v29 = v29 + v33;
    v5 = v34;
  }
  v35 = v6;
  v36 = v5;
  v37 = v7;
  v38 = v29;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (id)_searchBarContainerSuperview
{
  _BOOL4 isFormSheetPresentation;
  UIPresentationController *searchPresentationController;

  isFormSheetPresentation = self->_isFormSheetPresentation;
  searchPresentationController = self->_searchPresentationController;
  if (isFormSheetPresentation)
    return -[UIView superview](-[UIPresentationController containerView](searchPresentationController, "containerView"), "superview");
  else
    return -[UIViewController view](-[UIPresentationController presentedViewController](searchPresentationController, "presentedViewController"), "view");
}

- (id)searchBarContainerView
{
  UIView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UISearchBarContainerView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *searchBarContainerView;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  uint64_t v19;

  v3 = -[_UISearchPresentationAssistant _searchBarContainerSuperview](self, "_searchBarContainerSuperview");
  v4 = -[_UISearchPresentationAssistant _searchControllerPresenting](self, "_searchControllerPresenting");
  if (!self->_searchBarContainerView)
  {
    -[_UISearchPresentationAssistant _containerFrame](self, "_containerFrame");
    v9 = -[UIView initWithFrame:]([_UISearchBarContainerView alloc], "initWithFrame:", v5, v6, v7, v8);
    self->_searchBarContainerView = &v9->super;
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 2);
    if (!v4 || objc_msgSend(v4, "searchBarShouldClipToBounds"))
      -[UIView setClipsToBounds:](self->_searchBarContainerView, "setClipsToBounds:", 1);
  }
  v10 = (void *)-[UIViewController _viewToInsertSearchBarContainerViewUnder](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_viewToInsertSearchBarContainerViewUnder");
  if (v10 && (v11 = v10, (UIView *)objc_msgSend(v10, "superview") == v3))
  {
    v15 = -[UIView subviews](v3, "subviews");
    v16 = -[NSArray indexOfObject:](v15, "indexOfObject:", self->_searchBarContainerView);
    if (v16 != -[NSArray indexOfObject:](v15, "indexOfObject:", v11) - 1)
      -[UIView insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", self->_searchBarContainerView, v11);
  }
  else
  {
    v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "presentedViewController"), "presentedViewController"), "presentationController"), "containerView");
    if (v12 && (v13 = v12, (UIView *)objc_msgSend(v12, "superview") == v3))
    {
      v18 = -[UIView subviews](v3, "subviews");
      v19 = -[NSArray indexOfObject:](v18, "indexOfObject:", v13);
      if (v3 != -[UIView superview](self->_searchBarContainerView, "superview")
        || v19 && -[NSArray indexOfObject:](v18, "indexOfObject:", self->_searchBarContainerView) < v19 - 1)
      {
        -[UIView insertSubview:below:](v3, "insertSubview:below:", self->_searchBarContainerView, v13);
      }
    }
    else
    {
      if (v3 != -[UIView superview](self->_searchBarContainerView, "superview"))
      {
        searchBarContainerView = self->_searchBarContainerView;
LABEL_14:
        -[UIView addSubview:](v3, "addSubview:", searchBarContainerView);
        return self->_searchBarContainerView;
      }
      v17 = -[NSArray lastObject](-[UIView subviews](v3, "subviews"), "lastObject");
      searchBarContainerView = self->_searchBarContainerView;
      if ((UIView *)v17 != searchBarContainerView)
        goto LABEL_14;
    }
  }
  return self->_searchBarContainerView;
}

- (void)removeContainerViewFromSuperview
{
  -[UIView removeFromSuperview](self->_searchBarContainerView, "removeFromSuperview");
}

- (BOOL)_currentTransitionIsRotating
{
  UIViewControllerTransitionCoordinator *transitioningToSizeCoordinator;
  CGAffineTransform v4;

  transitioningToSizeCoordinator = self->_transitioningToSizeCoordinator;
  if (transitioningToSizeCoordinator)
  {
    -[UIViewControllerTransitionCoordinator targetTransform](transitioningToSizeCoordinator, "targetTransform");
    LOBYTE(transitioningToSizeCoordinator) = !CGAffineTransformIsIdentity(&v4);
  }
  return (char)transitioningToSizeCoordinator;
}

- (double)_statusBarHeightChangeDueToRotation
{
  double v3;
  UIWindow *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double result;
  double v10;

  v3 = 0.0;
  if (-[_UISearchPresentationAssistant _currentTransitionIsRotating](self, "_currentTransitionIsRotating"))
  {
    v4 = -[UIView window](-[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), "window");
    v5 = -[UIWindow _toWindowOrientation](v4, "_toWindowOrientation");
    v6 = -[UIWindow interfaceOrientation](v4, "interfaceOrientation");
    v7 = -[_UISearchPresentationAssistant _statusBarPreferredHiddenForInterfaceOrientation:](self, "_statusBarPreferredHiddenForInterfaceOrientation:", v5);
    v8 = -[_UISearchPresentationAssistant _statusBarPreferredHiddenForInterfaceOrientation:](self, "_statusBarPreferredHiddenForInterfaceOrientation:", v6);
    if (v8 && !v7)
    {
      objc_msgSend(__UIStatusBarManagerForWindow(v4), "defaultStatusBarHeightInOrientation:", v5);
      return result;
    }
    if (!v8 && v7)
    {
      objc_msgSend(__UIStatusBarManagerForWindow(v4), "defaultStatusBarHeightInOrientation:", v6);
      return -v10;
    }
  }
  return v3;
}

- (CGSize)updateSearchBarContainerFrame
{
  double v2;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  UIView *searchBarContainerView;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MaxY;
  _BOOL4 v24;
  UIWindow *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGSize result;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v2 = *MEMORY[0x1E0C9D820];
  if (self->_searchBarContainerView)
  {
    v4 = -[_UISearchPresentationAssistant locateNavigationController](self, "locateNavigationController");
    v5 = objc_msgSend(v4, "navigationBar");
    if (v4)
    {
      v6 = (void *)v5;
      if ((-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) == 0&& (objc_msgSend(v6, "forceFullHeightInLandscape") & 1) == 0)
      {
        objc_msgSend(v6, "bounds");
        objc_msgSend(v6, "convertRect:toView:", 0);
        v8 = v7;
        v10 = v9;
        v36 = v11;
        v13 = v12;
        searchBarContainerView = self->_searchBarContainerView;
        -[UIView bounds](searchBarContainerView, "bounds");
        -[UIView convertRect:toView:](searchBarContainerView, "convertRect:toView:", 0);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v34 = v10;
        v35 = v8;
        v38.origin.x = v8;
        v38.origin.y = v10;
        v38.size.width = v36;
        v38.size.height = v13;
        MaxY = CGRectGetMaxY(v38);
        v39.origin.x = v16;
        v39.origin.y = v18;
        v39.size.width = v20;
        v39.size.height = v22;
        if (vabdd_f64(MaxY, CGRectGetMinY(v39)) <= 1.0
          || -[UIViewController _searchbarWasTableHeaderView](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_searchbarWasTableHeaderView"))
        {
          v24 = -[_UISearchPresentationAssistant _currentTransitionIsRotating](self, "_currentTransitionIsRotating", *(_QWORD *)&v10, *(_QWORD *)&v35);
          v25 = -[UIView window](-[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), "window");
          v26 = v24
              ? -[UIWindow _toWindowOrientation](v25, "_toWindowOrientation")
              : -[UIWindow interfaceOrientation](v25, "interfaceOrientation");
          v28 = v26;
          v29 = (void *)objc_msgSend(v4, "navigationBar");
          if (objc_msgSend(v29, "_heightDependentOnOrientation"))
          {
            objc_msgSend(v29, "defaultSizeForOrientation:", v28);
            v40.origin.y = v34;
            v40.origin.x = v35;
            v40.size.width = v36;
            v40.size.height = v13;
            CGRectGetHeight(v40);
          }
        }
      }
    }
    if ((-[UIViewController edgesForExtendedLayout](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController", *(_QWORD *)&v34, *(_QWORD *)&v35), "edgesForExtendedLayout") & 1) == 0|| v4&& (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) == 0)
    {
      -[_UISearchPresentationAssistant _statusBarHeightChangeDueToRotation](self, "_statusBarHeightChangeDueToRotation");
    }
    -[_UISearchPresentationAssistant _containerFrame](self, "_containerFrame");
    v30 = CGRectGetMaxY(v41);
    -[UIView frame](self->_searchBarContainerView, "frame");
    v31 = CGRectGetMaxY(v42);
    v27 = v30 - v31;
    -[UIView frame](self->_searchBarContainerView, "frame");
    -[UIView setFrame:](self->_searchBarContainerView, "setFrame:");
    if (vabdd_f64(v30, v31) >= 2.22044605e-16)
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "setNeedsLayout");
  }
  else
  {
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v32 = v2;
  v33 = v27;
  result.height = v33;
  result.width = v32;
  return result;
}

- (id)dimmingView
{
  UIDimmingView *v3;
  UIDimmingView *v4;

  if (!self->_dimmingView)
  {
    v3 = [UIDimmingView alloc];
    -[UIView bounds](-[UIPresentationController containerView](self->_searchPresentationController, "containerView"), "bounds");
    v4 = -[UIDimmingView initWithFrame:](v3, "initWithFrame:");
    self->_dimmingView = v4;
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIDimmingView setDelegate:](self->_dimmingView, "setDelegate:", self);
    if (-[UITraitCollection userInterfaceIdiom](-[UIPresentationController traitCollection](self->_searchPresentationController, "traitCollection"), "userInterfaceIdiom") != UIUserInterfaceIdiomVision)-[UIDimmingView setDimmingColor:](self->_dimmingView, "setDimmingColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15));
  }
  return self->_dimmingView;
}

- (BOOL)_statusBarPreferredHidden
{
  return -[_UISearchPresentationAssistant _statusBarPreferredHiddenForInterfaceOrientation:](self, "_statusBarPreferredHiddenForInterfaceOrientation:", -[UIWindow _toWindowOrientation](-[UIView window](-[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), "window"), "_toWindowOrientation"));
}

- (BOOL)_statusBarPreferredHiddenForInterfaceOrientation:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = -[UIViewController _effectiveStatusBarHiddenViewController](-[UIWindow rootViewController](-[UIView window](-[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), "window"), "rootViewController"), "_effectiveStatusBarHiddenViewController");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__preferredStatusBarVisibility))return objc_msgSend(v5, "_preferredStatusBarVisibility") == 1;
    if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_prefersStatusBarHidden))return objc_msgSend(v5, "prefersStatusBarHidden");
  }
  return objc_msgSend(-[UIScreen _defaultTraitCollectionForInterfaceOrientation:](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_defaultTraitCollectionForInterfaceOrientation:", a3), "verticalSizeClass") == 1;
}

- (double)statusBarAdjustment
{
  double result;
  _BOOL4 v4;
  UIPresentationController *searchPresentationController;
  UIWindow *v6;
  uint64_t v7;
  double v8;

  if (!-[UIViewController _viewControllerUnderlapsStatusBar](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "_viewControllerUnderlapsStatusBar")|| (-[UIViewController edgesForExtendedLayout](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "edgesForExtendedLayout") & 1) == 0)
  {
    return 0.0;
  }
  v4 = -[_UISearchPresentationAssistant _currentTransitionIsRotating](self, "_currentTransitionIsRotating");
  searchPresentationController = self->_searchPresentationController;
  if (v4)
  {
    v6 = -[UIViewController _window](-[UIPresentationController presentedViewController](searchPresentationController, "presentedViewController"), "_window");
    v7 = -[UIWindow _toWindowOrientation](v6, "_toWindowOrientation");
    if ((objc_msgSend(__UIStatusBarManagerForWindow(v6), "isStatusBarHidden") & 1) != 0)
      return 0.0;
    objc_msgSend(__UIStatusBarManagerForWindow(v6), "defaultStatusBarHeightInOrientation:", v7);
    if (v8 == 0.0 || -[_UISearchPresentationAssistant _statusBarPreferredHidden](self, "_statusBarPreferredHidden"))
      return 0.0;
    objc_msgSend(__UIStatusBarManagerForWindow(v6), "defaultStatusBarHeightInOrientation:", v7);
  }
  else
  {
    -[UIViewController _statusBarHeightAdjustmentForCurrentOrientation](-[UIPresentationController presentingViewController](searchPresentationController, "presentingViewController"), "_statusBarHeightAdjustmentForCurrentOrientation");
  }
  return result;
}

- (BOOL)shouldAccountForStatusBar
{
  double v2;

  -[_UISearchPresentationAssistant statusBarAdjustment](self, "statusBarAdjustment");
  return v2 != 0.0;
}

- (id)locateNavigationController
{
  char isKindOfClass;
  UIViewController *v4;

  -[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = -[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController");
  if ((isKindOfClass & 1) == 0)
    v4 = -[UIViewController navigationController](v4, "navigationController");
  return (id)-[UIViewController _outermostNavigationController](v4, "_outermostNavigationController");
}

- (BOOL)searchBarToBecomeTopAttached
{
  UIWindow *v3;
  int v4;
  double v6;

  v3 = -[UIViewController _window](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_window");
  if (v3)
  {
    if ((unint64_t)(objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3) - 3) <= 1
      && objc_msgSend(__UIStatusBarManagerForWindow(v3), "isStatusBarHidden")
      && (objc_msgSend(__UIStatusBarManagerForWindow(v3), "isStatusBarHidden") & 1) == 0)
    {
      objc_msgSend(__UIStatusBarManagerForWindow(v3), "defaultStatusBarHeightInOrientation:", 1);
      LODWORD(v3) = v6 != 0.0;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  if (!-[_UISearchPresentationAssistant shouldAccountForStatusBar](self, "shouldAccountForStatusBar") && !(_DWORD)v3
    || objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "barPosition")&& objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar"), "barPosition") != 2)
  {
    LOBYTE(v4) = 0;
    return v4 & 1;
  }
  if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_barPresentationStyle") != 1&& -[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_barPresentationStyle") != 2)
  {
    goto LABEL_14;
  }
  v4 = -[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch");
  if (v4)
  {
    if (!-[UIViewController navigationController](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "navigationController"))
    {
      -[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController");
      objc_opt_class();
      LOBYTE(v4) = objc_opt_isKindOfClass();
      return v4 & 1;
    }
LABEL_14:
    LOBYTE(v4) = 1;
  }
  return v4 & 1;
}

- (double)resultsControllerContentOffset
{
  void *v3;
  uint64_t v4;
  double Height;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = (void *)-[UIViewController searchResultsController](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchResultsController");
  v4 = objc_msgSend(v3, "_contentOrObservableScrollViewForEdge:", 1);
  Height = 0.0;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6
    && objc_msgSend(v3, "automaticallyAdjustsScrollViewInsets")
    && -[UIViewController _resultsControllerWillLayoutVisibleUnderContainerView](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_resultsControllerWillLayoutVisibleUnderContainerView"))
  {
    if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_barPresentationStyle") == 3)
    {
      objc_msgSend(-[_UISearchPresentationAssistant searchBarContainerView](self, "searchBarContainerView"), "frame");
      Height = CGRectGetHeight(v23);
      -[UIViewController set_resultsContentScrollViewPresentationOffset:](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "set_resultsContentScrollViewPresentationOffset:", Height);
    }
    else
    {
      v7 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar");
      objc_msgSend(v7, "bounds");
      objc_msgSend(v7, "convertRect:toView:", -[UIViewController view](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "view"), v8, v9, v10, v11);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch")&& -[UIViewController navigationController](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "navigationController"))
      {
        -[UIView frame](-[UINavigationController navigationBar](-[UIViewController navigationController](-[UIPresentationController presentingViewController](self->_searchPresentationController, "presentingViewController"), "navigationController"), "navigationBar"), "frame");
        v15 = v15 - CGRectGetHeight(v24);
      }
      v25.origin.x = v13;
      v25.origin.y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      -[UIViewController set_resultsContentScrollViewPresentationOffset:](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "set_resultsContentScrollViewPresentationOffset:", CGRectGetHeight(v25));
      if (-[_UISearchPresentationAssistant searchBarToBecomeTopAttached](self, "searchBarToBecomeTopAttached"))
      {
        -[_UISearchPresentationAssistant statusBarAdjustment](self, "statusBarAdjustment");
        v15 = v15 - v20;
        v19 = v19 + v20;
      }
      v26.origin.x = v13;
      v26.origin.y = v15;
      v26.size.width = v17;
      v26.size.height = v19;
      Height = CGRectGetMaxY(v26);
      if (-[_UISearchPresentationAssistant searchBarWillResizeForScopeBar](self, "searchBarWillResizeForScopeBar"))
      {
        objc_msgSend(v7, "_scopeBarHeight");
        return Height + v21;
      }
    }
  }
  return Height;
}

- (BOOL)searchBarWillResizeForScopeBar
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = -[_UISearchPresentationAssistant _searchControllerPresenting](self, "_searchControllerPresenting");
  if (!v3 || (LODWORD(v4) = objc_msgSend(v3, "searchBarCanContainScopeBar"), (_DWORD)v4))
  {
    v5 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController"), "searchBar");
    v4 = objc_msgSend((id)objc_msgSend(v5, "scopeButtonTitles"), "count");
    if (v4)
      LOBYTE(v4) = objc_msgSend(v5, "_shouldCombineLandscapeBars") ^ 1;
  }
  return v4;
}

- (void)dimmingViewWasTapped:(id)a3
{
  -[UIViewController _dismissPresentation:](-[UIPresentationController presentedViewController](self->_searchPresentationController, "presentedViewController", a3), "_dismissPresentation:", self->_presentationWasAnimated);
}

- (BOOL)presentationWasAnimated
{
  return self->_presentationWasAnimated;
}

- (void)setPresentationWasAnimated:(BOOL)a3
{
  self->_presentationWasAnimated = a3;
}

- (_UISearchControllerPresenting)adaptivePresentationController
{
  return self->_adaptivePresentationController;
}

- (void)setAdaptivePresentationController:(id)a3
{
  self->_adaptivePresentationController = (_UISearchControllerPresenting *)a3;
}

- (UIViewControllerTransitionCoordinator)transitioningToSizeCoordinator
{
  return self->_transitioningToSizeCoordinator;
}

- (void)setTransitioningToSizeCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
