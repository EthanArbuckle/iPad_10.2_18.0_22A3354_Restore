@implementation SBHomeScreenOverlayController

- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3 windowLevel:(double)a4 windowScene:(id)a5 traitsRole:(id)a6 zStackParticipantIdentifier:(int64_t)a7 screenEdgeSystemGestureType:(unint64_t)a8 indirectScreenEdgeSystemGestureType:(unint64_t)a9 scrunchSystemGestureType:(unint64_t)a10 secure:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  SBHomeScreenOverlayController *v21;
  SBHomeScreenOverlayViewController *v22;
  SBHomeScreenOverlayViewController *overlayViewController;
  uint64_t v24;
  id v25;
  void *v26;
  SBBarSwipeAffordanceViewController *v27;
  SBBarSwipeAffordanceViewController *v28;
  SBBarSwipeAffordanceViewController *homeAffordanceViewController;
  void *v30;
  void *v31;
  id v32;
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
  uint64_t v46;
  SBFWindow *window;
  id v49;
  objc_super v50;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v50.receiver = self;
  v50.super_class = (Class)SBHomeScreenOverlayController;
  v21 = -[SBHomeScreenOverlayController init](&v50, sel_init);
  if (v21)
  {
    v22 = -[SBHomeScreenOverlayViewController initWithListLayoutProvider:]([SBHomeScreenOverlayViewController alloc], "initWithListLayoutProvider:", v18);
    overlayViewController = v21->_overlayViewController;
    v21->_overlayViewController = v22;

    -[SBHomeScreenOverlayViewController setDelegate:](v21->_overlayViewController, "setDelegate:", v21);
    v21->_screenEdgeSystemGestureType = a8;
    v21->_indirectScreenEdgeSystemGestureType = a9;
    v21->_scrunchSystemGestureType = a10;
    if (SBHomeGestureEnabled())
    {
      v24 = objc_opt_class();
      v25 = v19;
      if (v24)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v49 = v26;

      v28 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceViewController alloc], "initWithZStackParticipantIdentifier:windowScene:", a7, v49);
      homeAffordanceViewController = v21->_homeAffordanceViewController;
      v21->_homeAffordanceViewController = v28;

      -[SBBarSwipeAffordanceViewController setSuppressAffordance:](v21->_homeAffordanceViewController, "setSuppressAffordance:", 1);
      -[SBBarSwipeAffordanceViewController addChildViewController:](v21->_homeAffordanceViewController, "addChildViewController:", v21->_overlayViewController);
      -[SBHomeScreenOverlayViewController view](v21->_overlayViewController, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBarSwipeAffordanceViewController view](v21->_homeAffordanceViewController, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v30);
      -[SBHomeScreenOverlayViewController didMoveToParentViewController:](v21->_overlayViewController, "didMoveToParentViewController:", v21->_homeAffordanceViewController);
      objc_msgSend(v31, "setDelegate:", v21);
      objc_msgSend(v31, "addObserver:", v21);
      objc_msgSend(v31, "setColorBias:", 2);
      objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v31, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v35);

      objc_msgSend(v31, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v38);

      objc_msgSend(v31, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v41);

      objc_msgSend(v31, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v44);

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
      v27 = v21->_homeAffordanceViewController;

    }
    else
    {
      v27 = v21->_overlayViewController;
    }
    objc_opt_self();
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(objc_alloc((Class)v45), "initWithWindowScene:", v19);
    window = v21->_window;
    v21->_window = (SBFWindow *)v46;

    -[SBFWindow _setRoleHint:](v21->_window, "_setRoleHint:", v20);
    -[SBFWindow setWindowLevel:](v21->_window, "setWindowLevel:", a4);
    -[SBFWindow setRootViewController:](v21->_window, "setRootViewController:", v27);
    -[SBHomeScreenOverlayController _configureDismissGestureRecognizer](v21, "_configureDismissGestureRecognizer");
    -[SBHomeScreenOverlayController _setHidden:](v21, "_setHidden:", 0);

  }
  return v21;
}

- (SBHomeScreenOverlayController)initWithListLayoutProvider:(id)a3
{
  id v4;
  SBHomeScreenOverlayController *v5;
  SBHomeScreenOverlayViewController *v6;
  SBHomeScreenOverlayViewController *overlayViewController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHomeScreenOverlayController;
  v5 = -[SBHomeScreenOverlayController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SBHomeScreenOverlayViewController initWithListLayoutProvider:]([SBHomeScreenOverlayViewController alloc], "initWithListLayoutProvider:", v4);
    overlayViewController = v5->_overlayViewController;
    v5->_overlayViewController = v6;

    -[SBHomeScreenOverlayViewController setDelegate:](v5->_overlayViewController, "setDelegate:", v5);
    -[SBHomeScreenOverlayController _configureDismissGestureRecognizer](v5, "_configureDismissGestureRecognizer");
    -[SBHomeScreenOverlayController _setHidden:](v5, "_setHidden:", 1);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFFrameRateAssertion invalidate](self->_frameRateAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_displayLayoutAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHomeScreenOverlayController;
  -[SBHomeScreenOverlayController dealloc](&v3, sel_dealloc);
}

- (void)_configureDismissGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *dismissTapGestureRecognizer;
  void *v5;
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *dismissPanGestureRecognizer;
  void *v8;
  id v9;

  -[SBHomeScreenOverlayController _rootViewController](self, "_rootViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_dismissTapGestureUpdated_);
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v3;

  -[UITapGestureRecognizer setDelegate:](self->_dismissTapGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v9, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_dismissTapGestureRecognizer);

  v6 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel_dismissScrollGestureUpdated_);
  dismissPanGestureRecognizer = self->_dismissPanGestureRecognizer;
  self->_dismissPanGestureRecognizer = v6;

  -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_dismissPanGestureRecognizer, "setAllowedScrollTypesMask:", 2);
  -[UIPanGestureRecognizer _setCanPanVertically:](self->_dismissPanGestureRecognizer, "_setCanPanVertically:", 0);
  -[UIPanGestureRecognizer setDelegate:](self->_dismissPanGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", self->_dismissPanGestureRecognizer);

}

- (SBHLibraryViewControllerPresenter)viewController
{
  return (SBHLibraryViewControllerPresenter *)self->_overlayViewController;
}

- (SBHVisibleContentPresenter)leadingSidebarViewController
{
  return -[SBHomeScreenOverlayViewController leadingSidebarViewController](self->_overlayViewController, "leadingSidebarViewController");
}

- (void)setLeadingSidebarViewController:(id)a3
{
  -[SBHomeScreenOverlayViewController setLeadingSidebarViewController:](self->_overlayViewController, "setLeadingSidebarViewController:", a3);
}

- (SBHVisibleContentPresenter)trailingSidebarViewController
{
  return -[SBHomeScreenOverlayViewController trailingSidebarViewController](self->_overlayViewController, "trailingSidebarViewController");
}

- (void)setTrailingSidebarViewController:(id)a3
{
  -[SBHomeScreenOverlayViewController setTrailingSidebarViewController:](self->_overlayViewController, "setTrailingSidebarViewController:", a3);
}

- (UIViewController)activeSidebarViewController
{
  void *v2;
  void *v3;

  -[SBHomeScreenOverlayViewController contentViewController](self->_overlayViewController, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avocadoViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5
{
  void (**v8)(id, uint64_t);
  double v9;
  double v10;
  SBFFrameRateAssertion *frameRateAssertion;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  double v17;
  double v18;
  _QWORD v19[5];
  void (**v20)(id, uint64_t);
  double v21;

  v8 = (void (**)(id, uint64_t))a5;
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  v10 = v9;
  if (BSFloatEqualToFloat())
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    -[SBHomeScreenOverlayController setAnimatingPresentationProgress:](self, "setAnimatingPresentationProgress:", 1);
    -[SBFFrameRateAssertion invalidate](self->_frameRateAssertion, "invalidate");
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = 0;

    -[SBHomeScreenOverlayController prepareToSetPresentationProgress:fromPresentationProgress:](self, "prepareToSetPresentationProgress:fromPresentationProgress:", a3, v10);
    -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke;
    v19[3] = &unk_1E8EAAD08;
    v19[4] = self;
    v21 = a3;
    v20 = v8;
    objc_msgSend(v12, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", v19, a3, a4);
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke_2;
    v15[3] = &unk_1E8EC0800;
    v17 = v10;
    v18 = a3;
    v15[4] = self;
    v16 = v12;
    v14 = v12;
    -[SBHomeScreenOverlayController _enumerateHomeScreenOverlayObserversUsingBlock:](self, "_enumerateHomeScreenOverlayObserversUsingBlock:", v15);

  }
}

uint64_t __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAnimatingPresentationProgress:", 0);
    objc_msgSend(*(id *)(a1 + 32), "cleanUpAfterSettingPresentationProgress:", *(double *)(a1 + 48));
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __106__SBHomeScreenOverlayController_animatePresentationProgress_withGestureLiftOffVelocity_completionHandler___block_invoke_2(double *a1, void *a2)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a1[6];
  v3 = a1[7];
  v4 = *((_QWORD *)a1 + 4);
  v5 = (void *)*((_QWORD *)a1 + 5);
  v6 = a2;
  objc_msgSend(v6, "overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:", v4, objc_msgSend(v5, "isFromLeading"), v2, v3);

}

- (void)setShouldUseReducedMotionAnimation:(BOOL)a3
{
  -[SBHomeScreenOverlayViewController setShouldUseReducedMotionAnimation:](self->_overlayViewController, "setShouldUseReducedMotionAnimation:", a3);
}

- (BOOL)shouldUseReducedMotionAnimation
{
  return -[SBHomeScreenOverlayViewController shouldUseReducedMotionAnimation](self->_overlayViewController, "shouldUseReducedMotionAnimation");
}

- (double)contentWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentWidth");
  v4 = v3;

  return v4;
}

- (BOOL)isPresented
{
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  return BSFloatGreaterThanFloat();
}

- (double)presentationProgress
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationProgress");
  v4 = v3;

  return v4;
}

- (void)setPresentationProgress:(double)a3
{
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:](self, "setPresentationProgress:fromLeading:", 1, a3);
}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4
{
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", a4, 0, 0, 0, a3);
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 1, a4, a5, a6, a3);
}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  int v9;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  id v23;
  SBFFrameRateAssertion *v24;
  SBFFrameRateAssertion *frameRateAssertion;
  _QWORD v26[7];
  char v27;
  _QWORD v28[5];
  void (**v29)(id, _QWORD);
  double v30;
  _QWORD v31[4];
  id v32;
  char v33;
  CAFrameRateRange v34;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v12 = (void (**)(id, _QWORD))a7;
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationProgress");
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v13, "contentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "avocadoViewController");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = objc_msgSend(v13, "isFromLeading");

      if (v17 != v9)
      {
        if (v12)
          v12[2](v12, 0);
        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  v18 = (void *)MEMORY[0x1E0CEABB0];
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke;
  v31[3] = &unk_1E8E9F508;
  v20 = v13;
  v32 = v20;
  v33 = v9;
  objc_msgSend(v18, "_performWithoutRetargetingAnimations:", v31);
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  v22 = v21;
  if (BSFloatEqualToFloat())
  {
    if (v12)
      v12[2](v12, 1);
  }
  else
  {
    if (!self->_frameRateAssertion && v8)
    {
      v23 = objc_alloc(MEMORY[0x1E0DA9E18]);
      v34 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      v24 = (SBFFrameRateAssertion *)objc_msgSend(v23, "initWithFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v34.minimum, *(double *)&v34.maximum, *(double *)&v34.preferred);
      frameRateAssertion = self->_frameRateAssertion;
      self->_frameRateAssertion = v24;

    }
    -[SBHomeScreenOverlayController prepareToSetPresentationProgress:fromPresentationProgress:](self, "prepareToSetPresentationProgress:fromPresentationProgress:", a3, v22);
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_2;
    v28[3] = &unk_1E8EAAD08;
    v28[4] = self;
    v30 = a3;
    v29 = v12;
    objc_msgSend(v20, "setPresentationProgress:interactive:animated:completionHandler:", v8, v7, v28, a3);
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_3;
    v26[3] = &unk_1E8EC0828;
    v26[4] = self;
    *(double *)&v26[5] = v22;
    *(double *)&v26[6] = a3;
    v27 = v9;
    -[SBHomeScreenOverlayController _enumerateHomeScreenOverlayObserversUsingBlock:](self, "_enumerateHomeScreenOverlayObserversUsingBlock:", v26);

  }
LABEL_15:

}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFromLeading:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "cleanUpAfterSettingPresentationProgress:", *(double *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __108__SBHomeScreenOverlayController_setPresentationProgress_fromLeading_interactive_animated_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)prepareToSetPresentationProgress:(double)a3 fromPresentationProgress:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[SBHomeScreenOverlayController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", a3 >= 0.5);
  if (a3 > 0.0)
  {
    -[SBHomeScreenOverlayController _setHidden:](self, "_setHidden:", 0);
    -[SBHomeScreenOverlayController _addSystemGestureRecognizer](self, "_addSystemGestureRecognizer");
  }
  else
  {
    -[SBHomeScreenOverlayController _removeSystemGestureRecognizer](self, "_removeSystemGestureRecognizer");
  }
  -[SBHomeScreenOverlayController setDismissing:](self, "setDismissing:", a3 <= 0.0);
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayController existingAvocadoVC](self, "existingAvocadoVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avocadoViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v18, "_appearState") == 2 && v6 != 0 && v6 != v8;
  -[SBHomeScreenOverlayController setExistingAvocadoVC:](self, "setExistingAvocadoVC:", v8);
  if (!objc_msgSend(v18, "_appearState") || objc_msgSend(v18, "_appearState") == 1)
  {
    if (BSFloatIsZero())
    {
      if (!-[SBHomeScreenOverlayController isOverlayAppearing](self, "isOverlayAppearing"))
      {
        -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_appearState");

        if (!v13)
        {
          objc_msgSend(v18, "bs_beginAppearanceTransition:animated:", 1, 1);
          -[SBHomeScreenOverlayController setOverlayAppearing:](self, "setOverlayAppearing:", 1);
        }
      }
    }
    if (BSFloatGreaterThanFloat()
      && -[SBHomeScreenOverlayController isOverlayAppearing](self, "isOverlayAppearing"))
    {
      -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bs_endAppearanceTransition:", 1);

      -[SBHomeScreenOverlayController setOverlayAppearing:](self, "setOverlayAppearing:", 0);
    }
  }
  if (v11)
  {
    objc_msgSend(v8, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

    objc_msgSend(v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

  }
  -[SBHomeScreenOverlayController homeAffordanceViewController](self, "homeAffordanceViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWantsToBeActiveAffordance:", a3 >= 1.0);

  -[SBHomeScreenOverlayController _setHitTestingDisabled:](self, "_setHitTestingDisabled:", -[SBHomeScreenOverlayController isDismissing](self, "isDismissing"));
}

- (void)cleanUpAfterSettingPresentationProgress:(double)a3
{
  void *v4;
  void *v5;
  SBFFrameRateAssertion *frameRateAssertion;

  if (BSFloatIsZero() && !-[SBHomeScreenOverlayController isOverlayAppearing](self, "isOverlayAppearing"))
  {
    -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_beginAppearanceTransition:animated:", 0, 1);

    -[SBHomeScreenOverlayController _setHidden:](self, "_setHidden:", 1);
    -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_endAppearanceTransition:", 0);

  }
  -[SBHomeScreenOverlayController setExistingAvocadoVC:](self, "setExistingAvocadoVC:", 0);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    -[SBFFrameRateAssertion invalidate](self->_frameRateAssertion, "invalidate");
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = 0;

  }
}

- (double)presentationProgressForTranslation:(double)a3 initialPresentationProgress:(double)a4 fromLeading:(BOOL)a5
{
  double result;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[SBHomeScreenOverlayController contentWidth](self, "contentWidth");
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (double)finalPresentationProgressForTranslation:(double)a3 velocity:(double)a4 initialPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  int v6;
  int v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double result;

  v6 = a6;
  v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  v12 = a4 / 1000.0 * *MEMORY[0x1E0CEBBA8] / (1.0 - *MEMORY[0x1E0CEBBA8]) + a3;
  -[SBHomeScreenOverlayController contentWidth](self, "contentWidth");
  v14 = v12 / v13;
  if (v11 == v6)
    v14 = -v14;
  v15 = v14 + a5 <= 0.5;
  result = 0.0;
  if (!v15)
    return 1.0;
  return result;
}

- (void)addHomeScreenOverlayObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeHomeScreenOverlayObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)presentAnimated:(BOOL)a3
{
  -[SBHomeScreenOverlayController setPresentationProgress:interactive:animated:completionHandler:](self, "setPresentationProgress:interactive:animated:completionHandler:", 0, a3, 0, 1.0);
}

- (void)presentAnimated:(BOOL)a3 completionHandler:(id)a4
{
  -[SBHomeScreenOverlayController setPresentationProgress:interactive:animated:completionHandler:](self, "setPresentationProgress:interactive:animated:completionHandler:", 0, a3, a4, 1.0);
}

- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4
{
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", a4, 0, a3, 0, 1.0);
}

- (void)presentAnimated:(BOOL)a3 fromLeading:(BOOL)a4 completionHandler:(id)a5
{
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", a4, 0, a3, a5, 1.0);
}

- (void)_dismissLevelAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[SBHomeScreenOverlayController dismissalDelegate](self, "dismissalDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "interceptDismissalGestureForOverlayController:", self) & 1) == 0)
    -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", v4, v8);

}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = a3;
  v6 = a4;
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFromLeading");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBHomeScreenOverlayController_dismissAnimated_completionHandler___block_invoke;
  v9[3] = &unk_1E8EC0850;
  v9[4] = self;
  -[SBHomeScreenOverlayController _enumerateHomeScreenOverlayObserversUsingBlock:](self, "_enumerateHomeScreenOverlayObserversUsingBlock:", v9);
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", v8, 0, v4, v6, 0.0);

}

uint64_t __67__SBHomeScreenOverlayController_dismissAnimated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overlayControllerDidBeginChangingPresentationProgress:", *(_QWORD *)(a1 + 32));
}

- (void)dismissUsingViewControllerTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  double v13;
  char v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFromLeading");

  objc_msgSend(v5, "setFromLeading:", v7);
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  v9 = v8;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    -[SBHomeScreenOverlayController prepareToSetPresentationProgress:fromPresentationProgress:](self, "prepareToSetPresentationProgress:fromPresentationProgress:", 0.0, v9);
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E8E9EA28;
    v16 = v5;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E8EC08A0;
    v11[4] = self;
    v12 = v16;
    v13 = v9;
    v14 = v7;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v15, v11);

  }
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentationProgress:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setSuppressesExtraEditingButtons:", 1);
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[6];
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "cleanUpAfterSettingPresentationProgress:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setSuppressesExtraEditingButtons:", 0);
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E8EC0878;
  v4[4] = v2;
  v4[5] = *(_QWORD *)(a1 + 48);
  v5 = *(_BYTE *)(a1 + 56);
  return objc_msgSend(v2, "_enumerateHomeScreenOverlayObserversUsingBlock:", v4);
}

uint64_t __81__SBHomeScreenOverlayController_dismissUsingViewControllerTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overlayController:didChangePresentationProgress:newPresentationProgress:fromLeading:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40), 0.0);
}

- (void)addReasonToDisableDismissGestureRecognizer:(id)a3
{
  id v5;
  NSCountedSet *reasonsToDisablePanGestureRecognizer;
  NSCountedSet *v7;
  NSCountedSet *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenOverlayController.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reasonToDisablePanGestureRecognizer"));

    v5 = 0;
  }
  reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
  if (!reasonsToDisablePanGestureRecognizer)
  {
    v7 = (NSCountedSet *)objc_opt_new();
    v8 = self->_reasonsToDisablePanGestureRecognizer;
    self->_reasonsToDisablePanGestureRecognizer = v7;

    v5 = v11;
    reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
  }
  v9 = (void *)objc_msgSend(v5, "copy");
  -[NSCountedSet addObject:](reasonsToDisablePanGestureRecognizer, "addObject:", v9);

  if (-[NSCountedSet count](self->_reasonsToDisablePanGestureRecognizer, "count"))
    -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGestureRecognizer, "setEnabled:", 0);

}

- (void)removeReasonToDisableDismissGestureRecognizer:(id)a3
{
  id v5;
  NSCountedSet *reasonsToDisablePanGestureRecognizer;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenOverlayController.m"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reasonToDisablePanGestureRecognizer"));

    v5 = 0;
  }
  -[NSCountedSet removeObject:](self->_reasonsToDisablePanGestureRecognizer, "removeObject:", v5);
  if (!-[NSCountedSet count](self->_reasonsToDisablePanGestureRecognizer, "count"))
  {
    reasonsToDisablePanGestureRecognizer = self->_reasonsToDisablePanGestureRecognizer;
    self->_reasonsToDisablePanGestureRecognizer = 0;

    -[UIPanGestureRecognizer setEnabled:](self->_dismissPanGestureRecognizer, "setEnabled:", 1);
  }

}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
  -[SBHomeScreenOverlayViewController updateExtraButtonVisibilityAnimated:](self->_overlayViewController, "updateExtraButtonVisibilityAnimated:", a3);
}

- (unint64_t)contentVisibility
{
  return -[SBHomeScreenOverlayViewController contentVisibility](self->_overlayViewController, "contentVisibility");
}

- (void)setContentVisibility:(unint64_t)a3
{
  -[SBHomeScreenOverlayViewController setContentVisibility:](self->_overlayViewController, "setContentVisibility:", a3);
}

- (void)_enumerateHomeScreenOverlayObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutAssertion;
  void *v5;
  void *v6;
  id v7;
  BSInvalidatable *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  BSInvalidatable *v17;
  BSInvalidatable *v18;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      -[SBHomeScreenOverlayController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[SBHomeScreenOverlayController activeSidebarViewController](self, "activeSidebarViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v5, "homeScreenOverlayController:displayLayoutIdentifierForSidebarViewController:", self, v6);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          SBLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

          if (v11)
            NSLog(&CFSTR("There really should be an active sidebar view controller if we're setting it active; if not, then the"
                         " user is seeing only a fullscreen blur and no Today View or App Library content.").isa);
          SBLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            -[SBHomeScreenOverlayController _setDisplayLayoutElementActive:].cold.1(v12);

          v7 = (id)*MEMORY[0x1E0DAB6B0];
        }
        v9 = v7;

      }
      else
      {
        v9 = (id)*MEMORY[0x1E0DAB6B0];
      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v9);
      -[SBHomeScreenOverlayController window](self, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "level");
      objc_msgSend(v13, "setLevel:", (uint64_t)v15);

      objc_msgSend(v13, "setFillsDisplayBounds:", 1);
      objc_msgSend(v13, "setLayoutRole:", 3);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addElement:", v13);
      v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v18 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v17;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v8 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (id)_rootViewController
{
  SBFWindow *window;
  SBHomeScreenOverlayViewController *v4;

  window = self->_window;
  if (window)
  {
    -[SBFWindow rootViewController](window, "rootViewController");
    v4 = (SBHomeScreenOverlayViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_overlayViewController;
  }
  return v4;
}

- (void)_setHitTestingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  SBFWindow *window;
  SBFWindow *v5;
  SBFWindow *v6;

  v3 = a3;
  window = self->_window;
  if (window)
  {
    v5 = window;
  }
  else
  {
    -[SBHomeScreenOverlayViewController view](self->_overlayViewController, "view");
    v5 = (SBFWindow *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v3)
  {
    -[SBFWindow endEditing:](v5, "endEditing:", 0);
    v5 = v6;
  }
  -[SBFWindow bs_setHitTestingDisabled:](v5, "bs_setHitTestingDisabled:", v3);

}

- (void)_setHidden:(BOOL)a3
{
  _BOOL8 v3;
  SBFWindow *window;
  SBFWindow *v6;
  SBFWindow *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  window = self->_window;
  if (window)
  {
    v6 = window;
  }
  else
  {
    -[SBHomeScreenOverlayViewController view](self->_overlayViewController, "view");
    v6 = (SBFWindow *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (-[SBFWindow isHidden](v6, "isHidden") != v3)
  {
    -[SBFWindow setHidden:](v7, "setHidden:", v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__SBHomeScreenOverlayController__setHidden___block_invoke;
    v8[3] = &unk_1E8EC08C8;
    v8[4] = self;
    v9 = v3;
    -[SBHomeScreenOverlayController _enumerateHomeScreenOverlayObserversUsingBlock:](self, "_enumerateHomeScreenOverlayObserversUsingBlock:", v8);
  }

}

uint64_t __44__SBHomeScreenOverlayController__setHidden___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overlayController:visibilityDidChange:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

- (void)dismissTapGestureUpdated:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  id v10;
  CGPoint v11;
  CGRect v12;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 3)
  {
    -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    objc_msgSend(v4, "contentRect");
    v11.x = v7;
    v11.y = v9;
    if (!CGRectContainsPoint(v12, v11))
      -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 1, 0);

  }
}

- (double)layerPresentationProgress
{
  double result;

  -[SBHomeScreenOverlayViewController layerPresentationProgress](self->_overlayViewController, "layerPresentationProgress");
  return result;
}

- (double)_directionCoefficient
{
  void *v2;
  double v3;

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isFromLeading"))
    v3 = 1.0;
  else
    v3 = -1.0;

  return v3;
}

- (void)dismissScrollGestureUpdated:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != 2)
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[SBHomeScreenOverlayController _dismissScrollGestureBegan:](self, "_dismissScrollGestureBegan:", v7);
    }
    -[SBHomeScreenOverlayController _dismissScrollGestureChanged:](self, "_dismissScrollGestureChanged:", v7);
  }
  else
  {
    -[SBHomeScreenOverlayController _dismissScrollGestureEndedOrCancelled:](self, "_dismissScrollGestureEndedOrCancelled:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_dismissScrollGestureBegan:(id)a3
{
  double v4;
  _QWORD v5[5];

  -[SBHomeScreenOverlayController setDismissing:](self, "setDismissing:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SBHomeScreenOverlayController__dismissScrollGestureBegan___block_invoke;
  v5[3] = &unk_1E8EC0850;
  v5[4] = self;
  -[SBHomeScreenOverlayController _enumerateHomeScreenOverlayObserversUsingBlock:](self, "_enumerateHomeScreenOverlayObserversUsingBlock:", v5);
  -[SBHomeScreenOverlayController layerPresentationProgress](self, "layerPresentationProgress");
  self->_initialPresentationProgress = v4;
}

uint64_t __60__SBHomeScreenOverlayController__dismissScrollGestureBegan___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overlayControllerDidBeginChangingPresentationProgress:", *(_QWORD *)(a1 + 32));
}

- (void)_dismissScrollGestureChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFromLeading");

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v8);
  v10 = v9;

  -[SBHomeScreenOverlayController presentationProgressForTranslation:initialPresentationProgress:fromLeading:](self, "presentationProgressForTranslation:initialPresentationProgress:fromLeading:", v6, v10, self->_initialPresentationProgress);
  -[SBHomeScreenOverlayController setPresentationProgress:fromLeading:interactive:animated:completionHandler:](self, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", v6, 1, 1, 0);
}

- (void)_dismissScrollGestureEndedOrCancelled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v4 = a3;
  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFromLeading");

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v8);
  v10 = v9;

  -[SBHomeScreenOverlayController overlayViewController](self, "overlayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v12);
  v14 = v13;

  -[SBHomeScreenOverlayController finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:](self, "finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:", v6, v14, v10, self->_initialPresentationProgress);
  -[SBHomeScreenOverlayController animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:](self, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
}

- (void)_addSystemGestureRecognizer
{
  -[SBBarSwipeAffordanceViewController setSuppressAffordance:](self->_homeAffordanceViewController, "setSuppressAffordance:", 0);
}

- (void)_removeSystemGestureRecognizer
{
  -[SBBarSwipeAffordanceViewController setSuppressAffordance:](self->_homeAffordanceViewController, "setSuppressAffordance:", 1);
}

- (id)testScrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenOverlayViewController contentViewController](self->_overlayViewController, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avocadoViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_majorScrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)interceptDismissalGestureForOverlayController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
    v7 = objc_msgSend(WeakRetained, "interceptDismissalGestureForOverlayController:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)overlayControllerRequestsDismissal:(id)a3
{
  -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 1, 0);
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return *(unint64_t *)((char *)&self->super.isa + qword_1D0E8BE88[a4 - 1]);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGPoint v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;

  v6 = a4;
  v7 = a3;
  -[SBHomeScreenOverlayController dismissTapGestureRecognizer](self, "dismissTapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SBHomeScreenOverlayViewController leadingSidebarViewController](self->_overlayViewController, "leadingSidebarViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenOverlayViewController trailingSidebarViewController](self->_overlayViewController, "trailingSidebarViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewIfLoaded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "locationInView:", v11);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "locationInView:", v13);
    v19 = v18;
    v21 = v20;
    v9 = 0;
    if (!v11 || (objc_msgSend(v11, "frame"), v23.x = v15, v23.y = v17, !CGRectContainsPoint(v25, v23)))
    {
      if (!v13 || (objc_msgSend(v13, "frame"), v24.x = v19, v24.y = v21, !CGRectContainsPoint(v26, v24)))
        v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return !-[SBHomeScreenOverlayController isDismissing](self, "isDismissing", a3);
}

- (int64_t)idleTimerDuration
{
  _BOOL4 v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  if (v2)
    return 9;
  else
    return 0;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 4096;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  if (BSFloatGreaterThanFloat())
    return 2;
  else
    return 1;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4;
  BOOL v5;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 27)
  {
    v5 = 1;
    -[SBHomeScreenOverlayController _dismissLevelAnimated:completionHandler:](self, "_dismissLevelAnimated:completionHandler:", 1, 0);
    return v5;
  }
  if (v4 == 25)
  {
    -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 0, 0);
    return 0;
  }
  if (v4 != 12)
    return 0;
  v5 = 1;
  -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 1, 0);
  return v5;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  return v3 == 12 || v3 == 27;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  -[SBHomeScreenOverlayController _dismissLevelAnimated:completionHandler:](self, "_dismissLevelAnimated:completionHandler:", 1, 0);
}

- (void)homeScreenOverlayViewControllerRequestsDismissal:(id)a3
{
  -[SBHomeScreenOverlayController dismissAnimated:completionHandler:](self, "dismissAnimated:completionHandler:", 1, 0);
}

- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundViewForEditingDoneButtonForHomeScreenOverlayController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)homeScreenOverlayViewWantsToEndEditing:(id)a3
{
  id v4;

  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenOverlayWantsToEndEditing:", self);

}

- (void)homeScreenOverlayViewWantsWidgetEditingViewControllerPresented:(id)a3
{
  id v4;

  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenOverlayWantsWidgetEditingViewControllerPresented:", self);

}

- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayViewController:(id)a3
{
  SBHomeScreenOverlayController *v3;
  void *v4;

  v3 = self;
  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:", v3);

  return (char)v3;
}

- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayViewController:(id)a3
{
  SBHomeScreenOverlayController *v3;
  void *v4;

  v3 = self;
  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "showsDoneButtonWhileEditingForHomeScreenOverlayController:", v3);

  return (char)v3;
}

- (BOOL)isEditingForHomeScreenOverlayViewController:(id)a3
{
  SBHomeScreenOverlayController *v3;
  void *v4;

  v3 = self;
  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isEditingForHomeScreenOverlayController:", v3);

  return (char)v3;
}

- (void)homeScreenOverlayViewController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBHomeScreenOverlayController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScreenOverlayController:setSuppressesEditingStateForListView:", self, v4);

}

- (NSString)description
{
  return (NSString *)-[SBHomeScreenOverlayController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHomeScreenOverlayController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHomeScreenOverlayController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBHomeScreenOverlayController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayController presentationProgress](self, "presentationProgress");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("presentationProgress"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHomeScreenOverlayController isDismissing](self, "isDismissing"), CFSTR("isDismissing"));
  -[SBFWindow level](self->_window, "level");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("windowLevel"));
  return v4;
}

- (SBFOverlayDismissalDelegate)dismissalDelegate
{
  return (SBFOverlayDismissalDelegate *)objc_loadWeakRetained((id *)&self->_dismissalDelegate);
}

- (void)setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalDelegate, a3);
}

- (SBHomeScreenOverlayControllerDelegate)delegate
{
  return (SBHomeScreenOverlayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (SBFWindow)window
{
  return self->_window;
}

- (SBBarSwipeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (SBHomeScreenOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, a3);
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (unint64_t)screenEdgeSystemGestureType
{
  return self->_screenEdgeSystemGestureType;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, a3);
}

- (unint64_t)indirectScreenEdgeSystemGestureType
{
  return self->_indirectScreenEdgeSystemGestureType;
}

- (unint64_t)scrunchSystemGestureType
{
  return self->_scrunchSystemGestureType;
}

- (BOOL)isAnimatingPresentationProgress
{
  return self->_animatingPresentationProgress;
}

- (void)setAnimatingPresentationProgress:(BOOL)a3
{
  self->_animatingPresentationProgress = a3;
}

- (BOOL)isOverlayAppearing
{
  return self->_overlayAppearing;
}

- (void)setOverlayAppearing:(BOOL)a3
{
  self->_overlayAppearing = a3;
}

- (UIViewController)existingAvocadoVC
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_existingAvocadoVC);
}

- (void)setExistingAvocadoVC:(id)a3
{
  objc_storeWeak((id *)&self->_existingAvocadoVC, a3);
}

- (double)initialPresentationProgress
{
  return self->_initialPresentationProgress;
}

- (void)setInitialPresentationProgress:(double)a3
{
  self->_initialPresentationProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_existingAvocadoVC);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
  objc_storeStrong((id *)&self->_frameRateAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToDisablePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_setDisplayLayoutElementActive:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "Trying to set the display layout element for the home screen overlay to active but no active sidebar exists!", v1, 2u);
}

@end
