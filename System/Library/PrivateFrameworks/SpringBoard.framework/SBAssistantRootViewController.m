@implementation SBAssistantRootViewController

- (SBAssistantRootViewController)initWithScreen:(id)a3
{
  id v5;
  SBAssistantRootViewController *v6;
  SBAssistantRootViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantRootViewController;
  v6 = -[SBAssistantRootViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_screen, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillHideNotification_, *MEMORY[0x1E0CEB970], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__keyboardWillShowNotification_, *MEMORY[0x1E0CEB978], 0);

  return v7;
}

- (void)setScreen:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 1008), a2);
}

- (UIView)clippingView
{
  return (UIView *)self->_clippingView;
}

- (_QWORD)screen
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[126];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBFTouchPassThroughView *v8;
  SBFTouchPassThroughView *clippingView;
  SBFTouchPassThroughView *v10;
  void *v11;
  void *v12;
  SBFTouchPassThroughView *v13;
  SBFTouchPassThroughView *contentView;
  SBFTouchPassThroughView *v15;
  void *v16;
  UIView *v17;
  UIView *dimmingView;
  UIView *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBAssistantRootViewController;
  -[SBFTouchPassThroughViewController loadView](&v21, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (SBFTouchPassThroughView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  clippingView = self->_clippingView;
  self->_clippingView = v8;

  v10 = self->_clippingView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFTouchPassThroughView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[SBFTouchPassThroughView setClipsToBounds:](self->_clippingView, "setClipsToBounds:", 1);
  -[SBAssistantRootViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_clippingView);

  v13 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v4, v5, v6, v7);
  contentView = self->_contentView;
  self->_contentView = v13;

  v15 = self->_contentView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFTouchPassThroughView setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[SBFTouchPassThroughView addSubview:](self->_clippingView, "addSubview:", self->_contentView);
  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v17;

  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
  v19 = self->_dimmingView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[UIView bs_setHitTestingDisabled:](self->_dimmingView, "bs_setHitTestingDisabled:", 1);
  -[SBFTouchPassThroughView addSubview:](self->_clippingView, "addSubview:", self->_dimmingView);
  -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
}

- (void)viewWillLayoutSubviews
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
  SiriPresentationSpringBoardMainScreenViewController *siriPresentationViewController;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBAssistantRootViewController;
  -[SBAssistantRootViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[SBAssistantRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBFTouchPassThroughView setFrame:](self->_clippingView, "setFrame:", v5, v7, v9, v11);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_clippingView, "bringSubviewToFront:", self->_dimmingView);
  -[SBFTouchPassThroughView bringSubviewToFront:](self->_clippingView, "bringSubviewToFront:", self->_contentView);
  if (self->_homeAffordanceView)
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_clippingView, "bringSubviewToFront:");
  -[SBFTouchPassThroughView setFrame:](self->_contentView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);
  siriPresentationViewController = self->_siriPresentationViewController;
  if (siriPresentationViewController)
  {
    -[SiriPresentationSpringBoardMainScreenViewController view](siriPresentationViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBAssistantCanRepositionOrbIfNecessary"), self);

}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  SiriPresentationSpringBoardMainScreenViewController *siriPresentationViewController;

  siriPresentationViewController = self->_siriPresentationViewController;
  if (siriPresentationViewController)
    return -[SiriPresentationSpringBoardMainScreenViewController supportedInterfaceOrientations](siriPresentationViewController, "supportedInterfaceOrientations");
  else
    return 30;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *siriPresentationViewController;
  void *v4;
  id v5;

  -[SiriPresentationSpringBoardMainScreenViewController childViewControllerForHomeIndicatorAutoHidden](self->_siriPresentationViewController, "childViewControllerForHomeIndicatorAutoHidden");
  siriPresentationViewController = (void *)objc_claimAutoreleasedReturnValue();
  v4 = siriPresentationViewController;
  if (!siriPresentationViewController)
    siriPresentationViewController = self->_siriPresentationViewController;
  v5 = siriPresentationViewController;

  return v5;
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAssistantRootViewController;
  -[SBAssistantRootViewController setNeedsUpdateOfHomeIndicatorAutoHidden](&v3, sel_setNeedsUpdateOfHomeIndicatorAutoHidden);
  -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  void *siriPresentationViewController;
  void *v4;
  id v5;

  -[SiriPresentationSpringBoardMainScreenViewController childViewControllerForScreenEdgesDeferringSystemGestures](self->_siriPresentationViewController, "childViewControllerForScreenEdgesDeferringSystemGestures");
  siriPresentationViewController = (void *)objc_claimAutoreleasedReturnValue();
  v4 = siriPresentationViewController;
  if (!siriPresentationViewController)
    siriPresentationViewController = self->_siriPresentationViewController;
  v5 = siriPresentationViewController;

  return v5;
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAssistantRootViewController;
  -[SBAssistantRootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](&v3, sel_setNeedsUpdateOfScreenEdgesDeferringSystemGestures);
  -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
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
  double v26;
  UIEdgeInsets result;

  objc_msgSend(a3, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "statusBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultHeight");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SBAssistantRootViewController interfaceOrientation](self, "interfaceOrientation");
  -[SBAssistantRootViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  if (a4)
    *a4 = 1;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (void)setOwnsHomeGesture:(BOOL)a3
{
  if (self->_ownsHomeGesture != a3)
  {
    self->_ownsHomeGesture = a3;
    -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
  }
}

- (void)setShowsHomeAffordance:(BOOL)a3
{
  if (self->_showsHomeAffordance != a3)
  {
    self->_showsHomeAffordance = a3;
    -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
  }
}

- (void)_updateHomeAffordance
{
  void *v3;
  uint64_t v4;
  SBHomeGrabberView *homeAffordanceView;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  SBHomeGrabberView *v13;
  double v14;
  SBHomeGrabberView *v15;
  SBHomeGrabberView *v16;
  __int128 v17;
  SBHomeGrabberView *v18;
  SBFHomeGrabberSettings *grabberSettings;
  void *v20;
  SBHomeGrabberView *v21;
  void *v22;
  _OWORD v23[3];
  CGAffineTransform v24;
  _QWORD v25[5];

  -[SBAssistantRootViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_showsHomeAffordance)
    {
      if (self->_ownsHomeGesture)
      {
        if (!self->_homeAffordanceView && SBFEffectiveHomeButtonType() == 2)
        {
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke;
          v25[3] = &unk_1E8E9DED8;
          v25[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v25);
        }
        v4 = 1;
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v4 = 0;
    }
    homeAffordanceView = self->_homeAffordanceView;
    if (homeAffordanceView)
    {
      -[SBAssistantRootViewController childViewControllerForHomeIndicatorAutoHidden](self, "childViewControllerForHomeIndicatorAutoHidden");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeGrabberView setAutoHides:](homeAffordanceView, "setAutoHides:", objc_msgSend(v6, "prefersHomeIndicatorAutoHidden"));

      -[SBAssistantRootViewController childViewControllerForScreenEdgesDeferringSystemGestures](self, "childViewControllerForScreenEdgesDeferringSystemGestures");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = ((unint64_t)objc_msgSend(v7, "preferredScreenEdgesDeferringSystemGestures") >> 2) & 1;

      -[SBHomeGrabberView setEdgeProtectEnabled:](self->_homeAffordanceView, "setEdgeProtectEnabled:", v8);
      -[SBAssistantRootViewController fluidDismissalState](self, "fluidDismissalState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "contentRect");
        v12 = v11;
        -[SBFTouchPassThroughView bounds](self->_clippingView, "bounds");
        v13 = self->_homeAffordanceView;
        CGAffineTransformMakeScale(&v24, v12 / v14, v12 / v14);
        -[SBHomeGrabberView setTransform:](v13, "setTransform:", &v24);
        v15 = self->_homeAffordanceView;
        UIRectGetCenter();
        -[SBHomeGrabberView setCenter:](v15, "setCenter:");
      }
      else
      {
        v16 = self->_homeAffordanceView;
        v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v23[0] = *MEMORY[0x1E0C9BAA8];
        v23[1] = v17;
        v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[SBHomeGrabberView setTransform:](v16, "setTransform:", v23);
        v18 = self->_homeAffordanceView;
        -[SBFTouchPassThroughView bounds](self->_clippingView, "bounds");
        -[SBHomeGrabberView setFrame:](v18, "setFrame:");
      }
      grabberSettings = self->_grabberSettings;
      if ((v4 & 1) != 0)
        -[SBFHomeGrabberSettings unhideForHomeGestureOwnershipAnimationSettings](grabberSettings, "unhideForHomeGestureOwnershipAnimationSettings");
      else
        -[SBFHomeGrabberSettings hideForHomeGestureOwnershipAnimationSettings](grabberSettings, "hideForHomeGestureOwnershipAnimationSettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_homeAffordanceView;
      objc_msgSend(v20, "BSAnimationSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](v21, "setHidden:forReason:withAnimationSettings:", v4 ^ 1, CFSTR("hide assistant affordance when unowned"), v22);

      -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](self->_homeAffordanceView, "setHomeAffordanceInteractionEnabled:", v4);
    }
    -[SBAssistantRootViewController _updateKeyboardForHomeGesture](self, "_updateKeyboardForHomeGesture");
  }
}

uint64_t __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke_2;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v2);
}

void __54__SBAssistantRootViewController__updateHomeAffordance__block_invoke_2(uint64_t a1)
{
  SBHomeGrabberView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = [SBHomeGrabberView alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "bounds");
  v3 = -[SBHomeGrabberView initWithFrame:](v2, "initWithFrame:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1016);
  *(_QWORD *)(v4 + 1016) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setColorBias:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setHidden:forReason:withAnimationSettings:", 1, CFSTR("hide assistant affordance when unowned"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1032);
  *(_QWORD *)(v7 + 1032) = v6;

}

- (void)_updateKeyboardForHomeGesture
{
  void *v3;
  void *v7;
  void *v8;
  SBKeyboardHomeAffordanceAssertion *v9;
  SBKeyboardHomeAffordanceAssertion *v10;
  _BOOL4 keyboardStashed;
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  SBKeyboardHomeAffordanceAssertion *v13;
  void *v14;
  id v15;

  -[SBAssistantRootViewController fluidDismissalState](self, "fluidDismissalState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAssistantRootViewController ownsHomeGesture](self, "ownsHomeGesture"))
  {
    if (self->_keyboardPresented && v3 == 0)
    {
      keyboardStashed = 0;
    }
    else
    {
      if (self->_keyboardPresented && v3 != 0)
      {
        keyboardStashed = 1;
        goto LABEL_27;
      }
      if (!self->_keyboardPresented && v3 != 0)
      {
        keyboardStashed = self->_keyboardStashed;
        goto LABEL_27;
      }
      keyboardStashed = 0;
      if (!self->_keyboardStashed)
        goto LABEL_27;
    }
  }
  else
  {
    if (!v3)
    {
      keyboardStashed = 0;
      goto LABEL_27;
    }
    keyboardStashed = self->_keyboardStashed;
    if (!self->_keyboardHomeAffordanceAssertion)
    {
LABEL_27:
      keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
      if (keyboardHomeAffordanceAssertion)
      {
        -[SBKeyboardHomeAffordanceAssertion invalidate](keyboardHomeAffordanceAssertion, "invalidate");
        v13 = self->_keyboardHomeAffordanceAssertion;
        self->_keyboardHomeAffordanceAssertion = 0;

        if (keyboardStashed)
          goto LABEL_29;
        goto LABEL_32;
      }
LABEL_31:
      if (keyboardStashed)
        goto LABEL_29;
      goto LABEL_32;
    }
  }
  if (SBFEffectiveHomeButtonType() != 2)
    goto LABEL_27;
  if (self->_keyboardHomeAffordanceAssertion)
    goto LABEL_31;
  -[SBAssistantRootViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", v8);
  v9 = (SBKeyboardHomeAffordanceAssertion *)objc_claimAutoreleasedReturnValue();
  v10 = self->_keyboardHomeAffordanceAssertion;
  self->_keyboardHomeAffordanceAssertion = v9;

  if (keyboardStashed)
  {
LABEL_29:
    if (self->_keyboardStashed)
      return;
    self->_keyboardStashed = 1;
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_preserveInputViewsWithId:animated:", v14, 1);
    goto LABEL_34;
  }
LABEL_32:
  if (!self->_keyboardStashed)
    return;
  self->_keyboardStashed = 0;
  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_restoreInputViewsWithId:animated:", v14, 1);
LABEL_34:

}

- (SBHomeGrabberPointerClickDelegate)homeGrabberPointerClickDelegate
{
  return -[SBHomeGrabberView pointerClickDelegate](self->_homeAffordanceView, "pointerClickDelegate");
}

- (void)setHomeGrabberPointerClickDelegate:(id)a3
{
  -[SBHomeGrabberView setPointerClickDelegate:](self->_homeAffordanceView, "setPointerClickDelegate:", a3);
}

- (BOOL)dimsContentBelow
{
  -[UIView alpha](self->_dimmingView, "alpha");
  return BSFloatGreaterThanFloat();
}

- (void)setDimsContentBelow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DA9EE0], "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemAssistantExperienceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v3)
  {
    objc_msgSend(v6, "typeToSiriDimmingAlpha");
    v7 = v8;
  }
  v9 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(v6, "typeToSiriDimmingAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SBAssistantRootViewController_setDimsContentBelow___block_invoke;
  v11[3] = &unk_1E8E9DE88;
  v11[4] = self;
  v11[5] = v7;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v10, 3, v11, 0);

}

uint64_t __53__SBAssistantRootViewController_setDimsContentBelow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_keyboardWillShowNotification:(id)a3
{
  self->_keyboardPresented = 1;
  -[SBAssistantRootViewController _updateKeyboardForHomeGesture](self, "_updateKeyboardForHomeGesture", a3);
}

- (void)_keyboardWillHideNotification:(id)a3
{
  self->_keyboardPresented = 0;
  -[SBAssistantRootViewController _updateKeyboardForHomeGesture](self, "_updateKeyboardForHomeGesture", a3);
}

- (void)_setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  if (a4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke;
    v6[3] = &unk_1E8E9F508;
    v6[4] = self;
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v6, 0, 0.35, 0.0);
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke_2;
    v4[3] = &unk_1E8E9F508;
    v4[4] = self;
    v5 = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
  }
}

uint64_t __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "requestStatusBarVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);
}

uint64_t __62__SBAssistantRootViewController__setStatusBarHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "requestStatusBarVisible:animated:completion:", *(_BYTE *)(a1 + 40) == 0, 0, 0);
}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (void)setSiriPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriPresentationViewController, a3);
}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (BOOL)showsHomeAffordance
{
  return self->_showsHomeAffordance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_fluidDismissalState, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
}

- (SBFluidDismissalState)fluidDismissalState
{
  return self->_fluidDismissalState;
}

- (void)setFluidDismissalState:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;

  v15 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fluidDismissalState, a3);
    -[SiriPresentationSpringBoardMainScreenViewController setFluidDismissalState:](self->_siriPresentationViewController, "setFluidDismissalState:", v15);
    -[SBAssistantRootViewController _updateHomeAffordance](self, "_updateHomeAffordance");
    -[SBAssistantRootViewController _updateKeyboardForHomeGesture](self, "_updateKeyboardForHomeGesture");
    if (v15)
    {
      if (objc_msgSend(v15, "transitionPhase"))
      {
        v5 = objc_msgSend(v15, "transitionPhase") == 1;
      }
      else
      {
        -[SBAssistantRootViewController view](self, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bounds");
        v8 = v7;
        v10 = v9;
        v12 = v11;
        v14 = v13;

        objc_msgSend(v15, "contentRect");
        v16.origin.x = v8;
        v16.origin.y = v10;
        v16.size.width = v12;
        v16.size.height = v14;
        CGRectGetWidth(v16);
        v5 = BSFloatLessThanFloat();
      }
    }
    else
    {
      v5 = 0;
    }
    -[SBAssistantRootViewController _setStatusBarHidden:animated:](self, "_setStatusBarHidden:animated:", v5, 1);
  }

}

@end
