@implementation _UISearchFormSheetPresentationController

- (_UISearchFormSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UISearchFormSheetPresentationController *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchFormSheetPresentationController.m"), 37, CFSTR("_UISearchFormSheetPresentationController must present a UISearchController"));
  v10.receiver = self;
  v10.super_class = (Class)_UISearchFormSheetPresentationController;
  v8 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v10, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v8)
  {
    v8->_assistant = -[_UISearchPresentationAssistant initWithSearchPresentationController:]([_UISearchPresentationAssistant alloc], "initWithSearchPresentationController:", v8);
    v11[0] = 0x1E1A994F8;
    -[UIPresentationController _registerForTraitTokenChanges:withTarget:action:](v8, "_registerForTraitTokenChanges:withTarget:action:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), v8, sel__horizontalSizeClassChanged);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_assistant = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchFormSheetPresentationController;
  -[UIPresentationController dealloc](&v3, sel_dealloc);
}

- (void)presentationTransitionWillBegin
{
  id v3;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  -[_UISearchPresentationAssistant setPresentationWasAnimated:](self->_assistant, "setPresentationWasAnimated:", objc_msgSend(v3, "isAnimated"));
  -[_UISearchPresentationAssistant ensureAppropriatelySizedSearchBar:](self->_assistant, "ensureAppropriatelySizedSearchBar:", -[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar"));
  v4 = -[_UISearchFormSheetPresentationController searchBarContainerView](self, "searchBarContainerView");
  if (-[_UISearchFormSheetPresentationController searchBarToBecomeTopAttached](self, "searchBarToBecomeTopAttached"))
  {
    -[UIView frame](v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[_UISearchFormSheetPresentationController statusBarAdjustment](self, "statusBarAdjustment");
    -[UIView setFrame:](v4, "setFrame:", v6, v8, v10, v13 + v12);
  }
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))
  {
    -[UIView addSubview:](-[UIPresentationController containerView](self, "containerView"), "addSubview:", -[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"));
    if (objc_msgSend(v3, "isAnimated"))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke;
      v21[3] = &unk_1E16DEA00;
      v21[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v21, 0);
    }
    else
    {
      objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 1);
    }
  }
  v14 = [UIView alloc];
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  self->_wrapperView = -[UIView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], v16, v17, v18);
  -[UIView setFrame:](-[UIViewController view](-[UIPresentationController presentedViewController](self, "presentedViewController"), "view"), "setFrame:", v15, v16, v17, v18);
  -[UIView setAutoresizingMask:](-[UIViewController view](-[UIPresentationController presentedViewController](self, "presentedViewController"), "view"), "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_wrapperView, "addSubview:", -[UIViewController view](-[UIPresentationController presentedViewController](self, "presentedViewController"), "view"));
  -[_UISearchFormSheetPresentationController _presentedView:enableFormSheetAccoutrements:](self, "_presentedView:enableFormSheetAccoutrements:", self->_wrapperView, 1);
  if (objc_msgSend(v3, "isAnimated"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75___UISearchFormSheetPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v20[3] = &unk_1E16DEA00;
    v20[4] = self;
    objc_msgSend(v3, "animateAlongsideTransition:completion:", v20, 0);
  }
  else
  {
    -[UIView _beginOcclusion:](-[UIViewController view](-[UIPresentationController presentingViewController](self, "presentingViewController"), "view"), "_beginOcclusion:", self);
  }
  -[_UISearchFormSheetPresentationController setContentVisible:](self, "setContentVisible:", -[UIViewController _showsSearchResultsController](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_showsSearchResultsController"));
  if (-[_UISearchFormSheetPresentationController _shouldSubscribeToKeyboardNotifications](self, "_shouldSubscribeToKeyboardNotifications"))
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v19, "addObserver:selector:name:object:", -[UIPresentationController presentedViewController](self, "presentedViewController"), sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", -[UIPresentationController presentedViewController](self, "presentedViewController"), sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "removeFromSuperview");
    -[UIView _endOcclusion:](-[UIViewController view](-[UIPresentationController presentingViewController](self, "presentingViewController"), "view"), "_endOcclusion:", self);
  }
}

- (void)dismissalTransitionWillBegin
{
  id v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = -[UIViewController transitionCoordinator](-[UIPresentationController presentingViewController](self, "presentingViewController"), "transitionCoordinator");
  if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))
  {
    if (objc_msgSend(v3, "isAnimated"))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke;
      v5[3] = &unk_1E16DEA00;
      v5[4] = self;
      objc_msgSend(v3, "animateAlongsideTransition:completion:", v5, 0);
    }
    else
    {
      objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "display:", 0);
    }
  }
  if (objc_msgSend(v3, "isAnimated"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72___UISearchFormSheetPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v4[3] = &unk_1E16DEA00;
    v4[4] = self;
    objc_msgSend(v3, "animateAlongsideTransition:completion:", v4, 0);
  }
  else
  {
    -[UIView _endOcclusion:](-[UIViewController view](-[UIPresentationController presentingViewController](self, "presentingViewController"), "view"), "_endOcclusion:", self);
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    if (-[UIViewController obscuresBackgroundDuringPresentation](-[UIPresentationController presentedViewController](self, "presentedViewController"), "obscuresBackgroundDuringPresentation"))objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "removeFromSuperview");
    -[UIView removeFromSuperview](-[_UISearchFormSheetPresentationController searchBarContainerView](self, "searchBarContainerView"), "removeFromSuperview");
    if (-[_UISearchFormSheetPresentationController _shouldSubscribeToKeyboardNotifications](self, "_shouldSubscribeToKeyboardNotifications"))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v4, "removeObserver:name:object:", -[UIPresentationController presentingViewController](self, "presentingViewController"), CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
      objc_msgSend(v4, "removeObserver:name:object:", -[UIPresentationController presentingViewController](self, "presentingViewController"), CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
    }

    self->_wrapperView = 0;
    -[_UISearchFormSheetPresentationController _presentedView:enableFormSheetAccoutrements:](self, "_presentedView:enableFormSheetAccoutrements:", -[UIViewController view](-[UIPresentationController presentedViewController](self, "presentedViewController"), "view"), 0);
  }
}

- (id)presentedView
{
  return self->_wrapperView;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  UIView *v3;
  UIView *v4;
  double v5;
  double v6;
  CGFloat Width;
  UIView *v8;
  UIView *v9;
  double MaxY;
  UIView *v11;
  UIView *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  v3 = (UIView *)-[UIViewController searchBar](-[UIPresentationController presentedViewController](self, "presentedViewController"), "searchBar");
  v4 = -[UIPresentationController containerView](self, "containerView");
  objc_msgSend((id)-[UIView searchField](v3, "searchField"), "frame");
  v6 = v5;
  objc_msgSend((id)-[UIView searchField](v3, "searchField"), "frame");
  Width = CGRectGetWidth(v20);
  if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_barPresentationStyle") == 3)
  {
    v8 = -[_UISearchFormSheetPresentationController searchBarContainerView](self, "searchBarContainerView");
    v3 = v8;
    goto LABEL_3;
  }
  MaxY = 0.0;
  if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_barPresentationStyle") == 2)
  {
    objc_opt_class();
    if (v3)
    {
      v11 = v3;
      while ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = -[UIView superview](v11, "superview");
        if (!v11)
        {
          objc_opt_class();
          v11 = v3;
          while ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = -[UIView superview](v11, "superview");
            if (!v11)
            {
              objc_opt_class();
              v12 = v3;
              while ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v12 = -[UIView superview](v12, "superview");
                if (!v12)
                  goto LABEL_19;
              }
              -[UIView bounds](v12, "bounds");
              -[UIView convertRect:toView:](v12, "convertRect:toView:", v4);
              MaxY = CGRectGetMaxY(v22);
              if (-[UIViewController _hidesNavigationBarDuringPresentationRespectingInlineSearch](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
              {
                objc_msgSend((id)objc_msgSend((id)-[UIView navController](v12, "navController"), "navigationBar"), "frame");
                MaxY = MaxY - CGRectGetHeight(v23);
              }
              goto LABEL_22;
            }
          }
          break;
        }
      }
      -[UIView bounds](v11, "bounds");
      v9 = v11;
      goto LABEL_4;
    }
    objc_opt_class();
    objc_opt_class();
LABEL_19:
    v8 = v3;
LABEL_3:
    -[UIView bounds](v8, "bounds");
    v9 = v3;
LABEL_4:
    -[UIView convertRect:toView:](v9, "convertRect:toView:", v4);
    MaxY = CGRectGetMaxY(v21);
  }
LABEL_22:
  -[UIView bounds](-[UIView window](v4, "window"), "bounds");
  v13 = CGRectGetHeight(v24) - MaxY + -25.0;
  if (-[UIViewController _shouldRespectPreferredContentSize](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_shouldRespectPreferredContentSize"))
  {
    -[UIViewController preferredContentSize](-[UIPresentationController presentedViewController](self, "presentedViewController"), "preferredContentSize");
    if (v14 != 0.0 && v14 <= v13)
      v13 = v14;
  }
  v16 = MaxY + 1.0;
  v17 = v6;
  v18 = Width;
  v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISearchFormSheetPresentationController;
  -[UIPresentationController containerViewWillLayoutSubviews](&v7, sel_containerViewWillLayoutSubviews);
  -[_UISearchFormSheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  objc_msgSend(-[_UISearchFormSheetPresentationController presentedView](self, "presentedView"), "setFrame:", v3, v4, v5, v6);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _QWORD v4[5];

  -[UIView setNeedsLayout](-[UIPresentationController containerView](self, "containerView", a3), "setNeedsLayout");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98___UISearchFormSheetPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v4[3] = &unk_1E16B41B8;
  v4[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, 0, 0.4);
}

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView bounds](self->_wrapperView, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 0;
}

- (BOOL)_shouldSubscribeToKeyboardNotifications
{
  return 1;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (void)_presentedView:(id)a3 enableFormSheetAccoutrements:(BOOL)a4
{
  _BOOL8 v4;
  double v6;

  v4 = a4;
  if (a4)
    v6 = 5.0;
  else
    v6 = 0.0;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "setCornerRadius:", v6);
  objc_msgSend(a3, "setClipsToBounds:", v4);
}

- (void)_horizontalSizeClassChanged
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (-[UIPresentationController containerView](self, "containerView"))
  {
    if (-[UITraitCollection horizontalSizeClass](-[UIPresentationController traitCollection](self, "traitCollection"), "horizontalSizeClass") == UIUserInterfaceSizeClassRegular)
    {
      -[_UISearchFormSheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
      objc_msgSend(-[_UISearchFormSheetPresentationController presentedView](self, "presentedView"), "setFrame:", v3, v4, v5, v6);
    }
  }
}

- (void)_transitionToWillBegin
{
  -[_UISearchPresentationAssistant setAdaptivePresentationController:](self->_assistant, "setAdaptivePresentationController:", 0);
  -[_UISearchFormSheetPresentationController presentationTransitionWillBegin](self, "presentationTransitionWillBegin");
}

- (void)_transitionToDidEnd
{
  -[_UISearchFormSheetPresentationController presentationTransitionDidEnd:](self, "presentationTransitionDidEnd:", 1);
}

- (void)_transitionFromDidEnd
{
  -[_UISearchFormSheetPresentationController dismissalTransitionDidEnd:](self, "dismissalTransitionDidEnd:", 1);
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UISearchFormSheetPresentationController;
  -[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:](&v15, sel__transitionToPresentationController_withTransitionCoordinator_, a3, a4);
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
        v14 = v13 - v7;
        objc_msgSend(v10, "setContentInset:", v7, 0.0, 0.0, 0.0);
        objc_msgSend(v10, "setContentOffset:", v12, v14);
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
  _UISearchPresentationController *v4;

  if (objc_msgSend(a3, "horizontalSizeClass") == 1)
  {
    v4 = -[_UISearchPresentationController initWithPresentedViewController:presentingViewController:]([_UISearchPresentationController alloc], "initWithPresentedViewController:presentingViewController:", -[UIPresentationController presentedViewController](self, "presentedViewController"), -[UIPresentationController presentingViewController](self, "presentingViewController"));
    -[_UISearchPresentationAssistant setAdaptivePresentationController:](self->_assistant, "setAdaptivePresentationController:", v4);
    return v4;
  }
  return self;
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

- (void)setContentVisible:(BOOL)a3
{
  _BOOL8 v4;

  v4 = !a3;
  objc_msgSend(-[_UISearchPresentationAssistant dimmingView](self->_assistant, "dimmingView"), "setHidden:", v4);
  objc_msgSend(-[_UISearchFormSheetPresentationController presentedView](self, "presentedView"), "setHidden:", v4);
}

- (BOOL)searchBarToBecomeTopAttached
{
  return -[_UISearchPresentationAssistant searchBarToBecomeTopAttached](self->_assistant, "searchBarToBecomeTopAttached");
}

- (double)resultsControllerContentOffset
{
  double result;

  if (-[UIViewController _barPresentationStyle](-[UIPresentationController presentedViewController](self, "presentedViewController"), "_barPresentationStyle") == 3)return 0.0;
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

  x = self->finalFrameForContainerView.origin.x;
  y = self->finalFrameForContainerView.origin.y;
  width = self->finalFrameForContainerView.size.width;
  height = self->finalFrameForContainerView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
