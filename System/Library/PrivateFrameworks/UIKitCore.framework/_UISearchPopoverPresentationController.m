@implementation _UISearchPopoverPresentationController

- (_UISearchPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  _UISearchPopoverPresentationController *v9;
  _UISearchPresentationAssistant *v10;
  _UISearchPresentationAssistant *assistant;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchPopoverPresentationController.m"), 35, CFSTR("_UISearchPopoverPresentationController must present a UISearchController"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UISearchPopoverPresentationController;
  v9 = -[UIPopoverPresentationController initWithPresentedViewController:presentingViewController:](&v14, sel_initWithPresentedViewController_presentingViewController_, v7, v8);
  if (v9)
  {
    v10 = -[_UISearchPresentationAssistant initWithSearchPresentationController:]([_UISearchPresentationAssistant alloc], "initWithSearchPresentationController:", v9);
    assistant = v9->_assistant;
    v9->_assistant = v10;

  }
  return v9;
}

- (id)_popoverHostingWindow
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[UIPresentationController sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[UIPresentationController sourceView](self, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v5, "window");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  if (!v6)
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchPopoverPresentationController;
  -[UIPopoverPresentationController presentationTransitionWillBegin](&v4, sel_presentationTransitionWillBegin);
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchPopoverPresentationController setContentVisible:](self, "setContentVisible:", objc_msgSend(v3, "_showsSearchResultsController"));

}

- (void)_transitionToWillBegin
{
  -[_UISearchPresentationAssistant setAdaptivePresentationController:](self->_assistant, "setAdaptivePresentationController:", 0);
  -[_UISearchPopoverPresentationController presentationTransitionWillBegin](self, "presentationTransitionWillBegin");
}

- (void)_transitionToDidEnd
{
  -[UIPopoverPresentationController presentationTransitionDidEnd:](self, "presentationTransitionDidEnd:", 1);
}

- (void)_transitionFromDidEnd
{
  -[UIPopoverPresentationController dismissalTransitionDidEnd:](self, "dismissalTransitionDidEnd:", 1);
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  _UISearchPopoverPresentationController *v4;
  _UISearchPresentationController *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = self;
  if (objc_msgSend(a3, "horizontalSizeClass") == 1)
  {
    v5 = [_UISearchPresentationController alloc];
    -[UIPresentationController presentedViewController](v4, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](v4, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UISearchPresentationController initWithPresentedViewController:presentingViewController:](v5, "initWithPresentedViewController:presentingViewController:", v6, v7);

    v4 = (_UISearchPopoverPresentationController *)v8;
  }
  return v4;
}

- (BOOL)_forcePresentationInPresenterScene
{
  return 1;
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
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[UIPopoverPresentationController presentedView](self, "presentedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistant, 0);
}

@end
