@implementation SBKeyboardHomeAffordanceController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_51 != -1)
    dispatch_once(&sharedInstance_onceToken_51, block);
  return (id)sharedInstance___sharedInstance_25;
}

void __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = objc_alloc_init(*(Class *)(a1 + 32));
    v3 = (void *)sharedInstance___sharedInstance_25;
    sharedInstance___sharedInstance_25 = (uint64_t)v2;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[SBKeyboardHomeAffordanceController sharedInstance]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBKeyboardHomeAffordanceAssertion.m"), 62, CFSTR("Attempted to make a home affordance keyboard assertion on a device that shouldn't."));

    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke_cold_1(v6);

  }
}

- (SBKeyboardHomeAffordanceController)init
{
  SBKeyboardHomeAffordanceController *v2;
  SBKeyboardHomeAffordanceController *v3;
  uint64_t v4;
  NSHashTable *assertions;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBKeyboardHomeAffordanceController;
  v2 = -[SBKeyboardHomeAffordanceController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isKeyboardDocked = 1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    assertions = v3->_assertions;
    v3->_assertions = (NSHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__didChangeKeyboardDocked_, CFSTR("SBKeyboardDockedChangedNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBHomeGrabberRotationView removeFromSuperview](self->_homeGrabberView, "removeFromSuperview");
  v4.receiver = self;
  v4.super_class = (Class)SBKeyboardHomeAffordanceController;
  -[SBKeyboardHomeAffordanceController dealloc](&v4, sel_dealloc);
}

- (void)registerAssertion:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_assertions, "addObject:");
    -[SBKeyboardHomeAffordanceController _updateTopMostAssertion](self, "_updateTopMostAssertion");
  }
}

- (void)unregisterAssertion:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_assertions, "removeObject:");
    -[SBKeyboardHomeAffordanceController _updateTopMostAssertion](self, "_updateTopMostAssertion");
  }
}

- (void)_didChangeAdditionalEdgeMarginForAssertion:(id)a3
{
  SBKeyboardHomeAffordanceAssertion **p_topMostAssertion;
  id v5;
  id WeakRetained;
  id v7;

  p_topMostAssertion = &self->_topMostAssertion;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_topMostAssertion);

  if (WeakRetained == v5)
  {
    -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)_didChangeKeyboardDocked:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBKeyboardDockedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isKeyboardDocked = objc_msgSend(v5, "BOOLValue");

  -[SBKeyboardHomeAffordanceController _updateHomeAffordance](self, "_updateHomeAffordance");
}

- (void)_getHomeGrabberContainingView:(id *)a3 isAlwaysPortrait:(BOOL *)a4
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  Class v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  objc_msgSend(WeakRetained, "sourceWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    v11 = objc_opt_class();
    objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputUISceneController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hostingWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v11, v14);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      v15 = objc_msgSend(v10, "isMainDisplayWindowScene");
    else
      v15 = 1;
  }
  else
  {
    if (!v10)
    {
      v23 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v10, "medusaHostedKeyboardWindowController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isUsingMedusaHostedKeyboardWindow"))
    {
      objc_msgSend(v16, "medusaHostedKeyboardWindow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v10, "isMainDisplayWindowScene");
    }
    else
    {
      v19 = NSClassFromString(CFSTR("UIKeyboardArbiterManager"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class performSelector:](v19, "performSelector:", sel_sharedArbiterManager);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v20, "keyboardWindow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rootViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }

      v15 = 0;
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v23);
  if (a4)
    *a4 = v15;
LABEL_21:

}

- (void)_updateHomeAffordance
{
  id WeakRetained;
  id v4;
  void *v5;
  SBHomeGrabberRotationView *homeGrabberView;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBHomeGrabberRotationView *v13;
  SBHomeGrabberRotationView *v14;
  SBHomeGrabberRotationView *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  if (WeakRetained && self->_isKeyboardDocked)
  {
    v29 = 0;
    v28 = 0;
    -[SBKeyboardHomeAffordanceController _getHomeGrabberContainingView:isAlwaysPortrait:](self, "_getHomeGrabberContainingView:isAlwaysPortrait:", &v28, &v29);
    v4 = v28;
    v5 = v4;
    homeGrabberView = self->_homeGrabberView;
    if (homeGrabberView)
    {
      objc_msgSend(v4, "bounds");
      -[SBHomeGrabberRotationView setFrame:](homeGrabberView, "setFrame:");
    }
    else
    {
      v8 = objc_opt_class();
      objc_msgSend(WeakRetained, "sourceWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0 && !v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v11, "medusaHostedKeyboardWindowController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:", self);

      v13 = [SBHomeGrabberRotationView alloc];
      objc_msgSend(v5, "bounds");
      v14 = -[SBHomeGrabberRotationView initWithFrame:](v13, "initWithFrame:");
      v15 = self->_homeGrabberView;
      self->_homeGrabberView = v14;

      -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (__sb__runningInSpringBoard())
      {
        objc_msgSend(v16, "setSuppressesBounce:", SBFEffectiveDeviceClass() == 2);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSuppressesBounce:", objc_msgSend(v17, "userInterfaceIdiom") == 1);

      }
      -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);

      -[SBHomeGrabberRotationView setHidden:](self->_homeGrabberView, "setHidden:", 1);
      -[SBHomeGrabberRotationView setAlpha:](self->_homeGrabberView, "setAlpha:", 0.0);
      -[SBHomeGrabberRotationView setUserInteractionEnabled:](self->_homeGrabberView, "setUserInteractionEnabled:", 0);
      objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);

    }
    v19 = v29;
    self->_isHomeGrabberContainingViewAlwaysPortrait = v29;
    if (v19)
      v20 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
    else
      v20 = 1;
    -[SBHomeGrabberRotationView setOrientation:](self->_homeGrabberView, "setOrientation:", v20);
    objc_msgSend(v5, "addSubview:", self->_homeGrabberView);
    -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsLayout");

    LODWORD(v21) = -[SBHomeGrabberRotationView isHidden](self->_homeGrabberView, "isHidden");
    -[SBHomeGrabberRotationView setHidden:](self->_homeGrabberView, "setHidden:", 0);
    -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHomeAffordanceInteractionEnabled:", 1);

    if ((_DWORD)v21)
    {
      v23 = (void *)MEMORY[0x1E0D016B0];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "settingsWithDuration:timingFunction:", v24, 0.25);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAllowsAdditiveAnimations:", 1);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __59__SBKeyboardHomeAffordanceController__updateHomeAffordance__block_invoke;
      v27[3] = &unk_1E8E9DED8;
      v27[4] = self;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:options:actions:completion:", v26, 4, v27, 0);

    }
    goto LABEL_17;
  }
  -[SBHomeGrabberRotationView setHidden:](self->_homeGrabberView, "setHidden:", 1);
  -[SBHomeGrabberRotationView setAlpha:](self->_homeGrabberView, "setAlpha:", 0.0);
  -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHomeAffordanceInteractionEnabled:", 0);

LABEL_18:
}

uint64_t __59__SBKeyboardHomeAffordanceController__updateHomeAffordance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 1.0);
}

- (void)_updateTopMostAssertion
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_assertions;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v6)
          goto LABEL_8;
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "sourceWindow", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "windowLevel");
        v12 = v11;
        objc_msgSend(v6, "sourceWindow");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "windowLevel");
        v15 = v14;

        if (v12 >= v15)
        {
LABEL_8:
          v16 = v9;

          v6 = v16;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_storeWeak((id *)&self->_topMostAssertion, v6);
  -[SBKeyboardHomeAffordanceController _updateHomeAffordance](self, "_updateHomeAffordance");

}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  SBHomeGrabberRotationView *homeGrabberView;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView
    && self->_isHomeGrabberContainingViewAlwaysPortrait
    && -[SBHomeGrabberRotationView orientation](homeGrabberView, "orientation") != a3)
  {
    +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", -[SBHomeGrabberRotationView orientation](self->_homeGrabberView, "orientation"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGrabberRotationView setOrientation:animated:rotationSettings:](self->_homeGrabberView, "setOrientation:animated:rotationSettings:", a3, 1, v8);
    SBLogHomeAffordance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[SBHomeGrabberRotationView grabberView](self->_homeGrabberView, "grabberView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "grabber=%p rotating keyboard affordance to %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_topMostAssertion);
  objc_msgSend(WeakRetained, "additionalEdgeMargin");
  v5 = v4;

  return v5;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topMostAssertion);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

void __52__SBKeyboardHomeAffordanceController_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Attempted to make a home affordance keyboard assertion on a device that shouldn't.", v1, 2u);
}

@end
