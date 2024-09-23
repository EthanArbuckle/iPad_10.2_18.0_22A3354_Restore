@implementation PREditor

- (PREditor)initWithDelegate:(id)a3
{
  id v5;
  PREditor *v6;
  uint64_t v7;
  FBSceneWorkspace *sceneWorkspace;
  PROverridableDateProvider *v9;
  PROverridableDateProvider *dateProvider;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREditor;
  v6 = -[PREditor init](&v12, sel_init);
  if (v6)
  {
    PRComplicationsSceneWorkspace();
    v7 = objc_claimAutoreleasedReturnValue();
    sceneWorkspace = v6->_sceneWorkspace;
    v6->_sceneWorkspace = (FBSceneWorkspace *)v7;

    objc_storeStrong((id *)&v6->_delegate, a3);
    v6->_looksScrollingDecelerationRate = *(double *)MEMORY[0x1E0DC5368];
    v9 = objc_alloc_init(PROverridableDateProvider);
    dateProvider = v6->_dateProvider;
    v6->_dateProvider = v9;

    objc_storeStrong((id *)&v6->_posterRole, CFSTR("PRPosterRoleLockScreen"));
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_stopHangTracer");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PREditor invalidateAllLookSwitchingAssertions](self, "invalidateAllLookSwitchingAssertions");
  -[PREditor invalidateAllPresentationAssertionsByViewController](self, "invalidateAllPresentationAssertionsByViewController");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PREditor;
  -[PREditor dealloc](&v4, sel_dealloc);
}

- (UIView)contentOverlayView
{
  return -[PREditorRootViewController contentOverlayView](self->_rootViewController, "contentOverlayView");
}

- (id)viewForMenuElementIdentifier:(id)a3
{
  return -[PREditorRootViewController viewForMenuElementIdentifier:](self->_rootViewController, "viewForMenuElementIdentifier:", a3);
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden || -[PREditor variant](self, "variant") == 2;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  BSDispatchQueueAssertMain();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("viewControllerToPresent != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditor presentViewController:animated:completion:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B664B74);
  }
  if (!self->_window)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this object is invalid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditor presentViewController:animated:completion:].cold.2();
    goto LABEL_11;
  }
  if (-[PREditor needsCustomViewControllerPresentationManager](self, "needsCustomViewControllerPresentationManager"))
  {
    objc_msgSend(v8, "setTransitioningDelegate:", self);
    objc_msgSend(v8, "setModalPresentationStyle:", 4);
  }
  -[PREditor rootViewController](self, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalWillBegin_, *MEMORY[0x1E0DC5220], v8);
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], v8);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__PREditor_presentViewController_animated_completion___block_invoke;
  v16[3] = &unk_1E2184010;
  v17 = v10;
  v13 = v10;
  objc_msgSend(v12, "animateWithDuration:animations:", v16, 0.3);
  -[PREditor _acquireModalPresentationAssertionForViewController:](self, "_acquireModalPresentationAssertionForViewController:", v8);
  -[PREditor viewControllerForPresentingViewControllersCreatingIfNecessary:](self, "viewControllerForPresentingViewControllersCreatingIfNecessary:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v8, -[PREditor isViewControllerPresentationAnimationAllowed](self, "isViewControllerPresentationAnimationAllowed") & v6, v9);
  -[PREditor didPresentViewController:](self, "didPresentViewController:", v8);

}

uint64_t __54__PREditor_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTopButtonsHidden:", 1);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  -[PREditor rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PREditor_dismissViewControllerAnimated_completion___block_invoke;
  v11[3] = &unk_1E2184010;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "animateWithDuration:animations:", v11, 0.3);
  -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 0);
  -[PREditor viewControllerForPresentingViewControllersCreatingIfNecessary:](self, "viewControllerForPresentingViewControllersCreatingIfNecessary:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v4, v6);

}

uint64_t __53__PREditor_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTopButtonsHidden:", 0);
}

- (void)presentedViewControllerDismissalWillBegin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor viewControllerForPresentingViewControllersCreatingIfNecessary:](self, "viewControllerForPresentingViewControllersCreatingIfNecessary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    -[PREditor rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__PREditor_presentedViewControllerDismissalWillBegin___block_invoke;
      v11[3] = &unk_1E2184010;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.3);
    }
    -[PREditor modalPresentationAssertionsByViewController](self, "modalPresentationAssertionsByViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "invalidate");
    -[PREditor modalPresentationAssertionsByViewController](self, "modalPresentationAssertionsByViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v4);

    -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 0);
  }

}

void __54__PREditor_presentedViewControllerDismissalWillBegin___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTopButtonsHidden:", 0);

}

- (void)presentedViewControllerDismissalDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor rootViewController](self, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC5210]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5220], v5);
      objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5218], v5);
      -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 0);

    }
    else
    {
      -[PREditor _acquireModalPresentationAssertionForViewController:](self, "_acquireModalPresentationAssertionForViewController:", v5);
      -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 1);
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__PREditor_presentedViewControllerDismissalDidEnd___block_invoke;
      v13[3] = &unk_1E2184010;
      v14 = v6;
      objc_msgSend(v12, "animateWithDuration:animations:", v13, 0.3);

    }
  }

}

uint64_t __51__PREditor_presentedViewControllerDismissalDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTopButtonsHidden:", 1);
}

- (void)presentTitledViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PRAmbientEditingTitledViewController *v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  if (-[PREditor variant](self, "variant") == 2)
  {
    v14 = -[PRAmbientEditingTitledViewController initWithContentViewController:]([PRAmbientEditingTitledViewController alloc], "initWithContentViewController:", v9);

    -[PRAmbientEditingTitledViewController setDelegate:](v14, "setDelegate:", self);
    -[PREditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, v5, v8);
  }
  else
  {
    v14 = (PRAmbientEditingTitledViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);

    -[PRAmbientEditingTitledViewController sheetPresentationController](v14, "sheetPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredCornerRadius:", PRSheetCornerRadius());
    -[PRAmbientEditingTitledViewController navigationBar](v14, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
    objc_msgSend(v12, "setRightBarButtonItem:", v13);
    -[PREditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, v5, v8);

    v8 = v10;
  }

}

- (void)_closeButtonTapped:(id)a3
{
  -[PREditor dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)requireGestureRecognizerToFailForLooksScroll:(id)a3
{
  -[PREditorRootViewController requireGestureRecognizerToFailForLooksScroll:](self->_rootViewController, "requireGestureRecognizerToFailForLooksScroll:", a3);
}

- (id)disableSwitchingLooksForReason:(id)a3
{
  id v4;
  PREditorLookSwitchingAssertion *v5;
  NSHashTable *lookSwitchingAssertions;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[PREditorLookSwitchingAssertion initWithEditor:reason:]([PREditorLookSwitchingAssertion alloc], "initWithEditor:reason:", self, v4);

  lookSwitchingAssertions = self->_lookSwitchingAssertions;
  if (!lookSwitchingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lookSwitchingAssertions;
    self->_lookSwitchingAssertions = v7;

    lookSwitchingAssertions = self->_lookSwitchingAssertions;
  }
  -[NSHashTable addObject:](lookSwitchingAssertions, "addObject:", v5);
  -[PREditor rootViewController](self, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setScrollEnabled:", 0);
  return v5;
}

- (void)invalidateAllLookSwitchingAssertions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSHashTable copy](self->_lookSwitchingAssertions, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)invalidateAllPresentationAssertionsByViewController
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PREditor modalPresentationAssertionsByViewController](self, "modalPresentationAssertionsByViewController", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeLookSwitchingAssertion:(id)a3
{
  void *v4;
  id v5;

  -[NSHashTable removeObject:](self->_lookSwitchingAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_lookSwitchingAssertions, "count"))
  {
    -[PREditor rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setScrollEnabled:", 1);
  }
}

- (void)setLooksScrollingDecelerationRate:(double)a3
{
  void *v4;
  id v5;

  if (self->_looksScrollingDecelerationRate != a3)
  {
    self->_looksScrollingDecelerationRate = a3;
    -[PREditor rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PREditor updateScrollViewDecelerationRate:](self, "updateScrollViewDecelerationRate:", v5);
  }
}

- (void)updateScrollViewDecelerationRate:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  -[PREditor looksScrollingDecelerationRate](self, "looksScrollingDecelerationRate");
  v5 = v4;
  v6 = *MEMORY[0x1E0DC5360];
  if (v5 != *MEMORY[0x1E0DC5360])
    v6 = *MEMORY[0x1E0DC5368];
  objc_msgSend(v7, "setDecelerationRate:", v6);
  objc_msgSend(v7, "setPagingEnabled:", v5 != -100.0);

}

- (void)setCurrentLook:(id)a3
{
  PREditingLook *v4;
  PREditingLook *currentLook;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (PREditingLook *)objc_msgSend(v7, "copy");
    currentLook = self->_currentLook;
    self->_currentLook = v4;

    -[PREditor rootViewController](self, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentLookDidChange");

  }
}

- (void)updateLooks
{
  if (-[PREditor displaysRootViewController](self, "displaysRootViewController"))
  {
    -[PREditor setHasUpdatedLooks:](self, "setHasUpdatedLooks:", 1);
    -[PREditor _rebuildRootViewController](self, "_rebuildRootViewController");
    -[PREditor _refetchLooksAndBuildUI](self, "_refetchLooksAndBuildUI");
  }
}

- (void)updateLookProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  if (-[PREditor displaysRootViewController](self, "displaysRootViewController"))
  {
    -[PREditor setHasUpdatedLookProperties:](self, "setHasUpdatedLookProperties:", 1);
    -[PREditor _refetchLooksForProperties](self, "_refetchLooksForProperties");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[PRPosterEditingEnvironment targetConfiguredProperties](self->_environment, "targetConfiguredProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "titleStyleConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor _contentLuminanceValuesForCurrentLooks](self, "_contentLuminanceValuesForCurrentLooks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor initialLook](self, "initialLook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor _refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:](self, "_refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:", v23, v5, v6, v4);

    -[PREditor currentLook](self, "currentLook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __32__PREditor_updateLookProperties__block_invoke;
    v24[3] = &unk_1E2184308;
    v25 = v7;
    v8 = v7;
    objc_msgSend(v23, "bs_firstObjectPassingTest:", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor configuredProperties](self, "configuredProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "titleStyleConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "titleColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isSuggested");

      if (v14)
      {
        -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v22, "titleColor");
        v16 = v5;
        v17 = v4;
        v18 = v3;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTitleColor:", v20);

        v8 = v19;
        v3 = v18;
        v4 = v17;
        v5 = v16;
        objc_msgSend(v11, "setTitleStyleConfiguration:", v15);

      }
    }
    -[PREditor setCurrentLook:](self, "setCurrentLook:", v9);
    -[PREditor rootViewController](self, "rootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLooks:forUpdatingProperties:", v23, 1);

  }
}

uint64_t __32__PREditor_updateLookProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_defaultLuminanceValuesForLooks:(id)a3 initialLook:(id)a4 initialLookLuminanceValue:(double)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v16 = a5;
        if (v15 != v8)
          +[PRPosterTitleStyleConfiguration defaultContentsLuminance](PRPosterTitleStyleConfiguration, "defaultContentsLuminance", a5, (_QWORD)v19);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v9;
}

- (void)updateLuminanceValuesForLooks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[PREditor rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PREditor _contentLuminanceValuesForCurrentLooks](self, "_contentLuminanceValuesForCurrentLooks");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[PREditor _refreshLuminanceValuesForCurrentPerLookLuminanceValues:](self, "_refreshLuminanceValuesForCurrentPerLookLuminanceValues:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "looks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRPosterEditingEnvironment targetConfiguredProperties](self->_environment, "targetConfiguredProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleStyleConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor initialLook](self, "initialLook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor _refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:](self, "_refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:", v6, v4, v9, v8);

    -[PREditor configuredProperties](self, "configuredProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleStyleConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor currentLook](self, "currentLook");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v11)
    {
      v16 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v16, "setContentsLuminance:", v15);
      objc_msgSend(v10, "setTitleStyleConfiguration:", v16);

    }
    -[PREditingFontAndContentStylePickerViewController setContentsLuminance:](self->_fontAndContentStylePickerViewController, "setContentsLuminance:", v15);
    -[PREditingFontAndColorPickerViewController setContentsLuminance:](self->_fontAndColorPickerViewController, "setContentsLuminance:", v15);
    -[PREditor rootViewController](self, "rootViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lookBackgroundTypesDidChange");

  }
}

- (id)_contentLuminanceValuesForCurrentLooks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[PREditor rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "looks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PREditor__contentLuminanceValuesForCurrentLooks__block_invoke;
  v8[3] = &unk_1E2184330;
  v8[4] = self;
  objc_msgSend(v4, "bs_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__PREditor__contentLuminanceValuesForCurrentLooks__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultTitleStyleConfigurationForLook:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "contentsLuminance");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_refreshLuminanceValuesForCurrentPerLookLuminanceValues:(id)a3
{
  id v4;
  void *v5;
  PREditorElementLayoutController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  double v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [PREditorElementLayoutController alloc];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PREditorElementLayoutController initWithTraitEnvironment:](v6, "initWithTraitEnvironment:", v7);

    -[PREditor posterRole](self, "posterRole");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"));

    v39 = (void *)v8;
    if (v10)
    {
      -[PREditor configuredProperties](self, "configuredProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleStyleConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditor titleString](self, "titleString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "effectiveTitleLayoutForText:", v13);

      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v16 = (void *)v8;
      v17 = 1;
      v18 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v16 = (void *)v8;
      v17 = 15;
      v18 = 0;
    }
    objc_msgSend(v16, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", v17, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v20;
    objc_msgSend(v20, "rect");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v19 = (void *)objc_msgSend(v4, "mutableCopy");
    v40 = v4;
    objc_msgSend(v4, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v5, "editor:luminanceForLook:inRect:", self, v34, v22, v24, v26, v28);
          if (v35 <= 1.0 && v35 >= 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v36, v34);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v31);
    }

    v4 = v40;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)backgroundTypeForLuminance:(double)a3
{
  PRPosterContentsBackgroundTypeForLuminance(a3);
  return PRPosterContentsBackgroundTypeForLuminance(a3);
}

- (void)updateActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditor rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "leadingMenuElementsForEditor:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "setLeadingMenuElements:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "trailingMenuElementsForEditor:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "setTrailingMenuElements:", v5);
  objc_msgSend(v3, "_updateMenuElements");

}

- (id)actionsMenuWithChildren:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E2186E08, v5, CFSTR("PREditor.ActionsMenu"), 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultTitleStyleConfigurationForLook:(id)a3
{
  void *v4;
  NSObject *v5;
  NSMutableDictionary *defaultTitleStyleConfigurationPerLook;
  int v8;
  NSMutableDictionary *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_defaultTitleStyleConfigurationPerLook, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PRLogEditing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      defaultTitleStyleConfigurationPerLook = self->_defaultTitleStyleConfigurationPerLook;
      v8 = 134218240;
      v9 = defaultTitleStyleConfigurationPerLook;
      v10 = 2048;
      v11 = -[NSMutableDictionary count](defaultTitleStyleConfigurationPerLook, "count");
      _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "defaultTitleStyleConfigurationForLook: failed. _defaultTitleStyleConfigurationPerLook=%p, count=%lu", (uint8_t *)&v8, 0x16u);
    }

  }
  return v4;
}

- (id)effectiveTitleStyleConfigurationForLook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  -[PREditor configuredProperties](self, "configuredProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && -[PREditor shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:](self, "shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:", v6))
  {
    -[PREditor delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = objc_msgSend(v8, "editorShouldAllowUserToAdjustTimeColor:", self);
      else
        v9 = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "timeFontConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditor extensionBundleURL](self, "extensionBundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeFontConfigurationWithExtensionBundleURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v8, "editor:shouldAllowUserToSelectTimeFontConfiguration:", self, v13);
LABEL_12:
        objc_msgSend(v6, "resolvedWithLookDefaultTitleStyleConfiguration:allowTitleColorUpdates:allowTitleFontUpdates:", v7, v9, v14);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      v9 = 1;
    }
    v14 = 1;
    goto LABEL_12;
  }
  v10 = v7;
LABEL_13:

  return v10;
}

- (void)createColorVariationStoreIfNeeded
{
  void *v3;
  void *v4;
  PREditingColorVariationStore *v5;
  PREditingColorVariationStore *colorVariationStore;
  id v7;

  if (!self->_colorVariationStore)
  {
    -[PREditor configuredProperties](self, "configuredProperties");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorVariationsConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "variationStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PREditingColorVariationStore initWithVariationStorage:version:]([PREditingColorVariationStore alloc], "initWithVariationStorage:version:", v4, objc_msgSend(v3, "version"));
    colorVariationStore = self->_colorVariationStore;
    self->_colorVariationStore = v5;

  }
}

- (void)presentColorPickerWithPrompt:(id)a3 suggestedColors:(id)a4 selectedColor:(id)a5 changeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PREditorColorPickerConfiguration *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(PREditorColorPickerConfiguration);
  -[PREditorColorPickerConfiguration setPrompt:](v14, "setPrompt:", v13);

  -[PREditorColorPickerConfiguration setSelectedColor:](v14, "setSelectedColor:", v11);
  -[PREditorColorPickerConfiguration setSuggestedColors:](v14, "setSuggestedColors:", v12);

  -[PREditor presentColorPickerWithConfiguration:changeHandler:](self, "presentColorPickerWithConfiguration:changeHandler:", v14, v10);
}

- (void)presentColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[PREditor variant](self, "variant") == 2)
  {
    -[PREditor presentAmbientColorPickerWithConfiguration:changeHandler:](self, "presentAmbientColorPickerWithConfiguration:changeHandler:", v6, v7);
  }
  else
  {
    objc_msgSend(v6, "colorPickerSourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prompt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom") == 1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PREditor_presentColorPickerWithConfiguration_changeHandler___block_invoke;
    v12[3] = &unk_1E2184358;
    v13 = v6;
    v14 = v7;
    -[PREditor _presentFontAndColorPickerWithPrompt:titleStyleConfiguration:colorPickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:](self, "_presentFontAndColorPickerWithPrompt:titleStyleConfiguration:colorPickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:", v9, 0, v13, v11, v8, 2, v12);

  }
}

void __62__PREditor_presentColorPickerWithConfiguration_changeHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v10;
  id v11;

  objc_msgSend(a9, "color");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if ((objc_msgSend(*(id *)(a1 + 32), "includesObjectsOfTypePRPickerColor") & 1) == 0)
  {
    objc_msgSend(v11, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)presentContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[PREditor variant](self, "variant") == 2)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke;
    v15[3] = &unk_1E2184380;
    v16 = v7;
    v8 = v7;
    -[PREditor presentAmbientContentStylePickerWithConfiguration:changeHandler:](self, "presentAmbientContentStylePickerWithConfiguration:changeHandler:", v6, v15);
    v9 = v16;
  }
  else
  {
    objc_msgSend(v6, "contentStylePickerSourceItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prompt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom") == 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke_2;
    v13[3] = &unk_1E21843A8;
    v14 = v7;
    v9 = v7;
    -[PREditor _presentFontAndContentStylePickerWithPrompt:titleStyleConfiguration:contentStylePickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:](self, "_presentFontAndContentStylePickerWithPrompt:titleStyleConfiguration:contentStylePickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:", v10, 0, v6, v12, v8, 2, v13);

  }
}

uint64_t __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PREditor_presentContentStylePickerWithConfiguration_changeHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "contentStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isSuggestedContentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, BOOL))(v2 + 16))(v2, v5, v4 != 0);
}

- (void)_presentFontAndContentStylePickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 contentStylePickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  unsigned int v20;
  _BOOL8 v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  PRPosterContentDiscreteColorsStyle *v39;
  uint64_t v40;
  PRPosterContentDiscreteColorsStyle *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  PRPosterContentDiscreteColorsStyle *v45;
  void *v46;
  PREditingFontAndContentStylePickerViewController *v47;
  void *v48;
  void *v49;
  PREditingFontAndContentStylePickerViewController *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  PREditingFontAndContentStylePickerViewController *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  _BOOL4 v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  PREditingFontAndContentStylePickerViewController *v77;
  double v78;
  void *v79;
  id v80;
  _QWORD v81[3];

  v71 = a6;
  v81[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v75 = a7;
  v73 = a9;
  v72 = a4;
  v14 = a3;
  -[PREditor posterRole](self, "posterRole");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
  {
    -[PREditor titleString](self, "titleString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "pr_isSuitableForArabicJustification"))
      v17 = _os_feature_enabled_impl();
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  -[PREditor posterRole](self, "posterRole");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
  {
    -[PREditor titleString](self, "titleString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "pr_isSuitableForVerticalLayout");

  }
  else
  {
    v20 = 0;
  }
  v21 = a4 != 0;

  -[PREditor posterRole](self, "posterRole");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqual:", CFSTR("PRPosterRoleIncomingCall")) ^ 1;
  if (v13)
    v24 = a4 != 0;
  else
    v24 = 1;
  v25 = (v24 & v23) == 0;
  v26 = 2;
  if (v25)
    v26 = 0;
  v27 = v26 | v21;
  if (v13)
    v27 |= 4uLL;
  v28 = v27 | 8;
  if (!(v21 & v20))
    v28 = v27;
  if (v17)
    v28 |= 0x10uLL;
  if (a4)
    v29 = v28;
  else
    v29 = v27;

  objc_msgSend(v13, "selectedStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_class();
  v32 = v30;
  if (v31)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
  }
  else
  {
    v33 = 0;
  }
  v34 = v33;

  if (v34
    && objc_msgSend(v34, "allowsVariation")
    && objc_msgSend(v34, "needsToResolveVariationFromColorStore"))
  {
    -[PREditor createColorVariationStoreIfNeeded](self, "createColorVariationStoreIfNeeded");
    objc_msgSend(v13, "identifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "colors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = 0.0;
    -[PREditingColorVariationStore baseColorForVariedColor:forContextIdentifier:variation:forDataLayerPicker:](self->_colorVariationStore, "baseColorForVariedColor:forContextIdentifier:variation:forDataLayerPicker:", v36, v69, &v78, objc_msgSend(v13, "isForTitleStylePicker"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v68 = v37;
      v38 = objc_msgSend(v34, "isVibrant");
      v39 = [PRPosterContentDiscreteColorsStyle alloc];
      if (v38)
      {
        v81[0] = v68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v39;
        v42 = (void *)v40;
        v43 = -[PRPosterContentDiscreteColorsStyle initWithVibrantColors:variation:](v41, "initWithVibrantColors:variation:", v40, v78);
      }
      else
      {
        v80 = v68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v39;
        v42 = (void *)v44;
        v43 = -[PRPosterContentDiscreteColorsStyle initWithOpaqueColors:variation:](v45, "initWithOpaqueColors:variation:", v44, v78);
      }
      v46 = (void *)v43;

      objc_msgSend(v13, "setSelectedStyle:", v46);
      v37 = v68;
    }

  }
  v47 = [PREditingFontAndContentStylePickerViewController alloc];
  -[PREditor posterRole](self, "posterRole");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor titleString](self, "titleString");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[PREditingFontAndContentStylePickerViewController initWithComponents:role:titleString:](v47, "initWithComponents:role:titleString:", v29, v48, v49);

  -[PREditingFontAndContentStylePickerViewController setDelegate:](v50, "setDelegate:", self);
  -[PREditingFontAndContentStylePickerViewController setTitle:](v50, "setTitle:", v14);

  -[PREditingFontAndContentStylePickerViewController setContentStylePickerConfiguration:](v50, "setContentStylePickerConfiguration:", v13);
  -[PREditingFontAndContentStylePickerViewController setTitleStyleConfiguration:](v50, "setTitleStyleConfiguration:", v72);

  -[PREditor extensionBundleURL](self, "extensionBundleURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndContentStylePickerViewController setExtensionBundleURL:](v50, "setExtensionBundleURL:", v51);

  -[PREditingFontAndContentStylePickerViewController setChangeHandler:](v50, "setChangeHandler:", v73);
  -[PREditingFontAndContentStylePickerViewController navigationItem](v50, "navigationItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_setBackgroundHidden:", 1);

  -[PREditor currentLook](self, "currentLook");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "contentsLuminance");
  v56 = v55;

  -[PREditingFontAndContentStylePickerViewController setContentsLuminance:](v50, "setContentsLuminance:", v56);
  objc_storeStrong((id *)&self->_fontAndContentStylePickerViewController, v50);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v50);
  v58 = v57;
  v59 = v75;
  if (v75 && v71)
  {
    objc_msgSend(v57, "setModalPresentationStyle:", 7);
    objc_msgSend(v58, "popoverPresentationController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setSourceItem:", v75);
    objc_msgSend(v60, "setPermittedArrowDirections:", a8);
    objc_msgSend(v60, "popoverLayoutMargins");
    objc_msgSend(v60, "setPopoverLayoutMargins:", 90.0, v61, 5.0, 5.0);
    objc_msgSend(v60, "setDelegate:", v50);
    if (a4)
      -[PREditor setPopoverPresentationController:](self, "setPopoverPresentationController:", v60);
  }
  else
  {
    v74 = v32;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "userInterfaceIdiom");

    if (v63 == 1)
      objc_msgSend(v58, "setModalPresentationStyle:", 2);
    objc_msgSend(v58, "sheetPresentationController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)MEMORY[0x1E0DC3C78];
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __186__PREditor__presentFontAndContentStylePickerWithPrompt_titleStyleConfiguration_contentStylePickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke;
    v76[3] = &unk_1E21843D0;
    v65 = v50;
    v77 = v65;
    objc_msgSend(v64, "customDetentWithIdentifier:resolver:", CFSTR("FontAndContentStylePickerDodge"), v76);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setDetents:", v67);

    objc_msgSend(v60, "setLargestUndimmedDetentIdentifier:", CFSTR("FontAndContentStylePickerDodge"));
    objc_msgSend(v60, "setPreferredCornerRadius:", PRSheetCornerRadius());
    objc_msgSend(v60, "setDelegate:", v65);

    v32 = v74;
    v59 = v75;
  }

  -[PREditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v58, 1, 0);
}

uint64_t __186__PREditor__presentFontAndContentStylePickerWithPrompt_titleStyleConfiguration_contentStylePickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "desiredDetent");
}

- (void)_presentFontAndColorPickerWithPrompt:(id)a3 titleStyleConfiguration:(id)a4 colorPickerConfiguration:(id)a5 usingPopoverPresentation:(BOOL)a6 popoverSourceItem:(id)a7 popoverDirection:(unint64_t)a8 changeHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  _BOOL8 v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  PREditingFontAndColorPickerViewController *v31;
  void *v32;
  void *v33;
  PREditingFontAndColorPickerViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  PREditingFontAndColorPickerViewController *v49;
  void *v50;
  void *v51;
  _BOOL4 v53;
  id v54;
  id v55;
  _QWORD v56[4];
  PREditingFontAndColorPickerViewController *v57;
  _QWORD v58[2];

  v53 = a6;
  v58[1] = *MEMORY[0x1E0C80C00];
  v55 = a7;
  v54 = a9;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[PREditor posterRole](self, "posterRole");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
  {
    -[PREditor titleString](self, "titleString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "pr_isSuitableForArabicJustification"))
      v18 = _os_feature_enabled_impl();
    else
      v18 = 0;

  }
  else
  {
    v18 = 0;
  }

  -[PREditor posterRole](self, "posterRole");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
  {
    -[PREditor titleString](self, "titleString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "pr_isSuitableForVerticalLayout");

  }
  else
  {
    v21 = 0;
  }
  v22 = a4 != 0;

  -[PREditor posterRole](self, "posterRole");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqual:", CFSTR("PRPosterRoleIncomingCall")) ^ 1;
  if (v13)
    v25 = a4 != 0;
  else
    v25 = 1;
  v26 = (v25 & v24) == 0;
  v27 = 2;
  if (v26)
    v27 = 0;
  v28 = v27 | v22;
  if (v13)
    v28 |= 4uLL;
  v29 = v28 | 8;
  if (!(v22 & v21))
    v29 = v28;
  if (v18)
    v29 |= 0x10uLL;
  if (a4)
    v30 = v29;
  else
    v30 = v28;

  -[PREditor createColorVariationStoreIfNeeded](self, "createColorVariationStoreIfNeeded");
  v31 = [PREditingFontAndColorPickerViewController alloc];
  -[PREditor posterRole](self, "posterRole");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor titleString](self, "titleString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PREditingFontAndColorPickerViewController initWithComponents:role:titleString:](v31, "initWithComponents:role:titleString:", v30, v32, v33);

  -[PREditingFontAndColorPickerViewController setDelegate:](v34, "setDelegate:", self);
  -[PREditingFontAndColorPickerViewController setTitle:](v34, "setTitle:", v15);

  -[PREditingFontAndColorPickerViewController setColorPickerConfiguration:](v34, "setColorPickerConfiguration:", v13);
  -[PREditingFontAndColorPickerViewController setTitleStyleConfiguration:](v34, "setTitleStyleConfiguration:", v14);

  -[PREditor extensionBundleURL](self, "extensionBundleURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndColorPickerViewController setExtensionBundleURL:](v34, "setExtensionBundleURL:", v35);

  -[PREditingFontAndColorPickerViewController setColorVariationStore:](v34, "setColorVariationStore:", self->_colorVariationStore);
  -[PREditingFontAndColorPickerViewController setChangeHandler:](v34, "setChangeHandler:", v54);

  -[PREditingFontAndColorPickerViewController navigationItem](v34, "navigationItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_setBackgroundHidden:", 1);

  -[PREditor currentLook](self, "currentLook");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentsLuminance");
  v40 = v39;

  -[PREditingFontAndColorPickerViewController setContentsLuminance:](v34, "setContentsLuminance:", v40);
  objc_storeStrong((id *)&self->_fontAndColorPickerViewController, v34);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v34);
  v42 = v41;
  if (v55 && v53)
  {
    objc_msgSend(v41, "setModalPresentationStyle:", 7);
    objc_msgSend(v42, "popoverPresentationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSourceItem:", v55);
    objc_msgSend(v43, "setPermittedArrowDirections:", a8);
    objc_msgSend(v43, "popoverLayoutMargins");
    objc_msgSend(v43, "setPopoverLayoutMargins:", 90.0, v44, 5.0, 5.0);
    objc_msgSend(v43, "setDelegate:", v34);
    if (a4)
      -[PREditor setPopoverPresentationController:](self, "setPopoverPresentationController:", v43);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "userInterfaceIdiom");

    if (v46 == 1)
      objc_msgSend(v42, "setModalPresentationStyle:", 2);
    objc_msgSend(v42, "sheetPresentationController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0DC3C78];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __172__PREditor__presentFontAndColorPickerWithPrompt_titleStyleConfiguration_colorPickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke;
    v56[3] = &unk_1E21843D0;
    v49 = v34;
    v57 = v49;
    objc_msgSend(v48, "customDetentWithIdentifier:resolver:", CFSTR("FontAndColorPickerDodge"), v56);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDetents:", v51);

    objc_msgSend(v47, "setLargestUndimmedDetentIdentifier:", CFSTR("FontAndColorPickerDodge"));
    objc_msgSend(v47, "setPreferredCornerRadius:", PRSheetCornerRadius());
    objc_msgSend(v47, "setDelegate:", v49);

  }
  -[PREditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v42, 1, 0);

}

uint64_t __172__PREditor__presentFontAndColorPickerWithPrompt_titleStyleConfiguration_colorPickerConfiguration_usingPopoverPresentation_popoverSourceItem_popoverDirection_changeHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "desiredDetent");
}

- (void)presentAmbientColorPickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  PREditingAmbientColorPickerViewController *v12;
  PREditingAmbientColorPickerViewController *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v6 = a4;
  v7 = a3;
  -[PREditor safeAreaBounds](self, "safeAreaBounds");
  v15 = CGRectInset(v14, 50.0, 0.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v12 = [PREditingAmbientColorPickerViewController alloc];
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v13 = -[PREditingAmbientColorPickerViewController initWithColorPickerConfiguration:width:changeHandler:](v12, "initWithColorPickerConfiguration:width:changeHandler:", v7, v6, CGRectGetWidth(v16));

  -[PREditor presentTitledViewController:animated:completion:](self, "presentTitledViewController:animated:completion:", v13, 1, 0);
}

- (void)presentAmbientContentStylePickerWithConfiguration:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  PREditingAmbientContentStylePickerViewController *v12;
  PREditingAmbientContentStylePickerViewController *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v6 = a4;
  v7 = a3;
  -[PREditor safeAreaBounds](self, "safeAreaBounds");
  v15 = CGRectInset(v14, 50.0, 0.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v12 = [PREditingAmbientContentStylePickerViewController alloc];
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v13 = -[PREditingAmbientContentStylePickerViewController initWithContentStylePickerConfiguration:width:changeHandler:](v12, "initWithContentStylePickerConfiguration:width:changeHandler:", v7, v6, CGRectGetWidth(v16));

  -[PREditor presentTitledViewController:animated:completion:](self, "presentTitledViewController:animated:completion:", v13, 1, 0);
}

- (void)presentTimeStyleEditor
{
  void *v3;
  uint64_t v4;
  void *v5;
  PREditorContentStylePickerConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PRPosterContentVibrantMaterialStyle *v12;
  PRPosterContentVibrantMonochromeStyle *v13;
  void *v14;
  void *v15;
  void *v16;
  PREditorContentStylePalette *v17;
  void *v18;
  PREditorContentStylePalette *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  PREditorContentStylePickerConfiguration *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  if (-[PREditor isCoveredByHostModalPresentation](self, "isCoveredByHostModalPresentation"))
    return;
  -[PREditor configuredProperties](self, "configuredProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor currentLook](self, "currentLook");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "titleStyleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");

  v50 = (id)v4;
  if (!v4)
    v50 = v48;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_10;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v45, "editorShouldAllowUserToAdjustTimeColor:", self))
    {
      goto LABEL_15;
    }
LABEL_10:
    -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "titleContentStylePickerConfigurationForEditor:", self);
      v6 = (PREditorContentStylePickerConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "timeColorPickerConfigurationForEditor:", self);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "selectedColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contentStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "colorPalette");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "colors");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc_init(PRPosterContentVibrantMaterialStyle);
          v54[0] = v12;
          v13 = objc_alloc_init(PRPosterContentVibrantMonochromeStyle);
          v54[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "bs_map:", &__block_literal_global_13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = [PREditorContentStylePalette alloc];
          objc_msgSend(v10, "localizedName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[PREditorContentStylePalette initWithContentStyles:localizedName:](v17, "initWithContentStyles:localizedName:", v16, v18);

        }
        else
        {
          v19 = 0;
        }
        v22 = objc_msgSend(v49, "colorWellDisplayMode");
        if (v22 == 2)
          v23 = 2;
        else
          v23 = v22 == 1;
        v24 = [PREditorContentStylePickerConfiguration alloc];
        objc_msgSend(v49, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "prompt");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[PREditorContentStylePickerConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](v24, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v25, v26, v8, v19, v23);

        -[PREditorContentStylePickerConfiguration setShowsSuggestedContentStyleItem:](v6, "setShowsSuggestedContentStyleItem:", objc_msgSend(v49, "showsSuggestedColorItem"));
        goto LABEL_23;
      }
      v6 = objc_alloc_init(PREditorContentStylePickerConfiguration);
      -[PREditorContentStylePickerConfiguration setColorWellDisplayMode:](v6, "setColorWellDisplayMode:", 1);
    }
    v49 = 0;
LABEL_23:
    -[PREditorContentStylePickerConfiguration setForTitleStylePicker:](v6, "setForTitleStylePicker:", 1);
    objc_msgSend(v48, "titleContentStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27
      && -[PREditorContentStylePickerConfiguration showsSuggestedContentStyleItem](v6, "showsSuggestedContentStyleItem"))
    {
      -[PREditorContentStylePickerConfiguration setSuggestedStyle:](v6, "setSuggestedStyle:", v27);
    }
    objc_msgSend(v50, "effectiveTitleContentStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditorContentStylePickerConfiguration setSelectedStyle:](v6, "setSelectedStyle:", v28);
    -[PREditorContentStylePickerConfiguration stylePalette](v6, "stylePalette");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      -[PFServerPosterPath role](self->_sourceContents, "role");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PREditorContentStylePalette defaultPaletteForContext:role:](PREditorContentStylePalette, "defaultPaletteForContext:role:", 2, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[PREditorContentStylePickerConfiguration setStylePalette:](v6, "setStylePalette:", v32);
      -[PREditorContentStylePickerConfiguration setIdentifier:](v6, "setIdentifier:", CFSTR("timeEditor"));

    }
    PRBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("EDIT_TIME_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  if ((objc_msgSend(v45, "editorShouldAllowUserToAdjustTitleContentStyle:", self) & 1) != 0)
    goto LABEL_10;
LABEL_15:
  PRBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("EDIT_TIME_PROMPT_FONT_ONLY"), &stru_1E2186E08, CFSTR("PosterKit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  v6 = 0;
LABEL_29:
  -[PREditor rootViewController](self, "rootViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "titlePopoverLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    v36 = 8;
  else
    v36 = 4;
  -[PREditor rootViewController](self, "rootViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "window");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "windowScene");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "interfaceOrientation");

  if ((unint64_t)(v41 - 1) < 2)
    v42 = 1;
  else
    v42 = v36;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "userInterfaceIdiom") == 1;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __34__PREditor_presentTimeStyleEditor__block_invoke_2;
  v51[3] = &unk_1E2184418;
  objc_copyWeak(&v52, &location);
  -[PREditor _presentFontAndContentStylePickerWithPrompt:titleStyleConfiguration:contentStylePickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:](self, "_presentFontAndContentStylePickerWithPrompt:titleStyleConfiguration:contentStylePickerConfiguration:usingPopoverPresentation:popoverSourceItem:popoverDirection:changeHandler:", v21, v50, v6, v44, v35, v42, v51);

  -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 1);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

}

id __34__PREditor_presentTimeStyleEditor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "contentStylePreferringVibrancy:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "allowsVariation"))
  {
    v3 = objc_msgSend(v2, "copyWithVariation:", 0.0);

    v2 = (void *)v3;
  }
  return v2;
}

void __34__PREditor_presentTimeStyleEditor__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleTitleStyleEditorChange:", v3);

}

- (void)_handleTitleStyleEditorChange:(id)a3
{
  PRPosterMutableConfiguredProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PRPosterSystemTimeFontConfiguration *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PRPosterSystemTimeFontConfiguration *v19;
  void *v20;
  float v21;
  PRPosterSystemTimeFontConfiguration *v22;
  void *v23;
  uint64_t v24;
  PRPosterCustomTimeFontConfiguration *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PREditor *v38;
  void *v39;
  void *v40;
  PRPosterMutableConfiguredProperties *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a3;
  -[PREditor configuredProperties](self, "configuredProperties");
  v4 = (PRPosterMutableConfiguredProperties *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:", v4);
  }
  -[PRPosterConfiguredProperties titleStyleConfiguration](v4, "titleStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  if (!v6)
  {
    -[PREditor currentLook](self, "currentLook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  objc_msgSend(v47, "timeFontIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v47, "isSystemItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:systemItem:]([PRPosterSystemTimeFontConfiguration alloc], "initWithTimeFontIdentifier:systemItem:", v9, v11);
    objc_msgSend(v6, "setTimeFontConfiguration:", v12);
    objc_msgSend(v6, "setUserConfigured:", 1);

  }
  objc_msgSend(v6, "timeFontConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  objc_msgSend(v47, "fontWeight");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && v17)
  {
    v19 = [PRPosterSystemTimeFontConfiguration alloc];
    objc_msgSend(v17, "timeFontIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v22 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](v19, "initWithTimeFontIdentifier:weight:systemItem:", v20, objc_msgSend(v17, "isSystemItem"), v21);

    objc_msgSend(v6, "setTimeFontConfiguration:", v22);
    objc_msgSend(v6, "setUserConfigured:", 1);

  }
  -[PREditor extensionBundleURL](self, "extensionBundleURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "customFont");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = -[PRPosterCustomTimeFontConfiguration initWithFont:extensionBundleURL:]([PRPosterCustomTimeFontConfiguration alloc], "initWithFont:extensionBundleURL:", v24, v23);
    if (v25)
    {
      objc_msgSend(v6, "setTimeFontConfiguration:", v25);
      objc_msgSend(v6, "setUserConfigured:", 1);
    }

  }
  v44 = v18;
  objc_msgSend(v47, "preferredTitleAlignment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v6, "setPreferredTitleAlignment:", objc_msgSend(v26, "unsignedIntegerValue"));
    objc_msgSend(v6, "setUserConfigured:", 1);
  }
  v43 = (void *)v24;
  objc_msgSend(v47, "preferredTitleLayout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v6, "setPreferredTitleLayout:", objc_msgSend(v28, "unsignedIntegerValue"));
    objc_msgSend(v6, "setUserConfigured:", 1);
  }
  v45 = v17;
  objc_msgSend(v47, "numberingSystem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v6, "setTimeNumberingSystem:", v30);
    objc_msgSend(v6, "setUserConfigured:", 1);
  }
  v46 = (void *)v9;
  objc_msgSend(v47, "contentStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v6, "setTitleContentStyle:", v31);
    objc_msgSend(v6, "setUserConfigured:", 1);
  }
  -[PRPosterConfiguredProperties setTitleStyleConfiguration:](v4, "setTitleStyleConfiguration:", v6);
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "timeFontConfiguration");
    v41 = v4;
    v42 = v5;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor extensionBundleURL](self, "extensionBundleURL");
    v40 = v30;
    v34 = v29;
    v35 = v27;
    v36 = v23;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeFontConfigurationWithExtensionBundleURL:", v37);
    v38 = self;
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v36;
    v27 = v35;
    v29 = v34;
    v30 = v40;
    objc_msgSend(v32, "editor:didUpdateSelectedTimeFontConfiguration:", v38, v39);

    self = v38;
    v4 = v41;
    v5 = v42;
  }
  -[PREditingFontAndContentStylePickerViewController setTitleStyleConfiguration:](self->_fontAndContentStylePickerViewController, "setTitleStyleConfiguration:", v6);
  -[PREditorRootViewController lookPropertiesDidChange](self->_rootViewController, "lookPropertiesDidChange");

}

- (void)requestDismissalWithAction:(int64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  PREditingRequestDismissalAction *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PRLogEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("accept");
    if (a3 != 1)
      v6 = 0;
    if (!a3)
      v6 = CFSTR("cancel");
    v7 = v6;
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Requesting dismissal with action '%{public}@'", (uint8_t *)&v13, 0xCu);

  }
  if (a3 != 1)
  {
    -[PREditor rootViewController](self, "rootViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[PREditor status](self, "status") == 2)
  {
    -[PREditor rootViewController](self, "rootViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "editorShouldBeginFinalization:", self) & 1) == 0)
    {
      PRLogEditing();
      v10 = (PREditingRequestDismissalAction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18B634000, &v10->super.super, OS_LOG_TYPE_DEFAULT, "Canceling dismissal due to delegate", (uint8_t *)&v13, 2u);
      }
      goto LABEL_14;
    }

LABEL_13:
    -[NSObject scrollView](v8, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_forcePanGestureToEndImmediately");
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
    -[NSObject setIgnoresScrolling:](v8, "setIgnoresScrolling:", 1);
    -[NSObject forciblyFinishLookTransition](v8, "forciblyFinishLookTransition");
    v10 = -[PREditingRequestDismissalAction initWithUserAcceptedChanges:completion:]([PREditingRequestDismissalAction alloc], "initWithUserAcceptedChanges:completion:", a3 == 1, 0);
    -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendActions:", v12);

LABEL_14:
    goto LABEL_15;
  }
  PRLogEditing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_18B634000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to dismiss and accept changes because the UI is not running", (uint8_t *)&v13, 2u);
  }
LABEL_15:

}

- (BOOL)allowsHitTestingInRootViewController
{
  return -[PREditor variant](self, "variant") != 2;
}

- (BOOL)isLifecycleTiedToInitiallyPresentedViewController
{
  return -[PREditor variant](self, "variant") == 2;
}

- (BOOL)presentsViewControllersRemotely
{
  return -[PREditor variant](self, "variant") == 2;
}

- (BOOL)isViewControllerPresentationAnimationAllowed
{
  return !-[PREditor presentsViewControllersRemotely](self, "presentsViewControllersRemotely");
}

- (BOOL)needsCustomViewControllerPresentationManager
{
  return -[PREditor variant](self, "variant") == 2;
}

- (id)viewControllerForPresentingViewControllersCreatingIfNecessary:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  if (-[PREditor presentsViewControllersRemotely](self, "presentsViewControllersRemotely", a3))
  {
    -[PREditor remoteViewControllerPresentationWindow](self, "remoteViewControllerPresentationWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PREditor makeViewControllerForRemoteViewControllerPresentations](self, "makeViewControllerForRemoteViewControllerPresentations");
      -[PREditor remoteViewControllerPresentationWindow](self, "remoteViewControllerPresentationWindow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rootViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PRLogEditing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "will present view controller remotely", v9, 2u);
    }

  }
  else
  {
    -[PREditor rootViewController](self, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)makeViewControllerForRemoteViewControllerPresentations
{
  void *v3;
  id v4;
  id v5;

  -[PREditor scene](self, "scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v5);
  objc_msgSend(v3, "setWindowLevel:", -100.0);
  objc_msgSend(v3, "setHidden:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v3, "setRootViewController:", v4);
  -[PREditor setRemoteViewControllerPresentationWindow:](self, "setRemoteViewControllerPresentationWindow:", v3);

}

- (void)didPresentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  -[PREditor remoteViewControllerPresentationWindow](self, "remoteViewControllerPresentationWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PREditor scene](self, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0DC4730];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__PREditor_didPresentViewController___block_invoke;
    v9[3] = &unk_1E2184440;
    v10 = v4;
    v11 = v6;
    v12 = v5;
    v8 = v6;
    objc_msgSend(v7, "_performBlockAfterCATransactionCommits:", v9);

  }
}

void __37__PREditor_didPresentViewController___block_invoke(id *a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t RenderId;
  PREditingRequestRemoteViewControllerPresentationAction *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _DWORD v28[2];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1[5], "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertRect:toCoordinateSpace:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = objc_msgSend(a1[6], "_contextId");
  objc_msgSend(a1[6], "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  RenderId = CALayerGetRenderId();

  v23 = -[PREditingRequestRemoteViewControllerPresentationAction initWithSourceLayerRenderId:sourceContextId:presentedViewScreenRect:]([PREditingRequestRemoteViewControllerPresentationAction alloc], "initWithSourceLayerRenderId:sourceContextId:presentedViewScreenRect:", RenderId, v20, v13, v15, v17, v19);
  PRLogEditing();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v34.origin.x = v13;
    v34.origin.y = v15;
    v34.size.width = v17;
    v34.size.height = v19;
    NSStringFromCGRect(v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = 67109634;
    v28[1] = v20;
    v29 = 2048;
    v30 = RenderId;
    v31 = 2114;
    v32 = v25;
    _os_log_impl(&dword_18B634000, v24, OS_LOG_TYPE_DEFAULT, "sending action to PosterBoard to present view contorller remotely with contextId %u and layerRenderId %llu in rect %{public}@", (uint8_t *)v28, 0x1Cu);

  }
  objc_msgSend(a1[5], "_FBSScene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendActions:", v27);

}

- (void)setEditingFocusActive:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;

  -[PREditorRootViewController view](self->_rootViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__PREditor_setEditingFocusActive___block_invoke;
  v17[3] = &unk_1E2184468;
  v17[4] = self;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v8, v17);
  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __34__PREditor_setEditingFocusActive___block_invoke_2;
  v13[3] = &unk_1E2184490;
  v16 = a3;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "updateClientSettingsWithTransitionBlock:", v13);

}

uint64_t __34__PREditor_setEditingFocusActive___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTitleReticleActive:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "updateReticleVisibilityIfNeeded");
}

id __34__PREditor_setEditingFocusActive___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "pr_setEditingFocusActive:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_synchronizedDrawingFence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationFence:", v4);

  objc_msgSend(v3, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  return v3;
}

- (void)didFinishTransitionToLook:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[PREditor effectiveTitleStyleConfigurationForLook:](self, "effectiveTitleStyleConfigurationForLook:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsLuminance");
  v6 = v5;

  -[PREditingFontAndColorPickerViewController setContentsLuminance:](self->_fontAndColorPickerViewController, "setContentsLuminance:", v6);
}

- (CGRect)safeAreaBounds
{
  UIWindow *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v2 = self->_window;
  -[UIWindow safeAreaInsets](v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIWindow bounds](v2, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v6 + v12;
  v20 = v4 + v14;
  v21 = v16 - (v6 + v10);
  v22 = v18 - (v4 + v8);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIEdgeInsets)editingChromeDodgingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[PREditorRootViewController editingChromeDodgingInsets](self->_rootViewController, "editingChromeDodgingInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setDepthEffectDisallowed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_depthEffectDisallowed != a3)
  {
    v3 = a3;
    self->_depthEffectDisallowed = a3;
    -[PREditor setDepthEffectEnabled:](self, "setDepthEffectEnabled:", !a3);
    -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "editor:depthEffectDisallowedDidChange:", self, v3);

  }
}

- (BOOL)isDepthEffectEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_isDepthEffectDisabled");

  return v4 ^ 1;
}

- (void)setDepthEffectEnabled:(BOOL)a3
{
  int v3;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  char v10;

  v3 = a3;
  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pr_isDepthEffectDisabled");

  if (v6 == v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__PREditor_setDepthEffectEnabled___block_invoke;
    v9[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
    v10 = v3;
    objc_msgSend(v8, "updateClientSettingsWithBlock:", v9);
    -[PREditor rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
    -[PREditor updateRootViewControllerMenus](self, "updateRootViewControllerMenus");

  }
}

uint64_t __34__PREditor_setDepthEffectEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDepthEffectDisabled:", *(_BYTE *)(a1 + 32) == 0);
}

- (BOOL)isDepthEffectEffectivelyDisabled
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pr_isDepthEffectDisabled");

  v6 = -[PREditor isDepthEffectDisallowed](self, "isDepthEffectDisallowed");
  -[PREditor posterRole](self, "posterRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));

  -[PREditor configuredProperties](self, "configuredProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleStyleConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "prefersVerticalTitleLayout");

  if ((v5 & 1) != 0)
    v12 = 1;
  else
    v12 = v6 | v8 & v11;

  return v12;
}

- (BOOL)isDepthEffectDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_isDepthEffectDisabled");

  return v4;
}

- (UIMenu)depthEffectMenu
{
  UIMenu *depthEffectMenu;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UIMenu *v20;
  UIMenu *v21;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  depthEffectMenu = self->_depthEffectMenu;
  if (!depthEffectMenu)
  {
    -[PREditor rootViewController](self, "rootViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageForDepthEffectActionTopLevelAction:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3428];
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DEPTH_EFFECT_ON"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __27__PREditor_depthEffectMenu__block_invoke;
    v29[3] = &unk_1E21844D8;
    v29[4] = self;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3428];
    PRBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEPTH_EFFECT_OFF"), &stru_1E2186E08, CFSTR("PosterKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __27__PREditor_depthEffectMenu__block_invoke_2;
    v28[3] = &unk_1E21844D8;
    v28[4] = self;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC36F8];
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __27__PREditor_depthEffectMenu__block_invoke_3;
    v25[3] = &unk_1E2184500;
    v25[4] = self;
    v26 = v8;
    v27 = v12;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v13, "elementWithUncachedProvider:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC39D0];
    v18 = PREditorDepthEffectActionIdentifier;
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "menuWithTitle:image:identifier:options:children:", &stru_1E2186E08, v23, v18, 0, v19);
    v20 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    v21 = self->_depthEffectMenu;
    self->_depthEffectMenu = v20;

    depthEffectMenu = self->_depthEffectMenu;
  }
  return depthEffectMenu;
}

uint64_t __27__PREditor_depthEffectMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDepthEffectEnabled:", 1);
}

uint64_t __27__PREditor_depthEffectMenu__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDepthEffectEnabled:", 0);
}

void __27__PREditor_depthEffectMenu__block_invoke_3(id *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "isDepthEffectDisallowed");
  objc_msgSend(a1[5], "setAttributes:", v5);
  v6 = a1[5];
  if ((v5 & 1) != 0)
  {
    PRBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEPTH_EFFECT_DISALLOWED"), &stru_1E2186E08, CFSTR("PosterKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v8);

  }
  else
  {
    objc_msgSend(a1[5], "setSubtitle:", 0);
  }
  v9 = objc_msgSend(a1[4], "isDepthEffectEnabled");
  objc_msgSend(a1[5], "setState:", v9);
  objc_msgSend(a1[6], "setState:", v9 ^ 1);
  v10 = a1[5];
  v12[0] = a1[6];
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11);

}

- (void)toggleDepthEffect
{
  -[PREditor setDepthEffectEnabled:](self, "setDepthEffectEnabled:", -[PREditor isDepthEffectEnabled](self, "isDepthEffectEnabled") ^ 1);
}

- (BOOL)isPerspectiveZoomEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_isParallaxEnabled");

  return v4;
}

- (void)setPerspectiveZoomEnabled:(BOOL)a3
{
  if (-[PREditor isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled") != a3)
    -[PREditor _togglePerspectiveZoom](self, "_togglePerspectiveZoom");
}

- (BOOL)isPerspectiveZoomDisallowed
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_isParallaxDisallowed");

  return v4;
}

- (UIAction)togglingPerspectiveZoomAction
{
  UIAction *togglingPerspectiveZoomAction;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  _QWORD v12[5];

  togglingPerspectiveZoomAction = self->_togglingPerspectiveZoomAction;
  if (!togglingPerspectiveZoomAction)
  {
    v4 = -[PREditor isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled");
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PERSPECTIVE_ZOOM"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("perspective"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PREditor_togglingPerspectiveZoomAction__block_invoke;
    v12[3] = &unk_1E21844D8;
    v12[4] = self;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("PREditor.ToggleParallax"), v12);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_togglingPerspectiveZoomAction;
    self->_togglingPerspectiveZoomAction = v9;

    -[UIAction setState:](self->_togglingPerspectiveZoomAction, "setState:", v4);
    togglingPerspectiveZoomAction = self->_togglingPerspectiveZoomAction;
  }
  return togglingPerspectiveZoomAction;
}

uint64_t __41__PREditor_togglingPerspectiveZoomAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_togglePerspectiveZoom");
}

- (void)_togglePerspectiveZoom
{
  id v3;

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateClientSettingsWithBlock:", &__block_literal_global_130);
  -[UIAction setState:](self->_togglingPerspectiveZoomAction, "setState:", -[PREditor isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"));
  -[PREditor updateRootViewControllerMenus](self, "updateRootViewControllerMenus");

}

void __34__PREditor__togglePerspectiveZoom__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "pr_setParallaxEnabled:", objc_msgSend(v2, "pr_isParallaxEnabled") ^ 1);

}

- (UIMenu)appearanceMenu
{
  UIMenu *appearanceMenu;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  UIMenu *v26;
  UIMenu *v27;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  appearanceMenu = self->_appearanceMenu;
  if (!appearanceMenu)
  {
    PRBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APPEARANCE"), &stru_1E2186E08, CFSTR("PosterKit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appearance"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3428];
    PRBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC"), &stru_1E2186E08, CFSTR("PosterKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __26__PREditor_appearanceMenu__block_invoke;
    v37[3] = &unk_1E21844D8;
    v37[4] = self;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3428];
    PRBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LIGHT"), &stru_1E2186E08, CFSTR("PosterKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __26__PREditor_appearanceMenu__block_invoke_2;
    v36[3] = &unk_1E21844D8;
    v36[4] = self;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3428];
    PRBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DARK"), &stru_1E2186E08, CFSTR("PosterKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v8;
    v35[1] = 3221225472;
    v35[2] = __26__PREditor_appearanceMenu__block_invoke_3;
    v35[3] = &unk_1E21844D8;
    v35[4] = self;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC36F8];
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __26__PREditor_appearanceMenu__block_invoke_4;
    v31[3] = &unk_1E2184568;
    v31[4] = self;
    v32 = v9;
    v33 = v13;
    v34 = v17;
    v19 = v17;
    v20 = v13;
    v21 = v9;
    objc_msgSend(v18, "elementWithUncachedProvider:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0DC39D0];
    v24 = PREditorAppearanceMenuIdentifier;
    v38[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", v30, v29, v24, 0, v25);
    v26 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    v27 = self->_appearanceMenu;
    self->_appearanceMenu = v26;

    appearanceMenu = self->_appearanceMenu;
  }
  return appearanceMenu;
}

uint64_t __26__PREditor_appearanceMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearance:", 0);
}

uint64_t __26__PREditor_appearanceMenu__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearance:", 1);
}

uint64_t __26__PREditor_appearanceMenu__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearance:", 2);
}

void __26__PREditor_appearanceMenu__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateSafeForCallbackType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "activeAppearanceMenuSelectionForEditor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setState:", v6 == 0);
    objc_msgSend(*(id *)(a1 + 48), "setState:", v6 == 1);
    objc_msgSend(*(id *)(a1 + 56), "setState:", v6 == 2);
  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = *(_QWORD *)(a1 + 56);
  v10[1] = v7;
  v10[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

}

- (void)_updateAppearance:(int64_t)a3
{
  id v5;

  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "editor:appearanceMenuDidChangeSelectedStyle:", self, a3);

}

- (UIAction)placeholderAction
{
  return (UIAction *)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", &stru_1E2186E08, 0, PREditorPlaceholderActionIdentifier, &__block_literal_global_145);
}

- (void)setComplicationsVibrancyConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pr_vibrancyConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualObjects() & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PREditor_setComplicationsVibrancyConfiguration___block_invoke;
    v8[3] = &unk_1E21845D0;
    v9 = v7;
    objc_msgSend(v4, "updateClientSettingsWithBlock:", v8);

  }
}

uint64_t __50__PREditor_setComplicationsVibrancyConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVibrancyConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)_discardRootViewController
{
  -[PREditor setRootViewController:](self, "setRootViewController:", 0);
}

- (void)_rebuildRootViewController
{
  _BOOL8 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[PREditor allowsHitTestingInRootViewController](self, "allowsHitTestingInRootViewController");
  -[UIWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:", v3);
  -[UIWindow layer](self->_window, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsHitTesting:", v3);

  if (-[PREditor displaysRootViewController](self, "displaysRootViewController"))
  {
    -[PREditor rootViewController](self, "rootViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PREditor areViewsSharedBetweenLooks](self, "areViewsSharedBetweenLooks");
    v5 = objc_alloc_init((Class)(id)objc_opt_self());
    objc_msgSend(v5, "setEditor:", self);
    -[PREditor dateProvider](self, "dateProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateProvider:", v6);
    objc_msgSend(v5, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
    objc_msgSend(v5, "setUsesEditingLayout:", -[PREditor usesEditingLayout](self, "usesEditingLayout"));
    objc_msgSend(v5, "setControlsHidden:", -[PREditor areControlsHidden](self, "areControlsHidden"));
    objc_msgSend(v5, "setComplicationsRowConfigured:", -[PREditor isComplicationsRowConfigured](self, "isComplicationsRowConfigured"));
    objc_msgSend(v5, "setComplicationSidebarConfigured:", -[PREditor isComplicationSidebarConfigured](self, "isComplicationSidebarConfigured"));
    objc_msgSend(v5, "setFocusedComplicationElement:", -[PREditor focusedComplicationElement](self, "focusedComplicationElement"));
    objc_msgSend(v5, "setSubtitleHidden:", -[PREditor isInlineComplicationConfigured](self, "isInlineComplicationConfigured"));
    objc_msgSend(v5, "setFocusedQuickActionPosition:", -[PREditor focusedQuickActionPosition](self, "focusedQuickActionPosition"));
    -[PREditor setRootViewController:](self, "setRootViewController:", v5);
    objc_msgSend(v10, "contentOverlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setContentOverlayView:", v7);
    objc_msgSend(v5, "loadViewIfNeeded");
    objc_msgSend(v5, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor updateScrollViewDecelerationRate:](self, "updateScrollViewDecelerationRate:", v8);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v5);
    -[UIWindow _rootSheetPresentationController](self->_window, "_rootSheetPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setShouldScaleDownBehindDescendantSheets:", 0);

  }
  else
  {
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", 0);
    -[PREditor setRootViewController:](self, "setRootViewController:", 0);
  }
}

- (id)_refetchLooks
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "looksForEditor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "identifier", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v13))
        {
          v15 = (void *)MEMORY[0x1E0C99DA0];
          v16 = *MEMORY[0x1E0C99778];
          v17 = CFSTR("Look identifiers must be unique");
          goto LABEL_13;
        }
        objc_msgSend(v5, "addObject:", v13);
        if (objc_msgSend(v6, "containsObject:", v12))
        {
          v15 = (void *)MEMORY[0x1E0C99DA0];
          v16 = *MEMORY[0x1E0C99778];
          v17 = CFSTR("Looks must be unique");
LABEL_13:
          objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v18);
        }
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)_refetchLooksForProperties
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;

  -[PREditor _refetchLooks](self, "_refetchLooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "looks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "count");
  v25 = v5;
  if (v6 != objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count of updated looks for updating properties does not match count of current looks"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditor _refetchLooksForProperties].cold.3();
    goto LABEL_20;
  }
  v7 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 1)
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((v14 & 1) == 0)
        break;
      objc_msgSend(v10, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updated look display name does not match existing look"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PREditor _refetchLooksForProperties].cold.1();
        objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18B66A130);
      }
      v18 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v10, "initialTimeFontConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v18, "setInitialTimeFontConfiguration:", v19);
      objc_msgSend(v10, "initialTitleColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v18, "setInitialTitleColor:", v20);
      v21 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v8, "addObject:", v21);

      if (v7 == ++v9)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updated look identifier does not match existing look"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditor _refetchLooksForProperties].cold.2();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B66A0DCLL);
  }
LABEL_11:

  return v8;
}

- (void)_refreshDefaultTitleStyleConfigurationsForLooks:(id)a3 luminanceForLooks:(id)a4 initialLook:(id)a5 configuredTitleStyleConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSMutableDictionary *defaultTitleStyleConfigurationPerLook;
  NSObject *v16;
  _BOOL4 v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id obj;
  int v45;
  void *v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v48 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[PREditor shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:](self, "shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:", v12);
  v14 = -[PREditor shouldIgnorePreviouslyConfiguredTitleStyleConfiguration](self, "shouldIgnorePreviouslyConfiguredTitleStyleConfiguration");
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  v46 = (void *)-[NSMutableDictionary copy](self->_defaultTitleStyleConfigurationPerLook, "copy");
  defaultTitleStyleConfigurationPerLook = self->_defaultTitleStyleConfigurationPerLook;
  PRLogEditing();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (defaultTitleStyleConfigurationPerLook)
  {
    if (v17)
    {
      *(_DWORD *)buf = 134217984;
      v55 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_18B634000, v16, OS_LOG_TYPE_INFO, "Rebuilding _defaultTitleStyleConfigurationPerLook for %lu looks", buf, 0xCu);
    }

    -[NSMutableDictionary removeAllObjects](self->_defaultTitleStyleConfigurationPerLook, "removeAllObjects");
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 134217984;
      v55 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_18B634000, v16, OS_LOG_TYPE_INFO, "Building _defaultTitleStyleConfigurationPerLook for %lu looks", buf, 0xCu);
    }

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = self->_defaultTitleStyleConfigurationPerLook;
    self->_defaultTitleStyleConfigurationPerLook = v18;

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v10;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v20)
  {
    v21 = v20;
    v47 = *(_QWORD *)v50;
    v45 = v13 || v14;
    v22 = v11;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v50 != v47)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v23);
        objc_msgSend(v48, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        if (!v11)
          goto LABEL_20;
        v28 = objc_msgSend(v24, "isEqual:", v11) ^ 1;
        if (!v12)
          v28 = 1;
        if (((v28 | v45) & 1) != 0)
        {
LABEL_20:
          objc_msgSend(v46, "objectForKey:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 && (!v12 || objc_msgSend(v12, "isEqual:", v29)))
          {
            v30 = v29;
            goto LABEL_24;
          }
          objc_msgSend(v24, "initialTimeFontConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {

            goto LABEL_27;
          }
          objc_msgSend(v24, "initialTitleColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12 || v40)
          {
LABEL_27:
            objc_msgSend(v12, "timeNumberingSystem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "titleStyleConfigurationWithExtensionBundle:luminance:timeNumberingSystem:", v43, v33, v27);
            v31 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v30 = v12;
LABEL_24:
            v31 = v30;
          }

          goto LABEL_30;
        }
        v31 = v12;
LABEL_30:
        v34 = (void *)objc_msgSend(v31, "mutableCopy");
        objc_msgSend(v31, "timeFontConfiguration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditor _selectableTimeFontConfigurationForProposedTimeFontConfiguration:](self, "_selectableTimeFontConfigurationForProposedTimeFontConfiguration:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTimeFontConfiguration:", v36);

        objc_msgSend(v34, "groupName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
          objc_msgSend(v24, "groupName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setGroupName:", v38);

        }
        objc_msgSend(v34, "setContentsLuminance:", v27);
        v39 = (void *)objc_msgSend(v34, "copy");

        -[NSMutableDictionary setObject:forKey:](self->_defaultTitleStyleConfigurationPerLook, "setObject:forKey:", v39, v24);
        ++v23;
        v11 = v22;
      }
      while (v21 != v23);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v21 = v41;
    }
    while (v41);
  }

}

- (id)_selectableTimeFontConfigurationForProposedTimeFontConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  int v25;
  uint64_t v26;
  PRTimeFontConfiguration *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  PREditor *v46;

  v4 = a3;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor posterRole](self, "posterRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PREditingFontAndColorPickerViewController defaultFontIdentifiersForRole:titleString:](PREditingFontAndColorPickerViewController, "defaultFontIdentifiersForRole:titleString:", v6, self->_titleString);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_map:", &__block_literal_global_163);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_2;
  v44[3] = &unk_1E2184638;
  v10 = v5;
  v45 = v10;
  v46 = self;
  objc_msgSend(v8, "bs_filter:", v44);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditor posterRole](self, "posterRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"));

  v33 = v10;
  v35 = v7;
  if ((v13 & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v10, "additionalTimeFontConfigurationsForEditor:", self, v10, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PREditor extensionBundleURL](self, "extensionBundleURL", v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeFontConfigurationWithExtensionBundleURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_3;
  v40[3] = &unk_1E2184660;
  v18 = v16;
  v41 = v18;
  v19 = v14;
  v42 = v19;
  v20 = v4;
  v43 = v20;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v38[1] = 3221225472;
  v38[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_4;
  v38[3] = &unk_1E2184688;
  v22 = v18;
  v39 = v22;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v38);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_7;
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_5;
  v36[3] = &unk_1E2184688;
  v24 = v22;
  v37 = v24;
  objc_msgSend(v17, "bs_firstObjectPassingTest:", v36);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
LABEL_7:
    v25 = objc_msgSend(v19, "containsObject:", v23);
LABEL_8:
    v26 = v25 ^ 1u;
    goto LABEL_9;
  }
  objc_msgSend(v17, "firstObject");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v19, "containsObject:", v23);
  if (v23)
    goto LABEL_8;
  v23 = v24;
  v26 = 0;
LABEL_9:
  if (objc_msgSend(v11, "containsObject:", v23))
  {
    v27 = [PRTimeFontConfiguration alloc];
    objc_msgSend(v23, "timeFontIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "weight");
    v29 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](v27, "initWithTimeFontIdentifier:weight:", v28);

    v23 = (id)v29;
  }
  -[PREditor extensionBundleURL](self, "extensionBundleURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterTimeFontConfiguration configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:](PRPosterTimeFontConfiguration, "configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:", v23, v30, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

PRTimeFontConfiguration *__77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRTimeFontConfiguration *v3;

  v2 = a2;
  v3 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:]([PRTimeFontConfiguration alloc], "initWithTimeFontIdentifier:", v2);

  return v3;
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(*(id *)(a1 + 32), "editor:shouldAllowUserToSelectTimeFontConfiguration:", *(_QWORD *)(a1 + 40), v3);
  else
    v4 = 1;

  return v4;
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;

  v3 = a2;
  v4 = BSEqualObjects();
  objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);

  objc_msgSend(*(id *)(a1 + 48), "isSystemItem");
  return v4 & BSEqualBools();
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_4()
{
  return BSEqualObjects();
}

uint64_t __77__PREditor__selectableTimeFontConfigurationForProposedTimeFontConfiguration___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "timeFontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  return v5;
}

- (void)_refetchLooksAndBuildUI
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  PRPosterMutableConfiguredProperties *v15;
  PRPosterMutableConfiguredProperties *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PRPosterMutableConfiguredProperties *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  uint8_t buf[16];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (-[PREditor status](self, "status") != 2)
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v10 = "Ignoring call to refetch looks because the UI is not running";
LABEL_15:
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_36;
  }
  if (!-[PREditor displaysRootViewController](self, "displaysRootViewController"))
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v10 = "Ignoring call to refetch looks because we will never see the UI";
    goto LABEL_15;
  }
  -[PREditor rootViewController](self, "rootViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PREditor _refetchLooks](self, "_refetchLooks");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v60, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREditor.m"), 1890, CFSTR("Need more than one look!"));

  }
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "initialLookIdentifierForEditor:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREditor.m"), 1895, CFSTR("nil should not be returned from initialLookIdentifierForEditor:"));

    }
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __35__PREditor__refetchLooksAndBuildUI__block_invoke;
    v65[3] = &unk_1E21846B0;
    v7 = v6;
    v66 = v7;
    v8 = objc_msgSend(v60, "indexOfObjectPassingTest:", v65);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREditor.m"), 1899, CFSTR("initial look not found in looks array"));

    }
    objc_msgSend(v60, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v60, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PREditor setInitialLook:](self, "setInitialLook:", v9);
  -[PREditor setCurrentLook:](self, "setCurrentLook:", v9);
  -[PRPosterEditingEnvironment targetConfiguredProperties](self->_environment, "targetConfiguredProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleStyleConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorVariationsConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PREditor shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:](self, "shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:", v12);
  v59 = v11;
  if (v12 && v14)
  {
    v15 = (PRPosterMutableConfiguredProperties *)objc_msgSend(v11, "mutableCopy");
  }
  else if (v13)
  {
    v16 = [PRPosterMutableConfiguredProperties alloc];
    objc_msgSend(v11, "colorVariationsConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:](v16, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", 0, 0, 0, 0, 0, v17, 0, 0, 0);

    v11 = v59;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v12, "contentsLuminance");
  -[PREditor _defaultLuminanceValuesForLooks:initialLook:initialLookLuminanceValue:](self, "_defaultLuminanceValuesForLooks:initialLook:initialLookLuminanceValue:", v60, v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor _refreshLuminanceValuesForCurrentPerLookLuminanceValues:](self, "_refreshLuminanceValuesForCurrentPerLookLuminanceValues:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v12;
  -[PREditor _refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:](self, "_refreshDefaultTitleStyleConfigurationsForLooks:luminanceForLooks:initialLook:configuredTitleStyleConfiguration:", v60, v18, v9, v12);
  objc_msgSend(v11, "titleStyleConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v18;
  if (v19)
  {
    -[PREditor currentLook](self, "currentLook");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v54);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    v23 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v23, "setContentsLuminance:", v22);
    objc_msgSend(v19, "timeFontConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditor _selectableTimeFontConfigurationForProposedTimeFontConfiguration:](self, "_selectableTimeFontConfigurationForProposedTimeFontConfiguration:", v24);
    v25 = v9;
    v26 = v13;
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setTimeFontConfiguration:", v27);
    -[PRPosterConfiguredProperties setTitleStyleConfiguration:](v15, "setTitleStyleConfiguration:", v23);

    v13 = v26;
    v9 = v25;
    v11 = v59;

    v18 = v58;
  }
  v55 = v19;
  -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:", v15);
  -[NSObject setLooks:](v4, "setLooks:", v60);
  -[PREditor leadingTopButtonFrame](self, "leadingTopButtonFrame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[PREditor trailingTopButtonFrame](self, "trailingTopButtonFrame");
  -[NSObject updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:](v4, "updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:", v29, v31, v33, v35, v36, v37, v38, v39);
  -[NSObject view](v4, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutIfNeeded");

  -[PREditor updateActions](self, "updateActions");
  if (-[PREditor areViewsSharedBetweenLooks](self, "areViewsSharedBetweenLooks"))
  {
    -[NSObject views](v4, "views");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editor:populateViews:forLook:", self, v41, v9);

  }
  else
  {
    v52 = v15;
    v53 = v13;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v42 = v60;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v62 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NSObject viewsForLook:](v4, "viewsForLook:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "editor:populateViews:forLook:", self, v48, v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v44);
    }

    v18 = v58;
    v11 = v59;
    v15 = v52;
    v13 = v53;
  }
  -[NSObject scrollToLook:animated:](v4, "scrollToLook:animated:", v9, 0);
  -[NSObject beginLookInteractionHinting](v4, "beginLookInteractionHinting");

LABEL_36:
}

uint64_t __35__PREditor__refetchLooksAndBuildUI__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_applyStylePropertiesFromConfiguredProperties:(id)a3 toConfiguredProperties:(id)a4 forLook:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleStyleConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentsLuminance");
  v12 = v11;
  objc_msgSend(v10, "contentsLuminance");
  if (v12 != v13)
  {
    v14 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v9, "contentsLuminance");
    objc_msgSend(v14, "setContentsLuminance:");

    v10 = v14;
  }
  objc_msgSend(v8, "setTitleStyleConfiguration:", v10);
  objc_msgSend(v16, "colorVariationsConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColorVariationsConfiguration:", v15);

}

- (BOOL)shouldApplyTitleStyleAcrossAllLooksFromConfiguredTitleStyleConfiguration:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[PREditor editingContext](self, "editingContext"))
    v5 = objc_msgSend(v4, "isUserConfigured");
  else
    v5 = 1;

  return v5;
}

- (BOOL)shouldIgnorePreviouslyConfiguredTitleStyleConfiguration
{
  return -[PREditor editingContext](self, "editingContext") == 2
      || -[PREditor hasUpdatedLooks](self, "hasUpdatedLooks")
      || -[PREditor hasUpdatedLookProperties](self, "hasUpdatedLookProperties");
}

- (void)updateRootViewControllerMenus
{
  id v2;

  -[PREditor rootViewController](self, "rootViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateMenuElements");

}

- (void)setRootViewController:(id)a3
{
  PREditorRootViewController *v5;
  PREditorRootViewController *v6;
  PREditorRootViewController **p_rootViewController;
  PREditorRootViewController *rootViewController;
  PREditorRootViewController *v9;

  v5 = (PREditorRootViewController *)a3;
  rootViewController = self->_rootViewController;
  p_rootViewController = &self->_rootViewController;
  v6 = rootViewController;
  if (rootViewController != v5)
  {
    v9 = v5;
    -[PREditorRootViewController invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_rootViewController, a3);
    v5 = v9;
  }

}

- (void)setInlineComplicationConfigured:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_inlineComplicationConfigured != a3)
  {
    v3 = a3;
    self->_inlineComplicationConfigured = a3;
    -[PREditor rootViewController](self, "rootViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitleHidden:", v3);

  }
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterMutableConfiguredProperties *v10;
  id v11;

  if (self->_alternateDateEnabled != a3)
  {
    v3 = a3;
    self->_alternateDateEnabled = a3;
    -[PREditor configuredProperties](self, "configuredProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = objc_alloc_init(PRPosterMutableConfiguredProperties);
      -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:", v10);
      v5 = v10;
    }
    v11 = v5;
    objc_msgSend(v5, "titleStyleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
    {
      -[PREditor currentLook](self, "currentLook");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditor defaultTitleStyleConfigurationForLook:](self, "defaultTitleStyleConfigurationForLook:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v9, "mutableCopy");

    }
    objc_msgSend(v7, "setAlternateDateEnabled:", v3);
    objc_msgSend(v11, "setTitleStyleConfiguration:", v7);
    -[PREditorRootViewController lookPropertiesDidChange](self->_rootViewController, "lookPropertiesDidChange");

  }
}

- (void)setCoveredByHostModalPresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_coveredByHostModalPresentation != a3)
  {
    v3 = a3;
    -[PREditor coveredByHostModalPresentationDisableLookSwitchingAssertion](self, "coveredByHostModalPresentationDisableLookSwitchingAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[PREditor setCoveredByHostModalPresentationDisableLookSwitchingAssertion:](self, "setCoveredByHostModalPresentationDisableLookSwitchingAssertion:", 0);
    self->_coveredByHostModalPresentation = v3;
    if (v3)
    {
      -[PREditor disableSwitchingLooksForReason:](self, "disableSwitchingLooksForReason:", CFSTR("CoveredByHostModalPresentation"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PREditor setCoveredByHostModalPresentationDisableLookSwitchingAssertion:](self, "setCoveredByHostModalPresentationDisableLookSwitchingAssertion:", v6);

    }
  }
}

- (void)_acquireModalPresentationAssertionForViewController:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *modalPresentationAssertionsByViewController;
  void *v7;
  NSMapTable *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!self->_modalPresentationAssertionsByViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    modalPresentationAssertionsByViewController = self->_modalPresentationAssertionsByViewController;
    self->_modalPresentationAssertionsByViewController = v5;

    v4 = v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ViewControllerPresentation: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_modalPresentationAssertionsByViewController;
  -[PREditor _acquireModalPresentationAssertionForReason:](self, "_acquireModalPresentationAssertionForReason:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v9, v10);

}

- (id)_acquireModalPresentationAssertionForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *modalPresentationAssertions;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_modalPresentationAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    modalPresentationAssertions = self->_modalPresentationAssertions;
    self->_modalPresentationAssertions = v5;

  }
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__PREditor__acquireModalPresentationAssertionForReason___block_invoke;
  v15[3] = &unk_1E21846D8;
  v10 = v4;
  v16 = v10;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", v9, v10, v15);

  PRLogEditing();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_18B634000, v12, OS_LOG_TYPE_DEFAULT, "Acquiring modal presentation assertion for reason %{public}@, assertion %p", buf, 0x16u);
  }

  -[PREditor modalPresentationAssertions](self, "modalPresentationAssertions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

  -[PREditor _updatePresentingModalViewController](self, "_updatePresentingModalViewController");
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v11;
}

void __56__PREditor__acquireModalPresentationAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PRLogEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = v3;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated modal presentation assertion for reason %{public}@: %p", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "modalPresentationAssertions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v3);

    objc_msgSend(v7, "_updatePresentingModalViewController");
  }

}

- (void)_updatePresentingModalViewController
{
  void *v3;
  _BOOL8 v4;

  -[PREditor modalPresentationAssertions](self, "modalPresentationAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[PREditor setPresentingModalViewController:](self, "setPresentingModalViewController:", v4);
}

- (void)setPresentingModalViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  BOOL v12;

  if (self->_presentingModalViewController != a3)
  {
    v3 = a3;
    -[PREditor presentingModalViewControllerDisableLookSwitchingAssertion](self, "presentingModalViewControllerDisableLookSwitchingAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[PREditor setPresentingModalViewControllerDisableLookSwitchingAssertion:](self, "setPresentingModalViewControllerDisableLookSwitchingAssertion:", 0);
    self->_presentingModalViewController = v3;
    -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__PREditor_setPresentingModalViewController___block_invoke;
    v11[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
    v12 = v3;
    objc_msgSend(v6, "updateClientSettingsWithBlock:", v11);

    -[PREditor rootViewController](self, "rootViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPresentingModalViewController:", v3);
    if (v3)
    {
      -[PREditor disableSwitchingLooksForReason:](self, "disableSwitchingLooksForReason:", CFSTR("PresentingModalViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditor setPresentingModalViewControllerDisableLookSwitchingAssertion:](self, "setPresentingModalViewControllerDisableLookSwitchingAssertion:", v7);

    }
    else if (-[PREditor isLifecycleTiedToInitiallyPresentedViewController](self, "isLifecycleTiedToInitiallyPresentedViewController"))
    {
      if (-[PREditor isDismissingPresentedViewControllerFromTitledViewController](self, "isDismissingPresentedViewControllerFromTitledViewController"))
      {
        -[PFServerPosterPath serverIdentity](self->_sourceContents, "serverIdentity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(objc_msgSend(v8, "type") - 1) >= 2)
          v9 = objc_msgSend(v8, "isIncomingConfiguration") ^ 1;
        else
          v9 = 0;

      }
      else
      {
        v9 = 1;
      }
      -[PREditor requestDismissalWithAction:](self, "requestDismissalWithAction:", v9);
    }

  }
}

uint64_t __45__PREditor_setPresentingModalViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setContentsCoveredByModalPresentation:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setTitleString:(id)a3
{
  NSString *v4;
  NSString *titleString;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    titleString = self->_titleString;
    self->_titleString = v4;

    -[PREditor rootViewController](self, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateForChangedTitleString");

  }
}

- (void)setOverrideDate:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PREditor dateProvider](self, "dateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToDate:", v8);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "setOverrideDate:", v8);
    -[PREditor rootViewController](self, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateForChangedOverrideDate");

  }
}

- (void)setHorizontalTitleBoundingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  id v10;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_horizontalTitleBoundingRect))
  {
    self->_horizontalTitleBoundingRect.origin.x = x;
    self->_horizontalTitleBoundingRect.origin.y = y;
    self->_horizontalTitleBoundingRect.size.width = width;
    self->_horizontalTitleBoundingRect.size.height = height;
    +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 2, x, y, width, height);
    -[PREditor posterRole](self, "posterRole");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));

    if (v9)
    {
      v11.origin.x = x;
      v11.origin.y = y;
      v11.size.width = width;
      v11.size.height = height;
      v12 = CGRectInset(v11, -8.0, -8.0);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 3, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 0, x, y, width, height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 0, 1, x, y, width, height);
    }
    -[PREditor rootViewController](self, "rootViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateReticleViewFrames");

  }
}

- (void)setVerticalTitleBoundingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  id v10;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_verticalTitleBoundingRect))
  {
    self->_verticalTitleBoundingRect.origin.x = x;
    self->_verticalTitleBoundingRect.origin.y = y;
    self->_verticalTitleBoundingRect.size.width = width;
    self->_verticalTitleBoundingRect.size.height = height;
    +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 2, x, y, width, height);
    -[PREditor posterRole](self, "posterRole");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));

    if (v9)
    {
      v11.origin.x = x;
      v11.origin.y = y;
      v11.size.width = width;
      v11.size.height = height;
      v12 = CGRectInset(v11, -12.0, -20.0);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 3, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 0, x, y, width, height);
      +[PREditorElementLayoutController registerBoundingRect:forTitleLayout:variant:](PREditorElementLayoutController, "registerBoundingRect:forTitleLayout:variant:", 1, 1, x, y, width, height);
    }
    -[PREditor rootViewController](self, "rootViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateReticleViewFrames");

  }
}

- (BOOL)displaysHeaderElements
{
  return -[PREditor variant](self, "variant") == 0;
}

- (BOOL)displaysSubtitleElement
{
  void *v2;
  char v3;

  -[PREditor posterRole](self, "posterRole");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("PRPosterRoleIncomingCall")) ^ 1;

  return v3;
}

- (BOOL)areComplicationsAllowed
{
  if (-[PREditor variant](self, "variant"))
    return 0;
  else
    return !-[PREditor areComplicationsDisallowed](self, "areComplicationsDisallowed");
}

- (unint64_t)timeViewControllerDisplayedElements
{
  if (-[PREditor areComplicationsAllowed](self, "areComplicationsAllowed"))
    return 33;
  if (-[PREditor displaysSubtitleElement](self, "displaysSubtitleElement"))
    return 35;
  return 33;
}

- (BOOL)displaysRootViewController
{
  return -[PREditor variant](self, "variant") != 2
      || PREditingContextIsSavedConfiguration(-[PREditor editingContext](self, "editingContext"));
}

- (id)extensionBundle
{
  void *v2;
  void *v3;

  -[PREditor delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)extensionBundleURL
{
  void *v2;
  void *v3;

  -[PREditor extensionBundle](self, "extensionBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)delegateSafeForCallbackType:(int64_t)a3
{
  void *v5;
  int64_t v6;

  -[PREditor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PREditor status](self, "status");
  if (a3 == 3)
  {
    if (v6 != 2)
    {

      v5 = 0;
    }
    if (!-[PREditor displaysRootViewController](self, "displaysRootViewController"))
      goto LABEL_4;
  }
  else if (a3 == 2 && v6 != 2)
  {
LABEL_4:

    v5 = 0;
  }
  return v5;
}

- (void)handleNotificationForwardAction:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PRLogEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification from host: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v3, 0);

}

- (NSString)debugDescription
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PREditor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __28__PREditor_debugDescription__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __28__PREditor_debugDescription__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  UIWindow *v14;
  UIWindow *window;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t v22[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_window)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already have a scene"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PREditor scene:willConnectToSession:options:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v12 = v11;
    PRLogEditing();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_18B634000, v13, OS_LOG_TYPE_DEFAULT, "Scene did connect", v22, 2u);
    }

    -[PREditor setStatus:](self, "setStatus:", 1);
    objc_storeStrong((id *)&self->_scene, a3);
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "_registerSceneComponent:forKey:", self, CFSTR("PREditor"));
    v14 = (UIWindow *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v9);
    window = self->_window;
    self->_window = v14;

    -[UIWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:", 1);
    -[UIWindow layer](self->_window, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsHitTesting:", 1);

    objc_msgSend(v9, "_FBSScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PREditor setUsesEditingLayout:](self, "setUsesEditingLayout:", objc_msgSend(v18, "pr_usesEditingLayout"));
    -[PREditor setAcceptButtonType:](self, "setAcceptButtonType:", objc_msgSend(v18, "pr_editingAcceptButtonType"));
    -[PREditor setComplicationsRowConfigured:](self, "setComplicationsRowConfigured:", objc_msgSend(v18, "pui_isComplicationRowConfigured"));
    -[PREditor setComplicationSidebarConfigured:](self, "setComplicationSidebarConfigured:", objc_msgSend(v18, "pui_isComplicationSidebarConfigured"));
    if (-[PREditor displaysRootViewController](self, "displaysRootViewController"))
    {
      -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = objc_msgSend(v19, "looksShareBaseAppearanceForEditor:", self);
      else
        v20 = 0;
      -[PREditor setViewsSharedBetweenLooks:](self, "setViewsSharedBetweenLooks:", v20);
      -[PREditor _rebuildRootViewController](self, "_rebuildRootViewController");

    }
    -[UIWindow setHidden:](self->_window, "setHidden:", 0);

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  PRMutablePosterConfiguration *targetConfig;
  PFServerPosterPath *sourceContents;
  UIWindow *window;
  UIWindowScene *scene;
  PREditingDelegate *delegate;
  uint8_t v12[16];
  uint8_t buf[16];

  if (!self->_disconnected)
  {
    self->_disconnected = 1;
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Scene is disconnecting", buf, 2u);
    }

    -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorDidInvalidate:", self);
    PRLogEditing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "Scene did disconnect", v12, 2u);
    }

  }
  -[PRPosterConfiguration _invalidate](self->_targetConfig, "_invalidate", a3);
  targetConfig = self->_targetConfig;
  self->_targetConfig = 0;

  sourceContents = self->_sourceContents;
  self->_sourceContents = 0;

  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  -[PREditor _discardRootViewController](self, "_discardRootViewController");
  window = self->_window;
  self->_window = 0;

  scene = self->_scene;
  self->_scene = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  -[PREditor setStatus:](self, "setStatus:", 0);
}

- (PREditor)initWithScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  PREditor *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  PREditor *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this should not be called"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("PREditor.m");
    v19 = 1024;
    v20 = 2361;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (PREditor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (UIScene)_scene
{
  return (UIScene *)self->_scene;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  char v48;
  PFServerPosterPath *v49;
  PFServerPosterPath *sourceContents;
  void *v51;
  PRMutablePosterConfiguration *v52;
  PRMutablePosterConfiguration *targetConfig;
  PFServerPosterPath *v54;
  void *v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  PRMutablePosterConfiguration *v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  UIWindowScene *scene;
  uint64_t v75;
  UIWindowScene *v76;
  UIWindowScene *v77;
  UIWindowScene *v78;
  void *v79;
  void *v80;
  PRPosterEnvironmentImpl *v81;
  PRMutablePosterConfiguration *v82;
  void *v83;
  PRPosterEditingEnvironment *v84;
  PRPosterEditingEnvironment *environment;
  uint64_t v86;
  int v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  PRPosterEditingEnvironment *v127;
  PRPosterEditingEnvironment *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  NSObject *v134;
  double v135;
  double v136;
  uint64_t v137;
  double v138;
  double v139;
  unsigned int v140;
  UIWindow *v141;
  void *v142;
  void *v143;
  _BOOL4 v144;
  id v145;
  void *v146;
  uint64_t v147;
  unsigned int v148;
  unsigned int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  uint8_t buf[8];
  id v157;
  id v158[2];
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;

  v12 = a4;
  v13 = (uint64_t)a5;
  v14 = (unint64_t)a6;
  v15 = a7;
  v144 = v14 == 0;
  v16 = (void *)objc_opt_new();
  if (PUIDynamicRotationIsActive()
    && (objc_msgSend(v15, "animationSettings"), v17 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v17,
                                                v17))
  {
    v18 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(v15, "animationSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duration");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "settingsWithDuration:timingFunction:", v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "animationSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "setAnimationSettings:", v23);

  objc_msgSend(v15, "actions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActions:", v25);

  objc_msgSend(v12, "settings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(v13 | v14))
  {
    objc_msgSend(MEMORY[0x1E0D23210], "diffFromSettings:toSettings:", 0, v26);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  -[PREditor rootViewController](self, "rootViewController");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "pr_usesEditingLayout");
  v28 = objc_msgSend(v26, "pui_isComplicationRowConfigured");
  v29 = objc_msgSend(v26, "pui_isComplicationSidebarConfigured");
  v147 = objc_msgSend(v26, "pr_focusedComplicationElement");
  objc_msgSend(v26, "pr_titleString");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pr_overrideDate");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pr_horizontalTitleBoundingRect");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v26, "pr_verticalTitleBoundingRect");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = objc_msgSend(v26, "pr_focusedQuickActionElementPosition");
  v152 = v16;
  v153 = (void *)v14;
  v146 = v12;
  v142 = (void *)v13;
  v154 = v15;
  v148 = v28;
  v149 = v27;
  if (v13)
  {
    v137 = v46;
    objc_msgSend(v26, "pui_posterContents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = BSEqualObjects();

    v140 = v29;
    if ((v48 & 1) != 0)
      goto LABEL_22;
    objc_msgSend(v26, "pui_posterContents");
    v49 = (PFServerPosterPath *)objc_claimAutoreleasedReturnValue();
    sourceContents = self->_sourceContents;
    self->_sourceContents = v49;

    -[PFServerPosterPath role](self->_sourceContents, "role");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRMutablePosterConfiguration mutableConfigurationWithRole:](PRMutablePosterConfiguration, "mutableConfigurationWithRole:", v51);
    v52 = (PRMutablePosterConfiguration *)objc_claimAutoreleasedReturnValue();
    targetConfig = self->_targetConfig;
    self->_targetConfig = v52;

    v54 = self->_sourceContents;
    v158[0] = 0;
    -[PFServerPosterPath loadUserInfoWithError:](v54, "loadUserInfoWithError:", v158);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v158[0];
    if (v56)
    {
      v57 = v13;
      PRLogEditing();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[PREditor _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:].cold.2((uint64_t)v56, v58, v59, v60, v61, v62, v63, v64);
    }
    else
    {
      if (!objc_msgSend(v55, "count"))
      {
LABEL_21:

LABEL_22:
        scene = self->_scene;
        v75 = objc_opt_class();
        v76 = scene;
        if (v75)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v77 = v76;
          else
            v77 = 0;
        }
        else
        {
          v77 = 0;
        }
        v78 = v77;

        -[UIWindowScene traitCollection](v78, "traitCollection");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = (void *)objc_msgSend(v26, "mutableCopy");
        objc_msgSend(v80, "pui_setDeviceOrientation:", -[UIWindow interfaceOrientation](self->_window, "interfaceOrientation"));
        v81 = [PRPosterEnvironmentImpl alloc];
        v82 = self->_targetConfig;
        -[PREditor extensionBundleURL](self, "extensionBundleURL");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:](v81, "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", v80, v79, v82, v83);
        environment = self->_environment;
        self->_environment = v84;

        objc_msgSend(v152, "setSettingsDiff:", v13);
        -[PREditor setCoveredByHostModalPresentation:](self, "setCoveredByHostModalPresentation:", objc_msgSend(v26, "pr_isCoveredByModalPresentation"));
        -[PREditor setInlineComplicationConfigured:](self, "setInlineComplicationConfigured:", objc_msgSend(v26, "pui_isInlineComplicationConfigured"));
        -[PREditor setAlternateDateEnabled:](self, "setAlternateDateEnabled:", objc_msgSend(v26, "pr_isAlternateDateEnabled"));
        v86 = objc_msgSend(v26, "pr_editingVariant");
        v138 = v41;
        v139 = v39;
        v135 = v45;
        v136 = v43;
        if (v86 == -[PREditor variant](self, "variant"))
        {
          v87 = 0;
        }
        else
        {
          -[PREditor setVariant:](self, "setVariant:", v86);
          v87 = v144;
        }
        v88 = v37;
        v89 = v35;
        v90 = v33;
        v91 = v31;
        v92 = objc_msgSend(v26, "pr_editingContext");
        if (v92 != -[PREditor editingContext](self, "editingContext"))
          -[PREditor setEditingContext:](self, "setEditingContext:", v92);
        objc_msgSend(v26, "pr_leadingTopButtonFrame");
        v94 = v93;
        v96 = v95;
        v98 = v97;
        v100 = v99;
        -[PREditor leadingTopButtonFrame](self, "leadingTopButtonFrame");
        v161.origin.x = v101;
        v161.origin.y = v102;
        v161.size.width = v103;
        v161.size.height = v104;
        v159.origin.x = v94;
        v159.origin.y = v96;
        v159.size.width = v98;
        v159.size.height = v100;
        if (!CGRectEqualToRect(v159, v161))
          -[PREditor setLeadingTopButtonFrame:](self, "setLeadingTopButtonFrame:", v94, v96, v98, v100);
        objc_msgSend(v26, "pr_trailingTopButtonFrame");
        v106 = v105;
        v108 = v107;
        v110 = v109;
        v112 = v111;
        -[PREditor trailingTopButtonFrame](self, "trailingTopButtonFrame");
        v162.origin.x = v113;
        v162.origin.y = v114;
        v162.size.width = v115;
        v162.size.height = v116;
        v160.origin.x = v106;
        v160.origin.y = v108;
        v160.size.width = v110;
        v160.size.height = v112;
        if (!CGRectEqualToRect(v160, v162))
          -[PREditor setTrailingTopButtonFrame:](self, "setTrailingTopButtonFrame:", v106, v108, v110, v112);
        v117 = objc_msgSend(v26, "pr_isDepthEffectDisallowed");
        if ((_DWORD)v117 != -[PREditor isDepthEffectDisallowed](self, "isDepthEffectDisallowed"))
        {
          -[PREditor setDepthEffectDisallowed:](self, "setDepthEffectDisallowed:", v117);
          objc_msgSend(v143, "setDepthEffectDisabled:", -[PREditor isDepthEffectEffectivelyDisabled](self, "isDepthEffectEffectivelyDisabled"));
          -[PREditor updateRootViewControllerMenus](self, "updateRootViewControllerMenus");
        }
        v118 = objc_msgSend(v26, "pr_areComplicationsDisallowed");
        if ((_DWORD)v118 != -[PREditor areComplicationsDisallowed](self, "areComplicationsDisallowed"))
        {
          -[PREditor setComplicationsDisallowed:](self, "setComplicationsDisallowed:", v118);
          v87 = 1;
        }
        -[PRPosterEditingEnvironment role](self->_environment, "role");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditor posterRole](self, "posterRole");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend(v120, "isEqual:", v119);

        if ((v121 & 1) != 0)
        {
          if (!v87)
            goto LABEL_45;
        }
        else
        {
          -[PREditor setPosterRole:](self, "setPosterRole:", v119);
        }
        -[PREditor _rebuildRootViewController](self, "_rebuildRootViewController");
LABEL_45:
        v122 = objc_msgSend(v26, "pr_areControlsHidden");
        -[PREditor setTitleString:](self, "setTitleString:", v151);
        -[PREditor setOverrideDate:](self, "setOverrideDate:", v150);
        -[PREditor setHorizontalTitleBoundingRect:](self, "setHorizontalTitleBoundingRect:", v91, v90, v89, v88);
        -[PREditor setVerticalTitleBoundingRect:](self, "setVerticalTitleBoundingRect:", v139, v138, v136, v135);
        -[PREditor setUsesEditingLayout:](self, "setUsesEditingLayout:", v149);
        -[PREditor setControlsHidden:](self, "setControlsHidden:", v122);
        -[PREditor setFocusedComplicationElement:](self, "setFocusedComplicationElement:", v147);
        -[PREditor setComplicationsRowConfigured:](self, "setComplicationsRowConfigured:", v148);
        -[PREditor setComplicationSidebarConfigured:](self, "setComplicationSidebarConfigured:", v140);
        -[PREditor setFocusedQuickActionPosition:](self, "setFocusedQuickActionPosition:", v137);

        v14 = (unint64_t)v153;
        goto LABEL_46;
      }
      v57 = v13;
      v65 = self->_targetConfig;
      v157 = 0;
      -[PRMutablePosterConfiguration storeUserInfo:error:](v65, "storeUserInfo:error:", v55, &v157);
      v58 = v157;
      PRLogEditing();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v66;
      if (v58)
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          -[PREditor _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:].cold.1((uint64_t)v58, v67, v68, v69, v70, v71, v72, v73);
      }
      else if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B634000, v67, OS_LOG_TYPE_DEFAULT, "Successfully migrated source user info to target user info.", buf, 2u);
      }

    }
    v13 = v57;
    goto LABEL_21;
  }
LABEL_46:
  if (v14)
    v123 = 2;
  else
    v123 = 1;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 1);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = self->_environment;
  v141 = self->_window;
  v145 = v126;
  v128 = v127;
  v129 = v143;
  v155 = v129;
  v130 = v152;
  v131 = v125;
  v132 = v124;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
  if (!v14)
    objc_msgSend(v146, "updateClientSettingsWithBlock:", &__block_literal_global_214);
  if (objc_msgSend(v26, "pui_isInvalidated"))
  {
    v133 = v129;
    PRLogEditing();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B634000, v134, OS_LOG_TYPE_DEFAULT, "faking sceneDidDisconnect for pui_isInvalidated", buf, 2u);
    }

    -[PREditor sceneDidDisconnect:](self, "sceneDidDisconnect:", self->_scene);
    v129 = v133;
  }

}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  PRPosterConfiguredProperties *v20;
  void *v21;
  char isKindOfClass;
  NSObject *v23;
  PRPosterColorVariationsConfiguration *v24;
  void *v25;
  PRPosterColorVariationsConfiguration *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  uint8_t v50;
  _BYTE v51[7];
  _QWORD v52[5];
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[16];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 120))
  {
    if (objc_msgSend(*(id *)(a1 + 64), "isDisconnected"))
      objc_msgSend(*(id *)(a1 + 64), "reconnect");
    if (*(_BYTE *)(a1 + 121) || *(_BYTE *)(a1 + 122) || *(_BYTE *)(a1 + 123))
    {
      objc_msgSend(*(id *)(a1 + 32), "_refetchLooksAndBuildUI");
    }
    else if (*(_BYTE *)(a1 + 124))
    {
      objc_msgSend(*(id *)(a1 + 32), "leadingTopButtonFrame");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      objc_msgSend(*(id *)(a1 + 32), "trailingTopButtonFrame");
      objc_msgSend(*(id *)(a1 + 64), "updateTopButtonsLayoutWithLeadingTopButtonFrame:trailingTopButtonFrame:", v35, v37, v39, v41, v42, v43, v44, v45);
    }
    v2 = objc_msgSend(*(id *)(a1 + 32), "areControlsHidden");
    objc_msgSend(*(id *)(a1 + 64), "setUsesEditingLayout:", *(unsigned __int8 *)(a1 + 125));
    objc_msgSend(*(id *)(a1 + 64), "setFocusedComplicationElement:", *(_QWORD *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 64), "setComplicationsRowConfigured:", *(unsigned __int8 *)(a1 + 126));
    objc_msgSend(*(id *)(a1 + 64), "setComplicationSidebarConfigured:", *(unsigned __int8 *)(a1 + 127));
    objc_msgSend(*(id *)(a1 + 64), "setControlsHidden:", v2);
    objc_msgSend(*(id *)(a1 + 64), "setFocusedQuickActionPosition:", *(_QWORD *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 64), "updateReticleVisibilityIfNeeded");
    objc_msgSend(*(id *)(a1 + 72), "settingsDiff");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      PRLogEditing();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Sending environment update to delegate", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 80), "editor:didUpdateEnvironment:withTransition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
    }
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(*(id *)(a1 + 72), "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (!v6)
    {
LABEL_46:

      return;
    }
    v7 = v6;
    v8 = *(_QWORD *)v56;
    v46 = *(_QWORD *)v56;
    v47 = v5;
LABEL_17:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_self();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "handleNotificationForwardAction:", v10);
        goto LABEL_44;
      }
      v11 = v10;
      if (objc_msgSend(v11, "userAcceptedChanges"))
      {
        if (*(_QWORD *)(a1 + 88))
        {
          objc_msgSend(*(id *)(a1 + 32), "configuredProperties");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "currentLook");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "effectiveTitleStyleConfigurationForLook:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          v49 = (id)v14;
          if (v12)
          {
            v15 = (void *)v14;
            objc_msgSend(v12, "titleStyleConfiguration");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v12, "titleStyleConfiguration");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v15, "isVisiblyEqualToTitleStyleConfiguration:", v17);

              if ((v18 & 1) == 0)
              {
                v19 = (id)objc_msgSend(v12, "mutableCopy");
                objc_msgSend(v19, "setTitleStyleConfiguration:", v15);
                v20 = (PRPosterConfiguredProperties *)objc_msgSend(v19, "copy");
                goto LABEL_39;
              }
LABEL_40:
              objc_msgSend(*(id *)(a1 + 56), "targetConfiguredProperties");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "_applyStylePropertiesFromConfiguredProperties:toConfiguredProperties:forLook:", v12, v28, v13);
              objc_msgSend(*(id *)(a1 + 32), "homeScreenConfigurationWithPosterProvidedColorConfigurations");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setHomeScreenConfiguration:", v29);
              PRLogEditing();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18B634000, v30, OS_LOG_TYPE_DEFAULT, "Sending finalize to delegate", buf, 2u);
              }

              v31 = *(_QWORD *)(a1 + 32);
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_209;
              v52[3] = &unk_1E2184440;
              v52[4] = v11;
              v32 = *(void **)(a1 + 48);
              v53 = *(id *)(a1 + 56);
              v54 = v28;
              v33 = v28;
              objc_msgSend(v32, "editor:finalizeWithCompletion:", v31, v52);
              objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);

              v8 = v46;
              v5 = v47;
              goto LABEL_43;
            }
            v19 = (id)objc_msgSend(v12, "mutableCopy");
            objc_msgSend(*(id *)(a1 + 32), "defaultTitleStyleConfigurationForLook:", v13);
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setTitleStyleConfiguration:", v27);
            v20 = (PRPosterConfiguredProperties *)objc_msgSend(v19, "copy");

            v12 = (void *)v27;
          }
          else
          {
            v19 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
            objc_msgSend(*(id *)(a1 + 32), "defaultTitleStyleConfigurationForLook:", v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v24 = [PRPosterColorVariationsConfiguration alloc];
              objc_msgSend(v19, "dictionaryRepresentation");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](v24, "initWithVariationStorage:version:", v25, objc_msgSend((id)objc_opt_class(), "version"));

            }
            else
            {
              v26 = 0;
            }
            v20 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:]([PRPosterConfiguredProperties alloc], "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v12, 0, 0, 0, 0, v26, 0, 0, 0);

          }
LABEL_39:

          v12 = v20;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x1E0DC1350], "pr_clearCachesForInvalidation");
        PRSLogPosterContents();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_cold_1(&v50, v51, v23);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "pr_clearCachesForInvalidation");
      }
      objc_msgSend(v11, "invalidate");
LABEL_43:
      objc_msgSend(*(id *)(a1 + 64), "disconnect");

LABEL_44:
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (!v7)
          goto LABEL_46;
        goto LABEL_17;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 2);
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 48), "editor:didInitializeWithEnvironment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_refetchLooksAndBuildUI");
  if (objc_msgSend(*(id *)(a1 + 32), "isLifecycleTiedToInitiallyPresentedViewController"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isPresentingModalViewController") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32), CFSTR("PREditor.m"), 2549, CFSTR("Need to present a view controller (including color picker) in -editor:didInitializeWithEnvironment:"));

    }
  }
}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_209(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_clearCachesForInvalidation");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "targetConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "sendResponseWithUpdatedConfiguration:updatedProperties:", v4, v3);

}

uint64_t __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_213(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setDidFinishInitialization:", 1);
}

- (id)homeScreenConfigurationWithPosterProvidedColorConfigurations
{
  void *v3;
  char v4;
  char v5;
  char v6;
  PRPosterHomeScreenConfiguration *v7;
  PREditorColorPickerConfiguration *v8;
  PREditorColorPickerConfiguration *v9;
  PRPosterSolidColorHomeScreenAppearance *v10;
  PREditorColorPickerConfiguration *v11;
  PREditorColorPickerConfiguration *v12;
  PRPosterGradientHomeScreenAppearance *v13;
  PRPosterHomeScreenConfiguration *v14;
  PRPosterLockPosterHomeScreenAppearance *v15;
  PRPosterHomePosterHomeScreenAppearance *v16;
  PRPosterHomeScreenCustomizationConfiguration *v17;

  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && ((v4 = objc_opt_respondsToSelector(), v5 = objc_opt_respondsToSelector(), v6 = v5, (v4 & 1) != 0) || (v5 & 1) != 0))
  {
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v3, "solidColorHomeScreenColorPickerConfigurationForEditor:", self);
      v8 = (PREditorColorPickerConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_alloc_init(PREditorColorPickerConfiguration);
    }
    v9 = v8;
    v10 = -[PRPosterSolidColorHomeScreenAppearance initWithColor:colorPickerConfiguration:]([PRPosterSolidColorHomeScreenAppearance alloc], "initWithColor:colorPickerConfiguration:", 0, v8);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "gradientHomeScreenColorPickerConfigurationForEditor:", self);
      v11 = (PREditorColorPickerConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = objc_alloc_init(PREditorColorPickerConfiguration);
    }
    v12 = v11;
    v13 = -[PRPosterGradientHomeScreenAppearance initWithColor:colorPickerConfiguration:]([PRPosterGradientHomeScreenAppearance alloc], "initWithColor:colorPickerConfiguration:", 0, v11);
    v14 = [PRPosterHomeScreenConfiguration alloc];
    v15 = -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:]([PRPosterLockPosterHomeScreenAppearance alloc], "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", 0, 1);
    v16 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    v17 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
    v7 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](v14, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", 0, v15, v10, v13, v16, v17);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)additionalFontConfigurationsForFontAndContentStylePickerViewController:(id)a3
{
  void *v4;
  void *v5;

  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "additionalTimeFontConfigurationsForEditor:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)fontAndContentStylePickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "editor:shouldAllowUserToSelectTimeFontConfiguration:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)fontAndContentStylePickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PREditorRootViewController view](self->_rootViewController, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PREditorRootViewController presentedViewController](self->_rootViewController, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PREditor_fontAndContentStylePickerViewController_didUpdateDesiredDetent___block_invoke;
  v8[3] = &unk_1E2184010;
  v8[4] = self;
  objc_msgSend(v7, "animateChanges:", v8);

}

void __75__PREditor_fontAndContentStylePickerViewController_didUpdateDesiredDetent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sheetPresentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateDetents");

}

- (void)fontAndContentStylePickerViewControllerDidFinish:(id)a3
{
  PREditingFontAndColorPickerViewController *fontAndColorPickerViewController;
  PRPosterMutableConfiguredProperties *v5;

  -[PREditor configuredProperties](self, "configuredProperties", a3);
  v5 = (PRPosterMutableConfiguredProperties *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:");
  }
  -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 0);
  fontAndColorPickerViewController = self->_fontAndColorPickerViewController;
  self->_fontAndColorPickerViewController = 0;

}

- (id)additionalFontConfigurationsForFontAndColorPickerViewController:(id)a3
{
  void *v4;
  void *v5;

  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "additionalTimeFontConfigurationsForEditor:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)fontAndColorPickerViewController:(id)a3 shouldShowFontConfiguration:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "editor:shouldAllowUserToSelectTimeFontConfiguration:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PREditorRootViewController view](self->_rootViewController, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PREditorRootViewController presentedViewController](self->_rootViewController, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PREditor_fontAndColorPickerViewController_didUpdateDesiredDetent___block_invoke;
  v8[3] = &unk_1E2184010;
  v8[4] = self;
  objc_msgSend(v7, "animateChanges:", v8);

}

void __68__PREditor_fontAndColorPickerViewController_didUpdateDesiredDetent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sheetPresentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateDetents");

}

- (void)fontAndColorPickerViewControllerDidFinish:(id)a3
{
  PRPosterColorVariationsConfiguration *v4;
  void *v5;
  PRPosterColorVariationsConfiguration *v6;
  PREditingFontAndColorPickerViewController *fontAndColorPickerViewController;
  PRPosterMutableConfiguredProperties *v8;

  -[PREditor configuredProperties](self, "configuredProperties", a3);
  v8 = (PRPosterMutableConfiguredProperties *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(PRPosterMutableConfiguredProperties);
    -[PREditor setConfiguredProperties:](self, "setConfiguredProperties:");
  }
  v4 = [PRPosterColorVariationsConfiguration alloc];
  -[PREditingColorVariationStore dictionaryRepresentation](self->_colorVariationStore, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterColorVariationsConfiguration initWithVariationStorage:version:](v4, "initWithVariationStorage:version:", v5, objc_msgSend((id)objc_opt_class(), "version"));

  -[PRPosterConfiguredProperties setColorVariationsConfiguration:](v8, "setColorVariationsConfiguration:", v6);
  -[PREditor setEditingFocusActive:](self, "setEditingFocusActive:", 0);
  fontAndColorPickerViewController = self->_fontAndColorPickerViewController;
  self->_fontAndColorPickerViewController = 0;

}

- (id)coordinatorForContentStyle:(id)a3 forAmbientStylePicker:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PREditor delegateSafeForCallbackType:](self, "delegateSafeForCallbackType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "coordinatorForContentStyle:forEditor:", v5, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  PREditorRemoteViewPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PREditorRemoteViewPresentationController initWithPresentedViewController:presentingViewController:]([PREditorRemoteViewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)ambientEditingTitledViewControllerWantsToClose:(id)a3
{
  -[PREditor setDismissingPresentedViewControllerFromTitledViewController:](self, "setDismissingPresentedViewControllerFromTitledViewController:", 1);
  -[PREditor dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  -[PREditor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v14, "appendObject:withName:", v4, CFSTR("delegate"));

  v6 = -[PREditor status](self, "status");
  if (v6 > 3)
    v7 = 0;
  else
    v7 = off_1E2184A40[v6];
  v8 = (id)objc_msgSend(v14, "appendObject:withName:", v7, CFSTR("status"));
  v9 = (id)objc_msgSend(v14, "appendObject:withName:", self->_scene, CFSTR("scene"));
  -[PREditor rootViewController](self, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v14, "appendObject:withName:", v10, CFSTR("rootViewController"));

  -[PREditor currentLook](self, "currentLook");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v14, "appendObject:withName:", v12, CFSTR("currentLook"));

}

- (PRPosterEditingEnvironment)environment
{
  return self->_environment;
}

- (PRPosterEditingPreferences)preferences
{
  return self->_preferences;
}

- (PREditingLook)currentLook
{
  return self->_currentLook;
}

- (double)looksScrollingDecelerationRate
{
  return self->_looksScrollingDecelerationRate;
}

- (BOOL)isDepthEffectDisallowed
{
  return self->_depthEffectDisallowed;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (BOOL)areViewsSharedBetweenLooks
{
  return self->_viewsSharedBetweenLooks;
}

- (void)setViewsSharedBetweenLooks:(BOOL)a3
{
  self->_viewsSharedBetweenLooks = a3;
}

- (PREditorRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (NSString)posterRole
{
  return self->_posterRole;
}

- (void)setPosterRole:(id)a3
{
  objc_storeStrong((id *)&self->_posterRole, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (PREditingLook)initialLook
{
  return self->_initialLook;
}

- (void)setInitialLook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PREditingDelegate)delegate
{
  return self->_delegate;
}

- (PROverridableDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (int64_t)editingContext
{
  return self->_editingContext;
}

- (void)setEditingContext:(int64_t)a3
{
  self->_editingContext = a3;
}

- (int64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (void)setAcceptButtonType:(int64_t)a3
{
  self->_acceptButtonType = a3;
}

- (CGRect)leadingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leadingTopButtonFrame.origin.x;
  y = self->_leadingTopButtonFrame.origin.y;
  width = self->_leadingTopButtonFrame.size.width;
  height = self->_leadingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLeadingTopButtonFrame:(CGRect)a3
{
  self->_leadingTopButtonFrame = a3;
}

- (CGRect)trailingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trailingTopButtonFrame.origin.x;
  y = self->_trailingTopButtonFrame.origin.y;
  width = self->_trailingTopButtonFrame.size.width;
  height = self->_trailingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTrailingTopButtonFrame:(CGRect)a3
{
  self->_trailingTopButtonFrame = a3;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_horizontalTitleBoundingRect.origin.x;
  y = self->_horizontalTitleBoundingRect.origin.y;
  width = self->_horizontalTitleBoundingRect.size.width;
  height = self->_horizontalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_verticalTitleBoundingRect.origin.x;
  y = self->_verticalTitleBoundingRect.origin.y;
  width = self->_verticalTitleBoundingRect.size.width;
  height = self->_verticalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setPerspectiveZoomDisallowed:(BOOL)a3
{
  self->_perspectiveZoomDisallowed = a3;
}

- (PRPosterMutableConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (void)setConfiguredProperties:(id)a3
{
  objc_storeStrong((id *)&self->_configuredProperties, a3);
}

- (BOOL)isInlineComplicationConfigured
{
  return self->_inlineComplicationConfigured;
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (BOOL)isCoveredByHostModalPresentation
{
  return self->_coveredByHostModalPresentation;
}

- (PRInvalidatable)coveredByHostModalPresentationDisableLookSwitchingAssertion
{
  return self->_coveredByHostModalPresentationDisableLookSwitchingAssertion;
}

- (void)setCoveredByHostModalPresentationDisableLookSwitchingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_coveredByHostModalPresentationDisableLookSwitchingAssertion, a3);
}

- (BOOL)isPresentingModalViewController
{
  return self->_presentingModalViewController;
}

- (PRInvalidatable)presentingModalViewControllerDisableLookSwitchingAssertion
{
  return self->_presentingModalViewControllerDisableLookSwitchingAssertion;
}

- (void)setPresentingModalViewControllerDisableLookSwitchingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_presentingModalViewControllerDisableLookSwitchingAssertion, a3);
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  self->_usesEditingLayout = a3;
}

- (void)setControlsHidden:(BOOL)a3
{
  self->_controlsHidden = a3;
}

- (BOOL)isComplicationsRowConfigured
{
  return self->_complicationsRowConfigured;
}

- (void)setComplicationsRowConfigured:(BOOL)a3
{
  self->_complicationsRowConfigured = a3;
}

- (BOOL)isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (void)setComplicationSidebarConfigured:(BOOL)a3
{
  self->_complicationSidebarConfigured = a3;
}

- (int64_t)focusedComplicationElement
{
  return self->_focusedComplicationElement;
}

- (void)setFocusedComplicationElement:(int64_t)a3
{
  self->_focusedComplicationElement = a3;
}

- (int64_t)focusedQuickActionPosition
{
  return self->_focusedQuickActionPosition;
}

- (void)setFocusedQuickActionPosition:(int64_t)a3
{
  self->_focusedQuickActionPosition = a3;
}

- (BOOL)areComplicationsDisallowed
{
  return self->_complicationsDisallowed;
}

- (void)setComplicationsDisallowed:(BOOL)a3
{
  self->_complicationsDisallowed = a3;
}

- (BOOL)hasUpdatedLooks
{
  return self->_hasUpdatedLooks;
}

- (void)setHasUpdatedLooks:(BOOL)a3
{
  self->_hasUpdatedLooks = a3;
}

- (BOOL)hasUpdatedLookProperties
{
  return self->_hasUpdatedLookProperties;
}

- (void)setHasUpdatedLookProperties:(BOOL)a3
{
  self->_hasUpdatedLookProperties = a3;
}

- (UIWindow)remoteViewControllerPresentationWindow
{
  return self->_remoteViewControllerPresentationWindow;
}

- (void)setRemoteViewControllerPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewControllerPresentationWindow, a3);
}

- (BOOL)isDismissingPresentedViewControllerFromTitledViewController
{
  return self->_dismissingPresentedViewControllerFromTitledViewController;
}

- (void)setDismissingPresentedViewControllerFromTitledViewController:(BOOL)a3
{
  self->_dismissingPresentedViewControllerFromTitledViewController = a3;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (void)setPopoverPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverPresentationController, a3);
}

- (PREditingFontAndContentStylePickerViewController)fontAndContentStylePickerViewController
{
  return self->_fontAndContentStylePickerViewController;
}

- (void)setFontAndContentStylePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fontAndContentStylePickerViewController, a3);
}

- (PREditingFontAndColorPickerViewController)fontAndColorPickerViewController
{
  return self->_fontAndColorPickerViewController;
}

- (void)setFontAndColorPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fontAndColorPickerViewController, a3);
}

- (NSHashTable)modalPresentationAssertions
{
  return self->_modalPresentationAssertions;
}

- (void)setModalPresentationAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_modalPresentationAssertions, a3);
}

- (NSMapTable)modalPresentationAssertionsByViewController
{
  return self->_modalPresentationAssertionsByViewController;
}

- (void)setModalPresentationAssertionsByViewController:(id)a3
{
  objc_storeStrong((id *)&self->_modalPresentationAssertionsByViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresentationAssertionsByViewController, 0);
  objc_storeStrong((id *)&self->_modalPresentationAssertions, 0);
  objc_storeStrong((id *)&self->_fontAndColorPickerViewController, 0);
  objc_storeStrong((id *)&self->_fontAndContentStylePickerViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerPresentationWindow, 0);
  objc_storeStrong((id *)&self->_presentingModalViewControllerDisableLookSwitchingAssertion, 0);
  objc_storeStrong((id *)&self->_coveredByHostModalPresentationDisableLookSwitchingAssertion, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_initialLook, 0);
  objc_storeStrong((id *)&self->_posterRole, 0);
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_currentLook, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_appearanceMenu, 0);
  objc_storeStrong((id *)&self->_togglingPerspectiveZoomAction, 0);
  objc_storeStrong((id *)&self->_depthEffectMenu, 0);
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
  objc_storeStrong((id *)&self->_defaultTitleStyleConfigurationPerLook, 0);
  objc_storeStrong((id *)&self->_lookSwitchingAssertions, 0);
  objc_storeStrong((id *)&self->_targetConfig, 0);
  objc_storeStrong((id *)&self->_sourceContents, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)presentViewController:animated:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)presentViewController:animated:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_refetchLooksForProperties
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)scene:willConnectToSession:options:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_performActionsForUIScene:(uint64_t)a3 withUpdatedFBSScene:(uint64_t)a4 settingsDiff:(uint64_t)a5 fromSettings:(uint64_t)a6 transitionContext:(uint64_t)a7 lifecycleActionType:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "Error storing source user info in target user info: %@", a5, a6, a7, a8, 2u);
}

- (void)_performActionsForUIScene:(uint64_t)a3 withUpdatedFBSScene:(uint64_t)a4 settingsDiff:(uint64_t)a5 fromSettings:(uint64_t)a6 transitionContext:(uint64_t)a7 lifecycleActionType:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "Error loading source user info: %@", a5, a6, a7, a8, 2u);
}

void __122__PREditor__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "PREditingDidDismissAction doesn't have a delegate - bail the save", buf, 2u);
}

@end
