@implementation SBCoverSheetPrimarySlidingViewController

- (void)loadView
{
  void *v3;
  SBCoverSheetPanelBackgroundContainerView *v4;
  SBCoverSheetPanelBackgroundContainerView *panelBackgroundContainerView;
  SBFTouchPassThroughView *v6;
  SBFTouchPassThroughView *parallaxClippingView;
  SBCoverSheetParallaxContainerView *v8;
  SBCoverSheetParallaxContainerView *parallaxContainerView;
  id v10;
  SBFTouchPassThroughView *v11;
  SBFTouchPassThroughView *unlockedContentOverlayView;
  SBFTouchPassThroughView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBGrabberTongue *v18;
  SBGrabberTongue *grabberTongue;
  SBGrabberTongue *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  NSObject *v29;
  double defaultPresentGestureEdgeRegionSize;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController loadView](&v35, sel_loadView);
  -[SBCoverSheetPrimarySlidingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBCoverSheetPanelBackgroundContainerView);
  panelBackgroundContainerView = self->_panelBackgroundContainerView;
  self->_panelBackgroundContainerView = v4;

  objc_msgSend(v3, "addSubview:", self->_panelBackgroundContainerView);
  objc_msgSend(v3, "sendSubviewToBack:", self->_panelBackgroundContainerView);
  v6 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E0DA9F28]);
  parallaxClippingView = self->_parallaxClippingView;
  self->_parallaxClippingView = v6;

  -[SBFTouchPassThroughView setClipsToBounds:](self->_parallaxClippingView, "setClipsToBounds:", 1);
  -[SBCoverSheetPanelBackgroundContainerView addSubview:](self->_panelBackgroundContainerView, "addSubview:", self->_parallaxClippingView);
  v8 = objc_alloc_init(SBCoverSheetParallaxContainerView);
  parallaxContainerView = self->_parallaxContainerView;
  self->_parallaxContainerView = v8;

  -[SBFTouchPassThroughView addSubview:](self->_parallaxClippingView, "addSubview:", self->_parallaxContainerView);
  v10 = objc_alloc(MEMORY[0x1E0DA9F28]);
  objc_msgSend(v3, "bounds");
  v11 = (SBFTouchPassThroughView *)objc_msgSend(v10, "initWithFrame:");
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  self->_unlockedContentOverlayView = v11;

  -[SBFTouchPassThroughView bs_setHitTestingDisabled:](self->_unlockedContentOverlayView, "bs_setHitTestingDisabled:", 1);
  v13 = self->_unlockedContentOverlayView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFTouchPassThroughView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[SBCoverSheetPanelBackgroundContainerView addSubview:](self->_panelBackgroundContainerView, "addSubview:", self->_unlockedContentOverlayView);
  -[SBCoverSheetPanelBackgroundContainerView sendSubviewToBack:](self->_panelBackgroundContainerView, "sendSubviewToBack:", self->_unlockedContentOverlayView);
  -[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView](self, "_updatePanelWallpaperEffectView");
  -[SBCoverSheetPrimarySlidingViewController _updateFadeOutWallpaperEffectView](self, "_updateFadeOutWallpaperEffectView");
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coverSheetWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sbWindowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SBGrabberTongue initWithDelegate:edge:type:windowScene:]([SBGrabberTongue alloc], "initWithDelegate:edge:type:windowScene:", self, 1, 1, v17);
  grabberTongue = self->_grabberTongue;
  self->_grabberTongue = v18;

  -[SBGrabberTongue setName:](self->_grabberTongue, "setName:", CFSTR("CoverSheetGrabberTongue"));
  v20 = self->_grabberTongue;
  -[SBCoverSheetPrimarySlidingViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue installInView:withColorStyle:](v20, "installInView:withColorStyle:", v21, 0);

  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAllowedTouchTypes:", &unk_1E91CEB00);

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPresentGestureRecognizer:", v24);

  v25 = objc_opt_class();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "_edgeRegionSize");
  self->_defaultPresentGestureEdgeRegionSize = v28;
  SBLogSystemGestureCoverSheet();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    defaultPresentGestureEdgeRegionSize = self->_defaultPresentGestureEdgeRegionSize;
    *(_DWORD *)buf = 134217984;
    v37 = defaultPresentGestureEdgeRegionSize;
    _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "_defaultPresentGestureEdgeRegionSize initialized to %g", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__controlCenterWindowSceneDidConnect_, CFSTR("SBControlCenterControllerWindowSceneDidConnect"), 0);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:", self);
  objc_msgSend(v32, "dismissPanGestureRecognizer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "requireGestureRecognizerToFail:", v34);

}

- (UIGestureRecognizer)edgePullGestureRecognizer
{
  return (UIGestureRecognizer *)-[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  uint64_t v20;
  double MinX;
  double v22;
  double Width;
  double v24;
  double Height;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  SBWallpaperEffectView *v37;
  __int128 v38;
  SBWallpaperEffectView *panelWallpaperEffectView;
  NSObject *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat rect;
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v56 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController viewDidLayoutSubviews](&v52, sel_viewDidLayoutSubviews);
  -[SBCoverSheetSlidingViewController positionView](self, "positionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPrimarySlidingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v45 = v6;
  v46 = v5;
  v43 = v8;
  v44 = v7;

  objc_msgSend(v3, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = -v17;
  rect = v13;
  if (v13 > -v17)
    v18 = v13;
  v19 = fmin(v18, 0.0);
  v20 = -[SBCoverSheetPrimarySlidingViewController interfaceOrientation](self, "interfaceOrientation");
  MinX = v11;
  v22 = v19;
  Width = v15;
  v24 = v17;
  if (v20 == 2)
  {
    v57.origin.x = v11;
    v57.origin.y = v19;
    v57.size.width = v15;
    v57.size.height = v17;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = v11;
    v58.origin.y = v19;
    v58.size.width = v15;
    v58.size.height = v17;
    Height = CGRectGetHeight(v58);
    v59.origin.x = v11;
    v59.origin.y = v19;
    v59.size.width = v15;
    v59.size.height = v17;
    v22 = Height - CGRectGetMinY(v59);
    v60.origin.x = v11;
    v60.origin.y = v19;
    v60.size.width = v15;
    v60.size.height = v17;
    Width = CGRectGetWidth(v60);
    v61.origin.x = v11;
    v61.origin.y = v19;
    v61.size.width = v15;
    v61.size.height = v17;
    v24 = CGRectGetHeight(v61);
  }
  -[SBCoverSheetPrimarySlidingViewController panelBackgroundContainerView](self, "panelBackgroundContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", MinX, v22, Width, v24);

  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trackingWallpaperParallaxFactor");
  v29 = v28;

  -[SBCoverSheetPrimarySlidingViewController parallaxContainerView](self, "parallaxContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v11, -(v29 * v19), v15, v17);

  -[SBCoverSheetPrimarySlidingViewController behindCoverSheetBlurView](self, "behindCoverSheetBlurView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v46, v45, v44, v43);

  -[SBCoverSheetPrimarySlidingViewController panelCoverSheetBlurView](self, "panelCoverSheetBlurView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v46, v45, v44, v43);

  -[SBCoverSheetPrimarySlidingViewController parallaxClippingView](self, "parallaxClippingView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v46, v45, v44, v43);

  -[SBCoverSheetPrimarySlidingViewController panelFadeOutWallpaperEffectView](self, "panelFadeOutWallpaperEffectView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v46, v45, v44, v43);

  -[SBCoverSheetPrimarySlidingViewController panelWallpaperEffectView](self, "panelWallpaperEffectView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v46, v45, v44, v43);

  if (-[SBCoverSheetPrimarySlidingViewController _maglevActive](self, "_maglevActive"))
  {
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    switch(v20)
    {
      case 1:
        v36 = 0.0;
        break;
      case 3:
        v36 = 1.57079633;
        break;
      case 4:
        v36 = -1.57079633;
        break;
      default:
        v36 = 3.14159265;
        if (v20 != 2)
          v36 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v48, -v36);
    UIIntegralTransform();
    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    *(_OWORD *)buf = v49;
    v54 = v50;
    v55 = v51;
    -[SBWallpaperEffectView setTransform:](panelWallpaperEffectView, "setTransform:", buf);
    SBLogSystemGestureCoverSheet();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController viewDidLayoutSubviews] - _panelWallpaperEffectView transformed for orientation: %ld", buf, 0xCu);
    }

  }
  else
  {
    v37 = self->_panelWallpaperEffectView;
    v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v49 = *MEMORY[0x1E0C9BAA8];
    v50 = v38;
    v51 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[SBWallpaperEffectView setTransform:](v37, "setTransform:", &v49);
  }
  v62.origin.x = v11;
  v62.origin.y = rect;
  v62.size.width = v15;
  v62.size.height = v17;
  v41 = CGRectGetHeight(v62);
  -[SBCoverSheetPrimarySlidingViewController unlockedContentOverlayView](self, "unlockedContentOverlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v11, v41, v15, v17);

}

- (BOOL)shouldAutorotate
{
  void *v3;
  int v4;
  char v5;
  void *v6;

  -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "shouldAutorotate");
    v5 = objc_msgSend(v3, "bs_isAppearingOrAppeared");
    if (v4 && (v5 & 1) == 0)
    {
      -[SBCoverSheetSlidingViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v6, "coverSheetSlidingViewControllerContentShouldAutoRotateWhenNotVisible:", self);

    }
  }

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "getRotationContentSettings:forWindow:", a3, v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  SBCoverSheetPanelBackgroundContainerView *v8;
  SBCoverSheetPanelBackgroundContainerView *v9;
  _QWORD v10[4];
  SBCoverSheetPanelBackgroundContainerView *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  v7 = a4;
  -[SBCoverSheetPrimarySlidingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = self->_panelBackgroundContainerView;
  -[SBCoverSheetPanelBackgroundContainerView setClipsToBounds:](v8, "setClipsToBounds:", 1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__SBCoverSheetPrimarySlidingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E8E9EA28;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v10);

}

uint64_t __95__SBCoverSheetPrimarySlidingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClipsToBounds:", 0);
}

- (void)_positionSubviewsForContentFrame:(CGRect)a3 forPresentationValue:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  objc_super v22;

  v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _positionSubviewsForContentFrame:forPresentationValue:](&v22, sel__positionSubviewsForContentFrame_forPresentationValue_);
  UIRectGetCenter();
  v7 = v6;
  v9 = v8;
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackingWallpaperParallaxFactor");

  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  -[SBCoverSheetPrimarySlidingViewController panelBackgroundContainerView](self, "panelBackgroundContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
  {
    *(double *)v21 = v7;
    *(double *)&v21[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v21, "{CGPoint=dd}");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setPresentationValue:forKey:", v17, CFSTR("position"));

    -[SBCoverSheetPrimarySlidingViewController parallaxContainerView](self, "parallaxContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v20 = v12;
    *(double *)&v20[1] = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v20, "{CGPoint=dd}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setPresentationValue:forKey:", v19, CFSTR("position"));

  }
  else
  {
    objc_msgSend(v15, "setCenter:", v7, v9);

    -[SBCoverSheetPrimarySlidingViewController parallaxContainerView](self, "parallaxContainerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCenter:", v12, v14);
  }

}

- (void)setTransitionSettings:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController setTransitionSettings:](&v4, sel_setTransitionSettings_, a3);
  -[SBCoverSheetPrimarySlidingViewController _updateBackgroundIfNecessary](self, "_updateBackgroundIfNecessary");
  -[SBCoverSheetPrimarySlidingViewController _setupPanelPartsIfNecessary](self, "_setupPanelPartsIfNecessary");
  -[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView](self, "_updatePanelWallpaperEffectView");
  -[SBCoverSheetPrimarySlidingViewController _updateFadeOutWallpaperEffectView](self, "_updateFadeOutWallpaperEffectView");
}

- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5
{
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](&v9, sel__transitionToViewControllerAppearState_ifNeeded_forUserGesture_, *(_QWORD *)&a3, a4, a5);
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 <= 3)
    objc_msgSend(v7, "coverSheetSlidingViewController:isTransitioning:", self, a3 & 1);

}

- (void)_beginTransitionFromAppeared:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SBFTouchPassThroughView *unlockedContentOverlayView;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  int v13;
  SBCoverSheetBlurView *behindCoverSheetBlurView;
  double v15;
  int v16;
  SBWallpaperEffectView *panelWallpaperEffectView;
  NSObject *v18;
  void *v19;
  const char *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  uint8_t buf[4];
  _BOOL4 v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:](&v32, sel__beginTransitionFromAppeared_);
  -[SBCoverSheetPrimarySlidingViewController setHasCommittedCurrentTransition:](self, "setHasCommittedCurrentTransition:", 0);
  -[SBCoverSheetPrimarySlidingViewController setPresentationProgressAtCommit:](self, "setPresentationProgressAtCommit:", -1.0);
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBCoverSheetSlidingViewController dismissalSlidingMode](self, "dismissalSlidingMode") != 2)
  {
    if (objc_msgSend(v5, "blursPanel")
      && (-[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "contentOccludesBackground"),
          v10,
          (v11 & 1) == 0))
    {
      -[SBCoverSheetBlurView setAlpha:](self->_panelCoverSheetBlurView, "setAlpha:", 1.0);
      v12 = 0.0;
      if (!v3)
        v12 = 1.0;
      -[SBCoverSheetBlurView setWeighting:](self->_panelCoverSheetBlurView, "setWeighting:", v12);
    }
    else
    {
      -[SBCoverSheetBlurView setAlpha:](self->_panelCoverSheetBlurView, "setAlpha:", 0.0);
    }
    v13 = objc_msgSend(v5, "blursBehindCoverSheet");
    behindCoverSheetBlurView = self->_behindCoverSheetBlurView;
    if (v13)
    {
      -[SBCoverSheetBlurView setAlpha:](behindCoverSheetBlurView, "setAlpha:", 1.0);
      -[SBCoverSheetBlurView setHidden:](self->_behindCoverSheetBlurView, "setHidden:", 0);
      v15 = 0.0;
      if (v3)
        v15 = 1.0;
      -[SBCoverSheetBlurView setWeighting:](self->_behindCoverSheetBlurView, "setWeighting:", v15);
    }
    else
    {
      -[SBCoverSheetBlurView setHidden:](behindCoverSheetBlurView, "setHidden:", 1);
    }
    v16 = objc_msgSend(v5, "panelWallpaper");
    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    if (v16)
    {
      -[SBWallpaperEffectView setAlpha:](panelWallpaperEffectView, "setAlpha:", 1.0);
      -[PBUIWallpaperEffectViewBase setHidden:](self->_panelWallpaperEffectView, "setHidden:", 0);
      -[PBUIWallpaperEffectViewBase setFullscreen:](self->_panelWallpaperEffectView, "setFullscreen:", objc_msgSend(v5, "trackingWallpaper"));
      SBLogSystemGestureCoverSheet();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v34 = v3;
        v35 = 2114;
        v36 = v19;
        v20 = "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectV"
              "iew visible: %{public}@; ";
LABEL_21:
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x12u);

      }
    }
    else
    {
      -[PBUIWallpaperEffectViewBase setHidden:](panelWallpaperEffectView, "setHidden:", 1);
      SBLogSystemGestureCoverSheet();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v34 = v3;
        v35 = 2114;
        v36 = v19;
        v20 = "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectV"
              "iew NOT visible: %{public}@";
        goto LABEL_21;
      }
    }

    -[PBUIWallpaperEffectViewBase setHidden:](self->_panelFadeOutWallpaperEffectView, "setHidden:", objc_msgSend(v5, "fadesContent") ^ 1);
    if (objc_msgSend(v5, "fadesCoverSheetContent"))
    {
      v21 = objc_msgSend(v5, "alwaysFadesCoverSheetContent");
      -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0.0;
      if (v3 | v21)
        v25 = 1.0;
      objc_msgSend(v23, "setAlpha:", v25);

    }
    v26 = objc_msgSend(v5, "darkensContent");
    v27 = (void *)MEMORY[0x1E0CEA478];
    if (v26)
    {
      objc_msgSend(v5, "darkeningColorWhite");
      v29 = v28;
      objc_msgSend(v5, "darkeningColorAlpha");
      objc_msgSend(v27, "colorWithWhite:alpha:", v29, v30);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v3)
        v31 = 1.0;
      else
        v31 = 0.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v8 = objc_claimAutoreleasedReturnValue();
      v31 = 0.0;
    }
    -[SBFTouchPassThroughView setBackgroundColor:](self->_unlockedContentOverlayView, "setBackgroundColor:", v8);
    -[SBFTouchPassThroughView setAlpha:](self->_unlockedContentOverlayView, "setAlpha:", v31);
    goto LABEL_32;
  }
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFTouchPassThroughView setBackgroundColor:](unlockedContentOverlayView, "setBackgroundColor:", v7);

  -[SBFTouchPassThroughView setAlpha:](self->_unlockedContentOverlayView, "setAlpha:", 1.0);
  if (objc_msgSend(v5, "panelWallpaper"))
  {
    -[PBUIWallpaperEffectViewBase setHidden:](self->_panelWallpaperEffectView, "setHidden:", 0);
    SBLogSystemGestureCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v34 = v3;
      v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectView visible (rubberBanding): %{public}@", buf, 0x12u);

    }
LABEL_32:

  }
}

- (void)_commitTransitionToAppeared:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _commitTransitionToAppeared:animated:](&v10, sel__commitTransitionToAppeared_animated_);
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    v9 = objc_msgSend(v7, "scaleWallpaper");
  else
    v9 = 0;
  -[SBCoverSheetPrimarySlidingViewController _updateWallpaperScaled:animated:](self, "_updateWallpaperScaled:animated:", v9, v4);
  -[SBCoverSheetPrimarySlidingViewController setHasCommittedCurrentTransition:](self, "setHasCommittedCurrentTransition:", 1);

}

- (void)_endTransitionToAppeared:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _endTransitionToAppeared:](&v17, sel__endTransitionToAppeared_);
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "blursPanel"))
  {
    v6 = 1.0;
    if (v3)
      v6 = 0.0;
    -[SBCoverSheetBlurView setWeighting:](self->_panelCoverSheetBlurView, "setWeighting:", v6);
    -[SBCoverSheetBlurView setAlpha:](self->_panelCoverSheetBlurView, "setAlpha:", 0.0);
  }
  if (objc_msgSend(v5, "blursBehindCoverSheet"))
  {
    v7 = 0.0;
    if (v3)
      v7 = 1.0;
    -[SBCoverSheetBlurView setWeighting:](self->_behindCoverSheetBlurView, "setWeighting:", v7);
    -[SBCoverSheetBlurView setHidden:](self->_behindCoverSheetBlurView, "setHidden:", 1);
  }
  if (objc_msgSend(v5, "panelWallpaper"))
  {
    -[PBUIWallpaperEffectViewBase setHidden:](self->_panelWallpaperEffectView, "setHidden:", 1);
    SBLogSystemGestureCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v19 = v3;
    v20 = 2114;
    v21 = v9;
    v10 = "-[SBCoverSheetPrimarySlidingViewController _endTransitionToAppeared:%{BOOL}i] - _panelWallpaperEffectView was "
          "visible with final alpha: %{public}@";
  }
  else
  {
    SBLogSystemGestureCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v19 = v3;
    v20 = 2114;
    v21 = v9;
    v10 = "-[SBCoverSheetPrimarySlidingViewController _endTransitionToAppeared:%{BOOL}i] - _panelWallpaperEffectView was "
          "hidden: %{public}@";
  }
  _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);

LABEL_15:
  if (objc_msgSend(v5, "fadesContent"))
    -[PBUIWallpaperEffectViewBase setHidden:](self->_panelFadeOutWallpaperEffectView, "setHidden:", 1);
  if (objc_msgSend(v5, "fadesCoverSheetContent"))
  {
    v11 = objc_msgSend(v5, "alwaysFadesCoverSheetContent");
    -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0.0;
    if (v3 | v11)
      v15 = 1.0;
    objc_msgSend(v13, "setAlpha:", v15);

  }
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coverSheetSlidingViewControllerDidEndTransition:", self);

}

- (CGRect)_animationTickedWithProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5
{
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  _BOOL4 v23;
  double v24;
  double v25;
  SBFTouchPassThroughView *unlockedContentOverlayView;
  void *v27;
  SBWallpaperEffectView *panelWallpaperEffectView;
  void *v29;
  SBWallpaperEffectView *panelFadeOutWallpaperEffectView;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;
  CGRect result;

  v5 = a5;
  v42.receiver = self;
  v42.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _animationTickedWithProgress:velocity:forPresentationValue:](&v42, sel__animationTickedWithProgress_velocity_forPresentationValue_);
  v40 = v8;
  v41 = v7;
  v39 = v9;
  v11 = v10;
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  v14 = 0.0;
  if (objc_msgSend(v12, "blursPanel"))
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
      objc_msgSend(v12, "blurEndReducedTransparency");
    else
      objc_msgSend(v12, "blurEnd");
    objc_msgSend(v12, "blurStart");
    BSIntervalSubIntervalValueForValue();
    v14 = v15;
  }
  if (objc_msgSend(v12, "blursBehindCoverSheet"))
  {
    objc_msgSend(v12, "behindCoverSheetBlurStart");
    objc_msgSend(v12, "behindCoverSheetBlurEnd");
    BSIntervalSubIntervalValueForValue();
    v13 = 1.0 - v16;
  }
  v17 = 0.0;
  if (objc_msgSend(v12, "darkensContent"))
  {
    objc_msgSend(v12, "darkeningStart");
    objc_msgSend(v12, "darkeningEnd");
    BSIntervalSubIntervalValueForValue();
    v17 = 1.0 - v18;
  }
  v19 = 1.0;
  if (objc_msgSend(v12, "fadePanelWallpaper"))
  {
    objc_msgSend(v12, "fadePanelWallpaperStart");
    objc_msgSend(v12, "fadePanelWallpaperEnd");
    BSIntervalSubIntervalValueForValue();
    v19 = 1.0 - v20;
  }
  v21 = 0.0;
  if (objc_msgSend(v12, "fadesContent"))
  {
    objc_msgSend(v12, "maxContentAlpha");
    objc_msgSend(v12, "contentFadeStart");
    objc_msgSend(v12, "contentFadeEnd");
    BSIntervalSubIntervalValueForValue();
    v21 = 1.0 - v22;
  }
  v23 = -[SBCoverSheetPrimarySlidingViewController hasCommittedCurrentTransition](self, "hasCommittedCurrentTransition");
  v24 = 1.0;
  if (objc_msgSend(v12, "fadesCoverSheetContent") && v23)
  {
    if (v5 && (objc_msgSend(v12, "alwaysFadesCoverSheetContent") & 1) == 0)
    {
      objc_msgSend(v12, "fadesCoverSheetContentStart");
      objc_msgSend(v12, "fadesCoverSheetContentEnd");
    }
    BSIntervalSubIntervalValueForValue();
    v24 = 1.0 - v25;
  }
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTouchPassThroughView _setPresentationValue:forKey:](unlockedContentOverlayView, "_setPresentationValue:forKey:", v27, CFSTR("opacity"));

    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperEffectView _setPresentationValue:forKey:](panelWallpaperEffectView, "_setPresentationValue:forKey:", v29, CFSTR("opacity"));

    panelFadeOutWallpaperEffectView = self->_panelFadeOutWallpaperEffectView;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperEffectView _setPresentationValue:forKey:](panelFadeOutWallpaperEffectView, "_setPresentationValue:forKey:", v31, CFSTR("opacity"));

    if (v23)
    {
      -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_setPresentationValue:forKey:", v34, CFSTR("opacity"));

LABEL_26:
    }
  }
  else
  {
    -[SBFTouchPassThroughView setAlpha:](self->_unlockedContentOverlayView, "setAlpha:", v17);
    -[SBWallpaperEffectView setAlpha:](self->_panelWallpaperEffectView, "setAlpha:", v19);
    -[SBWallpaperEffectView setAlpha:](self->_panelFadeOutWallpaperEffectView, "setAlpha:", v21);
    if (v23)
    {
      -[SBCoverSheetSlidingViewController contentViewController](self, "contentViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAlpha:", v24);
      goto LABEL_26;
    }
  }
  -[SBCoverSheetBlurView setWeighting:forPresentationValue:](self->_behindCoverSheetBlurView, "setWeighting:forPresentationValue:", v5, v13);
  -[SBCoverSheetBlurView setWeighting:forPresentationValue:](self->_panelCoverSheetBlurView, "setWeighting:forPresentationValue:", v5, v14);

  v36 = v40;
  v35 = v41;
  v37 = v39;
  v38 = v11;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)handleReachabilityModeActivated
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reachabilityYOffset");
    v8 = v7;

    objc_msgSend(v5, "_setEdgeRegionSize:", v8);
    SBLogSystemGestureCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v8;
      v10 = "reachability activated - setting edgeRegionSize to %g";
      v11 = v9;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    SBLogSystemGestureCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v10 = "reachability activated - missing recognizer";
      v11 = v9;
      v12 = 2;
      goto LABEL_6;
    }
  }

}

- (void)handleReachabilityModeDeactivated
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  double defaultPresentGestureEdgeRegionSize;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogSystemGestureCoverSheet();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      defaultPresentGestureEdgeRegionSize = self->_defaultPresentGestureEdgeRegionSize;
      v9 = 134217984;
      v10 = defaultPresentGestureEdgeRegionSize;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "reachability deactivated - setting edgeRegionSize to %g", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v5, "_setEdgeRegionSize:", self->_defaultPresentGestureEdgeRegionSize);
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "reachability deactivated - missing recognizer", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)handleWillBeginReachabilityAnimation
{
  id v3;

  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coverSheetSlidingViewControllerReachabilityAnimationWillBegin:", self);

}

- (void)handleDidEndReachabilityAnimation
{
  id v3;

  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coverSheetSlidingViewControllerReachabilityAnimationDidEnd:", self);

}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  SBCoverSheetPresentationGestureRecognizer *v3;
  uint64_t v4;

  v3 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:]([SBCoverSheetPresentationGestureRecognizer alloc], "initWithTarget:action:type:options:", 0, 0, 6, 0);
  -[SBCoverSheetPresentationGestureRecognizer setName:](v3, "setName:", CFSTR("CSPresent"));
  -[UIScreenEdgePanGestureRecognizer setEdges:](v3, "setEdges:", 1);
  -[SBCoverSheetPresentationGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &unk_1E91CEB18);
  v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622)
      return v3;
LABEL_7:
    -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](v3, "_setEdgeRegionSize:", 15.0);
    return v3;
  }
  if (v4 == 2868 || v4 == 2796)
    goto LABEL_7;
  return v3;
}

- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v5 = a4;
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGestureWithTypeAllowed:", 1);

  if ((v7 & 1) == 0)
  {
    SBLogSystemGestureCoverSheet();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v12 = "Not allowing the present gesture to begin because system gestures aren't allowed.";
      v13 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "gestureRecognizerShouldBegin:", v5);

  if ((v9 & 1) == 0)
  {
    SBLogSystemGestureCoverSheet();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v12 = "SystemGesturesDelegate says gesture recognizer should not begin.";
      v13 = (uint8_t *)&v15;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v7;
  id v8;

  v7 = a3;
  objc_msgSend(v7, "dismissWithStyle:animated:", 0, 1);
  objc_msgSend(v7, "edgePullGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBCoverSheetSlidingViewController _handlePresentGesture:](self, "_handlePresentGesture:", v8);
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v7;

  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _handlePresentGesture:](self, "_handlePresentGesture:", v7);

}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v7;

  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _handlePresentGesture:](self, "_handlePresentGesture:", v7);

}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v7;

  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _handlePresentGesture:](self, "_handlePresentGesture:", v7);

}

- (BOOL)_shouldShowGrabberOnFirstSwipe
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;

  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentingEdge");

  if (v4 == 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[SBCoverSheetPrimarySlidingViewController grabberDelegate](self, "grabberDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasFirstSwipeShowGrabberOverride");
    v5 = (v7 ^ 1) & objc_msgSend(v6, "screenEdgesDeferringSystemGestures");

  }
  return v5;
}

- (void)_updateWindowVisibility
{
  id v3;

  -[SBCoverSheetPrimarySlidingViewController grabberDelegate](self, "grabberDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateVisibilityForGrabberVisible:", -[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible"));

}

- (void)_controlCenterWindowSceneDidConnect:(id)a3
{
  void *v4;
  id v5;

  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentingEdge") == 1)
  {
    -[SBGrabberTongue edgePullGestureRecognizer](self->_grabberTongue, "edgePullGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_requirePresentGestureRecognizerToFailForGestureRecognizer:", v4);
  }
  else
  {
    -[SBCoverSheetSlidingViewController dismissGestureRecognizer](self, "dismissGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_requireGestureRecognizerToFailForPresentGestureRecognizer:", v4);
  }

}

- (id)_visibilityDescriptionForView:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "alpha");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; hidden = %@; alpha = %f>"), v6, v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updatePanelWallpaperEffectView
{
  void *v3;
  void *v4;
  NSObject *v5;
  SBCoverSheetParallaxContainerView *v6;
  SBCoverSheetParallaxContainerView *parallaxContainerView;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "panelWallpaper"))
  {
    -[SBCoverSheetPrimarySlidingViewController _createPanelWallpaperEffectViewIfNeeded](self, "_createPanelWallpaperEffectViewIfNeeded");
    -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_panelWallpaperEffectView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogSystemGestureCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - _panelWallpaperEffectView %{public}@ will be visible", (uint8_t *)&v14, 0xCu);
    }

    -[SBWallpaperEffectView superview](self->_panelWallpaperEffectView, "superview");
    v6 = (SBCoverSheetParallaxContainerView *)objc_claimAutoreleasedReturnValue();
    parallaxContainerView = self->_parallaxContainerView;

    if (v6 != parallaxContainerView)
    {
      SBLogSystemGestureCoverSheet();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[SBWallpaperEffectView superview](self->_panelWallpaperEffectView, "superview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBCoverSheetPrimarySlidingViewController _visibilityDescriptionForView:](self, "_visibilityDescriptionForView:", self->_parallaxContainerView);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v4;
        v16 = 2114;
        v17 = v10;
        v18 = 2114;
        v19 = v11;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - moving _panelWallpaperEffectView %{public}@ from %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);

      }
      -[SBWallpaperEffectView removeFromSuperview](self->_panelWallpaperEffectView, "removeFromSuperview");
      -[SBCoverSheetParallaxContainerView addSubview:](self->_parallaxContainerView, "addSubview:", self->_panelWallpaperEffectView);
      -[SBCoverSheetParallaxContainerView sendSubviewToBack:](self->_parallaxContainerView, "sendSubviewToBack:", self->_panelWallpaperEffectView);
      -[SBCoverSheetPrimarySlidingViewController viewIfLoaded](self, "viewIfLoaded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

    }
  }
  else
  {
    SBLogSystemGestureCoverSheet();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - _panelWallpaperEffectView will NOT be visible", (uint8_t *)&v14, 2u);
    }

    -[SBWallpaperEffectView removeFromSuperview](self->_panelWallpaperEffectView, "removeFromSuperview");
  }

}

- (unint64_t)_panelOptions
{
  void *v3;
  void *v4;
  unint64_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v10;
  char v11;
  char v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;

  -[SBCoverSheetPrimarySlidingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation") - 5;

  v6 = -[SBCoverSheetPrimarySlidingViewController _maglevActive](self, "_maglevActive");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v5 < 0xFFFFFFFFFFFFFFFELL)
  {
    -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "orientPanelWallpaper");
    if (v6)
    {
      if (v5 < 0xFFFFFFFFFFFFFFFELL)
        v12 = 1;
      else
        v12 = v11;
      if ((v12 & 1) == 0)
      {
        if (_os_feature_enabled_impl())
          v13 = 19;
        else
          v13 = 17;
        goto LABEL_21;
      }
    }
    else if ((v11 & 1) != 0
           || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
               v14 = (void *)objc_claimAutoreleasedReturnValue(),
               v15 = objc_msgSend(v14, "userInterfaceIdiom"),
               v14,
               (v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
           || !SBReduceMotion())
    {
      v13 = 19;
      goto LABEL_21;
    }
    v13 = 17;
LABEL_21:

    return v13;
  }
  if (v6)
    return 17;
  else
    return 81;
}

- (BOOL)_maglevActive
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (void)_createPanelWallpaperEffectViewIfNeeded
{
  unint64_t v3;
  SBWallpaperEffectView *panelWallpaperEffectView;
  NSObject *v5;
  NSObject *v6;
  SBWallpaperEffectView *v7;
  SBWallpaperEffectView *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[SBCoverSheetPrimarySlidingViewController _panelOptions](self, "_panelOptions");
  panelWallpaperEffectView = self->_panelWallpaperEffectView;
  if (!panelWallpaperEffectView)
    goto LABEL_7;
  if (-[PBUIWallpaperEffectViewBase transformOptions](panelWallpaperEffectView, "transformOptions") == v3)
    return;
  if (self->_panelWallpaperEffectView)
  {
    SBLogSystemGestureCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _createPanelWallpaperEffectViewIfNeeded] - REPLACING _panelWallpaperEffectView. New panel options 0x%lX", (uint8_t *)&v9, 0xCu);
    }

    -[SBWallpaperEffectView removeFromSuperview](self->_panelWallpaperEffectView, "removeFromSuperview");
  }
  else
  {
LABEL_7:
    SBLogSystemGestureCoverSheet();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _createPanelWallpaperEffectViewIfNeeded] - CREATING _panelWallpaperEffectView with panel options 0x%lX", (uint8_t *)&v9, 0xCu);
    }

  }
  v7 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 0, v3);
  v8 = self->_panelWallpaperEffectView;
  self->_panelWallpaperEffectView = v7;

  -[PBUIWallpaperEffectViewBase setForcesOpaque:](self->_panelWallpaperEffectView, "setForcesOpaque:", 1);
  -[PBUIWallpaperEffectViewBase setFullscreen:](self->_panelWallpaperEffectView, "setFullscreen:", 0);
  -[PBUIWallpaperEffectViewBase setStyle:](self->_panelWallpaperEffectView, "setStyle:", 0);
}

- (void)_updateFadeOutWallpaperEffectView
{
  void *v3;
  id v4;

  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fadesContent"))
  {
    -[SBCoverSheetPrimarySlidingViewController _createFadeOutWallpaperEffectViewIfNeeded](self, "_createFadeOutWallpaperEffectViewIfNeeded");
    -[PBUIWallpaperEffectViewBase setStyle:](self->_panelFadeOutWallpaperEffectView, "setStyle:", 0);
    -[SBCoverSheetPanelBackgroundContainerView addSubview:](self->_panelBackgroundContainerView, "addSubview:", self->_panelFadeOutWallpaperEffectView);
    -[SBCoverSheetPanelBackgroundContainerView sendSubviewToBack:](self->_panelBackgroundContainerView, "sendSubviewToBack:", self->_panelFadeOutWallpaperEffectView);
    -[SBCoverSheetPrimarySlidingViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
  else
  {
    -[SBWallpaperEffectView removeFromSuperview](self->_panelFadeOutWallpaperEffectView, "removeFromSuperview");
  }

}

- (void)_createFadeOutWallpaperEffectViewIfNeeded
{
  SBWallpaperEffectView *panelFadeOutWallpaperEffectView;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  SBWallpaperEffectView *v8;
  SBWallpaperEffectView *v9;

  panelFadeOutWallpaperEffectView = self->_panelFadeOutWallpaperEffectView;
  if (panelFadeOutWallpaperEffectView)
    -[SBWallpaperEffectView removeFromSuperview](panelFadeOutWallpaperEffectView, "removeFromSuperview");
  if (-[SBCoverSheetPrimarySlidingViewController _maglevActive](self, "_maglevActive"))
  {
    v4 = 19;
  }
  else
  {
    v5 = _os_feature_enabled_impl();
    v6 = _os_feature_enabled_impl();
    v7 = 19;
    if (v6)
      v7 = 17;
    if (v5)
      v4 = v7;
    else
      v4 = 17;
  }
  v8 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 1, v4);
  v9 = self->_panelFadeOutWallpaperEffectView;
  self->_panelFadeOutWallpaperEffectView = v8;

  -[PBUIWallpaperEffectViewBase setForcesOpaque:](self->_panelFadeOutWallpaperEffectView, "setForcesOpaque:", 1);
  -[PBUIWallpaperEffectViewBase setFullscreen:](self->_panelFadeOutWallpaperEffectView, "setFullscreen:", 0);
}

- (void)_updateBackgroundIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  SBCoverSheetBlurView *v6;
  SBCoverSheetBlurView *v7;
  SBCoverSheetBlurView *behindCoverSheetBlurView;
  SBCoverSheetBlurView *v9;
  void *v10;
  void *v11;
  SBCoverSheetBlurView *v12;
  id v13;

  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v13 = v3;
  if (!self->_behindCoverSheetBlurView)
  {
    v5 = objc_msgSend(v3, "blursBehindCoverSheet");
    v4 = v13;
    if (v5)
    {
      v6 = [SBCoverSheetBlurView alloc];
      v7 = -[SBCoverSheetBlurView initWithFrame:scaleAdjustment:alphaAdjustment:](v6, "initWithFrame:scaleAdjustment:alphaAdjustment:", &__block_literal_global_212, &__block_literal_global_62_1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      behindCoverSheetBlurView = self->_behindCoverSheetBlurView;
      self->_behindCoverSheetBlurView = v7;

      v9 = self->_behindCoverSheetBlurView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCoverSheetBlurView setDimmingColor:](v9, "setDimmingColor:", v10);

      -[SBCoverSheetBlurView setHidden:](self->_behindCoverSheetBlurView, "setHidden:", 1);
      -[SBCoverSheetPrimarySlidingViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_behindCoverSheetBlurView);
      objc_msgSend(v11, "sendSubviewToBack:", self->_behindCoverSheetBlurView);
LABEL_6:

      goto LABEL_7;
    }
  }
  if ((objc_msgSend(v4, "blursBehindCoverSheet") & 1) == 0)
  {
    -[SBCoverSheetBlurView removeFromSuperview](self->_behindCoverSheetBlurView, "removeFromSuperview");
    v11 = self->_behindCoverSheetBlurView;
    self->_behindCoverSheetBlurView = 0;
    goto LABEL_6;
  }
LABEL_7:
  v12 = self->_behindCoverSheetBlurView;
  objc_msgSend(v13, "behindCoverSheetBlurRadius");
  -[SBCoverSheetBlurView setBlurRadius:](v12, "setBlurRadius:");

}

double __72__SBCoverSheetPrimarySlidingViewController__updateBackgroundIfNecessary__block_invoke()
{
  return 0.5;
}

uint64_t __72__SBCoverSheetPrimarySlidingViewController__updateBackgroundIfNecessary__block_invoke_2()
{
  return BSIntervalSubIntervalValueForValue();
}

- (void)_setupPanelPartsIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  SBCoverSheetBlurView *v6;
  SBCoverSheetBlurView *v7;
  SBCoverSheetBlurView *panelCoverSheetBlurView;
  void *v9;

  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_panelCoverSheetBlurView)
  {
    v9 = v3;
    v5 = objc_msgSend(v3, "blursPanel");
    v4 = v9;
    if (v5)
    {
      v6 = [SBCoverSheetBlurView alloc];
      v7 = -[SBCoverSheetBlurView initWithFrame:scaleAdjustment:alphaAdjustment:](v6, "initWithFrame:scaleAdjustment:alphaAdjustment:", &__block_literal_global_63_1, &__block_literal_global_64_1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      panelCoverSheetBlurView = self->_panelCoverSheetBlurView;
      self->_panelCoverSheetBlurView = v7;

      -[SBCoverSheetBlurView setBlurRadius:](self->_panelCoverSheetBlurView, "setBlurRadius:", 10.0);
      -[SBCoverSheetPanelBackgroundContainerView addSubview:](self->_panelBackgroundContainerView, "addSubview:", self->_panelCoverSheetBlurView);
      v4 = v9;
    }
  }

}

double __71__SBCoverSheetPrimarySlidingViewController__setupPanelPartsIfNecessary__block_invoke()
{
  int v0;
  double result;

  v0 = MEMORY[0x1D17E372C]();
  result = 0.5;
  if (v0)
    return 0.25;
  return result;
}

uint64_t __71__SBCoverSheetPrimarySlidingViewController__setupPanelPartsIfNecessary__block_invoke_2()
{
  return BSIntervalSubIntervalValueForValue();
}

- (void)_updateWallpaperScaled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v4 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBCoverSheetPrimarySlidingViewController _updateWallpaperScaled:animated:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBCoverSheetPrimarySlidingViewController.m"), 782, CFSTR("this call must be made on the main thread"));

  }
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = 3;
  else
    v9 = 1;
  v10 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(v7, "wallpaperScaleSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__SBCoverSheetPrimarySlidingViewController__updateWallpaperScaled_animated___block_invoke;
  v15[3] = &unk_1E8E9EE00;
  v17 = a3;
  v15[4] = self;
  v16 = v8;
  v12 = v8;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, v9, v15, 0);

}

void __76__SBCoverSheetPrimarySlidingViewController__updateWallpaperScaled_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "homescreenWallpaperScaleAssertion");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lockscreenWallpaperScaleAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "wallpaperScale");
    v5 = v4;
    objc_msgSend(v3, "setHomescreenWallpaperScale:withAnimationFactory:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "setHomescreenWallpaperScaleAssertion:", v6);
    objc_msgSend(v3, "setLockscreenWallpaperScale:withAnimationFactory:", 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(v2, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "setLockscreenWallpaperScaleAssertion:", v7);

  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "invalidate");
      objc_msgSend(*(id *)(a1 + 32), "setHomescreenWallpaperScaleAssertion:", 0);
    }
    if (v2)
    {
      objc_msgSend(v2, "invalidate");
      objc_msgSend(*(id *)(a1 + 32), "setLockscreenWallpaperScaleAssertion:", 0);
    }
  }

}

- (SBCoverSheetGrabberDelegate)grabberDelegate
{
  return (SBCoverSheetGrabberDelegate *)objc_loadWeakRetained((id *)&self->_grabberDelegate);
}

- (void)setGrabberDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_grabberDelegate, a3);
}

- (SBFTouchPassThroughView)unlockedContentOverlayView
{
  return self->_unlockedContentOverlayView;
}

- (void)setUnlockedContentOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_unlockedContentOverlayView, a3);
}

- (SBCoverSheetPanelBackgroundContainerView)panelBackgroundContainerView
{
  return self->_panelBackgroundContainerView;
}

- (void)setPanelBackgroundContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_panelBackgroundContainerView, a3);
}

- (SBFTouchPassThroughView)parallaxClippingView
{
  return self->_parallaxClippingView;
}

- (void)setParallaxClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxClippingView, a3);
}

- (SBCoverSheetParallaxContainerView)parallaxContainerView
{
  return self->_parallaxContainerView;
}

- (void)setParallaxContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxContainerView, a3);
}

- (SBGrabberTongue)grabberTongue
{
  return self->_grabberTongue;
}

- (void)setGrabberTongue:(id)a3
{
  objc_storeStrong((id *)&self->_grabberTongue, a3);
}

- (SBCoverSheetBlurView)behindCoverSheetBlurView
{
  return self->_behindCoverSheetBlurView;
}

- (void)setBehindCoverSheetBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_behindCoverSheetBlurView, a3);
}

- (SBCoverSheetBlurView)panelCoverSheetBlurView
{
  return self->_panelCoverSheetBlurView;
}

- (void)setPanelCoverSheetBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_panelCoverSheetBlurView, a3);
}

- (SBWallpaperEffectView)panelWallpaperEffectView
{
  return self->_panelWallpaperEffectView;
}

- (void)setPanelWallpaperEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_panelWallpaperEffectView, a3);
}

- (SBWallpaperEffectView)panelFadeOutWallpaperEffectView
{
  return self->_panelFadeOutWallpaperEffectView;
}

- (void)setPanelFadeOutWallpaperEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_panelFadeOutWallpaperEffectView, a3);
}

- (PBUIWallpaperAnimatedInvalidating)homescreenWallpaperScaleAssertion
{
  return self->_homescreenWallpaperScaleAssertion;
}

- (void)setHomescreenWallpaperScaleAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenWallpaperScaleAssertion, a3);
}

- (PBUIWallpaperAnimatedInvalidating)lockscreenWallpaperScaleAssertion
{
  return self->_lockscreenWallpaperScaleAssertion;
}

- (void)setLockscreenWallpaperScaleAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenWallpaperScaleAssertion, a3);
}

- (double)defaultPresentGestureEdgeRegionSize
{
  return self->_defaultPresentGestureEdgeRegionSize;
}

- (void)setDefaultPresentGestureEdgeRegionSize:(double)a3
{
  self->_defaultPresentGestureEdgeRegionSize = a3;
}

- (double)presentationProgressAtCommit
{
  return self->_presentationProgressAtCommit;
}

- (void)setPresentationProgressAtCommit:(double)a3
{
  self->_presentationProgressAtCommit = a3;
}

- (BOOL)hasCommittedCurrentTransition
{
  return self->_hasCommittedCurrentTransition;
}

- (void)setHasCommittedCurrentTransition:(BOOL)a3
{
  self->_hasCommittedCurrentTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenWallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_panelFadeOutWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_panelWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_panelCoverSheetBlurView, 0);
  objc_storeStrong((id *)&self->_behindCoverSheetBlurView, 0);
  objc_storeStrong((id *)&self->_grabberTongue, 0);
  objc_storeStrong((id *)&self->_parallaxContainerView, 0);
  objc_storeStrong((id *)&self->_parallaxClippingView, 0);
  objc_storeStrong((id *)&self->_panelBackgroundContainerView, 0);
  objc_storeStrong((id *)&self->_unlockedContentOverlayView, 0);
  objc_destroyWeak((id *)&self->_grabberDelegate);
}

@end
