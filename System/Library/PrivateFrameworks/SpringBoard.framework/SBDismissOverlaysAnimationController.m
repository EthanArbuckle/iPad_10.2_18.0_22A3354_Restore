@implementation SBDismissOverlaysAnimationController

+ (BOOL)willDismissOverlaysForDismissOptions:(unint64_t)a3
{
  return objc_msgSend(a1, "_overlaysToDismissForOptions:", a3) != 0;
}

+ (unint64_t)_overlaysToDismissForOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  int v16;

  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPresented");

    v6 = v8;
    if ((v3 & 2) == 0)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if ((v3 & 2) == 0)
      goto LABEL_7;
  }
  if (objc_msgSend(v4, "areAnyIconViewContextMenusShowing"))
    v6 |= 2uLL;
LABEL_7:
  if ((v3 & 4) != 0)
  {
    if (objc_msgSend(v5, "areAnyIconShareSheetsShowing"))
      v6 |= 4uLL;
    if ((v3 & 8) == 0)
    {
LABEL_9:
      if ((v3 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (+[SBAssistantController isVisible](SBAssistantController, "isVisible"))
    v6 |= 8uLL;
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_23:
  +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isVisible");

  if (v16)
    v6 |= 0x10uLL;
  if ((v3 & 0x20) != 0)
  {
LABEL_11:
    objc_msgSend((id)SBApp, "bannerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDisplayingBannerInAnyWindowScene");

    if (v10)
      v6 |= 0x20uLL;
  }
LABEL_13:
  objc_msgSend(v4, "homeScreenViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v3 & 0x40) != 0)
  {
    objc_msgSend(v11, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v6 |= 0x40uLL;
  }

  return v6;
}

- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  SBDismissOverlaysAnimationController *v8;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDismissOverlaysAnimationController.m"), 39, CFSTR("Unsupported initializer"));

  v8 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:](self, "initWithTransitionContextProvider:options:", v6, -1);
  return v8;
}

- (SBDismissOverlaysAnimationController)initWithTransitionContextProvider:(id)a3 options:(unint64_t)a4
{
  id v7;
  SBDismissOverlaysAnimationController *v8;
  SBDismissOverlaysAnimationController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDismissOverlaysAnimationController;
  v8 = -[SBUIAnimationController initWithTransitionContextProvider:](&v11, sel_initWithTransitionContextProvider_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_dismissOptions = a4;
    objc_storeStrong((id *)&v8->_transitionRequest, a3);
  }

  return v9;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_startAnimation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  id v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  _QWORD v34[4];
  id v35;
  id location[2];

  v3 = objc_msgSend((id)objc_opt_class(), "_overlaysToDismissForOptions:", self->_dismissOptions);
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionRequest displayIdentity](self->_transitionRequest, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  v7 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke;
  v34[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v35, location);
  v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v34);
  if ((v3 & 0x10) != 0)
  {
    +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismiss");

  }
  if ((v3 & 0xFFFFFFFFFFFFFFEFLL) != 0)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_2;
    v32[3] = &unk_1E8E9ED40;
    v32[4] = v33;
    v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v32);
    v29[0] = v7;
    v29[1] = 3221225472;
    v29[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_3;
    v29[3] = &unk_1E8EA8CD0;
    v31 = v33;
    v30 = v8;
    v11 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v29);
    v10[2](v10);
    if ((v3 & 1) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("Control Center Dismissal Milestone"));
      +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_4;
      v26[3] = &unk_1E8EA1EE0;
      objc_copyWeak(&v28, location);
      v27 = v11;
      objc_msgSend(v12, "dismissAnimated:completion:", 1, v26);

      objc_destroyWeak(&v28);
    }
    if ((v3 & 2) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("App Icon Force Touch Dismissal Milestone"));
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_5;
      v23[3] = &unk_1E8EA1EE0;
      objc_copyWeak(&v25, location);
      v24 = v11;
      objc_msgSend(v13, "dismissAppIconForceTouchControllers:", v23);

      objc_destroyWeak(&v25);
    }
    if ((v3 & 4) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("App Icon Share Sheet Dismissal Milestone"));
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "dismissIconShareSheets");
      -[SBDismissOverlaysAnimationController removeMilestone:](self, "removeMilestone:", CFSTR("App Icon Share Sheet Dismissal Milestone"));
      v11[2](v11);

    }
    if ((v3 & 8) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("Assistant Dismissal Milestone"));
      objc_msgSend(v6, "assistantController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dismissAssistantViewIfNecessaryWithAnimation:", 1);

      -[SBDismissOverlaysAnimationController removeMilestone:](self, "removeMilestone:", CFSTR("Assistant Dismissal Milestone"));
      v11[2](v11);
    }
    if ((v3 & 0x20) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("Banner Dismissal Milestone"));
      objc_msgSend((id)SBApp, "bannerManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dismissAllBannersInWindowScene:animated:reason:", v6, 1, CFSTR("dismissOverlays"));

      -[SBDismissOverlaysAnimationController removeMilestone:](self, "removeMilestone:", CFSTR("Banner Dismissal Milestone"));
      v11[2](v11);
    }
    if ((v3 & 0x40) != 0)
    {
      v10[2](v10);
      -[SBDismissOverlaysAnimationController addMilestone:](self, "addMilestone:", CFSTR("Presented View Controller Dismissal Milestone"));
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "homeScreenViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_6;
      v20[3] = &unk_1E8EA1EE0;
      objc_copyWeak(&v22, location);
      v21 = v11;
      objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, v20);

      objc_destroyWeak(&v22);
    }
    v11[2](v11);

    _Block_object_dispose(v33, 8);
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

}

void __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteAnimationDidFinish");

}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_3(uint64_t result)
{
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeMilestone:", CFSTR("Control Center Dismissal Milestone"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeMilestone:", CFSTR("App Icon Force Touch Dismissal Milestone"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBDismissOverlaysAnimationController__startAnimation__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeMilestone:", CFSTR("Presented View Controller Dismissal Milestone"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)animationSettings
{
  char v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  v2 = objc_msgSend((id)objc_opt_class(), "_overlaysToDismissForOptions:", self->_dismissOptions);
  v3 = fmax(*(double *)&kSBAssistantDefaultAnimationDuration, 0.0);
  if ((v2 & 8) == 0)
    v3 = 0.0;
  v4 = 0.375;
  if (v3 >= 0.375)
    v4 = v3;
  if ((v2 & 0x20) != 0)
    v5 = v4;
  else
    v5 = v3;
  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)dismissOptions
{
  return self->_dismissOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionRequest, 0);
}

@end
