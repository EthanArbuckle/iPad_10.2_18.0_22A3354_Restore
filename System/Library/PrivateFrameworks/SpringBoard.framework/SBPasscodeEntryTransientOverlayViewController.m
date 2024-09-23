@implementation SBPasscodeEntryTransientOverlayViewController

- (SBPasscodeEntryTransientOverlayViewController)initWithAuthenticationController:(id)a3
{
  id v5;
  SBPasscodeEntryTransientOverlayViewController *v6;
  SBPasscodeEntryTransientOverlayViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  v6 = -[SBTransientOverlayViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authenticationController, a3);
    v7->_intent = 2;
    v7->_overridePresentationOrientation = 0;
  }

  return v7;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
    return -[SBTransientOverlayViewController preferredInterfaceOrientationForPresentation](&v6, sel_preferredInterfaceOrientationForPresentation);
  }
  else if (self->_overridePresentationOrientation <= 1uLL)
  {
    return 1;
  }
  else
  {
    return self->_overridePresentationOrientation;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  unint64_t overridePresentationOrientation;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
    return -[SBTransientOverlayViewController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
  else
  {
    overridePresentationOrientation = self->_overridePresentationOrientation;
    if (overridePresentationOrientation)
    {
      if (overridePresentationOrientation <= 2)
        return 2;
      else
        return 24;
    }
    else
    {
      return 2;
    }
  }
}

- (BOOL)shouldAutorotate
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  return -[SBTransientOverlayViewController shouldAutorotate](&v6, sel_shouldAutorotate);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerDidDisappear:", self);

}

- (void)viewDidLayoutSubviews
{
  SBUIPasscodeViewWithLockScreenStyle *passcodeView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  passcodeView = self->_passcodeView;
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBUIPasscodeViewWithLockScreenStyle setFrame:](passcodeView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBUIPasscodeViewWithLockScreenStyle *v8;
  SBUIPasscodeViewWithLockScreenStyle *passcodeView;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CSPoseidonViewController *v13;
  CSPoseidonViewController *poseidonViewController;
  CSPoseidonViewController *v15;
  void *v16;
  CSLockScreenPearlSettings *v17;
  CSLockScreenPearlSettings *pearlSettings;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  SBPasscodeEntryTransientOverlayViewController *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = -[SBUIPasscodeViewWithLockScreenStyle initWithFrame:includeBlur:passcodeViewGenerator:]([SBUIPasscodeViewWithLockScreenStyle alloc], "initWithFrame:includeBlur:passcodeViewGenerator:", 1, &__block_literal_global_195, v4, v5, v6, v7);
  passcodeView = self->_passcodeView;
  self->_passcodeView = v8;

  -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setShowsEmergencyCallButton:", self->_showEmergencyCallButton);
  objc_msgSend(v10, "setUnlockDestination:", self->_unlockDestination);
  objc_msgSend(v10, "setUsesBiometricPresentation:", self->_useBiometricPresentation);
  v11 = 0;
  v12 = SBFEffectiveArtworkSubtype();
  if (v12 > 2795)
  {
    if (v12 != 2796 && v12 != 2868)
      goto LABEL_7;
  }
  else if (v12 != 2556 && v12 != 2622)
  {
LABEL_7:
    v11 = 1;
  }
  objc_msgSend(v10, "setShowsProudLock:", v11);
  if (objc_msgSend(v10, "supportsPoseidonCoaching"))
  {
    v13 = (CSPoseidonViewController *)objc_alloc_init(MEMORY[0x1E0D1BC10]);
    poseidonViewController = self->_poseidonViewController;
    self->_poseidonViewController = v13;

    v15 = self->_poseidonViewController;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke_2;
    v22 = &unk_1E8E9EA00;
    v23 = v10;
    v24 = self;
    -[SBPasscodeEntryTransientOverlayViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v15, 0, &v19);

  }
  objc_msgSend(v3, "addSubview:", self->_passcodeView, v19, v20, v21, v22);
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pearlSettings");
  v17 = (CSLockScreenPearlSettings *)objc_claimAutoreleasedReturnValue();
  pearlSettings = self->_pearlSettings;
  self->_pearlSettings = v17;

  -[CSLockScreenPearlSettings addKeyObserver:](self->_pearlSettings, "addKeyObserver:", self);
  -[SBPasscodeEntryTransientOverlayViewController _updatePrototypeSettings](self, "_updatePrototypeSettings");

}

uint64_t __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DAC5F8], "passcodeLockViewForUsersCurrentStyle");
}

void __60__SBPasscodeEntryTransientOverlayViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1424);
  v8 = a2;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPoseidonContainerView:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1424), "poseidonContainerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPoseidonContainerViewController:", v7);

  v8[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBPasscodeEntryTransientOverlayViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerDidDetectFaceOcclusionsSinceScreenOn:", self))
  {
    -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteFaceHasBeenOccluded");

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerDidDetectBottomFaceOcclusionsSinceScreenOn:", self))
  {
    -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteBottomFaceHasBeenOccluded");

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerStatusText");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerStatusSubtitleText");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (v7 | v8)
  {
    -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateStatusText:subtitle:animated:", v7, v8, 0);

  }
  -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "becomeFirstResponder");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  void *v3;
  int v4;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") != 1)
    return 0;
  -[CSPoseidonViewController poseidonContainerViewController](self->_poseidonViewController, "poseidonContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "coachingActive");

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBPasscodeEntryTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsPoseidonCoaching");

  if (v9 && self->_keyboardVisible)
  {
    SBFWindowForViewControllerTransition();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_toWindowOrientation");
    if (v11 == 4 || v11 == 2)
    {
      -[CSPoseidonViewController poseidonContainerViewController](self->_poseidonViewController, "poseidonContainerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0;
    }
    else
    {
      -[CSPoseidonViewController poseidonContainerViewController](self->_poseidonViewController, "poseidonContainerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 1;
    }
    objc_msgSend(v12, "showCoaching:", v14);

  }
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (BOOL)canBecomeLocalFirstResponder
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  CAFrameRateRange v14;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:timingFunction:", v4, 0.4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
    objc_msgSend(v6, "setHighFrameRateReason:", 1114126);
    v7 = (void *)MEMORY[0x1E0D01908];
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v12[3] = &unk_1E8E9E820;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v3;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v10[3] = &unk_1E8E9DEB0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v13;
    objc_msgSend(v7, "animateWithSettings:actions:completion:", v6, v12, v10);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resignFirstResponder");

    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

uint64_t __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setBlurEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __98__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  CAFrameRateRange v15;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
  {
    v4 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v14[3] = &unk_1E8E9DED8;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v14);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:timingFunction:", v5, 0.4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
    objc_msgSend(v7, "setHighFrameRateReason:", 1114126);
    v8 = (void *)MEMORY[0x1E0D01908];
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v12[3] = &unk_1E8E9E820;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v3;
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v10[3] = &unk_1E8E9DEB0;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v13;
    objc_msgSend(v8, "animateWithSettings:actions:completion:", v7, v12, v10);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "becomeFirstResponder");

    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

void __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setBlurEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

uint64_t __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setBlurEnabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __101__SBPasscodeEntryTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "passcodeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E0DAB688];
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (void)handleSuccessfulAuthenticationRequest:(id)a3
{
  SBUIPasscodeLockView **p_passcodeRequester;
  id WeakRetained;

  p_passcodeRequester = &self->_passcodeRequester;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeRequester);
  objc_msgSend(WeakRetained, "resetForSuccess");

  self->_attemptingUnlock = 0;
  objc_storeWeak((id *)p_passcodeRequester, 0);
}

- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4
{
  SBUIPasscodeLockView **p_passcodeRequester;
  id WeakRetained;

  p_passcodeRequester = &self->_passcodeRequester;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeRequester);
  objc_msgSend(WeakRetained, "resetForFailedPasscode");

  self->_attemptingUnlock = 0;
  objc_storeWeak((id *)p_passcodeRequester, 0);
}

- (void)handleInvalidAuthenticationRequest:(id)a3
{
  -[SBPasscodeEntryTransientOverlayViewController handleFailedAuthenticationRequest:error:](self, "handleFailedAuthenticationRequest:error:", a3, 0);
}

- (void)handleWillShowKeyboard:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_keyboardVisible != a3)
    self->_keyboardVisible = a3;
  if (a3)
  {
    v4 = -[SBPasscodeEntryTransientOverlayViewController interfaceOrientation](self, "interfaceOrientation");
    if (v4 == 4 || v4 == 2)
    {
      -[CSPoseidonViewController poseidonContainerViewController](self->_poseidonViewController, "poseidonContainerViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showCoaching:", 0);

    }
  }
}

- (int64_t)idleTimerDuration
{
  return 6;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBFUserAuthenticationController *authenticationController;

  v4 = a3;
  -[SBTransientOverlayViewController setNeedsIdleTimerReset](self, "setNeedsIdleTimerReset");
  objc_msgSend(v4, "passcode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  authenticationController = self->_authenticationController;
  if (v6)
    -[SBFUserAuthenticationController notePasscodeEntryBegan](authenticationController, "notePasscodeEntryBegan");
  else
    -[SBFUserAuthenticationController notePasscodeEntryCancelled](authenticationController, "notePasscodeEntryCancelled");
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  -[SBPasscodeEntryTransientOverlayViewController _passcodeLockViewPasscodeEntered:authenticationType:](self, "_passcodeLockViewPasscodeEntered:authenticationType:", a3, 1);
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  -[SBPasscodeEntryTransientOverlayViewController _passcodeLockViewPasscodeEntered:authenticationType:](self, "_passcodeLockViewPasscodeEntered:authenticationType:", a3, 2);
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerRequestsDismissal:", self);

}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewControllerRequestsEmergencyCall:", self);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_pearlSettings == a3)
    -[SBPasscodeEntryTransientOverlayViewController _updatePrototypeSettings](self, "_updatePrototypeSettings");
}

- (void)setShowEmergencyCallButton:(BOOL)a3
{
  id v4;

  if (self->_showEmergencyCallButton != a3)
  {
    self->_showEmergencyCallButton = a3;
    -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsEmergencyCallButton:", self->_showEmergencyCallButton);

  }
}

- (void)setUnlockDestination:(id)a3
{
  NSString *v4;
  NSString *unlockDestination;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  unlockDestination = self->_unlockDestination;
  if (unlockDestination != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](unlockDestination, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_unlockDestination;
      self->_unlockDestination = v7;

      -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnlockDestination:", self->_unlockDestination);

      v4 = v10;
    }
  }

}

- (void)setUseBiometricPresentation:(BOOL)a3
{
  id v4;

  if (self->_useBiometricPresentation != a3)
  {
    self->_useBiometricPresentation = a3;
    -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsesBiometricPresentation:", self->_useBiometricPresentation);

  }
}

- (void)_attemptUnlock:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  SBPasscodeEntryTransientOverlayViewController *v26;
  _QWORD v27[4];
  id v28;
  SBPasscodeEntryTransientOverlayViewController *v29;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(v7, "length");
  -[SBFUserAuthenticationController addAsFirstResponder:](self->_authenticationController, "addAsFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "passcodeEntryTransientOverlayViewController:authenticatePasscode:", self, v7))
  {
    -[SBFUserAuthenticationController removeResponder:](self->_authenticationController, "removeResponder:", self);
  }
  else
  {
    -[SBFUserAuthenticationController removeResponder:](self->_authenticationController, "removeResponder:", self);
    v10 = objc_alloc(MEMORY[0x1E0DA9DA0]);
    if (v9)
      v11 = objc_msgSend(v10, "initForPasscode:source:", v7, 0);
    else
      v11 = objc_msgSend(v10, "initForBiometricAuthenticationWithSource:", 0);
    v12 = (void *)v11;
    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke;
    v27[3] = &unk_1E8E9E820;
    v14 = v6;
    v28 = v14;
    v29 = self;
    v15 = (void *)MEMORY[0x1D17E5550](v27);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_2;
    v24[3] = &unk_1E8E9E820;
    v25 = v14;
    v26 = self;
    v19 = v13;
    v20 = 3221225472;
    v21 = __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_3;
    v22 = &unk_1E8E9F598;
    v23 = (id)MEMORY[0x1D17E5550](v24);
    v16 = v23;
    v17 = (void *)MEMORY[0x1D17E5550](&v19);
    objc_msgSend(MEMORY[0x1E0DA9F50], "responderWithSuccessHandler:failureHandler:invalidHandler:", v15, v17, v16, v19, v20, v21, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFUserAuthenticationController processAuthenticationRequest:responder:](self->_authenticationController, "processAuthenticationRequest:responder:", v12, v18);

  }
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "resetForSuccess");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1384) = 0;
  return result;
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "resetForFailedPasscode");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1384) = 0;
  return result;
}

uint64_t __73__SBPasscodeEntryTransientOverlayViewController__attemptUnlock_passcode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4
{
  id v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  SBPasscodeEntryTransientOverlayViewController *v10;
  unint64_t v11;

  v6 = a3;
  if (!self->_attemptingUnlock)
  {
    self->_attemptingUnlock = 1;
    v7 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__SBPasscodeEntryTransientOverlayViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke;
    block[3] = &unk_1E8EA0AF0;
    v11 = a4;
    v9 = v6;
    v10 = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
}

void __101__SBPasscodeEntryTransientOverlayViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 48) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "passcode");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 1400), *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_attemptUnlock:passcode:", *(_QWORD *)(a1 + 32), v2);

}

- (void)_updatePrototypeSettings
{
  CSLockScreenPearlSettings *pearlSettings;
  void *v4;
  _OWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  pearlSettings = self->_pearlSettings;
  if (pearlSettings)
    -[CSLockScreenPearlSettings proudLockControllerViewControllerConfiguration](pearlSettings, "proudLockControllerViewControllerConfiguration");
  -[SBUIPasscodeViewWithLockScreenStyle passcodeView](self->_passcodeView, "passcodeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  objc_msgSend(v4, "setProudLockConfiguration:", v5);

}

- (SBPasscodeEntryTransientOverlayViewControllerDelegate)delegate
{
  return (SBPasscodeEntryTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showEmergencyCallButton
{
  return self->_showEmergencyCallButton;
}

- (BOOL)useBiometricPresentation
{
  return self->_useBiometricPresentation;
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (int)intent
{
  return self->_intent;
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
}

- (int64_t)overridePresentationOrientation
{
  return self->_overridePresentationOrientation;
}

- (void)setOverridePresentationOrientation:(int64_t)a3
{
  self->_overridePresentationOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_poseidonViewController, 0);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_destroyWeak((id *)&self->_passcodeRequester);
  objc_storeStrong((id *)&self->_authenticationController, 0);
}

@end
