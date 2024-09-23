@implementation SHSheetRouter

- (SHSheetRouter)initWithRootViewController:(id)a3 mainNavigationController:(id)a4 supportsModalPresentations:(BOOL)a5
{
  id v8;
  id v9;
  SHSheetRouter *v10;
  SHSheetRouter *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHSheetRouter;
  v10 = -[SHSheetRouter init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_rootViewController, v8);
    v11->_supportsModalPresentations = a5;
    objc_msgSend(v9, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_mainNavigationController, a4);
  }

  return v11;
}

- (SHSheetRouter)initWithRootViewController:(id)a3 supportsModalPresentations:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SHSheetRouter *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
  if ((dyld_program_sdk_at_least() & 1) == 0 && v8 != 1)
    objc_msgSend(v9, "_setPreferredNavigationBarPosition:", 2);
  v10 = -[SHSheetRouter initWithRootViewController:mainNavigationController:supportsModalPresentations:](self, "initWithRootViewController:mainNavigationController:supportsModalPresentations:", v6, v9, v4);

  return v10;
}

- (BOOL)isPresentedWithinPopover
{
  void *v2;
  BOOL IsPresentedInPopover;

  -[SHSheetRouter rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsPresentedInPopover = SHSheetIsPresentedInPopover(v2);

  return IsPresentedInPopover;
}

- (void)presentMainViewController:(id)a3 withNavigationControllerSupport:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SHSheetRouter setMainViewController:](self, "setMainViewController:", v6);
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Install main view:%@ parentViewController:%@", (uint8_t *)&v13, 0x16u);

  }
  -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v6, 0);

  if (a4)
  {
    -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v6;
  }
  v11 = v10;
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRouter _installChildViewController:forParentViewController:](self, "_installChildViewController:forParentViewController:", v11, v12);

  -[SHSheetRouter _configureMainViewController:](self, "_configureMainViewController:", v11);
}

- (void)presentSecondaryViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _UIActivityNavigationController *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetRouter setSecondaryViewController:](self, "setSecondaryViewController:", v4);
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Present secondary view:%@ parentViewController:%@", (uint8_t *)&v10, 0x16u);

  }
  v7 = -[_UIActivityNavigationController initWithRootViewController:]([_UIActivityNavigationController alloc], "initWithRootViewController:", v4);
  -[_UIActivityNavigationController setDelegate:](v7, "setDelegate:", self);
  -[_UIActivityNavigationController setTransitioningDelegate:](v7, "setTransitioningDelegate:", self);
  -[_UIActivityNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
  -[_UIActivityNavigationController setPreferredContentSize:](v7, "setPreferredContentSize:", _ShareSheetDefaultSheetSize());
  -[_UIActivityNavigationController navigationBar](v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestedContentSize:", 3);

  -[SHSheetRouter setSecondaryNavigationController:](self, "setSecondaryNavigationController:", v7);
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)presentUserDefaultsViewController:(id)a3
{
  id v4;
  NSObject *v5;
  _UIActivityNavigationController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _UIActivityNavigationController *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Present user defaults view controller:%@", (uint8_t *)&v12, 0xCu);
  }

  if (-[SHSheetRouter supportsModalPresentations](self, "supportsModalPresentations"))
  {
    v6 = -[_UIActivityNavigationController initWithRootViewController:]([_UIActivityNavigationController alloc], "initWithRootViewController:", v4);
    -[_UIActivityNavigationController setDelegate:](v6, "setDelegate:", self);
    -[_UIActivityNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
    -[SHSheetRouter setUserDefaultsNavigationController:](self, "setUserDefaultsNavigationController:", v6);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
      -[_UIActivityNavigationController setPreferredContentSize:](v6, "setPreferredContentSize:", _ShareSheetFormSheetSize());
    -[SHSheetRouter _presentViewController:](self, "_presentViewController:", v6);
  }
  else
  {
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
      v11 = (_UIActivityNavigationController *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;

    -[_UIActivityNavigationController pushViewController:animated:](v6, "pushViewController:animated:", v4, 1);
    -[SHSheetRouter setUserDefaultsNavigationController:](self, "setUserDefaultsNavigationController:", v6);
  }

}

- (void)_configurePresentationBlockingViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setModalPresentationStyle:", 6);
  objc_msgSend(v3, "setModalTransitionStyle:", 2);

}

- (void)presentPresentationBlockingViewController
{
  void *v3;
  void *v4;
  SHSheetPresentationBlockingViewController *v5;

  -[SHSheetRouter presentationBlockingViewController](self, "presentationBlockingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = objc_alloc_init(SHSheetPresentationBlockingViewController);
    -[SHSheetPresentationBlockingViewController setDelegate:](v5, "setDelegate:", self);
    -[SHSheetRouter setPresentationBlockingViewController:](self, "setPresentationBlockingViewController:", v5);
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, 0, 0);

  }
}

- (void)dismissPresentationBlockingViewControllerIfNeeded
{
  void *v3;
  void *v4;

  -[SHSheetRouter presentationBlockingViewController](self, "presentationBlockingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SHSheetRouter presentationBlockingViewController](self, "presentationBlockingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

    -[SHSheetRouter setPresentationBlockingViewController:](self, "setPresentationBlockingViewController:", 0);
  }
}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  if (-[SHSheetRouter supportsModalPresentations](self, "supportsModalPresentations"))
  {
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRouter mainViewController](self, "mainViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[SHSheetRouter rootViewController](self, "rootViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

  }
  else
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetRouter rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __40__SHSheetRouter__presentViewController___block_invoke;
  v18 = &unk_1E4001248;
  v19 = v10;
  v20 = v4;
  v11 = v4;
  v12 = v10;
  v13 = MEMORY[0x1A1AE9514](&v15);
  v14 = (void *)v13;
  if (v5)
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v13, v15, v16, v17, v18, v19, v20);
  else
    (*(void (**)(uint64_t))(v13 + 16))(v13);

}

uint64_t __40__SHSheetRouter__presentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)presentAirdropViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[SHSheetRouter _configureAirdropViewController:](self, "_configureAirdropViewController:", v4);
  -[SHSheetRouter _presentViewController:](self, "_presentViewController:", v4);

}

- (void)installAirdropViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SHSheetRouter _configureAirdropViewController:](self, "_configureAirdropViewController:", v5);
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetRouter _installChildViewController:forParentViewController:](self, "_installChildViewController:forParentViewController:", v5, v4);

  -[SHSheetRouter _configureMainViewController:](self, "_configureMainViewController:", v5);
}

- (void)presentAlertController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  id v12;

  v12 = a3;
  -[SHSheetRouter userDefaultsNavigationController](self, "userDefaultsNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getSFAirDropViewControllerClass();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "presentedViewController");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(v8, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)presentOptionsViewController:(id)a3 dismissalHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _UIActivityNavigationController *v12;
  void *v13;
  _UIActivityNavigationController *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[SHSheetRouter setOptionsViewController:](self, "setOptionsViewController:", v23);
  -[SHSheetRouter setOptionsViewControllerDismissalHandler:](self, "setOptionsViewControllerDismissalHandler:", v6);

  -[SHSheetRouter rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 6 || -[SHSheetRouter isPresentedWithinPopover](self, "isPresentedWithinPopover"))
  {
    -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
      v12 = (_UIActivityNavigationController *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v14 = v12;
      -[_UIActivityNavigationController pushViewController:animated:](v12, "pushViewController:animated:", v23, 1);
      goto LABEL_8;
    }
  }
  -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v12 = (_UIActivityNavigationController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (_UIActivityNavigationController *)v23;
  }
  else
  {
    v14 = -[_UIActivityNavigationController initWithRootViewController:]([_UIActivityNavigationController alloc], "initWithRootViewController:", v23);
    -[_UIActivityNavigationController setDelegate:](v14, "setDelegate:", self);
    -[_UIActivityNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 2);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 1)
      -[_UIActivityNavigationController setPreferredContentSize:](v14, "setPreferredContentSize:", _ShareSheetFormSheetSize());
  }
  v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _ShareSheetBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 2, self, sel__dismissOptionsViewController);

  objc_msgSend(v23, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRightBarButtonItem:", v20);

  -[SHSheetRouter mainViewController](self, "mainViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v14, 1, 0);

LABEL_8:
}

- (void)_dismissOptionsViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[SHSheetRouter mainViewController](self, "mainViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SHSheetRouter__dismissOptionsViewController__block_invoke;
  v4[3] = &unk_1E40016A0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__SHSheetRouter__dismissOptionsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didDismissOptionsViewController");

}

- (void)_didDismissOptionsViewController
{
  void (**v3)(void);

  -[SHSheetRouter setOptionsViewController:](self, "setOptionsViewController:", 0);
  -[SHSheetRouter optionsViewControllerDismissalHandler](self, "optionsViewControllerDismissalHandler");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SHSheetRouter setOptionsViewControllerDismissalHandler:](self, "setOptionsViewControllerDismissalHandler:", 0);
    v3[2]();
  }

}

- (void)presentCollaborationParticipantsViewController:(id)a3 dismissalHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _UIActivityNavigationController *v12;
  void *v13;
  _UIActivityNavigationController *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[SHSheetRouter setCollaborationParticipantsViewController:](self, "setCollaborationParticipantsViewController:", v20);
  -[SHSheetRouter setCollaborationParticipantsDismissalHandler:](self, "setCollaborationParticipantsDismissalHandler:", v6);

  -[SHSheetRouter rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 6 || -[SHSheetRouter isPresentedWithinPopover](self, "isPresentedWithinPopover"))
  {
    -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SHSheetRouter mainNavigationController](self, "mainNavigationController");
      v12 = (_UIActivityNavigationController *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v14 = v12;
      -[_UIActivityNavigationController pushViewController:animated:](v12, "pushViewController:animated:", v20, 1);
      goto LABEL_8;
    }
  }
  -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v12 = (_UIActivityNavigationController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = -[_UIActivityNavigationController initWithRootViewController:]([_UIActivityNavigationController alloc], "initWithRootViewController:", v20);
  -[_UIActivityNavigationController setDelegate:](v14, "setDelegate:", self);
  -[_UIActivityNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 1)
    -[_UIActivityNavigationController setPreferredContentSize:](v14, "setPreferredContentSize:", _ShareSheetFormSheetSize());
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismissCollaborationParticipantsViewController);
  objc_msgSend(v20, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRightBarButtonItem:", v17);

  -[SHSheetRouter mainViewController](self, "mainViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentViewController:animated:completion:", v14, 1, 0);

LABEL_8:
}

- (void)dismissCollaborationParticipantsViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[SHSheetRouter mainViewController](self, "mainViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SHSheetRouter_dismissCollaborationParticipantsViewController__block_invoke;
  v4[3] = &unk_1E40016A0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__SHSheetRouter_dismissCollaborationParticipantsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didDismissCollaborationParticipantsViewController");

}

- (void)_didDismissCollaborationParticipantsViewController
{
  void (**v3)(void);

  -[SHSheetRouter setCollaborationParticipantsViewController:](self, "setCollaborationParticipantsViewController:", 0);
  -[SHSheetRouter collaborationParticipantsDismissalHandler](self, "collaborationParticipantsDismissalHandler");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SHSheetRouter setCollaborationParticipantsDismissalHandler:](self, "setCollaborationParticipantsDismissalHandler:", 0);
    v3[2]();
  }

}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss secondary navigation controller:%@", (uint8_t *)&v9, 0xCu);

    }
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v3, 0);

  }
}

- (void)dismissUserDefaultsViewControllerAnimated:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SHSheetRouter userDefaultsNavigationController](self, "userDefaultsNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SHSheetRouter userDefaultsNavigationController](self, "userDefaultsNavigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss user defaults navigation controller:%@", (uint8_t *)&v8, 0xCu);

    }
    -[SHSheetRouter userDefaultsNavigationController](self, "userDefaultsNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)dismissForActivityPerformerResult:(id)a3 didPresentFromShareSheet:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char v39;
  NSObject *v40;
  void *v41;
  _BOOL4 v42;
  SHSheetRouter *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL8 v50;
  SHSheetRouter *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  BOOL v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v5 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "completedState");

  if (v12 != 5)
  {
    objc_msgSend(v10, "_embeddedActivityViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || v18)
    {
      -[SHSheetRouter rootViewController](self, "rootViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceIdiom");

      if (v21 == 6)
      {
        objc_msgSend(v10, "activityViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "presentingViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          -[SHSheetRouter rootViewController](self, "rootViewController");
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v25;

        v11 = v22;
        goto LABEL_26;
      }
      -[SHSheetRouter rootViewController](self, "rootViewController");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    if ((objc_msgSend(v10, "_managesOwnPresentation") & 1) == 0)
      goto LABEL_28;
LABEL_13:
    v17 = 0;
LABEL_26:

    goto LABEL_27;
  }
  if (!v5)
    goto LABEL_13;
  objc_msgSend(v11, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  if ((objc_msgSend(v11, "isBeingDismissed") & 1) != 0
    || (objc_msgSend(v11, "presentingViewController"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        !v15))
  {

    v11 = 0;
  }
  objc_msgSend(v11, "presentingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v11, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = v11;
  }
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v17 != (void *)v27)
  {
    v11 = (void *)v27;
    goto LABEL_26;
  }
  objc_msgSend(v17, "presentingViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v17, "presentingViewController");
    v26 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
LABEL_23:
    v17 = (void *)v26;
    goto LABEL_26;
  }
LABEL_27:
  v11 = v17;
LABEL_28:
  share_sheet_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v11;
    _os_log_impl(&dword_19E419000, v29, OS_LOG_TYPE_DEFAULT, "View controller to dismiss from:%@", buf, 0xCu);
  }

  objc_msgSend(v11, "presentedViewController");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = (void *)v30;
  else
    v32 = v11;
  v33 = v32;

  share_sheet_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v33;
    _os_log_impl(&dword_19E419000, v34, OS_LOG_TYPE_DEFAULT, "View controller to dismiss:%@", buf, 0xCu);
  }

  if (v33)
  {
    objc_msgSend(v33, "_window");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      v36 = objc_msgSend(v33, "isBeingDismissed") ^ 1;
    else
      v36 = 0;

  }
  else
  {
    v36 = 1;
  }
  v37 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke;
  v59[3] = &unk_1E4003BE8;
  v61 = v5;
  v59[4] = self;
  v38 = v8;
  v60 = v38;
  v39 = objc_msgSend(v10, "_dismissActivityFromViewController:animated:completion:", v11, v36, v59);
  share_sheet_log();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v41 = v10;
    v42 = v5;
    v43 = self;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v63 = v44;
    _os_log_impl(&dword_19E419000, v40, OS_LOG_TYPE_DEFAULT, "Use custom presentation:%@", buf, 0xCu);

    self = v43;
    v5 = v42;
    v10 = v41;
    v37 = MEMORY[0x1E0C809B0];
  }

  if ((v39 & 1) == 0)
  {
    if (v11)
      v45 = v36;
    else
      v45 = 0;
    if (v45 == 1)
    {
      share_sheet_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v33;
        _os_log_impl(&dword_19E419000, v46, OS_LOG_TYPE_DEFAULT, "Dismiss view controller manually:%@", buf, 0xCu);
      }

      v57[0] = v37;
      v57[1] = 3221225472;
      v57[2] = __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke_14;
      v57[3] = &unk_1E4002500;
      v57[4] = self;
      v58 = v38;
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v57);

    }
    else
    {
      if (v5)
      {
        -[SHSheetRouter rootViewController](self, "rootViewController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "_window");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          -[SHSheetRouter rootViewController](self, "rootViewController");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v49, "isBeingDismissed") & 1) != 0)
          {
            v50 = 1;
          }
          else
          {
            -[SHSheetRouter rootViewController](self, "rootViewController");
            v51 = self;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "presentingViewController");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v53 == 0;

            self = v51;
          }

        }
        else
        {
          v50 = 1;
        }

      }
      else
      {
        v50 = 1;
      }
      share_sheet_log();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        -[SHSheetRouter rootViewController](self, "rootViewController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBOOL();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v63 = v55;
        v64 = 2112;
        v65 = v56;
        _os_log_impl(&dword_19E419000, v54, OS_LOG_TYPE_DEFAULT, "didDismissRootViewController:%@ = %@", buf, 0x16u);

      }
      (*((void (**)(id, _BOOL8))v38 + 2))(v38, v50);
    }
  }

}

uint64_t __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "rootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "rootViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentingViewController");

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __94__SHSheetRouter_dismissForActivityPerformerResult_didPresentFromShareSheet_completionHandler___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_configureMainViewController:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SHSheetRouter rootViewController](self, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  objc_msgSend(v4, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

}

- (void)_configureAirdropViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  if (_ShareSheetPlatformPrefersPopover())
    objc_msgSend(v3, "setPreferredContentSize:", _ShareSheetFormSheetSize());

}

- (void)_installChildViewController:(id)a3 forParentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  objc_msgSend(v8, "willMoveToParentViewController:", v5);
  objc_msgSend(v5, "addChildViewController:", v8);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(v8, "didMoveToParentViewController:", v5);
}

- (BOOL)activityPerformerCanPresent:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[SHSheetRouter rootViewController](self, "rootViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentModalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v6 = 1;
    else
      v6 = -[SHSheetRouter isPresentedWithinPopover](self, "isPresentedWithinPopover");

  }
  return v6;
}

- (BOOL)activityPerformer:(id)a3 presentPopoverContentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_popoverController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(v9, "contentViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SHSheetRouter rootViewController](self, "rootViewController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v10 == v11))
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v7;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Present popover content view controller:%@", (uint8_t *)&v21, 0xCu);
    }

    if (v9)
    {
      v12 = 1;
      objc_msgSend(v9, "setContentViewController:animated:", v7, 1);
    }
    else
    {
      if (-[SHSheetRouter isPresentedWithinPopover](self, "isPresentedWithinPopover"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBackgroundColor:", v14);

        objc_msgSend(v7, "setModalPresentationStyle:", 6);
        objc_msgSend(v7, "setModalTransitionStyle:", 2);
        -[SHSheetRouter rootViewController](self, "rootViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v12 = 1;
      }
      else
      {
        objc_msgSend(v7, "setModalPresentationStyle:", 2);
        objc_msgSend(v7, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 1;
        objc_msgSend(v18, "setTintAdjustmentMode:", 1);

        objc_msgSend(v6, "activity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_willPresentAsFormSheet");

        -[SHSheetRouter rootViewController](self, "rootViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
      }
      objc_msgSend(v16, "presentViewController:animated:completion:", v7, 1, 0);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)activityPerformer:(id)a3 preparePresentationWithContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "shouldPresentOverCurrentContext")
    && !objc_msgSend(v7, "isCloudSharing"))
  {
    -[SHSheetRouter mainViewController](self, "mainViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  v15 = v14;
  share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v7;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "Prepare presentation with context:%@ presentationViewController:%@", buf, 0x16u);
  }

  if (objc_msgSend(v7, "shouldDismissBeforePresentation"))
  {
    -[SHSheetRouter rootViewController](self, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "shouldPresentOverCurrentContext"))
    {

      -[SHSheetRouter rootViewController](self, "rootViewController");
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v12 = (id)v18;
    }
    -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v17;
    v22 = v21;

  }
  else
  {
    v22 = 0;
  }
  v23 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke;
  v32[3] = &unk_1E4001A88;
  v32[4] = self;
  v24 = v15;
  v33 = v24;
  v25 = v8;
  v34 = v25;
  v26 = MEMORY[0x1A1AE9514](v32);
  v27 = (void *)v26;
  if (v22)
  {
    share_sheet_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v22;
      _os_log_impl(&dword_19E419000, v28, OS_LOG_TYPE_DEFAULT, "Dismiss view controller before presentation:%@", buf, 0xCu);
    }

    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_19;
    v29[3] = &unk_1E4001A88;
    v29[4] = self;
    v30 = v12;
    v31 = v27;
    objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, v29);

  }
  else
  {
    (*(void (**)(uint64_t))(v26 + 16))(v26);
  }

}

uint64_t __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentationViewController:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_19(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  objc_msgSend(a1[4], "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != a1[5])
  {

LABEL_7:
    (*((void (**)(void))a1[6] + 2))();
    return;
  }
  v5 = objc_msgSend(a1[4], "isPresentedWithinPopover");

  if (!v5)
    goto LABEL_7;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss activity view controller before presentation", buf, 2u);
  }

  objc_msgSend(a1[4], "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_20;
  v8[3] = &unk_1E40013E8;
  v9 = a1[6];
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v8);

}

uint64_t __77__SHSheetRouter_activityPerformer_preparePresentationWithContext_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)activityPerformer:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[SHSheetRouter rootViewController](self, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412290;
    v39 = v7;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Present view controller for activity:%@", (uint8_t *)&v38, 0xCu);
  }

  objc_msgSend(v9, "popoverPresentationController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v7, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "popoverPresentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "barButtonItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "popoverPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBarButtonItem:", v15);

      objc_msgSend(v9, "popoverPresentationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sourceRect");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(v7, "popoverPresentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

      objc_msgSend(v9, "popoverPresentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sourceView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "popoverPresentationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceView:", v28);

    }
  }
  objc_msgSend(v7, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTintAdjustmentMode:", 1);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  -[SHSheetRouter rootViewController](self, "rootViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "horizontalSizeClass") == 1 && v33)
  {
    v36 = objc_msgSend(v7, "modalPresentationStyle");

    if (v36 == 7)
      objc_msgSend(v7, "setModalPresentationStyle:", 2);
  }
  else
  {

  }
  -[SHSheetRouter presentationViewController](self, "presentationViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "presentViewController:animated:completion:", v7, 1, v8);

}

- (void)activityPerformCleanUpPresentation:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SHSheetRouter activityPerformCleanUpPresentation:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[SHSheetRouter setPresentationViewController:](self, "setPresentationViewController:", 0);
}

- (void)activityPerformer:(id)a3 startListeningForDismissalTransitionWithCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  if (!self->_listenForDismissalTransition)
  {
    v6 = a4;
    v7 = a3;
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SHSheetRouter activityPerformer:startListeningForDismissalTransitionWithCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    self->_listenForDismissalTransition = 1;
    -[SHSheetRouter setListenerCompletionHandler:](self, "setListenerCompletionHandler:", v6);

    objc_msgSend(v7, "activity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "activityViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRouter setCurrentViewControllerForActivityBeingListened:](self, "setCurrentViewControllerForActivityBeingListened:", v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__presentationControllerDismissalTransitionDidEndNotification_, *MEMORY[0x1E0DC5218], 0);

  }
}

- (void)activityPerformerStopListeningForDismissalTransition:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (self->_listenForDismissalTransition)
  {
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SHSheetRouter activityPerformerStopListeningForDismissalTransition:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    self->_listenForDismissalTransition = 0;
    -[SHSheetRouter setListenerCompletionHandler:](self, "setListenerCompletionHandler:", 0);
    -[SHSheetRouter setCurrentViewControllerForActivityBeingListened:](self, "setCurrentViewControllerForActivityBeingListened:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5218], 0);

  }
}

- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void (**v14)(void);
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5210]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (self->_listenForDismissalTransition && v7)
  {
    -[SHSheetRouter currentViewControllerForActivityBeingListened](self, "currentViewControllerForActivityBeingListened");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRouter presentationViewController](self, "presentationViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (!v8 && v9)
    {
      if (v11 == 1)
      {
        objc_msgSend(v9, "presentedViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
    objc_msgSend(v4, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v8)
    {
      share_sheet_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Presentation controller dismissal detected for %@", (uint8_t *)&v15, 0xCu);
      }

      -[SHSheetRouter listenerCompletionHandler](self, "listenerCompletionHandler");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();

    }
  }

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;

  v7 = a3;
  v8 = a4;
  -[SHSheetRouter secondaryNavigationController](self, "secondaryNavigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4188]), "initWithPresentedViewController:presentingViewController:", v7, v8);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_referenceBounds");
    v13 = v12;
    v15 = v14;

    v16 = v13 != 320.0 || v15 != 568.0;
    objc_msgSend(v10, "_setWantsBottomAttachedInCompactHeight:", v16);
    objc_msgSend(v10, "_setWidthFollowsPreferredContentSizeWhenBottomAttached:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "disappearingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (v6)
  {
    objc_msgSend(v14, "disappearingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRouter collaborationParticipantsViewController](self, "collaborationParticipantsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      -[SHSheetRouter collaborationParticipantsDismissalHandler](self, "collaborationParticipantsDismissalHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[SHSheetRouter _didDismissCollaborationParticipantsViewController](self, "_didDismissCollaborationParticipantsViewController");
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v14, "disappearingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRouter optionsViewController](self, "optionsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {

LABEL_10:
      v7 = v14;
      goto LABEL_11;
    }
    -[SHSheetRouter optionsViewControllerDismissalHandler](self, "optionsViewControllerDismissalHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v14;
    if (v13)
    {
      -[SHSheetRouter _didDismissOptionsViewController](self, "_didDismissOptionsViewController");
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)handlePresentationBlockingViewControllerClose
{
  void *v2;
  id v3;

  -[SHSheetRouter mainViewController](self, "mainViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleClose");

}

- (BOOL)presentationBlockingViewShouldPresentCloseButton
{
  void *v2;
  BOOL v3;

  -[SHSheetRouter mainViewController](self, "mainViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectivePresentationStyle") != 7;

  return v3;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (SHSheetContentView)mainViewController
{
  return (SHSheetContentView *)objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (void)setMainViewController:(id)a3
{
  objc_storeWeak((id *)&self->_mainViewController, a3);
}

- (void)setActivityPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_activityPresentationController, a3);
}

- (UINavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (void)setMainNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_mainNavigationController, a3);
}

- (UINavigationController)secondaryNavigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_secondaryNavigationController);
}

- (void)setSecondaryNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryNavigationController, a3);
}

- (UINavigationController)userDefaultsNavigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_userDefaultsNavigationController);
}

- (void)setUserDefaultsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_userDefaultsNavigationController, a3);
}

- (SHSheetContentView)secondaryViewController
{
  return (SHSheetContentView *)objc_loadWeakRetained((id *)&self->_secondaryViewController);
}

- (void)setSecondaryViewController:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryViewController, a3);
}

- (UIViewController)presentationBlockingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentationBlockingViewController);
}

- (void)setPresentationBlockingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationBlockingViewController, a3);
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationViewController, a3);
}

- (UIViewController)currentViewControllerForActivityBeingListened
{
  return self->_currentViewControllerForActivityBeingListened;
}

- (void)setCurrentViewControllerForActivityBeingListened:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewControllerForActivityBeingListened, a3);
}

- (BOOL)listenForDismissalTransition
{
  return self->_listenForDismissalTransition;
}

- (void)setListenForDismissalTransition:(BOOL)a3
{
  self->_listenForDismissalTransition = a3;
}

- (id)listenerCompletionHandler
{
  return self->_listenerCompletionHandler;
}

- (void)setListenerCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIViewController)collaborationParticipantsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_collaborationParticipantsViewController);
}

- (void)setCollaborationParticipantsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationParticipantsViewController, a3);
}

- (id)collaborationParticipantsDismissalHandler
{
  return self->_collaborationParticipantsDismissalHandler;
}

- (void)setCollaborationParticipantsDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)supportsModalPresentations
{
  return self->_supportsModalPresentations;
}

- (UIViewController)optionsViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_optionsViewController);
}

- (void)setOptionsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_optionsViewController, a3);
}

- (id)optionsViewControllerDismissalHandler
{
  return self->_optionsViewControllerDismissalHandler;
}

- (void)setOptionsViewControllerDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsViewControllerDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_optionsViewController);
  objc_storeStrong(&self->_collaborationParticipantsDismissalHandler, 0);
  objc_destroyWeak((id *)&self->_collaborationParticipantsViewController);
  objc_storeStrong(&self->_listenerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentViewControllerForActivityBeingListened, 0);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_destroyWeak((id *)&self->_presentationBlockingViewController);
  objc_destroyWeak((id *)&self->_secondaryViewController);
  objc_destroyWeak((id *)&self->_userDefaultsNavigationController);
  objc_destroyWeak((id *)&self->_secondaryNavigationController);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_activityPresentationController, 0);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_destroyWeak((id *)&self->_rootViewController);
}

- (void)activityPerformCleanUpPresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_19E419000, a1, a3, "Clean up presentation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)activityPerformer:(uint64_t)a3 startListeningForDismissalTransitionWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_19E419000, a1, a3, "Start listening for dismissal transition", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)activityPerformerStopListeningForDismissalTransition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_19E419000, a1, a3, "Stop listening for dismissal transition", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

@end
