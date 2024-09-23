@implementation _UINavigationControllerRefreshControlHost

- (void)setUnobstructedHeight:(double)a3
{
  if (self->_unobstructedHeight != a3)
  {
    self->_unobstructedHeight = a3;
    -[_UINavigationControllerRefreshControlHost _notifyLayoutDidChange](self, "_notifyLayoutDidChange");
  }
}

+ (BOOL)canHostRefreshControlOwnedByScrollView:(id)a3 inNavigationController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  objc_msgSend(a4, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supportsRefreshControlHosting"))
  {
    objc_msgSend(v5, "refreshControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = objc_msgSend(v6, "_hasVariableHeight");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)restingHeightOfRefreshControl
{
  return self->_restingHeightOfRefreshControl;
}

- (double)fullHeightOfRefreshControl
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  objc_msgSend(WeakRetained, "_refreshControlHeight");
  v4 = v3;

  return v4;
}

- (void)_installRefreshControlIntoContainerView
{
  id WeakRetained;
  NSArray *v4;
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
  NSArray *refreshControlConstraints;
  id v17;
  id v18;

  -[_UINavigationControllerRefreshControlHost refreshControl](self, "refreshControl");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", 60.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v6);

    objc_msgSend(v18, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_hostContainerView, "centerYAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v9);

    objc_msgSend(v18, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_hostContainerView, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v12);

    objc_msgSend(v18, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_hostContainerView, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v15);

    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_hostContainerView, "addSubview:", v18);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v4);
    refreshControlConstraints = self->_refreshControlConstraints;
    self->_refreshControlConstraints = v4;

    v17 = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(v17, "_addScrollViewScrollObserver:", v18);

  }
}

- (UIView)hostContainerView
{
  return self->_hostContainerView;
}

- (BOOL)isHostingRefreshControlOwnedByScrollView:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UINavigationControllerRefreshControlHost scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[_UINavigationControllerRefreshControlHost refreshControl](self, "refreshControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == v8;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (UIRefreshControl)refreshControl
{
  return (UIRefreshControl *)objc_loadWeakRetained((id *)&self->_refreshControl);
}

- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding
{
  return 0;
}

- (void)setHostContainerView:(id)a3
{
  id WeakRetained;
  id v6;
  UIView *v7;
  id v8;
  UIView *v9;
  UIView *hostContainerView;
  UIView *v11;

  v11 = (UIView *)a3;
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
    objc_msgSend(WeakRetained, "_setHost:", self);

  }
  if (self->_hostContainerView != v11)
  {
    v6 = objc_loadWeakRetained((id *)&self->_refreshControl);
    objc_msgSend(v6, "superview");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (v7 != v11)
      -[_UINavigationControllerRefreshControlHost _removeRefreshControlFromContainerView](self, "_removeRefreshControlFromContainerView");
    objc_storeStrong((id *)&self->_hostContainerView, a3);
    v8 = objc_loadWeakRetained((id *)&self->_refreshControl);
    objc_msgSend(v8, "superview");
    v9 = (UIView *)objc_claimAutoreleasedReturnValue();
    hostContainerView = self->_hostContainerView;

    if (v9 != hostContainerView)
      -[_UINavigationControllerRefreshControlHost _installRefreshControlIntoContainerView](self, "_installRefreshControlIntoContainerView");
  }

}

- (_UINavigationControllerRefreshControlHost)initWithNavigationController:(id)a3 scrollView:(id)a4
{
  id v7;
  id v8;
  _UINavigationControllerRefreshControlHost *v9;
  _UINavigationControllerRefreshControlHost *v10;
  void *v11;
  id WeakRetained;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "canHostRefreshControlOwnedByScrollView:inNavigationController:", v8, v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationControllerRefreshControlHost.m"), 26, CFSTR("invalid parameters"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationControllerRefreshControlHost;
  v9 = -[_UINavigationControllerRefreshControlHost init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_navigationController, v7);
    objc_storeWeak((id *)&v10->_scrollView, v8);
    objc_msgSend(v8, "refreshControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_refreshControl, v11);

    WeakRetained = objc_loadWeakRetained((id *)&v10->_refreshControl);
    objc_msgSend(WeakRetained, "_setHost:", v10);

    v10->_unobstructedHeight = 0.0;
  }

  return v10;
}

- (void)_removeRefreshControlFromContainerView
{
  void *v3;
  id WeakRetained;
  NSArray *refreshControlConstraints;
  id v6;

  -[_UINavigationControllerRefreshControlHost refreshControl](self, "refreshControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "removeFromSuperview");
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "_removeScrollViewScrollObserver:", v6);

    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_refreshControlConstraints);
    refreshControlConstraints = self->_refreshControlConstraints;
    self->_refreshControlConstraints = 0;

    v3 = v6;
  }

}

- (void)setRestingHeightOfRefreshControl:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (self->_restingHeightOfRefreshControl != v3)
  {
    self->_restingHeightOfRefreshControl = v3;
    -[_UINavigationControllerRefreshControlHost _notifyLayoutDidChange](self, "_notifyLayoutDidChange");
  }
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  UIRefreshControl **p_refreshControl;
  id v15;
  id v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UINavigationControllerRefreshControlHost;
  -[_UINavigationControllerRefreshControlHost description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" delegate=%p"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  v8 = objc_loadWeakRetained((id *)&self->_navigationController);

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" navigationController=%p"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v10;
  }
  v11 = objc_loadWeakRetained((id *)&self->_scrollView);

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" scrollView=%p"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  p_refreshControl = &self->_refreshControl;
  v15 = objc_loadWeakRetained((id *)p_refreshControl);

  if (!v15)
    return (NSString *)v3;
  v16 = objc_loadWeakRetained((id *)p_refreshControl);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" refreshControl=%p"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (void)stopAnimations
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59___UINavigationControllerRefreshControlHost_stopAnimations__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_hostContainerView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationControllerRefreshControlHost;
  -[_UINavigationControllerRefreshControlHost dealloc](&v3, sel_dealloc);
}

- (void)incrementInsetHeight:(double)a3
{
  double v5;

  -[_UINavigationControllerRefreshControlHost restingHeightOfRefreshControl](self, "restingHeightOfRefreshControl");
  -[_UINavigationControllerRefreshControlHost setRestingHeightOfRefreshControl:](self, "setRestingHeightOfRefreshControl:", v5 + a3);
}

- (void)decrementInsetHeight:(double)a3
{
  double v5;

  -[_UINavigationControllerRefreshControlHost restingHeightOfRefreshControl](self, "restingHeightOfRefreshControl");
  -[_UINavigationControllerRefreshControlHost setRestingHeightOfRefreshControl:](self, "setRestingHeightOfRefreshControl:", v5 - a3);
}

- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5
{
  void *v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _UINavigationControllerRefreshControlHost *v13;

  -[_UINavigationControllerRefreshControlHost _notifyLayoutDidChange](self, "_notifyLayoutDidChange", a3, a4, a5);
  if (a4 == 4)
  {
    -[_UINavigationControllerRefreshControlHost scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_contentOffsetAnimationDuration");
    v9 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87___UINavigationControllerRefreshControlHost_refreshControl_didChangeToState_fromState___block_invoke;
    v11[3] = &unk_1E16B1B50;
    v12 = v7;
    v13 = self;
    v10 = v7;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v9);

  }
}

- (void)_notifyLayoutDidChange
{
  void *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  _UINavigationControllerRefreshControlHost *v7;

  -[_UINavigationControllerRefreshControlHost _updateFadeOutProgress](self, "_updateFadeOutProgress");
  -[_UINavigationControllerRefreshControlHost delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67___UINavigationControllerRefreshControlHost__notifyLayoutDidChange__block_invoke;
    v5[3] = &unk_1E16B1B50;
    v6 = v3;
    v7 = self;
    objc_msgSend(WeakRetained, "_performWhileIgnoringUpdateTopViewFramesToMatchScrollOffset:", v5);

  }
}

- (void)_updateFadeOutProgress
{
  id WeakRetained;
  unint64_t v4;
  double v5;
  double v6;
  double v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  v4 = objc_msgSend(WeakRetained, "refreshControlState");

  if (v4 > 6)
  {
    v5 = 0.0;
  }
  else if (((1 << v4) & 0x47) != 0)
  {
    v5 = 1.0;
  }
  else
  {
    if (((1 << v4) & 0x28) != 0)
      -[_UINavigationControllerRefreshControlHost _alphaForRefreshingControlStateWithPossiblyObstructedContent](self, "_alphaForRefreshingControlStateWithPossiblyObstructedContent");
    else
      -[UIView alpha](self->_hostContainerView, "alpha");
    v5 = v6;
  }
  -[UIView alpha](self->_hostContainerView, "alpha");
  if (v5 != v7)
    -[UIView setAlpha:](self->_hostContainerView, "setAlpha:", v5);
}

- (double)_thresholdForObstructedContentFullAlpha
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  objc_msgSend(WeakRetained, "_refreshControlHeight");
  v4 = v3 + -2.0;

  return v4;
}

- (double)_thresholdForObstructedContentZeroAlpha
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_refreshControl);
  objc_msgSend(WeakRetained, "_refreshControlHeight");
  v4 = v3 * 0.5;

  return v4;
}

- (double)_alphaForRefreshingControlStateWithPossiblyObstructedContent
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[_UINavigationControllerRefreshControlHost _thresholdForObstructedContentFullAlpha](self, "_thresholdForObstructedContentFullAlpha");
  v4 = v3;
  -[_UINavigationControllerRefreshControlHost _thresholdForObstructedContentZeroAlpha](self, "_thresholdForObstructedContentZeroAlpha");
  v6 = (self->_unobstructedHeight - v5) / (v4 - v5);
  if (v6 > 1.0)
    v6 = 1.0;
  return fmax(v6, 0.0);
}

- (_UINavigationControllerRefreshControlHostDelegate)delegate
{
  return (_UINavigationControllerRefreshControlHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (double)unobstructedHeight
{
  return self->_unobstructedHeight;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeWeak((id *)&self->_refreshControl, a3);
}

- (NSArray)refreshControlConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRefreshControlConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControlConstraints, 0);
  objc_destroyWeak((id *)&self->_refreshControl);
  objc_storeStrong((id *)&self->_hostContainerView, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
