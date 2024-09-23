@implementation SBDashBoardPluginViewController

- (SBDashBoardPluginViewController)initWithLockScreenPlugin:(id)a3
{
  id v5;
  SBDashBoardPluginViewController *v6;
  SBDashBoardPluginViewController *v7;
  SBDashBoardPluginViewController *v8;

  v5 = a3;
  if (v5)
  {
    v6 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_plugin, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardPluginViewController;
  -[SBDashBoardPluginViewController view](&v3, sel_view);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  SBDashBoardPluginViewController *v9;

  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SBDashBoardPluginViewController_viewDidLoad__block_invoke;
    v7[3] = &unk_1E8E9EA00;
    v8 = v3;
    v9 = self;
    -[SBDashBoardPluginViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v8, 0, v7);

  }
  -[SBDashBoardPluginViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v5, 2);

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);

}

void __46__SBDashBoardPluginViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[SBLockScreenPlugin setDelegate:](self->_plugin, "setDelegate:", self);
  -[SBDashBoardPluginViewController _updateLegibility](self, "_updateLegibility");
  -[SBDashBoardPluginViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin appearance](self->_plugin, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationRegion");
  objc_msgSend(v4, "setPresentationRegion:");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBLockScreenPlugin setDelegate:](self->_plugin, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "pluginAnimateAppearanceTransition:withCompletion:", v6, v9);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDashBoardPluginViewController;
    -[CSCoverSheetViewControllerBase performCustomTransitionToVisible:withAnimationSettings:completion:](&v13, sel_performCustomTransitionToVisible_withAnimationSettings_completion_, v6, v8, v9);
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardPluginViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__SBDashBoardPluginViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E9EA28;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __86__SBDashBoardPluginViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationRegion");
  objc_msgSend(v3, "setPresentationRegion:");

}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin name](self->_plugin, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("plugin"));

  return v3;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v6, sel_aggregateAppearance_, v4);
  -[SBLockScreenPlugin coverSheetAppearance](self->_plugin, "coverSheetAppearance", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionAppearance:", v5);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardPluginViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v6, sel_aggregateBehavior_, v4);
  -[SBLockScreenPlugin coverSheetBehavior](self->_plugin, "coverSheetBehavior", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionBehavior:", v5);

  objc_msgSend(v4, "setIdleTimerDuration:", 9);
  objc_msgSend(v4, "setIdleTimerMode:", 2);
  objc_msgSend(v4, "setIdleWarnMode:", 1);

}

- (void)updateForPresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "regions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v7 = 1.0;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "role") == 2)
        {
          v7 = 0.0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  -[SBDashBoardPluginViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v7);

  -[SBLockScreenPlugin controller](self->_plugin, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DAC240]);
    objc_msgSend(MEMORY[0x1E0DAC220], "defaultSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLegibilitySettings:", v14);

    -[SBDashBoardPluginViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v4, "suggestedInsetsForPreferredContentFrame:");
    objc_msgSend(v13, "setSuggestedContentInsets:");

    v16 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v12, "updateForPresentation:", v16);

  }
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase updateForPresentation:](&v17, sel_updateForPresentation_, v4);

}

- (id)_newDisplayLayoutElement
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;

  -[SBDashBoardPluginViewController plugin](self, "plugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MapsLockScreen"));

  if (!v4)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB678]);
  objc_msgSend(v6, "setFillsDisplayBounds:", 1);
  objc_msgSend(v6, "setLayoutRole:", 6);
  return v6;
}

- (void)willTransitionToPresented:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardPluginViewController;
  -[CSCoverSheetViewControllerBase willTransitionToPresented:](&v9, sel_willTransitionToPresented_);
  if (!a3)
  {
    -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardPluginViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v5);

    -[SBDashBoardPluginViewController setView:](self, "setView:", 0);
    -[CSCoverSheetViewControllerBase kitPresentedViewController](self, "kitPresentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
}

- (int64_t)presentationStyle
{
  void *v2;
  uint64_t v3;

  -[SBLockScreenPlugin appearance](self->_plugin, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationStyle");

  if (v3 == 1)
    return 2;
  else
    return 1;
}

- (int64_t)presentationTransition
{
  void *v2;
  int64_t v3;

  -[SBLockScreenPlugin viewController](self->_plugin, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pluginAnimatesAppearanceTransition:", 1)
    && (objc_opt_respondsToSelector() & 1) != 0;

  return v3;
}

- (int64_t)presentationType
{
  if (-[SBDashBoardPluginViewController _presentationPriority](self, "_presentationPriority") < 500)
    return 1;
  else
    return 2;
}

- (id)coverSheetIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin name](self->_plugin, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pluginAppearanceDidChange:(id)a3
{
  void *v4;
  id v5;

  -[SBDashBoardPluginViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin appearance](self->_plugin, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationRegion");
  objc_msgSend(v5, "setPresentationRegion:");

  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");

}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardPluginViewController;
  if ((!-[CSCoverSheetViewControllerBase handleEvent:](&v7, sel_handleEvent_, v4)
     || (objc_msgSend(v4, "isConsumable") & 1) == 0)
    && !-[SBLockScreenPlugin handleDashBoardEvent:](self->_plugin, "handleDashBoardEvent:", v4))
  {
    if (objc_msgSend(v4, "type") != 1)
    {
      v5 = 0;
      goto LABEL_8;
    }
    -[SBDashBoardPluginViewController _updateLegibility](self, "_updateLegibility");
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_8:

  return v5;
}

- (void)_updateLegibility
{
  void *v3;
  void *v4;
  id v5;

  -[SBLockScreenPlugin controller](self->_plugin, "controller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legibilitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", v4);

  }
}

- (int64_t)_presentationPriority
{
  void *v3;
  int v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;

  -[SBLockScreenPlugin name](self->_plugin, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FindMyiPhoneLockScreen"));

  v5 = -[SBLockScreenPlugin isCapabilityRestricted:](self->_plugin, "isCapabilityRestricted:", 8);
  if (v4)
  {
    if (v5)
      return 560;
    else
      return 540;
  }
  else if (v5)
  {
    return 530;
  }
  else
  {
    -[SBLockScreenPlugin appearance](self->_plugin, "appearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "notificationBehavior");

    if (v8 == 3)
      return 3;
    else
      return 6;
  }
}

- (SBLockScreenPlugin)plugin
{
  return self->_plugin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
}

@end
