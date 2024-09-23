@implementation UISheetPresentationController

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
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
  double v21;
  double v22;
  UIDropShadowView *dropShadowView;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
  {
    -[UIPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v10, "_formSheetSizeForWindowWithSize:screenSize:", v7, v9);
    v14 = v13;
    v16 = v15;

    -[UIView bounds](self->_dropShadowView, "bounds");
    v18 = v17;
    v20 = v19;
    v21 = *MEMORY[0x1E0C9D538];
    v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    dropShadowView = self->_dropShadowView;
    -[UIView bounds](dropShadowView, "bounds");
    -[UIDropShadowView willBeginRotationWithOriginalBounds:newBounds:](dropShadowView, "willBeginRotationWithOriginalBounds:newBounds:");
    if (v14 != v18 || v16 != v20)
      -[UIView setBounds:](self->_dropShadowView, "setBounds:", v21, v22, v14, v16);
    -[UISheetPresentationController _hostManager](self, "_hostManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISheetPresentationController _frameOfPresentedViewControllerViewInSuperview](self, "_frameOfPresentedViewControllerViewInSuperview");
      objc_msgSend(v27, "setFrame:");

      -[UISheetPresentationController presentedView](self, "presentedView");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      -[UISheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
      objc_msgSend(v28, "setFrame:");

    }
  }
}

- (void)containerViewDidLayoutSubviews
{
  void *v3;
  char v4;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
    -[UIDropShadowView didFinishRotation](self->_dropShadowView, "didFinishRotation");
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  void *v3;
  int v4;
  void *v5;

  -[UISheetPresentationController _hostManagerIfLoaded](self, "_hostManagerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v4) = objc_msgSend(v3, "inheritsPresentingViewControllerThemeLevel");
  }
  else
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_wantsFullScreen") ^ 1;

  }
  return v4;
}

- (_UISheetLayoutInfo)_layoutInfo
{
  return self->__layoutInfo;
}

- (_UISheetHostManager)_hostManagerIfLoaded
{
  return self->__hostManager;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return self->__shouldPresentedViewControllerControlStatusBarAppearance;
}

- (id)presentedView
{
  return self->_dropShadowView;
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sheetInteractionIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOffset");
  v4 = v3;

  return v4;
}

uint64_t __50__UISheetPresentationController__sheetInteraction__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_indexOfCurrentActiveOrDismissDetent");

  return v3;
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_invalidateCurrentOffset");

}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_activeDetents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_value");
  v8 = v7;

  return v8;
}

uint64_t __50__UISheetPresentationController__sheetInteraction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_activeDetents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (_UISheetInteraction)_sheetInteraction
{
  _UISheetInteraction *sheetInteraction;
  _UISheetInteraction *v4;
  _UISheetInteraction *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location[2];

  sheetInteraction = self->__sheetInteraction;
  if (!sheetInteraction)
  {
    v4 = objc_alloc_init(_UISheetInteraction);
    v5 = self->__sheetInteraction;
    self->__sheetInteraction = v4;

    -[_UISheetInteraction setDelegate:](self->__sheetInteraction, "setDelegate:", self);
    objc_initWeak(location, self);
    v6 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke;
    v26[3] = &unk_1E16E5098;
    objc_copyWeak(&v27, location);
    -[_UISheetInteraction setNumberOfDetentsGetter:](self->__sheetInteraction, "setNumberOfDetentsGetter:", v26);
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_2;
    v24[3] = &unk_1E16E50C0;
    objc_copyWeak(&v25, location);
    -[_UISheetInteraction setDetentGetter:](self->__sheetInteraction, "setDetentGetter:", v24);
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_3;
    v22[3] = &unk_1E16E50E8;
    objc_copyWeak(&v23, location);
    -[_UISheetInteraction setIndexOfCurrentDetentGetter:](self->__sheetInteraction, "setIndexOfCurrentDetentGetter:", v22);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_4;
    v20[3] = &unk_1E16E5110;
    objc_copyWeak(&v21, location);
    -[_UISheetInteraction setRubberBandExtentBeyondMinimumOffsetGetter:](self->__sheetInteraction, "setRubberBandExtentBeyondMinimumOffsetGetter:", v20);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_5;
    v18[3] = &unk_1E16E5110;
    objc_copyWeak(&v19, location);
    -[_UISheetInteraction setRubberBandExtentBeyondMaximumOffsetGetter:](self->__sheetInteraction, "setRubberBandExtentBeyondMaximumOffsetGetter:", v18);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_6;
    v16[3] = &unk_1E16B3F40;
    objc_copyWeak(&v17, location);
    -[_UISheetInteraction setCurrentOffsetWasInvalidated:](self->__sheetInteraction, "setCurrentOffsetWasInvalidated:", v16);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_7;
    v14[3] = &unk_1E16B3F40;
    objc_copyWeak(&v15, location);
    -[_UISheetLayoutInfo set_indexOfCurrentActiveOrDismissDetentWasInvalidated:](self->__layoutInfo, "set_indexOfCurrentActiveOrDismissDetentWasInvalidated:", v14);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_8;
    v12[3] = &unk_1E16B3F40;
    objc_copyWeak(&v13, location);
    -[_UISheetLayoutInfo set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:](self->__layoutInfo, "set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_9;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, location);
    -[_UISheetLayoutInfo set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:](self->__layoutInfo, "set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_10;
    v8[3] = &unk_1E16E5138;
    objc_copyWeak(&v9, location);
    -[_UISheetLayoutInfo _setCurrentOffsetGetter:](self->__layoutInfo, "_setCurrentOffsetGetter:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
    sheetInteraction = self->__sheetInteraction;
  }
  return sheetInteraction;
}

- (void)_containerViewLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  float v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double Width;
  double v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _UISheetPresentationControllerClientConfiguration *v36;
  void *v37;
  uint64_t v38;
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)UISheetPresentationController;
  -[UIPresentationController _containerViewLayoutSubviews](&v43, sel__containerViewLayoutSubviews);
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController dropShadowView](self, "dropShadowView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_mode") != 1
    || (objc_msgSend(v3, "_isFunctionallyFullScreen") & 1) != 0
    || (objc_msgSend(v3, "_isHosting") & 1) != 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "_untransformedFrame");
  Width = CGRectGetWidth(v44);
  objc_msgSend(v3, "_screenSize");
  +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:");
  if (Width <= v29)
    goto LABEL_43;
  if (qword_1ECD7B688 != -1)
    dispatch_once(&qword_1ECD7B688, &__block_literal_global_546);
  if (!_MergedGlobals_43_1
    || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DisableWorkaroundFor88706066, (uint64_t)CFSTR("DisableWorkaroundFor88706066")) & 1) == 0&& byte_1EDDA834C)
  {
LABEL_4:
    -[UIPresentationController _internalTraitOverrides](self, "_internalTraitOverrides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_removeTraitToken:", 0x1E1A994F8);
  }
  else
  {
LABEL_43:
    -[UIPresentationController _internalTraitOverrides](self, "_internalTraitOverrides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHorizontalSizeClass:", 1);
  }

  if (-[UISheetPresentationController _forceSheetSemanticContext](self, "_forceSheetSemanticContext")
    || (objc_msgSend(v3, "_isFunctionallyFullScreen") & 1) == 0
    && (objc_msgSend(v3, "_isHosting") & 1) == 0
    && (-[UIPresentationController presentedViewController](self, "presentedViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = _UISheetPresentationControllerStylesSheetsAsCards(v7),
        v7,
        v8))
  {
    -[UIPresentationController _internalTraitOverrides](self, "_internalTraitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setNSIntegerValue:forTraitToken:", 2, 0x1E1A99678);
  }
  else
  {
    -[UIPresentationController _internalTraitOverrides](self, "_internalTraitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_removeTraitToken:", 0x1E1A99678);
  }

  -[UISheetPresentationController _sheetMetrics](self, "_sheetMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureDropShadowView:state:presentationController:", v4, v3, self);

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _UISheetPresentationControllerStylesSheetsAsCards(v10);

  if (v11)
  {
    -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _confinedDimmingView](self, "_confinedDimmingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "setScrollingExpandsToLargerDetentWhenScrolledToEdge:", objc_msgSend(v3, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
      if (objc_msgSend(v3, "_isInteractionEnabled"))
        v15 = -[UISheetPresentationController _isHosting](self, "_isHosting") ^ 1;
      else
        v15 = 0;
      objc_msgSend(v12, "setEnabled:", v15);
      objc_msgSend(v12, "setScrollInteractionEnabled:", objc_msgSend(v3, "_isScrollInteractionEnabled"));
    }
    if (objc_msgSend(v3, "_isInteractionEnabled"))
      v16 = -[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely") ^ 1;
    else
      v16 = 0;
    -[UISheetPresentationController _exteriorPanGestureRecognizer](self, "_exteriorPanGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", v16);

    objc_msgSend(v3, "_hostedFrameOfPresentedViewInContainerView");
    -[UISheetPresentationController setFrameOfPresentedViewInContainerView:](self, "setFrameOfPresentedViewInContainerView:");
    objc_msgSend(v13, "setIgnoresTouches:", objc_msgSend(v3, "_shouldDimmingIgnoreTouches"));
    objc_msgSend(v14, "setIgnoresTouches:", objc_msgSend(v3, "_shouldDimmingIgnoreTouches"));
    objc_msgSend(v13, "setUserInteractionEnabled:", objc_msgSend(v3, "_isDimmingEnabled"));
    objc_msgSend(v14, "setUserInteractionEnabled:", objc_msgSend(v3, "_isDimmingEnabled"));
    objc_msgSend(v3, "_percentDimmed");
    objc_msgSend(v13, "setPercentDisplayed:");
    objc_msgSend(v3, "_magicShadowOpacity");
    objc_msgSend(v4, "setMagicShadowAlpha:");
    objc_msgSend(v3, "_confinedPercentDimmed");
    objc_msgSend(v14, "setPercentDisplayed:");
    objc_msgSend(v3, "_confinedPercentLightened");
    objc_msgSend(v14, "setPercentLightened:");
    if (objc_msgSend(v3, "_wantsGrabber"))
      v18 = objc_msgSend(v3, "_isHosting") ^ 1;
    else
      v18 = 0;
    objc_msgSend(v4, "_setHasGrabber:", v18);
    objc_msgSend(v3, "_grabberSpacing");
    objc_msgSend(v4, "_setGrabberSpacing:");
    objc_msgSend(v4, "_setGrabberEdge:", objc_msgSend(v3, "_isInverted"));
    objc_msgSend(v3, "_grabberAlpha");
    objc_msgSend(v4, "_setGrabberAlpha:");
    objc_msgSend(v4, "_setInsetsContentViewForGrabber:", objc_msgSend(v3, "_insetsContentViewForGrabber"));
    objc_msgSend(v4, "_setGrabberBlurEnabled:", objc_msgSend(v3, "_isGrabberBlurEnabled"));
    objc_msgSend(v3, "_shadowOpacity");
    v20 = v19;
    objc_msgSend(v4, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v22 = v20;
    objc_msgSend(v21, "setShadowOpacity:", v22);

    objc_msgSend(v3, "_shadowRadius");
    v24 = v23;
    objc_msgSend(v4, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowRadius:", v24);

    if ((!-[UIPresentationController presenting](self, "presenting") || objc_msgSend(v3, "_isPresented"))
      && !-[UIPresentationController dismissing](self, "dismissing")
      && !-[UIPresentationController _transitioningFrom](self, "_transitioningFrom")
      && !-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning")
      && !-[UISheetPresentationController _isRemoteDismissing](self, "_isRemoteDismissing")
      && !-[UISheetPresentationController _didTearOff](self, "_didTearOff"))
    {
      -[UISheetPresentationController _updatePresentedViewFrame](self, "_updatePresentedViewFrame");
      objc_msgSend(v3, "_alpha");
      objc_msgSend(v4, "setAlpha:");
    }
    objc_msgSend(v3, "_touchInsets");
    objc_msgSend(v4, "setContentTouchInsets:");
    objc_msgSend(v3, "_hostedCornerRadii");
    objc_msgSend(v4, "setEnvironmentMatchingCornerRadii:");
    objc_opt_self();
    if (fluidPresentationTransitionsEnabled == 1
      && (-[UIPresentationController presentedViewController](self, "presentedViewController"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "modalTransitionStyle"),
          v26,
          v27 != 1)
      || !-[UIPresentationController presenting](self, "presenting")
      && !-[UIPresentationController dismissing](self, "dismissing"))
    {
      if (v3)
      {
        objc_msgSend(v3, "_transform");
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
      }
      v39[0] = v40;
      v39[1] = v41;
      v39[2] = v42;
      objc_msgSend(v4, "setTransform:", v39);
    }
    -[UISheetPresentationController _updateShouldPresentedViewControllerControlStatusBarAppearance](self, "_updateShouldPresentedViewControllerControlStatusBarAppearance");
    -[UISheetPresentationController _configuration](self, "_configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_setSheetConfiguration:", v30);

    v32 = objc_msgSend(v3, "_wantsFullScreen");
    if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely") && (v32 & 1) == 0)
    {
      -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v34 = objc_msgSend(v3, "_containsFirstResponder");
        v35 = objc_msgSend(v3, "_firstResponderRequiresKeyboard");
        objc_msgSend(v3, "_keyboardFrame");
        objc_msgSend(v33, "_sheetPresentationControllerDidChangeContainsFirstResponder:firstResponderRequiresKeyboard:keyboardFrame:", v34, v35);
      }
      else
      {
        v36 = objc_alloc_init(_UISheetPresentationControllerClientConfiguration);
        -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v36, "setContainsFirstResponder:", objc_msgSend(v3, "_containsFirstResponder"));
        -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v36, "setFirstResponderRequiresKeyboard:", objc_msgSend(v3, "_firstResponderRequiresKeyboard"));
        objc_msgSend(v3, "_keyboardFrame");
        -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v36, "setKeyboardFrame:");
        objc_msgSend(v3, "_proposedDepthLevel");
        -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v36, "setProposedDepthLevel:");
        objc_msgSend(v33, "_sheetPresentationControllerClientConfigurationDidChange:", v36);

      }
    }
    -[UISheetPresentationController _hostManager](self, "_hostManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v38 = objc_msgSend(v37, "shouldOccludeDuringPresentation");
    }
    else if (objc_msgSend(v3, "_isModelDimmingEnabled"))
    {
      v38 = -[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation") ^ 1;
    }
    else
    {
      v38 = 0;
    }
    -[UISheetPresentationController _setOcclusionEnabled:](self, "_setOcclusionEnabled:", v38);

  }
}

- (BOOL)_isGeneratingAnimations
{
  void *v2;
  char v3;

  -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGeneratingAnimations");

  return v3;
}

- (_UISheetInteraction)_sheetInteractionIfLoaded
{
  return self->__sheetInteraction;
}

- (BOOL)_isPresentedRemotely
{
  void *v2;
  BOOL v3;

  -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_UISheetPresentationControllerClientRemotePresentationDelegate)_clientRemotePresentationDelegate
{
  return (_UISheetPresentationControllerClientRemotePresentationDelegate *)objc_loadWeakRetained((id *)&self->__clientRemotePresentationDelegate);
}

- (id)_sheetMetrics
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UISheetPresentationController _sheetVisualStyle](self, "_sheetVisualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    _UIFallbackSheetMetrics();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (_UISheetPresentationControllerVisualStyling)_sheetVisualStyle
{
  return self->__sheetVisualStyle;
}

- (UIDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (_UIRemoteSheet)_connectedRemoteSheet
{
  return self->__connectedRemoteSheet;
}

- (UIDimmingView)_confinedDimmingView
{
  return self->__confinedDimmingView;
}

- (int64_t)_mode
{
  void *v2;
  int64_t v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_mode");

  return v3;
}

- (UIPanGestureRecognizer)_exteriorPanGestureRecognizer
{
  return self->__exteriorPanGestureRecognizer;
}

- (void)setFrameOfPresentedViewInContainerView:(CGRect)a3
{
  self->_frameOfPresentedViewInContainerView = a3;
}

- (BOOL)_forceSheetSemanticContext
{
  return self->__forceSheetSemanticContext;
}

- (void)_updateShouldPresentedViewControllerControlStatusBarAppearance
{
  id v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _setShouldPresentedViewControllerControlStatusBarAppearance:](self, "_setShouldPresentedViewControllerControlStatusBarAppearance:", objc_msgSend(v3, "_shouldPresentedViewControllerControlStatusBarAppearance"));

}

- (void)_setShouldPresentedViewControllerControlStatusBarAppearance:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  UIStatusBarStyleAnimationParameters *v7;
  id v8;

  if (self->__shouldPresentedViewControllerControlStatusBarAppearance != a3)
  {
    self->__shouldPresentedViewControllerControlStatusBarAppearance = a3;
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isAnyDescendantDragging");

    if (v5)
    {
      v7 = -[UIStatusBarStyleAnimationParameters initWithDefaultParameters]([UIStatusBarStyleAnimationParameters alloc], "initWithDefaultParameters");
      -[UIStatusBarAnimationParameters setSkipFencing:](v7, "setSkipFencing:", 1);
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setNeedsStatusBarAppearanceUpdateWithAnimationParameters:", v7);

    }
    else
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNeedsStatusBarAppearanceUpdate");

    }
  }
}

- (BOOL)_isRemoteDismissing
{
  return self->__remoteDismissing;
}

- (BOOL)_didTearOff
{
  return self->__didTearOff;
}

- (void)_sheetLayoutInfoLayout:(id)a3
{
  void *v4;

  -[UIPresentationController containerView](self, "containerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[UISheetPresentationController _sendPerformLayout](self, "_sendPerformLayout");
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  UIDropShadowView *v25;
  void *v26;
  UIDropShadowView *v27;
  UIDropShadowView *dropShadowView;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIPanGestureRecognizer *v42;
  UIPanGestureRecognizer *exteriorPanGestureRecognizer;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  NSObject *v58;
  BOOL IsEmpty;
  void *v60;
  BOOL v61;
  unint64_t v62;
  NSObject *v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint8_t v76[16];
  uint8_t buf[16];
  CGRect v78;
  CGRect v79;
  CGRect v80;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_backgroundColorForModalFormSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISheetPresentationController dimmingView](self, "dimmingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDimmingColor:", v6);

  -[UISheetPresentationController _confinedDimmingView](self, "_confinedDimmingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDimmingColor:", v6);

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9);

  if ((v10 & 1) == 0)
  {
    v11 = -[UISheetPresentationController _shouldDismissWhenTappedOutside](self, "_shouldDismissWhenTappedOutside") ^ 1;
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIgnoresTouches:", v11);

    -[UISheetPresentationController _confinedDimmingView](self, "_confinedDimmingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIgnoresTouches:", v11);

  }
  if (-[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation"))
    v14 = -[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely");
  else
    v14 = 1;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_UISheetPresentationControllerStylesSheetsAsCards(v15) & 1) == 0)
  {

    goto LABEL_17;
  }
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_17:
    v24 = 0;
    v23 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(v4, "screen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_displayCornerRadius");
    v20 = v19;

    v21 = 3;
    if (!v14)
      v21 = 1;
    v22 = 2;
    if (!v14)
      v22 = 0;
    if (v20 == 0.0)
      v23 = v22;
    else
      v23 = v21;
  }
  else
  {

    if (v14)
      v23 = 2;
    else
      v23 = 0;
  }
  v24 = v14;
LABEL_18:
  v25 = [UIDropShadowView alloc];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[UIDropShadowView initWithFrame:independentCorners:supportsShadow:stylesSheetsAsCards:](v25, "initWithFrame:independentCorners:supportsShadow:stylesSheetsAsCards:", v23, v24, _UISheetPresentationControllerStylesSheetsAsCards(v26), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dropShadowView = self->_dropShadowView;
  self->_dropShadowView = v27;

  -[UIDropShadowView set_delegate:](self->_dropShadowView, "set_delegate:", self);
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_setPresentingViewController:", v29);

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_setPresentedViewController:", v31);

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_setContainerView:", v3);

  -[UISheetPresentationController _parentSheetPresentationController](self, "_parentSheetPresentationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_layoutInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_setParentSheetLayoutInfo:", v35);

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_layoutInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_setChildSheetLayoutInfo:", v37);

  -[UISheetPresentationController _updateLayoutInfoContainerSafeAreaInsets](self, "_updateLayoutInfoContainerSafeAreaInsets");
  -[UISheetPresentationController _updateLayoutInfoContainerTraitCollection](self, "_updateLayoutInfoContainerTraitCollection");
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = _UISheetPresentationControllerStylesSheetsAsCards(v39);

  if ((_DWORD)v38)
  {
    if (((byte_1ECD7691C == 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_CardsDismissableWithGesture, (uint64_t)CFSTR("CardsDismissableWithGesture"))) == 0&& v14)
    {
      -[UISheetPresentationController dropShadowView](self, "dropShadowView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addInteraction:", v41);

      v42 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleExteriorPan_);
      exteriorPanGestureRecognizer = self->__exteriorPanGestureRecognizer;
      self->__exteriorPanGestureRecognizer = v42;

      -[UIGestureRecognizer setName:](self->__exteriorPanGestureRecognizer, "setName:", CFSTR("com.apple.UIKit.UISheetPresentationControllerExteriorPanGesture"));
      -[UIPanGestureRecognizer setDelegate:](self->__exteriorPanGestureRecognizer, "setDelegate:", self);
      objc_msgSend(v4, "addGestureRecognizer:", self->__exteriorPanGestureRecognizer);
      if (-[UISheetPresentationController _allowsTearOff](self, "_allowsTearOff"))
      {
        -[UISheetPresentationController _tearOffInteraction](self, "_tearOffInteraction");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          -[UISheetPresentationController dropShadowView](self, "dropShadowView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISheetPresentationController _tearOffInteraction](self, "_tearOffInteraction");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addInteraction:", v46);

        }
      }
    }
    -[UISheetPresentationController _expectedRemoteSheet](self, "_expectedRemoteSheet");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _tryToConnectToRemoteSheet:](self, "_tryToConnectToRemoteSheet:", v47);

  }
  objc_msgSend(v3, "layoutIfNeeded");
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_hostedFrameOfPresentedViewInContainerView");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[UISheetPresentationController presentedView](self, "presentedView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "_setFrameIgnoringLayerTransform:", v50, v52, v54, v56);

  LODWORD(v57) = os_variant_has_internal_diagnostics();
  -[UISheetPresentationController dropShadowView](self, "dropShadowView");
  v58 = objc_claimAutoreleasedReturnValue();
  -[NSObject bounds](v58, "bounds");
  IsEmpty = CGRectIsEmpty(v78);
  if ((_DWORD)v57)
  {
    if (IsEmpty)
    {
      -[UIPresentationController containerView](self, "containerView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bounds");
      v65 = CGRectIsEmpty(v80);

      if (v65)
        goto LABEL_41;
      __UIFaultDebugAssertLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v58, OS_LOG_TYPE_FAULT, "dropShadowView bounds should not be empty!", buf, 2u);
      }
    }
    goto LABEL_40;
  }
  if (!IsEmpty)
  {
LABEL_40:

    goto LABEL_41;
  }
  -[UIPresentationController containerView](self, "containerView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bounds");
  v61 = CGRectIsEmpty(v79);

  if (!v61)
  {
    v62 = presentationTransitionWillBegin___s_category_0;
    if (!presentationTransitionWillBegin___s_category_0)
    {
      v62 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v62, (unint64_t *)&presentationTransitionWillBegin___s_category_0);
    }
    v63 = *(NSObject **)(v62 + 8);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_185066000, v63, OS_LOG_TYPE_ERROR, "dropShadowView bounds should not be empty!", v76, 2u);
    }
  }
LABEL_41:
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v66)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setContentView:", v68);

    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setDropShadowView:", v70);

  }
  if (-[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation"))
  {
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setAutoresizingMask:", 18);

  }
  -[UISheetPresentationController _registerForKeyboardNotificationsIfNecessary](self, "_registerForKeyboardNotificationsIfNecessary");
  -[UISheetPresentationController _transitionWillBegin:](self, "_transitionWillBegin:", 1);
  -[UISheetPresentationController _presentationTransitionWillBegin](self, "_presentationTransitionWillBegin");
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v73;
  if (v73)
    (*(void (**)(uint64_t))(v73 + 16))(v73);
  -[UISheetPresentationController set_presentationTransitionWillBegin:](self, "set_presentationTransitionWillBegin:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "postNotificationName:object:", CFSTR("_UISheetWillAppearNotification"), 0);

}

- (_UISheetHostManager)_hostManager
{
  _UISheetHostManager *v3;
  _UISheetHostManager *hostManager;

  if (!self->__hostManager && !-[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation"))
  {
    +[UISheetPresentationController _platformHostManagerForController:](UISheetPresentationController, "_platformHostManagerForController:", self);
    v3 = (_UISheetHostManager *)objc_claimAutoreleasedReturnValue();
    hostManager = self->__hostManager;
    self->__hostManager = v3;

  }
  return self->__hostManager;
}

- (void)_updateLayoutInfoContainerSafeAreaInsets
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  -[UIPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIPresentationController containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "verticalSizeClass");

  if (v14 == 2)
  {
    -[UIPresentationController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:", 1);

    -[UIPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", v17);
    v22 = v21;

    v5 = fmax(v5, v22);
  }
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setContainerSafeAreaInsets:", v5, v7, v9, v11);

}

- (UIDropShadowView)dropShadowView
{
  return self->_dropShadowView;
}

- (void)_sheetLayoutInfoDidInvalidateOutput:(id)a3
{
  id v3;

  -[UIPresentationController containerView](self, "containerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_updateLayoutInfoContainerTraitCollection
{
  void *v3;
  void *v4;
  id v5;

  -[UIPresentationController containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setContainerTraitCollection:", v3);

}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setTransitioning:", 0);

}

- (void)_transitionWillBegin:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  BOOL v49;
  _QWORD v50[5];
  BOOL v51;
  _QWORD v52[5];
  BOOL v53;
  _QWORD v54[5];
  _QWORD v55[5];
  BOOL v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[6];

  v3 = a3;
  v59[4] = *MEMORY[0x1E0C80C00];
  -[UIPresentationController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setPresented:", v3);

    objc_msgSend(v6, "transitionWillBegin:", v3);
    goto LABEL_32;
  }
  if (!-[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation"))
  {
    -[UISheetPresentationController _parentSheetPresentationController](self, "_parentSheetPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (-[UIPresentationController presentedViewController](self, "presentedViewController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9),
          v9,
          v10))
    {
      if (!v3)
      {
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke;
        v57[3] = &unk_1E16B2150;
        v58 = v8;
        objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v57);
        v21 = v58;
        goto LABEL_11;
      }
      -[UISheetPresentationController _confinedDimmingView](self, "_confinedDimmingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dropShadowView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOverlayView:", v11);

    }
    else if (!v3)
    {
LABEL_12:

      goto LABEL_13;
    }
    -[UIPresentationController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    v37 = (void *)MEMORY[0x1E0D156E0];
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v42;
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v36;
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:multiplier:", v32, 3.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v31;
    -[UISheetPresentationController dimmingView](self, "dimmingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heightAnchor");
    v47 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController containerView](self, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v18, 3.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v20);

    v8 = v47;
    v21 = v46;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_UISheetPresentationControllerStylesSheetsAsCards(v22) & 1) != 0)
  {

LABEL_16:
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setTransitioning:", 1);

    v25 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_2;
    v55[3] = &unk_1E16BF900;
    v55[4] = self;
    v56 = v3;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_4;
    v54[3] = &unk_1E16B2150;
    v54[4] = self;
    if ((objc_msgSend(v5, "animateAlongsideTransition:completion:", v55, v54) & 1) == 0)
    {
      -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_setPresented:", v3);

    }
    v52[0] = v25;
    v52[1] = 3221225472;
    v52[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_5;
    v52[3] = &unk_1E16BF900;
    v52[4] = self;
    v53 = v3;
    objc_msgSend(v5, "notifyWhenInteractionChangesUsingBlock:", v52);
    goto LABEL_20;
  }
  v23 = -[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation");

  if (v23)
    goto LABEL_16;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_6;
  v50[3] = &unk_1E16BF900;
  v50[4] = self;
  v51 = v3;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_7;
  v48[3] = &unk_1E16BF900;
  v48[4] = self;
  v49 = v3;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v50, v48);
LABEL_20:
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = _UISheetPresentationControllerStylesSheetsAsCards(v27);

  if (v28)
  {
    if (-[UISheetPresentationController _isHosting](self, "_isHosting")
      && (-[UIPresentationController _transitioningFrom](self, "_transitioningFrom")
       || -[UIPresentationController dismissing](self, "dismissing")
       && !-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning"))
      && !-[UISheetPresentationController _dismissingHorizontallyAlongsideNavigationPop](self, "_dismissingHorizontallyAlongsideNavigationPop"))
    {
      -[UISheetPresentationController _tryToConnectToRemoteSheet:](self, "_tryToConnectToRemoteSheet:", 0);
      self->_wantsContentOverlayInsetsUpdatesWhileDismissing = 1;
      if (-[UIPresentationController dismissing](self, "dismissing"))
      {
        -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_layout");

        -[UISheetPresentationController _updatePresentedViewFrame](self, "_updatePresentedViewFrame");
      }
    }
    else if (-[UIPresentationController _transitioningTo](self, "_transitioningTo"))
    {
      -[UISheetPresentationController _expectedRemoteSheet](self, "_expectedRemoteSheet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISheetPresentationController _tryToConnectToRemoteSheet:](self, "_tryToConnectToRemoteSheet:", v29);

    }
  }
  if (!v3
    && (-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning")
     || -[UISheetPresentationController _isDimmingViewTapDismissing](self, "_isDimmingViewTapDismissing")))
  {
    -[UIPresentationController _sendDismissalsAsNeeded](self, "_sendDismissalsAsNeeded");
  }
LABEL_32:

}

- (BOOL)_isHosting
{
  void *v2;
  BOOL v3;

  -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_2(uint64_t a1, void *a2)
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
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_animationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "_isHosting") & 1) == 0)
  {
    objc_msgSend(v3, "sourceFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setDismissSourceFrame:", v5, v7, v9, v11);

  }
  v13 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  if (v13)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_3;
    v18[3] = &unk_1E16B1B28;
    v18[4] = *(_QWORD *)(a1 + 32);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);
  }
  if ((objc_msgSend(v17, "isInteractive") & 1) == 0)
  {
    v14 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setPresented:", v14);

  }
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_layout");

  }
}

- (_UISheetAnimationController)_animationController
{
  return self->__animationController;
}

- (UISheetPresentationController)_parentSheetPresentationController
{
  void *v3;
  uint64_t v4;
  int v5;
  id v6;

  -[UIPresentationController _parentPresentationController](self, "_parentPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      if ((objc_msgSend(v3, "_isPresentedInFullScreen") & 1) != 0)
        break;
      objc_msgSend(v3, "_parentPresentationController");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[UIPresentationController shouldPresentInFullscreen](self, "shouldPresentInFullscreen"),
        v5 == objc_msgSend(v3, "shouldPresentInFullscreen")))
  {
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return (UISheetPresentationController *)v6;
}

- (void)_tryToConnectToRemoteSheet:(id)a3
{
  id v4;
  void *v5;
  _UIRemoteSheet *v6;
  _UIRemoteSheet **p_connectedRemoteSheet;
  _UIRemoteSheet *connectedRemoteSheet;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UISheetPresentationController _expectedRemoteSheet](self, "_expectedRemoteSheet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v14)
  {

LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  v6 = (_UIRemoteSheet *)v14;
LABEL_5:
  p_connectedRemoteSheet = &self->__connectedRemoteSheet;
  connectedRemoteSheet = self->__connectedRemoteSheet;
  if (connectedRemoteSheet != v6)
  {
    if (connectedRemoteSheet)
    {
      +[_UISheetPresentationControllerConfiguration _fullScreenConfiguration](_UISheetPresentationControllerConfiguration, "_fullScreenConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIRemoteSheet _setSheetConfiguration:](*p_connectedRemoteSheet, "_setSheetConfiguration:", v9);

      -[_UIRemoteSheet _setViewClipsToBounds:](*p_connectedRemoteSheet, "_setViewClipsToBounds:", 1);
    }
    objc_storeStrong((id *)&self->__connectedRemoteSheet, v6);
    v10 = -[UISheetPresentationController _isHosting](self, "_isHosting");
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setHosting:", v10);

    if (*p_connectedRemoteSheet)
    {
      -[UISheetPresentationController _configuration](self, "_configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIRemoteSheet _setSheetConfiguration:](*p_connectedRemoteSheet, "_setSheetConfiguration:", v12);

      -[_UIRemoteSheet _setViewClipsToBounds:](*p_connectedRemoteSheet, "_setViewClipsToBounds:", 0);
    }
    -[UIPresentationController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "_sheetPresentationControllerDidChangeHosting:", self);

  }
}

- (_UIRemoteSheet)_expectedRemoteSheet
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !v3
    || (objc_msgSend(v2, "_containedRemoteViewController"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceSheetHosting, (uint64_t)CFSTR("ForceSheetHosting")) & 1) != 0|| !byte_1ECD7692C|| (v5 = objc_opt_class(), _UISheetPresentationControllerFindViewControllerOfClass(v2, v5), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = objc_opt_class();
      _UISheetPresentationControllerFindViewControllerOfClass(v2, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_remoteSheet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        if ((objc_opt_respondsToSelector() & v3) == 1)
        {
          objc_msgSend(v2, "_remoteSheet");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v4, "_allowsConnection"))
    v8 = 0;
  else
    v8 = v4;

  return (_UIRemoteSheet *)v8;
}

- (void)set_presentationTransitionWillBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)_presentationTransitionWillBegin
{
  return self->__presentationTransitionWillBegin;
}

- (void)_updatePresentedViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_hostedUntransformedFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UISheetPresentationController presentedView](self, "presentedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setFrameIgnoringLayerTransform:", v4, v6, v8, v10);

}

- (void)_containerViewBoundsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[UIPresentationController containerView](self, "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setContainerBounds:", v4, v6, v8, v10);

}

+ (id)_platformHostManagerForController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "objectForKey:", v7);

  if (v8)
  {
    objc_msgSend(v8, "managerForPresentationController:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_isDimmingViewTapDismissing
{
  return self->__dimmingViewTapDismissing;
}

- (BOOL)_allowsTearOff
{
  return self->__allowsTearOff;
}

- (void)executeTransitionCompletionBlock
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISheetPresentationController;
  -[UIPresentationController executeTransitionCompletionBlock](&v4, sel_executeTransitionCompletionBlock);
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "executeTransitionCompletionBlock");

}

- (int64_t)presentationStyle
{
  if (-[UISheetPresentationController _mode](self, "_mode"))
    return 2;
  else
    return 1;
}

- (UISheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  UISheetPresentationController *v4;
  _UISheetLayoutInfo *v5;
  void *v6;
  uint64_t v7;
  _UISheetLayoutInfo *layoutInfo;
  UIDimmingView *v9;
  UIDimmingView *dimmingView;
  UIDimmingView *v11;
  UIDimmingView *confinedDimmingView;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UISheetPresentationController;
  v4 = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    v5 = [_UISheetLayoutInfo alloc];
    -[UISheetPresentationController _sheetMetrics](v4, "_sheetMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UISheetLayoutInfo initWithMetrics:](v5, "initWithMetrics:", v6);
    layoutInfo = v4->__layoutInfo;
    v4->__layoutInfo = (_UISheetLayoutInfo *)v7;

    -[_UISheetLayoutInfo _setDelegate:](v4->__layoutInfo, "_setDelegate:", v4);
    -[_UISheetLayoutInfo _setAlwaysAllowsEdgeAttached:](v4->__layoutInfo, "_setAlwaysAllowsEdgeAttached:", -[UISheetPresentationController _isRootPresentation](v4, "_isRootPresentation"));
    v4->__allowsTearOff = (byte_1ECD76924 != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, (uint64_t)CFSTR("MakeAllSheetsTearable"));
    v9 = objc_alloc_init(UIDimmingView);
    dimmingView = v4->_dimmingView;
    v4->_dimmingView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_dimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDimmingView setSuppressesBackdrops:](v4->_dimmingView, "setSuppressesBackdrops:", 1);
    -[UIDimmingView setHitTestsAsOpaque:](v4->_dimmingView, "setHitTestsAsOpaque:", 0);
    -[UIDimmingView setDelegate:](v4->_dimmingView, "setDelegate:", v4);
    v11 = objc_alloc_init(UIDimmingView);
    confinedDimmingView = v4->__confinedDimmingView;
    v4->__confinedDimmingView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->__confinedDimmingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDimmingView setSuppressesBackdrops:](v4->__confinedDimmingView, "setSuppressesBackdrops:", 1);
    -[UIDimmingView setHitTestsAsOpaque:](v4->__confinedDimmingView, "setHitTestsAsOpaque:", 0);
    -[UIDimmingView setDelegate:](v4->__confinedDimmingView, "setDelegate:", v4);
    v4->__exteriorPanGestureEnabled = 1;
    -[UISheetPresentationController _setMode:](v4, "_setMode:", objc_msgSend((id)objc_opt_class(), "_initialMode"));
    -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](v4, "_setContainerIgnoresDirectTouchEvents:", 1);
    v4->__shouldPresentedViewControllerControlStatusBarAppearance = -[UISheetPresentationController _isRootPresentation](v4, "_isRootPresentation");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__accessibilityReduceMotionStatusDidChange, CFSTR("UIAccessibilityReduceMotionStatusDidChangeNotification"), 0);

  }
  return v4;
}

- (void)_setMode:(int64_t)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMode:", a3);

}

+ (int64_t)_initialMode
{
  void *v2;
  int64_t v3;

  _UIFallbackSheetMetrics();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultMode");

  return v3;
}

- (BOOL)_isDimmingAlwaysVisible
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  -[UISheetPresentationController _standardAppearance](self, "_standardAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isDimmingAlwaysVisible");

  -[UISheetPresentationController _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = 0;
  else
    v7 = v4;
  if (v5 && v4)
    v7 = objc_msgSend(v5, "_isDimmingAlwaysVisible");
  -[UISheetPresentationController _floatingAppearance](self, "_floatingAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = 0;
  else
    v10 = v7;
  if (v8 && v7)
    v10 = objc_msgSend(v8, "_isDimmingAlwaysVisible");

  return v10;
}

- (_UISheetPresentationControllerConfiguration)_configuration
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _UISheetPresentationControllerConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController detents](self, "detents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "_type"))
      {
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "resolvedValueInContext:", v3);
        +[UISheetPresentationControllerDetent _detentWithIdentifier:constant:](UISheetPresentationControllerDetent, "_detentWithIdentifier:constant:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, v6);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  v10 = objc_alloc_init(_UISheetPresentationControllerConfiguration);
  -[_UISheetPresentationControllerConfiguration _setPeeksWhenFloating:](v10, "_setPeeksWhenFloating:", -[UISheetPresentationController _peeksWhenFloating](self, "_peeksWhenFloating"));
  -[_UISheetPresentationControllerConfiguration _setWantsFullScreen:](v10, "_setWantsFullScreen:", -[UISheetPresentationController _wantsFullScreen](self, "_wantsFullScreen"));
  -[_UISheetPresentationControllerConfiguration _setWantsBottomAttached:](v10, "_setWantsBottomAttached:", -[UISheetPresentationController _wantsBottomAttached](self, "_wantsBottomAttached"));
  -[_UISheetPresentationControllerConfiguration _setWantsEdgeAttachedInCompactHeight:](v10, "_setWantsEdgeAttachedInCompactHeight:", -[UISheetPresentationController prefersEdgeAttachedInCompactHeight](self, "prefersEdgeAttachedInCompactHeight"));
  -[_UISheetPresentationControllerConfiguration _setWidthFollowsPreferredContentSizeWhenEdgeAttached:](v10, "_setWidthFollowsPreferredContentSizeWhenEdgeAttached:", -[UISheetPresentationController widthFollowsPreferredContentSizeWhenEdgeAttached](self, "widthFollowsPreferredContentSizeWhenEdgeAttached"));
  -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible:](v10, "_prefersGrabberVisible:", -[UISheetPresentationController prefersGrabberVisible](self, "prefersGrabberVisible"));
  -[UISheetPresentationController _grabberTopSpacing](self, "_grabberTopSpacing");
  -[_UISheetPresentationControllerConfiguration _setGrabberTopSpacing:](v10, "_setGrabberTopSpacing:");
  -[UISheetPresentationController _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
  -[_UISheetPresentationControllerConfiguration _setAdditionalMinimumTopInset:](v10, "_setAdditionalMinimumTopInset:");
  -[_UISheetPresentationControllerConfiguration _setInsetsPresentedViewForGrabber:](v10, "_setInsetsPresentedViewForGrabber:", -[UISheetPresentationController _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber"));
  -[_UISheetPresentationControllerConfiguration _setMode:](v10, "_setMode:", -[UISheetPresentationController _mode](self, "_mode"));
  -[UISheetPresentationController _cornerRadiusForPresentationAndDismissal](self, "_cornerRadiusForPresentationAndDismissal");
  -[_UISheetPresentationControllerConfiguration _setCornerRadiusForPresentationAndDismissal:](v10, "_setCornerRadiusForPresentationAndDismissal:");
  -[UISheetPresentationController preferredCornerRadius](self, "preferredCornerRadius");
  -[_UISheetPresentationControllerConfiguration _setPreferredCornerRadius:](v10, "_setPreferredCornerRadius:");
  -[UISheetPresentationController _preferredShadowOpacity](self, "_preferredShadowOpacity");
  -[_UISheetPresentationControllerConfiguration _setPreferredShadowOpacity:](v10, "_setPreferredShadowOpacity:");
  -[UISheetPresentationController _shadowRadius](self, "_shadowRadius");
  -[_UISheetPresentationControllerConfiguration _setShadowRadius:](v10, "_setShadowRadius:");
  -[_UISheetPresentationControllerConfiguration _setDetents:](v10, "_setDetents:", v5);
  -[UISheetPresentationController selectedDetentIdentifier](self, "selectedDetentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetPresentationControllerConfiguration _setSelectedDetentIdentifier:](v10, "_setSelectedDetentIdentifier:", v11);

  -[UISheetPresentationController _standardAppearance](self, "_standardAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetPresentationControllerConfiguration _setStandardAppearance:](v10, "_setStandardAppearance:", v12);

  -[UISheetPresentationController _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetPresentationControllerConfiguration _setEdgeAttachedCompactHeightAppearance:](v10, "_setEdgeAttachedCompactHeightAppearance:", v13);

  -[UISheetPresentationController _floatingAppearance](self, "_floatingAppearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISheetPresentationControllerConfiguration _setFloatingAppearance:](v10, "_setFloatingAppearance:", v14);

  -[_UISheetPresentationControllerConfiguration _setDetentDirectionWhenFloating:](v10, "_setDetentDirectionWhenFloating:", -[UISheetPresentationController _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating"));
  -[_UISheetPresentationControllerConfiguration _setPrefersScrollingResizesWhenDetentDirectionIsDown:](v10, "_setPrefersScrollingResizesWhenDetentDirectionIsDown:", -[UISheetPresentationController _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"));
  -[_UISheetPresentationControllerConfiguration _setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:](v10, "_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:", -[UISheetPresentationController prefersScrollingExpandsWhenScrolledToEdge](self, "prefersScrollingExpandsWhenScrolledToEdge"));
  objc_msgSend(v3, "_parentLayoutInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UIActivityViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v15, "_depthLevel");
      -[_UISheetPresentationControllerConfiguration _setHostParentDepthLevel:](v10, "_setHostParentDepthLevel:");
      objc_msgSend(v15, "_stackAlignmentFrame");
      -[_UISheetPresentationControllerConfiguration _setHostParentStackAlignmentFrame:](v10, "_setHostParentStackAlignmentFrame:");
      objc_msgSend(v15, "_fullHeightUntransformedFrameForDepthLevel");
      -[_UISheetPresentationControllerConfiguration _setHostParentFullHeightUntransformedFrameForDepthLevel:](v10, "_setHostParentFullHeightUntransformedFrameForDepthLevel:");
    }
  }

  return v10;
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_standardAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_floatingAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_edgeAttachedCompactHeightAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_widthFollowsPreferredContentSizeWhenEdgeAttached");

  return v3;
}

- (UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_selectedDetentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISheetPresentationControllerDetentIdentifier)v3;
}

- (BOOL)prefersScrollingExpandsWhenScrolledToEdge
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge");

  return v3;
}

- (BOOL)prefersGrabberVisible
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsGrabber");

  return v3;
}

- (BOOL)prefersEdgeAttachedInCompactHeight
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsEdgeAttachedInCompactHeight");

  return v3;
}

- (CGFloat)preferredCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_preferredCornerRadius");
  v4 = v3;

  return v4;
}

- (NSArray)detents
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_detents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_wantsFullScreen
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsFullScreen");

  return v3;
}

- (BOOL)_wantsBottomAttached
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsEdgeAttached");

  return v3;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_prefersScrollingResizesWhenDetentDirectionIsDown");

  return v3;
}

- (BOOL)_peeksWhenFloating
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_peeksWhenFloating");

  return v3;
}

- (BOOL)_insetsPresentedViewForGrabber
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_insetsContentViewForGrabber");

  return v3;
}

- (double)_grabberTopSpacing
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_grabberSpacing");
  v4 = v3;

  return v4;
}

- (int64_t)_detentDirectionWhenFloating
{
  void *v2;
  int64_t v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsInvertedWhenFloating");

  return v3;
}

- (double)_cornerRadiusForPresentationAndDismissal
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissCornerRadius");
  v4 = v3;

  return v4;
}

- (double)_additionalMinimumTopInset
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_additionalMinimumTopInset");
  v4 = v3;

  return v4;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameOfPresentedViewInContainerView.origin.x;
  y = self->_frameOfPresentedViewInContainerView.origin.y;
  width = self->_frameOfPresentedViewInContainerView.size.width;
  height = self->_frameOfPresentedViewInContainerView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setShouldScaleDownBehindDescendantSheets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShouldScaleDownBehindDescendants:", v3);

}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_layout");

}

- (void)_containerViewScreenDidChangeToScreen:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UISheetPresentationController;
  v4 = a3;
  -[UIPresentationController _containerViewScreenDidChangeToScreen:](&v10, sel__containerViewScreenDidChangeToScreen_, v4);
  objc_msgSend(v4, "bounds", v10.receiver, v10.super_class);
  v6 = v5;
  v8 = v7;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setScreenSize:", v6, v8);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_invalidatePreferredSize");

  -[UISheetPresentationController _hostManagerIfLoaded](self, "_hostManagerIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "preferredContentSizeDidChange");
    v5 = v6;
  }

}

- (void)_setWantsFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsFullScreen:", v3);

}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sheetInteractionIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateIndexOfCurrentDetent");

}

- (void)_sheetLayoutInfoDidInvalidateDetentValues:(id)a3
{
  void *v4;

  -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateDetents");

  -[UISheetPresentationController _sendDidInvalidateDetentValues](self, "_sendDidInvalidateDetentValues");
}

- (BOOL)_tucksIntoUnsafeAreaInCompactHeight
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_tucksIntoUnsafeAreaInCompactHeight");

  return v3;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  void *v2;
  char v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2) ^ 1;

  return v3;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[UISheetPresentationController _transitionDidEnd:completed:](self, "_transitionDidEnd:completed:", 1, a3);
  if (v3)
  {
    -[UIPresentationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();
    v6 = v9;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v9, "_sheetPresentationControllerViewForTouchContinuation:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend((id)UIApp, "_gestureEnvironment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v8, v7);

      }
      v6 = v9;
    }

  }
}

- (void)_transitionDidEnd:(BOOL)a3 completed:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[UISheetPresentationController _setAnimatedTransition:](self, "_setAnimatedTransition:", 0);
  -[UISheetPresentationController _setInteractiveTransition:](self, "_setInteractiveTransition:", 0);
  if (v4)
  {
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setGrabberLumaTrackingEnabled:", v5);

  }
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "transitionDidEnd:", v5);

}

- (void)_setInteractiveTransition:(id)a3
{
  objc_storeStrong((id *)&self->__interactionController, a3);
}

- (void)_setAnimatedTransition:(id)a3
{
  objc_storeStrong((id *)&self->__animationController, a3);
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning"))
  {
    -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "isEnabled"))
    {
      objc_msgSend(v4, "setEnabled:", 0);
      objc_msgSend(v4, "setEnabled:", 1);
    }
    -[UISheetPresentationController _exteriorPanGestureRecognizer](self, "_exteriorPanGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "isEnabled"))
    {
      objc_msgSend(v6, "setEnabled:", 0);
      objc_msgSend(v6, "setEnabled:", 1);
    }

  }
  -[UISheetPresentationController _transitionWillBegin:](self, "_transitionWillBegin:", 0);
}

- (BOOL)_isDraggingAndTransitioning
{
  return self->__draggingAndTransitioning;
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[UISheetPresentationController _transitionDidEnd:completed:](self, "_transitionDidEnd:completed:", 0, a3);
  if (v3)
  {
    -[UISheetPresentationController _setPresentsWithGesture:](self, "_setPresentsWithGesture:", 0);
    -[UISheetPresentationController _setOcclusionEnabled:](self, "_setOcclusionEnabled:", 0);
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDropShadowView:", 0);

    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentView:", 0);

    -[UISheetPresentationController _exteriorPanGestureRecognizer](self, "_exteriorPanGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v13, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeGestureRecognizer:", v13);

    }
    -[UISheetPresentationController _parentSheetPresentationController](self, "_parentSheetPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setParentSheetLayoutInfo:", 0);

    objc_msgSend(v8, "_layoutInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setChildSheetLayoutInfo:", 0);

    -[UISheetPresentationController _tryToConnectToRemoteSheet:](self, "_tryToConnectToRemoteSheet:", 0);
    self->_wantsContentOverlayInsetsUpdatesWhileDismissing = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("_UISheetDidDisappearNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

  }
}

- (void)_registerForKeyboardNotificationsIfNecessary
{
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  if (-[UISheetPresentationController _isRootPresentation](self, "_isRootPresentation"))
    v3 = !-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely");
  else
    v3 = 0;
  if (!-[UISheetPresentationController _hasRegisteredForKeyboardNotifications](self, "_hasRegisteredForKeyboardNotifications")&& (v3 & 1) == 0)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _UISheetPresentationControllerStylesSheetsAsCards(v4);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__keyboardAboutToShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__keyboardAboutToHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__keyboardAboutToChangeFrame_, CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), 0);
      -[UIPresentationController containerView](self, "containerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), v7);

      -[UISheetPresentationController _setHasRegisteredForKeyboardNotifications:](self, "_setHasRegisteredForKeyboardNotifications:", 1);
    }
  }
}

- (BOOL)_hasRegisteredForKeyboardNotifications
{
  return self->__hasRegisteredForKeyboardNotifications;
}

- (BOOL)_isRootPresentation
{
  return 0;
}

- (void)_setHasRegisteredForKeyboardNotifications:(BOOL)a3
{
  self->__hasRegisteredForKeyboardNotifications = a3;
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4;
  _UISheetPresentationControllerVisualStyling *v5;
  _UISheetPresentationControllerVisualStyling *sheetVisualStyle;
  _UISheetPresentationControllerVisualStyling *v7;
  _UISheetPresentationControllerVisualStyling *v8;
  _UISheetPresentationControllerVisualStyling *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "styleForSheetPresentationController:", self);
  v5 = (_UISheetPresentationControllerVisualStyling *)objc_claimAutoreleasedReturnValue();
  sheetVisualStyle = self->__sheetVisualStyle;
  self->__sheetVisualStyle = v5;

  v7 = self->__sheetVisualStyle;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISheetPresentationController;
    -[UIPresentationController _createVisualStyleForProvider:](&v11, sel__createVisualStyleForProvider_, v4);
    v8 = (_UISheetPresentationControllerVisualStyling *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutInfo, 0);
  objc_storeStrong(&self->__presentationTransitionWillBegin, 0);
  objc_destroyWeak((id *)&self->__clientRemotePresentationDelegate);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);
  objc_storeStrong((id *)&self->__exteriorPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__lastConfiguration, 0);
  objc_storeStrong((id *)&self->__connectedRemoteSheet, 0);
  objc_storeStrong((id *)&self->__tearOffActivity, 0);
  objc_storeStrong((id *)&self->__tearOffInteraction, 0);
  objc_storeStrong((id *)&self->__interactionController, 0);
  objc_storeStrong((id *)&self->__animationController, 0);
  objc_storeStrong((id *)&self->__confinedDimmingView, 0);
  objc_storeStrong((id *)&self->__sheetVisualStyle, 0);
  objc_storeStrong((id *)&self->__sheetInteraction, 0);
  objc_storeStrong((id *)&self->__hostManager, 0);
}

- (BOOL)_shouldPreserveFirstResponder
{
  void *v3;
  char v4;
  BOOL v5;

  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldPreserveFirstResponder");
  else
    v4 = -[UISheetPresentationController _isDimmingAlwaysVisible](self, "_isDimmingAlwaysVisible");
  v5 = v4;

  return v5;
}

- (id)_preferredInteractionControllerForTransition:(BOOL)a3 animator:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  UIPercentDrivenInteractiveTransition *v16;
  void *v17;
  uint64_t v19;
  id v20;
  id location;

  v5 = a4;
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _UISheetPresentationControllerStylesSheetsAsCards(v6);

  if (!v7)
  {
    v17 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UISheetPresentationController _setAnimatedTransition:](self, "_setAnimatedTransition:", v5);
    objc_initWeak(&location, self);
    v19 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v20, &location);
    -[UISheetPresentationController _animationController](self, "_animationController", v19, 3221225472, __87__UISheetPresentationController__preferredInteractionControllerForTransition_animator___block_invoke, &unk_1E16E5160);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDefaultSourceFrameProvider:", &v19);

    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachmentPoint");
    v11 = v10;
    v13 = v12;
    -[UISheetPresentationController _animationController](self, "_animationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttachmentPoint:", v11, v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  -[UISheetPresentationController _interactionController](self, "_interactionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_7;
  if (-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning"))
  {
    v16 = objc_alloc_init(UIPercentDrivenInteractiveTransition);
    -[UISheetPresentationController _setInteractiveTransition:](self, "_setInteractiveTransition:", v16);

    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWantsInteractiveStart:", 1);
LABEL_7:

  }
  -[UISheetPresentationController _interactionController](self, "_interactionController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

- (UIPercentDrivenInteractiveTransition)_interactionController
{
  return self->__interactionController;
}

- (id)_preferredInteractionControllerForPresentation:(id)a3
{
  return -[UISheetPresentationController _preferredInteractionControllerForTransition:animator:](self, "_preferredInteractionControllerForTransition:animator:", 1, a3);
}

- (id)_preferredAnimationControllerForTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  _UISheetAnimationController *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;
  objc_super v17;

  v3 = a3;
  -[UISheetPresentationController _hostManager](self, "_hostManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "preferredAnimationControllerForTransition:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (_UISheetAnimationController *)v7;
    goto LABEL_14;
  }
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9);

  if (!v10)
  {
    v8 = 0;
    goto LABEL_14;
  }
  if (!-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning"))
  {
    if (v3)
      -[UIPresentationController _preferredAnimationControllerForPresentation](&v17, sel__preferredAnimationControllerForPresentation, v16.receiver, v16.super_class, self, UISheetPresentationController);
    else
      -[UIPresentationController _preferredAnimationControllerForDismissal](&v16, sel__preferredAnimationControllerForDismissal, self, UISheetPresentationController, v17.receiver, v17.super_class);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  -[UISheetPresentationController _sheetVisualStyle](self, "_sheetVisualStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0
    || (-[UISheetPresentationController _sheetVisualStyle](self, "_sheetVisualStyle"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "preferredInteractiveAnimationControllerForSheetPresentation:", v3),
        v8 = (_UISheetAnimationController *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v8))
  {
    v8 = objc_alloc_init(_UISheetAnimationController);
  }
  -[_UISheetAnimationController setIsReversed:](v8, "setIsReversed:", v3 ^ 1);
  if (!v3)
  {
    -[UISheetPresentationController presentedView](self, "presentedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_frameIgnoringLayerTransform");
    -[_UISheetAnimationController setInteractiveFrame:](v8, "setInteractiveFrame:");

  }
  if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UISheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    -[_UISheetAnimationController setSourceFrame:](v8, "setSourceFrame:");
  }
LABEL_14:

  return v8;
}

- (id)_preferredAnimationControllerForPresentation
{
  return -[UISheetPresentationController _preferredAnimationControllerForTransition:](self, "_preferredAnimationControllerForTransition:", 1);
}

+ (void)_registerPlatformHostProvider:(Class)a3 forIdiom:(int64_t)a4
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
    __UISheetPresentationControllerIdiomsToPlatformHostProviderClasses = v8;

  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE0CF068) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UISheetPresentationController.m"), 391, CFSTR("platformHostProvider of type %@ does not conform to _UISheetHostManagerProvider."), v12);

  }
  v10 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", a3, v13);

}

- (void)_configureHostWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "_setOverrideParentTraitEnvironment:", self);
  objc_msgSend(v12, "_rootPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_forceSheetSemanticContext:", 1);

  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "_normalInheritedTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  objc_msgSend(v12, "makeKeyWindow");
}

- (void)_configureRootPresentationControllerForHostWindow:(id)a3
{
  id v3;

  objc_msgSend(a3, "_rootPresentationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_shouldDisableAppearanceCallbacksForPresentedViewController:", 1);

}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAdditionalMinimumTopInset:", a3);

}

- (int64_t)_horizontalAlignment
{
  void *v2;
  int64_t v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_horizontalAlignment");

  return v3;
}

- (void)_setHorizontalAlignment:(int64_t)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHorizontalAlignment:", a3);

}

- (double)_marginInCompactHeight
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_marginInCompactHeight");
  v4 = v3;

  return v4;
}

- (void)_setMarginInCompactHeight:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMarginInCompactHeight:", a3);

}

- (double)_marginInRegularWidthRegularHeight
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_marginInRegularWidthRegularHeight");
  v4 = v3;

  return v4;
}

- (void)_setMarginInRegularWidthRegularHeight:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMarginInRegularWidthRegularHeight:", a3);

}

- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTucksIntoUnsafeAreaInCompactHeight:", v3);

}

- (BOOL)_allowsAsymmetricVerticalMargins
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_allowsAsymmetricVerticalMargins");

  return v3;
}

- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAllowsAsymmetricVerticalMargins:", v3);

}

- (BOOL)_shouldScaleDownBehindDescendantSheets
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldScaleDownBehindDescendants");

  return v3;
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPeeksWhenFloating:", v3);

}

- (void)_accessibilityReduceMotionStatusDidChange
{
  _BOOL8 v3;
  id v4;

  v3 = _AXSReduceMotionEnabled() != 0;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setReduceMotionEnabled:", v3);

}

- (BOOL)_shouldAdjustDetentsToAvoidKeyboard
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldAdjustDetentsToAvoidKeyboard");

  return v3;
}

- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShouldAdjustDetentsToAvoidKeyboard:", v3);

}

- (void)_setWantsBottomAttached:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsEdgeAttached:", v3);

}

- (void)setPrefersEdgeAttachedInCompactHeight:(BOOL)prefersEdgeAttachedInCompactHeight
{
  _BOOL8 v3;
  id v4;

  v3 = prefersEdgeAttachedInCompactHeight;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsEdgeAttachedInCompactHeight:", v3);

}

- (BOOL)_wantsFloatingInRegularWidthCompactHeight
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsFloatingInRegularWidthCompactHeight");

  return v3;
}

- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsFloatingInRegularWidthCompactHeight:", v3);

}

- (void)setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached
{
  _BOOL8 v3;
  id v4;

  v3 = widthFollowsPreferredContentSizeWhenEdgeAttached;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWidthFollowsPreferredContentSizeWhenEdgeAttached:", v3);

}

- (void)setPrefersGrabberVisible:(BOOL)prefersGrabberVisible
{
  _BOOL8 v3;
  id v4;

  v3 = prefersGrabberVisible;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsGrabber:", v3);

}

- (void)_setGrabberTopSpacing:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setGrabberSpacing:", a3);

}

- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setInsetsContentViewForGrabber:", v3);

}

- (BOOL)_isGrabberBlurEnabled
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isGrabberBlurEnabled");

  return v3;
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setGrabberBlurEnabled:", v3);

}

- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDismissCornerRadius:", a3);

}

- (void)setPreferredCornerRadius:(CGFloat)preferredCornerRadius
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPreferredCornerRadius:", preferredCornerRadius);

}

- (double)_preferredShadowOpacity
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_preferredShadowOpacity");
  v4 = v3;

  return v4;
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPreferredShadowOpacity:", a3);

}

- (double)_shadowRadius
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_shadowRadius");
  v4 = v3;

  return v4;
}

- (void)_setShadowRadius:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShadowRadius:", a3);

}

- (void)setDetents:(NSArray *)detents
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;

  v8 = detents;
  if (-[NSArray count](v8, "count"))
  {
    v4 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "_createdWithDeprecatedInitializer"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.UIKit.deprecated-%lu"), v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setIdentifier:", v6);

      }
      ++v4;
    }
    while (v4 < -[NSArray count](v8, "count"));
  }
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDetents:", v8);

}

- (void)invalidateDetents
{
  id v2;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidateDetents");

}

- (void)setSelectedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier
{
  NSString *v4;
  id v5;

  v4 = selectedDetentIdentifier;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSelectedDetentIdentifier:", v4);

}

- (int64_t)_indexOfCurrentDetent
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UISheetPresentationController detents](self, "detents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController selectedDetentIdentifier](self, "selectedDetentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UISheetIndexOfDetentWithIdentifier(v3, v4, 0);

  return v5;
}

- (void)_setIndexOfCurrentDetent:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UISheetPresentationController detents](self, "detents");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController setSelectedDetentIdentifier:](self, "setSelectedDetentIdentifier:", v6);

}

- (void)_setStandardAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setStandardAppearance:", v4);

}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setEdgeAttachedCompactHeightAppearance:", v4);

}

- (void)_setFloatingAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setFloatingAppearance:", v4);

}

- (UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _standardAppearance](self, "_standardAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_largestUndimmedDetentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISheetPresentationControllerDetentIdentifier)v3;
}

- (void)setLargestUndimmedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier
{
  id v4;

  +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:](_UISheetPresentationControllerAppearance, "appearanceWithLargestUndimmedDetentIdentifier:", largestUndimmedDetentIdentifier);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _setStandardAppearance:](self, "_setStandardAppearance:", v4);

}

- (NSString)_largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[UISheetPresentationController _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_largestUndimmedDetentIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("com.apple.UIKit.unspecified");
  }

  return (NSString *)v4;
}

- (void)_setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:(id)a3
{
  __CFString *v4;
  int v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  v8 = v4;
  if (v4 == CFSTR("com.apple.UIKit.unspecified"))
    goto LABEL_4;
  if (!v4)
  {
    +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    -[UISheetPresentationController _setEdgeAttachedCompactHeightAppearance:](self, "_setEdgeAttachedCompactHeightAppearance:", v6);

    goto LABEL_8;
  }
  v5 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("com.apple.UIKit.unspecified"));

  if (!v5)
  {
    +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:](_UISheetPresentationControllerAppearance, "appearanceWithLargestUndimmedDetentIdentifier:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_4:
  -[UISheetPresentationController _setEdgeAttachedCompactHeightAppearance:](self, "_setEdgeAttachedCompactHeightAppearance:", 0);
LABEL_8:

}

- (NSString)_largestUndimmedDetentIdentifierWhenFloating
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[UISheetPresentationController _floatingAppearance](self, "_floatingAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_largestUndimmedDetentIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("com.apple.UIKit.unspecified");
  }

  return (NSString *)v4;
}

- (void)_setLargestUndimmedDetentIdentifierWhenFloating:(id)a3
{
  __CFString *v4;
  int v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  v8 = v4;
  if (v4 == CFSTR("com.apple.UIKit.unspecified"))
    goto LABEL_4;
  if (!v4)
  {
    +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;
    -[UISheetPresentationController _setFloatingAppearance:](self, "_setFloatingAppearance:", v6);

    goto LABEL_8;
  }
  v5 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("com.apple.UIKit.unspecified"));

  if (!v5)
  {
    +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:](_UISheetPresentationControllerAppearance, "appearanceWithLargestUndimmedDetentIdentifier:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_4:
  -[UISheetPresentationController _setFloatingAppearance:](self, "_setFloatingAppearance:", 0);
LABEL_8:

}

- (int64_t)_indexOfLastUndimmedDetent
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UISheetPresentationController detents](self, "detents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController largestUndimmedDetentIdentifier](self, "largestUndimmedDetentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _UISheetIndexOfDetentWithIdentifier(v3, v4, -1);

  return v5;
}

- (void)_setIndexOfLastUndimmedDetent:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3 == -1)
  {
    -[UISheetPresentationController setLargestUndimmedDetentIdentifier:](self, "setLargestUndimmedDetentIdentifier:", 0);
  }
  else
  {
    -[UISheetPresentationController detents](self, "detents");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController setLargestUndimmedDetentIdentifier:](self, "setLargestUndimmedDetentIdentifier:", v6);

  }
}

- (int64_t)_indexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  void *v7;
  void *v8;
  int64_t v9;

  -[UISheetPresentationController _largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight](self, "_largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("com.apple.UIKit.unspecified"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v3;
  if (v3)
  {
    v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("com.apple.UIKit.unspecified"));

    if ((v5 & 1) != 0)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  -[UISheetPresentationController detents](self, "detents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight](self, "_largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _UISheetIndexOfDetentWithIdentifier(v7, v8, -1);

  return v9;
}

- (void)_setIndexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight:(int64_t)a3
{
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = CFSTR("com.apple.UIKit.unspecified");
  }
  else if (a3 == -1)
  {
    v5 = 0;
  }
  else
  {
    -[UISheetPresentationController detents](self, "detents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_identifier");
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
  }
  v9 = (__CFString *)v5;
  -[UISheetPresentationController _setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:](self, "_setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:", v5);

}

- (int64_t)_indexOfLastUndimmedDetentWhenFloating
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  void *v7;
  void *v8;
  int64_t v9;

  -[UISheetPresentationController _largestUndimmedDetentIdentifierWhenFloating](self, "_largestUndimmedDetentIdentifierWhenFloating");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("com.apple.UIKit.unspecified"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v3;
  if (v3)
  {
    v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("com.apple.UIKit.unspecified"));

    if ((v5 & 1) != 0)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  -[UISheetPresentationController detents](self, "detents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _largestUndimmedDetentIdentifierWhenFloating](self, "_largestUndimmedDetentIdentifierWhenFloating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _UISheetIndexOfDetentWithIdentifier(v7, v8, -1);

  return v9;
}

- (void)_setIndexOfLastUndimmedDetentWhenFloating:(int64_t)a3
{
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = CFSTR("com.apple.UIKit.unspecified");
  }
  else if (a3 == -1)
  {
    v5 = 0;
  }
  else
  {
    -[UISheetPresentationController detents](self, "detents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_identifier");
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v5 = v8;
  }
  v9 = (__CFString *)v5;
  -[UISheetPresentationController _setLargestUndimmedDetentIdentifierWhenFloating:](self, "_setLargestUndimmedDetentIdentifierWhenFloating:", v5);

}

- (NSString)_sheetID
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sheetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setSheetID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSheetID:", v4);

}

- (NSString)_hiddenAncestorSheetID
{
  void *v2;
  void *v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hiddenAncestorSheetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setHiddenAncestorSheetID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHiddenAncestorSheetID:", v4);

}

- (BOOL)_isHidden
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHidden");

  return v3;
}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHidden:", v3);

}

- (BOOL)_presentsWithGesture
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_presentsWithGesture");

  return v3;
}

- (void)_setPresentsWithGesture:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPresentsWithGesture:", v3);

}

- (void)_setDetentDirectionWhenFloating:(int64_t)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3 == 1;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setWantsInvertedWhenFloating:", v3);

}

- (BOOL)_shouldDismissWhenTappedOutside
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldDismissWhenTappedOutside");

  return v3;
}

- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShouldDismissWhenTappedOutside:", v3);

}

- (BOOL)_allowsInteractiveDismissWhenFullScreen
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_allowsInteractiveDismissWhenFullScreen");

  return v3;
}

- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAllowsInteractiveDismissWhenFullScreen:", v3);

}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPrefersScrollingResizesWhenDetentDirectionIsDown:", v3);

}

- (void)setPrefersScrollingExpandsWhenScrolledToEdge:(BOOL)prefersScrollingExpandsWhenScrolledToEdge
{
  _BOOL8 v3;
  id v4;

  v3 = prefersScrollingExpandsWhenScrolledToEdge;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:", v3);

}

- (void)_realSourceViewGeometryDidChange
{
  void *v2;
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
  void *v14;
  id v15;

  -[UIPresentationController _realSourceView](self, "_realSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  if (v4)
  {
    objc_msgSend(v4, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v2, "convertRect:fromView:", v15);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setSourceFrame:", v6, v8, v10, v12);

  v14 = v15;
  if (v15)
  {

    v14 = v15;
  }

}

- (BOOL)prefersPageSizing
{
  return -[UISheetPresentationController _mode](self, "_mode") == 0;
}

- (void)setPrefersPageSizing:(BOOL)prefersPageSizing
{
  -[UISheetPresentationController _setMode:](self, "_setMode:", !prefersPageSizing);
}

- (double)_velocity
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVelocity");
  v4 = v3;

  return v4;
}

- (void)_setConfiguration:(id)a3
{
  id *p_lastConfiguration;
  _UISheetPresentationControllerConfiguration *lastConfiguration;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  char v64;
  uint64_t v65;
  int v66;
  int v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  id v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v116 = a3;
  p_lastConfiguration = (id *)&self->__lastConfiguration;
  lastConfiguration = self->__lastConfiguration;
  if (!lastConfiguration
    || (v7 = -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](lastConfiguration, "_peeksWhenFloating"),
        v7 != objc_msgSend(v116, "_peeksWhenFloating")))
  {
    -[UISheetPresentationController _setPeeksWhenFloating:](self, "_setPeeksWhenFloating:", objc_msgSend(v116, "_peeksWhenFloating"));
  }
  if (!*p_lastConfiguration
    || (v8 = objc_msgSend(*p_lastConfiguration, "_wantsFullScreen"),
        v8 != objc_msgSend(v116, "_wantsFullScreen")))
  {
    -[UISheetPresentationController _setWantsFullScreen:](self, "_setWantsFullScreen:", objc_msgSend(v116, "_wantsFullScreen"));
  }
  if (!*p_lastConfiguration
    || (v9 = objc_msgSend(*p_lastConfiguration, "_wantsBottomAttached"),
        v9 != objc_msgSend(v116, "_wantsBottomAttached")))
  {
    v10 = objc_msgSend(v116, "_wantsBottomAttached");
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setWantsEdgeAttached:", v10);

  }
  if (!*p_lastConfiguration
    || (v12 = objc_msgSend(*p_lastConfiguration, "_wantsEdgeAttachedInCompactHeight"),
        v12 != objc_msgSend(v116, "_wantsEdgeAttachedInCompactHeight")))
  {
    -[UISheetPresentationController setPrefersEdgeAttachedInCompactHeight:](self, "setPrefersEdgeAttachedInCompactHeight:", objc_msgSend(v116, "_wantsEdgeAttachedInCompactHeight"));
  }
  if (!*p_lastConfiguration
    || (v13 = objc_msgSend(*p_lastConfiguration, "_widthFollowsPreferredContentSizeWhenEdgeAttached"),
        v13 != objc_msgSend(v116, "_widthFollowsPreferredContentSizeWhenEdgeAttached")))
  {
    -[UISheetPresentationController setWidthFollowsPreferredContentSizeWhenEdgeAttached:](self, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", objc_msgSend(v116, "_widthFollowsPreferredContentSizeWhenEdgeAttached"));
  }
  if (!*p_lastConfiguration
    || (v14 = objc_msgSend(*p_lastConfiguration, "_prefersGrabberVisible"),
        v14 != objc_msgSend(v116, "_prefersGrabberVisible")))
  {
    -[UISheetPresentationController setPrefersGrabberVisible:](self, "setPrefersGrabberVisible:", objc_msgSend(v116, "_prefersGrabberVisible"));
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_grabberTopSpacing"),
        v16 = v15,
        objc_msgSend(v116, "_grabberTopSpacing"),
        v16 != v17))
  {
    objc_msgSend(v116, "_grabberTopSpacing");
    -[UISheetPresentationController _setGrabberTopSpacing:](self, "_setGrabberTopSpacing:");
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_additionalMinimumTopInset"),
        v19 = v18,
        objc_msgSend(v116, "_additionalMinimumTopInset"),
        v19 != v20))
  {
    objc_msgSend(v116, "_additionalMinimumTopInset");
    -[UISheetPresentationController _setAdditionalMinimumTopInset:](self, "_setAdditionalMinimumTopInset:");
  }
  if (!*p_lastConfiguration
    || (v21 = objc_msgSend(*p_lastConfiguration, "_insetsPresentedViewForGrabber"),
        v21 != objc_msgSend(v116, "_insetsPresentedViewForGrabber")))
  {
    -[UISheetPresentationController _setInsetsPresentedViewForGrabber:](self, "_setInsetsPresentedViewForGrabber:", objc_msgSend(v116, "_insetsPresentedViewForGrabber"));
  }
  if (!*p_lastConfiguration || (v22 = objc_msgSend(*p_lastConfiguration, "_mode"), v22 != objc_msgSend(v116, "_mode")))
    -[UISheetPresentationController _setMode:](self, "_setMode:", objc_msgSend(v116, "_mode"));
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_cornerRadiusForPresentationAndDismissal"),
        v24 = v23,
        objc_msgSend(v116, "_cornerRadiusForPresentationAndDismissal"),
        v24 != v25))
  {
    objc_msgSend(v116, "_cornerRadiusForPresentationAndDismissal");
    -[UISheetPresentationController _setCornerRadiusForPresentationAndDismissal:](self, "_setCornerRadiusForPresentationAndDismissal:");
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_preferredCornerRadius"),
        v27 = v26,
        objc_msgSend(v116, "_preferredCornerRadius"),
        v27 != v28))
  {
    objc_msgSend(v116, "_preferredCornerRadius");
    -[UISheetPresentationController setPreferredCornerRadius:](self, "setPreferredCornerRadius:");
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_preferredShadowOpacity"),
        v30 = v29,
        objc_msgSend(v116, "_preferredShadowOpacity"),
        v30 != v31))
  {
    objc_msgSend(v116, "_preferredShadowOpacity");
    -[UISheetPresentationController _setPreferredShadowOpacity:](self, "_setPreferredShadowOpacity:");
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_shadowRadius"), v33 = v32, objc_msgSend(v116, "_shadowRadius"), v33 != v34))
  {
    objc_msgSend(v116, "_shadowRadius");
    -[UISheetPresentationController _setShadowRadius:](self, "_setShadowRadius:");
  }
  if (!*p_lastConfiguration)
  {
LABEL_51:
    objc_msgSend(v116, "_detents");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController setDetents:](self, "setDetents:", v37);
    goto LABEL_52;
  }
  objc_msgSend(*p_lastConfiguration, "_detents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_detents");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v35;
  v38 = v36;
  if (v37 != v38)
  {
    v39 = v38;
    if (v37 && v38)
    {
      v40 = objc_msgSend(v37, "isEqual:", v38);

      if ((v40 & 1) != 0)
        goto LABEL_53;
    }
    else
    {

    }
    goto LABEL_51;
  }

LABEL_52:
LABEL_53:
  if (!*p_lastConfiguration)
    goto LABEL_61;
  objc_msgSend(*p_lastConfiguration, "_selectedDetentIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_selectedDetentIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v41;
  v44 = v42;
  if (v43 == v44)
  {

LABEL_62:
    goto LABEL_63;
  }
  v45 = v44;
  if (!v43 || !v44)
  {

    goto LABEL_61;
  }
  v46 = objc_msgSend(v43, "isEqual:", v44);

  if ((v46 & 1) == 0)
  {
LABEL_61:
    objc_msgSend(v116, "_selectedDetentIdentifier");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController setSelectedDetentIdentifier:](self, "setSelectedDetentIdentifier:", v43);
    goto LABEL_62;
  }
LABEL_63:
  if (!*p_lastConfiguration)
  {
LABEL_71:
    objc_msgSend(v116, "_standardAppearance");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _setStandardAppearance:](self, "_setStandardAppearance:", v49);
    goto LABEL_72;
  }
  objc_msgSend(*p_lastConfiguration, "_standardAppearance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_standardAppearance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v47;
  v50 = v48;
  if (v49 != v50)
  {
    v51 = v50;
    if (v49 && v50)
    {
      v52 = objc_msgSend(v49, "isEqual:", v50);

      if ((v52 & 1) != 0)
        goto LABEL_73;
    }
    else
    {

    }
    goto LABEL_71;
  }

LABEL_72:
LABEL_73:
  if (!*p_lastConfiguration)
    goto LABEL_81;
  objc_msgSend(*p_lastConfiguration, "_edgeAttachedCompactHeightAppearance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_edgeAttachedCompactHeightAppearance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53;
  v56 = v54;
  if (v55 == v56)
  {

LABEL_82:
    goto LABEL_83;
  }
  v57 = v56;
  if (!v55 || !v56)
  {

    goto LABEL_81;
  }
  v58 = objc_msgSend(v55, "isEqual:", v56);

  if ((v58 & 1) == 0)
  {
LABEL_81:
    objc_msgSend(v116, "_edgeAttachedCompactHeightAppearance");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _setEdgeAttachedCompactHeightAppearance:](self, "_setEdgeAttachedCompactHeightAppearance:", v55);
    goto LABEL_82;
  }
LABEL_83:
  if (!*p_lastConfiguration)
  {
LABEL_91:
    objc_msgSend(v116, "_floatingAppearance");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _setFloatingAppearance:](self, "_setFloatingAppearance:", v61);
    goto LABEL_92;
  }
  objc_msgSend(*p_lastConfiguration, "_floatingAppearance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "_floatingAppearance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v59;
  v62 = v60;
  if (v61 != v62)
  {
    v63 = v62;
    if (v61 && v62)
    {
      v64 = objc_msgSend(v61, "isEqual:", v62);

      if ((v64 & 1) != 0)
        goto LABEL_93;
    }
    else
    {

    }
    goto LABEL_91;
  }

LABEL_92:
LABEL_93:
  if (!*p_lastConfiguration
    || (v65 = objc_msgSend(*p_lastConfiguration, "_detentDirectionWhenFloating"),
        v65 != objc_msgSend(v116, "_detentDirectionWhenFloating")))
  {
    -[UISheetPresentationController _setDetentDirectionWhenFloating:](self, "_setDetentDirectionWhenFloating:", objc_msgSend(v116, "_detentDirectionWhenFloating"));
  }
  if (!*p_lastConfiguration
    || (v66 = objc_msgSend(*p_lastConfiguration, "_prefersScrollingResizesWhenDetentDirectionIsDown"),
        v66 != objc_msgSend(v116, "_prefersScrollingResizesWhenDetentDirectionIsDown")))
  {
    -[UISheetPresentationController _setPrefersScrollingResizesWhenDetentDirectionIsDown:](self, "_setPrefersScrollingResizesWhenDetentDirectionIsDown:", objc_msgSend(v116, "_prefersScrollingResizesWhenDetentDirectionIsDown"));
  }
  if (!*p_lastConfiguration
    || (v67 = objc_msgSend(*p_lastConfiguration, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"),
        v67 != objc_msgSend(v116, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge")))
  {
    -[UISheetPresentationController setPrefersScrollingExpandsWhenScrolledToEdge:](self, "setPrefersScrollingExpandsWhenScrolledToEdge:", objc_msgSend(v116, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
  }
  if (!*p_lastConfiguration
    || (objc_msgSend(*p_lastConfiguration, "_hostParentDepthLevel"),
        v69 = v68,
        objc_msgSend(v116, "_hostParentDepthLevel"),
        v69 != v70))
  {
    objc_msgSend(v116, "_hostParentDepthLevel");
    v72 = v71;
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "_setHostParentDepthLevel:", v72);

  }
  if (!*p_lastConfiguration)
    goto LABEL_107;
  objc_msgSend(*p_lastConfiguration, "_hostParentStackAlignmentFrame");
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v81 = v80;
  objc_msgSend(v116, "_hostParentStackAlignmentFrame");
  v119.origin.x = v82;
  v119.origin.y = v83;
  v119.size.width = v84;
  v119.size.height = v85;
  v117.origin.x = v75;
  v117.origin.y = v77;
  v117.size.width = v79;
  v117.size.height = v81;
  if (!CGRectEqualToRect(v117, v119))
  {
LABEL_107:
    objc_msgSend(v116, "_hostParentStackAlignmentFrame");
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v93 = v92;
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "_setHostParentStackAlignmentFrame:", v87, v89, v91, v93);

  }
  if (!*p_lastConfiguration)
    goto LABEL_110;
  objc_msgSend(*p_lastConfiguration, "_hostParentFullHeightUntransformedFrameForDepthLevel");
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v102 = v101;
  objc_msgSend(v116, "_hostParentFullHeightUntransformedFrameForDepthLevel");
  v120.origin.x = v103;
  v120.origin.y = v104;
  v120.size.width = v105;
  v120.size.height = v106;
  v118.origin.x = v96;
  v118.origin.y = v98;
  v118.size.width = v100;
  v118.size.height = v102;
  if (!CGRectEqualToRect(v118, v120))
  {
LABEL_110:
    objc_msgSend(v116, "_hostParentFullHeightUntransformedFrameForDepthLevel");
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v114 = v113;
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "_setHostParentFullHeightUntransformedFrameForDepthLevel:", v108, v110, v112, v114);

  }
  objc_storeStrong(p_lastConfiguration, a3);

}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISheetPresentationController;
  -[UIPresentationController _prepareForWindowDeallocRecursively:](&v4, sel__prepareForWindowDeallocRecursively_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UISheetHostManager tearDownSheet](self->__hostManager, "tearDownSheet");
}

- (void)animateChanges:(void *)changes
{
  -[UISheetPresentationController _animateChanges:completion:](self, "_animateChanges:completion:", changes, 0);
}

- (void)_animateChanges:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__UISheetPresentationController__animateChanges_completion___block_invoke;
  v8[3] = &unk_1E16B1D18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  _UISheetAnimateWithCompletion(v8, a4);

}

void __60__UISheetPresentationController__animateChanges_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  float minimum;
  float maximum;
  float preferred;
  double v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CAFrameRateRange v14;

  objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_indexOfCurrentActiveDetent");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = v3 != objc_msgSend(v2, "_indexOfCurrentActiveDetent");
  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__UISheetPresentationController__animateChanges_completion___block_invoke_2;
  v12[3] = &unk_1E16B1B28;
  v13 = v2;
  v11 = v2;
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  +[UIView _conditionallyModifyAnimations:withPreferredFrameRateRange:updateReason:animations:](UIView, "_conditionallyModifyAnimations:withPreferredFrameRateRange:updateReason:animations:", v4, 1048612, v12, v8, v9, v10);

}

uint64_t __60__UISheetPresentationController__animateChanges_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layout");
}

- (BOOL)_isDragging
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDragging");

  return v3;
}

- (NSArray)_detentValues
{
  void *v2;
  void *v3;
  void *v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_detentValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (CGRect)_currentPresentedViewFrame
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_untransformedFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_occludedFrameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_frameOfPresentedViewInContainerView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_remoteKeyboardFrame
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteKeyboardFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_setRemoteKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setRemoteKeyboardFrame:", x, y, width, height);

}

- (BOOL)_remoteContainsFirstResponder
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_remoteContainsFirstResponder");

  return v3;
}

- (void)_setRemoteContainsFirstResponder:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRemoteContainsFirstResponder:", v3);

}

- (BOOL)_remoteFirstResponderRequiresKeyboard
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_remoteFirstResponderRequiresKeyboard");

  return v3;
}

- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRemoteFirstResponderRequiresKeyboard:", v3);

}

- (double)_remoteProposedDepthLevel
{
  void *v2;
  double v3;
  double v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteProposedDepthLevel");
  v4 = v3;

  return v4;
}

- (void)_setRemoteProposedDepthLevel:(double)a3
{
  id v4;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setRemoteProposedDepthLevel:", a3);

}

- (void)_setRemoteClientConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "containsFirstResponder");
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setRemoteContainsFirstResponder:", v5);

  v7 = objc_msgSend(v4, "firstResponderRequiresKeyboard");
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setRemoteFirstResponderRequiresKeyboard:", v7);

  objc_msgSend(v4, "keyboardFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setRemoteKeyboardFrame:", v10, v12, v14, v16);

  objc_msgSend(v4, "proposedDepthLevel");
  v19 = v18;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setRemoteProposedDepthLevel:", v19);

}

- (void)_setRemoteDismissing:(BOOL)a3
{
  id v3;

  if (self->__remoteDismissing != a3)
  {
    self->__remoteDismissing = a3;
    -[UIPresentationController containerView](self, "containerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)_resetRemoteDismissing
{
  id v3;

  -[UISheetPresentationController _setRemoteDismissing:](self, "_setRemoteDismissing:", 0);
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setPresented:", 1);

}

- (UISheetPresentationController)_childSheetPresentationController
{
  void *v2;
  uint64_t v3;
  id v4;

  -[UIPresentationController _childPresentationController](self, "_childPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      if ((objc_msgSend(v2, "_isPresentedInFullScreen") & 1) != 0)
        break;
      objc_msgSend(v2, "_childPresentationController");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;

  return (UISheetPresentationController *)v4;
}

- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return self->_wantsContentOverlayInsetsUpdatesWhileDismissing
      || -[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely");
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dropShadowView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverlayView:", 0);

  }
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_5(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isInteractive") & 1) == 0)
  {
    if (objc_msgSend(v6, "isCancelled"))
      v3 = *(_BYTE *)(a1 + 40) == 0;
    else
      v3 = *(_BYTE *)(a1 + 40) != 0;
    objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPresented:", v3);

    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_layout");

    }
  }

}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "display:", *(unsigned __int8 *)(a1 + 40));

}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dimmingView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "display:", *(_BYTE *)(a1 + 40) == 0);

  }
}

- (void)_dropShadowViewGrabberDidTriggerPrimaryAction:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UISheetPresentationController *v11;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "_grabberAction");
  if ((unint64_t)(v4 - 2) < 2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__UISheetPresentationController__dropShadowViewGrabberDidTriggerPrimaryAction___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v10 = v8;
    v11 = self;
    -[UISheetPresentationController animateChanges:](self, "animateChanges:", v9);

  }
  else if (v4 == 1)
  {
    -[UISheetPresentationController _dismissFromGrabberOrDimmingViewIfPossible](self, "_dismissFromGrabberOrDimmingViewIfPossible");
  }
  else if (!v4)
  {
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEditing:", 1);

  }
  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely"))
  {
    -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sheetGrabberDidTriggerPrimaryAction");

  }
}

uint64_t __79__UISheetPresentationController__dropShadowViewGrabberDidTriggerPrimaryAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_activeDetents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "_indexOfActiveDetentForTappingGrabber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setSelectedDetentIdentifier:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "_sendDidChangeSelectedDetentIdentifier");
}

- (void)_dismissFromGrabberOrDimmingViewIfPossible
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  UISheetPresentationController *v13;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "_indexOfActiveDimmingDetent");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || (v4 = v3 + 1, v3 + 1 >= objc_msgSend(v9, "_numberOfActiveNonDismissDetents")))
  {
    if (!-[UIPresentationController _shouldDismiss](self, "_shouldDismiss"))
      goto LABEL_13;
    v7 = 0;
LABEL_8:
    -[UISheetPresentationController _setDimmingViewTapDismissing:](self, "_setDimmingViewTapDismissing:", 1);
    if (dyld_program_sdk_at_least())
      -[UIPresentationController presentingViewController](self, "presentingViewController");
    else
      -[UIPresentationController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_12;
  }
  objc_msgSend(v9, "_activeDetents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIPresentationController _shouldDismiss](self, "_shouldDismiss"))
    goto LABEL_8;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__UISheetPresentationController__dismissFromGrabberOrDimmingViewIfPossible__block_invoke;
    v10[3] = &unk_1E16B47A8;
    v11 = v9;
    v12 = v7;
    v13 = self;
    -[UISheetPresentationController animateChanges:](self, "animateChanges:", v10);
    v8 = v11;
LABEL_12:

  }
LABEL_13:

}

uint64_t __75__UISheetPresentationController__dismissFromGrabberOrDimmingViewIfPossible__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setSelectedDetentIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_sendDidChangeSelectedDetentIdentifier");
}

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  void *v2;
  double v3;
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
  CGRect result;

  -[UISheetPresentationController dropShadowView](self, "dropShadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDimmingEnabled");

  return v3;
}

- (BOOL)_shouldDismissWithNavigationPop
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDimmingEnabled") ^ 1;

  return v3;
}

- (void)_setOcclusionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->__occlusionEnabled != a3)
  {
    v3 = a3;
    self->__occlusionEnabled = a3;
    -[UISheetPresentationController _sheetInteractionIfLoaded](self, "_sheetInteractionIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isGeneratingAnimations");

    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__UISheetPresentationController__setOcclusionEnabled___block_invoke;
      v7[3] = &unk_1E16B1B78;
      v7[4] = self;
      v8 = v3;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v7);
    }
    else
    {
      -[UIPresentationController _enableOcclusion:](self, "_enableOcclusion:", v3);
    }
  }
}

void __54__UISheetPresentationController__setOcclusionEnabled___block_invoke(uint64_t a1)
{
  UIViewPropertyAnimator *v2;
  void *v3;
  UIViewPropertyAnimator *v4;
  _QWORD v5[5];
  char v6;

  v2 = [UIViewPropertyAnimator alloc];
  _UISheetTransitionTimingCurve();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v2, "initWithDuration:timingParameters:", v3, 0.0);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UISheetPresentationController__setOcclusionEnabled___block_invoke_2;
  v5[3] = &unk_1E16B1B78;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  -[UIViewPropertyAnimator addAnimations:](v4, "addAnimations:", v5);
  -[UIViewPropertyAnimator startAnimation](v4, "startAnimation");

}

uint64_t __54__UISheetPresentationController__setOcclusionEnabled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableOcclusion:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;

  v4 = a4;
  v24 = a3;
  -[UIPresentationController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke;
  v29[3] = &unk_1E16B1B28;
  v9 = v7;
  v30 = v9;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
  if (v4)
  {
    v10 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    +[_UIKeyboardLayoutAlignmentView _endFrameForNotification:inView:](_UIKeyboardLayoutAlignmentView, "_endFrameForNotification:inView:", v24, v6);
  }
  objc_msgSend(v9, "_setKeyboardFrame:", v10, v11, v12, v13);
  objc_msgSend(v6, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_firstResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setFirstResponderRequiresKeyboard:", objc_msgSend(v15, "_requiresKeyboardWhenFirstResponder"));

  objc_msgSend(v24, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v24, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_2;
  v25[3] = &unk_1E16B4E70;
  v27 = v19;
  v28 = v22;
  v26 = v9;
  v23 = v9;
  +[UIView _performWithAnimation:](UIView, "_performWithAnimation:", v25);

}

uint64_t __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layout");
}

void __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_2(uint64_t a1)
{
  double v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(double *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48) << 16;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_3;
  v3[3] = &unk_1E16B1B28;
  v4 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v2, v3, 0, v1, 0.0);

}

uint64_t __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layout");
}

- (void)_keyboardAboutToShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    objc_msgSend(v11, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
    {
      -[UISheetPresentationController _setKeyboardShown:](self, "_setKeyboardShown:", 1);
      -[UISheetPresentationController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", v11, 0);
    }
  }

}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    if (-[UISheetPresentationController _isKeyboardShown](self, "_isKeyboardShown"))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasActiveKeyboardSuppressionAssertionsForReason:", CFSTR("com.apple.UIKit._UIRapidClickPresentationAssistant"));

      if ((v9 & 1) == 0)
        -[UISheetPresentationController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", v10, 0);
    }
  }

}

- (void)_keyboardAboutToHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    objc_msgSend(v13, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasActiveKeyboardSuppressionAssertionsForReason:", CFSTR("com.apple.UIKit._UIRapidClickPresentationAssistant"));

      if ((v12 & 1) == 0)
      {
        -[UISheetPresentationController _setKeyboardShown:](self, "_setKeyboardShown:", 0);
        -[UISheetPresentationController _handleKeyboardNotification:aboutToHide:](self, "_handleKeyboardNotification:aboutToHide:", v13, 1);
      }
    }
  }

}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[UIPresentationController presentedViewController](self, "presentedViewController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isAncestorOfFirstResponder");
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContainsFirstResponder:", v5);

}

- (BOOL)_allowsFocusInPresentingViewController
{
  void *v2;
  char v3;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isDimmingEnabled") ^ 1;

  return v3;
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rubberBandExtentBeyondMinimumOffset");
  v4 = v3;

  return v4;
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_rubberBandExtentBeyondMaximumOffset");
  v4 = v3;

  return v4;
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sheetInteractionIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateRubberBandExtentBeyondMinimumOffset");

}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sheetInteractionIfLoaded");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateRubberBandExtentBeyondMaximumOffset");

}

- (id)_preferredAnimationControllerForDismissal
{
  return -[UISheetPresentationController _preferredAnimationControllerForTransition:](self, "_preferredAnimationControllerForTransition:", 0);
}

- (id)_preferredInteractionControllerForDismissal:(id)a3
{
  return -[UISheetPresentationController _preferredInteractionControllerForTransition:animator:](self, "_preferredInteractionControllerForTransition:animator:", 0, a3);
}

double __87__UISheetPresentationController__preferredInteractionControllerForTransition_animator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostedDismissFrame");
  v4 = v3;

  return v4;
}

- (void)_updateAnimationController
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v3 = -[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely");
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_hostedUntransformedFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v3)
  {
    -[UISheetPresentationController presentedView](self, "presentedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setFrameIgnoringLayerTransform:", v5, v7, v9, v11);

  }
  else
  {
    -[UISheetPresentationController _animationController](self, "_animationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInteractiveFrame:", v5, v7, v9, v11);

    -[UISheetPresentationController _animationController](self, "_animationController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutTransitionViews");
  }

}

- (void)_startInteractiveTransitionWithProgress:(double)a3
{
  -[UISheetPresentationController _startInteractiveTransitionWithProgress:fromViewController:completion:](self, "_startInteractiveTransitionWithProgress:fromViewController:completion:", 0, 0, a3);
}

- (void)_startInteractiveTransitionWithProgress:(double)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  UISheetPresentationController *v16;
  id v17;

  v12 = a4;
  v8 = a5;
  -[UISheetPresentationController _setDraggingAndTransitioning:](self, "_setDraggingAndTransitioning:", 1);
  if (!-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UIPresentationController containerView](self, "containerView", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

  }
  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely", v12))
  {
    -[UISheetPresentationController _setRemoteDismissing:](self, "_setRemoteDismissing:", 1);
  }
  else
  {
    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UISheetPresentationController _interactionController](self, "_interactionController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pauseInteractiveTransition");

    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __103__UISheetPresentationController__startInteractiveTransitionWithProgress_fromViewController_completion___block_invoke;
      v14[3] = &unk_1E16BAD68;
      v15 = v13;
      v16 = self;
      v17 = v8;
      +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v14);

    }
  }
  -[UISheetPresentationController _updateInteractiveTransitionWithProgress:](self, "_updateInteractiveTransitionWithProgress:", a3);

}

void __103__UISheetPresentationController__startInteractiveTransitionWithProgress_fromViewController_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "presentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentViewController:animated:completion:");
  }
  else
  {
    objc_msgSend(v1, "presentingViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_updateInteractiveTransitionWithProgress:(double)a3
{
  id v5;

  -[UISheetPresentationController _updateAnimationController](self, "_updateAnimationController");
  if (!-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely"))
  {
    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateInteractiveTransition:", fmin(a3, 0.99));

  }
}

- (void)_completeInteractiveTransition:(BOOL)a3 duration:(double)a4 timingCurve:(id)a5
{
  _BOOL8 v6;
  id v8;
  _BOOL8 v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIViewPropertyAnimator *v22;
  void *v23;
  UIViewPropertyAnimator *v24;
  void (**v25)(_QWORD);
  void *v26;
  int v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];

  v6 = a3;
  v8 = a5;
  if (-[UIPresentationController presented](self, "presented")
    || (v9 = v6, -[UIPresentationController dismissing](self, "dismissing")))
  {
    v9 = v6 ^ 1;
  }
  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setPresented:", v9);

  -[UISheetPresentationController _setDraggingAndTransitioning:](self, "_setDraggingAndTransitioning:", 0);
  if (a4 != 0.0)
  {
    v11 = dyld_program_sdk_at_least() ^ 1 | v6;
    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "percentComplete");
    v14 = v13;

    if (v11)
      v14 = 1.0 - v14;
    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    v17 = v14 * v16;

    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompletionSpeed:", v17 / a4);

    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingCurve:", v8);

  }
  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely"))
  {
    if (!v6)
      -[UISheetPresentationController _setRemoteDismissing:](self, "_setRemoteDismissing:", 0);
  }
  else
  {
    -[UISheetPresentationController _interactionController](self, "_interactionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v6)
    {
      objc_msgSend(v20, "finishInteractiveTransition");

      v22 = [UIViewPropertyAnimator alloc];
      _UISheetTransitionTimingCurve();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v22, "initWithDuration:timingParameters:", v23, 0.0);

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke;
      v31[3] = &unk_1E16B1B28;
      v31[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v24, "addAnimations:", v31);
      -[UIViewPropertyAnimator startAnimation](v24, "startAnimation");

    }
    else
    {
      objc_msgSend(v20, "cancelInteractiveTransition");

    }
  }
  if (!-[UISheetPresentationController _didTearOff](self, "_didTearOff"))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke_2;
    v30[3] = &unk_1E16B1B28;
    v30[4] = self;
    v25 = (void (**)(_QWORD))_Block_copy(v30);
    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isDragging");

    if (v27)
    {
      v25[2](v25);
    }
    else
    {
      -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _UISheetTransitionSpringParametersHighSpeed(0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_animateWithParameters:animations:", v29, v25);

    }
  }

}

void __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_animationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "runNoninteractiveAnimationsIfPossible");

}

uint64_t __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_layoutInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isPresented");

  v4 = *(void **)(a1 + 32);
  if (!v3)
    return objc_msgSend(v4, "_updateAnimationController");
  objc_msgSend(v4, "_layoutInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");

  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentedViewFrame");
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sheetPresentationControllerDidChangeSelectedDetentIdentifier:", self);

}

- (void)_sendDidInvalidateDetentValues
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_sheetPresentationControllerDidInvalidateDetentValues:", self);

}

- (void)_sendDidInvalidateUntransformedFrame
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:", self);

}

- (void)_sendPerformLayout
{
  id v3;

  -[UIPresentationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_sheetPresentationControllerPerformLayout:", self);

}

- (BOOL)_shouldDismissByDragging
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (!v4 || ((*(_DWORD *)(v4 + 368) >> 1) & 3u) - 1 >= 2)
    && -[UIPresentationController _shouldDismiss](self, "_shouldDismiss");

  return v6;
}

- (BOOL)sheetInteractionShouldInteractWithQuicklyScrollingDescendentScrollView:(id)a3
{
  return !-[UISheetPresentationController _shouldDismissByDragging](self, "_shouldDismissByDragging", a3);
}

- (void)sheetInteraction:(id)a3 didChangeOffset:(CGPoint)a4
{
  double y;
  CGFloat x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  _BOOL4 v42;
  _BOOL4 v43;
  char v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  _BOOL8 v49;
  double v50;
  void *v51;
  uint64_t (*v52)(uint64_t);
  id v53;
  int v54;
  void (**v55)(_QWORD);
  void *v56;
  _QWORD v57[2];
  uint64_t (*v58)(uint64_t);
  void *v59;
  id v60;
  UISheetPresentationController *v61;
  _QWORD block[4];
  id v63;
  id location;
  _QWORD v65[5];
  _QWORD aBlock[8];
  char v67;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_msgSend(v7, "isDragging");
  v9 = objc_msgSend(v7, "indexOfCurrentDetent");

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isInverted");
  objc_msgSend(v10, "_activeDetents");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_smallestNonDismissDetentOffset");
  v13 = v12;
  v14 = objc_msgSend(v10, "_numberOfActiveNonDismissDetents");
  v15 = objc_msgSend(v10, "_isDragging");
  objc_msgSend(v10, "_setDragging:", v8);
  if (!v15 || (v8 & 1) != 0)
    goto LABEL_23;
  objc_msgSend(v10, "_setLatestUserChosenOffset:", y);
  if (v9 == v14)
  {
    if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
      v17 = objc_msgSend(v10, "_isDismissible");
    else
      v17 = -[UISheetPresentationController _shouldDismissByDragging](self, "_shouldDismissByDragging");
    v16 = v9;
    if ((v17 & 1) == 0)
      v16 = v9 - 1;
  }
  else
  {
    v16 = v9;
  }
  objc_msgSend(v56, "objectAtIndexedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "_adjustedIndexOfCurrentActiveDetentForContainedFirstResponder");

    if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 != v16)
    {
      -[UIPresentationController presentedViewController](self, "presentedViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endEditing:", 1);

    }
    objc_msgSend(v10, "_selectedDetentIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setSelectedDetentIdentifier:", v19);
    v25 = v24;
    v26 = v19;
    v27 = v26;
    if (v25 == v26)
    {

    }
    else
    {
      if (v25)
      {
        v28 = objc_msgSend(v25, "isEqual:", v26);

        if ((v28 & 1) != 0)
          goto LABEL_21;
      }
      else
      {

      }
      -[UISheetPresentationController _sendDidChangeSelectedDetentIdentifier](self, "_sendDidChangeSelectedDetentIdentifier");
    }
LABEL_21:

  }
LABEL_23:
  if ((_DWORD)v11)
    v29 = y < v13;
  else
    v29 = y > v13;
  if ((_DWORD)v8 && !-[UISheetPresentationController _didTearOff](self, "_didTearOff"))
  {
    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isUnconstrainedOffsetBeyondSideOrTopExtentInverted:", v11))
    {
      -[UISheetPresentationController _tearOffActivity](self, "_tearOffActivity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v32 != 0;

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }
  v33 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke;
  aBlock[3] = &unk_1E16E5188;
  aBlock[4] = self;
  v67 = v11;
  *(CGFloat *)&aBlock[5] = x;
  *(double *)&aBlock[6] = y;
  *(double *)&aBlock[7] = v13;
  v34 = _Block_copy(aBlock);
  v35 = v34;
  if (v30)
  {
    -[UIPresentationController containerView](self, "containerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "window");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", v37), "touchesForWindow:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "anyObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISheetPresentationController _tearOffInteraction](self, "_tearOffInteraction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v33;
    v65[1] = 3221225472;
    v65[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_2;
    v65[3] = &unk_1E16B3FD8;
    v65[4] = self;
    objc_msgSend(v40, "_immediatelyBeginDragWithTouch:completion:", v39, v65);

    goto LABEL_72;
  }
  v55 = (void (**)(_QWORD))v34;
  v41 = v8 & v29;
  v42 = -[UISheetPresentationController _didTearOff](self, "_didTearOff");
  v43 = -[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning");
  if (v42)
  {
    v44 = !v43 | v41;
    v35 = v55;
    if ((v44 & 1) != 0)
      goto LABEL_72;
    v45 = _UISheetTransitionDuration();
    _UISheetTransitionTimingCurve();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _completeInteractiveTransition:duration:timingCurve:](self, "_completeInteractiveTransition:duration:timingCurve:", 0, v46, v45);
LABEL_38:

    goto LABEL_72;
  }
  if (((v43 | v41 ^ 1) & 1) == 0
    && !-[UISheetPresentationController _didAttemptToStartDismiss](self, "_didAttemptToStartDismiss"))
  {
    if (!-[UISheetPresentationController _isHosting](self, "_isHosting"))
      objc_msgSend(v10, "_setDismissible:", -[UISheetPresentationController _shouldDismissByDragging](self, "_shouldDismissByDragging"));
    v35 = v55;
    if (objc_msgSend(v10, "_isDismissible"))
    {
      v55[2](v55);
      -[UISheetPresentationController _startInteractiveTransitionWithProgress:](self, "_startInteractiveTransitionWithProgress:");
      goto LABEL_72;
    }
    -[UISheetPresentationController _setDidAttemptToStartDismiss:](self, "_setDidAttemptToStartDismiss:", 1);
    -[UIPresentationController containerView](self, "containerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setNeedsLayout");
    goto LABEL_38;
  }
  if ((-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning") & v41) == 1)
  {
    v35 = v55;
    v55[2](v55);
    -[UISheetPresentationController _updateInteractiveTransitionWithProgress:](self, "_updateInteractiveTransitionWithProgress:");
    goto LABEL_72;
  }
  if (((!-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning") | v41) & 1) != 0)
  {
    v35 = v55;
    if (-[UISheetPresentationController _isDraggingAndTransitioning](self, "_isDraggingAndTransitioning"))
      goto LABEL_72;
    if (((v8 ^ 1 | v29) & 1) == 0)
      -[UISheetPresentationController _setDidAttemptToStartDismiss:](self, "_setDidAttemptToStartDismiss:", 0);
    if ((v8 & 1) == 0 && -[UISheetPresentationController _didAttemptToStartDismiss](self, "_didAttemptToStartDismiss"))
    {
      -[UISheetPresentationController _setDidAttemptToStartDismiss:](self, "_setDidAttemptToStartDismiss:", 0);
      if ((_DWORD)v11)
        v47 = v13 - y;
      else
        v47 = y - v13;
      if ((_DWORD)v11)
        objc_msgSend(v10, "_rubberBandExtentBeyondMinimumOffset");
      else
        objc_msgSend(v10, "_rubberBandExtentBeyondMaximumOffset");
      if (v47 > v48 * 0.25)
      {
        objc_initWeak(&location, self);
        block[0] = v33;
        block[1] = 3221225472;
        block[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_3;
        block[3] = &unk_1E16B3F40;
        objc_copyWeak(&v63, &location);
        dispatch_async(MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
      }
    }
    v57[0] = v33;
    v57[1] = 3221225472;
    v52 = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_4;
    v58 = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_4;
    v59 = &unk_1E16B1B50;
    v53 = v10;
    v60 = v53;
    v61 = self;
    v54 = -[UISheetPresentationController _didExpand](self, "_didExpand");
    if (v54 != objc_msgSend(v53, "_isExpanded"))
    {
      -[UISheetPresentationController _setDidExpand:](self, "_setDidExpand:", objc_msgSend(v53, "_isExpanded"));
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        _UISheetAnimateWithCompletion(v57, 0);
        goto LABEL_71;
      }
      v52 = v58;
    }
    v52((uint64_t)v57);
LABEL_71:
    v35 = v55;

    goto LABEL_72;
  }
  v49 = v9 != v14;
  if (-[UIPresentationController presented](self, "presented")
    || -[UIPresentationController dismissing](self, "dismissing"))
  {
    v49 = v9 == v14;
  }
  v50 = _UISheetTransitionDuration();
  _UISheetTransitionTimingCurve();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _completeInteractiveTransition:duration:timingCurve:](self, "_completeInteractiveTransition:duration:timingCurve:", v49, v51, v50);

  v35 = v55;
LABEL_72:

}

double __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v7 = _UISheetDismissOffset(*(unsigned __int8 *)(a1 + 64), v3, v4, v5, v6, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));

  v8 = (*(double *)(a1 + 48) - *(double *)(a1 + 56)) / (v7 - *(double *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 32), "presented") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "dismissing"))
  {
    return 1.0 - v8;
  }
  return v8;
}

void __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_setDidTearOff:", a2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  v4 = v5;
  if ((v3 & 1) != 0)
  {
    if (qword_1ECD7B690 != -1)
      dispatch_once(&qword_1ECD7B690, &__block_literal_global_1129);
    v4 = v5;
    if (!byte_1ECD7B681)
    {
      objc_msgSend(v5, "_sheetPresentationControllerDidTearOff:", *(_QWORD *)(a1 + 32));
      v4 = v5;
    }
  }

}

void __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendDidAttemptToDismiss");

}

uint64_t __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layout");
  return objc_msgSend(*(id *)(a1 + 40), "_updatePresentedViewFrame");
}

- (CGPoint)offsetForInterruptedAnimationInSheetInteraction:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double MaxY;
  double v24;
  CGPoint result;

  if (-[UISheetPresentationController _isHosting](self, "_isHosting", a3))
  {
    -[UISheetPresentationController _remoteInterruptedOffset](self, "_remoteInterruptedOffset");
  }
  else
  {
    -[UISheetPresentationController presentedView](self, "presentedView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_frameIgnoringLayerTransform");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[UISheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v16 = v8 - v15;
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_isInverted");
    v19 = v8;
    v20 = v10;
    v21 = v12;
    v22 = v14;
    if (v18)
      MaxY = CGRectGetMaxY(*(CGRect *)&v19);
    else
      MaxY = CGRectGetMinY(*(CGRect *)&v19);
    v24 = MaxY;

    v4 = v16;
    v5 = v24;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_sheetInteractionDraggingBegan:(id)a3 withRubberBandCoefficient:(double)a4
{
  _BOOL8 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely"))
  {
    v6 = -[UISheetPresentationController _shouldDismissByDragging](self, "_shouldDismissByDragging");
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setDismissible:", v6);

    -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController offsetForInterruptedAnimationInSheetInteraction:](self, "offsetForInterruptedAnimationInSheetInteraction:", v11);
    objc_msgSend(v8, "_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v6, a4, v9, v10);

  }
}

- (void)_sheetInteractionDraggingChanged:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  double v9;
  double v10;
  void *v12;
  id v13;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely", a3))
  {
    -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_sheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v6, objc_msgSend(v12, "_isDismissible"), v10, v9, x, y);

  }
}

- (void)_sheetInteractionDraggingEnded:(id)a3
{
  id v4;

  if (-[UISheetPresentationController _isPresentedRemotely](self, "_isPresentedRemotely", a3))
  {
    -[UISheetPresentationController _clientRemotePresentationDelegate](self, "_clientRemotePresentationDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sheetInteractionDraggingDidEnd");

  }
}

- (void)_setIsRemote:(BOOL)a3
{
  id v4;

  -[UIPresentationController presentedViewController](self, "presentedViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController _setClientRemotePresentationDelegate:](self, "_setClientRemotePresentationDelegate:", v4);

}

- (void)_setClientRemotePresentationDelegate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  if (obj)
  {
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[UISheetPresentationController dropShadowView](self, "dropShadowView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addInteraction:", v8);

    }
  }
  objc_storeWeak((id *)&self->__clientRemotePresentationDelegate, obj);
  -[UISheetPresentationController _registerForKeyboardNotificationsIfNecessary](self, "_registerForKeyboardNotificationsIfNecessary");

}

- (void)_remoteSheetGrabberDidTriggerPrimaryAction
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UISheetPresentationController _dropShadowViewGrabberDidTriggerPrimaryAction:](self, "_dropShadowViewGrabberDidTriggerPrimaryAction:");

    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
LABEL_8:

LABEL_9:
    return;
  }
  v4 = _remoteSheetGrabberDidTriggerPrimaryAction___s_category;
  if (!_remoteSheetGrabberDidTriggerPrimaryAction___s_category)
  {
    v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_remoteSheetGrabberDidTriggerPrimaryAction___s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    goto LABEL_8;
  }
}

- (void)_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y;
  double x;
  _BOOL8 v7;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setDismissible:", v7);

    -[UISheetPresentationController _setRemoteInterruptedOffset:](self, "_setRemoteInterruptedOffset:", x, y);
    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "draggingBeganFromSource:withRubberBandCoefficient:", self, a3);

    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v15;
    _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
LABEL_8:

LABEL_9:
    return;
  }
  v12 = _remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset____s_category;
  if (!_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset____s_category)
  {
    v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset____s_category);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v15;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    goto LABEL_8;
  }
}

- (void)_remoteSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  double v10;
  double v11;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setDismissible:", v6);

    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "draggingChangedInSource:withTranslation:velocity:animateChange:", self, v7, v11, v10, x, y);

    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v18;
    _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
LABEL_8:

LABEL_9:
    return;
  }
  v15 = _remoteSheetInteractionDraggingDidChangeWithTranslation_velocity_animateChange_dismissible____s_category;
  if (!_remoteSheetInteractionDraggingDidChangeWithTranslation_velocity_animateChange_dismissible____s_category)
  {
    v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v15, (unint64_t *)&_remoteSheetInteractionDraggingDidChangeWithTranslation_velocity_animateChange_dismissible____s_category);
  }
  v16 = *(NSObject **)(v15 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v18;
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    goto LABEL_8;
  }
}

- (void)_remoteSheetInteractionDraggingDidEnd
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
  {
    -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "draggingEndedInSource:", self);

    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
LABEL_8:

LABEL_9:
    return;
  }
  v4 = _remoteSheetInteractionDraggingDidEnd___s_category;
  if (!_remoteSheetInteractionDraggingDidEnd___s_category)
  {
    v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&_remoteSheetInteractionDraggingDidEnd___s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    goto LABEL_8;
  }
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  return self->__exteriorPanGestureRecognizer != a3
      || -[UISheetPresentationController _exteriorPanGestureRecognizerShouldBeginWithEvent:](self, "_exteriorPanGestureRecognizerShouldBeginWithEvent:", a4);
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  return self->__exteriorPanGestureRecognizer != a3
      || -[UISheetPresentationController _exteriorPanGestureRecognizerShouldBeginWithEvent:](self, "_exteriorPanGestureRecognizerShouldBeginWithEvent:", a4);
}

- (BOOL)_exteriorPanGestureRecognizerShouldBeginWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v7 = (objc_msgSend(v4, "type")
     || (objc_msgSend(v4, "allTouches"),
         v5 = objc_claimAutoreleasedReturnValue(),
         objc_msgSend((id)v5, "anyObject"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         (id)v5,
         LOBYTE(v5) = objc_msgSend(v6, "_isPointerTouch"),
         v6,
         (v5 & 1) == 0))
    && -[UISheetPresentationController _isExteriorPanGestureEnabled](self, "_isExteriorPanGestureEnabled");

  return v7;
}

- (BOOL)_exteriorPanGestureRecognizerShouldInteractWithView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  -[UISheetPresentationController dropShadowView](self, "dropShadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[UIPresentationController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIView _viewOrderRelativeToView:requireIntersection:](v4, v8, 0) != -2;

  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  void *v24;
  CGRect v25;
  CGRect v26;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_frameOfPresentedViewInContainerView");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  if (v9 < CGRectGetMinX(v25))
    goto LABEL_5;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (v9 > CGRectGetMaxX(v26))
    goto LABEL_5;
  v17 = objc_msgSend(v12, "_isInverted");
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  if (!v17)
  {
    if (v11 > CGRectGetMinY(*(CGRect *)&v18))
      goto LABEL_5;
LABEL_8:
    objc_msgSend(v6, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UISheetPresentationController _exteriorPanGestureRecognizerShouldInteractWithView:](self, "_exteriorPanGestureRecognizerShouldInteractWithView:", v24);

    goto LABEL_6;
  }
  if (v11 >= CGRectGetMaxY(*(CGRect *)&v18))
    goto LABEL_8;
LABEL_5:
  v22 = 0;
LABEL_6:

  return v22;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v5;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UISheetPresentationController _exteriorPanGestureRecognizerShouldInteractWithView:](self, "_exteriorPanGestureRecognizerShouldInteractWithView:", v5);

  return (char)self;
}

- (void)_handleExteriorPan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double MaxY;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  void *v31;
  char v32;
  void *v33;
  double MinY;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  char v40;
  void *v41;
  id v42;

  v42 = a3;
  objc_msgSend(v42, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "locationInView:", v4);
  v6 = v5;

  v7 = objc_msgSend(v42, "state");
  if ((unint64_t)(v7 - 3) < 2)
  {
    if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
    {
      -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
        goto LABEL_38;
      -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_sheetInteractionDraggingDidEnd");
    }
    else
    {
      -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "draggingEndedInSource:", v42);
    }

    goto LABEL_38;
  }
  if (v7 == 2)
  {
    -[UISheetPresentationController _layoutInfo](self, "_layoutInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_isInverted");
    objc_msgSend(v42, "_activeEventOfType:", 10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "_scrollType") == 1)
    {
      -[UISheetPresentationController _exteriorPanStartLocationY](self, "_exteriorPanStartLocationY");
      v17 = v6 - v16;
      if (!v13)
        goto LABEL_27;
    }
    else
    {
      objc_msgSend(v12, "_frameOfPresentedViewInContainerView");
      if (!v13)
      {
        MinY = CGRectGetMinY(*(CGRect *)&v18);
        -[UISheetPresentationController _exteriorDismissPadding](self, "_exteriorDismissPadding");
        v36 = MinY - v35;
        -[UISheetPresentationController _exteriorPanStartLocationY](self, "_exteriorPanStartLocationY");
        if (v36 >= v37)
          v37 = v36;
        v17 = v6 - v37;
LABEL_27:
        v26 = v42;
        if (v17 > 0.0)
          goto LABEL_28;
        goto LABEL_20;
      }
      MaxY = CGRectGetMaxY(*(CGRect *)&v18);
      -[UISheetPresentationController _exteriorDismissPadding](self, "_exteriorDismissPadding");
      v24 = MaxY + v23;
      -[UISheetPresentationController _exteriorPanStartLocationY](self, "_exteriorPanStartLocationY");
      if (v24 < v25)
        v25 = v24;
      v17 = v6 - v25;
    }
    v26 = v42;
    if (v17 < 0.0)
    {
LABEL_28:
      objc_msgSend(v26, "velocityInView:", 0);
      v28 = v38;
      v27 = 0.0;
LABEL_29:
      if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
      {
        -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_opt_respondsToSelector();

        if ((v40 & 1) == 0)
        {
LABEL_34:

          goto LABEL_38;
        }
        -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "_sheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:", 0, v27, v17, v27, v28);
      }
      else
      {
        -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "draggingChangedInSource:withTranslation:velocity:animateChange:", v42, 0, v27, v17, v27, v28);
      }

      goto LABEL_34;
    }
LABEL_20:
    v27 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v28 = v17;
    goto LABEL_29;
  }
  if (v7 == 1)
  {
    -[UIPresentationController _childPresentationController](self, "_childPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v42, "setEnabled:", 0);
      objc_msgSend(v42, "setEnabled:", 1);
      goto LABEL_38;
    }
    v29 = -[UIPanGestureRecognizer _scrollDeviceCategory](v42);
    v30 = _UIScrollViewRubberBandCoefficient(v29);
    if (-[UISheetPresentationController _isHosting](self, "_isHosting"))
    {
      -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_opt_respondsToSelector();

      if ((v32 & 1) == 0)
      {
LABEL_37:
        -[UISheetPresentationController set_exteriorPanStartLocationY:](self, "set_exteriorPanStartLocationY:", v6);
        goto LABEL_38;
      }
      -[UISheetPresentationController _connectedRemoteSheet](self, "_connectedRemoteSheet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:", v30);
    }
    else
    {
      -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "draggingBeganFromSource:withRubberBandCoefficient:", v42, v30);
    }

    goto LABEL_37;
  }
LABEL_38:

}

- (void)_hostSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
  id v5;

  -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggingBeganFromSource:withRubberBandCoefficient:", self, a3);

}

- (void)_hostSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "draggingChangedInSource:withTranslation:velocity:animateChange:", self, 0, v8, v7, x, y);

}

- (void)_hostSheetInteractionDraggingDidEnd
{
  id v3;

  -[UISheetPresentationController _sheetInteraction](self, "_sheetInteraction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "draggingEndedInSource:", self);

}

- (void)_setAllowsTearOff:(BOOL)a3
{
  UIDragInteraction *v4;
  UIDragInteraction *tearOffInteraction;
  void *v6;
  UIDragInteraction *v7;
  void *v8;

  if (self->__allowsTearOff != a3)
  {
    self->__allowsTearOff = a3;
    if (a3)
    {
      v4 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
      tearOffInteraction = self->__tearOffInteraction;
      self->__tearOffInteraction = v4;

      -[UIDragInteraction setEnabled:](self->__tearOffInteraction, "setEnabled:", 0);
      -[UISheetPresentationController dropShadowView](self, "dropShadowView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addInteraction:", self->__tearOffInteraction);

    }
    else
    {
      -[UISheetPresentationController dropShadowView](self, "dropShadowView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeInteraction:", self->__tearOffInteraction);

      v7 = self->__tearOffInteraction;
      self->__tearOffInteraction = 0;

    }
  }
}

- (BOOL)sheetInteraction:(id)a3 shouldBeginHorizontalRubberBandingWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *dropShadowView;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  char v20;
  void *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[UISheetPresentationController _setTearOffActivity:](self, "_setTearOffActivity:", 0);
  if (-[UISheetPresentationController _allowsTearOff](self, "_allowsTearOff")
    && _UISystemShellAllowsSceneRequests()
    && (-[UIGestureRecognizer _activeTouchesEvent](v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v7, "_allActiveTouches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "_isPointerTouch")
      || (dropShadowView = self->_dropShadowView,
          objc_msgSend(v10, "view"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(dropShadowView) = objc_msgSend(dropShadowView, "_isGrabber:", v11),
          v11,
          (_DWORD)dropShadowView))
    {
      objc_msgSend(v6, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationInView:", v13);
      v15 = v14;
      v17 = v16;

      -[UISheetPresentationController _setInitialTearOffPoint:](self, "_setInitialTearOffPoint:", v15, v17);
      if (v17 <= 60.0)
      {
        -[UIPresentationController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) != 0)
        {
          -[UIPresentationController delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_sheetPresentationControllerUserActivityForTearOff:", self);
        }
        else
        {
          -[UIPresentationController presentedViewController](self, "presentedViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "userActivity");
        }
        dropShadowView = (void *)objc_claimAutoreleasedReturnValue();

        if (dropShadowView
          || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, (uint64_t)CFSTR("MakeAllSheetsTearable")) & 1) == 0&& byte_1ECD76924&& (v22 = objc_alloc(MEMORY[0x1E0CB3B10]), (dropShadowView = (void *)objc_msgSend(v22, "initWithActivityType:", *MEMORY[0x1E0CB3418])) != 0))
        {
          -[UISheetPresentationController _setTearOffActivity:](self, "_setTearOffActivity:", dropShadowView);
          _UIInitializeDraggingSystem();

          LOBYTE(dropShadowView) = 1;
        }
      }
      else
      {
        LOBYTE(dropShadowView) = 0;
      }
    }

  }
  else
  {
    LOBYTE(dropShadowView) = 0;
  }

  return (char)dropShadowView;
}

- (BOOL)sheetInteraction:(id)a3 shouldAllowVerticalRubberBandingWithEvent:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  UIDropShadowView *dropShadowView;
  void *v10;

  v5 = a4;
  if (objc_msgSend(v5, "type"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v5, "allTouches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "_isPointerTouch"))
    {
      dropShadowView = self->_dropShadowView;
      objc_msgSend(v8, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UIDropShadowView _isGrabber:](dropShadowView, "_isGrabber:", v10);

    }
    else
    {
      v6 = 1;
    }

  }
  return v6;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  UIDraggingSystemSceneMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIDragItem *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB36C8]);
  -[UISheetPresentationController _tearOffActivity](self, "_tearOffActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObject:", v6);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__UISheetPresentationController_dragInteraction_itemsForBeginningSession___block_invoke;
  v16[3] = &unk_1E16B5178;
  v16[4] = self;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.uikit.scene"), 1, v16);
  v8 = objc_alloc_init(UIDraggingSystemSceneMetadata);
  -[UISheetPresentationController _tearOffActivity](self, "_tearOffActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDraggingSystemSceneMetadata setActivityType:](v8, "setActivityType:", v10);

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTeamData:", v11);

  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, (uint64_t)CFSTR("MakeAllSheetsTearable")) & 1) == 0&& byte_1ECD76924)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://apple.com"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObject:visibility:", v12, 0);

  }
  v13 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v7);
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __74__UISheetPresentationController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_tearOffActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", CFSTR("com.apple.uikit.scene"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v4;

  -[UISheetPresentationController dropShadowView](self, "dropShadowView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  void *v7;
  UIDragPreviewTarget *v8;
  void *v9;
  __int128 v10;
  UIDragPreviewTarget *v11;
  UITargetedDragPreview *v12;
  _OWORD v14[3];

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "_setPreviewMode:", 2);
  -[UIView bounds](self->_dropShadowView, "bounds");
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVisiblePath:", v7);

  v8 = [UIDragPreviewTarget alloc];
  -[UIView superview](self->_dropShadowView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView center](self->_dropShadowView, "center");
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v11 = -[UIPreviewTarget initWithContainer:center:transform:](v8, "initWithContainer:center:transform:", v9, v14);

  v12 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", self->_dropShadowView, v6, v11);
  -[UISheetPresentationController _initialTearOffPoint](self, "_initialTearOffPoint");
  -[UITargetedDragPreview setLiftAnchorPoint:](v12, "setLiftAnchorPoint:");

  return v12;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[UIPresentationController presentingViewController](self, "presentingViewController", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      -[UIPresentationController presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    -[UIPresentationController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();
    v11 = v13;
    if ((v10 & 1) != 0)
    {
      if (qword_1ECD7B690 != -1)
        dispatch_once(&qword_1ECD7B690, &__block_literal_global_1129);
      v11 = v13;
      if (byte_1ECD7B681)
      {
        objc_msgSend(v13, "_sheetPresentationControllerDidTearOff:", self);
        v11 = v13;
      }
    }

  }
  else
  {
    -[UISheetPresentationController _updatePresentedViewFrame](self, "_updatePresentedViewFrame", a3, a4);
    -[UISheetPresentationController dropShadowView](self, "dropShadowView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 1.0);

    -[UISheetPresentationController _setDidTearOff:](self, "_setDidTearOff:", 0);
  }
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__UISheetPresentationController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E16B42D0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

void __84__UISheetPresentationController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updatePresentedViewFrame");
  objc_msgSend(*(id *)(a1 + 32), "dropShadowView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  void *v6;
  UITargetedDragPreview *v7;
  void *v8;
  UIDragPreviewTarget *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIDragPreviewTarget *v15;
  UITargetedDragPreview *v16;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "_setPreviewMode:", 2);
  v7 = [UITargetedDragPreview alloc];
  -[UISheetPresentationController presentedView](self, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [UIDragPreviewTarget alloc];
  -[UIPresentationController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v15 = -[UIPreviewTarget initWithContainer:center:](v9, "initWithContainer:center:", v10, v12 + v11 * 0.5, v14 + v13 * 0.5);
  v16 = -[UITargetedDragPreview initWithView:parameters:target:](v7, "initWithView:parameters:target:", v8, v6, v15);

  return v16;
}

- (void)set_hostManager:(id)a3
{
  objc_storeStrong((id *)&self->__hostManager, a3);
}

- (void)_setDraggingAndTransitioning:(BOOL)a3
{
  self->__draggingAndTransitioning = a3;
}

- (BOOL)_didAttemptToStartDismiss
{
  return self->__didAttemptToStartDismiss;
}

- (void)_setDidAttemptToStartDismiss:(BOOL)a3
{
  self->__didAttemptToStartDismiss = a3;
}

- (UIDragInteraction)_tearOffInteraction
{
  return self->__tearOffInteraction;
}

- (void)_setDidTearOff:(BOOL)a3
{
  self->__didTearOff = a3;
}

- (BOOL)_didExpand
{
  return self->__didExpand;
}

- (void)_setDidExpand:(BOOL)a3
{
  self->__didExpand = a3;
}

- (CGPoint)_initialTearOffPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->__initialTearOffPoint.x;
  y = self->__initialTearOffPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInitialTearOffPoint:(CGPoint)a3
{
  self->__initialTearOffPoint = a3;
}

- (NSUserActivity)_tearOffActivity
{
  return self->__tearOffActivity;
}

- (void)_setTearOffActivity:(id)a3
{
  objc_storeStrong((id *)&self->__tearOffActivity, a3);
}

- (CGPoint)_remoteInterruptedOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__remoteInterruptedOffset.x;
  y = self->__remoteInterruptedOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setRemoteInterruptedOffset:(CGPoint)a3
{
  self->__remoteInterruptedOffset = a3;
}

- (void)_setDimmingViewTapDismissing:(BOOL)a3
{
  self->__dimmingViewTapDismissing = a3;
}

- (BOOL)_isKeyboardShown
{
  return self->__keyboardShown;
}

- (void)_setKeyboardShown:(BOOL)a3
{
  self->__keyboardShown = a3;
}

- (BOOL)_isOcclusionEnabled
{
  return self->__occlusionEnabled;
}

- (_UISheetPresentationControllerConfiguration)_lastConfiguration
{
  return self->__lastConfiguration;
}

- (double)_exteriorPanStartLocationY
{
  return self->__exteriorPanStartLocationY;
}

- (void)set_exteriorPanStartLocationY:(double)a3
{
  self->__exteriorPanStartLocationY = a3;
}

- (BOOL)_isExteriorPanGestureEnabled
{
  return self->__exteriorPanGestureEnabled;
}

- (void)_setExteriorPanGestureEnabled:(BOOL)a3
{
  self->__exteriorPanGestureEnabled = a3;
}

- (BOOL)_dismissingHorizontallyAlongsideNavigationPop
{
  return self->__dismissingHorizontallyAlongsideNavigationPop;
}

- (void)set_dismissingHorizontallyAlongsideNavigationPop:(BOOL)a3
{
  self->__dismissingHorizontallyAlongsideNavigationPop = a3;
}

- (void)set_forceSheetSemanticContext:(BOOL)a3
{
  self->__forceSheetSemanticContext = a3;
}

- (double)_exteriorDismissPadding
{
  return self->__exteriorDismissPadding;
}

- (void)_setExteriorDismissPadding:(double)a3
{
  self->__exteriorDismissPadding = a3;
}

@end
