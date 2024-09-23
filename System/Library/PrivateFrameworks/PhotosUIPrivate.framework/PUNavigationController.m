@implementation PUNavigationController

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  objc_super v5;

  if (-[PUNavigationController pu_alwaysForwardsPreferredStatusBarStyle](self, "pu_alwaysForwardsPreferredStatusBarStyle"))
  {
    -[PUNavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUNavigationController;
    -[PUNavigationController childViewControllerForStatusBarStyle](&v5, sel_childViewControllerForStatusBarStyle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)pu_alwaysForwardsPreferredStatusBarStyle
{
  return self->_pu_alwaysForwardsPreferredStatusBarStyle;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUNavigationController;
  -[PUNavigationController loadView](&v5, sel_loadView);
  -[PUNavigationController _alternateBackKeyCommand](self, "_alternateBackKeyCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x100000, sel__performAlternateBackKeyCommand_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUNavigationController addKeyCommand:](self, "addKeyCommand:", v4);
    -[PUNavigationController _setAlternateBackKeyCommand:](self, "_setAlternateBackKeyCommand:", v4);

  }
}

- (void)_setAlternateBackKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->__alternateBackKeyCommand, a3);
}

- (UIKeyCommand)_alternateBackKeyCommand
{
  return self->__alternateBackKeyCommand;
}

- (PUNavigationController)initWithRootViewController:(id)a3
{
  PUNavigationController *v3;
  PUNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUNavigationController;
  v3 = -[PUNavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
    -[PUNavigationController _commonPUNavigationControllerInitialization](v3, "_commonPUNavigationControllerInitialization");
  return v4;
}

- (void)_commonPUNavigationControllerInitialization
{
  uint64_t v3;

  v3 = -[PUNavigationController _toolbarClass](self, "_toolbarClass");
  if (!v3 || v3 == objc_opt_class())
    -[PUNavigationController _setToolbarClass:](self, "_setToolbarClass:", objc_opt_class());
  -[PUNavigationController setDelegate:](self, "setDelegate:", self);
}

- (id)childViewControllerForStatusBarHidden
{
  void *v3;
  objc_super v5;

  if (-[PUNavigationController pu_alwaysForwardsPrefersStatusBarHidden](self, "pu_alwaysForwardsPrefersStatusBarHidden"))
  {
    -[PUNavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUNavigationController;
    -[PUNavigationController childViewControllerForStatusBarHidden](&v5, sel_childViewControllerForStatusBarHidden);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)pu_alwaysForwardsPrefersStatusBarHidden
{
  return self->_pu_alwaysForwardsPrefersStatusBarHidden;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = v4 & ~-[PUNavigationController pu_disablePushPopAnimation](self, "pu_disablePushPopAnimation");
  if ((PUNavigationControllerPushingWithTransition & 1) != 0
    || (v8 = PURequestedNavigationTransitionIsInteractive,
        (v9 = (id)PURequestedNavigationTransition) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)PUNavigationController;
    -[PUNavigationController pushViewController:animated:](&v11, sel_pushViewController_animated_, v6, v7);
  }
  else
  {
    v10 = v9;
    PUNavigationControllerPushingWithTransition = 1;
    -[UINavigationController pu_pushViewController:withTransition:animated:isInteractive:](self, "pu_pushViewController:withTransition:animated:isInteractive:", v6, v9, v7, v8 != 0);
    PUNavigationControllerPushingWithTransition = 0;

  }
}

- (BOOL)pu_disablePushPopAnimation
{
  return self->_pu_disablePushPopAnimation;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v5 = a5;
  v27 = a3;
  v8 = a4;
  -[PUNavigationController _setNavigating:](self, "_setNavigating:", 1);
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUNavigationController _banner](self, "_banner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_banner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUNavigationController _palette](self, "_palette");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12 && v11)
  {
    objc_msgSend(v11, "height");
    -[PUNavigationController paletteForEdge:size:](self, "paletteForEdge:size:", 2, 0.0, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    -[PUNavigationController attachPalette:isPinned:](self, "attachPalette:isPinned:", v15, 1);
    v13 = (void *)v15;
LABEL_7:
    -[PUNavigationController _setPalette:](self, "_setPalette:", v15);
    goto LABEL_8;
  }
  if (!v11 && v12)
  {
    -[PUNavigationController detachPalette:](self, "detachPalette:", v12);
    v15 = 0;
    goto LABEL_7;
  }
LABEL_8:
  -[PUNavigationController _setBanner:](self, "_setBanner:", v11);
  objc_msgSend(v11, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    if (v16)
    {
      objc_msgSend(v16, "superview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 != v13)
      {
        objc_msgSend(v13, "bounds");
        objc_msgSend(v17, "setFrame:");
        objc_msgSend(v17, "setAutoresizingMask:", 18);
        objc_msgSend(v17, "layoutSubviews");
        objc_msgSend(v10, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v5)
          v22 = 0.3;
        else
          v22 = 0.0;
        v26 = (void *)MEMORY[0x1E0DC3F10];
        v31[0] = v18;
        v31[1] = 3221225472;
        v31[2] = __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke;
        v31[3] = &unk_1E58AB790;
        v32 = v20;
        v33 = v13;
        v34 = v17;
        v23 = v21;
        v18 = MEMORY[0x1E0C809B0];
        objc_msgSend(v26, "transitionWithView:duration:options:animations:completion:", v33, 5242880, v31, 0, v22);

      }
    }
  }
  -[PUNavigationController _setCurrentToolbarViewController:animated:](self, "_setCurrentToolbarViewController:animated:", v8, v5);
  -[PUNavigationController _updateStatusBarOverrides](self, "_updateStatusBarOverrides");
  objc_initWeak(&location, self);
  -[PUNavigationController transitionCoordinator](self, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke_2;
  v28[3] = &unk_1E58A8108;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, v28);

  -[PUNavigationController _updateBarStyle](self, "_updateBarStyle");
  -[PUNavigationController _updateChromelessBarsIsBeforeTransition:](self, "_updateChromelessBarsIsBeforeTransition:", 1);
  -[PUNavigationController traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_updateBackButtonVisibilityForTraitCollection:", v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_setNavigating:(BOOL)a3
{
  self->__navigating = a3;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void (**v7)(void);

  -[PUNavigationController ppt_notifyTransitionAnimationDidComplete](self, "ppt_notifyTransitionAnimationDidComplete", a3, a4, a5);
  -[PUNavigationController ppt_onDidShowViewControllerBlock](self, "ppt_onDidShowViewControllerBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUNavigationController ppt_onDidShowViewControllerBlock](self, "ppt_onDidShowViewControllerBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

    -[PUNavigationController ppt_setOnDidShowViewControllerBlock:](self, "ppt_setOnDidShowViewControllerBlock:", 0);
  }
  -[PUNavigationController _updateBarStyle](self, "_updateBarStyle");
  -[PUNavigationController _updateChromelessBarsIsBeforeTransition:](self, "_updateChromelessBarsIsBeforeTransition:", 0);
  -[PUNavigationController _setNavigating:](self, "_setNavigating:", 0);
}

- (void)_updateBarStyle
{
  id v3;

  -[PUNavigationController topViewController](self, "topViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUNavigationController _setBarStyle:](self, "_setBarStyle:", objc_msgSend(v3, "pu_preferredBarStyle"));

}

- (void)_setBarStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->__barStyle != a3)
  {
    self->__barStyle = a3;
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColorForBarStyle:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[PUNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarStyle:", a3);
    objc_msgSend(v6, "setTintColor:", v8);
    -[PUNavigationController toolbar](self, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarStyle:", a3);
    objc_msgSend(v7, "setTintColor:", v8);

  }
}

- (void)_updateChromelessBarsIsBeforeTransition:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  -[PUNavigationController topViewController](self, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "pu_shouldOptOutFromChromelessBars");
  v6 = v5;
  if (v3 && (v5 & 1) == 0)
    v6 = -[PUNavigationController _shouldOptOutFromChromelessBars](self, "_shouldOptOutFromChromelessBars", v5);
  -[PUNavigationController _setShouldOptOutChromelessBars:](self, "_setShouldOptOutChromelessBars:", v6);

}

- (void)_setShouldOptOutChromelessBars:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (-[PUNavigationController _shouldOptOutFromChromelessBars](self, "_shouldOptOutFromChromelessBars") != a3)
  {
    if (v4)
    {
      -[PUNavigationController navigationBar](self, "navigationBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "standardAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[PUNavigationController navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScrollEdgeAppearance:", v6);

    if (v4)
    {

      -[PUNavigationController toolbar](self, "toolbar");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "standardAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[PUNavigationController toolbar](self, "toolbar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScrollEdgeAppearance:", v8);

    if (v4)
    {

    }
  }
}

- (BOOL)_shouldOptOutFromChromelessBars
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUNavigationController navigationBar](self, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollEdgeAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)ppt_onDidShowViewControllerBlock
{
  return self->_ppt_onDidShowViewControllerBlock;
}

- (void)_updateStatusBarOverrides
{
  id v3;

  -[PUNavigationController topViewController](self, "topViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUNavigationController pu_setAlwaysForwardsPreferredStatusBarStyle:](self, "pu_setAlwaysForwardsPreferredStatusBarStyle:", objc_msgSend(v3, "px_determinesPreferredStatusBarStyle"));
  -[PUNavigationController pu_setAlwaysForwardsPreferredStatusBarHidden:](self, "pu_setAlwaysForwardsPreferredStatusBarHidden:", objc_msgSend(v3, "px_determinesPreferredStatusBarHidden"));

}

- (void)pu_setAlwaysForwardsPreferredStatusBarStyle:(BOOL)a3
{
  if (self->_pu_alwaysForwardsPreferredStatusBarStyle != a3)
  {
    self->_pu_alwaysForwardsPreferredStatusBarStyle = a3;
    -[PUNavigationController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (void)pu_setAlwaysForwardsPreferredStatusBarHidden:(BOOL)a3
{
  if (self->_pu_alwaysForwardsPrefersStatusBarHidden != a3)
  {
    self->_pu_alwaysForwardsPrefersStatusBarHidden = a3;
    -[PUNavigationController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (void)_setCurrentToolbarViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  id v8;
  int v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);

  if (WeakRetained != v6)
  {
    v8 = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
    v9 = objc_msgSend(v8, "pu_wantsToolbarVisible");

    v10 = objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
    v11 = objc_storeWeak((id *)&self->__currentToolbarViewController, v6);
    v12 = objc_msgSend(v6, "pu_wantsToolbarVisible");

    -[PUNavigationController _extendedToolbar](self, "_extendedToolbar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pu_toolbarViewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionCoordinator");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isCancelled") & 1) != 0)
    {

      if (((v9 ^ 1 | v12) & 1) != 0)
      {
        v15 = 0;
        v16 = 0;
LABEL_12:
        objc_msgSend(v13, "setToolbarViewModel:withAnimatorBlock:", v14, v16);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_5;
        v18[3] = &unk_1E58A40C0;
        v18[4] = self;
        v19 = v10;
        objc_msgSend(v15, "animateAlongsideTransitionInView:animation:completion:", v13, 0, v18);

LABEL_15:
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v17 = v9 ^ 1;
      if (((v9 ^ 1 | v12) & 1) != 0)
      {
        v16 = 0;
        if (!v15)
          v17 = 1;
        if ((v17 & 1) == 0 && ((v12 ^ 1) & 1) == 0 && v4)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_2;
          aBlock[3] = &unk_1E58A2618;
          v15 = v15;
          v21 = v15;
          v22 = v13;
          v16 = _Block_copy(aBlock);

        }
        goto LABEL_12;
      }
      if (v15)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke;
        v23[3] = &unk_1E58A40C0;
        v24 = v13;
        v25 = v14;
        objc_msgSend(v15, "animateAlongsideTransitionInView:animation:completion:", v24, 0, v23);

        goto LABEL_15;
      }
    }
    objc_msgSend(v13, "setToolbarViewModel:withAnimatorBlock:", v14, 0);
    goto LABEL_17;
  }
LABEL_18:

}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  PUNavigationController *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[PUNavigationController transitionCoordinator](self, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v4 = (PUNavigationController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self
    && (-[PUNavigationController viewControllerForStatusBarStyleWhenDisappearing](self, "viewControllerForStatusBarStyleWhenDisappearing"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v5 = (id)objc_msgSend(v6, "preferredStatusBarStyle");

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUNavigationController;
    v5 = -[PUNavigationController preferredStatusBarStyle](&v9, sel_preferredStatusBarStyle);
  }

  return (int64_t)v5;
}

- (void)_setBanner:(id)a3
{
  objc_storeStrong((id *)&self->__banner, a3);
}

- (_UINavigationControllerPalette)_palette
{
  return self->__palette;
}

- (id)_extendedToolbar
{
  void *v2;

  -[PUNavigationController toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (PUAbstractNavigationBanner)_banner
{
  return self->__banner;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;
  objc_super v4;

  result = -[PUNavigationController pu_supportedInterfaceOrientations](self, "pu_supportedInterfaceOrientations");
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)PUNavigationController;
    return -[PUNavigationController supportedInterfaceOrientations](&v4, sel_supportedInterfaceOrientations);
  }
  return result;
}

- (unint64_t)pu_supportedInterfaceOrientations
{
  return self->_pu_supportedInterfaceOrientations;
}

- (PUNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  PUNavigationController *v4;
  PUNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  v4 = -[PUNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
  v5 = v4;
  if (v4)
    -[PUNavigationController _commonPUNavigationControllerInitialization](v4, "_commonPUNavigationControllerInitialization");
  return v5;
}

- (PUNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUNavigationController *v4;
  PUNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  v4 = -[PUNavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[PUNavigationController _commonPUNavigationControllerInitialization](v4, "_commonPUNavigationControllerInitialization");
  return v5;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUNavigationController;
  -[PUNavigationController popViewControllerAnimated:](&v4, sel_popViewControllerAnimated_, a3 & ~-[PUNavigationController pu_disablePushPopAnimation](self, "pu_disablePushPopAnimation"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUNavigationController;
  -[PUNavigationController setViewControllers:animated:](&v7, sel_setViewControllers_animated_, v6, v4 & ~-[PUNavigationController pu_disablePushPopAnimation](self, "pu_disablePushPopAnimation"));

}

- (void)pu_setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_pu_supportedInterfaceOrientations = a3;
}

- (void)pu_setPreventsAutorotation:(BOOL)a3
{
  self->_pu_preventsAutorotation = a3;
}

- (void)pu_setDisablePushPopAnimation:(BOOL)a3
{
  self->_pu_disablePushPopAnimation = a3;
}

- (void)pu_navigationTransitionDidEnd:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUNavigationController;
  -[UINavigationController pu_navigationTransitionDidEnd:](&v4, sel_pu_navigationTransitionDidEnd_, a3);
  -[PUNavigationController _updateBarStyle](self, "_updateBarStyle");
  -[PUNavigationController _updateChromelessBarsIsBeforeTransition:](self, "_updateChromelessBarsIsBeforeTransition:", 0);
}

- (BOOL)_canPerformAlternateBackKeyCommandToPopViewController
{
  void *v3;
  int v4;
  void *v6;
  void *v7;

  -[PUNavigationController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2
    || -[PUNavigationController _isNavigating](self, "_isNavigating")
    || (-[PUNavigationController isNavigationBarHidden](self, "isNavigationBarHidden") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[PUNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "hidesBackButton") ^ 1;

  }
  return v4;
}

- (BOOL)_canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[PUNavigationController splitViewController](self, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || objc_msgSend(v5, "displayMode") == 2
    || objc_msgSend(v6, "displayMode") == 4
    || !objc_msgSend(v6, "canPerformAction:withSender:", sel_toggleSidebar_, v4)
    || -[PUNavigationController _isNavigating](self, "_isNavigating"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = -[PUNavigationController isNavigationBarHidden](self, "isNavigationBarHidden") ^ 1;
  }

  return v7;
}

- (void)_performAlternateBackKeyCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[PUNavigationController _canPerformAlternateBackKeyCommandToPopViewController](self, "_canPerformAlternateBackKeyCommandToPopViewController"))
  {
    v4 = -[PUNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
  }
  else if (-[PUNavigationController _canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:](self, "_canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:", v6))
  {
    -[PUNavigationController splitViewController](self, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toggleSidebar:", v6);

  }
}

- (void)viewController:(id)a3 willSetupInitialBarsVisibilityOnViewWillAppearAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[PUNavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v6 == v11)
  {
    -[PUNavigationController _updateBarStyle](self, "_updateBarStyle");
    -[PUNavigationController _updateChromelessBarsIsBeforeTransition:](self, "_updateChromelessBarsIsBeforeTransition:", 1);
    v8 = objc_msgSend(v11, "pu_wantsToolbarVisible");
    objc_msgSend(v11, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCancelled");

    v7 = v11;
    if ((v8 & 1) != 0 || v10)
    {
      -[PUNavigationController _setCurrentToolbarViewController:animated:](self, "_setCurrentToolbarViewController:animated:", v11, v4);
      v7 = v11;
    }
  }

}

- (void)_setCurrentToolbarViewController:(id)a3
{
  -[PUNavigationController _setCurrentToolbarViewController:animated:](self, "_setCurrentToolbarViewController:animated:", a3, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if (sel__performAlternateBackKeyCommand_ != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUNavigationController;
    v7 = -[PUNavigationController canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, v6);
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  if (!-[PUNavigationController _canPerformAlternateBackKeyCommandToPopViewController](self, "_canPerformAlternateBackKeyCommandToPopViewController"))
  {
    v7 = -[PUNavigationController _canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:](self, "_canUseAlternateBackKeyCommandToTriggerSidebarKeyCommandWithSender:", v6);
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)shouldAutorotate
{
  objc_super v4;

  if (-[PUNavigationController pu_preventsAutorotation](self, "pu_preventsAutorotation"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)PUNavigationController;
  return -[PUNavigationController shouldAutorotate](&v4, sel_shouldAutorotate);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return (-[PUNavigationController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & (1 << a3)) != 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUNavigationController;
  v7 = a4;
  -[PUNavigationController willTransitionToTraitCollection:withTransitionCoordinator:](&v14, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  -[PUNavigationController viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PUNavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E58A40C0;
  v12 = v8;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);

}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  return +[PUViewControllerTransition interactionControllerForAnimationController:](PUNavigationTransition, "interactionControllerForAnimationController:", a4);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return +[PUNavigationTransition animationControllerForOperation:fromViewController:toViewController:inNavigationController:](PUNavigationTransition, "animationControllerForOperation:fromViewController:toViewController:inNavigationController:", a4, a5, a6, a3);
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_navigationTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  -[PUNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v6, "prepareForDismissingForced:", v3))
  {
    v7 = 0;
  }
  else
  {
    -[PUNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    v7 = 1;
  }

  return v7;
}

- (UIViewController)viewControllerForStatusBarStyleWhenDisappearing
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerForStatusBarStyleWhenDisappearing);
}

- (void)setViewControllerForStatusBarStyleWhenDisappearing:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerForStatusBarStyleWhenDisappearing, a3);
}

- (void)ppt_setOnDidShowViewControllerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (void)_setPalette:(id)a3
{
  objc_storeStrong((id *)&self->__palette, a3);
}

- (BOOL)_isNavigating
{
  return self->__navigating;
}

- (BOOL)pu_preventsAutorotation
{
  return self->_pu_preventsAutorotation;
}

- (int64_t)_barStyle
{
  return self->__barStyle;
}

- (UIViewController)_currentToolbarViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__currentToolbarViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__currentToolbarViewController);
  objc_storeStrong((id *)&self->__alternateBackKeyCommand, 0);
  objc_storeStrong((id *)&self->__palette, 0);
  objc_storeStrong((id *)&self->__banner, 0);
  objc_storeStrong(&self->_ppt_onDidShowViewControllerBlock, 0);
  objc_destroyWeak((id *)&self->_viewControllerForStatusBarStyleWhenDisappearing);
}

uint64_t __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(a1 + 48));
}

void __79__PUNavigationController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;

  if (objc_msgSend(a2, "isCancelled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateStatusBarOverrides");

  }
}

void __84__PUNavigationController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "navigationItem", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "px_updateBackButtonVisibilityForTraitCollection:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setToolbarViewModel:withAnimatorBlock:", *(_QWORD *)(a1 + 40), 0);
  return result;
}

void __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_3;
  v13[3] = &unk_1E58A4058;
  v14 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_4;
  v11[3] = &unk_1E58A4058;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "animateAlongsideTransitionInView:animation:completion:", v8, v13, v11);

}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setCurrentToolbarViewController:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__PUNavigationController__setCurrentToolbarViewController_animated___block_invoke_4(uint64_t a1, void *a2)
{
  int v3;
  uint64_t result;

  v3 = objc_msgSend(a2, "isCancelled");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3 ^ 1u);
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end
