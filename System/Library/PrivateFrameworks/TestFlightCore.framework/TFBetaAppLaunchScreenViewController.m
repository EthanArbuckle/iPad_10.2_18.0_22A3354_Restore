@implementation TFBetaAppLaunchScreenViewController

- (TFBetaAppLaunchScreenViewController)initWithPresenter:(id)a3
{
  id v5;
  TFBetaAppLaunchScreenViewController *v6;
  TFBetaAppLaunchScreenViewController *v7;
  uint64_t v8;
  UIBarButtonItem *cancelBarButtonItem;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaAppLaunchScreenViewController;
  v6 = -[TFBetaAppLaunchScreenViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v7, sel__didPressNavigationItemCancel);
    cancelBarButtonItem = v7->_cancelBarButtonItem;
    v7->_cancelBarButtonItem = (UIBarButtonItem *)v8;

  }
  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TFBetaAppLaunchScreenView *v8;
  TFBetaAppLaunchScreenView *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[TFBetaAppLaunchScreenViewController setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  v8 = [TFBetaAppLaunchScreenView alloc];
  v9 = -[TFBetaAppLaunchScreenView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[TFBetaAppLaunchScreenViewController setLaunchScreenView:](self, "setLaunchScreenView:", v9);

  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

}

- (void)viewDidLoad
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

  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TFBetaAppLaunchScreenViewController;
  -[TFBetaAppLaunchScreenViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[TFBetaAppLaunchScreenViewController launchScreenHost](self, "launchScreenHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TFBetaAppLaunchScreenViewController launchScreenHost](self, "launchScreenHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController _updateForContainmentInHostEnvironment:](self, "_updateForContainmentInHostEnvironment:", v5);

  }
  -[TFBetaAppLaunchScreenViewController presenter](self, "presenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "update");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TFBetaAppLaunchScreenViewController;
  -[TFBetaAppLaunchScreenViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[TFBetaAppLaunchScreenViewController launchScreenHost](self, "launchScreenHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TFBetaAppLaunchScreenViewController launchScreenHost](self, "launchScreenHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performSelector:withObject:", sel_launchScreenViewControllerWasDismissed_, self);

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TFBetaAppLaunchScreenViewController;
  -[TFBetaAppLaunchScreenViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TFBetaAppLaunchScreenViewController;
  -[TFBetaAppLaunchScreenViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)TFBetaAppLaunchScreenViewController;
  v7 = a4;
  -[TFBetaAppLaunchScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_24D794B18;
  v12[4] = self;
  v9 = (void *)MEMORY[0x219A0D03C](v12);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v11[3] = &unk_24D794B18;
  v11[4] = self;
  v10 = (void *)MEMORY[0x219A0D03C](v11);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v10);

}

void __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "launchScreenView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDeviceImageVisibility:", 0);

}

uint64_t __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "launchScreenView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceImageOrientation:", objc_msgSend(*(id *)(a1 + 32), "_currentInterfaceOrientation"));

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_24D794B40;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.3);
}

void __90__TFBetaAppLaunchScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "launchScreenView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDeviceImageVisibility:", 1);

}

- (int64_t)_currentInterfaceOrientation
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  return v3;
}

- (void)setLaunchScreenHost:(id)a3
{
  TFBetaAppLaunchScreenHost **p_launchScreenHost;
  id v5;

  p_launchScreenHost = &self->_launchScreenHost;
  v5 = a3;
  objc_storeWeak((id *)p_launchScreenHost, v5);
  -[TFBetaAppLaunchScreenViewController _updateForContainmentInHostEnvironment:](self, "_updateForContainmentInHostEnvironment:", v5);

}

- (void)_updateForContainmentInHostEnvironment:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController _updateNavigationBarForHostTraitCollection:](self, "_updateNavigationBarForHostTraitCollection:", v4);

  }
}

- (void)showLoadingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__TFBetaAppLaunchScreenViewController_showLoadingAnimated___block_invoke;
  v8[3] = &unk_24D794B40;
  v8[4] = self;
  v5 = MEMORY[0x219A0D03C](v8, a2);
  v6 = (void *)v5;
  if (v3)
  {
    -[TFBetaAppLaunchScreenViewController _fadeTransition](self, "_fadeTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController _animateLaunchScreenViewWithUpdateBlock:transition:](self, "_animateLaunchScreenViewWithUpdateBlock:transition:", v6, v7);

  }
  else
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }

}

void __59__TFBetaAppLaunchScreenViewController_showLoadingAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "launchScreenView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepareForState:", 0);

}

- (void)showTestNotesWithTitle:(id)a3 lockup:(id)a4 testNotesTitle:(id)a5 testNotesText:(id)a6 primaryButtonTitle:(id)a7 primaryButtonEvent:(unint64_t)a8 animated:(BOOL)a9 fetchingOnImageFetcher:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  TFBetaAppLaunchScreenViewController *v45;
  unint64_t v46;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __168__TFBetaAppLaunchScreenViewController_showTestNotesWithTitle_lockup_testNotesTitle_testNotesText_primaryButtonTitle_primaryButtonEvent_animated_fetchingOnImageFetcher___block_invoke;
  v38[3] = &unk_24D794B68;
  v23 = v22;
  v39 = v23;
  v40 = v16;
  v24 = v17;
  v41 = v24;
  v42 = v18;
  v43 = v19;
  v44 = v20;
  v45 = self;
  v46 = a8;
  v37 = v20;
  v36 = v19;
  v35 = v18;
  v25 = v16;
  v26 = (void (**)(_QWORD))MEMORY[0x219A0D03C](v38);
  objc_msgSend(v24, "iconArtwork");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lockupView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayedIconSize");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v23, "lockupView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchIconArtwork:ofSize:intoView:animated:", v27, v33, a9, v30, v32);

  if (a9)
  {
    -[TFBetaAppLaunchScreenViewController _fadeTransition](self, "_fadeTransition");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController _animateLaunchScreenViewWithUpdateBlock:transition:](self, "_animateLaunchScreenViewWithUpdateBlock:transition:", v26, v34);

  }
  else
  {
    v26[2](v26);
  }

}

uint64_t __168__TFBetaAppLaunchScreenViewController_showTestNotesWithTitle_lockup_testNotesTitle_testNotesText_primaryButtonTitle_primaryButtonEvent_animated_fetchingOnImageFetcher___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "prepareForState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLockup:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setBodyTitle:bodyText:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setPrimaryButtonTitle:target:action:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 80), "_selectorForPresentorViewEvent:", *(_QWORD *)(a1 + 88)));
}

- (void)showHowToWithTitle:(id)a3 subtitle:(id)a4 screenshotImageDict:(id)a5 primaryButtonTitle:(id)a6 primaryButtonEvent:(unint64_t)a7 secondaryButtonTitle:(id)a8 secondaryButtonEvent:(unint64_t)a9 animated:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  TFBetaAppLaunchScreenViewController *v36;
  id v37;
  id v38;
  unint64_t v39;
  unint64_t v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __176__TFBetaAppLaunchScreenViewController_showHowToWithTitle_subtitle_screenshotImageDict_primaryButtonTitle_primaryButtonEvent_secondaryButtonTitle_secondaryButtonEvent_animated___block_invoke;
  v31[3] = &unk_24D794B90;
  v32 = v18;
  v33 = v21;
  v34 = v16;
  v35 = v17;
  v36 = self;
  v37 = v19;
  v38 = v20;
  v39 = a7;
  v40 = a9;
  v22 = v20;
  v23 = v19;
  v24 = v17;
  v25 = v16;
  v26 = v21;
  v27 = v18;
  v28 = MEMORY[0x219A0D03C](v31);
  v29 = (void *)v28;
  if (a10)
  {
    -[TFBetaAppLaunchScreenViewController _pushTransition](self, "_pushTransition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController _animateLaunchScreenViewWithUpdateBlock:transition:](self, "_animateLaunchScreenViewWithUpdateBlock:transition:", v29, v30);

  }
  else
  {
    (*(void (**)(uint64_t))(v28 + 16))(v28);
  }

}

void __176__TFBetaAppLaunchScreenViewController_showHowToWithTitle_subtitle_screenshotImageDict_primaryButtonTitle_primaryButtonEvent_secondaryButtonTitle_secondaryButtonEvent_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("TFScreenshotInstructionDeviceImageKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "prepareForState:", 2);
  objc_msgSend(*(id *)(a1 + 40), "setTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setSubtitle:", *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(*(id *)(a1 + 64), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tf_imageNamed:compatibleWithTraitCollection:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceImage:withOrientation:", v5, objc_msgSend(*(id *)(a1 + 64), "_currentInterfaceOrientation"));

  objc_msgSend(*(id *)(a1 + 40), "setPrimaryButtonTitle:target:action:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 64), "_selectorForPresentorViewEvent:", *(_QWORD *)(a1 + 88)));
  objc_msgSend(*(id *)(a1 + 40), "setSecondaryButtonTitle:target:action:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 64), "_selectorForPresentorViewEvent:", *(_QWORD *)(a1 + 96)));

}

- (void)dismissAnimated:(BOOL)a3
{
  -[TFBetaAppLaunchScreenViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (void)_animateLaunchScreenViewWithUpdateBlock:(id)a3 transition:(id)a4
{
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = (void *)MEMORY[0x24BDE57D8];
  v7 = a4;
  v8 = (void (**)(_QWORD))a3;
  objc_msgSend(v6, "begin");
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotCurrentView");

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v8[2](v8);

  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cleanupSnapshot");

  -[TFBetaAppLaunchScreenViewController launchScreenView](self, "launchScreenView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("transition"));

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__TFBetaAppLaunchScreenViewController__animateLaunchScreenViewWithUpdateBlock_transition___block_invoke;
  v14[3] = &unk_24D794B40;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __90__TFBetaAppLaunchScreenViewController__animateLaunchScreenViewWithUpdateBlock_transition___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "launchScreenView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

- (id)_fadeTransition
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v3);

  objc_msgSend(v2, "setType:", *MEMORY[0x24BDE5E00]);
  objc_msgSend(v2, "setDuration:", 0.3);
  return v2;
}

- (id)_pushTransition
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  -[TFBetaAppLaunchScreenViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  objc_msgSend(MEMORY[0x24BDE57E8], "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v6);

  objc_msgSend(v5, "setType:", *MEMORY[0x24BDE5E30]);
  v7 = (_QWORD *)MEMORY[0x24BDE5E10];
  if (v4 != 1)
    v7 = (_QWORD *)MEMORY[0x24BDE5E18];
  objc_msgSend(v5, "setSubtype:", *v7);
  objc_msgSend(v5, "setDuration:", 0.3);
  return v5;
}

- (void)_updateNavigationBarForHostTraitCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_msgSend(a3, "horizontalSizeClass");
  -[TFBetaAppLaunchScreenViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == 2)
  {
    objc_msgSend(v6, "_setBackgroundOpacity:", 1.0);

    -[TFBetaAppLaunchScreenViewController navigationItem](self, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchScreenViewController cancelBarButtonItem](self, "cancelBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  }
  else
  {
    objc_msgSend(v6, "_setBackgroundOpacity:", 0.0);

    -[TFBetaAppLaunchScreenViewController navigationItem](self, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", 0);
  }

}

- (SEL)_selectorForPresentorViewEvent:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      return sel__didPressExitLaunchScreenButton;
    case 1uLL:
      return sel__didPressOpenHowToSupportLinkButton;
    case 0uLL:
      return sel__didPressShowHowToButton;
  }
  return self;
}

- (void)_didPressShowHowToButton
{
  id v2;

  -[TFBetaAppLaunchScreenViewController presenter](self, "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showHowToScreen");

}

- (void)_didPressOpenHowToSupportLinkButton
{
  id v2;

  -[TFBetaAppLaunchScreenViewController presenter](self, "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openHowToSupportLink");

}

- (void)_didPressExitLaunchScreenButton
{
  id v2;

  -[TFBetaAppLaunchScreenViewController presenter](self, "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitLaunchScreen");

}

- (void)_didPressNavigationItemCancel
{
  id v2;

  -[TFBetaAppLaunchScreenViewController presenter](self, "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitLaunchScreen");

}

- (TFBetaAppLaunchScreenHost)launchScreenHost
{
  return (TFBetaAppLaunchScreenHost *)objc_loadWeakRetained((id *)&self->_launchScreenHost);
}

- (TFBetaAppLaunchPresenter)presenter
{
  return self->_presenter;
}

- (TFBetaAppLaunchScreenView)launchScreenView
{
  return self->_launchScreenView;
}

- (void)setLaunchScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_launchScreenView, a3);
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_launchScreenView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_destroyWeak((id *)&self->_launchScreenHost);
}

@end
