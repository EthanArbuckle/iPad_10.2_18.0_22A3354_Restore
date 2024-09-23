@implementation _UISearchPresentationController

- (_UISearchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UISearchPresentationController *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchPresentationController.m"), 62, CFSTR("_UISearchPresentationController must present a UISearchController"));
  v10.receiver = self;
  v10.super_class = (Class)_UISearchPresentationController;
  v8 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v10, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v8)
  {
    v8->_assistant = -[_UISearchPresentationAssistant initWithSearchPresentationController:]([_UISearchPresentationAssistant alloc], "initWithSearchPresentationController:", v8);
    v11[0] = 0x1E1A99540;
    v11[1] = 0x1E1A995A0;
    -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](v8, "_registerForTraitTokenChanges:withTarget:action:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2), v8, sel_contentSizeCategoryOrLegibilityWeightChanged);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_placeholderView = 0;
  self->_assistant = 0;

  self->_excisedSearchBarConstraitMap = 0;
  self->_placeholderConstraitMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationController;
  -[UIPresentationController dealloc](&v3, sel_dealloc);
}

+ (BOOL)shouldExciseSearchBar:(id)a3 duringPresentationWithPresenter:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = objc_msgSend(a3, "window");
  if (v6)
  {
    objc_opt_class();
    if (!a3)
    {
      objc_opt_class();
      objc_opt_class();
      if (a4)
      {
LABEL_16:
        LODWORD(v6) = objc_msgSend((id)objc_msgSend(a4, "_existingView"), "containsView:", a3);
        if (!(_DWORD)v6)
          return v6;
      }
LABEL_17:
      LOBYTE(v6) = 1;
      return v6;
    }
    v7 = a3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (id)objc_msgSend(v7, "superview");
      if (!v7)
      {
        objc_opt_class();
        v8 = a3;
        while ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (id)objc_msgSend(v8, "superview");
          if (!v8)
          {
            objc_opt_class();
            v9 = a3;
            while ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v9 = (id)objc_msgSend(v9, "superview");
              if (!v9)
              {
                if (a4)
                  goto LABEL_16;
                goto LABEL_17;
              }
            }
            goto LABEL_14;
          }
        }
        break;
      }
    }
LABEL_14:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_updateContainerFinalFrameForNonExcisedSearchBar
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v3 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
  objc_opt_class();
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)objc_msgSend(v4, "superview");
      if (!v4)
        goto LABEL_5;
    }
    v5 = v4;
  }
  else
  {
LABEL_5:
    if (!objc_msgSend(v3, "_containedInNavigationPalette"))
      return;
    v5 = (void *)objc_msgSend(-[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController"), "existingPaletteForEdge:", 2);
  }
  objc_msgSend(v5, "frame");
  self->_finalFrameForContainerView.origin.x = v6;
  self->_finalFrameForContainerView.origin.y = v7;
  self->_finalFrameForContainerView.size.width = v8;
  self->_finalFrameForContainerView.size.height = v9;
}

- (UIView)backgroundObscuringView
{
  return (UIView *)-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView");
}

- (void)showBackgroundObscuringView
{
  objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 1);
}

- (void)hideBackgroundObscuringView
{
  objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 0);
}

- (void)_presentationTransitionWithSearchBarNotHostedByNavBarWillBegin
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  double v6;
  int *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  NSMapTable *placeholderConstraitMap;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  id v21;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  _QWORD v47[11];
  char v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;

  v55 = *MEMORY[0x1E0C80C00];
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 1);
  if ((objc_msgSend((id)-[UIViewController _managedPalette](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_managedPalette"), "_supportsSpecialSearchBarTransitions") & 1) == 0)-[_UISearchPresentationAssistant ensureAppropriatelySizedSearchBar:](self->_assistant, "ensureAppropriatelySizedSearchBar:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"));
  v3 = +[_UISearchPresentationController shouldExciseSearchBar:duringPresentationWithPresenter:](_UISearchPresentationController, "shouldExciseSearchBar:duringPresentationWithPresenter:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), -[UIPresentationController presentingViewController](self, "presentingViewController"));
  v4 = -[_UISearchPresentationAssistant searchBarWillResizeForScopeBar](self->_assistant, "searchBarWillResizeForScopeBar");
  v5 = 0;
  v6 = 0.0;
  v7 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
  if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "window")&& v3)
  {
    v8 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
    objc_opt_class();
    if (v8)
    {
      v9 = v8;
      do
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        v9 = (void *)objc_msgSend(v9, "superview");
      }
      while (v9);
    }
    else
    {
      v9 = 0;
    }
    -[_UISearchPresentationController _visibleRefreshControlHeightForTableView:](self, "_visibleRefreshControlHeightForTableView:", v9);
    v6 = v10;
    v46 = v3;
    if (fabs(v10) >= 2.22044605e-16)
      v11 = objc_msgSend(v9, "_refreshControl");
    else
      v11 = 0;
    v12 = (void *)objc_msgSend(v8, "superview");
    v13 = -[_UISearchPresentationController searchBarContainerView](self, "searchBarContainerView");
    v14 = -[UIViewController view](-[UIPresentationController presentingViewController](self, "presentingViewController"), "view");
    if (-[UIViewController _searchbarWasTableHeaderView](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_searchbarWasTableHeaderView"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "_setMaskActive:", 0);
        -[UIView adjustedContentInset](v14, "adjustedContentInset");
        -[UIView frame](v13, "frame");
        -[UIView setFrame:](v13, "setFrame:");
      }
    }
    if (objc_msgSend(v8, "isFirstResponder"))
      +[UIView _setIsResponderAncestorOfFirstResponder:startingAtFirstResponder:]((uint64_t)UIView, 0, v12);
    -[_UISearchPresentationController _exciseSearchBarFromCurrentContext](self, "_exciseSearchBarFromCurrentContext");
    objc_msgSend(v8, "_setTransplanting:", 1);
    objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v12, "addSubview:", self->_placeholderView);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    placeholderConstraitMap = self->_placeholderConstraitMap;
    v16 = -[NSMapTable countByEnumeratingWithState:objects:count:](placeholderConstraitMap, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(placeholderConstraitMap);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "addConstraints:", -[NSMapTable objectForKey:](self->_placeholderConstraitMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i)));
        }
        v17 = -[NSMapTable countByEnumeratingWithState:objects:count:](placeholderConstraitMap, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v17);
    }

    self->_placeholderConstraitMap = 0;
    if (v9)
    {
      v3 = v46;
      v7 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
      v5 = v11;
      if ((void *)objc_msgSend(v9, "tableHeaderView") == v8)
      {
        *(_BYTE *)&self->_controllerFlags |= 1u;
        objc_msgSend(v9, "setTableHeaderView:", self->_placeholderView);
      }
    }
    else
    {
      v3 = v46;
      v7 = &OBJC_IVAR___UICellAccessoryLabel__adjustsFontForContentSizeCategory;
      v5 = v11;
    }
  }
  v20 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", objc_msgSend(v20, "isAnimated"));
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    -[UIView addSubview:](-[UIPresentationController containerView](self, "containerView"), "addSubview:", -[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"));
    if (objc_msgSend(v20, "isAnimated"))
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke;
      v49[3] = &unk_1E16DEA00;
      v49[4] = self;
      objc_msgSend(v20, "animateAlongsideTransition:completion:", v49, 0);
    }
    else
    {
      -[_UISearchPresentationController showBackgroundObscuringView](self, "showBackgroundObscuringView");
    }
  }
  if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
  {
    v21 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
    if (v21)
    {
      v22 = v21;
      if ((objc_msgSend(v21, "isNavigationBarHidden") & 1) == 0)
      {
        objc_msgSend(v22, "_setNavigationBarHidesCompletelyOffscreen:", 1);
        objc_msgSend(v22, "_setSearchHidNavigationBar:", 1);
        if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_containedInNavigationPalette"))
        {
          v23 = (void *)objc_msgSend(v22, "existingPaletteForEdge:", 2);
          objc_msgSend(v23, "setVisibleWhenPinningBarIsHidden:", 1);
          objc_msgSend(v23, "frame");
          self->_finalFrameForContainerView.origin.x = v24;
          self->_finalFrameForContainerView.origin.y = v25;
          self->_finalFrameForContainerView.size.width = v26;
          self->_finalFrameForContainerView.size.height = v27;
          if (objc_msgSend(v23, "_supportsSpecialSearchBarTransitions"))
          {
            v28 = (void *)objc_msgSend(v23, "_searchBar");
            objc_msgSend(v28, "_barHeightForBarMetrics:barPosition:", objc_msgSend(v28, "_barMetricsForOrientation:", objc_msgSend(v28, "_expectedInterfaceOrientation")), 3);
            self->_finalFrameForContainerView.size.height = v29;
          }
          objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "frame");
          self->_finalFrameForContainerView.origin.y = self->_finalFrameForContainerView.origin.y - CGRectGetHeight(v56);
        }
        v30 = *MEMORY[0x1E0C9D648];
        v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v32 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        if (v3
          && !-[_UISearchPresentationController animatorShouldLayoutPresentationViews](self, "animatorShouldLayoutPresentationViews"))
        {
          objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "frame");
          v38 = v37;
          -[UIView frame](-[_UISearchPresentationController searchBarContainerView](self, "searchBarContainerView"), "frame");
          v30 = v39;
          v32 = v40;
          v33 = v41;
          v43 = v42 - v38;
          if (objc_msgSend((id)objc_msgSend(v22, "navigationBar"), "barPosition") == 3)
          {
            -[_UISearchPresentationAssistant statusBarAdjustment](self->_assistant, "statusBarAdjustment");
            v43 = v43 - v44;
            v33 = v33 + v44;
          }
          v45 = 0.0;
          if (fabs(v6) >= 2.22044605e-16)
            v45 = v6;
          v31 = v43 - v45;
          self->_finalFrameForContainerView.origin.x = v30;
          self->_finalFrameForContainerView.origin.y = v31;
          self->_finalFrameForContainerView.size.width = v32;
          self->_finalFrameForContainerView.size.height = v33;
          v34 = 1;
        }
        else
        {
          v34 = 0;
        }
        if (objc_msgSend(v20, "isAnimated"))
        {
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2;
          v47[3] = &unk_1E16DEA28;
          v47[4] = v22;
          v47[5] = self;
          v48 = v34;
          *(double *)&v47[7] = v30;
          *(double *)&v47[8] = v31;
          *(double *)&v47[9] = v32;
          *(double *)&v47[10] = v33;
          v47[6] = v5;
          objc_msgSend(v20, "animateAlongsideTransition:completion:", v47, 0);
        }
        else
        {
          objc_msgSend(v22, "setNavigationBarHidden:animated:", 1, 0);
          if (v34)
            -[UIView setFrame:](-[_UISearchPresentationController searchBarContainerView](self, "searchBarContainerView"), "setFrame:", v30, v31, v32, v33);
        }
      }
    }
  }
  else
  {
    -[_UISearchPresentationController _updateContainerFinalFrameForNonExcisedSearchBar](self, "_updateContainerFinalFrameForNonExcisedSearchBar");
  }
  if (v4)
  {
    objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarHeight");
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", v20, 0.0, v35);
  }
  if (v3)
    v36 = 2;
  else
    v36 = 0;
  *((_BYTE *)&self->super.super.isa + v7[946]) = *((_BYTE *)&self->super.super.isa + v7[946]) & 0xFD | v36;
}

- (void)_presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3
{
  id v4;
  void *v5;
  CGSize v6;

  if (!a3)
  {
    -[_UISearchPresentationController _placeSearchBarBackIntoOriginalContext](self, "_placeSearchBarBackIntoOriginalContext");
    if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
    {
      -[UIView removeFromSuperview](-[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"), "removeFromSuperview");
    }
    if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
    {
      v4 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
      if (v4)
      {
        v5 = v4;
        if (objc_msgSend(v4, "_searchHidNavigationBar"))
          objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 0);
      }
    }
  }
  v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_finalFrameForContainerView.size = v6;
}

- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
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
  _QWORD v26[5];
  _QWORD v27[10];
  _QWORD v28[5];
  CGRect v29;

  v3 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarIsVisible"))v4 = objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_shouldCombineLandscapeBars") ^ 1;
  else
    v4 = 0;
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    if (objc_msgSend(v3, "isAnimated"))
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke;
      v28[3] = &unk_1E16DEA00;
      v28[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v28, 0);
    }
    else
    {
      -[_UISearchPresentationController hideBackgroundObscuringView](self, "hideBackgroundObscuringView");
    }
  }
  if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
  {
    v5 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "_searchHidNavigationBar"))
      {
        if (objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_containedInNavigationPalette"))
        {
          v7 = (void *)objc_msgSend(v6, "existingPaletteForEdge:", 2);
          objc_msgSend(v7, "frame");
          self->_finalFrameForContainerView.origin.x = v8;
          self->_finalFrameForContainerView.origin.y = v9;
          self->_finalFrameForContainerView.size.width = v10;
          self->_finalFrameForContainerView.size.height = v11;
          if (objc_msgSend(v7, "_supportsSpecialSearchBarTransitions"))
          {
            v12 = (void *)objc_msgSend(v7, "_searchBar");
            objc_msgSend(v12, "_barHeightForBarMetrics:barPosition:", objc_msgSend(v12, "_barMetricsForOrientation:", objc_msgSend(v12, "_expectedInterfaceOrientation")), 2);
            self->_finalFrameForContainerView.size.height = v13;
          }
          objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "frame");
          self->_finalFrameForContainerView.origin.y = CGRectGetHeight(v29) + self->_finalFrameForContainerView.origin.y;
        }
        if ((*(_BYTE *)&self->_controllerFlags & 2) != 0)
        {
          objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "frame");
          v20 = v19;
          -[UIView frame](-[_UISearchPresentationController searchBarContainerView](self, "searchBarContainerView"), "frame");
          v14 = v21;
          v17 = v22;
          v16 = v23;
          v15 = v20 + v24;
          if (objc_msgSend((id)objc_msgSend(v6, "navigationBar"), "barPosition") == 3)
          {
            -[_UISearchPresentationAssistant statusBarAdjustment](self->_assistant, "statusBarAdjustment");
            v15 = v15 + v25;
            v16 = v16 - v25;
          }
          self->_finalFrameForContainerView.origin.x = v14;
          self->_finalFrameForContainerView.origin.y = v15;
          self->_finalFrameForContainerView.size.width = v17;
          self->_finalFrameForContainerView.size.height = v16;
        }
        else
        {
          v14 = *MEMORY[0x1E0C9D648];
          v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        }
        if (objc_msgSend(v3, "isAnimated"))
        {
          v26[4] = v6;
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2;
          v27[3] = &unk_1E16DEA50;
          v27[4] = v6;
          v27[5] = self;
          *(double *)&v27[6] = v14;
          *(double *)&v27[7] = v15;
          *(double *)&v27[8] = v17;
          *(double *)&v27[9] = v16;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_3;
          v26[3] = &unk_1E16DEA00;
          objc_msgSend(v3, "animateAlongsideTransition:completion:", v27, v26);
        }
        else
        {
          objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, 0);
          if ((*(_BYTE *)&self->_controllerFlags & 2) != 0)
            -[UIView setFrame:](-[_UISearchPresentationController searchBarContainerView](self, "searchBarContainerView"), "setFrame:", v14, v15, v17, v16);
          objc_msgSend(v6, "_setNavigationBarHidesCompletelyOffscreen:", 0);
          objc_msgSend(v6, "_setSearchHidNavigationBar:", 0);
        }
      }
    }
  }
  else
  {
    -[_UISearchPresentationController _updateContainerFinalFrameForNonExcisedSearchBar](self, "_updateContainerFinalFrameForNonExcisedSearchBar");
  }
  if (v4)
  {
    objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_scopeBarHeight");
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", v3, 0.0, -v18);
  }
}

- (void)_dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:(BOOL)a3
{
  id v4;
  UIViewController *v5;
  void *v6;
  _BOOL8 v7;
  CGSize v8;

  if (a3)
  {
    v4 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
    v5 = -[UIPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)-[UIViewController searchBar](v5, "searchBar");
    -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 0);
    -[_UISearchPresentationController _placeSearchBarBackIntoOriginalContext](self, "_placeSearchBarBackIntoOriginalContext");
    if (-[UIViewController obscuresBackgroundDuringPresentation](v5, "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
    {
      -[UIView removeFromSuperview](-[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"), "removeFromSuperview");
    }
    -[_UISearchPresentationAssistant removeContainerViewFromSuperview](self->_assistant, "removeContainerViewFromSuperview");
    if (objc_msgSend(v6, "_containedInNavigationPalette")
      && -[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](v5, "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
    {
      objc_msgSend((id)objc_msgSend(-[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController"), "existingPaletteForEdge:", 2), "setVisibleWhenPinningBarIsHidden:", 0);
    }
    if ((objc_msgSend(v4, "isAnimated") & 1) == 0)
    {
      if (-[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition") != -1)
      {
        objc_msgSend(v6, "_setBarPosition:", -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition"));
        v7 = objc_msgSend(v6, "barPosition") == 3
          && -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition") != 3;
        objc_msgSend(v6, "_setMaskActive:", v7);
        -[UIViewController set_previousSearchBarPosition:](v5, "set_previousSearchBarPosition:", -1);
      }
      objc_msgSend(v6, "_setScopeBarHidden:", 1);
    }
  }
  v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_finalFrameForContainerView.size = v8;
}

- (void)_presentationTransitionWithSearchBarHostedByNavBarWillBegin
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  UIViewController *v7;
  uint64_t v8;
  void *v9;
  int has_internal_diagnostics;
  char v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 1);
  -[_UISearchPresentationAssistant searchBarWillResizeForScopeBar](self->_assistant, "searchBarWillResizeForScopeBar");
  v3 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", objc_msgSend(v3, "isAnimated"));
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    -[UIView addSubview:](-[UIPresentationController containerView](self, "containerView"), "addSubview:", -[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"));
    if (objc_msgSend(v3, "isAnimated"))
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke;
      v29[3] = &unk_1E16DEA00;
      v29[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v29, 0);
    }
    else
    {
      -[_UISearchPresentationController showBackgroundObscuringView](self, "showBackgroundObscuringView");
    }
  }
  v4 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
  v5 = (void *)objc_msgSend(v4, "navigationBar");
  v6 = (void *)objc_msgSend(v5, "topItem");
  v7 = (UIViewController *)objc_msgSend(v6, "_searchControllerIfAllowed");
  if (v7 == -[UIPresentationController presentedViewController](self, "presentedViewController")
    && (objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive") & 1) == 0)
  {
    objc_msgSend(v5, "_presentHostedSearchWithTransitionCoordinator:", v3);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v11 = objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive");
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        v21 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v22 = objc_msgSend(v6, "_stackEntry");
          *(_DWORD *)buf = 138412290;
          v31 = v22;
          _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "stackEntry should register searchActive. %@", buf, 0xCu);
        }
      }
    }
    else if ((v11 & 1) == 0)
    {
      v23 = _MergedGlobals_21_8;
      if (!_MergedGlobals_21_8)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&_MergedGlobals_21_8);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(v6, "_stackEntry");
        *(_DWORD *)buf = 138412290;
        v31 = v25;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "stackEntry should register searchActive. %@", buf, 0xCu);
      }
    }
    objc_msgSend(v5, "frame");
    self->_finalFrameForContainerView.origin.x = v12;
    self->_finalFrameForContainerView.origin.y = v13;
    self->_finalFrameForContainerView.size.width = v14;
    self->_finalFrameForContainerView.size.height = v15;
    v16 = -[_UINavigationBarLayout layoutHeights](objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "activeLayout"));
    self->_finalFrameForContainerView.size.height = v17;
    if (objc_msgSend(v3, "isAnimated", v16))
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_20;
      v28[3] = &unk_1E16DEA00;
      v28[4] = v4;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v28, 0);
    }
    else
    {
      objc_msgSend(v4, "_layoutTopViewController");
    }
  }
  else
  {
    v8 = -[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController");
    v9 = (void *)v8;
    if (v8 && (void *)v8 == v6)
      goto LABEL_10;
    if (os_variant_has_internal_diagnostics())
    {
      v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        v27 = objc_msgSend(v5, "items");
        *(_DWORD *)buf = 138412546;
        v31 = v27;
        v32 = 2112;
        v33 = v9;
        _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Surprise! Activating a search controller whose navigation item is not at the top of the stack. This case needs examination in UIKit. items = %@,\nsearch hosting item = %@", buf, 0x16u);
      }
    }
    else
    {
      v18 = qword_1ECD7C548;
      if (!qword_1ECD7C548)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7C548);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v5, "items");
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Surprise! Activating a search controller whose navigation item is not at the top of the stack. This case needs examination in UIKit. items = %@,\nsearch hosting item = %@", buf, 0x16u);
      }
    }
    if (v9)
    {
LABEL_10:
      objc_msgSend((id)objc_msgSend(v9, "_stackEntry"), "setSearchActive:", 1);
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_driveTransitionToSearchLayoutState:", 3);
    }
  }
  *(_BYTE *)&self->_controllerFlags &= ~2u;
}

- (void)_presentationTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3
{
  CGSize v4;

  if (!a3
    && -[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    -[UIView removeFromSuperview](-[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"), "removeFromSuperview");
  }
  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_finalFrameForContainerView.size = v4;
}

- (void)_dismissalTransitionWithSearchBarHostedByNavBarWillBegin
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  UIViewController *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    if (objc_msgSend(v3, "isAnimated"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke;
      v10[3] = &unk_1E16DEA00;
      v10[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v10, 0);
    }
    else
    {
      -[_UISearchPresentationController hideBackgroundObscuringView](self, "hideBackgroundObscuringView");
    }
  }
  v4 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
  v5 = (void *)objc_msgSend(v4, "navigationBar");
  v6 = (void *)objc_msgSend(v5, "topItem");
  v7 = (UIViewController *)objc_msgSend(v6, "_searchControllerIfAllowed");
  if (v7 == -[UIPresentationController presentedViewController](self, "presentedViewController")
    && objc_msgSend((id)objc_msgSend(v6, "_stackEntry"), "isSearchActive"))
  {
    objc_msgSend(v5, "_dismissHostedSearchWithTransitionCoordinator:", v3);
    if (objc_msgSend(v3, "isAnimated"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_2;
      v9[3] = &unk_1E16DEA00;
      v9[4] = v4;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v9, 0);
    }
    else
    {
      objc_msgSend(v4, "_layoutTopViewController");
    }
  }
  else
  {
    v8 = (void *)-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController");
    if (objc_msgSend((id)objc_msgSend(v8, "_stackEntry"), "isSearchActive"))
    {
      objc_msgSend((id)objc_msgSend(v8, "_stackEntry"), "setSearchActive:", 0);
      objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "_driveTransitionToSearchLayoutState:", 2);
    }
  }
}

- (void)_dismissalTransitionWithSearchBarHostedByNavBarDidEnd:(BOOL)a3
{
  id v4;
  UIViewController *v5;
  void *v6;
  _BOOL8 v7;
  int v8;
  CGSize v9;

  if (a3)
  {
    v4 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
    v5 = -[UIPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)-[UIViewController searchBar](v5, "searchBar");
    -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](self, "_setContainerIgnoresDirectTouchEvents:", 0);
    -[_UISearchPresentationController _placeSearchBarBackIntoOriginalContext](self, "_placeSearchBarBackIntoOriginalContext");
    if (-[UIViewController obscuresBackgroundDuringPresentation](v5, "obscuresBackgroundDuringPresentation")&& !-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
    {
      -[UIView removeFromSuperview](-[_UISearchPresentationController backgroundObscuringView](self, "backgroundObscuringView"), "removeFromSuperview");
    }
    -[_UISearchPresentationAssistant removeContainerViewFromSuperview](self->_assistant, "removeContainerViewFromSuperview");
    if ((objc_msgSend(v4, "isAnimated") & 1) == 0)
    {
      if (-[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition") != -1)
      {
        objc_msgSend(v6, "_setBarPosition:", -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition"));
        v7 = objc_msgSend(v6, "barPosition") == 3
          && -[UIViewController _previousSearchBarPosition](v5, "_previousSearchBarPosition") != 3;
        objc_msgSend(v6, "_setMaskActive:", v7);
        -[UIViewController set_previousSearchBarPosition:](v5, "set_previousSearchBarPosition:", -1);
      }
      if (!v5)
        goto LABEL_15;
      v8 = (HIDWORD(v5[1]._toolbarItems) >> 5) & 3;
      if (v8 != 1)
      {
        if (!v8)
          dyld_program_sdk_at_least();
LABEL_15:
        objc_msgSend(v6, "_setScopeBarHidden:", 1);
      }
    }
  }
  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_finalFrameForContainerView.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_finalFrameForContainerView.size = v9;
}

- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  if (!-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController"))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UISearchPresentationController;
    LOBYTE(v3) = -[UIPresentationController _requiresDeferralToCoordinateWithNavigationTransitionAnimated:](&v6, sel__requiresDeferralToCoordinateWithNavigationTransitionAnimated_, v3);
  }
  return v3;
}

- (void)presentationTransitionWillBegin
{
  if (-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController"))
  {
    -[_UISearchPresentationController _presentationTransitionWithSearchBarHostedByNavBarWillBegin](self, "_presentationTransitionWithSearchBarHostedByNavBarWillBegin");
  }
  else
  {
    -[_UISearchPresentationController _presentationTransitionWithSearchBarNotHostedByNavBarWillBegin](self, "_presentationTransitionWithSearchBarNotHostedByNavBarWillBegin");
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController"))
  {
    -[_UISearchPresentationController _presentationTransitionWithSearchBarHostedByNavBarDidEnd:](self, "_presentationTransitionWithSearchBarHostedByNavBarDidEnd:", v3);
  }
  else
  {
    -[_UISearchPresentationController _presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:](self, "_presentationTransitionWithSearchBarNotHostedByNavBarDidEnd:", v3);
  }
}

- (void)dismissalTransitionWillBegin
{
  if (-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController"))
  {
    -[_UISearchPresentationController _dismissalTransitionWithSearchBarHostedByNavBarWillBegin](self, "_dismissalTransitionWithSearchBarHostedByNavBarWillBegin");
  }
  else
  {
    -[_UISearchPresentationController _dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin](self, "_dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin");
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIViewController _navigationItemCurrentlyDisplayingSearchController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_navigationItemCurrentlyDisplayingSearchController"))
  {
    -[_UISearchPresentationController _dismissalTransitionWithSearchBarHostedByNavBarDidEnd:](self, "_dismissalTransitionWithSearchBarHostedByNavBarDidEnd:", v3);
  }
  else
  {
    -[_UISearchPresentationController _dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:](self, "_dismissalTransitionWithSearchBarNotHostedByNavBarDidEnd:", v3);
  }
}

- (void)_transitionToDidEnd
{
  -[_UISearchPresentationController presentationTransitionDidEnd:](self, "presentationTransitionDidEnd:", 1);
}

- (void)_transitionFromDidEnd
{
  -[_UISearchPresentationController dismissalTransitionDidEnd:](self, "dismissalTransitionDidEnd:", 1);
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UISearchPresentationController;
  -[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:](&v17, sel__transitionToPresentationController_withTransitionCoordinator_, a3, a4);
  if (-[UIViewController modalPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "modalPresentationStyle") != UIModalPresentationPopover)
  {
    objc_msgSend((id)objc_msgSend(a3, "searchBarContainerView"), "addSubview:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"));
    objc_msgSend(a3, "resultsControllerContentOffset");
    v7 = v6;
    v8 = (void *)-[UIViewController searchResultsController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchResultsController");
    v9 = objc_msgSend(v8, "_contentOrObservableScrollViewForEdge:", 1);
    if (v8)
    {
      v10 = (void *)v9;
      if (v9)
      {
        if (objc_msgSend(v8, "automaticallyAdjustsScrollViewInsets"))
        {
          objc_msgSend(v10, "contentOffset");
          v12 = v11;
          v14 = v13;
          objc_msgSend(v10, "contentInset");
          v16 = v14 + v15;
          objc_msgSend(v10, "setContentInset:", v7, 0.0, 0.0, 0.0);
          objc_msgSend(v10, "setContentOffset:", v12, v16);
        }
      }
    }
  }
}

- (id)_constraintCopyOfConstraint:(id)a3 replaceItem:(id)a4 withItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v8 = (id)objc_msgSend(a3, "firstItem");
  v9 = (id)objc_msgSend(a3, "secondItem");
  if (v8 == a4)
    v8 = a5;
  if (v9 != a4)
    a5 = v9;
  v10 = (void *)MEMORY[0x1E0D156E0];
  v11 = objc_msgSend(a3, "firstAttribute");
  v12 = objc_msgSend(a3, "relation");
  v13 = objc_msgSend(a3, "secondAttribute");
  objc_msgSend(a3, "multiplier");
  v15 = v14;
  objc_msgSend(a3, "constant");
  v17 = (void *)objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, v11, v12, a5, v13, v15, v16);
  objc_msgSend(a3, "priority");
  objc_msgSend(v17, "setPriority:");
  return v17;
}

- (void)_exciseSearchBarFromCurrentContext
{
  _BYTE *v3;
  UIView *v4;
  UIView *v5;
  _UIViewBlockVisitor *v6;
  _UIViewBlockVisitor *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  NSMapTable *obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[6];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (_BYTE *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
  *(_BYTE *)&self->_controllerFlags = *(_BYTE *)&self->_controllerFlags & 0xFB | v3[111] & 4;
  v4 = [UIView alloc];
  objc_msgSend(v3, "frame");
  v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
  self->_placeholderView = v5;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints"));
  if (objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[UIView setAutoresizingMask:](self->_placeholderView, "setAutoresizingMask:", objc_msgSend(v3, "autoresizingMask"));
  }
  else
  {
    self->_excisedSearchBarConstraitMap = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 0);
    v6 = [_UIViewBlockVisitor alloc];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69___UISearchPresentationController__exciseSearchBarFromCurrentContext__block_invoke;
    v29[3] = &unk_1E16DEA78;
    v29[4] = v3;
    v29[5] = self;
    v7 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v6, "initWithTraversalDirection:visitorBlock:", 1, v29);
    objc_msgSend(v3, "_receiveVisitor:", v7);

    self->_placeholderConstraitMap = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 0);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_excisedSearchBarConstraitMap;
    v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(obj);
          v20 = v8;
          v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = -[NSMapTable objectForKey:](self->_excisedSearchBarConstraitMap, "objectForKey:", v9);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
                v16 = -[NSMapTable objectForKey:](self->_placeholderConstraitMap, "objectForKey:", v9);
                if (!v16)
                {
                  v16 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  -[NSMapTable setObject:forKey:](self->_placeholderConstraitMap, "setObject:forKey:", v16, v9);
                }
                objc_msgSend(v16, "addObject:", -[_UISearchPresentationController _constraintCopyOfConstraint:replaceItem:withItem:](self, "_constraintCopyOfConstraint:replaceItem:withItem:", v15, v3, self->_placeholderView));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            }
            while (v12);
          }
          v8 = v20 + 1;
        }
        while (v20 + 1 != v19);
        v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v19);
    }
  }
}

- (void)_placeSearchBarBackIntoOriginalContext
{
  UIView *placeholderView;
  UIView *v4;
  _QWORD *v5;
  UIView *v6;
  char controllerFlags;
  NSMapTable *excisedSearchBarConstraitMap;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    v4 = -[UIView superview](placeholderView, "superview");
    v5 = (_QWORD *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
    if ((*(_BYTE *)&self->_controllerFlags & 1) != 0)
    {
      v6 = self->_placeholderView;
      objc_opt_class();
      for (; v6; v6 = -[UIView superview](v6, "superview"))
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
    }
    else
    {
      v6 = 0;
    }
    -[UIView removeFromSuperview](self->_placeholderView, "removeFromSuperview");
    controllerFlags = (char)self->_controllerFlags;
    if ((controllerFlags & 4) == 0)
    {
      objc_msgSend(v5, "removeFromSuperview");
      v5[13] &= ~0x400000000000000uLL;
      controllerFlags = (char)self->_controllerFlags;
    }
    if ((controllerFlags & 1) != 0)
    {
      -[UIView setTableHeaderView:](v6, "setTableHeaderView:", v5);
      *(_BYTE *)&self->_controllerFlags &= ~1u;
    }
    else
    {
      -[UIView addSubview:](v4, "addSubview:", v5);
    }
    if (-[UIView translatesAutoresizingMaskIntoConstraints](self->_placeholderView, "translatesAutoresizingMaskIntoConstraints"))
    {
      -[UIView frame](self->_placeholderView, "frame");
      objc_msgSend(v5, "setFrame:");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      excisedSearchBarConstraitMap = self->_excisedSearchBarConstraitMap;
      v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](excisedSearchBarConstraitMap, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(excisedSearchBarConstraitMap);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "addConstraints:", -[NSMapTable objectForKey:](self->_excisedSearchBarConstraitMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)));
          }
          v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](excisedSearchBarConstraitMap, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }
    }

    self->_placeholderView = 0;
    self->_excisedSearchBarConstraitMap = 0;
  }
}

- (double)_visibleRefreshControlHeightForTableView:(id)a3
{
  double result;

  if (!a3
    || !objc_msgSend(a3, "_refreshControl")
    || objc_msgSend((id)objc_msgSend(a3, "_refreshControl"), "refreshControlState") != 2
    && objc_msgSend((id)objc_msgSend(a3, "_refreshControl"), "refreshControlState") != 3)
  {
    return 0.0;
  }
  objc_msgSend((id)objc_msgSend(a3, "_refreshControl"), "_visibleHeight");
  return result;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double MaxY;
  CGFloat v10;
  UIViewController *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = v6;
  v8 = v5;
  MaxY = v4;
  v10 = *MEMORY[0x1E0C9D648];
  if (-[_UISearchPresentationAssistant presentationIsPopoverToOverFullScreenAdaptation](self->_assistant, "presentationIsPopoverToOverFullScreenAdaptation"))
  {
    v11 = -[UIPresentationController presentingViewController](self, "presentingViewController");
    objc_opt_class();
    v7 = v6;
    v8 = v5;
    MaxY = v4;
    v10 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIView frame](-[UIViewController view](v11, "view"), "frame");
      v10 = v12;
      v8 = v13;
      v15 = v14;
      objc_msgSend((id)-[UIViewController navigationBar](v11, "navigationBar"), "frame");
      MaxY = CGRectGetMaxY(v32);
      objc_msgSend((id)-[UIViewController navigationBar](v11, "navigationBar"), "frame");
      v7 = v15 - CGRectGetHeight(v33);
    }
  }
  v34.origin.x = v10;
  v34.origin.y = MaxY;
  v34.size.width = v8;
  v34.size.height = v7;
  v36.origin.x = v3;
  v36.origin.y = v4;
  v36.size.width = v5;
  v36.size.height = v6;
  if (CGRectEqualToRect(v34, v36))
  {
    v16 = -[_UISearchPresentationAssistant locateNavigationController](self->_assistant, "locateNavigationController");
    -[UIView frame](-[UIViewController view](-[UIPresentationController presentingViewController](self, "presentingViewController"), "view"), "frame");
    v10 = v17;
    MaxY = v18;
    v8 = v19;
    v7 = v20;
    v21 = objc_msgSend(v16, "_shouldNavigationBarInsetViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
    if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch")&& objc_msgSend(v16, "_searchHidNavigationBar")&& ((-[UIViewController edgesForExtendedLayout](-[UIPresentationController presentingViewController](self, "presentingViewController"), "edgesForExtendedLayout") & 1) == 0? (v22 = 1): (v22 = v21), v22 == 1))
    {
      objc_msgSend(v16, "_frameForViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
      MaxY = MaxY - v23;
      v7 = v7 + v23;
    }
    else if ((-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch") & 1) == 0&& -[_UISearchPresentationController forceObeyNavigationBarInsets](self, "forceObeyNavigationBarInsets")&& v21)
    {
      objc_msgSend(v16, "_frameForViewController:", -[UIPresentationController presentingViewController](self, "presentingViewController"));
      v10 = v24;
      MaxY = v25;
      v8 = v26;
      v7 = v27;
    }
  }
  v28 = v10;
  v29 = MaxY;
  v30 = v8;
  v31 = v7;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISearchPresentationController;
  -[UIPresentationController containerViewWillLayoutSubviews](&v5, sel_containerViewWillLayoutSubviews);
  -[UIView bounds](-[UIPresentationController containerView](self, "containerView"), "bounds");
  -[_UISearchPresentationController _layoutPresentationWithSize:transitionCoordinator:](self, "_layoutPresentationWithSize:transitionCoordinator:", 0, v3, v4);
}

- (void)contentSizeCategoryOrLegibilityWeightChanged
{
  objc_msgSend((id)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"), "layoutIfNeeded");
  -[UIView setNeedsLayout](-[UIPresentationController containerView](self, "containerView"), "setNeedsLayout");
}

- (void)_layoutPresentationWithSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  double x;
  double y;
  double v29;
  void *v30;
  UIWindow *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.height;
  width = a3.width;
  -[_UISearchPresentationAssistant setTransitioningToSizeCoordinator:](self->_assistant, "setTransitioningToSizeCoordinator:");
  v8 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
  v9 = objc_msgSend(v8, "_scopeBarIsVisible");
  if (v9)
  {
    objc_msgSend(v8, "_setScopeBarPosition:", 0);
    if (objc_msgSend(v8, "_wouldCombineLandscapeBarsForSize:", width, height))
    {
      if (objc_msgSend(v8, "_shouldCombineLandscapeBarsForOrientation:", -[UIWindow _toWindowOrientation](-[UIView window](-[UIPresentationController containerView](self, "containerView"), "window"), "_toWindowOrientation")))v10 = 1;
      else
        v10 = 2;
    }
    else
    {
      v10 = 2;
    }
    objc_msgSend(v8, "_setScopeBarPosition:", v10);
  }
  if (-[_UISearchPresentationController searchBarToBecomeTopAttached](self, "searchBarToBecomeTopAttached"))
  {
    -[UIViewController set_previousSearchBarPosition:](-[UIPresentationController presentedViewController](self, "presentedViewController"), "set_previousSearchBarPosition:", objc_msgSend(v8, "barPosition"));
    objc_msgSend(v8, "_setBarPosition:", 3);
  }
  -[_UISearchPresentationAssistant updateSearchBarContainerFrame](self->_assistant, "updateSearchBarContainerFrame");
  v13 = v12;
  v14 = v11;
  if (v12 != *MEMORY[0x1E0C9D820] || v11 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[_UISearchPresentationAssistant statusBarAdjustment](self->_assistant, "statusBarAdjustment");
    v17 = v16;
    if (v9)
    {
      objc_msgSend(v8, "sizeToFit");
      objc_msgSend(v8, "frame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))v24 = v17;
      else
        v24 = 0.0;
      objc_msgSend(v8, "setFrame:", v19, v24, v21, v23);
    }
    -[UIViewController _updateSearchResultsControllerWithDelta:](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_updateSearchResultsControllerWithDelta:", v13, v14);
    if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
    {
      objc_msgSend(__UIStatusBarManagerForWindow(-[UIViewController _window](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_window")), "defaultStatusBarHeightInOrientation:", -[UIWindowScene interfaceOrientation](-[UIWindow windowScene](-[UIViewController _window](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_window"), "windowScene"), "interfaceOrientation"));
      v14 = v14 + v25 - v17;
    }
    -[_UISearchPresentationController _updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:](self, "_updatePresentingViewControllerContentScrollViewWithOffsets:transitionCoordinator:", a4, v13, v14);
    if (self->_placeholderView)
    {
      objc_msgSend(v8, "frame");
      v26 = CGRectGetHeight(v44);
      -[UIView frame](self->_placeholderView, "frame");
      x = v45.origin.x;
      y = v45.origin.y;
      v29 = v45.size.width;
      if (CGRectGetHeight(v45) != v26)
        -[UIView setFrame:](self->_placeholderView, "setFrame:", x, y, v29, v26);
    }
  }
  if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_barPresentationStyle") == 2)
  {
    v30 = (void *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
    objc_opt_class();
    if (v30)
    {
      while ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = (void *)objc_msgSend(v30, "superview");
        if (!v30)
          goto LABEL_43;
      }
      v31 = -[UIView window](-[UIPresentationController containerView](self, "containerView"), "window");
      if (!v31)
        v31 = -[UIViewController _window](-[UIPresentationController presentingViewController](self, "presentingViewController"), "_window");
      v32 = -[UIWindow _fromWindowOrientation](v31, "_fromWindowOrientation");
      v33 = -[UIWindow _toWindowOrientation](v31, "_toWindowOrientation");
      +[UINavigationBar defaultSizeForOrientation:](UINavigationBar, "defaultSizeForOrientation:", v33);
      v35 = v34;
      objc_msgSend(v30, "frame");
      v36 = v35 - CGRectGetHeight(v46);
      if (((objc_msgSend(__UIStatusBarManagerForWindow(v31), "isStatusBarHidden") & 1) != 0
         || (objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v33), v37 == 0.0))
        && (objc_msgSend(__UIStatusBarManagerForWindow(v31), "isStatusBarHidden") & 1) == 0
        && (objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v32), v38 != 0.0))
      {
        objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v32);
        v36 = v36 - v42;
      }
      else if ((objc_msgSend(__UIStatusBarManagerForWindow(v31), "isStatusBarHidden") & 1) == 0)
      {
        objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v33);
        if (v39 != 0.0)
        {
          if ((objc_msgSend(__UIStatusBarManagerForWindow(v31), "isStatusBarHidden") & 1) != 0
            || (objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v32), v40 == 0.0))
          {
            objc_msgSend(__UIStatusBarManagerForWindow(v31), "defaultStatusBarHeightInOrientation:", v33);
            v36 = v36 + v41;
          }
        }
      }
      if (fabs(v36) >= 2.22044605e-16)
        -[UIViewController _updateSearchResultsControllerWithDelta:](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_updateSearchResultsControllerWithDelta:", 0.0, v36);
    }
  }
LABEL_43:
  -[UIViewController _resultsContentScrollViewPresentationOffset](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_resultsContentScrollViewPresentationOffset");
  if (fabs(v43) >= 2.22044605e-16)
    -[_UISearchPresentationAssistant resultsControllerContentOffset](self->_assistant, "resultsControllerContentOffset");
  -[_UISearchPresentationAssistant setTransitioningToSizeCoordinator:](self->_assistant, "setTransitioningToSizeCoordinator:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  -[_UISearchPresentationController _layoutPresentationWithSize:transitionCoordinator:](self, "_layoutPresentationWithSize:transitionCoordinator:");
  v8.receiver = self;
  v8.super_class = (Class)_UISearchPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
}

- (void)_updatePresentingViewControllerContentScrollViewWithOffsets:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  CGFloat width;
  id v7;
  void *v8;
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
  double v20;
  double v21;
  _QWORD v22[7];

  height = a3.height;
  width = a3.width;
  v7 = -[UIViewController _contentOrObservableScrollViewForEdge:](-[UIPresentationController presentingViewController](self, "presentingViewController"), "_contentOrObservableScrollViewForEdge:", 1);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v7, "_compatibleContentInsetAdjustmentBehavior") == 101)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __117___UISearchPresentationController__updatePresentingViewControllerContentScrollViewWithOffsets_transitionCoordinator___block_invoke;
      v22[3] = &unk_1E16DEAA0;
      v22[4] = v8;
      *(CGFloat *)&v22[5] = width;
      *(double *)&v22[6] = height;
      if (objc_msgSend(a4, "isAnimated"))
      {
        objc_msgSend(a4, "animateAlongsideTransition:completion:", v22, 0);
      }
      else
      {
        objc_msgSend(v8, "contentInset");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        objc_msgSend(v8, "contentOffset");
        v18 = v17;
        v19 = height + v10;
        v21 = v20 - height;
        objc_msgSend(v8, "setContentInset:", v19, v12, v14, v16);
        objc_msgSend(v8, "setContentOffset:", v18, v21);
      }
    }
  }
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  if (-[UIViewController modalPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "modalPresentationStyle") == UIModalPresentationPopover&& objc_msgSend(a3, "horizontalSizeClass") == 2)
  {
    return -[_UISearchPopoverPresentationController initWithPresentedViewController:presentingViewController:]([_UISearchPopoverPresentationController alloc], "initWithPresentedViewController:presentingViewController:", -[UIPresentationController presentedViewController](self, "presentedViewController"), -[UIPresentationController presentingViewController](self, "presentingViewController"));
  }
  else
  {
    return self;
  }
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 0;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend(a3, "styleForSearchPresentationController:", self);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UISearchPresentationController;
    return -[UIPresentationController _createVisualStyleForProvider:](&v6, sel__createVisualStyleForProvider_, a3);
  }
  return result;
}

- (UIView)searchBarContainerView
{
  return (UIView *)-[_UISearchPresentationAssistant searchBarContainerView](self->_assistant, "searchBarContainerView");
}

- (BOOL)shouldAccountForStatusBar
{
  return -[_UISearchPresentationAssistant shouldAccountForStatusBar](self->_assistant, "shouldAccountForStatusBar");
}

- (BOOL)resultsUnderlapsSearchBar
{
  return 1;
}

- (BOOL)searchBarCanContainScopeBar
{
  return 1;
}

- (BOOL)searchBarShouldClipToBounds
{
  return 1;
}

- (double)statusBarAdjustment
{
  double result;

  -[_UISearchPresentationAssistant statusBarAdjustment](self->_assistant, "statusBarAdjustment");
  return result;
}

- (BOOL)searchBarToBecomeTopAttached
{
  return -[_UISearchPresentationAssistant searchBarToBecomeTopAttached](self->_assistant, "searchBarToBecomeTopAttached");
}

- (double)resultsControllerContentOffset
{
  double result;

  -[_UISearchPresentationAssistant resultsControllerContentOffset](self->_assistant, "resultsControllerContentOffset");
  return result;
}

- (_UISearchControllerPresenting)adaptivePresentationController
{
  return -[_UISearchPresentationAssistant adaptivePresentationController](self->_assistant, "adaptivePresentationController");
}

- (BOOL)animatorShouldLayoutPresentationViews
{
  return 0;
}

- (BOOL)forceObeyNavigationBarInsets
{
  return 0;
}

- (unint64_t)edgeForHidingNavigationBar
{
  return 1;
}

- (CGRect)finalFrameForContainerView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_finalFrameForContainerView.origin.x;
  y = self->_finalFrameForContainerView.origin.y;
  width = self->_finalFrameForContainerView.size.width;
  height = self->_finalFrameForContainerView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
