@implementation NCClickInteractionPresenter

- (NCClickInteractionPresenter)initWithTitle:(id)a3 sourceView:(id)a4 materialRecipe:(int64_t)a5
{
  id v8;
  id v9;
  NCClickInteractionPresenter *v10;
  NCClickInteractionPresenter *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _UIClickInteraction *v16;
  _UIClickInteraction *clickInteraction;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCClickInteractionPresenter;
  v10 = -[NCClickInteractionPresenter init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sourceView, v9);
    objc_msgSend(v9, "bounds");
    v11->_sourceViewVisibleRect.origin.x = v12;
    v11->_sourceViewVisibleRect.origin.y = v13;
    v11->_sourceViewVisibleRect.size.width = v14;
    v11->_sourceViewVisibleRect.size.height = v15;
    v16 = (_UIClickInteraction *)objc_alloc_init(MEMORY[0x1E0DC4078]);
    clickInteraction = v11->_clickInteraction;
    v11->_clickInteraction = v16;

    -[_UIClickInteraction setDelegate:](v11->_clickInteraction, "setDelegate:", v11);
    objc_msgSend(v9, "addInteraction:", v11->_clickInteraction);
    v11->_materialRecipe = a5;
    -[NCClickInteractionPresenter _configurePresentedControlIfNecessaryWithTitle:](v11, "_configurePresentedControlIfNecessaryWithTitle:", v8);
  }

  return v11;
}

- (void)setTitle:(id)a3
{
  -[NCClickInteractionPresentedControl _setTitle:](self->_presentedControl, "_setTitle:", a3);
}

- (NSString)title
{
  return -[NCClickInteractionPresentedControl _title](self->_presentedControl, "_title");
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  if (self->_overrideUserInterfaceStyle != a3)
  {
    self->_overrideUserInterfaceStyle = a3;
    -[NCClickInteractionPresentedControl _setOverrideUserInterfaceStyle:](self->_presentedControl, "_setOverrideUserInterfaceStyle:");
  }
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  -[NCClickInteractionPresentedControl addTarget:action:forControlEvents:](self->_presentedControl, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  if (self->_presented)
  {
    -[NCClickInteractionPresenter _performCancel](self, "_performCancel");
  }
  else
  {
    if (!self->_hinting)
      return 0;
    -[_UIClickInteraction cancelInteraction](self->_clickInteraction, "cancelInteraction");
  }
  return 1;
}

- (void)presentModalFullScreen
{
  -[NCClickInteractionPresenter _setUpPresentationIfNecessary](self, "_setUpPresentationIfNecessary");
  -[NCClickInteractionPresenter _performPresentation](self, "_performPresentation");
}

- (void)contentSizeCategoryDidChange
{
  -[NCClickInteractionPresentedControl adjustForContentSizeCategoryChange](self->_presentedControl, "adjustForContentSizeCategoryChange");
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  UIView **p_sourceView;
  id v5;
  id WeakRetained;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPoint v12;

  p_sourceView = &self->_sourceView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sourceView);
  objc_msgSend(v5, "locationInCoordinateSpace:", WeakRetained);
  v8 = v7;
  v10 = v9;

  v12.x = v8;
  v12.y = v10;
  LODWORD(v5) = CGRectContainsPoint(self->_sourceViewVisibleRect, v12);

  if ((_DWORD)v5)
    -[NCClickInteractionPresenter _setUpPresentationIfNecessary](self, "_setUpPresentationIfNecessary");
  return self->_hinting;
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC42B8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__NCClickInteractionPresenter_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E8D1EFF0;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v5, "initWithProgressBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __66__NCClickInteractionPresenter_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGFloat v21;
  CGFloat rect;
  CGFloat v23;
  CGFloat v24;
  double tx;
  CGFloat v26;
  CGFloat v27;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "progress");
  v6 = v5;

  v27 = v6 * -0.25 / 1.5 + 1.0;
  objc_msgSend(WeakRetained, "_portalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v23 = v10;
  v24 = v8;
  v11 = v10;
  v13 = v12;
  rect = v12;
  v26 = v14;
  objc_msgSend(WeakRetained, "sourceViewVisibleRect");
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  memset(&v32, 0, sizeof(v32));
  MidX = CGRectGetMidX(v33);
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v26;
  tx = (1.0 - v27) * (MidX - CGRectGetMidX(v34));
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidY = CGRectGetMidY(v35);
  v36.origin.y = v23;
  v36.origin.x = v24;
  v36.size.width = rect;
  v36.size.height = v26;
  v21 = CGRectGetMidY(v36);
  CGAffineTransformMakeTranslation(&v32, tx, (1.0 - v27) * (MidY - v21));
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v27, v27);
  t1 = v32;
  memset(&v30, 0, sizeof(v30));
  t2 = v31;
  CGAffineTransformConcat(&v30, &t1, &t2);
  t1 = v30;
  objc_msgSend(v7, "setTransform:", &t1);

}

- (void)clickInteractionDidEnd:(id)a3
{
  UIView *portalView;

  -[UIView removeFromSuperview](self->_portalView, "removeFromSuperview", a3);
  portalView = self->_portalView;
  self->_portalView = 0;

  if (self->_hinting)
    -[NCClickInteractionPresenter _performCancel](self, "_performCancel");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  NCClickInteractionPresentedControl *presentedControl;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchEater);

  if (WeakRetained == v7)
  {
    presentedControl = self->_presentedControl;
    objc_msgSend(v6, "locationInView:", presentedControl);
    v9 = -[NCClickInteractionPresentedControl pointInside:withEvent:](presentedControl, "pointInside:withEvent:", 0) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)_setUpPresentationIfNecessary
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "clickInteractionPresenterShouldBegin:", self))
  {
    -[NCClickInteractionPresenter _setUpSubviews](self, "_setUpSubviews");
    -[NCClickInteractionPresentedControl setUserInteractionEnabled:](self->_presentedControl, "setUserInteractionEnabled:", 1);
    self->_hinting = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "clickInteractionPresenterDidBeginInteraction:", self);
  }

}

- (void)_configureContainerViewIfNecessary
{
  UIView *v3;
  UIView *containerView;
  void *v5;
  NCTouchEaterGestureRecognizer *obj;

  if (!self->_containerView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = self->_containerView;
    self->_containerView = v3;

    -[UIView setAutoresizesSubviews:](self->_containerView, "setAutoresizesSubviews:", 1);
    -[UIView setAutoresizingMask:](self->_containerView, "setAutoresizingMask:", 18);
    -[UIView layer](self->_containerView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    obj = -[NCTouchEaterGestureRecognizer initWithTarget:action:]([NCTouchEaterGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleEatenTouch_);
    -[UIView addGestureRecognizer:](self->_containerView, "addGestureRecognizer:", obj);
    -[NCTouchEaterGestureRecognizer setDelegate:](obj, "setDelegate:", self);
    objc_storeWeak((id *)&self->_touchEater, obj);

  }
}

- (void)_setUpContainerView
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  UIView *containerView;
  void *v8;
  id v9;

  -[NCClickInteractionPresenter _configureContainerViewIfNecessary](self, "_configureContainerViewIfNecessary");
  -[UIView superview](self->_containerView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(WeakRetained, "containerViewForClickInteractionPresenter:", self),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = objc_loadWeakRetained((id *)&self->_sourceView);
      objc_msgSend(v6, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "addSubview:", self->_containerView);

  }
  containerView = self->_containerView;
  -[UIView superview](containerView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[UIView setFrame:](containerView, "setFrame:");

  v9 = objc_loadWeakRetained((id *)&self->_touchEater);
  objc_msgSend(v9, "setEnabled:", 1);

}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v5;

  if (!self->_backgroundMaterialView)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 6, 0, 0.0);
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
    -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:](self->_backgroundMaterialView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", 1);
    v5 = self->_backgroundMaterialView;
    -[UIView bounds](self->_containerView, "bounds");
    -[MTMaterialView setFrame:](v5, "setFrame:");
  }
}

- (void)_setUpBackgroundMaterialView
{
  -[NCClickInteractionPresenter _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  -[UIView insertSubview:atIndex:](self->_containerView, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
  -[MTMaterialView setWeighting:](self->_backgroundMaterialView, "setWeighting:", 0.0);
  -[MTMaterialView setHidden:](self->_backgroundMaterialView, "setHidden:", 1);
}

- (void)_configurePortalViewIfNecessary
{
  NCClickInteractionPortalView *v3;
  id WeakRetained;
  UIView *v5;
  UIView *portalView;

  if (!self->_portalView)
  {
    v3 = [NCClickInteractionPortalView alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    v5 = -[NCClickInteractionPortalView initWithSourceView:](v3, "initWithSourceView:", WeakRetained);
    portalView = self->_portalView;
    self->_portalView = v5;

    -[NCClickInteractionPresenter _configureContainerViewIfNecessary](self, "_configureContainerViewIfNecessary");
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_portalView);
  }
}

- (void)_setUpPortalView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *containerView;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id WeakRetained;

  -[NCClickInteractionPresenter _configurePortalViewIfNecessary](self, "_configurePortalViewIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  objc_msgSend(WeakRetained, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  containerView = self->_containerView;
  objc_msgSend(WeakRetained, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", 0, v4, v6, v8, v10);
  -[UIView convertRect:fromView:](containerView, "convertRect:fromView:", 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIView setFrame:](self->_portalView, "setFrame:", v14, v16, v18, v20);
}

- (void)_configurePresentedControlIfNecessaryWithTitle:(id)a3
{
  id v4;
  NCClickInteractionPresentedControl *v5;
  NCClickInteractionPresentedControl *presentedControl;
  uint64_t v7;
  id WeakRetained;

  if (!self->_presentedControl)
  {
    v4 = a3;
    v5 = -[NCClickInteractionPresentedControl initWithTitle:materialRecipe:]([NCClickInteractionPresentedControl alloc], "initWithTitle:materialRecipe:", v4, self->_materialRecipe);

    presentedControl = self->_presentedControl;
    self->_presentedControl = v5;

    -[NCClickInteractionPresentedControl _setOverrideUserInterfaceStyle:](self->_presentedControl, "_setOverrideUserInterfaceStyle:", -[NCClickInteractionPresenter overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(WeakRetained, "adjustsFontForContentSizeCategory");
    else
      v7 = 0;
    -[NCClickInteractionPresentedControl setAdjustsFontForContentSizeCategory:](self->_presentedControl, "setAdjustsFontForContentSizeCategory:", v7);

  }
}

- (void)_setUpPresentedControl
{
  NCClickInteractionPresentedControl *presentedControl;
  NCClickInteractionPresentedControl *v4;
  void *v5;
  NCClickInteractionPresentedControl *v6;
  _QWORD v7[5];
  NCClickInteractionPresentedControl *v8;

  presentedControl = self->_presentedControl;
  if (presentedControl)
  {
    v4 = presentedControl;
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__NCClickInteractionPresenter__setUpPresentedControl__block_invoke;
    v7[3] = &unk_1E8D1B3A0;
    v7[4] = self;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v7);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_presentedControl);

  }
}

uint64_t __53__NCClickInteractionPresenter__setUpPresentedControl__block_invoke(uint64_t a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v11;

  objc_msgSend(*(id *)(a1 + 32), "_initialPresentedViewFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");
  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  objc_msgSend(*(id *)(a1 + 40), "_setCornerRadius:", CGRectGetHeight(v11) * 0.5);
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

- (void)_setUpSubviews
{
  -[NCClickInteractionPresenter _setUpContainerView](self, "_setUpContainerView");
  -[NCClickInteractionPresenter _setUpPortalView](self, "_setUpPortalView");
  -[NCClickInteractionPresenter _setUpBackgroundMaterialView](self, "_setUpBackgroundMaterialView");
  -[NCClickInteractionPresenter _setUpPresentedControl](self, "_setUpPresentedControl");
}

- (CGRect)_initialPresentedViewFrame
{
  id WeakRetained;
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
  CGRect result;

  -[NCClickInteractionPresenter _setUpContainerView](self, "_setUpContainerView");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  objc_msgSend(WeakRetained, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "convertRect:toView:", v4, self->_sourceViewVisibleRect.origin.x, self->_sourceViewVisibleRect.origin.y, self->_sourceViewVisibleRect.size.width, self->_sourceViewVisibleRect.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(WeakRetained, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", self->_containerView, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_finalPresentedViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  -[NCClickInteractionPresenter _configureContainerViewIfNecessary](self, "_configureContainerViewIfNecessary");
  -[NCClickInteractionPresenter _initialPresentedViewFrame](self, "_initialPresentedViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self->_containerView, "bounds");
  v32 = CGRectInset(v31, 8.0, 8.0);
  y = v32.origin.y;
  x = v32.origin.x;
  height = v32.size.height;
  width = v32.size.width;
  -[NCClickInteractionPresentedControl sizeThatFits:](self->_presentedControl, "sizeThatFits:", v32.size.width, v32.size.height);
  BSRectWithSize();
  v11 = v6;
  v12 = v8;
  v13 = v10;
  UIRectCenteredYInRect();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if ((-[UIView _shouldReverseLayoutDirection](self->_containerView, "_shouldReverseLayoutDirection") & 1) == 0)
  {
    v33.origin.x = v4;
    v33.origin.y = v11;
    v33.size.width = v12;
    v33.size.height = v13;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = v15;
    v34.origin.y = v17;
    v34.size.width = v19;
    v34.size.height = v21;
    v15 = MaxX - CGRectGetWidth(v34);
  }
  NCRectConfinedToRect(v15, v17, v19, v21, x, y, width, height);
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)_tensionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4
{
  double result;

  result = 500.0;
  if (a4)
    return 2000.0;
  return result;
}

- (double)_frictionForTransitionPresentation:(BOOL)a3 cancelled:(BOOL)a4
{
  double v4;
  double result;

  if (a4)
  {
    -[NCClickInteractionPresenter _tensionForTransitionPresentation:cancelled:](self, "_tensionForTransitionPresentation:cancelled:", a3, 1);
    return NCFrictionForCriticallyDampedSpringWithTension(v4);
  }
  else
  {
    result = 18.0;
    if (a3)
      return 26.0;
  }
  return result;
}

- (void)_animatePresentation:(BOOL)a3 cancelled:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BOOL v27;
  _QWORD v28[4];
  id v29[5];
  BOOL v30;
  id location;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (v6)
    -[NCClickInteractionPresenter _finalPresentedViewFrame](self, "_finalPresentedViewFrame");
  else
    -[NCClickInteractionPresenter _initialPresentedViewFrame](self, "_initialPresentedViewFrame");
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_initWeak(&location, self);
  v17 = (void *)MEMORY[0x1E0DC3F10];
  -[NCClickInteractionPresenter _tensionForTransitionPresentation:cancelled:](self, "_tensionForTransitionPresentation:cancelled:", v6, v5);
  v19 = v18;
  -[NCClickInteractionPresenter _frictionForTransitionPresentation:cancelled:](self, "_frictionForTransitionPresentation:cancelled:", v6, v5);
  v21 = v20;
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke;
  v28[3] = &unk_1E8D1F018;
  objc_copyWeak(v29, &location);
  v30 = v6;
  v29[1] = v13;
  v29[2] = v14;
  v29[3] = v15;
  v29[4] = v16;
  v24[0] = v22;
  v24[1] = 3221225472;
  v24[2] = __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke_2;
  v24[3] = &unk_1E8D1F040;
  v27 = v6;
  objc_copyWeak(&v26, &location);
  v23 = v8;
  v25 = v23;
  objc_msgSend(v17, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", v5 ^ 1, v28, v24, v19, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

void __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_backgroundMaterialView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

  objc_msgSend(WeakRetained, "_backgroundMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 1.0;
  if (!*(_BYTE *)(a1 + 72))
    v5 = 0.0;
  objc_msgSend(v3, "setWeighting:", v5);

  objc_msgSend(WeakRetained, "_presentedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  v7 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(WeakRetained, "_presentedControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "_setContinuousCornerRadius:", 13.0);
  else
    objc_msgSend(v8, "_setCornerRadius:", CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5);

  objc_msgSend(WeakRetained, "_presentedControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 1.0;
  if (!*(_BYTE *)(a1 + 72))
    v12 = 0.0;
  objc_msgSend(v10, "setAlpha:", v12);

  objc_msgSend(WeakRetained, "_presentedControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  if (*(_BYTE *)(a1 + 72))
  {
    v14 = (void *)*MEMORY[0x1E0DC4730];
    objc_msgSend(WeakRetained, "sourceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_eventRoutingScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v17);

  }
}

uint64_t __73__NCClickInteractionPresenter__animatePresentation_cancelled_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6;
  id WeakRetained;
  void *v8;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    v6 = (_DWORD)a2 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "clickInteractionPresenterDidPresent:", WeakRetained);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_performPresentation
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  self->_hinting = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "clickInteractionPresenterDidCommitToPresentation:", self);
  self->_presented = 1;
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__NCClickInteractionPresenter__performPresentation__block_invoke;
  v4[3] = &unk_1E8D1D480;
  objc_copyWeak(&v5, &location);
  -[NCClickInteractionPresenter _animatePresentation:cancelled:completion:](self, "_animatePresentation:cancelled:completion:", 1, 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __51__NCClickInteractionPresenter__performPresentation__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPresented:", a2);
  if ((a2 & 1) == 0 && (a3 & 1) == 0)
    objc_msgSend(WeakRetained, "_performCancel");

}

- (void)_performCancel
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_touchEater);
  objc_msgSend(WeakRetained, "setEnabled:", 0);

  -[NCClickInteractionPresentedControl setUserInteractionEnabled:](self->_presentedControl, "setUserInteractionEnabled:", 0);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NCClickInteractionPresenter__performCancel__block_invoke;
  v4[3] = &unk_1E8D1D480;
  objc_copyWeak(&v5, &location);
  -[NCClickInteractionPresenter _animatePresentation:cancelled:completion:](self, "_animatePresentation:cancelled:completion:", 0, 1, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__NCClickInteractionPresenter__performCancel__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDown");
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "clickInteractionPresenterDidDismiss:", WeakRetained);

}

- (void)_tearDown
{
  UIView *containerView;
  MTMaterialView *backgroundMaterialView;
  UIView *portalView;

  *(_WORD *)&self->_presented = 0;
  -[UIView removeFromSuperview](self->_containerView, "removeFromSuperview");
  containerView = self->_containerView;
  self->_containerView = 0;

  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = 0;

  portalView = self->_portalView;
  self->_portalView = 0;

}

- (void)_handleEatenTouch:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[NCClickInteractionPresenter dismissModalFullScreenIfNeeded](self, "dismissModalFullScreenIfNeeded");
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (CGRect)sourceViewVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceViewVisibleRect.origin.x;
  y = self->_sourceViewVisibleRect.origin.y;
  width = self->_sourceViewVisibleRect.size.width;
  height = self->_sourceViewVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceViewVisibleRect:(CGRect)a3
{
  self->_sourceViewVisibleRect = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (NCClickInteractionPresenterDelegate)delegate
{
  return (NCClickInteractionPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void)_setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (_UIClickInteraction)_clickInteraction
{
  return self->_clickInteraction;
}

- (UIView)_containerView
{
  return self->_containerView;
}

- (UIView)_portalView
{
  return self->_portalView;
}

- (NCTouchEaterGestureRecognizer)_touchEater
{
  return (NCTouchEaterGestureRecognizer *)objc_loadWeakRetained((id *)&self->_touchEater);
}

- (NCClickInteractionPresentedControl)_presentedControl
{
  return self->_presentedControl;
}

- (MTMaterialView)_backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (BOOL)_isHinting
{
  return self->_hinting;
}

- (void)_setHinting:(BOOL)a3
{
  self->_hinting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_presentedControl, 0);
  objc_destroyWeak((id *)&self->_touchEater);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
