@implementation PGControlsContainerView

- (PGControlsContainerView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PGControlsContainerView *v11;
  PGControlsContainerView *v12;
  void *v13;
  PGControlsView *v14;
  uint64_t v15;
  PGControlsView *controlsView;
  uint64_t v17;
  UITapGestureRecognizer *singleTapGestureRecognizer;
  uint64_t v19;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  uint64_t v21;
  UITapGestureRecognizer *doubleDoubleTapGestureRecognizer;
  uint64_t v23;
  UIGestureRecognizer *hoverGestureRecognizer;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PGControlsContainerView;
  v11 = -[PGControlsContainerView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[PGControlsContainerView setOverrideUserInterfaceStyle:](v11, "setOverrideUserInterfaceStyle:", 2);
    -[PGControlsContainerView layer](v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHitTestsAsOpaque:", 1);

    objc_storeStrong((id *)&v12->_viewModel, a4);
    objc_msgSend(v10, "setDelegate:", v12);
    v14 = [PGControlsView alloc];
    -[PGControlsContainerView bounds](v12, "bounds");
    v15 = -[PGControlsView initWithFrame:viewModel:](v14, "initWithFrame:viewModel:", v12->_viewModel);
    controlsView = v12->_controlsView;
    v12->_controlsView = (PGControlsView *)v15;

    -[PGControlsContainerView addSubview:](v12, "addSubview:", v12->_controlsView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v12, sel__handleSingleTapGestureRecognizer_);
    singleTapGestureRecognizer = v12->_singleTapGestureRecognizer;
    v12->_singleTapGestureRecognizer = (UITapGestureRecognizer *)v17;

    -[PGControlsContainerView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_singleTapGestureRecognizer);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v12->_singleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setDelegate:](v12->_singleTapGestureRecognizer, "setDelegate:", v12);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v12, sel__handleDoubleTapGestureRecognizer_);
    doubleTapGestureRecognizer = v12->_doubleTapGestureRecognizer;
    v12->_doubleTapGestureRecognizer = (UITapGestureRecognizer *)v19;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v12->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[PGControlsContainerView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_doubleTapGestureRecognizer);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v12->_doubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setDelegate:](v12->_doubleTapGestureRecognizer, "setDelegate:", v12);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v12, sel__handleDoubleDoubleTapGestureRecognizer_);
    doubleDoubleTapGestureRecognizer = v12->_doubleDoubleTapGestureRecognizer;
    v12->_doubleDoubleTapGestureRecognizer = (UITapGestureRecognizer *)v21;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v12->_doubleDoubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v12->_doubleDoubleTapGestureRecognizer, "setNumberOfTouchesRequired:", 2);
    -[PGControlsContainerView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_doubleDoubleTapGestureRecognizer);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](v12->_doubleDoubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setDelegate:](v12->_doubleDoubleTapGestureRecognizer, "setDelegate:", v12);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v12, sel__handleHoverGestureRecognizer_);
    hoverGestureRecognizer = v12->_hoverGestureRecognizer;
    v12->_hoverGestureRecognizer = (UIGestureRecognizer *)v23;

    -[PGControlsContainerView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_hoverGestureRecognizer);
    -[UIGestureRecognizer setDelegate:](v12->_hoverGestureRecognizer, "setDelegate:", v12);
  }

  return v12;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGControlsContainerView;
  -[PGControlsContainerView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[PGControlsContainerView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorderWidth:", 1.0);

  -[PGControlsContainerView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.15);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

}

- (void)layoutSubviews
{
  PGControlsView *controlsView;
  UIView *interruptionDimmingView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGControlsContainerView;
  -[PGControlsContainerView layoutSubviews](&v5, sel_layoutSubviews);
  controlsView = self->_controlsView;
  -[PGControlsContainerView bounds](self, "bounds");
  -[PGControlsView setFrame:](controlsView, "setFrame:");
  interruptionDimmingView = self->_interruptionDimmingView;
  -[PGControlsContainerView bounds](self, "bounds");
  -[UIView setFrame:](interruptionDimmingView, "setFrame:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGControlsContainerView;
  -[PGControlsContainerView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[PGControlsView _setContinuousCornerRadius:](self->_controlsView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->_interruptionDimmingView, "_setContinuousCornerRadius:", a3);
}

- (void)setControlsContainerHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  UIViewPropertyAnimator **p_containerViewVisibilityAnimator;
  void *v8;
  id WeakRetained;

  v4 = a4;
  v5 = a3;
  p_containerViewVisibilityAnimator = &self->_containerViewVisibilityAnimator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewVisibilityAnimator);
  -[PGControlsContainerView _updateVisibilityOfView:hidden:animated:existingAnimator:](self, "_updateVisibilityOfView:hidden:animated:existingAnimator:", self, v5, v4, WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)p_containerViewVisibilityAnimator, v8);

}

- (void)setInteractivelyResizing:(BOOL)a3
{
  BOOL v4;

  if (self->_interactivelyResizing != a3)
  {
    self->_interactivelyResizing = a3;
    v4 = !a3;
    -[PGControlsContainerView _setControlsHidden:animated:](self, "_setControlsHidden:animated:");
    if (!v4)
      -[PGControlsContainerView _invalidateTimer](self, "_invalidateTimer");
  }
}

- (id)viewModel
{
  return self->_viewModel;
}

- (void)setHoverGestureDisbaled:(BOOL)a3
{
  -[UIGestureRecognizer setEnabled:](self->_hoverGestureRecognizer, "setEnabled:", !a3);
}

- (void)controlsViewModel:(id)a3 didIssueCommand:(id)a4
{
  PGControlsContainerView *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "systemAction") == 4)
  {
    if (-[PGControlsView prefersControlsHidden](self->_controlsView, "prefersControlsHidden"))
    {
      v5 = self;
      v6 = 0;
    }
    else
    {
      v5 = self;
      v6 = 1;
    }
    -[PGControlsContainerView _setPrefersControlsHidden:animated:](v5, "_setPrefersControlsHidden:animated:", v6, 1);
  }
  else
  {
    -[PGControlsContainerView commandHandler](self, "commandHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleCommand:", v8);

  }
}

- (void)controlsViewModel:(id)a3 valuesChangedFromOldValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  id v22;
  UIView *v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  UIView *v27;
  UIView *interruptionDimmingView;
  id v29;

  v29 = a3;
  v6 = a4;
  objc_msgSend(v29, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer setEnabled:](self->_singleTapGestureRecognizer, "setEnabled:", objc_msgSend(v7, "includesSingleTapGestureRecognizer"));
  -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:", objc_msgSend(v7, "includesDoubleTapGestureRecognizer"));
  -[UITapGestureRecognizer setEnabled:](self->_doubleDoubleTapGestureRecognizer, "setEnabled:", objc_msgSend(v7, "includesDoubleDoubleTapGestureRecognizer"));
  -[PGControlsView viewModelDidUpdateValuesFromOldValues:](self->_controlsView, "viewModelDidUpdateValuesFromOldValues:", v6);
  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
  objc_msgSend(v29, "playbackState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "contentType");

  if ((unint64_t)(v9 - 1) > 1)
    goto LABEL_28;
  objc_msgSend(v29, "playbackState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "normalizedProgress");
  v12 = v11;

  objc_msgSend(v29, "values");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "controlsShouldAutoHide");

  objc_msgSend(v29, "values");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "includesContentLoadingIndicator")
    && !objc_msgSend(v6, "includesContentLoadingIndicator"))
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v29, "values");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "includesWaitingToPlayIndicator"))
      v17 = objc_msgSend(v6, "includesWaitingToPlayIndicator") ^ 1;
    else
      v17 = 0;

  }
  objc_msgSend(v29, "values");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "includesContentLoadingIndicator") & 1) != 0
    || (objc_msgSend(v6, "includesContentLoadingIndicator") & 1) == 0)
  {
    objc_msgSend(v29, "values");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "includesWaitingToPlayIndicator") & 1) != 0)
      v19 = 0;
    else
      v19 = objc_msgSend(v6, "includesWaitingToPlayIndicator");

  }
  else
  {
    v19 = 1;
  }

  if (v12 < 1.0)
    v21 = 1;
  else
    v21 = v14;
  if ((v21 & 1) == 0 && objc_msgSend(v6, "controlsShouldAutoHide") || v17)
  {
    -[PGControlsContainerView _setPrefersControlsHidden:animated:](self, "_setPrefersControlsHidden:animated:", 0, 1);
LABEL_28:
    -[UIView removeFromSuperview](self->_interruptionDimmingView, "removeFromSuperview");
    interruptionDimmingView = self->_interruptionDimmingView;
    self->_interruptionDimmingView = 0;

    goto LABEL_29;
  }
  if (v19)
  {
    -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
    goto LABEL_28;
  }
  if (!objc_msgSend(v29, "isInterrupted"))
    goto LABEL_28;
  -[PGControlsContainerView _invalidateTimer](self, "_invalidateTimer");
  -[PGControlsContainerView _setPrefersControlsHidden:animated:](self, "_setPrefersControlsHidden:animated:", 0, 1);
  if (!self->_interruptionDimmingView)
  {
    v22 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[PGControlsContainerView bounds](self, "bounds");
    v23 = (UIView *)objc_msgSend(v22, "initWithFrame:");
    v24 = self->_interruptionDimmingView;
    self->_interruptionDimmingView = v23;

    -[UIView setUserInteractionEnabled:](self->_interruptionDimmingView, "setUserInteractionEnabled:", 0);
    v25 = self->_interruptionDimmingView;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.65);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    v27 = self->_interruptionDimmingView;
    -[PGControlsContainerView _continuousCornerRadius](self, "_continuousCornerRadius");
    -[UIView _setContinuousCornerRadius:](v27, "_setContinuousCornerRadius:");
    -[PGControlsContainerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_interruptionDimmingView, self->_controlsView);
  }
LABEL_29:

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  PGControlsContainerView *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (UIGestureRecognizer *)a3;
  -[UIGestureRecognizer delegate](v4, "delegate");
  v5 = (PGControlsContainerView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    if (self->_hoverGestureRecognizer == v4
      && (-[PGControlsViewModel values](self->_viewModel, "values"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "includesRestoreButton"),
          v6,
          !v7))
    {
      LOBYTE(self) = 0;
    }
    else
    {
      -[UIGestureRecognizer view](v4, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureRecognizer view](v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureRecognizer locationInView:](v4, "locationInView:", v9);
      objc_msgSend(v8, "hitTest:withEvent:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(self) = objc_msgSend(v10, "isDescendantOfView:", self->_controlsView) ^ 1;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PGControlsContainerView;
    LOBYTE(self) = -[PGControlsContainerView gestureRecognizerShouldBegin:](&v12, sel_gestureRecognizerShouldBegin_, v4);
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  BOOL v9;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = (UITapGestureRecognizer *)a4;
  v8 = v7;
  v9 = 0;
  if (self->_singleTapGestureRecognizer == v6)
  {
    if (self->_doubleTapGestureRecognizer == v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v9 = 1;
  }

  return v9;
}

- (void)_handleSingleTapGestureRecognizer:(id)a3
{
  if (-[UIGestureRecognizer state](self->_hoverGestureRecognizer, "state", a3) == UIGestureRecognizerStatePossible)
    -[PGControlsViewModel handleSingleTap](self->_viewModel, "handleSingleTap");
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
  -[PGControlsViewModel handleDoubleTap](self->_viewModel, "handleDoubleTap", a3);
}

- (void)_handleDoubleDoubleTapGestureRecognizer:(id)a3
{
  if (!self->_interactivelyResizing)
    -[PGControlsViewModel handleDoubleDoubleTap](self->_viewModel, "handleDoubleDoubleTap", a3);
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 1)
  {
    if (!-[PGControlsContainerView isShowingControlsForHoverActive](self, "isShowingControlsForHoverActive"))
    {
      -[PGControlsContainerView setShowingControlsForHoverActive:](self, "setShowingControlsForHoverActive:", 1);
      goto LABEL_6;
    }
  }
  else
  {
    v4 = objc_msgSend(v6, "state");
    if (-[PGControlsContainerView isShowingControlsForHoverActive](self, "isShowingControlsForHoverActive") != (v4 == 2))
    {
      -[PGControlsContainerView setShowingControlsForHoverActive:](self, "setShowingControlsForHoverActive:", v4 == 2);
      if (v4 != 2)
      {
        if (!-[PGControlsContainerView _controlsShouldAutoHide](self, "_controlsShouldAutoHide"))
          goto LABEL_8;
        v5 = 1;
        goto LABEL_7;
      }
LABEL_6:
      -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
      v5 = 0;
LABEL_7:
      -[PGControlsContainerView _setPrefersControlsHidden:animated:](self, "_setPrefersControlsHidden:animated:", v5, 1);
    }
  }
LABEL_8:

}

- (id)_acquirePreventAutoHideOfControlsAssertionWithReason:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  NSMutableSet *preventAutoHideOfControlsAssertionIdentifiers;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;
  const __CFString *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  preventAutoHideOfControlsAssertionIdentifiers = self->_preventAutoHideOfControlsAssertionIdentifiers;
  if (!preventAutoHideOfControlsAssertionIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
    v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_preventAutoHideOfControlsAssertionIdentifiers;
    self->_preventAutoHideOfControlsAssertionIdentifiers = v8;

    preventAutoHideOfControlsAssertionIdentifiers = self->_preventAutoHideOfControlsAssertionIdentifiers;
  }
  -[NSMutableSet addObject:](preventAutoHideOfControlsAssertionIdentifiers, "addObject:", v6);
  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0D01868]);
  if (v4)
    v11 = v4;
  else
    v11 = CFSTR("Unknown Reason");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__PGControlsContainerView__acquirePreventAutoHideOfControlsAssertionWithReason___block_invoke;
  v15[3] = &unk_1E622FC58;
  objc_copyWeak(&v17, &location);
  v12 = v6;
  v16 = v12;
  v13 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v12, v11, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __80__PGControlsContainerView__acquirePreventAutoHideOfControlsAssertionWithReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[63], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_updateHideControlsAfterDelayTimer");
    WeakRetained = v3;
  }

}

- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a4;
  v5 = a3;
  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
  -[PGControlsView setPrefersControlsHidden:](self->_controlsView, "setPrefersControlsHidden:", v5);
  if (v5)
    -[PGControlsContainerView setShowingControlsForHoverActive:](self, "setShowingControlsForHoverActive:", 0);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke;
  v12[3] = &unk_1E622F8C0;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hidableControlsVisibilityAnimator);
  v10[4] = self;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_2;
  v11[3] = &unk_1E622F8C0;
  v11[4] = self;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_3;
  v10[3] = &unk_1E622F8C0;
  -[PGControlsContainerView _performVisibilityTransitionAnimated:existingAnimator:animations:success:](self, "_performVisibilityTransitionAnimated:existingAnimator:animations:success:", v4, WeakRetained, v11, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_hidableControlsVisibilityAnimator, v9);

  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
}

uint64_t __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "updateProgress");
}

void __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "updateControlsAlpha");
  objc_msgSend(*(id *)(a1 + 32), "coordinatedAnimationsForControlsVisibiity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinatedAnimationsForControlsVisibiity");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "prefersControlsHidden") ^ 1);

  }
}

uint64_t __62__PGControlsContainerView__setPrefersControlsHidden_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "updateProgress");
  return objc_msgSend(*(id *)(a1 + 32), "_updateHideControlsAfterDelayTimer");
}

- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  PGControlsView *controlsView;
  id WeakRetained;
  void *v9;

  v4 = a4;
  v5 = a3;
  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
  controlsView = self->_controlsView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controlsViewVisibilityAnimator);
  -[PGControlsContainerView _updateVisibilityOfView:hidden:animated:existingAnimator:](self, "_updateVisibilityOfView:hidden:animated:existingAnimator:", controlsView, v5, v4, WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_controlsViewVisibilityAnimator, v9);

  -[PGControlsContainerView _updateHideControlsAfterDelayTimer](self, "_updateHideControlsAfterDelayTimer");
}

- (id)_updateVisibilityOfView:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5 existingAnimator:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  PGControlsContainerView *v18;
  BOOL v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (!a4)
    objc_msgSend(v10, "setHidden:", 0);
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke;
  v20[3] = &unk_1E622FC80;
  v21 = v10;
  v22 = a4;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke_2;
  v16[3] = &unk_1E622FCA8;
  v19 = a4;
  v17 = v21;
  v18 = self;
  v13 = v21;
  -[PGControlsContainerView _performVisibilityTransitionAnimated:existingAnimator:animations:success:](self, "_performVisibilityTransitionAnimated:existingAnimator:animations:success:", v7, v11, v20, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

_QWORD *__84__PGControlsContainerView__updateVisibilityOfView_hidden_animated_existingAnimator___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) != result[53])
    return (_QWORD *)objc_msgSend(result, "_updateHideControlsAfterDelayTimer");
  return result;
}

- (id)_performVisibilityTransitionAnimated:(BOOL)a3 existingAnimator:(id)a4 animations:(id)a5 success:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "isRunning") && objc_msgSend(v9, "isInterruptible"))
  {
    objc_msgSend(v9, "stopAnimation:", 0);
    objc_msgSend(v9, "finishAnimationAtPosition:", 2);
  }
  if (v8)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__0;
    v21[4] = __Block_byref_object_dispose__0;
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:curve:animations:", 0, v10, 0.2);
    v22 = v12;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke;
    v18[3] = &unk_1E622FCD0;
    v19 = v11;
    v20 = v21;
    objc_msgSend(v12, "addCompletion:", v18);
    objc_msgSend(v12, "startAnimation");

    _Block_object_dispose(v21, 8);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke_2;
    v15[3] = &unk_1E622FCF8;
    v16 = v10;
    v17 = v11;
    objc_msgSend(v13, "performWithoutAnimation:", v15);

    v12 = 0;
  }

  return v12;
}

void __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __100__PGControlsContainerView__performVisibilityTransitionAnimated_existingAnimator_animations_success___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_controlsShouldAutoHide
{
  void *v3;
  _BOOL4 v4;

  -[PGControlsViewModel values](self->_viewModel, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "controlsShouldAutoHide")
    || -[NSMutableSet count](self->_preventAutoHideOfControlsAssertionIdentifiers, "count")
    || -[PGControlsView prefersControlsHidden](self->_controlsView, "prefersControlsHidden"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !-[PGControlsContainerView isShowingControlsForHoverActive](self, "isShowingControlsForHoverActive");
  }

  return v4;
}

- (void)_updateHideControlsAfterDelayTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *hideControlsAfterDelayTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (-[PGControlsContainerView _controlsShouldAutoHide](self, "_controlsShouldAutoHide"))
  {
    if (!-[PGControlsView prefersControlsHidden](self->_controlsView, "prefersControlsHidden")
      && !self->_hideControlsAfterDelayTimer)
    {
      objc_initWeak(&location, self);
      v3 = (void *)MEMORY[0x1E0C99E88];
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __61__PGControlsContainerView__updateHideControlsAfterDelayTimer__block_invoke;
      v6[3] = &unk_1E622FD20;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 3.0);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      hideControlsAfterDelayTimer = self->_hideControlsAfterDelayTimer;
      self->_hideControlsAfterDelayTimer = v4;

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[PGControlsContainerView _invalidateTimer](self, "_invalidateTimer");
  }
}

void __61__PGControlsContainerView__updateHideControlsAfterDelayTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  char v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "viewModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isInterrupted");

    WeakRetained = v5;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v5, "_setPrefersControlsHidden:animated:", 1, 1);
      v4 = (void *)v5[62];
      v5[62] = 0;

      WeakRetained = v5;
    }
  }

}

- (void)_invalidateTimer
{
  NSTimer *hideControlsAfterDelayTimer;

  -[NSTimer invalidate](self->_hideControlsAfterDelayTimer, "invalidate");
  hideControlsAfterDelayTimer = self->_hideControlsAfterDelayTimer;
  self->_hideControlsAfterDelayTimer = 0;

}

- (PGCommandHandler)commandHandler
{
  return (PGCommandHandler *)objc_loadWeakRetained((id *)&self->_commandHandler);
}

- (void)setCommandHandler:(id)a3
{
  objc_storeWeak((id *)&self->_commandHandler, a3);
}

- (BOOL)showsPictureInPictureUnavailableIndicator
{
  return self->_showsPictureInPictureUnavailableIndicator;
}

- (void)setShowsPictureInPictureUnavailableIndicator:(BOOL)a3
{
  self->_showsPictureInPictureUnavailableIndicator = a3;
}

- (BOOL)isShowingControlsForHoverActive
{
  return self->_showingControlsForHoverActive;
}

- (void)setShowingControlsForHoverActive:(BOOL)a3
{
  self->_showingControlsForHoverActive = a3;
}

- (BOOL)isInteractivelyResizing
{
  return self->_interactivelyResizing;
}

- (id)coordinatedAnimationsForControlsVisibiity
{
  return self->_coordinatedAnimationsForControlsVisibiity;
}

- (void)setCoordinatedAnimationsForControlsVisibiity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coordinatedAnimationsForControlsVisibiity, 0);
  objc_destroyWeak((id *)&self->_commandHandler);
  objc_storeStrong((id *)&self->_preventAutoHideOfControlsAssertionIdentifiers, 0);
  objc_storeStrong((id *)&self->_hideControlsAfterDelayTimer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interruptionDimmingView, 0);
  objc_destroyWeak((id *)&self->_hidableControlsVisibilityAnimator);
  objc_destroyWeak((id *)&self->_controlsViewVisibilityAnimator);
  objc_destroyWeak((id *)&self->_containerViewVisibilityAnimator);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
