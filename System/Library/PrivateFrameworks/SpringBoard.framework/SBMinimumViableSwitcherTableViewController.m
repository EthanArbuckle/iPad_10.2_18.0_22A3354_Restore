@implementation SBMinimumViableSwitcherTableViewController

- (double)snapshotScaleForSceneHandle:(id)a3
{
  return 0.5;
}

- (double)switcherCardScale
{
  return 0.5;
}

- (double)minimumHomeScreenScale
{
  return 1.0;
}

- (BOOL)shouldAddAppLayoutToFront:(id)a3 forTransitionWithContext:(id)a4 transitionCompleted:(BOOL)a5
{
  return 1;
}

- (BOOL)isWindowVisible
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  BOOL v6;

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
      NSLog(CFSTR("expected a switcherController!"));
  }
  v6 = objc_msgSend(v3, "unlockedEnvironmentMode") == 2;

  return v6;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (BOOL)isStatusBarHiddenForAppLayout:(id)a3
{
  return 0;
}

- (id)liveScenesIdentityTokens
{
  return 0;
}

- (id)liveOverlayForSceneHandle:(id)a3
{
  return 0;
}

- (id)liveOverlayForSceneIdentityToken:(id)a3
{
  return 0;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (id)_appLayouts
{
  void *v3;
  void *v4;

  -[SBMinimumViableSwitcherTableViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLayoutsForSwitcherContentController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  _QWORD v13[5];
  BOOL v14;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unlockedEnvironmentMode");

  if (v10 == 2)
  {
    -[SBMinimumViableSwitcherTableViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
  v12 = 0.4;
  if (!v5)
    v12 = 0.0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__SBMinimumViableSwitcherTableViewController_performTransitionWithContext_animated_completion___block_invoke;
  v13[3] = &unk_1E8E9F508;
  v14 = v10 == 2;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v13, v8, v12);

}

void __95__SBMinimumViableSwitcherTableViewController_performTransitionWithContext_animated_completion___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (BOOL)canInterruptActiveTransition
{
  return 1;
}

- (BSAnimationSettings)defaultTransitionAnimationSettings
{
  return (BSAnimationSettings *)objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.4);
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  return 0;
}

- (BOOL)isShowingModifierTimeline
{
  return 0;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (id)iconForAppLayout:(id)a3
{
  return 0;
}

- (id)liveContentOverlayForAppLayout:(id)a3
{
  return 0;
}

- (double)contentAspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;

  -[SBMinimumViableSwitcherTableViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v2)
    v5 = v3 / v4;
  else
    v5 = 0.0;

  return v5;
}

- (id)foregroundAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4
{
  return 0;
}

- (void)noteModelDidMutateForInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 willAnimate:(BOOL)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__SBMinimumViableSwitcherTableViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke;
  v11[3] = &unk_1E8EA8178;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  -[SBMinimumViableSwitcherTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertRowsAtIndexPaths:withRowAnimation:", v10, 100);

}

void __111__SBMinimumViableSwitcherTableViewController_noteModelDidMutateForInsertionOfAppLayouts_atIndexes_willAnimate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)performAnimatedInsertionOfAppLayouts:(id)a3 atIndexes:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (void)removeLayoutRole:(int64_t)a3 inSpace:(id)a4 mutationBlock:(id)a5 reason:(int64_t)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  -[SBMinimumViableSwitcherTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);

}

- (void)noteAppLayoutsDidChange
{
  id v2;

  -[SBMinimumViableSwitcherTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMinimumViableSwitcherTableViewController;
  -[SBMinimumViableSwitcherTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SBMinimumViableSwitcherTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[SBMinimumViableSwitcherTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, CFSTR("Identifier"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_bestAppSuggestion)
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  BOOL v8;

  -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (self->_bestAppSuggestion)
    v8 = a4 == 0;
  else
    v8 = 0;
  if (v8)
    return 1;
  else
    return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  if (self->_bestAppSuggestion && !objc_msgSend(v6, "section"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBestAppSuggestion bundleIdentifier](self->_bestAppSuggestion, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ - %@"), v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v10);
  }
  else
  {
    -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "allItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bs_map:", &__block_literal_global_92);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

  }
  return v7;
}

id __78__SBMinimumViableSwitcherTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  SBLegacyDisplayItemTypeFromType(objc_msgSend(v2, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBMinimumViableSwitcherTableViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bestAppSuggestion && !objc_msgSend(v7, "section"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "switcherContentController:activatedBestAppSuggestion:", self, self->_bestAppSuggestion);
  }
  else
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Tapped: %@", (uint8_t *)&v15, 0xCu);

    }
    -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "switcherContentController:performTransitionWithRequest:gestureInitiated:", self, v14, 0);

    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_bestAppSuggestion && !objc_msgSend(v7, "section"))
  {
    v11 = 0;
  }
  else
  {
    -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "type") == 0;
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a4 == 1)
  {
    v6 = a5;
    -[SBMinimumViableSwitcherTableViewController _appLayouts](self, "_appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "row");

    objc_msgSend(v7, "objectAtIndex:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[SBMinimumViableSwitcherTableViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "switcherContentController:deletedDisplayItem:inAppLayout:forReason:", self, v11, v12, 1);

  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return CFSTR("Kill");
}

- (id)_statusBarStyleRequestForDefaultStyle
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F20]), "initWithResolvedStyle:foregroundColor:", 0, 0);
}

- (SBSwitcherContentViewControllerDelegate)delegate
{
  return (SBSwitcherContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSwitcherContentViewControllerDataSource)dataSource
{
  return (SBSwitcherContentViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SBBestAppSuggestion)bestAppSuggestion
{
  return self->_bestAppSuggestion;
}

- (void)setBestAppSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_bestAppSuggestion, a3);
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

- (BOOL)isAsyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (void)setAsyncRenderingDisabled:(BOOL)a3
{
  self->_asyncRenderingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_bestAppSuggestion, 0);
  objc_storeStrong((id *)&self->_temporarySideAppView, 0);
  objc_storeStrong((id *)&self->_temporaryAppView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
