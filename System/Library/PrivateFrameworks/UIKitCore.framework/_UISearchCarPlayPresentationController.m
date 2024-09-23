@implementation _UISearchCarPlayPresentationController

- (id)backgroundObscuringView
{
  UIVisualEffectView *blurView;
  UIVisualEffectView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;
  void *v11;
  void *v12;

  blurView = self->_blurView;
  if (!blurView)
  {
    v4 = [UIVisualEffectView alloc];
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_presentationBackgroundBlurEffectForTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", v8);
    v10 = self->_blurView;
    self->_blurView = v9;

    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[UIView setFrame:](self->_blurView, "setFrame:");

    -[UIView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 26);
    blurView = self->_blurView;
  }
  return blurView;
}

- (void)showBackgroundObscuringView
{
  -[UIView setAlpha:](self->_blurView, "setAlpha:", 1.0);
}

- (void)hideBackgroundObscuringView
{
  -[UIView setAlpha:](self->_blurView, "setAlpha:", 0.0);
}

- (int64_t)adaptivePresentationStyle
{
  return 4;
}

- (BOOL)shouldAccountForStatusBar
{
  return 0;
}

- (BOOL)resultsUnderlapsSearchBar
{
  return 0;
}

- (BOOL)searchBarCanContainScopeBar
{
  return 0;
}

- (BOOL)searchBarShouldClipToBounds
{
  return 0;
}

- (double)statusBarAdjustment
{
  return 0.0;
}

- (BOOL)searchBarToBecomeTopAttached
{
  return 0;
}

- (double)resultsControllerContentOffset
{
  return 0.0;
}

- (id)adaptivePresentationController
{
  return 0;
}

- (CGRect)finalFrameForContainerView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[UIPresentationController presentedView](self, "presentedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)animatorShouldLayoutPresentationViews
{
  return 1;
}

- (BOOL)forceObeyNavigationBarInsets
{
  return 1;
}

- (unint64_t)edgeForHidingNavigationBar
{
  return 0;
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UISearchCarPlayPresentationController blurView](self, "blurView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentationBackgroundBlurEffectForTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffect:", v6);

}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
