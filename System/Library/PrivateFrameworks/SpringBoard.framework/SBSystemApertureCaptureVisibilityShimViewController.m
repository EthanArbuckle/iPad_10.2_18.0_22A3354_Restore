@implementation SBSystemApertureCaptureVisibilityShimViewController

- (unint64_t)supportedInterfaceOrientations
{
  return -[UIViewController supportedInterfaceOrientations](self->_contentViewController, "supportedInterfaceOrientations");
}

- (void)setVisibleOnClonedDisplay:(BOOL)a3
{
  if (self->_visibleOnClonedDisplay != a3)
  {
    self->_visibleOnClonedDisplay = a3;
    -[SBSystemApertureCaptureVisibilityShimViewController _updateClonedVisibility](self, "_updateClonedVisibility");
  }
}

- (void)setVisibleInSnapshots:(BOOL)a3
{
  if (self->_visibleInSnapshots != a3)
  {
    self->_visibleInSnapshots = a3;
    -[SBSystemApertureCaptureVisibilityShimViewController _updateSnapshotVisibility](self, "_updateSnapshotVisibility");
  }
}

- (void)setContentsDifferOnClonedDisplay:(BOOL)a3
{
  if (self->_contentsDifferOnClonedDisplay != a3)
  {
    self->_contentsDifferOnClonedDisplay = a3;
    -[SBSystemApertureCaptureVisibilityShimViewController _updatePortalVisibility](self, "_updatePortalVisibility");
  }
}

- (void)_updateSnapshotVisibility
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[UIViewController view](self->_contentViewController, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableUpdateMask");

  v5 = v4 & 0xFFFFFFFD | (2 * !self->_visibleInSnapshots);
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableUpdateMask:", v5);

}

- (void)_updateClonedVisibility
{
  double v2;

  v2 = 1.0;
  if (!self->_visibleOnClonedDisplay)
    v2 = 0.0;
  -[_UIPortalView setAlpha:](self->_clonedDisplayPortalView, "setAlpha:", v2);
}

- (id)newDefaultVisibilityAnimator
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  if (!-[SBSystemApertureCaptureVisibilityShimViewController _isOriginalContentCloned](self, "_isOriginalContentCloned"))return 0;
  v3 = objc_alloc(MEMORY[0x1E0CEABC8]);
  -[SBSystemApertureSettings alphaTransitionDurationOnClonedDisplay](self->_settings, "alphaTransitionDurationOnClonedDisplay");
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4D0]), "initWithAnimationCurve:", 0);
  v7 = (void *)objc_msgSend(v3, "initWithDuration:timingParameters:", v6, v5);

  return v7;
}

- (BOOL)_isOriginalContentCloned
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UIViewController view](self->_contentViewController, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fbsDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CADisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloned");

  return v5;
}

- (SBSystemApertureCaptureVisibilityShimViewController)initWithContentViewController:(id)a3
{
  id v5;
  SBSystemApertureCaptureVisibilityShimViewController *v6;
  uint64_t v7;
  SBSystemApertureSettings *settings;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  v6 = -[SBSystemApertureCaptureVisibilityShimViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v7;

    objc_storeStrong((id *)&v6->_contentViewController, a3);
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
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
  _UIPortalView *v15;
  _UIPortalView *displayPortalView;
  void *v17;
  _UIPortalView *v18;
  _UIPortalView *clonedDisplayPortalView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CADisplay *v25;
  CADisplay *observedDisplay;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  -[SBSystemApertureCaptureVisibilityShimViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[SBSystemApertureCaptureVisibilityShimViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureCaptureVisibilityShimViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SBSystemApertureCaptureVisibilityShimViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_contentViewController, v3);
  -[UIViewController view](self->_contentViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  objc_msgSend(v13, "setAutoresizingMask:", 18);
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisableUpdateMask:", 2);

  v15 = (_UIPortalView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", v13);
  displayPortalView = self->_displayPortalView;
  self->_displayPortalView = v15;

  -[_UIPortalView setMatchesPosition:](self->_displayPortalView, "setMatchesPosition:", 1);
  -[_UIPortalView setMatchesTransform:](self->_displayPortalView, "setMatchesTransform:", 1);
  -[_UIPortalView setHidesSourceView:](self->_displayPortalView, "setHidesSourceView:", 1);
  -[_UIPortalView setForwardsClientHitTestingToSourceView:](self->_displayPortalView, "setForwardsClientHitTestingToSourceView:", 1);
  -[_UIPortalView setAllowsHitTesting:](self->_displayPortalView, "setAllowsHitTesting:", 1);
  -[_UIPortalView setFrame:](self->_displayPortalView, "setFrame:", v6, v8, v10, v12);
  -[_UIPortalView setAutoresizingMask:](self->_displayPortalView, "setAutoresizingMask:", 18);
  -[_UIPortalView layer](self->_displayPortalView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisableUpdateMask:", 1042);

  objc_msgSend(v3, "addSubview:", self->_displayPortalView);
  v18 = (_UIPortalView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", v13);
  clonedDisplayPortalView = self->_clonedDisplayPortalView;
  self->_clonedDisplayPortalView = v18;

  -[_UIPortalView setUserInteractionEnabled:](self->_clonedDisplayPortalView, "setUserInteractionEnabled:", 0);
  -[_UIPortalView layer](self->_clonedDisplayPortalView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsHitTesting:", 0);

  -[_UIPortalView setMatchesPosition:](self->_clonedDisplayPortalView, "setMatchesPosition:", 1);
  -[_UIPortalView setMatchesTransform:](self->_clonedDisplayPortalView, "setMatchesTransform:", 1);
  -[_UIPortalView setHidesSourceView:](self->_clonedDisplayPortalView, "setHidesSourceView:", 1);
  -[_UIPortalView setFrame:](self->_clonedDisplayPortalView, "setFrame:", v6, v8, v10, v12);
  -[_UIPortalView setAutoresizingMask:](self->_clonedDisplayPortalView, "setAutoresizingMask:", 18);
  -[_UIPortalView layer](self->_clonedDisplayPortalView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDisableUpdateMask:", 3);

  -[_UIPortalView layer](self->_clonedDisplayPortalView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAllowsGroupOpacity:", 1);

  -[_UIPortalView setAlpha:](self->_clonedDisplayPortalView, "setAlpha:", 1.0);
  objc_msgSend(v3, "addSubview:", self->_clonedDisplayPortalView);
  -[SBSystemApertureCaptureVisibilityShimViewController _updateClonedVisibility](self, "_updateClonedVisibility");
  -[UIViewController view](self->_contentViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_fbsDisplayConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "CADisplay");
  v25 = (CADisplay *)objc_claimAutoreleasedReturnValue();
  observedDisplay = self->_observedDisplay;
  self->_observedDisplay = v25;

  -[CADisplay addObserver:forKeyPath:options:context:](self->_observedDisplay, "addObserver:forKeyPath:options:context:", self, CFSTR("cloned"), 1, 0);
  -[SBSystemApertureCaptureVisibilityShimViewController _updatePortalVisibility](self, "_updatePortalVisibility");

}

- (void)dealloc
{
  objc_super v3;

  -[CADisplay removeObserver:forKeyPath:](self->_observedDisplay, "removeObserver:forKeyPath:", self, CFSTR("cloned"));
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  -[SBSystemApertureCaptureVisibilityShimViewController dealloc](&v3, sel_dealloc);
}

- (void)_updatePortalVisibility
{
  _BOOL8 contentsDifferOnClonedDisplay;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (-[SBSystemApertureCaptureVisibilityShimViewController _isOriginalContentCloned](self, "_isOriginalContentCloned"))
    contentsDifferOnClonedDisplay = self->_contentsDifferOnClonedDisplay;
  else
    contentsDifferOnClonedDisplay = 0;
  -[_UIPortalView setHidesSourceView:](self->_displayPortalView, "setHidesSourceView:", contentsDifferOnClonedDisplay);
  v4 = contentsDifferOnClonedDisplay ^ 1;
  -[_UIPortalView setHidden:](self->_displayPortalView, "setHidden:", v4);
  -[_UIPortalView setHidden:](self->_clonedDisplayPortalView, "setHidden:", v4);
  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[UIViewController view](self->_contentViewController, "view");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v5;
  -[_UIPortalView setSourceView:](self->_displayPortalView, "setSourceView:", v5);
  -[_UIPortalView setSourceView:](self->_clonedDisplayPortalView, "setSourceView:", v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  _QWORD block[5];

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cloned")) && BSEqualObjects())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__SBSystemApertureCaptureVisibilityShimViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __102__SBSystemApertureCaptureVisibilityShimViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePortalVisibility");
}

- (BOOL)isVisibleOnClonedDisplay
{
  return self->_visibleOnClonedDisplay;
}

- (BOOL)isVisibleInSnapshots
{
  return self->_visibleInSnapshots;
}

- (BOOL)doContentsDifferOnClonedDisplay
{
  return self->_contentsDifferOnClonedDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedDisplay, 0);
  objc_storeStrong((id *)&self->_clonedDisplayPortalView, 0);
  objc_storeStrong((id *)&self->_displayPortalView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
